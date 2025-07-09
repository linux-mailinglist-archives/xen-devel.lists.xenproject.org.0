Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C570AFEA65
	for <lists+xen-devel@lfdr.de>; Wed,  9 Jul 2025 15:39:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1038234.1410672 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZV0I-0003H5-Ky; Wed, 09 Jul 2025 13:38:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1038234.1410672; Wed, 09 Jul 2025 13:38:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZV0I-0003Fe-HF; Wed, 09 Jul 2025 13:38:30 +0000
Received: by outflank-mailman (input) for mailman id 1038234;
 Wed, 09 Jul 2025 13:38:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=42hY=ZW=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1uZV0G-0003FW-67
 for xen-devel@lists.xenproject.org; Wed, 09 Jul 2025 13:38:28 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20606.outbound.protection.outlook.com
 [2a01:111:f403:2416::606])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fd1bf52d-5cc9-11f0-a317-13f23c93f187;
 Wed, 09 Jul 2025 15:38:26 +0200 (CEST)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by MW4PR12MB7261.namprd12.prod.outlook.com (2603:10b6:303:229::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.23; Wed, 9 Jul
 2025 13:38:22 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%5]) with mapi id 15.20.8901.024; Wed, 9 Jul 2025
 13:38:22 +0000
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
X-Inumbo-ID: fd1bf52d-5cc9-11f0-a317-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bLgzjXV59IBp/biXzXHw7MUslKjnI/Rsa27R6T0fsjevS0NHYBS0HYs1tqkkp24sz80Vc3wtVu3zTbPrh1OiXHRMUzDDkJcrrOPBaQN2J+DfX7/4h7YUJ5g2nP5ZuUiLWByFaHtjUQv4P/N+JAiIDM7fDVc24gG6EXL22JeBJzl0UiwBx4V71IPeeycHIr7lyzxRYAhwWDpGfkiNm8eNJyZKURCn+FwbDh3VzJmNI56QV1j3Fbn8mkXvlyDlxao+zbJ4BNtm4KyRQDKl13aVhemkHOGSRSmUf41D1frCoOxH/3bni/xs9OT8nO5uGJDVG3gscQkIdxKRIYxhezA+FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iNALlO6TYZWmbVW5YfAldOeWQGhbVr1/onQW/vrKQFY=;
 b=s1rnKgJK78k1mMChMz9iNvacmV/Lg7mOOWSthgZ9Qjn2l/OUi4219hGQBs/J5+i7nE9G95CEQSEUORvM9Dq0YaH4kjnNDcYBLd05BgCvsOKZiiiv2qrjhvKlXl/y9XnaaVc6+RDXjzn21rxbhgPo2wRsh46+PZPEYHH9aAd0j37FoubDvwADfKLTSFvoU62Tf1TQiWJExF4P8KW14a1rCvQIwI0sm0AtXzFc5YrbaIMf8z/pfX4pjX765SIo0cycp5UpxX8/5HvYCMEIZ8u4iYpuFUtR4T+yte+5O21G27ndBo3IbnmUNmu3Ol0QMiW+JPytXFaSthmFqkys3MJa3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iNALlO6TYZWmbVW5YfAldOeWQGhbVr1/onQW/vrKQFY=;
 b=iNc32ugvVX3Ex34b5A0Oz5w6jsMrPszhRI6+EO38+RIgbndSRFbg3WR/uA/2AJ+tZh1KXguAOfK4bSgo+emmXknRIRZTH5W6bZEHxArumTVFs2hTrvNSNHl8h5FbY/O/Vb78uLsAfqNCNIXgRh1HdmuyAEV7V4BhY1EFx8zS3Ec=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <48d3c8cc-a85c-4dff-8e59-63a284f73922@amd.com>
