Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65D2B7F0C80
	for <lists+xen-devel@lfdr.de>; Mon, 20 Nov 2023 08:08:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.636435.991927 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r4yNW-0005iM-Id; Mon, 20 Nov 2023 07:07:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 636435.991927; Mon, 20 Nov 2023 07:07:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r4yNW-0005gW-G4; Mon, 20 Nov 2023 07:07:30 +0000
Received: by outflank-mailman (input) for mailman id 636435;
 Mon, 20 Nov 2023 07:07:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F3F/=HB=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1r4yNV-0005g7-DG
 for xen-devel@lists.xenproject.org; Mon, 20 Nov 2023 07:07:29 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20607.outbound.protection.outlook.com
 [2a01:111:f400:fe59::607])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7334a343-8773-11ee-9b0e-b553b5be7939;
 Mon, 20 Nov 2023 08:07:22 +0100 (CET)
Received: from MW4PR04CA0140.namprd04.prod.outlook.com (2603:10b6:303:84::25)
 by DS7PR12MB5935.namprd12.prod.outlook.com (2603:10b6:8:7e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.27; Mon, 20 Nov
 2023 07:07:18 +0000
Received: from CO1PEPF000042AA.namprd03.prod.outlook.com
 (2603:10b6:303:84:cafe::b0) by MW4PR04CA0140.outlook.office365.com
 (2603:10b6:303:84::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.26 via Frontend
 Transport; Mon, 20 Nov 2023 07:07:18 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000042AA.mail.protection.outlook.com (10.167.243.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7025.12 via Frontend Transport; Mon, 20 Nov 2023 07:07:17 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Mon, 20 Nov
 2023 01:07:15 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Mon, 20 Nov
 2023 01:07:14 -0600
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Mon, 20 Nov 2023 01:07:13 -0600
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
X-Inumbo-ID: 7334a343-8773-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kpQDOhKojxeJailGZTn2hUTMcHcWX8k7EAIBWuVbd54g29OQTvEPTE4sfVYlSNMO/6mtJPKbmo4kodf490PkQf9n07/1rxTiUqnQ73Kk1elIAmcReBugVegKkSxHGcgakwxUCPA67vHRWObDNv4hgz/2eSwFkr6vDXx0NFGK4QcpvHL53hyGP7GYi/YAI+HdWCt7XNzPoZv5V2ucblFn7JZdNJcUolEzvPF16w3IGl4KnPEEhB1R/qeq7pQFveE9iydPGZrHl0yavs4GS61ZSvNFOMoWtrWYFwz3P8Sfl+zVL9G2wOmygQL5or5CFoM+HbUbYWQ4vlD1jDYm2Sz5fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BYh1IDibsWIqHo7v72+Jzf4DCElzE2X9QKGgnPPDBjI=;
 b=k7SzM7zErTI/bdT/wgR+00hVROcq+J19MayCAApmAVe3pQwe84muEPfko/8y/hbFOejqOo4SfeDK1VyRjfmn/D8NnMkkThWAZiqPh6s3CZZXA6nWYNAChr9kIFTGTp7gIc1NYpAf1XDw7F1BZPnWOjar8vDn/Qui9ZW1s24TOmhvENQr/mmZxWv/sgHcVb78r5HeHvkTFRyfvFFi5Hddw5/zTme9bbtjKt39IIlsTeECJ0fF+2DcA9PJU4a4pG/NLyrcNy899YXlUuWDbwKL1E/tMzPSz+1BPWh44khGHvet6k0BOsTnkPJ7TqZkbjcOwkz+zZReqYBrJc71XU/GGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BYh1IDibsWIqHo7v72+Jzf4DCElzE2X9QKGgnPPDBjI=;
 b=NyPsfgvZV6wI5oJRMn1yKigyYZ1gAxEY1/1fq4SfzT6JNEVo6QtJeQf+fcUJcGqZ7ysAp2Yc5+QQjx6vgJD73VYXrCafkK154AbxPcPt2Ibbxw6nXGuMOf2aim+R8IOFxyxAUJ/UXydwcNxkC0y2/6QJAdXBaDVU7ig1r+xrxW8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <bf4b9899-8efe-4270-b1d6-afb29e76d907@amd.com>
Date: Mon, 20 Nov 2023 08:07:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN v4 1/2] xen/arm32: head: Introduce
 enable_{boot,secondary}_cpu_mm()
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
	<xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefano.stabellini@amd.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<jgrall@amazon.com>, <henry.wang@arm.com>
References: <20231117153101.2902792-1-ayan.kumar.halder@amd.com>
 <20231117153101.2902792-2-ayan.kumar.halder@amd.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20231117153101.2902792-2-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AA:EE_|DS7PR12MB5935:EE_
X-MS-Office365-Filtering-Correlation-Id: e7cbb7ec-5f8e-4a12-c407-08dbe99754d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gqNy6vRpjRu6px96lIlnCU0t5BcxnjFLx5VB+WP8H18Dmhv4JdtsZ6yHbqYy23KxyMlp9n2faezdW9zuxXQvXbXQaQztw07+PrwvEIc8LJNpi9jzhNQOhPYgBuoqxYbPDe5Awa02Iu5Mg0gUiMjfAc2yxlCPhB3csh8qjRpJYHX+LNfF6t73IZLmMSDXpid1Hr0pOpj8jxnkzGh17UUBRf2pVmOOZMUcipnCdRQTAyfNv6FG+JKNcmBUOnUwbYMqWT2a5nBcLuIwd2WpwIj5EvPxnISoO0huIX4rcvqPLp4rDwP8q+lH7Oi81JTUIkrY8X0t7ICimYkE7W1UaqEDg2ltrm+fQeTo37KomT5g+0J37FXIio2JVJkfIGsyhubMfYyfhty3KNzFJJpVLVOw9XxTS5sg8fhOTtwD8oGBcRe7mFPKAZTUaFTdr8kScFxsQdwFT5myUemNF1ubjAl48wGksknqaA85euniJ2HcfXB3zKRxY6hZntZbnf4bD+WnBEQfxbUwEIeaLlN9a4I9T5IdC7mnWv8biK8r1ffTHdsYUyn9yAQc9EKXfAHmwWcB7Tw9Qs9qzptelqTXg23JwLyRvq/liwqNa7ScRlGj1jDGkR/+QWg4tDbu0onv7Xd1tbSsQ951qD+2yV/HzKZB11fUVsBxX4lshI4xjEGGtpPM1z48pNsbuh9CLbIDK/CQupu27PLN3jn+xEZV8FZtCeCCIX1SQkAR5wkyjy6/AYTUzJ8Vh2Vva2kp5YpY4Whv8e2uJRV7AhfAemZnXf420RmpceUC4zhjJqm7gNsPD4zAqwOlMxPH+kDInHso0jrj
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(346002)(136003)(376002)(396003)(230922051799003)(82310400011)(451199024)(64100799003)(1800799012)(186009)(46966006)(36840700001)(40470700004)(41300700001)(36756003)(40460700003)(2906002)(31696002)(44832011)(86362001)(5660300002)(81166007)(47076005)(40480700001)(356005)(2616005)(26005)(478600001)(83380400001)(336012)(426003)(82740400003)(8936002)(8676002)(4326008)(6666004)(316002)(53546011)(70206006)(54906003)(70586007)(16576012)(31686004)(110136005)(36860700001)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2023 07:07:17.1870
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e7cbb7ec-5f8e-4a12-c407-08dbe99754d4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000042AA.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5935

Hi Ayan,

On 17/11/2023 16:31, Ayan Kumar Halder wrote:
> All the MMU related functionality have been clubbed together in
> enable_boot_cpu_mm() for booting primary cpu and enable_secondary_cpu_mm() for
> booting secondary cpus.
> This is done in preparation for moving the code related to MMU in MMU specific
> file and in order to support non MMU cpus in future.
> 
> This is based on d2f8df5b3ede ("xen/arm64: head.S: Introduce enable_{boot,secondary}_cpu_mm()").
> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>
> Acked-by: Julien Grall <jgrall@amazon.com>
> ---
> 
> Changes from :-
> 
> v1 - 1. Added a proper commit message.
> 2. Some style and other fixes suggested in v1. 
> 
> v2 - 1. Updated the comment on top of enable_boot_cpu_mm() and
> enable_secondary_cpu_mm() ie mentioned the input and output registers.
> 2. Updated the comment inside enable_boot_cpu_mm().
> 
> v3 - 1. No changes.
> 
>  xen/arch/arm/arm32/head.S | 102 ++++++++++++++++++++++++++++++--------
>  1 file changed, 80 insertions(+), 22 deletions(-)
> 
[...]

> +
> +/*
> + * Enable mm (turn on the data cache and the MMU) for the boot CPU.
> + * The function will return to the virtual address provided in LR (e.g. the
> + * runtime mapping).
> + *
> + * Inputs:
> + *   r9 : paddr(start)
> + *   r10: phys offset
> + *   lr : Virtual address to return to.
> + *
> + * Output:
> + *   r12: Was a temporary mapping created?
> + *
> + * Clobbers r0 - r6
> + */
> +enable_boot_cpu_mm:
> +        mov   r6, lr
> +
> +        bl    create_page_tables
> +
> +        /* Address in the runtime mapping to jump to after the MMU is enabled */
> +        mov_w lr, 1f
> +        b     enable_mmu
> +1:
> +        /*
> +         * Prepare the fixmap. The function will return to the virtual address
> +         * requested by the caller.
> +         */
It seems like you did not handle my remark from v3. This comment should be moved above branch
to setup_fixmap.

> +        mov   lr, r6
> +
> +        b     setup_fixmap
> +ENDPROC(enable_boot_cpu_mm)
> +
>  /*
>   * Remove the 1:1 map from the page-tables. It is not easy to keep track
>   * where the 1:1 map was mapped, so we will look for the top-level entry


~Michal

