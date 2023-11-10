Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E7927E7A43
	for <lists+xen-devel@lfdr.de>; Fri, 10 Nov 2023 09:49:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.629971.982556 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1NCj-0004n2-5A; Fri, 10 Nov 2023 08:49:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 629971.982556; Fri, 10 Nov 2023 08:49:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1NCj-0004k7-25; Fri, 10 Nov 2023 08:49:29 +0000
Received: by outflank-mailman (input) for mailman id 629971;
 Fri, 10 Nov 2023 08:49:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jLlG=GX=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r1NCh-0004k1-DJ
 for xen-devel@lists.xenproject.org; Fri, 10 Nov 2023 08:49:27 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on20617.outbound.protection.outlook.com
 [2a01:111:f400:fe16::617])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0b3b17a4-7fa6-11ee-98da-6d05b1d4d9a1;
 Fri, 10 Nov 2023 09:49:22 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB9256.eurprd04.prod.outlook.com (2603:10a6:102:2ba::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.7; Fri, 10 Nov
 2023 08:49:19 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7002.010; Fri, 10 Nov 2023
 08:49:19 +0000
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
X-Inumbo-ID: 0b3b17a4-7fa6-11ee-98da-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jftiYTFn8yRNdYuNNwJDPb1yMjzbfrHsmjiXM7aqLDNm0ZAF/7b/6JFsM7XeDbhzvI8ZT95cxpXj39OCene3Ii87Z8jSqik2tGnJsjoaVRSiTBNXtPM3dlq/I/nmrfMWasAqEKP/IRDBxVB2U10PIr6cL9musECX5dKcyfqTkZuC4SCc6c6846YgMlW0U+gGT/JfnugX0ObATDtyZd2hfUIvg9jQacIczShM+Z/MxJgz8Df8kNBJTuhomfK5sSZLh0hqyXrde6rzcynS1owvLAbqaaRvC18UjZb/H9nobE5r3nfLOhGlrMnm+rbIcNCdITp7bxSY8FSgEEpO1kVwyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VdAy+DbHA4fen4I7Q0wGE7FKajiINCdDgJJRddZO/ag=;
 b=ZWMOGlBf6XBj8XA6+VPDVhHeoszQkHdPdln0X7OqvonFFN02QkpbrpElwx77I1AluAejQ8W/2VaA754yE0UuwdTjn5iyscGXEX1oKU3WCAsyReC0grQJJPuYEbTscLUIQ5JgW76RE4r5cQOEBQo4S1Dy8wLW2kXetO03XZkhe306stanlgODSs9lC4d53eIjMr5AUuVkmFJbFOksKBngIgwvkKt97EEixD7bxlfBjmKeFUpnrAvhNBa8OjrBNnerktAWjGHAIvyzHNwwHkdgRZWKkCMqYrDDXqPNzRrl4u5WaX8Zh1Hb5mJJpydKW1hBkDCKQ//nAi6Mqd0Gybx9Kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VdAy+DbHA4fen4I7Q0wGE7FKajiINCdDgJJRddZO/ag=;
 b=DAGWCnWNWpGOJZUkmo6IbLxdxK7blMFzFkwdHeBuq0CzC/8qSAygDR6+S0B4WPQVwqMS671Hu0aOHcdkq2DZaVAId3nVTeOUf3w9dpZtrFm7yPMwtkcwjtdUl6pCnyfEzqVODjYCI1dtKA0I5ZVbfFnpYWOMFL/bJy/rRZuESB6gGbG024LzRP1Jr5N+efMtNiRayp9NkUFaNPTOlHKPCj/mYBsvqRAjSFaJ4HkgE756cBykwxzIKkmJonNS2yG5uGb30gVaCia6WRK1AoDfYk+PT25uZ3asRg/E248mneh/5/QCKqbrtsVUqY0Sc6mBW3GRVoBZY0t27TEfEBv8EQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7dae06e0-394f-727d-c76f-f33e1d9e190b@suse.com>
Date: Fri, 10 Nov 2023 09:49:16 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v6 3/9] iommu/arm: Introduce iommu_add_dt_pci_sideband_ids
 API
