Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46BC877EE02
	for <lists+xen-devel@lfdr.de>; Thu, 17 Aug 2023 01:59:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.584970.915898 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWQQR-0003mp-79; Wed, 16 Aug 2023 23:59:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 584970.915898; Wed, 16 Aug 2023 23:59:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWQQR-0003ky-4G; Wed, 16 Aug 2023 23:59:43 +0000
Received: by outflank-mailman (input) for mailman id 584970;
 Wed, 16 Aug 2023 23:59:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CG9s=EB=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1qWQQP-0003ks-VS
 for xen-devel@lists.xenproject.org; Wed, 16 Aug 2023 23:59:41 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20624.outbound.protection.outlook.com
 [2a01:111:f400:7e88::624])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f57c991f-3c90-11ee-9b0c-b553b5be7939;
 Thu, 17 Aug 2023 01:59:39 +0200 (CEST)
Received: from MW3PR12MB4409.namprd12.prod.outlook.com (2603:10b6:303:2d::23)
 by PH0PR12MB5645.namprd12.prod.outlook.com (2603:10b6:510:140::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.30; Wed, 16 Aug
 2023 23:59:34 +0000
Received: from MW3PR12MB4409.namprd12.prod.outlook.com
 ([fe80::1280:3c61:6568:3908]) by MW3PR12MB4409.namprd12.prod.outlook.com
 ([fe80::1280:3c61:6568:3908%5]) with mapi id 15.20.6678.029; Wed, 16 Aug 2023
 23:59:34 +0000
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
X-Inumbo-ID: f57c991f-3c90-11ee-9b0c-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I67ik43iutKnhJiwiL6NDUwO8cFPF86T8WDEQktuyD9mvQUqAE1GiRMkUmeWOmWEJVfjnxnTkgx+6medivtRe2W/SO+w4PgKqQs0TejIg7/K1C3eZH9IhlT0Qy2UyINmOO9MNr78ffChTqvVUQGeFLwGLwrdP3QeZgwcK3OrdxVpucVV9XglCvusNiUJhChLXf74kJ75ZlOE0CpA6lRwGvczUzNEH4+2xYNivAixtf2S0+ke6KP5f937vRuCZB01h/UckeUnFbFulBchjfcs3ZZGQ4bjwZEwHTMH2QJWJP68W6QGbnc+98Wvv2EZTwdGy4hJhgNgqIDiKuWiSWBrug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H5TVXQkLYBwgN5LfKFT3rt8q1/lXissJsVvieSoB4F8=;
 b=Rh9ovsVDkPVve72ZqYFEIQcbzbKDBBW53zhTFqnfzZ1x8pqi1ZiVjC1nGn/TCMjQayDBWqkLwYYKP4ffLYg8KU1/eyZ5STmzKnT/Zx8AtqbqKj2ZUAzb9pmbBK9r3uMufFT1Pwg5bMjhmnue1PumwzeXq4748y+n3VRaMqEXZeLGlMld5I2qRY8JmCCtU1vcl6kMn1PEJVmMeuNV/DIs3sfw2lrmGs7hhFnG4x2G3Ls05psENgn33myoxoIOowsmBTzaSpm/672reGOQStO+HlkH3PcRl7DhC06N1ZII9EVvAcI7EuCQ+JxxVMcxt2zMxOsglWZT7vLcCVqd6If2QQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H5TVXQkLYBwgN5LfKFT3rt8q1/lXissJsVvieSoB4F8=;
 b=DdgwxlPCifElr3W2LC040CD8z2nrSsY0IKNK6jo7ycyFwQyihYTFFGK4/ffl65clTt0eKwUtAOwDHPLowNqdfUrC3qEEwhDmWr44Qk9ZC5pto2k50t9WqiTFFjAMycmauSWAM/dSNiiIhP5oKW1J2Sy1kqW/RmPtBG+Sgpos9eo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Date: Wed, 16 Aug 2023 16:59:31 -0700
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, michal.orzel@amd.com,
	sstabellini@kernel.org, jbeulich@suse.com
Subject: Re: [XEN][PATCH v7 14/19] common/device_tree: Add rwlock for dt_host
Message-ID: <ZN1i41j7JD9yheTy@amd.com>
References: <20230602004824.20731-1-vikram.garhwal@amd.com>
 <20230602004824.20731-15-vikram.garhwal@amd.com>
 <6e15489a-5213-3b8e-0b99-277c0ba989c3@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <6e15489a-5213-3b8e-0b99-277c0ba989c3@xen.org>
X-ClientProxiedBy: BYAPR02CA0024.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::37) To MW3PR12MB4409.namprd12.prod.outlook.com
 (2603:10b6:303:2d::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4409:EE_|PH0PR12MB5645:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b4c4a82-063c-4d29-31dd-08db9eb4d723
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	N/SbRH8jirY7ycSfVoESeefJb5Y26RQ8yrQHRIRtwwILU6pexTU6ybA4RLTagEDVyOSie9PPZX9bgkqTyHl0HThfWXmiJM39iNEmGXauCle3VuxwGA8zbALX2Y6NiXbHY1Y1yNVq1af0haOeeH+5QvzVKl8psITuHKgKYUKR6A20iekGxRT3QGfV7OVx2MhDiFyvzi8Cadzm83GFKOGjIDbqH5sZZ4AT27zPIj2tqPDZ9WQt/7TCPxyZEv7iAiQylu/+JkwHGa4AUKcBAa2KCyJP0JiqiQfPAfwg38UoGca2bXPuja/gJAKfrdgRL9x4FrqQajGBpoImdDMcxQRh50btKst+TsayfPLavImT5U8gMOTfVWdaPNsSz3o+Yyi8lg7giD8Qpy89vz1ewdzsd+14kzKmcP/7x8vrB+hfw8ArCY3G4R7mzW1rHa/koBEQcVUgBxstPaOGfhqLqkplAw6ysSegWu2rUr2xP+LZJkjcZT9qMkDlugjRBIuEbAiQfSIrM0UbqqS2rzBzjDuAqlBSDxdZd87HJ2m+FvRfwYNNygO23DQmXb42qLAgPmps
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4409.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(136003)(346002)(366004)(376002)(451199024)(1800799009)(186009)(316002)(6916009)(66556008)(66946007)(66476007)(5660300002)(41300700001)(44832011)(38100700002)(8676002)(4326008)(8936002)(2906002)(83380400001)(26005)(478600001)(86362001)(53546011)(6512007)(36756003)(6506007)(6666004)(6486002)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bTd3cTRySlVzcDlEMXdxTHFiQkJudjdHOTRhYi9XRi9aclhmWE9CeS9VTmpV?=
 =?utf-8?B?T1hqRlM1bnd0cGxtRHJkTEZsYUhJL2VQRVRqZmthZ09hZXBBa0lxWXRpMURh?=
 =?utf-8?B?d3k4QlZUNnRPYXhUYjVEWjdkRlg0cGRZdHAvenNXaXhLRjR0ZXMwWExKd2dV?=
 =?utf-8?B?RDRTaENpNlB2bmovc0JGMlpQZVF4RVZaTWZXN0lzQTdiWHF2VkhabGFIMlZV?=
 =?utf-8?B?ZC9lWkhWWm43UnBQQnhEcTgwVG1uK2tRZ2xaNk1mN1hzczdnN1VxV0lBQmhO?=
 =?utf-8?B?RWlNRk9STFJZR2Q3TFFYdklvdzhFeXJDWlJnR3E0YUw2TUxQMHR4WTk2RXEx?=
 =?utf-8?B?WWJwNHUvSk5obXhjdXE2Y0RWYjBFOERJd1o3ajhVWncyL29qOWRIM0QybE5C?=
 =?utf-8?B?cEQ2bGdtMjlGSjRYeTl4QjA2RnpFK1B2QkdRdmVROGJ5d1FiRkdicFFpR2pJ?=
 =?utf-8?B?Vkl6WSttQk9vOGNmaTRmYU94c25wOS85UEZLQ1lTaG5TK0gvMXR4ZHZPUnU3?=
 =?utf-8?B?eEpRZW5KNGg3djM4VEtLZSsvQk5XZUdTbFVhYmo3SlVRbml1UlVvd2lkN011?=
 =?utf-8?B?Vjh4TE5EOXFjK0NKbVNvVEsyTHpRc01BcHluMnNJSkFJb3J6RjNPSE1FK0dx?=
 =?utf-8?B?T3NXWWl2c2doNnNXWlZvU2NmUXd5akhVMlNBNEhreFlxeVExTE1VdHZjZU5k?=
 =?utf-8?B?YUg5N3ZsZjJXSGZqd2xTdUZrZWpkcDExaGNTd1IzdDJoUVlUZ2ZPZU14UE9i?=
 =?utf-8?B?UWg0TlYvbTRvRStFdmlraUI5S29mek1CemZHN09OejlVdnVLbDlGZUduYlgv?=
 =?utf-8?B?c2lHblVkaTFlWWRVYk94TDZldlZDQ0pFZVliOFZkSERDc2puenZzT0JJY2hD?=
 =?utf-8?B?VDFRK1pTM3dhMWhQeU5uM1ZOSDcvT293S1kyaDIvN3NFNm1TMENmc3U2VEZH?=
 =?utf-8?B?NDBQazNiV3BhOUxIeXBmZk5HVEpudXdiNkZ6Z0d6OG1IcldROS9EMmk3Z1l4?=
 =?utf-8?B?bWRucTZHNGJOUXBtUVdETDdYQlM2R0lOK2NCOVN6Q3RtTmpvRE91dXJkMGdW?=
 =?utf-8?B?NTJCKzR4Q1NLVVE2SlA0WGNqOVNmcHZsa1VicUpmZ1hNSUZlcDNnRW1wSk0r?=
 =?utf-8?B?clZCamFyZm5tNWl4dGd3QkdQbmNGNUh4a3lnVDFmbEM3MDVMakQ2bklMUWNF?=
 =?utf-8?B?OFg4bDZ5TWJURmhqaVE4dElMMWdoeEJVYW50ZklHV29ESnZJZVFKNmpGNklZ?=
 =?utf-8?B?WWFxYmJPaU1ycXRVdEdnYWE3TlNZazR1d1lGZ1BuMy9GWVhMRDhDMGduUkpm?=
 =?utf-8?B?MlRmc1hVK2haSHlSdFpqUkFlNWxKazRDQXFSRGFyYmJ1UEJzVmxiM21SREVB?=
 =?utf-8?B?OUhLK1FjMlJzSW1Kek15SVpDTzBlOUdrcTMyMnUzUlRieVhlNzlQK3I4MVd6?=
 =?utf-8?B?MkthRklRN2x5d0Q2YjEzTzA4YnZsaHZvKzdiWkZySFNzS3RnVW55L3I0Unhu?=
 =?utf-8?B?SkI5VU5QZCthQXJsVW5LelpVNzVvVTdNZ1I3SzdUQWg1MFk5MkI2S1hBL1Vn?=
 =?utf-8?B?YjkxeWlzeFAvR21SanBPOGRQb3BaaVFQREVsdEtEcEF4RDFyZW5ERzhsNWNP?=
 =?utf-8?B?RXF2b1ZtVExoNmtHOUM2K09PT1ZCY2VjTHRKM3JJTUJWUE01Q0NDbHVwSVg2?=
 =?utf-8?B?SXdyUzVHSUNnOXFLaE45aHdBeUM2emhjKytOUEFWaE1PaGdJblpXYndRdW4z?=
 =?utf-8?B?eHpuREpKZ2ppMmZaSVNLaUkwVGJOdFdxVWNpY001ZCtsV3BtUHNDcEZiOEJX?=
 =?utf-8?B?QXpCcHEzZGlnOFVTOE00L3FoekdPOWd6Qk1FT0swcEdiYmFXZFc4WWxpNHpB?=
 =?utf-8?B?ZXcrRTJ6dGpLdG1WNWM4RC9QUTkwZVFVWDRkOHBVcFZ1a0JVNGx6RTh4YXBj?=
 =?utf-8?B?ZWc0UzgrREhyRHloZ1g2MjBLemdMSi8xaHppRm51MVM0WDdPVDRnNmVWREdI?=
 =?utf-8?B?VFRWOFNYMWF5WDJ6S1ZnQVY0dzdlVlpBYnJ1blNqOHpwSkJqTTExQ2gxZ1hs?=
 =?utf-8?B?djFzc3kxRFAvY21hRHZBdmZUb1hrUHpFVUtTVFVYNW5ZNWZvcWpSS1RjTlNj?=
 =?utf-8?Q?bdMY/n8HiXvRZ11UJ7CccXED7?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b4c4a82-063c-4d29-31dd-08db9eb4d723
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4409.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2023 23:59:34.5494
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r7g9qZ1bV9BtKvxgESpfmwZhx6W8T8TaDysSbGeu67phd3GEO9zad4mov6I+9DcRIgVJbqZt6nlmRtPQsTJPmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5645

On Mon, Jun 05, 2023 at 08:52:17PM +0100, Julien Grall wrote:
> Hi,
> 
> On 02/06/2023 01:48, Vikram Garhwal wrote:
> >   Dynamic programming ops will modify the dt_host and there might be other
> >   function which are browsing the dt_host at the same time. To avoid the race
> >   conditions, adding rwlock for browsing the dt_host during runtime.
> Please explain that writer will be added in a follow-up patch.
> 
> > 
> >   Reason behind adding rwlock instead of spinlock:
> >      For now, dynamic programming is the sole modifier of dt_host in Xen during
> >          run time. All other access functions like iommu_release_dt_device() are
> >          just reading the dt_host during run-time. So, there is a need to protect
> >          others from browsing the dt_host while dynamic programming is modifying
> >          it. rwlock is better suitable for this task as spinlock won't be able to
> >          differentiate between read and write access.
> > 
> > Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
> > 
> > ---
> > Changes from v6:
> >      Remove redundant "read_unlock(&dt_host->lock);" in the following case:
> >           XEN_DOMCTL_deassign_device
> > ---
> >   xen/common/device_tree.c              |  4 ++++
> >   xen/drivers/passthrough/device_tree.c | 15 +++++++++++++++
> >   xen/include/xen/device_tree.h         |  6 ++++++
> >   3 files changed, 25 insertions(+)
> > 
> > diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
> > index c5250a1644..c8fcdf8fa1 100644
> > --- a/xen/common/device_tree.c
> > +++ b/xen/common/device_tree.c
> > @@ -2146,7 +2146,11 @@ int unflatten_device_tree(const void *fdt, struct dt_device_node **mynodes)
> >       dt_dprintk(" <- unflatten_device_tree()\n");
> > +    /* Init r/w lock for host device tree. */
> > +    rwlock_init(&dt_host->lock);
> > +
> >       return 0;
> > +
> >   }
> >   static void dt_alias_add(struct dt_alias_prop *ap,
> > diff --git a/xen/drivers/passthrough/device_tree.c b/xen/drivers/passthrough/device_tree.c
> > index 301a5bcd97..f4d9deb624 100644
> > --- a/xen/drivers/passthrough/device_tree.c
> > +++ b/xen/drivers/passthrough/device_tree.c
> > @@ -112,6 +112,8 @@ int iommu_release_dt_devices(struct domain *d)
> >       if ( !is_iommu_enabled(d) )
> >           return 0;
> > +    read_lock(&dt_host->lock);
> > +
> >       list_for_each_entry_safe(dev, _dev, &hd->dt_devices, domain_list)
> >       {
> >           rc = iommu_deassign_dt_device(d, dev);
> > @@ -119,10 +121,14 @@ int iommu_release_dt_devices(struct domain *d)
> >           {
> >               dprintk(XENLOG_ERR, "Failed to deassign %s in domain %u\n",
> >                       dt_node_full_name(dev), d->domain_id);
> > +
> > +            read_unlock(&dt_host->lock);
> >               return rc;
> >           }
> >       }
> > +    read_unlock(&dt_host->lock);
> > +
> >       return 0;
> >   }
> > @@ -246,6 +252,8 @@ int iommu_do_dt_domctl(struct xen_domctl *domctl, struct domain *d,
> >       int ret;
> >       struct dt_device_node *dev;
> > +    read_lock(&dt_host->lock);
> > +
> >       switch ( domctl->cmd )
> >       {
> >       case XEN_DOMCTL_assign_device:
> > @@ -295,7 +303,10 @@ int iommu_do_dt_domctl(struct xen_domctl *domctl, struct domain *d,
> >           spin_unlock(&dtdevs_lock);
> >           if ( d == dom_io )
> > +        {
> > +            read_unlock(&dt_host->lock);
> >               return -EINVAL;
> > +        }
> >           ret = iommu_add_dt_device(dev);
> >           if ( ret < 0 )
> > @@ -333,7 +344,10 @@ int iommu_do_dt_domctl(struct xen_domctl *domctl, struct domain *d,
> >               break;
> >           if ( d == dom_io )
> > +        {
> > +            read_unlock(&dt_host->lock);
> >               return -EINVAL;
> > +        }
> >           ret = iommu_deassign_dt_device(d, dev);
> > @@ -348,5 +362,6 @@ int iommu_do_dt_domctl(struct xen_domctl *domctl, struct domain *d,
> >           break;
> >       }
> > +    read_unlock(&dt_host->lock);
> >       return ret;
> >   }
> > diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
> > index e239f7de26..dee40d2ea3 100644
> > --- a/xen/include/xen/device_tree.h
> > +++ b/xen/include/xen/device_tree.h
> > @@ -18,6 +18,7 @@
> >   #include <xen/string.h>
> >   #include <xen/types.h>
> >   #include <xen/list.h>
> > +#include <xen/rwlock.h>
> >   #define DEVICE_TREE_MAX_DEPTH 16
> > @@ -106,6 +107,11 @@ struct dt_device_node {
> >       struct list_head domain_list;
> >       struct device dev;
> > +
> > +    /*
> > +     * Lock that protects r/w updates to unflattened device tree i.e. dt_host.
> > +     */
> 
> From the description, it sounds like the rwlock will only be used to protect
> the entire device-tree rather than a single node. So it doesn't seem to be
> sensible to increase each node structure (there are a lot) by 12 bytes.
> 
> Can you outline your plan?
Yeah, so intent is to protect the dt_host as whole instead of each node.
I moved it out of struct and kept a single lock for dt_host.
> 
> > +    rwlock_t lock;
> >   };
> >   #define dt_to_dev(dt_node)  (&(dt_node)->dev)
> 
> Cheers,
> 
> -- 
> Julien Grall

