Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8712D68E256
	for <lists+xen-devel@lfdr.de>; Tue,  7 Feb 2023 21:56:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.491423.760502 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPUzs-0000kE-Ue; Tue, 07 Feb 2023 20:55:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 491423.760502; Tue, 07 Feb 2023 20:55:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPUzs-0000iO-Rg; Tue, 07 Feb 2023 20:55:24 +0000
Received: by outflank-mailman (input) for mailman id 491423;
 Tue, 07 Feb 2023 20:55:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9Z3Z=6D=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1pPUzr-0000iH-43
 for xen-devel@lists.xenproject.org; Tue, 07 Feb 2023 20:55:23 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20603.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::603])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b8067ca4-a729-11ed-93b5-47a8fe42b414;
 Tue, 07 Feb 2023 21:55:15 +0100 (CET)
Received: from DS7PR05CA0042.namprd05.prod.outlook.com (2603:10b6:8:2f::29) by
 SJ0PR12MB7007.namprd12.prod.outlook.com (2603:10b6:a03:486::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6064.36; Tue, 7 Feb 2023 20:55:12 +0000
Received: from DM6NAM11FT004.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:2f:cafe::3d) by DS7PR05CA0042.outlook.office365.com
 (2603:10b6:8:2f::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.12 via Frontend
 Transport; Tue, 7 Feb 2023 20:55:12 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT004.mail.protection.outlook.com (10.13.172.217) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6064.32 via Frontend Transport; Tue, 7 Feb 2023 20:55:11 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 7 Feb
 2023 14:55:11 -0600
Received: from [192.168.137.15] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 7 Feb 2023 14:55:09 -0600
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
X-Inumbo-ID: b8067ca4-a729-11ed-93b5-47a8fe42b414
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cYWQmr5YD3BqK6/FHIQS06uTeprD8eCYlujPdMb4xsNFCEwV1xkzV+Z1+p1oSDny+HtLNBAKvTGPYdP2qiQi1yuWYDLss0+KabsP6XAUcFq/8c6DM36Jxs4hWS5hcADsUKzYWeDzuu+Qx2AhXSjHi/JUVgNQEOKsooemGIfYBrcrqFxs4zqJYt9nrcDJPSniVlQACnHjwVNo8/DnfXkb0C/uCx/Vdiqw5JxMVFuCV5Y9V2MWt5+1QGOnEAwGSj4pnYWd2L1UC8OTH3JxurAF5LsxN31KsJo94DTNhdrbcGDkvFROM7oiCgn8XJSTQS5PL0ZjRx0Mr4H4/ezAQcfLPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tL4oMzGUrykxtEnlElUpdq9qUAZ5V2x4TGyfNNm7mFU=;
 b=NtVBkM4gYz+rFvX58X3KZ57sqLuTHaEQBm1Sl43+xA5lOBM3Nson4Ig9DA7fVn51PS7XRgkq7dJrnn16DoAO3NkfhaBEN0y2w7HBAUwLXMWciqdCmoQfLpKq81Cs3tzJnI6mMQ0eZgJBWAPqLhnPwN8r/6oH8LWzxyoPh4C71L3WDqiwcVbXJnRiczfRGgSwUSL4Vr/7bWdGyZKws/YkkNUGaI0y32kU+26L/8pEqmOEd+j56yCU7GiV2ilawpL4kJEd3vPUC+HhwzpPwubcjXtgwG6RdCEYaTbGeuyAwRxndHQcN8I4gf2WHx5Q4geZqBAKhPA057pvJ7hqqp9MzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tL4oMzGUrykxtEnlElUpdq9qUAZ5V2x4TGyfNNm7mFU=;
 b=LFNIjvSUvfSk2W9oHkPakY+oodnHYuae3CXlwjAL2LxDhvuquGXfAbRwfE9qMVn305gFKMiJ+Fa5AVFLxWfX1SToCj/9vRzyqkTutZHFNq1g+2k+wyqGUGoQgy7NgvmheOFN0TJNhsdX7PBU+277pDiUwsMGhThB8UYXa9KGKbg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <b14af71d-bc74-a18e-18ae-42e7a0a2efd9@amd.com>
Date: Tue, 7 Feb 2023 15:55:09 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v1 01/13] xen/arm: re-arrange the static shared memory
 region
