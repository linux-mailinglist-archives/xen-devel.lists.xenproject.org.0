Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59FEBA79141
	for <lists+xen-devel@lfdr.de>; Wed,  2 Apr 2025 16:35:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.935879.1337251 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzzB2-0005FZ-53; Wed, 02 Apr 2025 14:34:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 935879.1337251; Wed, 02 Apr 2025 14:34:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzzB2-0005DJ-2Q; Wed, 02 Apr 2025 14:34:48 +0000
Received: by outflank-mailman (input) for mailman id 935879;
 Wed, 02 Apr 2025 14:34:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MBi7=WU=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tzzB0-0005DD-Ow
 for xen-devel@lists.xenproject.org; Wed, 02 Apr 2025 14:34:46 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2062a.outbound.protection.outlook.com
 [2a01:111:f403:2418::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9e8858f3-0fcf-11f0-9ea9-5ba50f476ded;
 Wed, 02 Apr 2025 16:34:45 +0200 (CEST)
Received: from BY5PR03CA0028.namprd03.prod.outlook.com (2603:10b6:a03:1e0::38)
 by CH3PR12MB7761.namprd12.prod.outlook.com (2603:10b6:610:153::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.50; Wed, 2 Apr
 2025 14:34:39 +0000
Received: from MWH0EPF000989E8.namprd02.prod.outlook.com
 (2603:10b6:a03:1e0:cafe::78) by BY5PR03CA0028.outlook.office365.com
 (2603:10b6:a03:1e0::38) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.46 via Frontend Transport; Wed,
 2 Apr 2025 14:34:38 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MWH0EPF000989E8.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Wed, 2 Apr 2025 14:34:38 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 2 Apr
 2025 09:34:37 -0500
Received: from [172.29.45.113] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 2 Apr 2025 09:34:36 -0500
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
X-Inumbo-ID: 9e8858f3-0fcf-11f0-9ea9-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PmjPGOT9+/VsaYpVN62v/xY3QkGWnCgguykiHIdB5WT8kkRMmCeUayQaVY+msGxLWxZO6Vqq/1Ef0iD5BmJ29BRN3Nka0YOfjFlRPRXyX4/iGXC07of5gzG0BAh9ABdamMmQh+xy3RFRg33wMV7iF3clz3NpSSNSx/SORfrQDouebMw4QmXdBD6qpeCVcxswtuE0s7+kXwUFhsHaGtk+DoetgRA7jmz+tw4AfNO097qAWHf43KHOJ7pKWYVv5gwl9QzIwpPQWObbIbqgLQUqsw3qUvGo2bZx1j1zhJ+jWlYVoosFoMvGJ6mpDBf61sgGxvQ7ymblBBAQqxLyEKPZaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+X1UWKTXT7x30EugxmzPaNX3CVifcbT2x17P8EMPK4Q=;
 b=S744Zc98EuoyHt/JFQBWHwGlIlljAmbQIoOho8sNDLPfxKwVM8jRoe+RV75Rq6qPyVdeRHpTWOnKw1g7TbNFuB9vPmnVfNS5BynObSEfmoxUwSRPypsHzVsNDiKdlgmGWhNRyPiLLhCouvSBejSaU3aqRDe6WeDfzmex0dcRVgfYmLudpVVLScQxVXHYtDvbMO4WrICCG8gcMlTZ7xWXtVxQei869GGax2/EJN8WB+atVJCu0pg4biSzGn3fUQyj25f5e72AIgAujon+xAblOuAkbcgqCo5EzUF4uu9QRIxZTMyTeUwf9hhWwMU+JzAPvaTtOo4M41c1Cy6AB4AWjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+X1UWKTXT7x30EugxmzPaNX3CVifcbT2x17P8EMPK4Q=;
 b=OJ1oXUBsNvs1QaiH94kSEsBP9k/bQs/xI5epwlKnyd7x1Yjb8/OlrhLaBUZa14U7gk3yggh2Tq4s/Wd5VlLhj+q/Fo7dKlRfoFQ1akqMYxSDlvDrG0BbwJ0cNd9RHk3qAW0kah7yVkaGIFWGSiowzZNcfRkIcvjbNX0z3IVOlGg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <7fb49337-e1df-41fe-abba-6b2104094a68@amd.com>
Date: Wed, 2 Apr 2025 10:34:33 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen: Change xen-acpi-processor dom0 dependency
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Oleksandr Tyshchenko
	<oleksandr_tyshchenko@epam.com>
CC: Penny Zheng <penny.zheng@amd.com>, Jan Beulich <jbeulich@suse.com>,
	<xen-devel@lists.xenproject.org>, <linux-kernel@vger.kernel.org>
References: <20250331172913.51240-1-jason.andryuk@amd.com>
 <a6977caf-ce0e-4002-8df5-26cb0bdc88d7@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <a6977caf-ce0e-4002-8df5-26cb0bdc88d7@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989E8:EE_|CH3PR12MB7761:EE_
X-MS-Office365-Filtering-Correlation-Id: 7664e9cd-bc4b-41f7-31e1-08dd71f37f92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RTBaaHFyV1kzaSs1cDRmZ096NzYwKytQZ1BmaUtKZU1BV3YyaGNucUNRdWtr?=
 =?utf-8?B?eTdBREt5QkhKelpuaWYrek9rbUMwMmNjUUwyRCs3Qi9HRTlMTENHOU1GbDVG?=
 =?utf-8?B?TzFIa1p5WURUYzBBTzFpclFzNFZhaG50Q0RyQm5VbythRldNUWFwTG5YYWZN?=
 =?utf-8?B?UjAzVEx6VENyaUl5VmdwNTVLRGRnaDd1Q01aUDRNNHdKUURteTB3TmJKL3Rw?=
 =?utf-8?B?L3FQY04zbGhiK3BrZXc2RTRpbzM0cVNRclNQcmVxK2UzTWF2TWZsMjZqbEVs?=
 =?utf-8?B?bW91bHdDelhaZXRYenhQWmZJSjRkRHVEai8zb1NFSis0Vk91T1U0cHlWeW5h?=
 =?utf-8?B?aHFkV1RCcXhLdjBxblBBMDYyb3dpL2VjNS9BR0Z0elVBdW1Kc255YUorZTFF?=
 =?utf-8?B?MUVNRXJuWUhFRmtqNld4a0NRTlhwYUNtNzhZRmF2T2Q5bzZYZTF5Z2l1SFZl?=
 =?utf-8?B?OHZXYWZ4SWNEQVZFSVFHMVVjZmxlbWtlWWZuS25vcXdQaVhiYjFKaGxSaGZH?=
 =?utf-8?B?RTk3T2psMUZCUlVuamIxaFBvdVVNUGdIT2dPOFp1QlhhQm5ZcUU5VVBkbitT?=
 =?utf-8?B?UnRMZjFVNUhzVHZrUnpKRnFtTGg1cGFhTmxuZU11T0NPUmRHSWZuaHhBT3Bm?=
 =?utf-8?B?YTFIYnlqaTVZNlZudzBPMEpUUCtxUmM1WlhkQWdaNFgvdk85allxb1FoLzg5?=
 =?utf-8?B?dTVWU0ZudDJvN3ZBSHdXSXFoeDU1ZWdVTWQvWWwySnQrNGFuYjQxNzEzYkRq?=
 =?utf-8?B?a05NcHVsMWFjeXJURXA4V0RTbzd1S1FzZm5oa3d0WVB3VGl0c1B3MFBHTUdy?=
 =?utf-8?B?M2lQL1pwS3VEMFJiSVkyVHZ5a3NrUWs2QjVTZHlTN3F5cjZnb1dlNTZsZEU1?=
 =?utf-8?B?ano4Ui9LdHFydnRnSm5IeVQwT2lObU5iRHNUVXE1aURBUHNPR1pYdmJ5WUQx?=
 =?utf-8?B?Yzl5aUtKeHN4L3YxY0VKUzhKdlNhU29QUTdxVGlaeHJMajd3V0pFaDdNZ1ZW?=
 =?utf-8?B?Snl5VVg5VVdqNkZHNDlMek9hYXR2MURrbTlPK3hIbUg4RUFRdm02YkMyNlVk?=
 =?utf-8?B?UWw4OGN1czhBM2VpNnVkdzdjMkozNGhyZmphUXdNUjlBczRFSUFzVjNGYjUy?=
 =?utf-8?B?MFZXVHdSdllJRlhyandESWQ4SlNYOUFSRGxIWFVqWUUyNkduVVpOMDZBdkJZ?=
 =?utf-8?B?RE8xMU8wcWl1b2Jtd3RnTUlvUEdVQXZTMEFJd1ltYng4ajI4UDhRaGxvR3Yz?=
 =?utf-8?B?UVR2R2NwNlNoaG5oeEhaanhVNnIyYmZsek5ESUV4enY0cTJ1Zytkd2pjT2ZF?=
 =?utf-8?B?Uit1U1pnVVBoeVB3OVVwY3d1UEpFbGVDZjBXT1Z5K1pCRHVvSHFwQmExampH?=
 =?utf-8?B?UTYxTkQ5aTJzeklLaDdES1Q4SS90eTJaVDZvMVJNRlhuaitYbDRSa3BTdHZw?=
 =?utf-8?B?cHVxYmNnY1AyWDIrZ0d6YmV1L3Fad21tMnZFbHl2a3NZT1ZBQlZ3REtUbi81?=
 =?utf-8?B?Y21FKzJuc2JLVWNsK0EzTzViOUJ6Ymxwb1VXamFpc2VJaXhuTDQxbFlKRWxW?=
 =?utf-8?B?em85MlFzR2lzS1BlWFpRemZsVVc0akhRdnUyNHFOdmd6WlZCR2puN0ZVN3JB?=
 =?utf-8?B?TVNGQXRuL1UvVWMwVFVyVnJXNCthTXhma2NRMFdIQW9LYmlWZ21jRzAwQ1JH?=
 =?utf-8?B?bzlPRENnMHVZUFpGdkh6SC9tcllFQ2RoYjNvNlN4bGgvU3pBK1ArejlHNDJw?=
 =?utf-8?B?dHMwNHdJczZiSjhqSmY5cVZWQVBneWFBNHBmdFBsNFRsaGxCLzhkMVFnMUQr?=
 =?utf-8?B?TGZqVDY2aW5tQzVGL3FuU09aQjV2cTI4TStJTDJjVWR4VVh0T095QkN1M1Bl?=
 =?utf-8?B?VEVVazNoeHMydG11UjB0SWQxeGJHY2gxNTZBc1VIaEtjZklmS3oyTXRqUm1l?=
 =?utf-8?B?U1hqUUpNeTNYNE5EV3FyQ3VWRGRGSzlPTVpZeGtuRmhPT1NqNE1KVlNtcnFK?=
 =?utf-8?B?MFZaM2RpSEVnPT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2025 14:34:38.6195
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7664e9cd-bc4b-41f7-31e1-08dd71f37f92
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000989E8.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7761

On 2025-04-02 10:24, Jürgen Groß wrote:
> On 31.03.25 19:29, Jason Andryuk wrote:
>> xen-acpi-processor functions under a PVH dom0 with only a
>> xen_initial_domain() runtime check.  Change the Kconfig dependency from
>> PV dom0 to generic dom0 to reflect that.
>>
>> Suggested-by: Jan Beulich <jbeulich@suse.com>
>> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
>> ---
>>   drivers/xen/Kconfig | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/xen/Kconfig b/drivers/xen/Kconfig
>> index f7d6f47971fd..24f485827e03 100644
>> --- a/drivers/xen/Kconfig
>> +++ b/drivers/xen/Kconfig
>> @@ -278,7 +278,7 @@ config XEN_PRIVCMD_EVENTFD
>>   config XEN_ACPI_PROCESSOR
>>       tristate "Xen ACPI processor"
>> -    depends on XEN && XEN_PV_DOM0 && X86 && ACPI_PROCESSOR && CPU_FREQ
>> +    depends on XEN && XEN_DOM0 && X86 && ACPI_PROCESSOR && CPU_FREQ
>>       default m
>>       help
>>         This ACPI processor uploads Power Management information to 
>> the Xen
> 
> Assuming that all needed hypercalls are fine for PVH dom0:

It's platform_op XENPF_set_processor_pminfo and XENPF_get_cpuinfo.  Xen 
doesn't check if the caller is PV or PVH.

> Reviewed-by: Juergen Gross <jgross@suse.com>

Thanks, Juergen.

-Jason

