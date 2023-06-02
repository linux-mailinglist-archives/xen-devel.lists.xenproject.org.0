Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 556C871FB4F
	for <lists+xen-devel@lfdr.de>; Fri,  2 Jun 2023 09:46:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.542980.847494 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4zTU-0006Ei-Lf; Fri, 02 Jun 2023 07:45:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 542980.847494; Fri, 02 Jun 2023 07:45:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4zTU-0006CP-Id; Fri, 02 Jun 2023 07:45:28 +0000
Received: by outflank-mailman (input) for mailman id 542980;
 Fri, 02 Jun 2023 07:45:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0i3i=BW=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1q4zTT-0006CJ-RH
 for xen-devel@lists.xenproject.org; Fri, 02 Jun 2023 07:45:27 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20617.outbound.protection.outlook.com
 [2a01:111:f400:7e8a::617])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6ee3dfc9-0119-11ee-8611-37d641c3527e;
 Fri, 02 Jun 2023 09:45:25 +0200 (CEST)
Received: from MW4P222CA0014.NAMP222.PROD.OUTLOOK.COM (2603:10b6:303:114::19)
 by PH0PR12MB7908.namprd12.prod.outlook.com (2603:10b6:510:28e::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.24; Fri, 2 Jun
 2023 07:45:21 +0000
Received: from CO1NAM11FT073.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:114:cafe::f7) by MW4P222CA0014.outlook.office365.com
 (2603:10b6:303:114::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.23 via Frontend
 Transport; Fri, 2 Jun 2023 07:45:21 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT073.mail.protection.outlook.com (10.13.174.196) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6455.23 via Frontend Transport; Fri, 2 Jun 2023 07:45:20 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 2 Jun
 2023 02:45:20 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 2 Jun
 2023 00:45:19 -0700
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Fri, 2 Jun 2023 02:45:18 -0500
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
X-Inumbo-ID: 6ee3dfc9-0119-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SirzQ/im7Aovl7Nb68+ks55pqwcHM3KyF9k85GcpR+MrP28rEX+gLY+R6RBeauP0u5Ri+JC1Hj0/cXiML7djC7r7M1vP9JW0X63fZrf0oxIsVa+dPtU5hZoOrJ/Q+zd6UEbBGoR2d6kh0gAVF3TbkffWUhbS6JFvl4b2S9xbG/vKK4jagL3kH9P2rfCSJB6ap8UaONThvn2mkP+J/KBWOvsDfIux+c7h6lMYrqE3JLAubFHmtM/rtsdD1zvC7kGTT/KuIbn6eTHJ0MKsxSyKMmAwVoGl3JssLnvN/Kfk8OdLpbaBw5DPLtLhXCMo6DOWzvGPSaeW0Gq+zPUtuKrbOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/T0hDm9iVFs+fVU4clQnFY0EpKmEM1s4nlNkyk4Nk+A=;
 b=KR2q/YRdL3YuVK/9e9GpE0njXPXOQKSNVzECiIcm6KGfq8gi/tXHdtW6h1Jx8qMsJpmn+h8ecYxvSCqBEH5WY1osH6c8yrJI5e2E6gT/LlGGmyywfRgREgwHC3kBorxrP/5c8cKdbvOKSoEiIpq9AIHfqNwosilMFuP5gdpTnKwF/Fupc1oImiYqMwlL4a/Ot9Df1gwUNugPWsoijetlJqKmy+T7kr6efTqEF344kz2sqQ79R5v+Y5HOIhRSpiaSLmGiasTziitFW3xir8dkFN7oLb5NgSc25iXHi2i0Aokp7U8iMDByviLYztxYVJ2DyjubxGW1ZmTJg4XQl4QHOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/T0hDm9iVFs+fVU4clQnFY0EpKmEM1s4nlNkyk4Nk+A=;
 b=1hQioBLw89EKHXJ203y9HvcDRcxYZvdtGUMilgbs6qxRrT1KqQ7dZCIihiG7Ld8MXoOMa+XRFLwx4IUnYxkoqQlAA48+thQplIveTmk4uXTi3aEzRWeRvD7LSrvJMRNsdR0hRtN8yMhvKqszGGZ6aoYHdOysDx8Zyi2+MV/M4H4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <a818b17e-c471-7920-d650-fa9736b514f3@amd.com>
Date: Fri, 2 Jun 2023 09:45:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [XEN][PATCH v7 09/19] xen/iommu: Move spin_lock from
 iommu_dt_device_is_assigned to caller
Content-Language: en-US
To: Vikram Garhwal <vikram.garhwal@amd.com>, <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
References: <20230602004824.20731-1-vikram.garhwal@amd.com>
 <20230602004824.20731-10-vikram.garhwal@amd.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20230602004824.20731-10-vikram.garhwal@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT073:EE_|PH0PR12MB7908:EE_
X-MS-Office365-Filtering-Correlation-Id: 5eaf869e-d423-469d-95fb-08db633d5132
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	I8cYsd22zkKFL/zE8tft71rT3wpzXxTq7G5bzGxON+ymvx1tH7BfFzsB4P360Xezqdmk9omC0xB+oHODa2fBZMu0LUokplN3PH9WZE5nphPHE4but5frsSpYFEkhPwu5LDmaYXPnlRsXPLOzOAo7BfwUT2bwQwdDOLp35aEYereUt4WH502WKeQGnRTnOINVCbNxEBsLnsqQY1/5Cl4hvtAsTJJLVBOCEAshjIoA+L6nIUokeRLJflHGxHEQo+V27GlGmhtCULN5EUQP70xk3as0IOxSPTmu4HdlSdFup0Vru3nJ79sOes2AjUmh1jNVv78PZo3iAYL0Hz4rXLBwjJwWBij28qjV6STp/XJL/YLCIKne+U5rRMyyPtDNkaoa6gxcpqiwkk9efdMSFiqlm77s4sXF0VJC/Jc64y/7fte+rK1QUcLwO0tQtH23QGRYOwfgy0whCdxSiShEDbx8+Gc17y6bIp87kULWukspFU4jDEM2NsGXBau8Qb6ZIEt5GZv5KTA5fvAEvXNYqUYAF9qlpq1dqOyyQERfnn22FC9X2DGAcQxvdD+EgWqSe6TicrXy+wsG9T/06jvI24wyPBjIUSkqCccPrw+s5Y7yTMK+KdKXzvXiS4OMceLbWWg1Z2q63ijLZZ00QRp2iXkFOOx5e+L3Xecm09m6Y7qI7epig8wNpn02IaZY7fqaYhvqtwggnDCBHXP9zmwWY+jQzA82s/jnZ/qTY05WyeIr4inF6HhNSyrJ1jTegbUdwcR29e65V0+cRZowImMOGqK35U1nQ7OesrIbVejmVYcvy1UaMgCPRxuT7YbKmtMMWB3u
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(136003)(346002)(376002)(451199021)(40470700004)(36840700001)(46966006)(36756003)(2616005)(47076005)(40460700003)(83380400001)(426003)(336012)(2906002)(86362001)(31696002)(82310400005)(40480700001)(36860700001)(81166007)(82740400003)(356005)(41300700001)(316002)(5660300002)(8676002)(8936002)(54906003)(110136005)(478600001)(16576012)(4326008)(70206006)(31686004)(26005)(53546011)(70586007)(186003)(44832011)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2023 07:45:20.7919
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5eaf869e-d423-469d-95fb-08db633d5132
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT073.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7908


On 02/06/2023 02:48, Vikram Garhwal wrote:
> Rename iommu_dt_device_is_assigned() to iommu_dt_device_is_assigned_locked().
> Remove static type so this can also be used by SMMU drivers to check if the
> device is being used before removing.
> 
> Moving spin_lock to caller was done to prevent the concurrent access to
> iommu_dt_device_is_assigned while doing add/remove/assign/deassign.

Would be nice to explain the need of putting a prototype into a private header.

> 
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
> 
> ---
> Changes from v6:
>     Created a private header and moved iommu_dt_device_is_assigned() to header.
> ---
>  xen/drivers/passthrough/device_tree.c | 20 ++++++++++++++++----
>  xen/include/xen/iommu-private.h       | 27 +++++++++++++++++++++++++++
>  2 files changed, 43 insertions(+), 4 deletions(-)
>  create mode 100644 xen/include/xen/iommu-private.h
> 
> diff --git a/xen/drivers/passthrough/device_tree.c b/xen/drivers/passthrough/device_tree.c
> index 1c32d7b50c..52e370db01 100644
> --- a/xen/drivers/passthrough/device_tree.c
> +++ b/xen/drivers/passthrough/device_tree.c
> @@ -18,6 +18,7 @@
>  #include <xen/device_tree.h>
>  #include <xen/guest_access.h>
>  #include <xen/iommu.h>
> +#include <xen/iommu-private.h>
>  #include <xen/lib.h>
>  #include <xen/sched.h>
>  #include <xsm/xsm.h>
> @@ -83,16 +84,14 @@ fail:
>      return rc;
>  }
>  
> -static bool_t iommu_dt_device_is_assigned(const struct dt_device_node *dev)
I would write a comment that this function expects to be called with dtdevs_lock locked.

