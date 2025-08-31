Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3E16B3D3E9
	for <lists+xen-devel@lfdr.de>; Sun, 31 Aug 2025 16:35:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1103776.1455162 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1usj9T-0007Tb-13; Sun, 31 Aug 2025 14:35:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1103776.1455162; Sun, 31 Aug 2025 14:35:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1usj9S-0007QQ-Tv; Sun, 31 Aug 2025 14:35:26 +0000
Received: by outflank-mailman (input) for mailman id 1103776;
 Sun, 31 Aug 2025 14:35:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I8wL=3L=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1usj9R-0007QI-HA
 for xen-devel@lists.xenproject.org; Sun, 31 Aug 2025 14:35:25 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2061d.outbound.protection.outlook.com
 [2a01:111:f403:2009::61d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ba2aaa72-8677-11f0-8adc-4578a1afcccb;
 Sun, 31 Aug 2025 16:35:23 +0200 (CEST)
Received: from MN2PR08CA0006.namprd08.prod.outlook.com (2603:10b6:208:239::11)
 by PH8PR12MB6699.namprd12.prod.outlook.com (2603:10b6:510:1ce::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.23; Sun, 31 Aug
 2025 14:35:16 +0000
Received: from BN2PEPF000055E0.namprd21.prod.outlook.com
 (2603:10b6:208:239:cafe::98) by MN2PR08CA0006.outlook.office365.com
 (2603:10b6:208:239::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.26 via Frontend Transport; Sun,
 31 Aug 2025 14:35:15 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN2PEPF000055E0.mail.protection.outlook.com (10.167.245.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9115.0 via Frontend Transport; Sun, 31 Aug 2025 14:35:15 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sun, 31 Aug
 2025 09:35:15 -0500
Received: from [172.17.238.12] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Sun, 31 Aug 2025 09:35:14 -0500
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
X-Inumbo-ID: ba2aaa72-8677-11f0-8adc-4578a1afcccb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jakm3OEYiuwN2tfru19EQi1Dtj0cuboG9YtyS9W2KDOlJ+tuEUsDvz8fkD92qHXm94jfZwxG78fNcA1giLKnmKyLN2w/IUAZA9zYncImh30lhpxjJFO66StbhCpTRawkdaCBIr9tmYa3V2t9wkLl5AZzUwqhNL0HXNqpkbcUjAjP0yXD7Oap8pPy83RcyWJnne7ktwIFc22R5sqMK22FZtP19qSp3sD0N30HmSH4iGEaBxkRLVCg8E6APxeyXzVbDzr05JigxthGyFcnORKsaiN2V0kYodSlu1xmvSh5HPlJ0EG5l/m+DsoBygh3GmIatGTXKiUT8k5DlCj7Pr023w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7dE9DnoVnOVI1m088z1sg438Ww/eIrpKQP3iWBcN8Ow=;
 b=vzvLgxyHvH7mSSrXBSHd4lSxsTGrgxDGnV7Jecki6R9WyUb2jvIalHbpdQ31sr7764P17ij9n6BWTTt4Aso65t0Q4aH+NAA8nly3dWjqS95n3cFGXptnbDSScZeK3As1tQazilDwoLWAMZ4XCPpzqsm8Y7izUCrCuFnwrHQUvS+6T19k5CKEgg3GUdPzDbuKA3aPgGfTUW8DJUmLF5yBHU3FobwzYlf3wVo4BfLhv/QBNraFMu2ylrpLMsjv+JVPbFwZuL8z+04uvpbY6GxQMvBxTA7KrlPq32IQk3acu8QxyBDkp1ZCYIluT5CQQVsSXzgirYb5TjxAp6ZIKUjOSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7dE9DnoVnOVI1m088z1sg438Ww/eIrpKQP3iWBcN8Ow=;
 b=ECZfKQmi21Z5/GZcSWxW/KOSwmOQikuZp8rZDye1NkIenGjppwOH5ZqdtFzfkl0QUVb7lxvyN7dvNgZXt2IxE7z9sgepZ3BLDODgykSKPSwgV+CKewEoQ+LXM8ZYSPqp6fY+Q2KGsk6cId2evNl2JCPiRD6Cvi/pq0JhB160MYY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <61e45049-5e55-40c3-b4ad-593c1a4205e3@amd.com>
Date: Sun, 31 Aug 2025 10:35:14 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86: introduce "hot" and "cold" page copying functions
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <1b9e5d46-20a8-4b5f-b938-e28a0429c770@suse.com>
 <4d06bd13-6f75-4dcf-aa4d-c225139c2575@amd.com>
 <2b34c868-7562-4824-8a1a-72df7348dbea@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <2b34c868-7562-4824-8a1a-72df7348dbea@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055E0:EE_|PH8PR12MB6699:EE_
X-MS-Office365-Filtering-Correlation-Id: 66fa7186-a750-4911-9ef3-08dde89b99e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VlhtSDhieHkwRmNaRmh0cTRFUDlrZEpiMCtqNWV4K0x1MDY0SlFBNktlS3VW?=
 =?utf-8?B?ZFM2STRkT29WQ2ZsQnNDOWRlNFl4YjE0UHI1ejltNGM4N1BqVGxlVDFSVDUr?=
 =?utf-8?B?WUdUN2V5M0FlWGtPQWxzL3NVSWUrMEhhSE9wUW9idG8xR1d4eEg2blRYT1lo?=
 =?utf-8?B?b24vZUF1Q3JKaDN0M0pIYlNvb292cDRZbFgyQzJFSGVEUzdhcElzWHIvVEZu?=
 =?utf-8?B?SEFsbVJBRklBcjJjQnllcEJnT0ZSaDU0UnFWd09VL2thNC9jSzhieEJJZDk2?=
 =?utf-8?B?SlZtdE05STVXc2Rkb0syblo3ZTZ6cjhGY1FTc2RsZVo3Ylc0bUQ3VzFvZHM4?=
 =?utf-8?B?TEVDZGFDeE1pL0VnUlVhUmJMVnRhYWRmYWRUdjh1bHM3dXdkblFoazNJL0dk?=
 =?utf-8?B?UTBHaGV6ZjljQnQ4Q0hTci9Gb0YvZTlnZlVnSjFTOExRYjUzc3dKcDBPajFW?=
 =?utf-8?B?ZzBSaE1oYkJ2NEFWNlVaQXh0ZzBVS2ZxTkVXZ2ZCQ0VDSlhhd2hVMEo5MXlT?=
 =?utf-8?B?a1pHeWl4WGxEbzd4MGxBeUpjK1VXNlFYdmtERVBNK05ieWpWSHQvcncvV2JU?=
 =?utf-8?B?N1NMT09HTGt5dGl4ZTlWMG9BaU9lRmZHelpMVzlkVmZTNGtXTzJ5U0gyS2Za?=
 =?utf-8?B?bkZPcE96QWNPYUliV0N4LzQ4amJpRnVKcGdyMitOUXI4VUlaRDhLSEo2dzg3?=
 =?utf-8?B?czBCQ005VkY4a2ZZaXpBaSt6WUJxMzkzeDI0RCtnN29KVS9BT2hrMzc3dE5I?=
 =?utf-8?B?SDd5bGFkRWZXc2xhenZYOFV6QlZzaXBlZUJFblRaZU8yUEI4UDYvSlh6SERx?=
 =?utf-8?B?UlZqQ3B5SzhGNm9TUzRSRnFTVTBZRTdSRUhVV2dyU2VLeSs5OUFtOWpNbEVC?=
 =?utf-8?B?NVI1TWtXMWMvRDlSNk1aSHlWc2pzUzhYQ0N4K3JmTmo2MHJndVhUbTVHd2E3?=
 =?utf-8?B?dnI3UTQ4dzF3a0xqSjhWWXpJajlBSUpxM01ZYU5Id0oyUlQzaFEySlFvdGVm?=
 =?utf-8?B?TkdzSEgwa3dENHhFNGpMNzF4YjBxZXI5eTEvZGFRTGJ4ZVYzRlB5ZlF6NWkv?=
 =?utf-8?B?R01UMStZTGRsa2VSUWV3eXQzenpFRGRvNTJtelNxajNFMXFmLzZ5SUs5VUNy?=
 =?utf-8?B?ZnEyMWFNcWRKcUJVRW9mdS9uU0Z5RVdUL2RTanBKTk8zb0lIeVpVR2cza3JU?=
 =?utf-8?B?MDNjSjRMVmJoaHdudFFaMTNxUDBxYmFBN0dGdS8wdUNZZ3lKRnUycVlYaFVx?=
 =?utf-8?B?bjRPVWlOYTZYVjQvL2V0T0hlaTY1MkJ6aWJIVjdqMHhuL0tybVpOMWJXWm9J?=
 =?utf-8?B?QUdzbWg1eHZrMUxVTm1DMW5lK0N6SmdWNytxaHI0Rkg3VFNpcXNkNFlrQjhB?=
 =?utf-8?B?VlVwZHVmZ3lNQktva0hPRUxvL3ltWWJYYzJFeThLZGpsOEpYcEF0OUdiOWJY?=
 =?utf-8?B?Ym5NK1FCZFhoeWt2YnJKUmwxZk5ZbmZERk1IdHF2NUFwOCtoWFhrWlNXQy9Z?=
 =?utf-8?B?QWJFemh6RHVGbkNRWE0vdVBtTEs2NEpwRmVqY29VekhqMmZFQWlkbW5aOGYx?=
 =?utf-8?B?MkNmTHNIaktjZGZHQUNJT3BEVlRlOWgwRVlzQnRNNEo2NEk4ejFVM3Nkbkpo?=
 =?utf-8?B?VmVhM0VieXVpMzZIeTRrQzhVeWtTTlcwNkxNcDFMVzc5ZElXcldEeGJuS00r?=
 =?utf-8?B?dVFoODUyZlpZRU05WlJub3g1SWw2TWRTV3hwSGZ0MFh5NSs1ZG82MmpLRVVZ?=
 =?utf-8?B?RVMxRWVQSUFnU1AyK1Bnb21udHV1V2tJY0l6M3grWCtxdGs1bTZWa1huSkJ4?=
 =?utf-8?B?WjIxVU56bFlnRzlsSzVQSzlQaC9IRVJSS2JIYzhSbzZ4M0s3NkI5MWY4ZTJi?=
 =?utf-8?B?S2YzSGJmVWFVRyt2WXRTSk9Wdnd5L3U5UUhxZnRGN0Q2SFdCczdHb2JvZXk0?=
 =?utf-8?B?YkNIQTJLWkMyNVNjeEUrZEFKUVFyR2tHWkhFaEE1Tk15d3J1VTdxeVlZamZt?=
 =?utf-8?B?MXRHTUFIeXMxYmcva0gyLytaYnh5ZjNCbDBmakNMbmFEWmYzZGVocklhd0s3?=
 =?utf-8?Q?JoaNon?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2025 14:35:15.5801
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 66fa7186-a750-4911-9ef3-08dde89b99e9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055E0.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6699

On 2025-08-29 02:29, Jan Beulich wrote:
> On 28.08.2025 23:33, Jason Andryuk wrote:
>> On 2025-08-28 05:17, Jan Beulich wrote:
>>> The present copy_page_sse2() is useful in case the destination page isn't
>>> going to get touched again soon, or if we want to limit churn on the
>>> caches. Just rename it, to fit the corresponding {clear,scrub}_page_*()
>>> naming scheme.
>>>
>>> For cases where latency is the most important aspect, or when it is
>>> expected that sufficiently large parts of a destination page will get
>>> accessed again soon after the copying, introduce a "hot" alternative.
>>> Again use alternatives patching to select between a "legacy" and an ERMS
>>> variant.
>>>
>>> Don't switch any callers just yet - this will be the subject of subsequent
>>> changes.
>>>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>
>> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
> 
> Thanks.
> 
>>> To avoid the NOP padding (also in clear_page_hot()) we could use a double
>>> REP prefix in the replacement code (accounting for the REX one in the code
>>> being replaced).
>>
>> Did my tool chain do it automatically?
>>
>> 0000000000000000 <.altinstr_replacement>:
>>      0:	b9 00 10 00 00       	mov    $0x1000,%ecx
>>      5:	f3 f3 a4             	repz rep movsb %ds:(%rsi),%es:(%rdi)
> 
> Interesting. That looks like a bug to me, when source code merely has
> 
>          rep movsb
> 
> Did you also check what copy_page_movsq (i.e. "rep movsq") expands to?
> What gas version is this? With 2.45 I get
> 
> 0000000000000000 <.altinstr_replacement>:
>     0:	b9 00 10 00 00       	mov    $0x1000,%ecx
>     5:	f3 a4                	rep movsb (%rsi),(%rdi)
> 
> (the omission of segment indicators when there's no segment override is
> indeed a change in 2.45).

Oh, sorry, I forgot I had the extra rep in when I looked at the 
disassembly.  It is as you show.

Sorry for the noise.

-Jason

