Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 884ED7ABDA6
	for <lists+xen-devel@lfdr.de>; Sat, 23 Sep 2023 06:05:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.607055.945217 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjtsA-0008AS-Ih; Sat, 23 Sep 2023 04:04:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 607055.945217; Sat, 23 Sep 2023 04:04:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjtsA-00087q-FJ; Sat, 23 Sep 2023 04:04:02 +0000
Received: by outflank-mailman (input) for mailman id 607055;
 Sat, 23 Sep 2023 04:04:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=G62g=FH=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1qjts8-00087T-Ic
 for xen-devel@lists.xenproject.org; Sat, 23 Sep 2023 04:04:00 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20611.outbound.protection.outlook.com
 [2a01:111:f400:7eab::611])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 36c4162c-59c6-11ee-9b0d-b553b5be7939;
 Sat, 23 Sep 2023 06:03:56 +0200 (CEST)
Received: from BL0PR01CA0027.prod.exchangelabs.com (2603:10b6:208:71::40) by
 IA1PR12MB6041.namprd12.prod.outlook.com (2603:10b6:208:3d7::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.20; Sat, 23 Sep
 2023 04:03:51 +0000
Received: from BL6PEPF0001AB57.namprd02.prod.outlook.com
 (2603:10b6:208:71:cafe::b6) by BL0PR01CA0027.outlook.office365.com
 (2603:10b6:208:71::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27 via Frontend
 Transport; Sat, 23 Sep 2023 04:03:51 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB57.mail.protection.outlook.com (10.167.241.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.14 via Frontend Transport; Sat, 23 Sep 2023 04:03:51 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 22 Sep
 2023 23:03:50 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 22 Sep
 2023 21:03:50 -0700
Received: from [172.20.57.36] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Fri, 22 Sep 2023 23:03:49 -0500
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
X-Inumbo-ID: 36c4162c-59c6-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TpKIv0CDU4gZY1ug/auUWfsskCGdo1+wKsOFnBGg5Z2Z7HqtiQcOVl9/WtUqH51SA0IwfF10nllIvRFRFQCy5qlXdqn1cog7N/FX4V6qhmws746rQWyB/GlByqFIYB9ghAZIwA8Qw1P7jcNwo3PAQy9UdejAIPUEKqWBxLiftDjJ4FfJ5F5cxKUCpEKRUCk323ge6xwNkAQ+NddXr9Lif45FYJocBKZrZ5pZAhgg5dh8wfYwvA7ewnjKKBC1198GUf0T6rOPJC7N9dYgVLCoSMiv2OmWgxu7gHLIjy39mw/MkR5RCKxo6HeYrFiyJMXXcCBxNrIxjxNQ1Xc3peJSpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uhJ9mv2GtQZkZ2XmzWL3ze2qspnu63HLT8yoCR4bA78=;
 b=P4PM4KGXlCqFtsEXywd6iCwchJQ2OzLStsr9jDL7uXYhdj1d20Cju6QG0TWjn+yW+j+zaC/owZa/2iIOq6uA176Z5H9ZZ/TICr45E2/eEd7gfvYHXmEOGcpu4C1nTSxQFUmevVAfAYoj9erWd5wkWzL84dOJgCaFA7muSfMtlZEuGoWt02IWobK4hinNXZT0DWtO43fWGnWLBNsZTrb95b1sz6pJuMmuM+obStL8G6opPG+t8vonfRQyf8IUGQUu46Sj8zPZUt9h6vrcNeKjsuiDueGyJL0l6y/VUO+zdX3vxj9mJ7RFZtNlDQFP5DiR6m4UWLPLmzZEcUZK4QFOkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=epam.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uhJ9mv2GtQZkZ2XmzWL3ze2qspnu63HLT8yoCR4bA78=;
 b=CDdNdKAxwQpAlM3QN2xHtJwWXqBHrNQvTCzogZ9/kBXVJAcRDe19UWpMr4+u+davy8WvPKkSuKrf8H9FcROVrnVVqaA83Hu0j4/xTftRS8r/EJ/z+H5DooJLg6zjeYRDRBePFd8ZGuDWHGrF8G2ync3d1kq4Y948EVmz1Z51BJs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <e86a081b-586f-3f89-5103-b21f02c164d4@amd.com>
Date: Sat, 23 Sep 2023 00:03:45 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2] ARM: GICv3 ITS: flush caches for newly allocated ITT
Content-Language: en-US
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>
References: <20230922222710.1383808-1-volodymyr_babchuk@epam.com>
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <20230922222710.1383808-1-volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB57:EE_|IA1PR12MB6041:EE_
X-MS-Office365-Filtering-Correlation-Id: 09c1b70f-f1c5-4933-6a93-08dbbbea18a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lwY8PL2Hf3Pnl5n5niJOnZDXrNCni7NTuWupzrrNM39w8xkfXJU4VpNvxUHykAdfd0CHktVnEGE+7IC8Q/HNAI7YqoIlOlXIs0DnNW7x8fKyOjw45HMRid5fVw8FNwvDw1UdNhyJCUbTvcRo/szn/FrGzXvdnX0ebX27On/tL1pDyzy9pzWlO6F2j1IWxU9eiIEsGLRAKQNA6GrLG4d5gJ/mdMEmgidxSoDj6NNJgVGc8pSPPyuy12QDnTMVodXmwxHYQw8IUKq3DtVTrw/iVIr7HT2wj9317qT2l0HppynWpgZoffq0jTkhoFfefExVBRiwGIJeDof8ThgGAd+UbHspjJddVjGPKG6vKJ/9vMzx/wMprLT4bUlFaX0vrFjVXz77gdXLZONTzCO409WTD28pV+trvnbfVVSxCeZNQAy5FLs+4/dcHT3niV18dChQDKFTTc/bHokZTODdjiA4N6Q9hZrHfvijF6BglrWq0x4hIA3cYtO+b7w0MuFWVlbDOOxOmoEreyq+J4Lar241pHBZPTWfB2a1X8nxBq5+tCBBsYapcsfutFFh3z9Eswnvr1UIjRxTlQZcwdw1lqDQrBptQYaxjJGgIYgqJ3Owt1OoNUO62FnK4/2UbKvLqFbSXG8dgY2sXJLM5nQcbNNPfyI9hGrmTDeZ75wHzOabtwivHM+7m+64yEm/3RddA3LxKikyJkv79mKvuA/qGByG+f6zfzRd+kZi69zu5taK1r20bSJScT06RZRdtSuJX6lP2WPssDYRwQO0dvwwQRTTjwKVu+xkBbEX36uCPtsyH06ayVqgCPro7xmJHM3Bwv5j
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(136003)(396003)(39860400002)(346002)(230922051799003)(451199024)(186009)(82310400011)(1800799009)(36840700001)(40470700004)(46966006)(86362001)(31696002)(2616005)(6666004)(53546011)(31686004)(40480700001)(2906002)(36756003)(40460700003)(82740400003)(356005)(336012)(70586007)(83380400001)(316002)(16576012)(110136005)(26005)(47076005)(70206006)(36860700001)(81166007)(426003)(478600001)(4326008)(5660300002)(54906003)(44832011)(8676002)(8936002)(41300700001)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2023 04:03:51.2783
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 09c1b70f-f1c5-4933-6a93-08dbbbea18a2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB57.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6041

On 9/22/23 18:27, Volodymyr Babchuk wrote:
> ITS manages Device Tables and Interrupt Translation Tables on its own,
> so generally we are not interested in maintaining any coherence with
> CPU's view of those memory regions, except one case: ITS requires that
> Interrupt Translation Tables should be initialized with
> zeroes. Existing code already does this, but it does not cleans
> caches afterwards. This means that ITS may see un-initialized ITT and
> CPU can overwrite portions of ITT later, when it finally decides to
> flush caches. Visible effect of this issue that there are not
> interrupts delivered from a device.
> 
> Fix this by calling clean_and_invalidate_dcache_va_range() for newly
> allocated ITT.
> 
> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

Tested-by: Stewart Hildebrand <stewart.hildebrand@amd.com>

> 
> ---
> 
> Changes since v1:
>  - Use clean_and_invalidate_dcache_va_range() instead of
>    clean_dcache_va_range()
>  - Do this unconditionally
>  - Do not rename  HOST_ITS_FLUSH_CMD_QUEUE into HOST_ITS_FLUSH_BUFFERS
> ---
>  xen/arch/arm/gic-v3-its.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/xen/arch/arm/gic-v3-its.c b/xen/arch/arm/gic-v3-its.c
> index 3aa4edda10..8afcd9783b 100644
> --- a/xen/arch/arm/gic-v3-its.c
> +++ b/xen/arch/arm/gic-v3-its.c
> @@ -685,6 +685,9 @@ int gicv3_its_map_guest_device(struct domain *d,
>      if ( !itt_addr )
>          goto out_unlock;
> 
> +    clean_and_invalidate_dcache_va_range(itt_addr,
> +                                         nr_events * hw_its->itte_size);
> +
>      dev = xzalloc(struct its_device);
>      if ( !dev )
>          goto out_unlock;
> --
> 2.42.0