Content-Language: en-US
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Paul Durrant <paul@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Rahul Singh <rahul.singh@arm.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, xen-devel@lists.xenproject.org
References: <20231109182716.367119-1-stewart.hildebrand@amd.com>
 <20231109182716.367119-4-stewart.hildebrand@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20231109182716.367119-4-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0151.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::12) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB9256:EE_
X-MS-Office365-Filtering-Correlation-Id: 15c2eceb-9484-43ee-8e20-08dbe1c9eda4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BWSLVW1n7EQUM/XrTvTffd6VPCuOcI2Gj+pmYlvdqzIpTiDSaX+/vG9gmgWApU3VA6kMsPNhh2HyJNLu3qbrN6tTaeRZOEfLser0F4sA69SvOAWp72meDchdynh7D+7v3lCKlu84G+olAYfP22swKLt97qoGmVKVliuG/0K9STnIv0rjyUqwZ+VnjYjmDR/zabBdThM50MLqENflBycqo4oiifflj8vrxgFA+wocm1RdQqbLDgsnWyn8Tq8buiu9JUux7Ml0jghx1tWQmseYvkyaZsV0Iq9f6Yw6GJGYVZBoLzXgheuwhVRG7XuSOAVPzifSX8uupAmQ97T/KSgVGcGX//OwpQv7e9MCCcjp4IuWmEo9zT/WOXmToPjaJ4qRgcC7/JYXSaZLnMIwW7IWVURzRI6A830tOC0uVzckXsjN3O7xHqT6yE1IZZK+oUmm82Ak2Ec3J5Wc6cRSr+m/uzZP0f2rN3qf/kfehxRQ6U4F1SOVNB9IHD1LqY9aMx2/lmGoPrtO6bI0Ai7CmogcRbCovstZy7cQKseDAYkja8HOFODgwxRinkiJhJjhr8kD7fk9h4mTGjhEWVn5TGv59bp4rgpB/Di1sK7ihTA1NnnraA8SIWVtxC+2jVCZ8V8/kFDiLnuN/+6PAXG8zkUZOfGu7iLEWgh2Sqn1CgFHWAg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(376002)(396003)(346002)(39860400002)(136003)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(2616005)(478600001)(6486002)(6512007)(53546011)(6506007)(966005)(6666004)(30864003)(2906002)(83380400001)(66556008)(316002)(41300700001)(6916009)(26005)(5660300002)(66946007)(66476007)(54906003)(8936002)(4326008)(8676002)(38100700002)(36756003)(31696002)(86362001)(66899024)(31686004)(2004002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dG9lWEJTcXNiWi8wUFVrT3lESTBPK0pZV2JNSFp4ZDNxaDVqZGc2UkM0eHNj?=
 =?utf-8?B?bktaZjVCVWVlajVXZlRkQXpuMTRDWWQ2TG9FZ2luUjhqYWxxV1NhQ0orZnhw?=
 =?utf-8?B?ZkRTS2ptR3FTb2c4SThJc3psdk0wanVTT2N1clFMeUVBR25QZ1ZVa0VZalFW?=
 =?utf-8?B?R0FKQit3dDhRRnZVckxsbU9DR1V2WllZWWNDQm1mMWtKZWJGcVVhSWlYR1Vi?=
 =?utf-8?B?ZXBkb3FnT200c2NOeGp3T2VvNEcrODZZQ1ZwaTZqQ2pwbFdsYjltc2xFS2Z2?=
 =?utf-8?B?dUIva2wyMFBTWk5NQW5TMlUyVFMvZlF5VHFwMGx4elpQeTZTOUYvTjJMU2p1?=
 =?utf-8?B?VkNKcUIrRGhYekNnWW5DeWViVlVwd1dWNWZWNm9md0hSaUpYSHlscTdPUmlD?=
 =?utf-8?B?dHB2cHNkOE1tTnJOUFBBdkZ3R0ZpMnVSR0JrTkg5c2FVZDJ0OXhzVHJJT0Nr?=
 =?utf-8?B?ZFI3aWwvVnREQVdwa1h1blc0bC9WWVBBTk80RDQ1RnZLVllQWDBzNTZxb0lj?=
 =?utf-8?B?bzJsZFVIaFRyOUZUUWswMzUxMzM5M3k3QXUxS3dYZ3R6MlRadEN4bzVraGlk?=
 =?utf-8?B?c0JEVUxtN1NRMGR2QkxNS0pxUjdFYkVkVnIvLzU5bkFoZFZ6RE1VaGFGN1VE?=
 =?utf-8?B?bE9rWGlsZ1h2WkxQSmVoSkZQckFBeGJlbENGcjJqQXhlRkI2TWlYd0I4Rlhw?=
 =?utf-8?B?OVhqM0FWNStwQWNWeWxBek1MSUNNOEc3SlNvTHA2R3d3NzZyUDk1aEk1S1Mx?=
 =?utf-8?B?MWhOcmlXYm5CWENWaGhmTzQ0cmZiVFhqemJGZEJmUzI5TlRwdWZHcUJnY0dD?=
 =?utf-8?B?U1d6NnhVNVhROHZabVJURnFxT1N3V0dtNW1pV1VuSkg5RVlGOUJvK0FYTUp4?=
 =?utf-8?B?S3Nlb3NhblRZRkdpdmQ0OGlVYlB4Tml2N2VJNnAwZ2Uxb0NkcnVsMnJYbGRU?=
 =?utf-8?B?Z1pMVGdYMHBMS2p1OC9kZjI2Y0ZWYWo3c1FtWmU4LzJTVzJXWTRXamtCT01q?=
 =?utf-8?B?U29JMjJDbFFpeHJZQVlKTk9XaE1EakZvQ2FlUnYxZjFCWXQvYlMyVnhQeFBY?=
 =?utf-8?B?STdQRFhaMExaalZoMUl2Y1JkdTkyakhGNUZUMTRQeHQ5M2t2ZUpnMGlZREtr?=
 =?utf-8?B?enJiWTdBY2hsSnByaklxTHpOMWRpVmJtaXZka1V4d2IrQnh3VkR6cXNFL3pL?=
 =?utf-8?B?NjdNWENzd1hKaEtqL0hKYVgydG82ZFdIVGRUQWhHSzNoMnZuZmVzdUlvcFVE?=
 =?utf-8?B?QTBBcUpxRXdhQWV3Q3pMWXJ3VnJiWWZwZzlNWWNkZDUzQ0dOcWsyaVVmOGVr?=
 =?utf-8?B?cExMdE05TzdOZDdvVFIvQ0hKU0RNMW1ZK3RDaEZaMmsxbDRWUWsyMGlsNE5x?=
 =?utf-8?B?a2VUT0pCbnhzSEdUUVZLVTFRQnVlMVJpQ2tLZDdFRlZkNXZDUEFCRitiajJR?=
 =?utf-8?B?SVJBdGJGUW9PNFBvL0czMWh2M1NMdGR4REdMb0YxQ1RKRWc5RFFXTUxwK2Q0?=
 =?utf-8?B?TVZ5dE5JdFAzY0ZST0Y4aFI5cmFjamFmYUR2TGdTMlR2RnhiS2s3VmFrMHlX?=
 =?utf-8?B?R0FIeDhqc3lWdVZPVnJtNzFhWDhMSHVUbHZWWmFBalJIRkZMMUY4VEpQQ01Z?=
 =?utf-8?B?ZVJUQzhXTTRreU5PV2F5eFpvQXNZbXpmWUZCYktTTjR3MEJlZXlPVzFOTWxZ?=
 =?utf-8?B?Q2JVV3JqcXlSNGNpZGovb0tDdUZOSzNya2tNU2NoRmlrbzJZZWdrQmhoME9r?=
 =?utf-8?B?Mk9OclV3cFlIZ3FTcG9uRWg3SDN5T09iNmlHelo3UUR6enBDLytsbkhiMDkv?=
 =?utf-8?B?ZUNyRStNY0xtT3E0SENyTk9laGg4d3BEY0U3d1pDZVdmb2x3cTZGRWpvV1Z3?=
 =?utf-8?B?TFZUZmZoUWkwUGljSHVRY3FTeUxNcWU4Z2dvbHJZWER6bWZMejludmhEVUlS?=
 =?utf-8?B?M2FCUFlVU2NZOXJWbFlZNWN0TnhqTDVESEc0UmJZQWhqQndPenBqOGUzN0Np?=
 =?utf-8?B?c05iNXB5SVA0SERRRVpBZkdHM3dKNHBQV2lmRlcrNjBoRGZpV00xT0sycmRS?=
 =?utf-8?B?cGlYTS9zalpxaldYVnMzVnhHNlFCWWUrMzh6M3I5aWdUOGU3SGhBQUJSZDh0?=
 =?utf-8?Q?OY3+SSH30IiTtOQNytPSZak5M?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15c2eceb-9484-43ee-8e20-08dbe1c9eda4
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2023 08:49:19.6435
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uciI+iV2N0J8Cq+kgq0rT6MlgpkBfmNvdUFaKkDgX+RYxWXD9pUgEdaUu4AoFob6loragYF3G7NeGBNCEJEBTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9256

