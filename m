Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A5988B6C2
	for <lists+xen-devel@lfdr.de>; Tue, 26 Mar 2024 02:22:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.697909.1089157 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rovVE-0000Nn-Rf; Tue, 26 Mar 2024 01:21:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 697909.1089157; Tue, 26 Mar 2024 01:21:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rovVE-0000Lt-Oh; Tue, 26 Mar 2024 01:21:24 +0000
Received: by outflank-mailman (input) for mailman id 697909;
 Tue, 26 Mar 2024 01:21:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FkMi=LA=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1rovVD-0000Ln-LI
 for xen-devel@lists.xenproject.org; Tue, 26 Mar 2024 01:21:23 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20601.outbound.protection.outlook.com
 [2a01:111:f403:2414::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2707c99a-eb0f-11ee-a1ef-f123f15fe8a2;
 Tue, 26 Mar 2024 02:21:20 +0100 (CET)
Received: from BN9PR03CA0193.namprd03.prod.outlook.com (2603:10b6:408:f9::18)
 by PH7PR12MB9074.namprd12.prod.outlook.com (2603:10b6:510:2f4::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.31; Tue, 26 Mar
 2024 01:21:16 +0000
Received: from BN3PEPF0000B06D.namprd21.prod.outlook.com
 (2603:10b6:408:f9:cafe::1a) by BN9PR03CA0193.outlook.office365.com
 (2603:10b6:408:f9::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.13 via Frontend
 Transport; Tue, 26 Mar 2024 01:21:16 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B06D.mail.protection.outlook.com (10.167.243.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.0 via Frontend Transport; Tue, 26 Mar 2024 01:21:15 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 25 Mar
 2024 20:21:15 -0500
Received: from [10.65.148.173] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 25 Mar 2024 20:21:13 -0500
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
X-Inumbo-ID: 2707c99a-eb0f-11ee-a1ef-f123f15fe8a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FzBQVSc2HlodjdFf5ivch/0919EResrLKWfLwR1XPZS9UiN4nALXkMf7uU7nUf0SBZb3smrIeI2Aa0+/NA6vttQCFGpyIyHSfo2WwU0aqSeDU359Nfc1WZf+sZwTDJMnagajo8/krA2xvB8pQoX1gO3nrPTQCpZ9yYgNDwOQEkHIRJxbROe2wFQ97QfDNIhY/O7rD5Q+Sf3IDWANFOHy8uqoJp0iBPp95guXD+f9ohPBnUUlm2H4rFP3YYiHxU7k27kzgqIDUBuXRb3BBbxvf2eSj1a2ssNkodvgYKP73XjyhInrczppF5+9jAkOMyidqm7RelJBJEUIzTpIMXmA6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=56rv5jIdsX1029ySILFkHJT6Sgd+/aGmIVOaS3UsWYg=;
 b=Z0gPc+tyYECXTLGyDAkiooRkmLoKSUo33ZjJbY6ODmrPLUr8ZlSIAJMmFFqQDKjtQihblSY19LuNJ8cpAyHvt+nO7/5mMKmu1Q8h14SZuEq5II0sBYOmHfMbKPyNL2EX+xsc93eA93XI7SNmgFJl3YDZRCuahwh07vwGBBxT0VHTbOR4EG5Q0KlcY3RtAV7sq8dPT5WS3jAHusQZr8X+st/zPt5mL+rM2+qp0RLsl+nFD8cpSP2qp3lV/hBgRvkIEpbgHPPo36tevJrVkp/iDBlzvndS4PLW5LHB1wvyAZQvOPB+l8ja4452wWoaplXYX+qd4hSvr6CPpM1o2H/jWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=cloud.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=56rv5jIdsX1029ySILFkHJT6Sgd+/aGmIVOaS3UsWYg=;
 b=WQrzklNTkBcu0ZwubTROuZxnsrDw0JFJCAOwnx3FJNCvChNi7yexJKvML+CuDd64+y+SwMvm2q/XwAKNpYYkRWOJDO+0Ks9PnCbPRBHzXjERRBpACRalaDTsfezza6d7DgaAQi/VvkVsVBxIgzVEtnEndmx5cWVDQ3xa83nnXBc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <0518ae64-3139-4aaf-bbac-8e553481f4e4@amd.com>
Date: Tue, 26 Mar 2024 09:21:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] xen/memory, tools: Make init-dom0less consume
 XEN_DOMCTL_get_mem_map
To: Anthony PERARD <anthony.perard@cloud.com>
CC: <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Alec Kwapis <alec.kwapis@medtronic.com>
References: <20240308015435.4044339-1-xin.wang2@amd.com>
 <20240308015435.4044339-6-xin.wang2@amd.com>
 <9162a331-645c-4e45-b5d0-57c6b9b4f79b@perard>
Content-Language: en-US
From: Henry Wang <xin.wang2@amd.com>
In-Reply-To: <9162a331-645c-4e45-b5d0-57c6b9b4f79b@perard>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: xin.wang2@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06D:EE_|PH7PR12MB9074:EE_
X-MS-Office365-Filtering-Correlation-Id: a8658293-beb0-4bb4-50a1-08dc4d33085d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	k5gpcc2DW0KD2j3SuMsOtPgwRiSxslfn06YDH70M1+nKsDrNpHbqZExZpSmlvlyQGKATmehkFnjilMMQDluRUv/1S3BeadPJXHzBF1a1Zi+F+MhCPgyoh98DrPFaWdD5i9pF3V9Myfo/1DuiomptKBwFDOGTAYWWFZzg0ZVEd/M22axf1P9oGop9TgSoYfUWB1u/U9TD7QhSCTr4M8cI6LBso7Uz4p7JwNr7rLeLOz8/AVZ9DMeg5Dpjl2OUa13B3zscaHnnQn2T87HYpz0nLsCNYIHfo8NDTBqrT8yNZ24Q1V5lwxMFTtD6CL50N4p8G8ddZE1KVi7zMvm2mSliK5ob2vSDv2nusxnzNtPum2eprmoxhmgab8AZ/Et+l6qb1LV4+nSStiYpW4SQ8ZRq7Kv24lDS5HQ04JMwW/Bgr+aWRojIav828F7kiETOQnIs19yxFWyvwUHOoh5rz1JQ5b6FyZEAsRH8Asokfycc41SXTogIzHYGgKEH/m7tvFISCNjvMvLZOUjblz+dapKNopHLa4yR+TYEuCCPA1ZSwwoha+IWPEV/Z28U3nzMC/KXS/tVt5H/vy4ZtkbgIZ4FtqsFriV99JYA1+gQPSYTVnkChuXk3HycB17ZWssDPEcQdPNo5fCRk3c9EQUfLKoV03nTBA7ueNAdGdgmaWhlQaszzc+Re2KdpnsYAujcLR6AUaVtUeHCSBkyO352swFWeyLs1KmfEhsyS85mPyVrSlgiQsJbtt+Q5bN/oTMRPAHd
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(1800799015)(82310400014)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2024 01:21:15.8303
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a8658293-beb0-4bb4-50a1-08dc4d33085d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B06D.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9074

Hi Anthony,

On 3/25/2024 11:35 PM, Anthony PERARD wrote:
> On Fri, Mar 08, 2024 at 09:54:35AM +0800, Henry Wang wrote:
>> diff --git a/tools/helpers/init-dom0less.c b/tools/helpers/init-dom0less.c
>> index fee93459c4..92c612f6da 100644
>> --- a/tools/helpers/init-dom0less.c
>> +++ b/tools/helpers/init-dom0less.c
>> @@ -23,16 +23,30 @@ static int alloc_xs_page(struct xc_interface_core *xch,
>>                            libxl_dominfo *info,
>>                            uint64_t *xenstore_pfn)
>>   {
>> -    int rc;
>> -    const xen_pfn_t base = GUEST_MAGIC_BASE >> XC_PAGE_SHIFT;
>> -    xen_pfn_t p2m = (GUEST_MAGIC_BASE >> XC_PAGE_SHIFT) + XENSTORE_PFN_OFFSET;
>> +    int rc, i;
>> +    xen_pfn_t base = ((xen_pfn_t)-1);
>> +    xen_pfn_t p2m = ((xen_pfn_t)-1);
>> +    uint32_t nr_regions = XEN_MAX_MEM_REGIONS;
>> +    struct xen_mem_region mem_regions[XEN_MAX_MEM_REGIONS] = {0};
>> +
>> +    rc = xc_get_domain_mem_map(xch, info->domid, mem_regions, &nr_regions);
> Shouldn't you check the value of in `rc`?
Yes I should have done so. I will do that in the next version. Thanks! 
Kind regards, Henry