Content-Language: en-US
To: Penny Zheng <Penny.Zheng@arm.com>, <xen-devel@lists.xenproject.org>
CC: <wei.chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20221115025235.1378931-1-Penny.Zheng@arm.com>
 <20221115025235.1378931-2-Penny.Zheng@arm.com>
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <20221115025235.1378931-2-Penny.Zheng@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT004:EE_|SJ0PR12MB7007:EE_
X-MS-Office365-Filtering-Correlation-Id: 05254b98-5615-48cc-88b7-08db094d9af3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vXj9p2B0Ui+1OxchRjPii5eI48jWUUQwwQZLcBvgWttGCTb8PskF0Vs9oAJuoDZAWH8X3avzAYgrhQt2k0ft3DaL6/Arl0WQ/8hLaKGkGffvOILnP4qerezTqnizS0OhgRscW9HyoKhKd0P15jcnXlUgROaEmUdsVgHoiXJITKlfe5yg8cm83+rwNKDiJS9iH+CPFAiY9PSaITHs3mzXZO9+pRApXl0Di3FytxTHpTgKWUnp1bXFtp3ZDxPu4JZfgMUgGPyEG12JqZIPEYJ6B+dhsE5vfXB89ZeNGTAnn9bb8B9504USmPk7vcEd6bCtLquWkHa8BEHQn60hQloQ/G7L49fEJ+3J3qASwEdDF5noBqYXtpVrtNVXop75q5/rm96WTm39BEfahLUIyheWJfJbdslbxffg8+nrXVGO8bJR/Sn1eX7V9ezLmCuYsBXRJGroDTARG+HYV+ZgFANSQDN9H23xNDsjBQQEhpJFFr3l9EJjwltO//+Sfjwt6rfDM2t9+zct3HyWodcSW+RwVHIcyJ90V2+JaRlVHSaktmIYZdmukB5fmeCm3jGkv0vwKXLY7ye5j7Rcp1Rd8Ta7QNriMipk7BoB1iBx0RuuwzbZck0jAEy5og26xTVZ3IWozpc3bR3w7m59fdDlXquGYOmxnR2LZpv1zPDkp+QFlIJoN2GjHHRi7Ep2bbY1xNSM9XKp9MK6GN0e/5TbHmP6em4hPeOOIPRGEQUyBuhd5amU0aGdDTUm5p0K7f99RdJYf2pwW65bHbZwTgQkUvsO7g==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(346002)(376002)(396003)(136003)(39860400002)(451199018)(36840700001)(40470700004)(46966006)(66899018)(86362001)(110136005)(54906003)(82310400005)(31696002)(47076005)(336012)(426003)(40480700001)(36756003)(31686004)(2906002)(40460700003)(44832011)(70206006)(5660300002)(36860700001)(83380400001)(4326008)(8676002)(8936002)(41300700001)(70586007)(186003)(26005)(478600001)(2616005)(53546011)(82740400003)(316002)(356005)(81166007)(16576012)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2023 20:55:11.9059
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 05254b98-5615-48cc-88b7-08db094d9af3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT004.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7007

Hi Penny,

On 11/14/22 21:52, Penny Zheng wrote:
> ...
> diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
> index fdbf68aadc..2d4ae0f00a 100644
> --- a/xen/arch/arm/include/asm/setup.h
> +++ b/xen/arch/arm/include/asm/setup.h
> @@ -50,10 +50,6 @@ struct membank {
>      paddr_t start;
>      paddr_t size;
>      enum membank_type type;
> -#ifdef CONFIG_STATIC_SHM
> -    char shm_id[MAX_SHM_ID_LENGTH];
> -    unsigned int nr_shm_borrowers;
> -#endif
>  };
> 
>  struct meminfo {
> @@ -61,6 +57,17 @@ struct meminfo {
>      struct membank bank[NR_MEM_BANKS];
>  };
> 
> +struct shm_membank {
> +    char shm_id[MAX_SHM_ID_LENGTH];
> +    unsigned int nr_shm_borrowers;
> +    struct membank *membank;
> +};
> +
> +struct shm_meminfo {
> +    unsigned int nr_banks;
> +    struct shm_membank bank[NR_MEM_BANKS];
> +};
> +
>  /*
>   * The domU flag is set for kernels and ramdisks of "xen,domain" nodes.
>   * The purpose of the domU flag is to avoid getting confused in
> @@ -105,6 +112,7 @@ struct bootinfo {
>      struct meminfo acpi;
>  #endif
>      bool static_heap;
> +    struct shm_meminfo shm_mem;
>  };
> 
>  struct map_range_data

The reduction in the sizeof struct membank is a welcome improvement, in my opinion, because it is multiplied by NR_MEM_BANKS, and IIRC we only have 32k of boot stack to play with.

Before this patch:
sizeof(struct kernel_info): 20648
sizeof(struct meminfo): 10248
sizeof(struct shm_meminfo): 10248

When building with EXTRA_CFLAGS_XEN_CORE="Wstack-usage=4096 -Wno-error=stack-usage=":
arch/arm/domain_build.c: In function ‘construct_domU’:
arch/arm/domain_build.c:3747:19: warning: stack usage is 20720 bytes [-Wstack-usage=]
 3747 | static int __init construct_domU(struct domain *d,
      |                   ^~~~~~~~~~~~~~
arch/arm/domain_build.c: In function ‘construct_dom0’:
arch/arm/domain_build.c:3979:19: warning: stack usage is 20688 bytes [-Wstack-usage=]
 3979 | static int __init construct_dom0(struct domain *d)
      |                   ^~~~~~~~~~~~~~



After this patch:
sizeof(struct kernel_info): 14504
sizeof(struct meminfo): 6152
sizeof(struct shm_meminfo): 8200

arch/arm/domain_build.c: In function ‘construct_domU’:
arch/arm/domain_build.c:3754:19: warning: stack usage is 14576 bytes [-Wstack-usage=]
 3754 | static int __init construct_domU(struct domain *d,
      |                   ^~~~~~~~~~~~~~
arch/arm/domain_build.c: In function ‘construct_dom0’:
arch/arm/domain_build.c:3986:19: warning: stack usage is 14544 bytes [-Wstack-usage=]
 3986 | static int __init construct_dom0(struct domain *d)
      |                   ^~~~~~~~~~~~~~

A later patch in this series will increase it again slightly. Note that I'm not expecting this series to address these particular warnings, I'm merely pointing out the (positive) impact of the change.

