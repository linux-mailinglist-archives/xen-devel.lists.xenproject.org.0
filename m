Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA579764141
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jul 2023 23:35:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.570705.892802 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOmAb-000088-8t; Wed, 26 Jul 2023 21:35:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 570705.892802; Wed, 26 Jul 2023 21:35:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOmAb-00005S-5s; Wed, 26 Jul 2023 21:35:45 +0000
Received: by outflank-mailman (input) for mailman id 570705;
 Wed, 26 Jul 2023 21:35:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a+Ze=DM=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1qOmAY-00005M-SP
 for xen-devel@lists.xenproject.org; Wed, 26 Jul 2023 21:35:43 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2061b.outbound.protection.outlook.com
 [2a01:111:f400:7eab::61b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5e40b386-2bfc-11ee-b244-6b7b168915f2;
 Wed, 26 Jul 2023 23:35:41 +0200 (CEST)
Received: from MW4PR04CA0066.namprd04.prod.outlook.com (2603:10b6:303:6b::11)
 by DM6PR12MB4075.namprd12.prod.outlook.com (2603:10b6:5:21d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.33; Wed, 26 Jul
 2023 21:35:34 +0000
Received: from CO1NAM11FT004.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:6b:cafe::c3) by MW4PR04CA0066.outlook.office365.com
 (2603:10b6:303:6b::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29 via Frontend
 Transport; Wed, 26 Jul 2023 21:35:33 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT004.mail.protection.outlook.com (10.13.175.89) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6631.29 via Frontend Transport; Wed, 26 Jul 2023 21:35:33 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 26 Jul
 2023 16:35:31 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 26 Jul
 2023 14:35:20 -0700
Received: from [192.168.137.15] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Wed, 26 Jul 2023 16:35:19 -0500
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
X-Inumbo-ID: 5e40b386-2bfc-11ee-b244-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fG7HyC2Bxe08k+RaQMOawaQeFM6vp1jaFnsg8slTnlDqiVryvIBNsQtYJbUADkihMhsDyf+RgKh4EabBnqjS6PYKPySqwGb8YpIaWYhCVa3zC/UdcX1zskl3GWPUXvFvnqKiVf0/qnSgMwAsqJcyVzOjbETOSDgXRXesGNhQ8d9IPaotUHgeWtAaxXUcXGfJTUzMx3e2LjlZwWfenBAgXR2rlRCNyKwe3Q3qME+KApgquru6j+EnRgevblN0elQ8Car7N19OoENsuefKZUj/bDRffVGpuDT6gWbPpmv8YsKeOAeiNSg2xIaHJAU9Oa2t9bXXA5S+MSeYTkqfXXVJaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VEtqnk7taNfauppgoMb1LMd6Ota8enF/Hph/uJAOkQA=;
 b=SA5in9qXJvbAcDCwJLD9fkr2yBPgHLqF2fSVpEdKUJ/zxFuvfQZk+M5zIsLKe+B6v1CBC6LRIpk6Ki74gP2M7Xs06MVlIdZMPW8/wwygsJekiu3lAP22NSevvVQ3kgUbO43UYMuhyD4t0MN7+Ezuc5Qcl6YcTgXu9Dan3bZoJF8j36+HSfkF84OILTuEjwOFauQMJF/SnU7TP8DWgquUfA6iyE2wKc2ytGR9o2MeZtxvOWWapl+6/Z2Cg3ptdlYPKAz8DK6kPPCrIOMrehZocv0pfjTLcGJ74+LB5VS089YN3rMwTYIFG3YVeuRIfVkzH34akQtYj5phbY76UaeSmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=epam.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VEtqnk7taNfauppgoMb1LMd6Ota8enF/Hph/uJAOkQA=;
 b=rpdQZnSZ9pKtcddnawBrcJoEbgq0ydpktraZNZCMZCZrVcRxj0JsCuUg25UijIwdDHf5EkEtytsJh2xpSI/bdoIA3WQU4csNbMJ6ncU/vcCfp+12aZqb7M8r3stwmZ8vnTs8aTU5rJruB7CHOuQNKwikU5YZKF37b7j3FCoEt5s=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <76fd0583-bb94-6159-0adf-89c67beaa64b@amd.com>
Date: Wed, 26 Jul 2023 17:35:26 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
Subject: Re: [PATCH v8 11/13] vpci: add initial support for virtual PCI bus
 topology
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>, Jan Beulich
	<jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20230720003205.1828537-1-volodymyr_babchuk@epam.com>
 <20230720003205.1828537-12-volodymyr_babchuk@epam.com>
Content-Language: en-US
In-Reply-To: <20230720003205.1828537-12-volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT004:EE_|DM6PR12MB4075:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d8158df-3dbb-4554-6681-08db8e203e29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qXE2Q+bcJYm940jYrkRQRldn/n9cCq58z0HJuKGHqtg30a0vZzgUoQGnRQs1gPEKG/nXKzmvb9yP72jchJiljO8eCMyvOom8a+OJICLTQv0G613ftmriTnkC/kx/AVmxgSFHPh9wF3WcX8JB1USUzfIK3zU9VDq/Of7aiVEmvvAmU9f7xYvugNjzVcNnm5qLHGwxdQJHn+7R8Bc+ZT/dmf6Bc3yZYpyVKerf2etguIR+ZGPBt4qCNCwAIE31Yzf0Gfq7OOwZ2ck/6nkyal7Touf7/s41pymwJGdi0KYYr8itNykwKGCdNsWGAoEFad8n/XvVmXr2XHrx7B+E0wfva+WKpsZLuKBWRAbCTxpM/L2ZCscX91ysCwGhq5Td5gFBLZIYbYRJPLtecNwwi4Hn9etAKWyGNNkuDgzIMJtKXJVKN0HW1KnluDq3MLvXo03SlPR8F55udpDxqi++rTfG6/+K4b7BoEL+oGOAzHXvurhFkpxOH5IkxsOyhlf5Xt/udvb+d+SBrd9xts7RcRLM3mzZCsGNmZ6JUJUbXgR3GQjGFuSXgJLPBBJJASmP+ONT8qUlgr+k7KS4T14U5p8n0YxAcPL4l0exMCzwurEZ1xVz9lcTd5z6b99txu5J1HgC5fzskMgUWxbEDxlSLQZSN2OOKhP+pAfiHFqKZ0fnqeWunmkjwddqQY69hZ/5pwegFtgR9cTQYD4fNZAbLjEnVB5B6ye5rmVEs+pExlslDHKWr2NugOdfeMm5vYeudWA/RDYLzy/x858ThnjNm7PbPlvMDUlGClVXmCJWpTpCWpk=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(136003)(376002)(346002)(451199021)(82310400008)(36840700001)(40470700004)(46966006)(316002)(16576012)(41300700001)(2906002)(44832011)(5660300002)(40460700003)(8936002)(8676002)(36756003)(31696002)(40480700001)(86362001)(26005)(53546011)(356005)(82740400003)(478600001)(6666004)(47076005)(83380400001)(36860700001)(186003)(426003)(336012)(2616005)(31686004)(70206006)(4326008)(110136005)(81166007)(54906003)(70586007)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2023 21:35:33.4492
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d8158df-3dbb-4554-6681-08db8e203e29
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT004.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4075

On 7/19/23 20:32, Volodymyr Babchuk wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> Assign SBDF to the PCI devices being passed through with bus 0.
> The resulting topology is where PCIe devices reside on the bus 0 of the
> root complex itself (embedded endpoints).
> This implementation is limited to 32 devices which are allowed on
> a single PCI bus.
> 
> Please note, that at the moment only function 0 of a multifunction
> device can be passed through.
> 
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> ---
> Since v8:
> - Added write lock in add_virtual_device
> Since v6:
> - re-work wrt new locking scheme
> - OT: add ASSERT(pcidevs_write_locked()); to add_virtual_device()
> Since v5:
> - s/vpci_add_virtual_device/add_virtual_device and make it static
> - call add_virtual_device from vpci_assign_device and do not use
>   REGISTER_VPCI_INIT machinery
> - add pcidevs_locked ASSERT
> - use DECLARE_BITMAP for vpci_dev_assigned_map
> Since v4:
> - moved and re-worked guest sbdf initializers
> - s/set_bit/__set_bit
> - s/clear_bit/__clear_bit
> - minor comment fix s/Virtual/Guest/
> - added VPCI_MAX_VIRT_DEV constant (PCI_SLOT(~0) + 1) which will be used
>   later for counting the number of MMIO handlers required for a guest
>   (Julien)
> Since v3:
>  - make use of VPCI_INIT
>  - moved all new code to vpci.c which belongs to it
>  - changed open-coded 31 to PCI_SLOT(~0)
>  - added comments and code to reject multifunction devices with
>    functions other than 0
>  - updated comment about vpci_dev_next and made it unsigned int
>  - implement roll back in case of error while assigning/deassigning devices
>  - s/dom%pd/%pd
> Since v2:
>  - remove casts that are (a) malformed and (b) unnecessary
>  - add new line for better readability
>  - remove CONFIG_HAS_VPCI_GUEST_SUPPORT ifdef's as the relevant vPCI
>     functions are now completely gated with this config
>  - gate common code with CONFIG_HAS_VPCI_GUEST_SUPPORT
> New in v2
> ---
>  xen/drivers/vpci/vpci.c | 72 ++++++++++++++++++++++++++++++++++++++++-
>  xen/include/xen/sched.h |  8 +++++
>  xen/include/xen/vpci.h  | 11 +++++++
>  3 files changed, 90 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
> index ca3505ecb7..baaafe4a2a 100644
> --- a/xen/drivers/vpci/vpci.c
> +++ b/xen/drivers/vpci/vpci.c
> @@ -46,6 +46,16 @@ void vpci_remove_device(struct pci_dev *pdev)
>          return;
> 
>      spin_lock(&pdev->vpci->lock);
> +
> +#ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
> +    if ( pdev->vpci->guest_sbdf.sbdf != ~0 )
> +    {
> +        __clear_bit(pdev->vpci->guest_sbdf.dev,
> +                    &pdev->domain->vpci_dev_assigned_map);
> +        pdev->vpci->guest_sbdf.sbdf = ~0;
> +    }
> +#endif
> +
>      while ( !list_empty(&pdev->vpci->handlers) )
>      {
>          struct vpci_register *r = list_first_entry(&pdev->vpci->handlers,
> @@ -101,6 +111,10 @@ int vpci_add_handlers(struct pci_dev *pdev)
>      INIT_LIST_HEAD(&pdev->vpci->handlers);
>      spin_lock_init(&pdev->vpci->lock);
> 
> +#ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
> +    pdev->vpci->guest_sbdf.sbdf = ~0;
> +#endif
> +
>      for ( i = 0; i < NUM_VPCI_INIT; i++ )
>      {
>          rc = __start_vpci_array[i](pdev);
> @@ -115,6 +129,54 @@ int vpci_add_handlers(struct pci_dev *pdev)
>  }
> 
>  #ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
> +static int add_virtual_device(struct pci_dev *pdev)
> +{
> +    struct domain *d = pdev->domain;
> +    pci_sbdf_t sbdf = { 0 };
> +    unsigned long new_dev_number;
> +
> +    if ( is_hardware_domain(d) )
> +        return 0;
> +
> +    ASSERT(pcidevs_locked());
> +
> +    /*
> +     * Each PCI bus supports 32 devices/slots at max or up to 256 when
> +     * there are multi-function ones which are not yet supported.
> +     */
> +    if ( pdev->info.is_extfn )
> +    {
> +        gdprintk(XENLOG_ERR, "%pp: only function 0 passthrough supported\n",
> +                 &pdev->sbdf);
> +        return -EOPNOTSUPP;
> +    }
> +
> +    write_lock(&pdev->domain->pci_lock);

This should be replaced with an ASSERT, same as the one in vpci_add_handlers() above.

The lock is already acquired a few patches before this in the caller in
drivers/passthrough/pci.c:assign_device()

1524     write_lock(&pdev->domain->pci_lock);
1525     rc = vpci_assign_device(pdev);
1526     write_unlock(&pdev->domain->pci_lock);

> +    new_dev_number = find_first_zero_bit(d->vpci_dev_assigned_map,
> +                                         VPCI_MAX_VIRT_DEV);
> +    if ( new_dev_number >= VPCI_MAX_VIRT_DEV )
> +    {
> +        write_unlock(&pdev->domain->pci_lock);
> +        return -ENOSPC;
> +    }
> +
> +    __set_bit(new_dev_number, &d->vpci_dev_assigned_map);
> +
> +    /*
> +     * Both segment and bus number are 0:
> +     *  - we emulate a single host bridge for the guest, e.g. segment 0
> +     *  - with bus 0 the virtual devices are seen as embedded
> +     *    endpoints behind the root complex
> +     *
> +     * TODO: add support for multi-function devices.
> +     */
> +    sbdf.devfn = PCI_DEVFN(new_dev_number, 0);
> +    pdev->vpci->guest_sbdf = sbdf;
> +    write_unlock(&pdev->domain->pci_lock);
> +
> +    return 0;
> +}
> +
>  /* Notify vPCI that device is assigned to guest. */
>  int vpci_assign_device(struct pci_dev *pdev)
>  {
> @@ -125,8 +187,16 @@ int vpci_assign_device(struct pci_dev *pdev)
> 
>      rc = vpci_add_handlers(pdev);
>      if ( rc )
> -        vpci_deassign_device(pdev);
> +        goto fail;
> +
> +    rc = add_virtual_device(pdev);
> +    if ( rc )
> +        goto fail;
> +
> +    return 0;
> 
> + fail:
> +    vpci_deassign_device(pdev);
>      return rc;
>  }
>  #endif /* CONFIG_HAS_VPCI_GUEST_SUPPORT */
> diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
> index 80dd150bbf..478bd21f3e 100644
> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -461,6 +461,14 @@ struct domain
>  #ifdef CONFIG_HAS_PCI
>      struct list_head pdev_list;
>      rwlock_t pci_lock;
> +#ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
> +    /*
> +     * The bitmap which shows which device numbers are already used by the
> +     * virtual PCI bus topology and is used to assign a unique SBDF to the
> +     * next passed through virtual PCI device.
> +     */
> +    DECLARE_BITMAP(vpci_dev_assigned_map, VPCI_MAX_VIRT_DEV);
> +#endif
>  #endif
> 
>  #ifdef CONFIG_HAS_PASSTHROUGH
> diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
> index 6099d2141d..c55c45f7a1 100644
> --- a/xen/include/xen/vpci.h
> +++ b/xen/include/xen/vpci.h
> @@ -21,6 +21,13 @@ typedef int vpci_register_init_t(struct pci_dev *dev);
> 
>  #define VPCI_ECAM_BDF(addr)     (((addr) & 0x0ffff000) >> 12)
> 
> +/*
> + * Maximum number of devices supported by the virtual bus topology:
> + * each PCI bus supports 32 devices/slots at max or up to 256 when
> + * there are multi-function ones which are not yet supported.
> + */
> +#define VPCI_MAX_VIRT_DEV       (PCI_SLOT(~0) + 1)
> +
>  #define REGISTER_VPCI_INIT(x, p)                \
>    static vpci_register_init_t *const x##_entry  \
>                 __used_section(".data.vpci." p) = x
> @@ -155,6 +162,10 @@ struct vpci {
>              struct vpci_arch_msix_entry arch;
>          } entries[];
>      } *msix;
> +#ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
> +    /* Guest SBDF of the device. */
> +    pci_sbdf_t guest_sbdf;
> +#endif
>  #endif
>  };
> 
> --
> 2.41.0
> 

