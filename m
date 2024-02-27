Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45815869288
	for <lists+xen-devel@lfdr.de>; Tue, 27 Feb 2024 14:36:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.686185.1067890 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rexcv-0006cB-18; Tue, 27 Feb 2024 13:36:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 686185.1067890; Tue, 27 Feb 2024 13:36:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rexcu-0006Zd-Tn; Tue, 27 Feb 2024 13:36:08 +0000
Received: by outflank-mailman (input) for mailman id 686185;
 Tue, 27 Feb 2024 13:36:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fto1=KE=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1rexct-0006ZX-CN
 for xen-devel@lists.xenproject.org; Tue, 27 Feb 2024 13:36:07 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20601.outbound.protection.outlook.com
 [2a01:111:f403:2417::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 26cda1ba-d575-11ee-afd6-a90da7624cb6;
 Tue, 27 Feb 2024 14:36:04 +0100 (CET)
Received: from BN0PR02CA0004.namprd02.prod.outlook.com (2603:10b6:408:e4::9)
 by DS7PR12MB6288.namprd12.prod.outlook.com (2603:10b6:8:93::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7316.36; Tue, 27 Feb 2024 13:36:01 +0000
Received: from BN1PEPF0000468B.namprd05.prod.outlook.com
 (2603:10b6:408:e4:cafe::9f) by BN0PR02CA0004.outlook.office365.com
 (2603:10b6:408:e4::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.50 via Frontend
 Transport; Tue, 27 Feb 2024 13:36:00 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN1PEPF0000468B.mail.protection.outlook.com (10.167.243.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Tue, 27 Feb 2024 13:36:00 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 27 Feb
 2024 07:36:00 -0600
Received: from [172.31.100.92] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Tue, 27 Feb 2024 07:35:57 -0600
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
X-Inumbo-ID: 26cda1ba-d575-11ee-afd6-a90da7624cb6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hIOhsWxuaW5JvRh8Bfubdk3s3KP+ONk6cOvYRDrEcEWG8prmJPIlqQCKc4wp5UrHJ4U50L++zBfAEZUcJTHVkTM/6lPyj0q/FV17R50UWdmzbdnRxD0C2p0nSEF3biMTB5GVaCQTtMIE+GWX0VZvQkIqLIhQGLPggwldC9ddD21e1IrrmldNKFhR3R7WRVwlXeg3eMGFYVS3k7JIfyIW3mc99TfqAoYFzKuHyHD837oQ9VcrHHHj5DWKKlr64/nmok1If7dbN8X/RcDs2jxork5CzR4Ot6KExKBFJt0susL0KfzjxeQRhekuEq22bK4i6Q7K/pintt5emi0+V/Hwtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zSQk1YnS2Ht4wfo1Q19hBrTpkLntDCtVYNW8+lCGlPA=;
 b=fS6ddMSZUW48YXNdQIzdcGf575I9qCqWh/s1Or+RoOhzQxFTUiTcHITNlfDPqpPIJZoeSCvPCeO6ZyU2uXKUdAZjafzAiWNmHtNBmrs73ZlpCsNIvl7QrxiJvmTPSNHBDK19Jfrk0jIEZFHPNnNNCxuX9ERxVOX/VXjUCTv6ix5z2NMeJVWsXUb7sREDvqxSh1sY9J5aENuStggq1EM2ZpxpJvy4a6Npe0KyKaY+rm2nDB3oYcDh0dthAsSEteCmJ53jvB8YgTn15aCuSvsH8p2YHi5E4Qm/A8iTtPWpuXdUAjLRcjAYo+dVppjVK2eS8upMGpxVlrR2ssp6/krySg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zSQk1YnS2Ht4wfo1Q19hBrTpkLntDCtVYNW8+lCGlPA=;
 b=Jq2X5PgAioO1nQx/qYMS4LEqmjRcQKAZf/XR+0gBII7HzMkL7vLys/50D4aaC30nNJ5ul5wU5lJ09QiFa2ZMdeFTYxspK81RhAUfJGVrXANXnWY6yUOJLczwXK8T27HgnvG6ijLsRPzD5nDt5rntV6VSBoOtNRM8411JkgQKO40=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <ca749e1e-569e-4d7d-8009-63a9469d3ffd@amd.com>
Date: Tue, 27 Feb 2024 21:35:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/common: Do not allocate magic pages 1:1 for direct
 mapped domains
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
CC: Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross
	<jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	"Michal Orzel" <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Alec Kwapis <alec.kwapis@medtronic.com>,
	<xen-devel@lists.xenproject.org>
References: <20240226011935.169462-1-xin.wang2@amd.com>
 <b41daccb-d402-4da8-bc88-933facd088a8@suse.com>
 <c3edf84d-3177-4125-bdd6-ba99190340a3@amd.com>
 <23dc102e-e827-4f1e-876d-76a7df4c4927@suse.com>
From: Henry Wang <xin.wang2@amd.com>
In-Reply-To: <23dc102e-e827-4f1e-876d-76a7df4c4927@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: xin.wang2@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0000468B:EE_|DS7PR12MB6288:EE_
X-MS-Office365-Filtering-Correlation-Id: bbc0fff0-87e8-4a75-f8c1-08dc37990980
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yhBM9GpSEmjS6lv/8rTR7i8p8qqxlOGi7wANJeAO7ZUtvEyHplbuD+IYzGnX4eWVrUc6CDpxtUifdG5765vPVEW4DkHT4ReaLalxRkmHftkq8i/x+/yelX1rESvVDpB32tkNgU/bnoOXEfPOs+Z6N530BjRAO8ky6gqGJsWSulfvLSNnWgBnyZ86iYh7d+4nsubSF6X2djX/Rz9RqKF1LrDjkZzyicrdLyEkKm/ADP3PjKavl0o9G93mz62Z9+5XvSW/wLqAbIprUGLapKPGyCCWnGMDSiR/uJWTBHxh5AYZ/4FI/FeJ/6lIlpHwCR8jsdzhdQ/jst0HVcT27jD8EEeRjjmUpAalTWcnGUxEPbivSf+L0v4MRtndqQLjwfz1FT3EeSbtICAe4i9fNQUwG7JcXw/hAK54yFY1VEA1ZdlaXIYahbm33ClviHgtSfXYONzl6Pb9KhD7e2fbz96ef09cG0eOljrXb8KNfmSruxu681fnZUfmAbgN5qvmBatUmyX5vM139H9Msw8bUCavlv/oE8Geq3o+cZA+bNKh/LTiJxcEf8SDw/P1bkzelu3azDHtp2VMIBHXaHVbJZEwfXtLG5S4MducBP4FsKm3sPdsADZJkjh1I3xW275LHwv8cepspP2GXmxPdnD+TDsyRmd1R3qFP0pyjeh64E2qsyG7D2TaXpSVvsGwatMJjbD+YSIweoy+zUvtvNBdVS4UpLa9Kz2gWCMra+px4axbPzHI277JBHEylPIVrTmISszH
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400014)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2024 13:36:00.8270
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bbc0fff0-87e8-4a75-f8c1-08dc37990980
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF0000468B.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6288

Hi Jan,

On 2/27/2024 9:27 PM, Jan Beulich wrote:
> On 27.02.2024 14:24, Henry Wang wrote:
>> On 2/26/2024 4:25 PM, Jan Beulich wrote:
>>> On 26.02.2024 02:19, Henry Wang wrote:
>>>> --- a/xen/common/memory.c
>>>> +++ b/xen/common/memory.c
>>>> @@ -219,7 +219,7 @@ static void populate_physmap(struct memop_args *a)
>>>>            }
>>>>            else
>>>>            {
>>>> -            if ( is_domain_direct_mapped(d) )
>>>> +            if ( is_domain_direct_mapped(d) && !is_magic_gpfn(gpfn) )
>>>>                {
>>>>                    mfn = _mfn(gpfn);
>>>>    
>>> I wonder whether is_domain_direct_mapped() shouldn't either be cloned
>>> into e.g. is_gfn_direct_mapped(d, gfn), or be adjusted in-place to gain
>>> such a (then optional) 2nd parameter. (Of course there again shouldn't be
>>> a need for every domain to define a stub is_domain_direct_mapped() - if
>>> not defined by an arch header, the stub can be supplied in a single
>>> central place.)
>> Same here, it looks like you prefer the centralized
>> is_domain_direct_mapped() now, as we are having more archs. I can do the
>> clean-up when sending v2. Just out of curiosity, do you think it is a
>> good practice to place the is_domain_direct_mapped() implementation in
>> xen/domain.h with proper arch #ifdefs?
> arch #ifdefs? I'd like to avoid such, if at all possible. Generic fallbacks
> generally ought to key their conditionals to the very identifier not
> (already) being defined.

I meant something like this (as I saw CDF_directmap is currently gated 
in this way in xen/domain.h):

#ifdef CONFIG_ARM
#define is_domain_direct_mapped(d) ((d)->cdf & CDF_directmap)
#else
#define is_domain_direct_mapped(d) ((void)(d), 0)
#endif

I am having trouble to think of another way to keep the function in a 
centralized place while
avoiding the #ifdefs. Would you mind elaborating a bit? Thanks!

Kind regards,
Henry


> Jan


