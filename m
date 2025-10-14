Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21966BD7F7D
	for <lists+xen-devel@lfdr.de>; Tue, 14 Oct 2025 09:38:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1142536.1476660 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8Zax-0006fn-KZ; Tue, 14 Oct 2025 07:37:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1142536.1476660; Tue, 14 Oct 2025 07:37:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8Zax-0006cq-Hm; Tue, 14 Oct 2025 07:37:19 +0000
Received: by outflank-mailman (input) for mailman id 1142536;
 Tue, 14 Oct 2025 07:37:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ME2R=4X=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1v8Zaw-0006ck-Rs
 for xen-devel@lists.xenproject.org; Tue, 14 Oct 2025 07:37:18 +0000
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazlp170120007.outbound.protection.outlook.com
 [2a01:111:f403:c101::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9b3e1473-a8d0-11f0-9d15-b5c5bf9af7f9;
 Tue, 14 Oct 2025 09:37:16 +0200 (CEST)
Received: from CH2PR03MB5223.namprd03.prod.outlook.com (2603:10b6:610:9c::21)
 by SA1PR03MB6482.namprd03.prod.outlook.com (2603:10b6:806:1c1::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.13; Tue, 14 Oct
 2025 07:37:13 +0000
Received: from CH2PR03MB5223.namprd03.prod.outlook.com
 ([fe80::64db:a9da:5b27:8665]) by CH2PR03MB5223.namprd03.prod.outlook.com
 ([fe80::64db:a9da:5b27:8665%4]) with mapi id 15.20.9228.005; Tue, 14 Oct 2025
 07:37:13 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 9b3e1473-a8d0-11f0-9d15-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jI8wp+AtInsUqvFqL4OjzDOGfId/evGKgPAkuLAGqz+3o04qSqFZ0nh9WScXRq5QYyZ2NnMbAvw7+EVYPOaUgOtt6qVipk/jpOUj0DbEQ/R7VlZ2D4i0UWk+Rr3JhQ4q0CvFFxMsyli05kzhYOEaA+gl2bDcGqx0+0Z3JwcXklEbrEWbYNEoss+J6H4bwHwdlFLhU1TwKmexQ19nlaLFzYB2Z1h1TLqhZNNszfNnlcsumpiQqA2Ic10iyaLv9ZT3HftMMZlc2UrN9awvaWyGSjwgFp6qn1vIHUFGsPOtcik1aOCqTM39R4clZouTWd/7MkiJCdbvP1Zo1avO1Ic/vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HQCtHzzmgtwKLjdWm+SaTOHdwOObZCpRVv65PCf6QTQ=;
 b=Xj4o6crxHART2kdysjkjU9DbY+mkDy7cZHDSjoTDmH/KU6qNt+T/iBEB2bdyYFEnhVacLkOSskvFjjvSzxQ9LuFY80xaelBdC5zoP8kEYMsUMCvfMKS5DkDJWRe/Fb2BrYbNEd22e2MEUykTP/TBZfcWg23YItqJ1G+X3XiGWp+j7e6gZrNEv1bp1kaSyx8ZFTq1X0wK9ODHcciNMr++kS2d0mpcUXmV575ZOV+TqIUKGZoEb9bD+qRrA8erKIQGsL9+dY7DryYnbJbKqU9HtEG0vMd1KVVWsYF7/TDGqRLjm9IKQhXCK46q82dhpvKwQYDZjcpMx1UKC+HikLO0RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HQCtHzzmgtwKLjdWm+SaTOHdwOObZCpRVv65PCf6QTQ=;
 b=N7E7StE0pc+2238va6xy1w00sjfX5NTKvzEnvJjB89N5fKxwmtQHmF0SIaExXFiDmSu2t0wwOj/gx4v4bVIL6d2fNqwgNK1UB7C3CtXqaHmvTSSggJ1bl4t9ETbunjN1moZ833I/69h229Wz+pwYvy0Bl0MsGySmqcncACQbbtU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 14 Oct 2025 09:37:09 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: xen-devel@lists.xenproject.org,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2] x86/apic: Avoid infinite loop in
 io_apic_level_ack_pending()
Message-ID: <aO39pb3L42ktBol_@Mac.lan>
References: <20251013211106.8720-1-jason.andryuk@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251013211106.8720-1-jason.andryuk@amd.com>
X-ClientProxiedBy: BN9P221CA0001.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:408:10a::16) To CH2PR03MB5223.namprd03.prod.outlook.com
 (2603:10b6:610:9c::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR03MB5223:EE_|SA1PR03MB6482:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c74fd47-102b-48cf-adc8-08de0af47dae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VW5aVis3Z29tREs0N0RWWjZkbkFwblViZk11d3Z1aVpINUxEdU83eVBQQVRB?=
 =?utf-8?B?OU5QZUNoZ2JoRi9Zb0U3TkZ5Y1RvQzMwWEl1VFB1M3U1T1VnZWpQbE5DbzZl?=
 =?utf-8?B?WFIyZ2FXRCt5VTlLeG0yVC91M2pNS2NpdlhmUjYzdHg1WERRNmU3czBjamJT?=
 =?utf-8?B?dG8xNk5lY010emozUWU5YU1iUmZrUWRwVm9uQzJqNTdBeW51RzJHNDc0eUkz?=
 =?utf-8?B?bnVDQlV0T0dMMVVkK1kvS3pZK25uTDhTRWtkZkxWY2N4b1ZMSTErUi9DOWJ2?=
 =?utf-8?B?QXN2TkJCbEMzdHRnVTcrYXB4amZEeHJ5amFXOGJBVy9TbVZOcFZncDhVSHZv?=
 =?utf-8?B?UGpHN0ZwYTdQY3dVR1I3V0Z4NkNmUkJsM2tjS0FnV3hLeEdvQjJvTEd3bWk5?=
 =?utf-8?B?a0tsdENyK0RKUEJCanZEZmwrN2JCWXZaUWZ1Skh1SE83dWRiS0JQSEkxcmVH?=
 =?utf-8?B?OGljYTNvRWlzTmx4bDRIZkNBRjBpaEVrcUI4K3R6YUE5Nk9ZRHpENkhuWFJM?=
 =?utf-8?B?VGVvWk9sRHhhNVVzb3Z4anFhV2tYVnBxRVFsbFI5N3ovYS90cTd2MlJUWmph?=
 =?utf-8?B?b0tzb3QrcUczVzV1ZmRoTmo1eUZPUG9PTmhpQ21FRlVKTlhEVGI1UStJSVVk?=
 =?utf-8?B?SHJWVUgxNUIrNkhOR0lQVlVyQjYyOWpGS0p2Qzdkc1N3YjY0b0hiRjBqV3cw?=
 =?utf-8?B?UHpmaU4yaUFMaXYvWTJmOHdlN0RKbnZBNHJ6MkNHUGJiMDZFakc3c0lGM3Uz?=
 =?utf-8?B?WnREekl2SnlLQ3pmcnBCMHNmME5uU0pxTVFlaExBbVNVY1lHRG4zeGFrNWx4?=
 =?utf-8?B?U2k1NDdmNXBid25haGN6SU1jcnQ5ZXhieGNONjJiWjVmc3RZMFI3a3RqV0Vn?=
 =?utf-8?B?QVRMbHdQMGx4S0ZxeDIvWjdLVU5UOTlBMFl6OUlDazdzY3VFeEFPeTJSOW1q?=
 =?utf-8?B?cDE2Ky9Oa2g5eHRrUHhyeVVsVG54NlI4TGFyWlc2MUZjTy9BRjBmZ0l3ay9S?=
 =?utf-8?B?dVk1L0xQWXVRVE9RNlo1RE1WcWtyS1RZNkpNa3V0endldm9wM1FKYmlKUDhq?=
 =?utf-8?B?WTZ0RndFSDUwMERsQ1kvWU40dHA3U2NaeEhFV0xkOUIrSGc5cm1lS0g2R1NZ?=
 =?utf-8?B?Y0N1Mi94UWFvUGM2Sis0MS9TVisydG5SSkdBaTJaZVlyRGZKSVp2dE5YQ3Q5?=
 =?utf-8?B?Tnh1YjhOWUxpNWZ3YVRDakpuWmlIMmozUjM0ZVdSNEhsN2ZxQTl4UEJQVllT?=
 =?utf-8?B?SlArNXJlTURyZ0NsdThKSjlvZnNLSnhIdnBIb04zVCt1Qm1RS3JXaklWTi95?=
 =?utf-8?B?WEx6QU9RVkw4OHRvSEdSN1VJSUdsQkpWZjM2VWljMmpGOEFTM0h0RTNqOFA1?=
 =?utf-8?B?OW92VkFxd0dCcWd3STdwNEhxUE15U2QrbDZzcnluR3hGRkVmNTBZSlg5Ykdu?=
 =?utf-8?B?aWFITVpKNXZJQm1lTC9RUjhoZXdNampPK2VZRVZuSmVpSzEzZC9nbWp6RGxS?=
 =?utf-8?B?RFcvUVZIRjkxU1dzQk1sRGpvUG1DOGIvYnl3MDhIZWNCUjZ5WFp6bWd1V2dN?=
 =?utf-8?B?Q2dBeWh2VFMxU1JmOUw4VmFTYVFzbm9CT3ZGUU4vU05ld01zTnlBamlGdThV?=
 =?utf-8?B?ellCZlJoVzhxK1NmQ0JlUmF4d1pFS0VpbVFuL1NGdHJmM2R1dDFLVDQ5VmMv?=
 =?utf-8?B?RUhKbHdaQUcyellMZFZUaHM1UDJ0NHJpTnoycWo0dFZLYWt5MTN5OEFEVjhZ?=
 =?utf-8?B?bW1GMnJEUjFNT2hVTER6NmZ5ZmxjWS9yUWZnVmdQSEd0UXNTckMrY0RaUFh1?=
 =?utf-8?B?a1VUaXZnMDRCelB5dVdCSG9zcUxjZWNZUHlBczdnWWRXbUt4TWhYWHdQUXJi?=
 =?utf-8?B?elR5cHdmZG5KdnFKb0xzdWZvZy9wM09CMzJ6ZXU5by8vdi8rRzhmeFdyaFlp?=
 =?utf-8?Q?IFUWlFcgRQZTHQfK+SrsmUXDXCmKCkdg?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR03MB5223.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VFNrWGNoTUlBTy9uR1E2WkpXUFJYVUUwSHZ0L0dHTGMyU3ZXeGFQcGU3Wlo5?=
 =?utf-8?B?bjE4WDBHb3JGSTFuZ0RhRUN0a2wwbXMydXZaWWFhUnhpd0ZReFZ4cnFEWEND?=
 =?utf-8?B?RlhsckJ2aG5id3BTS3cyVUR0M2IzYUIzaGRLQ0VUanFWdVN5dVlOeVZmRkdT?=
 =?utf-8?B?RmtDN3VNN3Z4TDVRbC93bDU4OWE3N1FIMWdObjA1amppc3c5OHpEU0NJWm9u?=
 =?utf-8?B?czVMMkNzUEtrYjFiUzNuSUxPdGwwY3JuTHNqb056cndqSDgzRUFCNktrQ2FV?=
 =?utf-8?B?QmJ4Qmx5OVh1NXN1L3pJVmNKQTU3ZW50SS83clp6TFhVQUtMb3dkOXlESHV1?=
 =?utf-8?B?Q1BaczJJUTlCRnkzZXRSb0ltdXpSV0VkcmQ4VXoxbDFmemZBNnVoMDZIY1oz?=
 =?utf-8?B?eXU2Nkp6TUZ5d1RMMWU3SG5ocDhNTVlWVVhudjdmMjkyZWZsR2ZsSTQ2cFYr?=
 =?utf-8?B?VnRTcG5YMW1oMmhXdVVtc0NUa0VneTY3aW5acjQycXQrM2N5bXJLd1psWnZm?=
 =?utf-8?B?UnNMVm1zQlFRMFkyQkVhS3RhQW9NUDgxK1JReUJENVRpb0xFZEt4bnprKzJw?=
 =?utf-8?B?cDdrTlFYbXNLRXBNR0lVcFoxd0ZCZnp5UElzdDNzWnhLTjgyNmM2elJxU1M0?=
 =?utf-8?B?NmtPYzAyQytFS0pyTzhMU25jZWYvaWxvQTJUYytzb2E0QzhqVTMrc3lpVTla?=
 =?utf-8?B?ZXBpcENPRklYZmZFc2xVOU9MK1hNV0t5eGc3YTVzOVdVVG5KcjZvTVBoQi9t?=
 =?utf-8?B?M1p1dzlhSjBDNmo1QitJNmNma0JwSWo5QldLQityNFhxcW5GdUZaL1RQc2Rl?=
 =?utf-8?B?cTY2OVNnZHhlZEhEVi9DMHBGcnUycFV1QTdsam16Znp4bENSd0VnTEdMOEIx?=
 =?utf-8?B?QkNDS2RkSUNnTGs4Z2hlYlpZa0cvR0lncXdYdlhiVlpuSXdRdGZiekltVldz?=
 =?utf-8?B?VXl3d2lJK1QzR1FYK2VyZ3BFOC8rT1BhNE4wNDhTa1VlcjJkTkNvakl0OGEy?=
 =?utf-8?B?bWo2S1JLdWF4SUhPZHRQMTQyMHFMU2tGT1VRWjdHcUNpcCs3ZUF1UHZRSTl6?=
 =?utf-8?B?Nm5JOFdFcnRGc2M2bE1yTmJwbG44eTM5K3E1VUI0NnAveEM3VzJ3OEt3R2FP?=
 =?utf-8?B?dk1SZktKeU03WGNjSEZaUUQ4UFcvMXphdzZnRGY4aHpsQWNJSTEwNzkrY0pT?=
 =?utf-8?B?bVdpV0FoYW1DYXJGRU9wb1NROWQ1d1dMd2FzVzhXQ0x1bGlWcXFIODY4aHFz?=
 =?utf-8?B?Z2VFRWZsTFZrV1VJZ2ZySEZucUNXUERtYW9kdXVKVnBjNklzREE1aXlaemht?=
 =?utf-8?B?MjkxK0cwYTg5aWNLQmFyWDVmang0U0RHTjJ2OXVaSzlZUEozT0xRRElwemtV?=
 =?utf-8?B?RWUxQlk0dEF3SmZ0dnV2cVZFNHo0Qjh5TVA4SlJnT0U0bjEwc1EwUFhyMmxW?=
 =?utf-8?B?MUFnaERqWSs5aXlkZUVZeStTSU1JVHhsQTB1UEJiWDBhRUpKV0I5cWUwTjVE?=
 =?utf-8?B?TU1DNVFUdUNLdUVTUXJDdVMrZzY0TTZ0cHQ1amRlUnpTR1NKUFJYYk12MmVI?=
 =?utf-8?B?N1Y2dTBHdzIzb29DTi9iU3B1SzJxMlh5UFpLSm9RN0tySk12NEEwRlo1Rlhq?=
 =?utf-8?B?SmZJUnRuUlcyOVZ5YjNOS2FzVFFJMmV1WHBvSEgwYVFoOWdQYTU2TTBVa2d1?=
 =?utf-8?B?bllOOUVJcThCSkFuSUZRc1k0Qmw2ZnRrS3ZYTGhRdW5JbEZYTktWci85NWdw?=
 =?utf-8?B?Wk5TM0RaSzZEa0swalFIWDljUE5sV1A2cmZBRHBlQnpYbVJkSW5yN1ptQlRM?=
 =?utf-8?B?bVJEb2t2ek55VytnaDdtWE9PQ2w0dGFMMytCUVBsWEtZS1hXUDZzajZ6cWNY?=
 =?utf-8?B?VUZiZWFpN0Uvbjk3Y3NUazM5QmlKK2p0TFVIb0hzK0lDWFdSa2trU0N1RDQ2?=
 =?utf-8?B?ZWpXNWdmMkM0Q1RoTlN6VEI3RjRCVlRpWnBBMFBQc2g4Vk13YkV1UVNYRGpt?=
 =?utf-8?B?ZDlNdlhtTWwzT2RmWW4vcFRMUHZrRk9QTXk1TDJxOXpoalRiOUN6YXpRSmRn?=
 =?utf-8?B?eVdyclJLd1pKSzk2RjEvSitoRTdYSEJYc1J5Sm1ad2h0Q2E1cXRRMGRnMDg3?=
 =?utf-8?Q?0RbxJQ3aQ101wHgLeDz/3QJel?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c74fd47-102b-48cf-adc8-08de0af47dae
X-MS-Exchange-CrossTenant-AuthSource: CH2PR03MB5223.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 07:37:13.2847
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FaLjRIjQ5LqAREhTcX3i/3KLbh6U9SEDOVPrspf1Tw4yAsLFmfl23duBmiUXnDf4QibBEJ/8UyXxIR9i/CbLnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6482

On Mon, Oct 13, 2025 at 05:11:06PM -0400, Jason Andryuk wrote:
> io_apic_level_ack_pending() will end up in an infinite loop if
> entry->pin == -1.  entry does not change, so it will keep reading -1.

Do you know how you end up with an entry with pin == -1 on the
irq_pin_list? Are there systems with gaps in the GSI space between
IO-APICs?  So far everything I saw had the IO-APIC in contiguous GSI
space.

> Convert to a proper for loop so that continue works.  Add a new helper,
> next_entry(), to handle advancing to the next irq_pin_list entry.
> 
> Fixes: f821102450a1 ("x86: IRQ Migration logic enhancement.")
> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
> ---
> v2:
> continue (not break) for pin == -1.
> 
> I added the next_entry() helper since putting the expression in the for
> loop is a little cluttered.  The helper can also be re-used for other
> instances within the file.
> ---
>  xen/arch/x86/io_apic.c | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/xen/arch/x86/io_apic.c b/xen/arch/x86/io_apic.c
> index c384f10c1b..7b58345c96 100644
> --- a/xen/arch/x86/io_apic.c
> +++ b/xen/arch/x86/io_apic.c
> @@ -1586,14 +1586,21 @@ static int __init cf_check setup_ioapic_ack(const char *s)
>  }
>  custom_param("ioapic_ack", setup_ioapic_ack);
>  
> +static struct irq_pin_list *next_entry(struct irq_pin_list *entry)

I think you can make the entry parameter const?

> +{
> +    if ( !entry->next )
> +        return NULL;
> +
> +    return irq_2_pin + entry->next;
> +}
> +
>  static bool io_apic_level_ack_pending(unsigned int irq)
>  {
>      struct irq_pin_list *entry;
>      unsigned long flags;
>  
>      spin_lock_irqsave(&ioapic_lock, flags);
> -    entry = &irq_2_pin[irq];
> -    for (;;) {
> +    for ( entry = &irq_2_pin[irq]; entry ; entry = next_entry(entry) ) {

I'm not sure where we stand regarding coding style here, but it looks
you either want to remove the space between parentheses (my
preference), or place the opening for braces on a newline.  I would
possibly do:

for (entry = &irq_2_pin[irq]; entry; entry = next_entry(entry)) {
...

As I think it fits better given the small change and the surrounding
coding style.

>          unsigned int reg;
>          int pin;

Below here you can remove the:

        if (!entry)
            break;

Chunk, as the for loop already checks for this condition.

Otherwise looks good, I think we should consider for 4.21 inclusion.

Thanks, Roger.

