Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ADB5A4CD67
	for <lists+xen-devel@lfdr.de>; Mon,  3 Mar 2025 22:19:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.900617.1308478 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpDBM-0004Ve-6b; Mon, 03 Mar 2025 21:18:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 900617.1308478; Mon, 03 Mar 2025 21:18:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpDBM-0004TL-2c; Mon, 03 Mar 2025 21:18:36 +0000
Received: by outflank-mailman (input) for mailman id 900617;
 Mon, 03 Mar 2025 21:18:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5oqO=VW=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1tpDBK-0004TF-2r
 for xen-devel@lists.xenproject.org; Mon, 03 Mar 2025 21:18:34 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20619.outbound.protection.outlook.com
 [2a01:111:f403:2418::619])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0e28a96a-f875-11ef-9898-31a8f345e629;
 Mon, 03 Mar 2025 22:18:31 +0100 (CET)
Received: from BN1PR13CA0014.namprd13.prod.outlook.com (2603:10b6:408:e2::19)
 by CH2PR12MB4181.namprd12.prod.outlook.com (2603:10b6:610:a8::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.19; Mon, 3 Mar
 2025 21:18:26 +0000
Received: from MN1PEPF0000ECD9.namprd02.prod.outlook.com
 (2603:10b6:408:e2:cafe::15) by BN1PR13CA0014.outlook.office365.com
 (2603:10b6:408:e2::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.15 via Frontend Transport; Mon,
 3 Mar 2025 21:18:26 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MN1PEPF0000ECD9.mail.protection.outlook.com (10.167.242.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8511.15 via Frontend Transport; Mon, 3 Mar 2025 21:18:26 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 3 Mar
 2025 15:18:25 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 3 Mar
 2025 15:18:25 -0600
Received: from [172.27.162.189] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 3 Mar 2025 15:18:24 -0600
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
X-Inumbo-ID: 0e28a96a-f875-11ef-9898-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j8jG0Qs3/WnMWNV69lusDKz7+n8tWtlmgzygwFbm6AX7gQe1n3k/0mCENbDMTsQoO4DpgEjrarcvWpz2me2XkVUCbg/TNoAfDX2a7DLOR2NxvJCPbHE3A+Sbjzf/vokwRASbmZFD4oYlBaSN+0RTuWF59xROCiDju5uoCLiKC6XVpdaBRBkCJtCGWgOnXyzcmG1QIp3r94fljL2YKbR2SBhg4BssAlK2LLuzz3xm7i8SvkFugjbNa8ATfkneMR2VPm71htxYF6LmsLPChvoQeuIDELuQrB5bm0/Os8lCPyJqYBDuAsGv1V9qPyyeZQLTJYi5e6r+jQMOXTHEO/5wWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GSxJJV7RJnGOGm6uYhXSZU5xqklTCOWnIJkxOpIJT9I=;
 b=M2gw1Fys16o9GDUt3cLqojp9iwB5JEKSUYUwcpm/QTgTaXiBWgp486JdPRooMF/2Dipo8KrxZ4YKHng6YSms5KMj/1jxMOg5Dyj9ZUlPB8qcwB6ebkIIa2GEXIJOZXNSvHTKIre7qi+s4/Beb9l9DF6oqErHBqCKti+nkYVX/FESd0j9EHsZYWt5lkC7VLkbCQsyXAAm3nnjXCRflfyspaJwoWxGX5xlR55QD394O/NeaRXv/W8CMQf1XraEVDEz/eSIDk+AkeiY7S516Z+OJgruucSPT+lpbvFHfqoDV9w8X8fn3d3OWzjWGhK9UUOb6hVHgRUy76MzyeJvxjKxfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GSxJJV7RJnGOGm6uYhXSZU5xqklTCOWnIJkxOpIJT9I=;
 b=XWfAW1cf7w2Qq68fLkAApYnUdSpiHJdfaufqooIups8C4W1mXSdvOifSmNfEa0w0YAhz3z6C2sTicYe1IqrjYZROFro5lzVw7J2aYu5QO2cF/9d42QfD0vpnKMiYVflZkAQWsVaMZ8ZWplN9MT4QUlT8p7CAooTzo9o7YjPDdxs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <b78d9733-b047-47ba-820d-084c88d7a31a@amd.com>
Date: Mon, 3 Mar 2025 16:18:25 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/x86: fix build with CONFIG_HVM=n and -Og
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Oleksii Kurochko
	<oleksii.kurochko@gmail.com>, <xen-devel@lists.xenproject.org>
References: <20250213185055.711703-1-stewart.hildebrand@amd.com>
 <f5deca6a-313f-4daf-b774-cc05223ab034@citrix.com>
 <7cbc513b-b98c-494d-9623-ba31a7a14360@suse.com>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <7cbc513b-b98c-494d-9623-ba31a7a14360@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD9:EE_|CH2PR12MB4181:EE_
X-MS-Office365-Filtering-Correlation-Id: 961a2976-cd2d-4d6e-a80a-08dd5a98efc9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RGtCU294S1RZc0hMWUFGLzFSbVUvSnUzM0xIdCtwbWtKS0dhVjlkVWt6SVgz?=
 =?utf-8?B?eVRINkJ5TDlSUmZxcEJQZXNWRmNaMWFWSWlFT3c3d0V2bmdlc1lEbW9qOEdL?=
 =?utf-8?B?YXJTV3MrNkwwVnZ3WXM0R2JRZEhDS2F5OTRPd041OFY5ckFudkRwdmxLR0R5?=
 =?utf-8?B?RFhtSnBzWWxnLzN1RkpMWkR6NlA4M3lqVUlEUllCR2hHQ25rc040MTFoWUtW?=
 =?utf-8?B?VXY2cjkyaU9iRlp0dzFOYjJ1cWhnaVpCZDBzS3BEWlIxK0VDRFJIeEFTNnBC?=
 =?utf-8?B?djQrUkVzQks4RTEzN3Y5dXRMVTBFUGZCakZiM1E4dDVLTGt1SkJXL0ZsaUtI?=
 =?utf-8?B?VjFSL2lxMEdEZjhtWjBwSnVSY3lDcWtmK3B6Lzhic1l0K2lCOTJnOVNRcmZ5?=
 =?utf-8?B?bm15d1c2cDRWTEFXTlkvd0M2eWVQVjYyMXMyTzYzSlNhTmhZcFQyOUxDcm96?=
 =?utf-8?B?UXpZOEViUjJZamg1WVRWcE1qa0o5d25lWVJzcFdzYVVXYjU2OVVzNkNiSE1C?=
 =?utf-8?B?T1kxOEJkQkhoVnRLZG9GU3Y4QWFtN0ZJUGEwd1FxdDJGZkQrclNSZGpTUGc2?=
 =?utf-8?B?THIvZVNPUjQwSHhnMUtSMDBZeGRtQzhqbDZaR3FrVlJ1dW9VUmtRR2J4NDF1?=
 =?utf-8?B?QUtWY3BxbGFoWFdqZlQwRTdQSXR0QzFYNWRkKzVJQ3RISk5qN2JOakp3bFlD?=
 =?utf-8?B?U3Vpc2cvc1RiSmxQQ2xBbVM3SDdPclhvVlVHbFhJSlBJVi9qVlg2R3VESUls?=
 =?utf-8?B?ZTl1Um5ITHVWSkQ0UDY1ZU4xenV0d2xqZFoyRWhweXVJcWgzdkNRalpiUjdI?=
 =?utf-8?B?eFppRDZEOVQ0NlhEZzYwWi92MXZRS1lhamovWnBUUzkyY3lNdkgrck9ERnQ3?=
 =?utf-8?B?RVZEWWkrbko3T2JyQTU1akJrckhmLzlRRGZYeWVPTTQ2NnoxZVRJbkI4b21k?=
 =?utf-8?B?YzhtQmVzQkZEWjdyd2ljdk5OeXpoVG80Vm9Qb0RsRUdobUN5M25uSmE2NFVB?=
 =?utf-8?B?OVg1WkltYXNtRmNFa1NDMllTSUZiZTBGZngyWi8zQUtqSW5oQ250ZHJNNWNW?=
 =?utf-8?B?UFAyNnlwdG9MUW5DMTZWSElFTm9DWHlGZDhicEJyQkhqVkQ0TVVIWGQxUkVI?=
 =?utf-8?B?K3pIKzI2NHB4RDVIS2toc09obldOdDdrQW1jdFdQRHNqOWxhZGZidS8vM3oy?=
 =?utf-8?B?T1czUm0zVll1MXd6UFEzMG54cXpxTVlYUERudXR3QTJKTTRxbllFeFgzTlN3?=
 =?utf-8?B?dWkxdEo3TGtPWWRtY3h6ZXRlcXhPWHdSMkxnaHZ2NFkrZitES2dNRFV2ekFh?=
 =?utf-8?B?OVB1SWNMdGF1cjMzdm5GL0c3c2QzOXc4S3I4OVhiN3M2RFlZRk01R1J1enJn?=
 =?utf-8?B?NXQ2SnhLREwxY2JnaEFzaDZjY3d5VE1pSnJMaFd5K2hPU2R6VE9RS3N4ZGZG?=
 =?utf-8?B?cHNoQzBQQ2ZlMmVmb0dEc2tmVzNwVkV6Y0Z6TFpGNUtxdFg1S2JLSWdCdURU?=
 =?utf-8?B?VmtrUkFBVnhNNkFWc2FVY3VSbHJ1aXIxYkdBL0JEdWJTZmFMeG1kVytxMzFB?=
 =?utf-8?B?S2RzV21WY21wbGVXTXVMOVJJWnRUWUtyTXdFeTJqQU9oNXVPWERBblp1OWha?=
 =?utf-8?B?bzJMczJrYjg4VjFZUS9RMHpuZE9ndTdBbFZCQ1VaRnRmS2pHL3VSejMrMGJo?=
 =?utf-8?B?OERjbnByYlIrTVY0N0lTcGE1NnBsWCt5WFJoK2RZeEFBNUg3R2M1TWRNQjRw?=
 =?utf-8?B?RVVSSXMyM0FqVE5wdVN1NlNxVHo0TU1mODgxaW5KRk9tTVN4dXR4VmJMclVx?=
 =?utf-8?B?TCt1SjRKZ3dMVkc1US9iQ0lEaFVzeVNZK2RlcjNtSW9KYlpPYUdKUkVnbDNp?=
 =?utf-8?B?NlUraWZlSVB3Y2tDUmJDRTJwQ05nMzByaEdFY2ZlWDErelFlQzZOUGRWK0NR?=
 =?utf-8?B?Nnc0ME9ZZ2hsRThPOE9XSEo1OUJQOWwrZGp3bEo3S25GaHJzYW9ERlU1bHYx?=
 =?utf-8?Q?cEwXO4jchs8BJHmsuTe3XkIpiksUvg=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2025 21:18:26.0665
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 961a2976-cd2d-4d6e-a80a-08dd5a98efc9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000ECD9.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4181

On 2/14/25 03:25, Jan Beulich wrote:
> On 14.02.2025 02:05, Andrew Cooper wrote:
>> On 13/02/2025 6:50 pm, Stewart Hildebrand wrote:
>>> When building with CONFIG_HVM=n and -Og, we encounter:
>>>
>>> prelink.o: in function `pit_set_gate':
>>> xen/xen/arch/x86/emul-i8254.c:195: undefined reference to `destroy_periodic_time'
>>>
>>> Add an IS_ENABLED(CONFIG_HVM) check to assist with dead code
>>> elimination.
>>>
>>> Fixes: 14f42af3f52d ("x86/vPIT: account for "counter stopped" time")
> 
> While I don't mind this as a tag, you could equally blame the commit
> having added support for EXTRA_CFLAGS_XEN_CORE, for not documenting
> restrictions. As Andrew says further down, it's deemed known that -Og
> doesn't work reliably. And who knows what other very special options
> would cause havoc. I'm inclined to go as far as saying that quite
> likely no Fixes: tag is appropriate here at all, as long as we have no
> way to use -Og without making use of EXTRA_CFLAGS_XEN_CORE (or hacking
> it in another way). People using EXTRA_CFLAGS_XEN_CORE are on their
> own anyway, because the documenting of restrictions mentioned above
> would be nice in theory, but is entirely impractical imo: We'd need to
> exhaustively test all options, and then document which ones we've
> found working (under what conditions).

I'll drop the Fixes: tag

>>> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
>>
>> While I appreciate the effort to get -Og working (I tried and gave up
>> due to frustration), this is gnarly.
>>
>> PIT emulation is used by both PV and HVM guests.  All other uses of
>> {create,destroy}_periodic_time() are behind something that explicitly
>> short-circuits in !HVM cases (usually an is_hvm_*() predicate).
>>
>> The PV path would normally passes 2 for the channel, which would
>> normally get const-propagated and trigger DCE here.
>>
>> One option might be to make pit_set_gate() be __always_inline.  It only
>> has a single caller, and it's only because of -Og that it doesn't get
>> inlined.  Then again, this is arguably more subtle than the fix
>> presented here.
> 
> Making it always_inline on the basis that there's just a single caller
> would be equivalent to simply dropping the handling of channel 0 when
> the sole caller passes channel 2. I don't like either. Instead ...
> 
>> A preferable fix (but one that really won't get into 4.20 at this point)
>> would be to genuinely compile pit->pt0 out in !HVM builds.  That would
>> save structure space, but would also force the use of full #ifdef-ary
>> across this file.
> 
> ... I was about to also suggest this approach.

I'll give this a try for v2