Date: Wed, 9 Jul 2025 15:38:18 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] xen/arm: Track coverage gap due to architecture
 limitations
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Artem Mygaiev <artem_mygaiev@epam.com>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250709131257.1655509-1-ayan.kumar.halder@amd.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20250709131257.1655509-1-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0165.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::7) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|MW4PR12MB7261:EE_
X-MS-Office365-Filtering-Correlation-Id: e5559aa7-7389-44b5-8044-08ddbeeddf13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OWlkWXNuZ2wyYU9SVXNKWW95ejhaRXdKTzBmUTIrYitFNld2bjQxQVpXYkxN?=
 =?utf-8?B?a1ZHWUdQbjFwcFUycUNWdmUrZUhoeUlvdDlERENJdm96TTlhUk5ma2ljYStW?=
 =?utf-8?B?ZzAyeEU0YnFRQ3RaTnFhcUFzMnZEWUNrMDhGNW1aQWx2emVlNXY3bGdnWmxV?=
 =?utf-8?B?bkFWMVZGdkZmajUwNVlXS0FSK0hQb1pyMzRkdytwRUpsTTRGYUluWnNHb0VV?=
 =?utf-8?B?bU1MV2QxQVV3ZlEyeGd0cU90Y2FvMDJ3c1BEejVCWUJQVTRBL05HRjlaLzFO?=
 =?utf-8?B?QjUxM2gvOHptM2RLN2M5MWFsYjlWU2VWUVYwdS9kUlI5ZFJlV1RKNVo5c2Zx?=
 =?utf-8?B?cFJSQm8yU3VBN04rQkVSOGdMUkIyVFJ2YjlzbEM0Q0JnN0djRHFjdUdGTS9i?=
 =?utf-8?B?NzFwdi96UHU3SXFTcldVMWY5MWRuaUlsdktFck42Z2JubnZicUk2TVhHanZ2?=
 =?utf-8?B?VS8wWTZTZ0wyNEVOK3BVTnhHOWJ6Y3RCRlloNVJOdnROM1Bvb2lKM1BBRWxQ?=
 =?utf-8?B?alQ5eENvcllwT0ROa1Z6Mm1nb3RYVDczY0Y2SkdrQlVYai9YUXE1V290dW5u?=
 =?utf-8?B?SG1wWEpxVkFjMnBHQ0FHd2NqL3BwYXJITHZwRzBVMllFZFM4TUxPbjR5T0NO?=
 =?utf-8?B?cDdpdWxQYzdwcXhSUWQ1MkVFMjhaSGpteUtCcUFPeHZFNE84YkZxZ2NtcmJa?=
 =?utf-8?B?Ny9HWjNBT3pSVzNlVHpRSXd6ek9MS2FiKzFhRUhNZEFKbDFlbUswSThyNjQ4?=
 =?utf-8?B?VUhab0E2YVFXZHhlK3EzYkNrbWh6Y1pzSmRtSjc3NlQ1NG9mQXNzaGZsUEds?=
 =?utf-8?B?SFd4VXhQTWQraEhXamhKcVkxbTQ5azI3c0l2QVUrUFh1UlBub1hnYVQ0emoz?=
 =?utf-8?B?R1lQdmcyMktXSGtXTmRQSjgvNzRUeFZONTR4eTArNWhwWkxUR0oxb1VqL3pl?=
 =?utf-8?B?S1dETlJ1Ykk5cVE2eEZPTTFyYTlZSVZibUtnT3NTVS9VSEpOY1JVUzhxYlNB?=
 =?utf-8?B?eVZhOVRjbW1jQmYyQUYzY1phYjU0SXBOZndTRUo0aUNpeElHWG4vWXRrTFgw?=
 =?utf-8?B?SUhUZ1ExaUlGdFJuSTBIT2NhQ0VTZUVZTkd6ZjRHbUhuUDkvS0VTaEhQbHNR?=
 =?utf-8?B?a1JRWkM0QU0xY2RRWks3UGVFa2JaWXFQUk1BRzZ3eG9PU1VSMnVSWDdqcDZJ?=
 =?utf-8?B?czFOMVV2MWcwWDY3YlF1UHhxN0U2Y0xiZUlyS1FJSUNSV0pJNElHSW5VbkNl?=
 =?utf-8?B?ejBGOUdQZkRxZERCUjVhMVVVQXNkWWh6S1grY1JoOW9DSEZlSXRJZWMvVXpo?=
 =?utf-8?B?UkFmajkrWWpITXZsRnhzNFY3SFk2clp0eFA0WHN0c1pzTFV1Sjh4UlhPTEtL?=
 =?utf-8?B?ak1FT0F2cDVYaE1ycHJnQkoxM2diU1FMdzd5QUFVaEl0emgvR2FRazlZL1F2?=
 =?utf-8?B?clJ0Q0VhN3pqY1JmSTFJNHdJazM4WGFVZkZiT09GTXdKUTArNk1XU3VnRk1j?=
 =?utf-8?B?NnU1ZkpXKzVPOE1pcWlJZlIxaXNDWkk1QVB0T3BERGcrd3gxVkE1KzRyTG5n?=
 =?utf-8?B?ZFNUdE5NQzV5RGxXOWVMSGNyU29WRWRCWm9QV0k1Ykh0SEFiamY1OXhkdkpl?=
 =?utf-8?B?K2hDYlZlZ0lJUzZTQTgrQTVZZTNOanZYVUNDVHNja2lRdWQ1MjZGV3BWbU5E?=
 =?utf-8?B?UW9LQWFDZjN3Z1UxRHdoU3NQN3c1TG1BSHY5TlNzOFVjZEVIcUVKcjluVnhm?=
 =?utf-8?B?TTZ5YklleVdmaEpxV3g0Q0pwVERWQnJlVXBiaUdQd0M5ZEhXNFVmWDlnZS9G?=
 =?utf-8?B?RHhRbStGVFVRN0JVZnhqb3pWNGJoa1JPdk9SeVpIdVZDTVFtREhKalJmbUJK?=
 =?utf-8?B?ZEMwd0ROL2d0dXAyNWp3M0dQQXdMTzVLblE0L0ZmYkh5KzBKc1J1eThpQ3k1?=
 =?utf-8?Q?TLRd45qVe64=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UFo4NmlNUWR3clYzZHQ1Z2dDQTdBRzNwRmh5M1RkNHU1empuMGZDWFNteFdM?=
 =?utf-8?B?MDhacS9Sa0pickdQSGZra21ld0EvUjdFQVNXNGpXcnRON2FEdEowSXBVU0N3?=
 =?utf-8?B?dU9QYnFLNlRURGNuNDJwdnhndHAyL1dVUkoxRk56K3RpcXlKS2JhNm54UUhY?=
 =?utf-8?B?THVOTUN1dTl2bG9xMXlQZHdyZ0VnK0pRZEwzNEZhdjdWNlBOcHN5SVJRclQr?=
 =?utf-8?B?cDl5UzdrOU1FYjhvQUpWQWRFNC8raDJOaFg0bVlMOG5GZm9XRWo0OEF3RnF5?=
 =?utf-8?B?cTBmVlVkckZqZVJveWM5cGtGcnUyZ3RkTUNFblg2VFlpMjFLblVvSzBRWlMy?=
 =?utf-8?B?Q1BxSEJQMzk3NHdxSnFQU2pjYWFoK0ZtcTJrSXZ2dUVWK1E3MWR3YWNybmlO?=
 =?utf-8?B?Ynhvd2pZVzZaWk1SZlZpdW1zZlZNdGRoUVo4YW9vc0J6RHNhSnd3NjJnMlRp?=
 =?utf-8?B?SWtGSldqOWF4MkFBbURmQ2xMdjhxUW1uSEZuOXU5aHlHOTVjTUY0UFlCTkR4?=
 =?utf-8?B?Vmxvc0psdnpVU0VYblNGYlBqMk1DUXpyaGhibURUNW4zRnNhSWp4QXNYV0kx?=
 =?utf-8?B?d0JCS2ZSbUtPMUFxZVFsaXZhV0l6WlVxN0VEMmZVZEdLY2VFdzFzcDZlYWF3?=
 =?utf-8?B?R1N2KzV1VThQUHR4cWVFSy9ORGFHMGNzSlozd0tNMmRlV25XeTNOeWF2dU41?=
 =?utf-8?B?MytoVzlBaHdVSFFWVFBFTkcvSnE0b3FVQkhza0wyYnhYWTYyb0lCZ2lRdzVB?=
 =?utf-8?B?ZzBjRmNCV1JwRDVYOVYvWjBKVUlrRGMxd1BMd05EVmdaR1JwZldTNmlaTTV0?=
 =?utf-8?B?R2NIVGFHalJqZks2MjVsTmFVcEhHNWlMWUs5TmpiMS9IUTRobWJLVzBkOTFD?=
 =?utf-8?B?c05pTWtRZ211OW9wNmtlWnFaY05uemRtZjZSWFV4bm93R3VjUFJhbHJpczJo?=
 =?utf-8?B?cm1WVFJIbEZ6Q2w2K215Q2w1TzZBQWF6QnZ3K2c4eHQrVSt1U0ZwcjFPaWNQ?=
 =?utf-8?B?a09weHFyRnlKZHBrUFhxeVBMUUJqTjY3bmszTHdueVBxRytCdHZzTEpLdi9B?=
 =?utf-8?B?WUxnTW5QSHRGQnlNNStEaWpnOUJBUUNudHU4b2t2aCtocDgrYS9oWnE4SDE5?=
 =?utf-8?B?RXdDZ0t2MU9FSE1Cc1FIOEJYSzFEMVlkL0dKa29raU9wcVZDb3NyU3lhcHU2?=
 =?utf-8?B?c1JnaU5IdEQrQmt2c2N4SFY0aGJ0YSsyV0lSNGttVzdiZHNveFlodEpXYzBs?=
 =?utf-8?B?ZVV4aEhtSERJSmkwM1ljNWJDbHNrTkpBRnlQOTloc2k3NHpTYUV3NEkvVnVI?=
 =?utf-8?B?OHFwbS9WSzVTUStaYjhDR3lnbWt5Sk5jSkFqU25LNysvK2lNNkcwdEpTQ0FS?=
 =?utf-8?B?eEtYbHdCeFJsZmw1N0c3dzJOVmc0RDRYSEl0d0Y5VmhQaHRTS0hSU2pabTNH?=
 =?utf-8?B?UjVkSCttaTNlTnloRzJpUktHVWJPd0h4QWxTTXpHaUZoVzRyamtsa29DSjNr?=
 =?utf-8?B?M2NCU2JSYW1oVmNBaXlsT0tHTWhDVnpRT0VNNWtNU2cwZ1FycnpjZ0NmQVZq?=
 =?utf-8?B?Q2h4UnA1MEtpOXV4MXRYU0RCdlZkU2JxWEVkNVN6L2ZXejZzWFNOU08rUWFK?=
 =?utf-8?B?R3N0UlhHdk1pMmRRbjdhYlN4WEhpWFNscEZweTZ2NkE3TmFkL00vNnlNN25k?=
 =?utf-8?B?TjhCZjJiVERzeGJuQjNGK3BCRkJuNHVjMXhpMVVMekY0NHlKTXJSVkVFWWdr?=
 =?utf-8?B?RUVRczdRV2cvNWZjYUxmN1BnbEFuUXoxL1Z1N1BXd3VKSmIwa0o0aHFCUFBr?=
 =?utf-8?B?ZTIrdFh3NC95a1liUzBsZ25aZEYvWjR1dDhrdEZ4NW9DL3pTLzRVNEdLVzdH?=
 =?utf-8?B?V3hWRWVSUWZDOWc5S0ZlSkUrcTh1YVhiOGhHU2hzbUtqYld3c21QMWk1dUZZ?=
 =?utf-8?B?QzNzcjVuendGaHlEMmNXTTBhTHl4cGtYUFptREpkWEFaY0FqK0JYbE5scGxR?=
 =?utf-8?B?TjVjLzZKVWcwRTQ5ZWlCbGZZOGxJanI0YWJkd21aYlpXb3NvYU9DR1ZTSW9n?=
 =?utf-8?B?MHFiNURHQVNRYUkyNVpCN3g0YXV2eE80YWdWcG95T2trZmhPR3EybS9OSnZp?=
 =?utf-8?Q?38NM=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5559aa7-7389-44b5-8044-08ddbeeddf13
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2025 13:38:21.9055
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KqvwC5+z63rtZL0CXoEQz964/wIx4fANIaHc00s9U2iPLk80NPTwFcW7jm66dvbo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7261



