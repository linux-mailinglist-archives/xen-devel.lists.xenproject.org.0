Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72662721EFB
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jun 2023 09:10:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.543493.848528 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q64M2-0005Xq-UE; Mon, 05 Jun 2023 07:10:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 543493.848528; Mon, 05 Jun 2023 07:10:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q64M2-0005VX-R6; Mon, 05 Jun 2023 07:10:14 +0000
Received: by outflank-mailman (input) for mailman id 543493;
 Mon, 05 Jun 2023 07:10:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RPmL=BZ=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1q64M1-0005VR-8R
 for xen-devel@lists.xenproject.org; Mon, 05 Jun 2023 07:10:13 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20627.outbound.protection.outlook.com
 [2a01:111:f400:fe59::627])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 017a2ac2-0370-11ee-8611-37d641c3527e;
 Mon, 05 Jun 2023 09:10:10 +0200 (CEST)
Received: from MW4PR04CA0133.namprd04.prod.outlook.com (2603:10b6:303:84::18)
 by PH0PR12MB5401.namprd12.prod.outlook.com (2603:10b6:510:d4::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Mon, 5 Jun
 2023 07:10:06 +0000
Received: from CO1NAM11FT020.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:84:cafe::b) by MW4PR04CA0133.outlook.office365.com
 (2603:10b6:303:84::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32 via Frontend
 Transport; Mon, 5 Jun 2023 07:10:06 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT020.mail.protection.outlook.com (10.13.174.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6455.32 via Frontend Transport; Mon, 5 Jun 2023 07:10:05 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 5 Jun
 2023 02:10:04 -0500
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Mon, 5 Jun 2023 02:10:03 -0500
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
X-Inumbo-ID: 017a2ac2-0370-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wr20ozW52iiDAjxBdpDTHD/A/BopfxY1uokQQPQHUx0Gd/YQIQAzPwSZFEL+m2X5Ozt5SSJMp6n/bu6H66J7ITVSFAKPeVck45tSS7VFj3NzzU9JVEFpb6b3ghGDSohrB4rxC9RfLRJY8CUJ10B97nNZcx7dVbnuutOV4vV2CElGspZABTns26VVJeCue8UP2J3zzRQaOslb3IpzQHEBsj+wGKJD+erxXNoprV1l9LsOw3yMACIGBPHxI9XG9h7B4h8smLOBm4I0S5x6AOVHkbJxY0SZcmkt9Bne4WT80DPrYFhm6qdO4DlQmzMGioiVBknZwMGsLBx5LoYYXgKOvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wv1UHJQbMWvfZVD0DjVSTn2BOkZj2YdJsv4PA8ApvgI=;
 b=UZovkzK0vSaOMecIQP+OPFxgIc63PG0Drs24DTA/nb4J0Ap7WFF+XbDbC/nqqAK4Hi+lBmLfeXMwzBpxQCD0SRI4DG2qgRGBxlCWCcfmfsfaYFfIpvEzpsRW045XPhsC3ejWC8nP22bZLSYwKEuzP2dvtiZhyvPalzkNubFESX0vI2dEskf4UYSp2pjCV8fFZsS1shRA3bkKlCBl4o9s3HVuzQMB/2l0zcR3OxP7aOQe26TpIKuQnfD2NEunyxQjA0/t5IirkF9Vm09Q9UkOSg2/5goNy9nPQbUO7On5BFWITAi1YlZtVXrgnh2a6oU6LkWM5q+ypKpcVlG95ej/rA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wv1UHJQbMWvfZVD0DjVSTn2BOkZj2YdJsv4PA8ApvgI=;
 b=fCENPEfjiC6xLMGt7sdGTlhs1ik43QVinMJZ9OTV9n2krbC6wGaADBnCoLpkbs3Tek3cpVOS1K4Fj+U/zFmpevwe9TM/sDqdV7MEDg8gJtISh19AWfOA9qteZVbxW5CG1cRZWFQdsZ9vQ5X6cSop33qeo1ZQh9xqZm5cbDB9qFs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <5c7450e4-88c4-e653-0d7a-2675f2c7b953@amd.com>
Date: Mon, 5 Jun 2023 09:10:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [XEN][PATCH v7 14/19] common/device_tree: Add rwlock for dt_host
To: Vikram Garhwal <vikram.garhwal@amd.com>, <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>
References: <20230602004824.20731-1-vikram.garhwal@amd.com>
 <20230602004824.20731-15-vikram.garhwal@amd.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20230602004824.20731-15-vikram.garhwal@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT020:EE_|PH0PR12MB5401:EE_
X-MS-Office365-Filtering-Correlation-Id: c1eb6d91-09a6-42f4-d177-08db6593e3da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	R/NOKfTYAwEBgWv565NY/wIHkHonWj1xZ75gQdznEYRbobQMC+dHVXjUqZfiUVBV3lunHpCjqii5MzbPL1FI0nYeF11fYcHrqaC6gRxuVInycwRc6p+FaXT5qLiUfScm8ST3vmqsHK40su4AvI7TCOSk/ETwaQBofB9xhjNDtr/CtnfbE/OnkE8rSgTGLngEaX+LmsJHxMgQ1PWRYddPl1i+Q4Dz69jJhOZH/96jqhzSKyu+JJ6yG5f8YffDOcYO8O5P+Q7lzaqgIWKp1csbAW6K2/pu6h9sZ6wZ+IjMWEENbPg3/Qmka2RBRLCd6fJpjE0QWDAfyj2N2kePNcBjFIZYe259a4A8XkeOGWtrZvcsIywPH/kalQYME1e14pb8Mt0Ig3BJPFBj1lDuWvdXX87MXR/IBVNzjjnr3qk9t/xZIsq+7y36CBY0Xk7eVeweTIgScHGHsw5AeftFSPsE88sFMa0pEB4/mvDw6mT/r1BZg5ElPHqezT5T9AxNnJcX7nUXvJys+d5+kzh9KF81xKEJaQs6vboEyY6DutnY/boNRT0+6Sy5j3YFysnN4UMTAGu0d+3SBHLGOsgBfWaBqNRf2H6CalL3j+4BkhoIp9ZoYT869N8D1ma1cIANz1I+MYWJnUSRLct2jC8kM94nOZGJ89fcuH8vQY9yiDmabNawDHcBALfC+1ga2DNCAXy2OMqq/aplxevE6hjQQ+85hxgWVTTFn+uiHljRq6pBe5SniVRpDdMWHDtxZEUkYjKqw1uSQRetI/LJfdPoddnDex1YBH7X1NJqw32zH+Bfw9MfkJ2mf8frxGF4JzfYeacu
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(39860400002)(396003)(136003)(451199021)(36840700001)(40470700004)(46966006)(41300700001)(316002)(54906003)(110136005)(44832011)(356005)(81166007)(82740400003)(16576012)(5660300002)(2906002)(4326008)(70586007)(70206006)(31686004)(8676002)(8936002)(478600001)(40460700003)(82310400005)(31696002)(86362001)(186003)(36756003)(2616005)(53546011)(426003)(336012)(36860700001)(40480700001)(26005)(47076005)(83380400001)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2023 07:10:05.9017
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c1eb6d91-09a6-42f4-d177-08db6593e3da
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT020.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5401

Hi Vikram,

On 02/06/2023 02:48, Vikram Garhwal wrote:
>  Dynamic programming ops will modify the dt_host and there might be other
>  function which are browsing the dt_host at the same time. To avoid the race
>  conditions, adding rwlock for browsing the dt_host during runtime.
> 
>  Reason behind adding rwlock instead of spinlock:
>     For now, dynamic programming is the sole modifier of dt_host in Xen during
>         run time. All other access functions like iommu_release_dt_device() are
>         just reading the dt_host during run-time. So, there is a need to protect
>         others from browsing the dt_host while dynamic programming is modifying
>         it. rwlock is better suitable for this task as spinlock won't be able to
>         differentiate between read and write access.
> 
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
> 
> ---
> Changes from v6:
>     Remove redundant "read_unlock(&dt_host->lock);" in the following case:
>          XEN_DOMCTL_deassign_device
> ---
>  xen/common/device_tree.c              |  4 ++++
>  xen/drivers/passthrough/device_tree.c | 15 +++++++++++++++
>  xen/include/xen/device_tree.h         |  6 ++++++
>  3 files changed, 25 insertions(+)
> 
> diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
> index c5250a1644..c8fcdf8fa1 100644
> --- a/xen/common/device_tree.c
> +++ b/xen/common/device_tree.c
> @@ -2146,7 +2146,11 @@ int unflatten_device_tree(const void *fdt, struct dt_device_node **mynodes)
>  
>      dt_dprintk(" <- unflatten_device_tree()\n");
>  
> +    /* Init r/w lock for host device tree. */
> +    rwlock_init(&dt_host->lock);
unflatten_device_tree() is called for dt_host and will also be used when adding a new dt overlay meaning that
rwlock_init for dt_host will be called multiple times (even if mynodes != &dt_host) which is rather strange.

> +
>      return 0;
> +
>  }
>  
>  static void dt_alias_add(struct dt_alias_prop *ap,
> diff --git a/xen/drivers/passthrough/device_tree.c b/xen/drivers/passthrough/device_tree.c
> index 301a5bcd97..f4d9deb624 100644
> --- a/xen/drivers/passthrough/device_tree.c
> +++ b/xen/drivers/passthrough/device_tree.c
> @@ -112,6 +112,8 @@ int iommu_release_dt_devices(struct domain *d)
>      if ( !is_iommu_enabled(d) )
>          return 0;
>  
> +    read_lock(&dt_host->lock);
> +
>      list_for_each_entry_safe(dev, _dev, &hd->dt_devices, domain_list)
>      {
>          rc = iommu_deassign_dt_device(d, dev);
> @@ -119,10 +121,14 @@ int iommu_release_dt_devices(struct domain *d)
>          {
>              dprintk(XENLOG_ERR, "Failed to deassign %s in domain %u\n",
>                      dt_node_full_name(dev), d->domain_id);
> +
> +            read_unlock(&dt_host->lock);
>              return rc;
>          }
>      }
>  
> +    read_unlock(&dt_host->lock);
> +
>      return 0;
>  }
>  
> @@ -246,6 +252,8 @@ int iommu_do_dt_domctl(struct xen_domctl *domctl, struct domain *d,
>      int ret;
>      struct dt_device_node *dev;
>  
> +    read_lock(&dt_host->lock);
> +
>      switch ( domctl->cmd )
>      {
>      case XEN_DOMCTL_assign_device:
> @@ -295,7 +303,10 @@ int iommu_do_dt_domctl(struct xen_domctl *domctl, struct domain *d,
>          spin_unlock(&dtdevs_lock);
>  
>          if ( d == dom_io )
> +        {
> +            read_unlock(&dt_host->lock);
>              return -EINVAL;
> +        }
>  
>          ret = iommu_add_dt_device(dev);
>          if ( ret < 0 )
> @@ -333,7 +344,10 @@ int iommu_do_dt_domctl(struct xen_domctl *domctl, struct domain *d,
>              break;
>  
>          if ( d == dom_io )
> +        {
> +            read_unlock(&dt_host->lock);
>              return -EINVAL;
> +        }
>  
>          ret = iommu_deassign_dt_device(d, dev);
>  
> @@ -348,5 +362,6 @@ int iommu_do_dt_domctl(struct xen_domctl *domctl, struct domain *d,
>          break;
>      }
>  
> +    read_unlock(&dt_host->lock);
>      return ret;
>  }
> diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
> index e239f7de26..dee40d2ea3 100644
> --- a/xen/include/xen/device_tree.h
> +++ b/xen/include/xen/device_tree.h
> @@ -18,6 +18,7 @@
>  #include <xen/string.h>
>  #include <xen/types.h>
>  #include <xen/list.h>
> +#include <xen/rwlock.h>
Sort alphabetically (despite list.h not being placed correctly)

>  
>  #define DEVICE_TREE_MAX_DEPTH 16
>  
> @@ -106,6 +107,11 @@ struct dt_device_node {
>      struct list_head domain_list;
>  
>      struct device dev;
> +
> +    /*
> +     * Lock that protects r/w updates to unflattened device tree i.e. dt_host.
> +     */
No need for multiline comment style

> +    rwlock_t lock;
>  };
>  
>  #define dt_to_dev(dt_node)  (&(dt_node)->dev)

~Michal