On 09.11.2023 19:27, Stewart Hildebrand wrote:
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> The main purpose of this patch is to add a way to register PCI device
> (which is behind the IOMMU) using the generic PCI-IOMMU DT bindings [1]
> before assigning that device to a domain.
> 
> This behaves similarly to the existing iommu_add_dt_device API, except it
> handles PCI devices, and it is to be invoked from the add_device hook in the
> SMMU driver.
> 
> The function dt_map_id to translate an ID through a downstream mapping
> (which is also suitable for mapping Requester ID) was borrowed from Linux
> (v5.10-rc6) and updated according to the Xen code base.
> 
> [1] https://www.kernel.org/doc/Documentation/devicetree/bindings/pci/pci-iommu.txt
> 
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> ---
> v5->v6:
> * pass ops to iommu_dt_xlate()
> 
> v4->v5:
> * style: add newlines after variable declarations and before return in iommu.h
> * drop device_is_protected() check in iommu_add_dt_pci_sideband_ids()
> * rebase on top of ("dynamic node programming using overlay dtbo") series
> * fix typo in commit message
> * remove #ifdef around dt_map_id() prototype
> * move dt_map_id() to xen/common/device_tree.c
> * add function name in error prints
> * use dprintk for debug prints
> * use GENMASK and #include <xen/bitops.h>
> * fix typo in comment
> * remove unnecessary (int) cast in loop condition
> * assign *id_out and return success in case of no translation in dt_map_id()
> * don't initialize local variable unnecessarily
> * return error in case of ACPI/no DT in iommu_add_{dt_}pci_sideband_ids()
> 
> v3->v4:
> * wrap #include <asm/acpi.h> and if ( acpi_disabled ) in #ifdef CONFIG_ACPI
> * fix Michal's remarks about style, parenthesis, and print formats
> * remove !ops->dt_xlate check since it is already in iommu_dt_xlate helper
> * rename s/iommu_dt_pci_map_id/dt_map_id/ because it is generic, not specific
>   to iommu
> * update commit description
> 
> v2->v3:
> * new patch title (was: iommu/arm: Introduce iommu_add_dt_pci_device API)
> * renamed function
>   from: iommu_add_dt_pci_device
>   to: iommu_add_dt_pci_sideband_ids
> * removed stale ops->add_device check
> * iommu.h: add empty stub iommu_add_dt_pci_sideband_ids for !HAS_DEVICE_TREE
> * iommu.h: add iommu_add_pci_sideband_ids helper
> * iommu.h: don't wrap prototype in #ifdef CONFIG_HAS_PCI
> * s/iommu_fwspec_free(pci_to_dev(pdev))/iommu_fwspec_free(dev)/
> 
> v1->v2:
> * remove extra devfn parameter since pdev fully describes the device
> * remove ops->add_device() call from iommu_add_dt_pci_device(). Instead, rely on
>   the existing iommu call in iommu_add_device().
> * move the ops->add_device and ops->dt_xlate checks earlier
> 
> downstream->v1:
> * rebase
> * add const qualifier to struct dt_device_node *np arg in dt_map_id()
> * add const qualifier to struct dt_device_node *np declaration in iommu_add_pci_device()
> * use stdint.h types instead of u8/u32/etc...
> * rename functions:
>   s/dt_iommu_xlate/iommu_dt_xlate/
>   s/dt_map_id/iommu_dt_pci_map_id/
>   s/iommu_add_pci_device/iommu_add_dt_pci_device/
> * add device_is_protected check in iommu_add_dt_pci_device
> * wrap prototypes in CONFIG_HAS_PCI
> 
> (cherry picked from commit 734e3bf6ee77e7947667ab8fa96c25b349c2e1da from
>  the downstream branch poc/pci-passthrough from
>  https://gitlab.com/xen-project/people/bmarquis/xen-arm-poc.git)
> ---
>  xen/common/device_tree.c              | 91 +++++++++++++++++++++++++++
>  xen/drivers/passthrough/device_tree.c | 42 +++++++++++++
>  xen/include/xen/device_tree.h         | 23 +++++++
>  xen/include/xen/iommu.h               | 24 ++++++-
>  4 files changed, 179 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
> index b1c29529514f..5cb84864b89b 100644
> --- a/xen/common/device_tree.c
> +++ b/xen/common/device_tree.c
> @@ -10,6 +10,7 @@
>   * published by the Free Software Foundation.
>   */
>  
> +#include <xen/bitops.h>
>  #include <xen/types.h>
>  #include <xen/init.h>
>  #include <xen/guest_access.h>
> @@ -2243,6 +2244,96 @@ int dt_get_pci_domain_nr(struct dt_device_node *node)
>      return (u16)domain;
>  }
>  
> +int dt_map_id(const struct dt_device_node *np, uint32_t id,
> +              const char *map_name, const char *map_mask_name,
> +              struct dt_device_node **target, uint32_t *id_out)
> +{
> +    uint32_t map_mask, masked_id, map_len;
> +    const __be32 *map = NULL;
> +
> +    if ( !np || !map_name || (!target && !id_out) )
> +        return -EINVAL;
> +
> +    map = dt_get_property(np, map_name, &map_len);
> +    if ( !map )
> +    {
> +        if ( target )
> +            return -ENODEV;
> +
> +        /* Otherwise, no map implies no translation */
> +        *id_out = id;
> +        return 0;
> +    }
> +
> +    if ( !map_len || (map_len % (4 * sizeof(*map))) )
> +    {
> +        printk(XENLOG_ERR "%s(): %s: Error: Bad %s length: %u\n", __func__,
> +               np->full_name, map_name, map_len);
> +        return -EINVAL;
> +    }
> +
> +    /* The default is to select all bits. */
> +    map_mask = GENMASK(31, 0);
> +
> +    /*
> +     * Can be overridden by "{iommu,msi}-map-mask" property.
> +     * If dt_property_read_u32() fails, the default is used.
> +     */
> +    if ( map_mask_name )
> +        dt_property_read_u32(np, map_mask_name, &map_mask);
> +
> +    masked_id = map_mask & id;
> +    for ( ; map_len > 0; map_len -= 4 * sizeof(*map), map += 4 )
> +    {
> +        struct dt_device_node *phandle_node;
> +        uint32_t id_base = be32_to_cpup(map + 0);
> +        uint32_t phandle = be32_to_cpup(map + 1);
> +        uint32_t out_base = be32_to_cpup(map + 2);
> +        uint32_t id_len = be32_to_cpup(map + 3);
> +
> +        if ( id_base & ~map_mask )
> +        {
> +            printk(XENLOG_ERR "%s(): %s: Invalid %s translation - %s-mask (0x%"PRIx32") ignores id-base (0x%"PRIx32")\n",
> +                   __func__, np->full_name, map_name, map_name, map_mask,
> +                   id_base);
> +            return -EFAULT;
> +        }
> +
> +        if ( (masked_id < id_base) || (masked_id >= (id_base + id_len)) )
> +            continue;
> +
> +        phandle_node = dt_find_node_by_phandle(phandle);
> +        if ( !phandle_node )
> +            return -ENODEV;
> +
> +        if ( target )
> +        {
> +            if ( !*target )
> +                *target = phandle_node;
> +
> +            if ( *target != phandle_node )
> +                continue;
> +        }
> +
> +        if ( id_out )
> +            *id_out = masked_id - id_base + out_base;
> +
> +        dprintk(XENLOG_DEBUG, "%s: %s, using mask %08"PRIx32", id-base: %08"PRIx32", out-base: %08"PRIx32", length: %08"PRIx32", id: %08"PRIx32" -> %08"PRIx32"\n",
> +               np->full_name, map_name, map_mask, id_base, out_base, id_len, id,
> +               masked_id - id_base + out_base);
> +        return 0;
> +    }
> +
> +    dprintk(XENLOG_DEBUG, "%s: no %s translation for id 0x%"PRIx32" on %s\n",
> +           np->full_name, map_name, id,
> +           (target && *target) ? (*target)->full_name : NULL);
> +
> +    if ( id_out )
> +        *id_out = id;
> +
> +    return 0;
> +}
> +
>  /*
>   * Local variables:
>   * mode: C
> diff --git a/xen/drivers/passthrough/device_tree.c b/xen/drivers/passthrough/device_tree.c
> index 4c35281d98ad..edbd3f17adc5 100644
> --- a/xen/drivers/passthrough/device_tree.c
> +++ b/xen/drivers/passthrough/device_tree.c
> @@ -161,6 +161,48 @@ static int iommu_dt_xlate(struct device *dev,
>      return ops->dt_xlate(dev, iommu_spec);
>  }
>  
> +#ifdef CONFIG_HAS_PCI
> +int iommu_add_dt_pci_sideband_ids(struct pci_dev *pdev)
> +{
> +    const struct iommu_ops *ops = iommu_get_ops();
> +    struct dt_phandle_args iommu_spec = { .args_count = 1 };
> +    struct device *dev = pci_to_dev(pdev);
> +    const struct dt_device_node *np;
> +    int rc;
> +
> +    if ( !iommu_enabled )
> +        return NO_IOMMU;
> +
> +    if ( !ops )
> +        return -EINVAL;
> +
> +    if ( dev_iommu_fwspec_get(dev) )
> +        return -EEXIST;
> +
> +    np = pci_find_host_bridge_node(pdev);
> +    if ( !np )
> +        return -ENODEV;
> +
> +    /*
> +     * According to the Documentation/devicetree/bindings/pci/pci-iommu.txt
> +     * from Linux.
> +     */
> +    rc = dt_map_id(np, PCI_BDF(pdev->bus, pdev->devfn), "iommu-map",
> +                   "iommu-map-mask", &iommu_spec.np, iommu_spec.args);
> +    if ( rc )
> +        return (rc == -ENODEV) ? NO_IOMMU : rc;
> +
> +    rc = iommu_dt_xlate(dev, &iommu_spec, ops);
> +    if ( rc < 0 )
> +    {
> +        iommu_fwspec_free(dev);
> +        return -EINVAL;
> +    }
> +
> +    return rc;
> +}
> +#endif /* CONFIG_HAS_PCI */
> +
>  int iommu_remove_dt_device(struct dt_device_node *np)
>  {
>      const struct iommu_ops *ops = iommu_get_ops();
> diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
> index a262bba2edaf..14ec3f565976 100644
> --- a/xen/include/xen/device_tree.h
> +++ b/xen/include/xen/device_tree.h
> @@ -939,6 +939,29 @@ int dt_count_phandle_with_args(const struct dt_device_node *np,
>   */
>  int dt_get_pci_domain_nr(struct dt_device_node *node);
>  
> +/**
> + * dt_map_id - Translate an ID through a downstream mapping.
> + * @np: root complex device node.
> + * @id: device ID to map.
> + * @map_name: property name of the map to use.
> + * @map_mask_name: optional property name of the mask to use.
> + * @target: optional pointer to a target device node.
> + * @id_out: optional pointer to receive the translated ID.
> + *
> + * Given a device ID, look up the appropriate implementation-defined
> + * platform ID and/or the target device which receives transactions on that
> + * ID, as per the "iommu-map" and "msi-map" bindings. Either of @target or
> + * @id_out may be NULL if only the other is required. If @target points to
> + * a non-NULL device node pointer, only entries targeting that node will be
> + * matched; if it points to a NULL value, it will receive the device node of
> + * the first matching target phandle, with a reference held.
> + *
> + * Return: 0 on success or a standard error code on failure.
> + */
> +int dt_map_id(const struct dt_device_node *np, uint32_t id,
> +              const char *map_name, const char *map_mask_name,
> +              struct dt_device_node **target, uint32_t *id_out);
> +
>  struct dt_device_node *dt_find_node_by_phandle(dt_phandle handle);
>  
>  #ifdef CONFIG_DEVICE_TREE_DEBUG
> diff --git a/xen/include/xen/iommu.h b/xen/include/xen/iommu.h
> index 8cd4b9a6bfb2..2f081a8cea62 100644
> --- a/xen/include/xen/iommu.h
> +++ b/xen/include/xen/iommu.h
> @@ -27,6 +27,9 @@
>  #include <xen/errno.h>
>  #include <public/domctl.h>
>  #include <public/hvm/ioreq.h>
> +#ifdef CONFIG_ACPI
> +#include <asm/acpi.h>
> +#endif
>  #include <asm/device.h>
>  
>  TYPE_SAFE(uint64_t, dfn);
> @@ -222,7 +225,8 @@ int iommu_dt_domain_init(struct domain *d);
>  int iommu_release_dt_devices(struct domain *d);
>  
>  /*
> - * Helper to add master device to the IOMMU using generic IOMMU DT bindings.
> + * Helpers to add master device to the IOMMU using generic (PCI-)IOMMU
> + * DT bindings.
>   *
>   * Return values:
>   *  0 : device is protected by an IOMMU
> @@ -231,6 +235,7 @@ int iommu_release_dt_devices(struct domain *d);
>   *      (IOMMU is not enabled/present or device is not connected to it).
>   */
>  int iommu_add_dt_device(struct dt_device_node *np);
> +int iommu_add_dt_pci_sideband_ids(struct pci_dev *pdev);

This doesn't look quite right without #ifdef CONFIG_HAS_PCI around it,
but I realize we already have another use of struct pci_dev here in a
function declaration without forward-declaring the struct. IOW it
looks okay now, but will likely bite us later on.

> @@ -247,8 +252,25 @@ int iommu_remove_dt_device(struct dt_device_node *np);
>  
>  #define NO_IOMMU    1
>  
> +#else /* !HAS_DEVICE_TREE */
> +static inline int iommu_add_dt_pci_sideband_ids(struct pci_dev *pdev)
> +{
> +    return -ENOSYS;
> +}
>  #endif /* HAS_DEVICE_TREE */

This wants blank lines added, to be symmetric with the tail of the #if
part.

> +static inline int iommu_add_pci_sideband_ids(struct pci_dev *pdev)
> +{
> +    int ret = -ENOSYS;
> +
> +#ifdef CONFIG_ACPI
> +    if ( acpi_disabled )
> +#endif
> +        ret = iommu_add_dt_pci_sideband_ids(pdev);
> +
> +    return ret;
> +}

Independent of the earlier remark, this surely wants enclosing in
#ifdef CONFIG_HAS_PCI. At which point the inclusion of acpi.h also
wants to be (further) restricted to just that case. (That said, acpi.h
could of course do with itself dealing with CONFIG_ACPI and supplying
acpi_disabled as a #define when that setting is off.)

I also continue to disagree with uses of ENOSYS in situations like this.

Jan

