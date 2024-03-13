Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B78D87B34B
	for <lists+xen-devel@lfdr.de>; Wed, 13 Mar 2024 22:12:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.692775.1080251 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkVsu-0007Mr-TU; Wed, 13 Mar 2024 21:11:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 692775.1080251; Wed, 13 Mar 2024 21:11:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkVsu-0007KW-Qj; Wed, 13 Mar 2024 21:11:36 +0000
Received: by outflank-mailman (input) for mailman id 692775;
 Wed, 13 Mar 2024 21:11:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EOmT=KT=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1rkVst-0007KQ-V1
 for xen-devel@lists.xenproject.org; Wed, 13 Mar 2024 21:11:36 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20600.outbound.protection.outlook.com
 [2a01:111:f403:200a::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 44b91b09-e17e-11ee-afdd-a90da7624cb6;
 Wed, 13 Mar 2024 22:11:34 +0100 (CET)
Received: from CY8PR19CA0038.namprd19.prod.outlook.com (2603:10b6:930:6::26)
 by LV2PR12MB5918.namprd12.prod.outlook.com (2603:10b6:408:174::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.35; Wed, 13 Mar
 2024 21:11:29 +0000
Received: from CY4PEPF0000E9D4.namprd03.prod.outlook.com
 (2603:10b6:930:6:cafe::99) by CY8PR19CA0038.outlook.office365.com
 (2603:10b6:930:6::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.20 via Frontend
 Transport; Wed, 13 Mar 2024 21:11:29 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000E9D4.mail.protection.outlook.com (10.167.241.147) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7386.12 via Frontend Transport; Wed, 13 Mar 2024 21:11:28 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 13 Mar
 2024 16:11:27 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 13 Mar
 2024 14:11:27 -0700
Received: from [172.17.162.8] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Wed, 13 Mar 2024 16:11:27 -0500
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
X-Inumbo-ID: 44b91b09-e17e-11ee-afdd-a90da7624cb6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JMKwaKhcpgQhawOrA1+H+tTRz+yf8CpAfuR33RbynQTaT5005BOLVreZ1M0S80kbhm7vNVCvBnvfB4s40zIXGj5RnNia2kxFwGoVVT3LMNT66/ELGAMCGFiqPYSTQbjXrBvfeRHBkwiM8RwFFFe/GKN+vMTIcqASUvbQ0YklV9FZYtDH4TkJcy8+qz30GpvZguVaCde/U2UjtA5p2O6vKyIB96vNmIp6YZaWRa/ioSzJcm4sN+CvrJamqzR1J+n8j+UA2Su28LoMUPJWRWEA4iFzGq+t6CYM/dlSmubURBTDcRnO69CCyvOsqOUmT/KlxunqVUvq71Z4Uj2D5vSEuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BOA50aDClGxCZ7KJGc0o8TzBjN4VZHbs1YW90aGbT30=;
 b=i/RvT1UQWqJHEaBEmv+NyCIMLpwbk4qjYnOd2qnsVjPbLS+9Dk+z9iGek1Y1B1kIwoI8fD1EkfkxYQIm5gLVxpEWcps3M1dhdalkPpURU1xI1oKJj6+7JP64xqBMF2mKJRVDJ3+mjH1iZmi20gpCQzjVe/t9U1/BRCxhdIqbCXboxoi1Jmk+X99vaieHhmDMtfmGN0iPZvYMQV7m0TQcgIJ/5pcg4jIAYcnR/uJO8QR/8gZ3iEfKLd8I2Lhot7EIIH+5Yqjym08MLe3Nx54FNv47xAEzMwqoiLUjW6rx3O7r0jDtheaWgxCVXFJTbQPkwR0twiw3WXLu/CWBZgOIkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BOA50aDClGxCZ7KJGc0o8TzBjN4VZHbs1YW90aGbT30=;
 b=p46MFm83wZReXOkwBmmFMt9AXgPVnEkMBQTVwFGN7uWhX4dAGPQNvm2yj2jtR4XKsD/pvIfzmEnBYkIIpik8nKdNQNx4gidRw1YF3TWFsKUXrbetEjIKBLIjEgSsGZtbDvzNcnz/hhNVN5oDTxlytGv2u/+oc+BtcyLzbSQRED4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <70daf607-03e7-4927-8ce2-5721ca3387ee@amd.com>
Date: Wed, 13 Mar 2024 17:02:56 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] x86/PVH: Support relocatable dom0 kernels
To: <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>
References: <20240313193021.241764-1-jason.andryuk@amd.com>
 <20240313193021.241764-4-jason.andryuk@amd.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20240313193021.241764-4-jason.andryuk@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D4:EE_|LV2PR12MB5918:EE_
X-MS-Office365-Filtering-Correlation-Id: 0214dec3-b7e7-4be0-057b-08dc43a22653
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+pl13C0La32KDK68EV1rmpKPnrhTzhIPbrnJdFvPW7DLh6x6TXXnl7U0whsuz0SpCwUIA0zAABn6mHX6BUTwdHppr2cyJjamnnc5fg5+3da07ddbnZL3/v31IXwlbXgORnAh4mHPfTkNzJZbpfj67lD5fzStqlV8ahKtLTyYsziBfDs8kLG+2G3Xk3DXMguLmANkIzjsE/1pBga/qWEOLa3U2NQalEdwnR6B83zQPlqnnCbbphJ8lDyhb0ntm11tORqeyo4RLmgiu4RxfnyaYhgTx5oT71/jK/uJrSXX7kvkXDHkfLugfDPpjywKz+giCgYe4Apcso6OCjbWiCYtdkU8iD1z2kaNuJLnxwRI/SOpftgx/3KYL9bzmJhtf+kh0QYnX/pdbp9ny/J2qrbszaYKpjmLLqJgawVS8EgV8Yytu3SAQedBuAR6CPK0EAIBHcwVZxomYInxhFNYEKri/bgEkmr0IdzLIe2xVJOA+Li2qONbB+YskFOJOvZnXP5kvxMencsbz8PVdHJUVfsHPYUb5s4EsMUJcBH5H4XHcN0lWsTyIdhcAXly2rA3yQJnQ4GdUr3AdG5X/OsHpoJIijF1nko2hSpe82VZ2vCBFr0mZS52UsDp4y+gQIhGiVMgXdas8wjcjBxio7tRDt9nVsai4MNFaEbdhLjFf2ZpF2YhwBZdY+RCzwJbO/qRykSROaLCQ7Cg2d7zz+C4FAvnVt0QQaou9/XwhXVQ6Kv4YbtjRcDyu+hzFWylCdgRE7NW
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400014)(36860700004)(376005)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2024 21:11:28.5412
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0214dec3-b7e7-4be0-057b-08dc43a22653
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5918

On 2024-03-13 15:30, Jason Andryuk wrote:
> +/* Find an e820 RAM region that fits the kernel at a suitable alignment. */
> +static paddr_t __init find_kernel_memory(
> +    const struct domain *d, struct elf_binary *elf,
> +    const struct elf_dom_parms *parms)
> +{
> +    paddr_t kernel_start = (paddr_t)elf->dest_base & PAGE_MASK;
> +    paddr_t kernel_end = PAGE_ALIGN((paddr_t)elf->dest_base + elf->dest_size);
> +    paddr_t kernel_size = kernel_end - kernel_start;
> +    unsigned int i;
> +
> +    /*
> +     * The memory map is sorted and all RAM regions starts and sizes are
> +     * aligned to page boundaries.
> +     */
> +    for ( i = 0; i < d->arch.nr_e820; i++ )
> +    {
> +        paddr_t start = d->arch.e820[i].addr;
> +        paddr_t end = d->arch.e820[i].addr + d->arch.e820[i].size;
> +        paddr_t kstart, kend;
> +
> +        if ( d->arch.e820[i].type != E820_RAM )
> +            continue;
> +
> +        if ( d->arch.e820[i].size < kernel_size )
> +            continue;
> +
> +        kstart = ROUNDUP(start, parms->phys_align);
> +        kstart = kstart < parms->phys_min ? parms->phys_min : kstart;

This should be
         kstart = MAX(kstart, parms->phys_min);

Regards,
Jason

> +        kend = kstart + kernel_size;
> +
> +        if ( kend > parms->phys_max )
> +            return 0;
> +
> +        if ( kend <= end )
> +            return kstart;
> +    }
> +
> +    return 0;
> +}

