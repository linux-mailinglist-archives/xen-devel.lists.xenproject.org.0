Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA4608288F6
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jan 2024 16:24:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.664689.1034769 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNDxi-0004Ba-AU; Tue, 09 Jan 2024 15:24:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 664689.1034769; Tue, 09 Jan 2024 15:24:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNDxi-00049O-7P; Tue, 09 Jan 2024 15:24:18 +0000
Received: by outflank-mailman (input) for mailman id 664689;
 Tue, 09 Jan 2024 15:24:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ONpl=IT=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1rNDxh-00049H-5Z
 for xen-devel@lists.xenproject.org; Tue, 09 Jan 2024 15:24:17 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2061d.outbound.protection.outlook.com
 [2a01:111:f400:7e8c::61d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2549019d-af03-11ee-98ef-6d05b1d4d9a1;
 Tue, 09 Jan 2024 16:24:15 +0100 (CET)
Received: from BYAPR05CA0090.namprd05.prod.outlook.com (2603:10b6:a03:e0::31)
 by MN0PR12MB6151.namprd12.prod.outlook.com (2603:10b6:208:3c5::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.23; Tue, 9 Jan
 2024 15:24:09 +0000
Received: from SJ1PEPF00001CDF.namprd05.prod.outlook.com
 (2603:10b6:a03:e0:cafe::db) by BYAPR05CA0090.outlook.office365.com
 (2603:10b6:a03:e0::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.15 via Frontend
 Transport; Tue, 9 Jan 2024 15:24:08 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CDF.mail.protection.outlook.com (10.167.242.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7181.14 via Frontend Transport; Tue, 9 Jan 2024 15:24:08 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Tue, 9 Jan
 2024 09:24:07 -0600
Received: from [172.23.76.218] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Tue, 9 Jan 2024 09:24:06 -0600
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
X-Inumbo-ID: 2549019d-af03-11ee-98ef-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HxxFuNEBkHDBaLE6eA+Ndxqe7neuvfTsPUGDgL7vx0H0HKPJTY/HvaUPTSEcRdDPGA8+r7nqBqOtrhx55tPYwzD3ZN13Fso3gPB5wNaaSPuF8yWnLgmeHwKZBp73R21/d9+n0eVcAxeDGbDS4drYBfiNAYdEAYsZNxa3HtNj0REZiV02lHrIzppXpwjZHVmLGImjK7qaPPfEsM8IRyqXAhpoT08LwNhz8CSPWNJDvOeoN3NhIVLmwqVkUin37yMZzgLjSYMVjHXLl3OpaFLst9ozOxUfcM49BkJGJ1lPhPy8Y1bhVtn6J2VfBaX//xS5SulHAjmWdu9WmYDUioKNlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u+HMJXyXGN7Yzen/DWfjQa/KINyran/Sq/l+V+dwkPA=;
 b=ijfKQCBoMqPW4SrWO6roZoZn2eM+CQOkp989S4J3yGE2J9XhC/QjuJKqBeaAQMuIus36BvQlYPHBRSIlNpcwinIzhPGarGXhS66UlnaTubROBHfxmDlMaFDmRCL3Kkyiclym1M+x7DJQI339rmVQO82mVz10gKPjNZjjqdSFNjY+cCpD/5F9Q78kiBKM4lLdMRYmZNpQcl8/7YZ3mPUcPRWzROPSXKWzshG+LnlaNrrRpLeHqC18i3puAiJHoWHE6fRjWROzkBK8Riwcuii/CDvHpus7h+JIqzTdu8JAvo6ullXOgUjHKpm3QRVY7xP0hW45ieZ0FLZuoGU6OW4Qww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u+HMJXyXGN7Yzen/DWfjQa/KINyran/Sq/l+V+dwkPA=;
 b=IwhcvrPG5OirW0fhCNwTpA9KkJSNxoy7JDwlxE2rQUeJIw8qCVFKpcMJ4I8IvyGcU4oamKnOJydx/5YH8K5L9iahdQVvCdDJXpLQhK5NQ6x3O6X/0wzgUEpC7yRdG3M9BboSgBVgn6qkEnlgvhz2ru355BXyfGKndfkotaREm6Y=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <70add06b-59c6-469a-8570-f7a6f5bc15fb@amd.com>
Date: Tue, 9 Jan 2024 10:24:05 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC XEN PATCH v4 1/5] xen/vpci: Clear all vpci status of device
Content-Language: en-US
To: Jiqian Chen <Jiqian.Chen@amd.com>, <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Anthony PERARD <anthony.perard@citrix.com>,
	"Juergen Gross" <jgross@suse.com>, Huang Rui <Ray.Huang@amd.com>
References: <20240105070920.350113-1-Jiqian.Chen@amd.com>
 <20240105070920.350113-2-Jiqian.Chen@amd.com>
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <20240105070920.350113-2-Jiqian.Chen@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CDF:EE_|MN0PR12MB6151:EE_
X-MS-Office365-Filtering-Correlation-Id: e45a136e-d26d-4058-f076-08dc1127060a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xgklTidAKq6Qhv/pFfq8UVhkqZZgJDYZHxkw5+DrOVTB7pSRjcWDXBCbYOWCDAFvxX0ckPoe+HXklcpuMeExuDYZ/3sOC4syjxt8xtTDPA3IcxKQV27w1LnJhgh/XQAPR6fV4uKtHG2hmutlmxvneYqZqGfZ7IO4X8/VWr6HEBP2XlDuFsSmvJbAica1BrnuTbCj97ei1NtB+s9i7DnM6E4Lv0CaGLlHuV1pS+HJ08lXXAu8DseL8i+89leCbxPHOSPOj9gRiZpxXPfFhjE8yCyx720uB173Vt+ZNSPGrsAQE10gggZwb328dbf2wHnKRRBq8oLIU7e0skwF9fsBNuwCmyDl8NYKyrgyXPJ3lu0B6RFCaPbsJqnEB5fGD26+MN0wK41Nqqun5f07Ao2zJzpsmwN7GNwsD2v1+lijWvexhb74CM3XJnDZy6G5PfCjOQe72nr9SKo8IBOIO35W6YDTm1FGlayEYOFzCR+BLiuRPEh4KOYoPR2CGue2B1zR6u1h5E1e1x9Gr9KYUDe6NtvjVmU0WVH6YL84PKD/pmjfDBBBxAedvkV6woe1s7Z/v15lF3qqgVsutmVyxGC35DxZc3lqfFUOn0iZq/wmyOlI3YRb48W5rDBkEBDOhqD+lToLnnX7ZPq5uNFj9l+flWV+If0WMB+07bFqc2GXBynOFQVT3SxdjKHpn3e61YvquvfNlUXZgYr0R1Ya0XMu94GueXd8wJRKUjwBTzmILDKaasey+SES9Ii97KHzOSDJhlrMO5NU8+io6mLMu00czmxD7lWY5S/Wiy0tQ413rP0uH1gjfLEBHvLAMEF3QcyQ
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(396003)(136003)(346002)(39860400002)(230922051799003)(1800799012)(82310400011)(64100799003)(186009)(451199024)(36840700001)(40470700004)(46966006)(2616005)(26005)(426003)(336012)(53546011)(478600001)(5660300002)(83380400001)(41300700001)(2906002)(36860700001)(16576012)(44832011)(70206006)(4326008)(70586007)(54906003)(110136005)(8676002)(8936002)(47076005)(316002)(82740400003)(356005)(86362001)(31696002)(36756003)(81166007)(7416002)(31686004)(40460700003)(40480700001)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2024 15:24:08.1451
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e45a136e-d26d-4058-f076-08dc1127060a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CDF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6151

On 1/5/24 02:09, Jiqian Chen wrote:
> diff --git a/xen/drivers/pci/physdev.c b/xen/drivers/pci/physdev.c
> index 42db3e6d133c..552ccbf747cb 100644
> --- a/xen/drivers/pci/physdev.c
> +++ b/xen/drivers/pci/physdev.c
> @@ -67,6 +68,39 @@ ret_t pci_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>          break;
>      }
>  
> +    case PHYSDEVOP_pci_device_state_reset: {
> +        struct physdev_pci_device dev;
> +        struct pci_dev *pdev;
> +        pci_sbdf_t sbdf;
> +
> +        if ( !is_pci_passthrough_enabled() )
> +            return -EOPNOTSUPP;
> +
> +        ret = -EFAULT;
> +        if ( copy_from_guest(&dev, arg, 1) != 0 )
> +            break;
> +        sbdf = PCI_SBDF(dev.seg, dev.bus, dev.devfn);
> +
> +        ret = xsm_resource_setup_pci(XSM_PRIV, sbdf.sbdf);
> +        if ( ret )
> +            break;
> +
> +        pcidevs_lock();
> +        pdev = pci_get_pdev(NULL, sbdf);
> +        if ( !pdev )
> +        {
> +            pcidevs_unlock();
> +            ret = -ENODEV;
> +            break;
> +        }
> +

        write_lock(&pdev->domain->pci_lock);

> +        ret = vpci_reset_device_state(pdev);

        write_unlock(&pdev->domain->pci_lock);

> +        pcidevs_unlock();
> +        if ( ret )
> +            printk(XENLOG_ERR "%pp: failed to reset PCI device state\n", &sbdf);
> +        break;
> +    }
> +
>      default:
>          ret = -ENOSYS;
>          break;
> diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
> index 72ef277c4f8e..3c64cb10ccbb 100644
> --- a/xen/drivers/vpci/vpci.c
> +++ b/xen/drivers/vpci/vpci.c
> @@ -107,6 +107,15 @@ int vpci_add_handlers(struct pci_dev *pdev)
>  
>      return rc;
>  }
> +
> +int vpci_reset_device_state(struct pci_dev *pdev)
> +{
> +    ASSERT(pcidevs_locked());

    ASSERT(rw_is_write_locked(&pdev->domain->pci_lock));

> +
> +    vpci_remove_device(pdev);
> +    return vpci_add_handlers(pdev);
> +}
> +
>  #endif /* __XEN__ */
>  
>  static int vpci_register_cmp(const struct vpci_register *r1,

