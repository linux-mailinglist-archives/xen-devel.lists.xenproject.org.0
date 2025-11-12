Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8145DC533F8
	for <lists+xen-devel@lfdr.de>; Wed, 12 Nov 2025 17:01:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1160257.1488453 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJDHx-0003ko-Qx; Wed, 12 Nov 2025 16:01:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1160257.1488453; Wed, 12 Nov 2025 16:01:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJDHx-0003iQ-Mu; Wed, 12 Nov 2025 16:01:41 +0000
Received: by outflank-mailman (input) for mailman id 1160257;
 Wed, 12 Nov 2025 16:01:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X0mN=5U=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vJDHv-0003f1-J8
 for xen-devel@lists.xenproject.org; Wed, 12 Nov 2025 16:01:39 +0000
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c111::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dd90db10-bfe0-11f0-980a-7dc792cee155;
 Wed, 12 Nov 2025 17:01:37 +0100 (CET)
Received: from DM4PR03MB7015.namprd03.prod.outlook.com (2603:10b6:8:42::8) by
 IA3PR03MB7620.namprd03.prod.outlook.com (2603:10b6:208:50d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Wed, 12 Nov
 2025 16:01:33 +0000
Received: from DM4PR03MB7015.namprd03.prod.outlook.com
 ([fe80::e21:7aa4:b1ef:a1f9]) by DM4PR03MB7015.namprd03.prod.outlook.com
 ([fe80::e21:7aa4:b1ef:a1f9%3]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 16:01:33 +0000
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
X-Inumbo-ID: dd90db10-bfe0-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tYscxDt6KrGNkKxAoFbYu0miMr1vHU/w5V8f9Q9BVY9I+RcDZ7EtyTYwYzgkyR4QX100M15RHm+p9WG/lziPB8hg5NeZK1arjI06pDgbCJe+GwlELOYFiubkxqK02zsbpIcXWF2uNjh1gTb7K9Yr1BY8h4SMIW50W7z5OTuAw2mHz4Rbn9AeTe5JRapDaZOvWBNp/IZU17Ntzp5d/rXLhnH7EfL+T/Q3LLbjiGkCQitaNdRzTG3MGb0kdfSbt2QgpbLqXt0DayeJl5FhpMjyC2BltP4BNU/QddRg40JJeYlcSqTi190tLIVLWzY7k2/bgmgDqRqqxW5kCW7YWvs6LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9ti+m6syFQlzgcND+CNg8RFMHCuHNnTNIaCqH/wRQjo=;
 b=emA27fTutwefA4NwzPOT46oedg20OxQtLvUDcUSiCo3EzjmZXYrF4pEefOGoJlfND0N51OqNl7CvJk3z80DddHUy2hnGflqBFJdBSEFSUa8CeVFtNWQY3PW31MLBBXO9Nkx0N1P7vBrTSrXnhHGAuTPDS7emtxKMZ8BIpNgertz0TuVgRA+obndVWUpDA1j8uS/I3Nq5znCsZFrTb29chWHY9nDEQVy6VJvTeTZHG1RuAAaqk/kgNI4rPZKk0cYgZ1tvINnbmXSVkCiai3MRjCRx9iCeQ+VcWb30hAqr0Ygmp4QYDyNbFGX5eUvwHZ0rX4ycoA2gTNaIe396+JJYKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9ti+m6syFQlzgcND+CNg8RFMHCuHNnTNIaCqH/wRQjo=;
 b=xamFVCX1VVHfQey+GAfMejhrGEOI/lVP8d90xstqqd3SelYy5sgwJVuuW9sm/ubVYh3OI5MiM7uxNb0n3WLZVc6pDA804KE9H8/2Zwcy8V/W3ps0HoeIKIYbH4Q1fi3Kig64Olualhmou7/tI1pAQypg3xpmDG/EQn0SHKRT3So=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <a1e1c169-74cb-4d60-ae78-e634b1452f2d@citrix.com>
Date: Wed, 12 Nov 2025 16:01:30 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/IRQ: use LOCK-free bit setting in init_irq_data()
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <88bbddc8-61cb-4284-9b0b-9735a4a8099c@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <88bbddc8-61cb-4284-9b0b-9735a4a8099c@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P123CA0005.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:a6::17) To DM4PR03MB7015.namprd03.prod.outlook.com
 (2603:10b6:8:42::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR03MB7015:EE_|IA3PR03MB7620:EE_
X-MS-Office365-Filtering-Correlation-Id: 33e60d3d-89c0-4f4d-40e4-08de2204c058
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WnFsSW5ScnhPZnM1WHNhVzBlbGhZeG8zZHdxR2N6blllNVdUbTNVS3VCZzVl?=
 =?utf-8?B?QnF2bUZMWUR5VnJ2TXo1MjJldU9VV1lGdGo3Vk5GMEdzN2IwbytZRTBZT0VR?=
 =?utf-8?B?U3lFcE5HdTArZDZaNkxIYW1TaEhyTCtmaU5JWUQ1bGpNdjd5cVZZWmpkWEJE?=
 =?utf-8?B?T1ZnNFlPYnFjdDNLeXkwWUNDTk9LT1RZOTNxOTcrREp4OVBxNlZOd1lycHdM?=
 =?utf-8?B?Y1hHYjZtU1VLTFIyQ3ZLcUdEYXg2ck1HV1JwUlF1MnJiRk5qK0sxOGhPb0Q5?=
 =?utf-8?B?aEVGcWtBZkhCLy9wbFdZYXFhRlBrcmVlZDJ2L2I4eExtaUVBbUs0M3ZIU3dN?=
 =?utf-8?B?bS9tcGd0QkM2K29pblY5QVRZcVZ6NE9sbnU4bG9Sd0M5NWhBbWJ5MlhSQ20r?=
 =?utf-8?B?MDMwT2FsdTNzSTVXQS9hc0JXRG01VlM4amk2cUthSEpPTy9GQ1A3aFRxempx?=
 =?utf-8?B?d3hScVpZMGh6UkptcUFiSCtmUG1WeXd6UGp2UWIzY2h5NWc2OXEzcWRhTVd3?=
 =?utf-8?B?NS9kSFNTOG4vQ3kzdFE3dGYvVWUwL1ZWQ21OSENpNVM4SjNqZG9JdmlxY3o1?=
 =?utf-8?B?OVlJUkNpc1A4QjVpS09PUTVEaWdFeVlCQWNTWmhlM0hVM2tQKzBscU1lQTcz?=
 =?utf-8?B?UTJrbzlURHI2TTVrVXVJYXNpdEU4TXJzblhUdTlRQk10QWZLT0kwVGQ3R1dZ?=
 =?utf-8?B?SXVBMXcyNlVLVi9yd1gwZlM1RG5HcFFDV3QwR3htTTllMmdEcHN1U0JzdTZV?=
 =?utf-8?B?U1ZxakhsRjM3YmhIa2h2YXZiZXZLdi9BUk1TSXZYQUcxa1Z3Z1Uxb2krQ1dY?=
 =?utf-8?B?N1RXc0tEbm5PcHYrM0hQRmNYM3lQMnRCUStiSnNieWVwQVNjcjRDc1NSdWt4?=
 =?utf-8?B?dEJFSHRsWFZQT3lKSWxHbnE1OHQvc0s3c0RCSmV5UTBuM0FEaVhid1BERFpQ?=
 =?utf-8?B?bHRjR2lvb05ZeU1GQnFNbTlmbkt3eldiRTlULzFxVWJDQ28reU10Z1hEK2ZN?=
 =?utf-8?B?V2RtejZiMElZTXQ3akl4WTMzcWg5Yzg1OVhNOSs2RWpxa245c2h3Z3dmNEJk?=
 =?utf-8?B?NGx0U1dlTmhXcm1TcURFWXV2TmVRLzBEMHJVa012bFVMemRQZ2hhTnNhUDBH?=
 =?utf-8?B?R2lPdWtpNG1JMkZrTDhVOHc1MVVrSDl6WGxmL3hTNHZTeFl3SmNzWlEvaXQ3?=
 =?utf-8?B?bUxjalp6OERFWXgvQjUwRHNUdit4Sm5RUVJFUlp3dWo1dlFxcGlUUVAxYjdD?=
 =?utf-8?B?a3lvK2pmVm9yYUlPSVpVV2ZXdXNlL01jSkd4a1U5d20wNnlFN05CQlBnY0hs?=
 =?utf-8?B?UFUrRi9sRjlEQXkxVjczRm1KK0JuSDZSMTAyYjJaRnBrQ0hMa3ZFdEE4dUh5?=
 =?utf-8?B?WWY0ZzhzVi9CNmlDRGtaRG81b3orNWs4THl5U0J5SGtKNkk4c3owMmNicTBI?=
 =?utf-8?B?KytPNEQyRzRwUEh5VDFPVVloL0tSQi9xV1JCODVhTlk3ZDVEcys2aWRmaHpR?=
 =?utf-8?B?RU5HWE1GOHZHc1cxR3pJejhZOXp2VG1GSmU2aVBTL3VxUEtWM3F2bmgwaVVw?=
 =?utf-8?B?UmN2bGZLTWljdU9yWE1aSlB6SU1JTTc1d0ZKcFFocklVb0pKQXZxVVMrVUFz?=
 =?utf-8?B?TDlMQUdtYWErTnN5ZGhub0RCRTRVVUNiU1ZlQXpTWXVBTDBwcFp3emo3eXg5?=
 =?utf-8?B?dHNCWDRCdHJqQzRYdDVWaXRQTWljd2d1ZFNiNzJOV0JoWDJJY3VSTWVkaERo?=
 =?utf-8?B?dGVHaUlsVG9HQ1AwRStYMW1nV3VFSE9sdTBoZmtBSjN4Q3FmNUhBSmVlNzNZ?=
 =?utf-8?B?dEhRbEZlUDlucHN3NllXUkppZWoxckM2R2R0Y3FERmE1TnRrQWFlcll4NkVQ?=
 =?utf-8?B?Mk83cmd4Q0pHRjhKMGpvZDRUZDcvVTdrc1l6N2ZjTnNXMHJqaFBYTStNQzNM?=
 =?utf-8?Q?rMT9dhA5uOvBnIgL6SKEZKj7iDxYN5HR?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR03MB7015.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q1E4Yk56VHQyZlpWZkJIRGY0ZC9uNStPWVNncFVUUDFRNzFXRHd3QmZ4bk9K?=
 =?utf-8?B?RW03ZXhpbkk4QWFQQUJHY2kyeU1vRmhmUGZiOUN5K2ZGVEtKWi9jOWFXZzE1?=
 =?utf-8?B?TzZJeENrcFhwWnkvSmlPelp4NEU5OEpBVlZKRTBsamlaRkk3OEppMkRCNlhK?=
 =?utf-8?B?d3N4bWNHUkdHM0JwOWVNUWhmb20rY1NRb24yNkRJeHBBVjV5NStpeUkyLzI0?=
 =?utf-8?B?eWgwajNqeGpJd3lCQVlZNlJqaUFZVERGemRVWTJjU0pvNmxQejZoNkRHVjll?=
 =?utf-8?B?dUZ6N1VnWTNrMkttUStxdzlYQkN6ekdEUkJXbTVCb0ZrVFFiTUJ6bDY5SUtM?=
 =?utf-8?B?MWk2RTVNVEdGN2dmREdvT1RiL1NtMHd4eTQyN3V2SzZUczgwTnJvWS9Md3E0?=
 =?utf-8?B?dTFBeGNvRWZ3NCtuMGljbmh6cWRZWHFhUFVSUndUTkl0bWVLYVgrWnE2a0E2?=
 =?utf-8?B?Q3hTVjNlM0JSVU1CMmVUa2pzWEVDSWNmRmNFOUxVeGZMb2EwUncxZFRnNXBa?=
 =?utf-8?B?bUtwaC8zeTdwUGpBQ3N2UmZxTUIzYVQ1N0lJTHRweG5seXUvWGdoVkdPc2VY?=
 =?utf-8?B?ZkEra09ReEVzRTdZOWt0d2JCamhjOGJ5RDY2cnZiWCt5TTJmdTh5SUQyVHlL?=
 =?utf-8?B?K0tLV05rUnRTcWxPanFlWXV2cE85Y2gxKzV5aGNROGllWlhQRmthbHhJWEZ3?=
 =?utf-8?B?VkxFY2VNOWY2cDNETmsyeVVVQ1RjSVBoU1RWbkc0bkZ2cXFabWdQaHUrUTVQ?=
 =?utf-8?B?NUN2bTdtRDYwejlCYzhZTHZXbExZYWVDTkpOZTlVMHRMYVIzT2FQaUNDVnE4?=
 =?utf-8?B?SFBaU2daWkZ6andBbXhJOU5LaHZlVEJoLzRGRThLSHd2U3N6Y3JXdm1zRTQ4?=
 =?utf-8?B?cDUyK0RlQ3Y3d2VhN1dLeGMzUDNPNXdGSk9BZVJnTHhtVlJoT1p4K2VFU1pB?=
 =?utf-8?B?cEE5V2VpT1hCMnZYQ2pzbmlzdVJIUUM4Y3Y2Sk95NGI1Q1gzQnpkOTR3ZElp?=
 =?utf-8?B?U1ord09WejVUelB5R3B1aGk0NFpvWW54d0c2NkJQeTJpc1h0aG5vSVBnNElh?=
 =?utf-8?B?dGhJbnRyVm84Z3dqRmIvUzhzc2tVT090TlNINnk1OGZ5UzdvcGRyUWU5eXp1?=
 =?utf-8?B?YW4rRk1QNFVYSW4vb2hBdWFnV082TEpGajcrbENrUlR3cGNQN0FiT1dJWkp5?=
 =?utf-8?B?TWNWa25HN0pVMzJTZTFHTHMrWWlqOTJEWWxNb0luWGFaNnRxbEdRVldZYTFK?=
 =?utf-8?B?WFdyM3NrUXFia3N0VkF6am5pQzU3U29UdW1mNWtpS0FOREJ4TFVuZ3R1WmZv?=
 =?utf-8?B?UzBJN1pkMGhlSyt1VGJpRDN5cU1qWFRCZHdIaVNRRGE5UDVtdFZtMFRZYUEw?=
 =?utf-8?B?aVlFNHdwQlhQZXpaSTM2azlwaXczRGh1TEQyYVQxMzJZa0IyNEYxQ3lMTjNo?=
 =?utf-8?B?SWorU1haZUxDM0F3QWNqOXRIYjJaNVJQdEs4bWdubXVKbWQzVmVBTHlENFU2?=
 =?utf-8?B?bWFha25CaEZDWnVud0UrWW9aeHVLWFRremFNTXQwczBqQ1pJSENETlRJdnlk?=
 =?utf-8?B?US9yK3NPT1RSZXp2eW5pOHBwWXR3aU01emNkcFFYcHdTZ1I4WDMvTjRXVyt3?=
 =?utf-8?B?VTJWM2hSTWczUVVwY1hkbE56RGtyYlYrelk1ckIxS1VnUVVhL2RSaVgvTEZ3?=
 =?utf-8?B?cmNVYSt4WFN2SzI2U2F2b0VpWGhXckRlblZ0Qm85YjJUeUJ6OFBXWUFjOEp0?=
 =?utf-8?B?N3l1NjNmUXNPZE4xeDhWYTI3OVE4Ui9JWjJMaHdCODlldGxjOEJ2cFhlaFhi?=
 =?utf-8?B?NE44SjBGS2c0WHlGMTMvNmhyM1AxTmg5QWRERTgyU0lnZWQxK0I5cS91c0FF?=
 =?utf-8?B?Smo3WHpySGFvNEtUZnpqSFpySnNSbGdqSVlXd212VHR5aVh0R2NDVXVmaXFw?=
 =?utf-8?B?TEc0SzRZTEZMUy9PTVRpN3FvazZCK3lERlE1ZERRNXhjUm9FWVluK29xVTdw?=
 =?utf-8?B?TkEzcDZGS3pxYjI0YzQ2Tnh2b1NMR1BpYlc3K0dpUXpONklZTFVaNmpEalRa?=
 =?utf-8?B?UmdmV3ZKYnl5Q1F5KzBpbytxNkdVSG14ME9aUWlpcVZMREtyUkhjK2dXNU0v?=
 =?utf-8?B?KzQ2Y0tmRHN1NU9jNHRScDhyanVtbm1RWWZzVW4vcnhFckhqbGFFdU9wWlBs?=
 =?utf-8?B?amc9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33e60d3d-89c0-4f4d-40e4-08de2204c058
X-MS-Exchange-CrossTenant-AuthSource: DM4PR03MB7015.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 16:01:33.8174
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p/yTRnGRuXE69+mWNREfYpemJdYTujFJzFZydi5peQUwoeDTgv4QnhJ5pjJfdsc5sTh8CySZ8lfQWMwfbdubZ562svu5g3JiGrNba37NYww=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR03MB7620

On 12/11/2025 3:43 pm, Jan Beulich wrote:
> Much like done later in the function, syscall and hypercall vectors can
> have their bits set without use of LOCKed accesses.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

