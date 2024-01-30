Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87C5E841EFC
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jan 2024 10:14:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.673238.1047515 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rUkBj-0004Ek-Ko; Tue, 30 Jan 2024 09:13:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 673238.1047515; Tue, 30 Jan 2024 09:13:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rUkBj-0004Bq-Fq; Tue, 30 Jan 2024 09:13:51 +0000
Received: by outflank-mailman (input) for mailman id 673238;
 Tue, 30 Jan 2024 09:13:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Sght=JI=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1rUkBh-0003rb-7B
 for xen-devel@lists.xenproject.org; Tue, 30 Jan 2024 09:13:49 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20601.outbound.protection.outlook.com
 [2a01:111:f403:2009::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id def99500-bf4f-11ee-98f5-efadbce2ee36;
 Tue, 30 Jan 2024 10:13:46 +0100 (CET)
Received: from BN8PR12CA0027.namprd12.prod.outlook.com (2603:10b6:408:60::40)
 by BN9PR12MB5324.namprd12.prod.outlook.com (2603:10b6:408:105::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.34; Tue, 30 Jan
 2024 09:13:43 +0000
Received: from BN2PEPF000044AA.namprd04.prod.outlook.com
 (2603:10b6:408:60:cafe::7b) by BN8PR12CA0027.outlook.office365.com
 (2603:10b6:408:60::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.36 via Frontend
 Transport; Tue, 30 Jan 2024 09:13:43 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000044AA.mail.protection.outlook.com (10.167.243.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7249.19 via Frontend Transport; Tue, 30 Jan 2024 09:13:43 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Tue, 30 Jan
 2024 03:13:40 -0600
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Tue, 30 Jan 2024 03:13:38 -0600
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
X-Inumbo-ID: def99500-bf4f-11ee-98f5-efadbce2ee36
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OPu0Ox+xxeHR8fB42yv4LSJ+qheJSjCK5CSMI5MAo82PkOZvYxoxID9t/xopjki7OL2vjVXJPkZVbqHVMH9twJeR+LA7LFtetP5qmx2/d8ssuZEr0WnmdH3b3zsAaPmGTMhdlFiWRBgKeZZk0I5AXUtRFZ+5LEhFWI39KSnUVE6HqvCgeKMHPCh/LI5RQt2oSj562J1vC1ybN3zbVyLHpqwkofNHxf2iFfx826PWcA8eSdf/GesUoELeFxuYK1iFAxbAUkp3X2vWKtNTEyGNfl3PoZHxmuEW2b58im/OGAipZ10rdM8F7HjGxd4hU6S1m1ooRkTLE+ngPFS0CVFErA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M1tf0h5fDWJUu9J22LY4VQrraOHY8XbiKGDI1Z0h7fQ=;
 b=NI7OfFjrKNtqZR1Rq3Mhq1xLYEBOvFB2WwN6CBBxXGaCjIOU0KJnf61lzO5MjdQCtXemJsTfN5TOVql0+5CCaUimbNhA7f01TJ9U/iyQl5Z5EU6IS9YBlAnbFaXvBMqybbZzHKB9QatZEGO7jYkoOrnCwkbfE2xhdtIqmgjG3vAVbMMu3gQBPHfh5TGu4bBpn9HswnllPx/Wd3VmLuAL4bHTbrDy4hLfnMm4qbaAiyW3wqhSQEcBMXLXYo5VSc8s1olwQudroUp/056WL4ETkuidenJ4fHAoUxIeR6bLEcjsvkRqRY18j2b3oiDqLGyNmMwvtCYSM5E8me67UYm3GA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=minervasys.tech smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M1tf0h5fDWJUu9J22LY4VQrraOHY8XbiKGDI1Z0h7fQ=;
 b=2JhiDmkZOUmPTG1He4oy+ZhSFPjPDClRAGNn2fbJG1Rswzn+AK8y2WuFlUhF9BbFvaIasOQ/de8I2/p16b0+3OUn1trSekUyV321kZXnEvH6lq9Vw13klXNsegrw3lTe74CSfU0xduu84nEuA4UtFk7LzGUBTC7tzOCfRZ+16aE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <64ca5e49-54a0-4fec-9a37-71a83e373cad@amd.com>
Date: Tue, 30 Jan 2024 10:13:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 00/15] Arm cache coloring
To: Carlo Nonato <carlo.nonato@minervasys.tech>,
	<xen-devel@lists.xenproject.org>
CC: <andrea.bastoni@minervasys.tech>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>
References: <20240129171811.21382-1-carlo.nonato@minervasys.tech>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20240129171811.21382-1-carlo.nonato@minervasys.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044AA:EE_|BN9PR12MB5324:EE_
X-MS-Office365-Filtering-Correlation-Id: d217ea9b-8c5f-4c54-ffcc-08dc2173c1d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dwy3KATbwLtNfSx7N+9yHA/ABDO81jrK+FetKRvCOUpgvG0zaVd0nRfuBHYXOIop1mxp4cowMo5duD9Zg3zq2Wz6zri77QfI5HZKImhk6C8ZnbKYuMQJnyOIA5HzdqUxDjC1OOsq9OilPmOgH3KPOxLQgEFJ5tNLp51sQ61uQDp/C2AA8/vDxLHWgb20lliw73xgz9DxDr3RtAfzzA791zYwDrOR46lnaj0VbNzLxfP3iuuL8V4VgWQ+nNSkhafFT8lGcKswvUqiQUpkuK8KJ7Zoju9g+5WAxmTHGDnHGd77HO3r7QwSqW6ndMoLnjH8pDZwmVxgz3xPWzP6jOgw7asgem/WaOphccMEvc+67rfoOD0HcX2k0IEiDTyHAuwNCHQAHSWsyVF1bqej6knOMZyOLf/NprMBRegsaAibI0dF5z+uraFQq3WA2s39Ft2AKxkQ5UfEPPOb3nTv6CTbMDH4j6mnP0iKdZW3qGu6XNEvuVJq8dliMlJKJwzb6as3VP2LkAnfFVvrefpB7b6QbMShYbg+c0CMLDh/ZaOgv3FJj+Ms+fwF7pWTkRzEcqwkGf6hs7g3Ce9RdCvBz6KW90e5idCINIWnZT4XT4tUjsdHUcWE3ExFHGYPHxVz86LPGN1EhoOZtBbrAvQ9A6Nq+4Lk3wWnPceh9oGKzBqlcFSDuLKu9yc/05CuL748hONRkZAMF5rhfzKB3J4+aCR8twXBGJp8VkklnJFw2cIdsQ3bQBxj9hZWJ6RIjMhfcRVxAfK1UcR8UI+pOg0QjoZ3XSpvLk5EjZF2OASL1SXD91c=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(136003)(376002)(396003)(39860400002)(230922051799003)(64100799003)(451199024)(82310400011)(1800799012)(186009)(40470700004)(36840700001)(46966006)(2616005)(2906002)(36860700001)(47076005)(86362001)(8936002)(41300700001)(36756003)(83380400001)(478600001)(31696002)(81166007)(82740400003)(356005)(4326008)(426003)(110136005)(26005)(70586007)(316002)(54906003)(336012)(70206006)(966005)(16576012)(53546011)(5660300002)(7416002)(6666004)(8676002)(44832011)(40460700003)(40480700001)(31686004)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2024 09:13:43.6478
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d217ea9b-8c5f-4c54-ffcc-08dc2173c1d8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044AA.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5324

Hi Carlo,

On 29/01/2024 18:17, Carlo Nonato wrote:
> 
> 
> Shared caches in multi-core CPU architectures represent a problem for
> predictability of memory access latency. This jeopardizes applicability
> of many Arm platform in real-time critical and mixed-criticality
> scenarios. We introduce support for cache partitioning with page
> coloring, a transparent software technique that enables isolation
> between domains and Xen, and thus avoids cache interference.
> 
> When creating a domain, a simple syntax (e.g. `0-3` or `4-11`) allows
> the user to define assignments of cache partitions ids, called colors,
> where assigning different colors guarantees no mutual eviction on cache
> will ever happen. This instructs the Xen memory allocator to provide
> the i-th color assignee only with pages that maps to color i, i.e. that
> are indexed in the i-th cache partition.
> 
> The proposed implementation supports the dom0less feature.
> The proposed implementation doesn't support the static-mem feature.
> The solution has been tested in several scenarios, including Xilinx Zynq
> MPSoCs.
> 
> Open points:
> - Michal found some problem here
> https://patchew.org/Xen/20230123154735.74832-1-carlo.nonato@minervasys.tech/20230123154735.74832-4-carlo.nonato@minervasys.tech/#a7a06a26-ae79-402c-96a4-a1ebfe8b5862@amd.com
>   but I havent fully understood it. In the meantime I want to advance with v6,
>   so I hope we can continue the discussion here.
The problem is that when LLC coloring is enabled, you use allocate_memory() for hwdom, just like for any
other domain, so it will get assigned a VA range from a typical Xen guest memory map (i.e. GUEST_RAM{0,1}_{BASE,SIZE}).
This can result in memory conflicts given that the HW resources are mapped 1:1 to it (MMIO, reserved memory regions).
Instead, for hwdom we should use the host memory layout to prevent these conflicts. A good example is find_unallocated_memory().
You need to:
 - fetch available RAM,
 - remove reserved-memory regions,
 - report ranges (+aligning the base and skipping banks that are not reasonable big)
This will give you a list of memory regions you can then use to pass to allocate_bank_memory().
The problem, as always, is to determine the size of the first region so that is is sufficiently
large to keep kernel+dtb+initrd in relatively close proximity.

~Michal