On 09/07/2025 15:12, Ayan Kumar Halder wrote:
> There are a number of places where Xen triggers a BUG() due to 'impossible'
> conditions. One of these impossible condition is when gicv3_info.nr_lrs is
> equal to 0 or greater than 16.
> 
> Add a OFT marker in the code and link it to document explaining why this
> condition is impossible to be covered while running Xen on a platform. As a
> consequence, explain the architectural limitation that Xen relies on.
> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> ---
> While running Xen with coverage, there will be some parts of code which cannot
> be covered as long as we run Xen on a supported platform. If we have link the
> code with the specific explanation, this will provide some context for the
> missing coverage. Also if the relevant part of the code is ever modified, the
> dev can update the explanation.
> 
>  docs/fusa/coverage_gaps.rst | 17 +++++++++++++++++
>  xen/arch/arm/gic-v3.c       |  4 ++++
>  2 files changed, 21 insertions(+)
>  create mode 100644 docs/fusa/coverage_gaps.rst
> 
> diff --git a/docs/fusa/coverage_gaps.rst b/docs/fusa/coverage_gaps.rst
> new file mode 100644
> index 0000000000..3cb877a8ee
> --- /dev/null
> +++ b/docs/fusa/coverage_gaps.rst
> @@ -0,0 +1,17 @@
> +
> +Coverage gap
> +============
> +
> +No support for zero or greater than 16 LRs
> +------------------------------------------
> +
> +`CovGapExp~unexp_err~1`
I think the tags need to be named better. 'unexp_err' does not mean a lot when
seen in a code.