> +bool_t iommu_dt_device_is_assigned_locked(const struct dt_device_node *dev)
>  {
>      bool_t assigned = 0;
>  
>      if ( !dt_device_is_protected(dev) )
>          return 0;
>  
> -    spin_lock(&dtdevs_lock);
>      assigned = !list_empty(&dev->domain_list);
> -    spin_unlock(&dtdevs_lock);
>  
>      return assigned;
>  }
> @@ -213,27 +212,40 @@ int iommu_do_dt_domctl(struct xen_domctl *domctl, struct domain *d,
>          if ( (d && d->is_dying) || domctl->u.assign_device.flags )
>              break;
>  
> +        spin_lock(&dtdevs_lock);
> +
>          ret = dt_find_node_by_gpath(domctl->u.assign_device.u.dt.path,
>                                      domctl->u.assign_device.u.dt.size,
>                                      &dev);
>          if ( ret )
> +        {
> +            spin_unlock(&dtdevs_lock);
>              break;
> +        }
>  
>          ret = xsm_assign_dtdevice(XSM_HOOK, d, dt_node_full_name(dev));
>          if ( ret )
> +        {
> +            spin_unlock(&dtdevs_lock);
>              break;
> +        }
>  
>          if ( domctl->cmd == XEN_DOMCTL_test_assign_device )
>          {
> -            if ( iommu_dt_device_is_assigned(dev) )
> +
> +            if ( iommu_dt_device_is_assigned_locked(dev) )
>              {
>                  printk(XENLOG_G_ERR "%s already assigned.\n",
>                         dt_node_full_name(dev));
>                  ret = -EINVAL;
>              }
> +
> +            spin_unlock(&dtdevs_lock);
>              break;
>          }
>  
> +        spin_unlock(&dtdevs_lock);
> +
>          if ( d == dom_io )
>              return -EINVAL;
>  
> diff --git a/xen/include/xen/iommu-private.h b/xen/include/xen/iommu-private.h
> new file mode 100644
> index 0000000000..5615decaff
> --- /dev/null
> +++ b/xen/include/xen/iommu-private.h
> @@ -0,0 +1,27 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> + /*
incorrect indentation (<< 1)

> + * xen/iommu-private.h
> + *
> + *
> + * Copyright (C) 2023, Advanced Micro Devices, Inc. All Rights Reserved.
> + * Written by Vikram Garhwal <vikram.garhwal@amd.com>
I'm not sure if placing the copyright is appropriate, given a single prototype for a function
not really implemented by you with just spinlocks removed. But I might be wrong.

> + *
> + */
> +#ifndef __XEN_IOMMU_PRIVATE_H__
> +#define __XEN_IOMMU_PRIVATE_H__
> +
> +#ifdef CONFIG_HAS_DEVICE_TREE
> +#include <xen/device_tree.h>
> +bool_t iommu_dt_device_is_assigned_locked(const struct dt_device_node *dev);
> +#endif
> +
> +#endif /* __XEN_IOMMU_PRIVATE_H__ */
empty line here please

> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * tab-width: 4
> + * indent-tabs-mode: nil
> + * End:
> + */

~Michal

