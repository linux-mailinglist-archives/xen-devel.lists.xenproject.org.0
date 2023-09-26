Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 918317AE2D1
	for <lists+xen-devel@lfdr.de>; Tue, 26 Sep 2023 02:12:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.608228.946586 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qkvgg-0000Pt-TS; Tue, 26 Sep 2023 00:12:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 608228.946586; Tue, 26 Sep 2023 00:12:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qkvgg-0000Ng-Qc; Tue, 26 Sep 2023 00:12:26 +0000
Received: by outflank-mailman (input) for mailman id 608228;
 Tue, 26 Sep 2023 00:12:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZoCt=FK=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1qkvgf-0000Na-KR
 for xen-devel@lists.xenproject.org; Tue, 26 Sep 2023 00:12:25 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20621.outbound.protection.outlook.com
 [2a01:111:f400:7e8c::621])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5c76b5cd-5c01-11ee-9b0d-b553b5be7939;
 Tue, 26 Sep 2023 02:12:22 +0200 (CEST)
Received: from DM5PR08CA0057.namprd08.prod.outlook.com (2603:10b6:4:60::46) by
 IA1PR12MB6556.namprd12.prod.outlook.com (2603:10b6:208:3a0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.31; Tue, 26 Sep
 2023 00:12:18 +0000
Received: from DS1PEPF0001708F.namprd03.prod.outlook.com
 (2603:10b6:4:60:cafe::1c) by DM5PR08CA0057.outlook.office365.com
 (2603:10b6:4:60::46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.35 via Frontend
 Transport; Tue, 26 Sep 2023 00:12:17 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0001708F.mail.protection.outlook.com (10.167.17.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.14 via Frontend Transport; Tue, 26 Sep 2023 00:12:17 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 25 Sep
 2023 19:12:17 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 25 Sep
 2023 19:11:57 -0500
Received: from [172.20.57.36] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Mon, 25 Sep 2023 19:11:56 -0500
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
X-Inumbo-ID: 5c76b5cd-5c01-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kmbz9bTHomc+Um/ngCsyHcX1Or6Aa6YMFt57c8ubT0pUp/i5GUdqSWxw7qLokCqCcptujEwH+awwrDuvOGCQrr2raOwlEuKtXKQeAFDpjROJqL3ilFa41jzBA5US69iC1QSOK2kPKhGB+5rTfg9HNLrRTy2ks5Yq5nW8INvWcuuaOtpVyFoMwl3uyXd/Xj04vzKcVzfIyxYeYioc6CdJLLhc36ExXGapEkfKGt6aihj6OlQHmtOESh13mvqgAu5p2pOoYFnpZfxsSmogjlFO1HfKMN67EDKvmBdqZJ99uCMOUe5dQ3+9gwUm6v6jyX1H/vS8I35RDH4JZ/1eE6jP6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bb4xPjnQOpvsJw0rFGoaYpZrwT8pVinI7f6de7Tfvi0=;
 b=dONiJJFD3hYICEQVFaYsJoRHP/OsCL7sWlJ69r7Pd1NI7RQgVRAgMEY+E/eMy4KHh9NHPUPoK02F7vPdjV9bMq8mOlSWwjmcphSfASnpoyaJ6kL6rmH8BWfY866UvXaKwpJw68w1dqsYXvHF3U8DPIleuSjnspzZ9HbfC+M6OzmPapNMCRSkkfumUBMc4lAIsdTx1vGyO3MUj7oLoy6WjCkX36RzHQFECj2dAmwih5m3f0BuNql8GZSdMTrOyFc7xmli/QnmfTUM/fvlsCWpABeadjIcs7PDUBovOxQvEncpWGWehxBBljeELWQHIpNeUk4kWnhUNMpvIX/d38mCsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=epam.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bb4xPjnQOpvsJw0rFGoaYpZrwT8pVinI7f6de7Tfvi0=;
 b=qJtZ2Nr+gRYx+1Yov4Z0itcWjvoPh66jIQ4jhN9ufKx9bOnOM1yfGUPztUriOn6pDVfVfiIyNxG12sRsmiNPpEK9JVBQ2dcrZmUa68J/2ue2xrezoIMovMCBS15ZO5ZD0li81XSB3RNJ0g86ASHxQqLZe0OwNMjvO5sHesU7F9k=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <2dbbe50c-8542-e414-7475-df921aaa75b0@amd.com>
Date: Mon, 25 Sep 2023 20:12:03 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v9 16/16] xen/arm: vpci: permit access to guest vpci space
Content-Language: en-US
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Wei Liu <wl@xen.org>
References: <20230829231912.4091958-1-volodymyr_babchuk@epam.com>
 <20230829231912.4091958-17-volodymyr_babchuk@epam.com>
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <20230829231912.4091958-17-volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001708F:EE_|IA1PR12MB6556:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f5c9f7a-1b61-491d-8e26-08dbbe253e84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3zYzEDKCQra0SNPC/st9vdTz+zzvGqTbJv75X/YAneXpWjKx7mgilxYgwruVKRxi+KidsYdiJC0E2O0RJQ/y4IFVUMHZ8pMCbHKKf2Z+1q0iaKz8qfj2CjUHKq+h9DPj4gXLGBUFf0/ltmaBnuHh/bHRjNOilQV4AYNnaa2ezDeHxm8DEkpG01BZGVpwCN21Io0ZuArCQi0DUJ5VTwkdOU42ClYH7KUvfQewo70AN+iniIk2rulzE7xLBSCbED9erZVe0/+cnFCOf0eYVmS3McsG+nzhTz4OccKamh2FFobB6zXyDXe0BDijv+YiSdzCyvRNNycHBi4F1l+Olf2zqFZiOSzYo+LavzHkRCLrvXF+YiBpgpWgUhjaabV9jb15z8PiTaWcb8oiNxqKfNJ7xeJBDxH54M+F2sCzgQA8RcwMy+xH66B/7/MCNnkCjwnRV0X3GdWqGWFpPvc0PQASi5Fs2YYLrFfquTY/3bO9VHe+dcnJxQp9rWLKdmi1paPqIBAx2QNsZIiijvG5vvPqmuxzunGw9KlDChX+IIt16XCFqjvP/Cy0nIeaNgTwwK3TzlW5blOu0LPivlQ5gU3U8M2+X1Zgb1m+FuqUkSCCVY8bY8qfdC71t3KfhICYPuTbcW5oagbBr7SY4CG88RVU0HuJY27zs9jSlonoPzwLg6ZvPtGzNYR6ovcvDOBJksvolkK19N1K54DP7Y2FQOlyzLnnO13xZ0yiS36ISDlvcQ2msNbHR0xCQVNxidEey35snmyoaAEyYEFgUvH/bMaJPoAry2spm9lLOD5SptHlXUw=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(396003)(136003)(376002)(346002)(230922051799003)(1800799009)(82310400011)(186009)(451199024)(36840700001)(40470700004)(46966006)(26005)(4326008)(316002)(8936002)(8676002)(54906003)(2616005)(16576012)(40460700003)(110136005)(70206006)(70586007)(5660300002)(40480700001)(41300700001)(36860700001)(6666004)(86362001)(31696002)(2906002)(47076005)(82740400003)(81166007)(31686004)(356005)(478600001)(83380400001)(426003)(336012)(36756003)(44832011)(53546011)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2023 00:12:17.4217
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f5c9f7a-1b61-491d-8e26-08dbbe253e84
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0001708F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6556

On 8/29/23 19:19, Volodymyr Babchuk wrote:
> From: Stewart Hildebrand <stewart.hildebrand@amd.com>
> 
> Move iomem_caps initialization earlier (before arch_domain_create()).
> 
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> ---
> This is sort of a follow-up to:
> 
>   baa6ea700386 ("vpci: add permission checks to map_range()")
> 
> I don't believe we need a fixes tag since this depends on the vPCI p2m BAR
> patches.
> ---
>  xen/arch/arm/vpci.c | 6 ++++++
>  xen/common/domain.c | 4 +++-
>  2 files changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/vpci.c b/xen/arch/arm/vpci.c
> index 01b50d435e..fb5361276f 100644
> --- a/xen/arch/arm/vpci.c
> +++ b/xen/arch/arm/vpci.c
> @@ -2,6 +2,7 @@
>  /*
>   * xen/arch/arm/vpci.c
>   */
> +#include <xen/iocap.h>
>  #include <xen/sched.h>
>  #include <xen/vpci.h>
> 
> @@ -119,8 +120,13 @@ int domain_vpci_init(struct domain *d)
>              return ret;
>      }
>      else
> +    {
>          register_mmio_handler(d, &vpci_mmio_handler,
>                                GUEST_VPCI_ECAM_BASE, GUEST_VPCI_ECAM_SIZE, NULL);
> +        iomem_permit_access(d, paddr_to_pfn(GUEST_VPCI_MEM_ADDR),
> +                            paddr_to_pfn(PAGE_ALIGN(GUEST_VPCI_MEM_ADDR +
> +                                                    GUEST_VPCI_MEM_SIZE - 1)));

We should also permit access to GUEST_VPCI_PREFETCH_MEM_ADDR

> +    }
> 
>      return 0;
>  }
> diff --git a/xen/common/domain.c b/xen/common/domain.c
> index 9b04a20160..11a48ba7e4 100644
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -695,6 +695,9 @@ struct domain *domain_create(domid_t domid,
>          radix_tree_init(&d->pirq_tree);
>      }
> 
> +    if ( !is_idle_domain(d) )
> +        d->iomem_caps = rangeset_new(d, "I/O Memory", RANGESETF_prettyprint_hex);
> +
>      if ( (err = arch_domain_create(d, config, flags)) != 0 )
>          goto fail;
>      init_status |= INIT_arch;
> @@ -704,7 +707,6 @@ struct domain *domain_create(domid_t domid,
>          watchdog_domain_init(d);
>          init_status |= INIT_watchdog;
> 
> -        d->iomem_caps = rangeset_new(d, "I/O Memory", RANGESETF_prettyprint_hex);
>          d->irq_caps   = rangeset_new(d, "Interrupts", 0);
>          if ( !d->iomem_caps || !d->irq_caps )
>              goto fail;
> --
> 2.41.0