> +
> +Description:
> +gicv3_info.nr_lrs is populated by reading ICH_VTR_EL2.ListRegs. The supported
> +number of list resgister is 1 - 16. Thus, any value outside of the range is
s/resgister/registers

> +currently unsupported by Xen.
Having a description written this way is misleading as it gives a false
impression that this is Xen limitation. It is not. ListRegs bitfield is 4 bits
width, therefore it's a GIC limit.

> +
> +Needs:
> + - CovGap
> +
> diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
> index cd3e1acf79..eca4d76f5a 100644
> --- a/xen/arch/arm/gic-v3.c
> +++ b/xen/arch/arm/gic-v3.c
> @@ -109,6 +109,7 @@ static inline void gicv3_save_lrs(struct vcpu *v)
>      case 1:
>           v->arch.gic.v3.lr[0] = READ_SYSREG_LR(0);
>           break;
> +    /* [CovGap~~1->CovGapExp~unexp_err~1] */
>      default:
>           BUG();
>      }
> @@ -171,6 +172,7 @@ static inline void gicv3_restore_lrs(const struct vcpu *v)
>      case 1:
>          WRITE_SYSREG_LR(v->arch.gic.v3.lr[0], 0);
>          break;
> +    /* [CovGap~~1->CovGapExp~unexp_err~1] */
>      default:
>           BUG();
>      }
> @@ -196,6 +198,7 @@ static uint64_t gicv3_ich_read_lr(int lr)
>      case 13: return READ_SYSREG_LR(13);
>      case 14: return READ_SYSREG_LR(14);
>      case 15: return READ_SYSREG_LR(15);
> +    /* [CovGap~~1->CovGapExp~unexp_err~1] */
>      default:
>          BUG();
>      }
> @@ -253,6 +256,7 @@ static void gicv3_ich_write_lr(int lr, uint64_t val)
>      case 15:
>          WRITE_SYSREG_LR(val, 15);
>          break;
> +    /* [CovGap~~1->CovGapExp~unexp_err~1] */
>      default:
>          return;
>      }~Michal


