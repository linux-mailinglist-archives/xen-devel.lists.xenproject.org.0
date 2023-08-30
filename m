Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D267078D7CE
	for <lists+xen-devel@lfdr.de>; Wed, 30 Aug 2023 19:17:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.593205.926155 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbOnw-0000Cy-75; Wed, 30 Aug 2023 17:16:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 593205.926155; Wed, 30 Aug 2023 17:16:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbOnw-0000AJ-3Q; Wed, 30 Aug 2023 17:16:32 +0000
Received: by outflank-mailman (input) for mailman id 593205;
 Wed, 30 Aug 2023 17:16:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dzxB=EP=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1qbOnv-0000AC-3y
 for xen-devel@lists.xenproject.org; Wed, 30 Aug 2023 17:16:31 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20628.outbound.protection.outlook.com
 [2a01:111:f400:7e83::628])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f36eca7b-4758-11ee-9b0d-b553b5be7939;
 Wed, 30 Aug 2023 19:16:27 +0200 (CEST)
Received: from MW3PR12MB4409.namprd12.prod.outlook.com (2603:10b6:303:2d::23)
 by IA0PR12MB7627.namprd12.prod.outlook.com (2603:10b6:208:437::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34; Wed, 30 Aug
 2023 17:16:23 +0000
Received: from MW3PR12MB4409.namprd12.prod.outlook.com
 ([fe80::8931:6349:9a02:48c1]) by MW3PR12MB4409.namprd12.prod.outlook.com
 ([fe80::8931:6349:9a02:48c1%4]) with mapi id 15.20.6745.015; Wed, 30 Aug 2023
 17:16:23 +0000
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
X-Inumbo-ID: f36eca7b-4758-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T64/Vg7TsFaqXsZsVNxqHVA5yhbG2794Jib5dKMKLDlCmYw9kNDS9ybg9SP9v9nBnZH9j3D/1/dM6kGlgoUrYo/RU+I+aPrqhs2fyFzHoWFHJEXxKlXlYrPGmW2cbYAg9L6Q2ZI+oBclgL9WKmOFZUyb7Irr9VsmRAKrRsFcNDBwmh13d/GOy1SUUW3wk4jr/ICfKW9TdYKdPD5+mt7ijbuOL0lAcvTfbz30eX6+vaL8fluj1AE0rPScPhKbMYHrq95TKoN940NXLyYvhyTyiAiivfFex37jdpwMksKIkjrWi5n1nmYgEmXKb00HxPMF9Kpbadm/MzjneZOkF8DY+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cS16Xi5WzOhJkU94Wqg6L57eDE1SNX2dm94gIytT5bA=;
 b=gaCaDnLFcgRfXu4jcUli3yMk5kR6y2x0m6UWeYfk2Yi+CLV8UH5W8uoTBrPiieb3RETmOWXvfG7YL5ydNkMMa4oVL7kfcIwps5p42wdXmWJ5yifPx1+ktQVpq18aVbJrI3mPEXQ9XvV/05tXeLf3wYRauCPVge40BDub52NsYuE7eirWunKpIrXAra3xgG8omNC0yblHF99cPy5ZTec9wMLWbfsixGMFuxYxyIe4MKhslsIkKyAJZsQoPX/DWLoEk/pQZIzbY0cxrMi7s5RFKK5N6V+u9kn8eq8XfZiHHEGoWKlTnGD48EDWGpcygMmXXii9HrxxsUMldYyDlPm3MA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cS16Xi5WzOhJkU94Wqg6L57eDE1SNX2dm94gIytT5bA=;
 b=FcAEDc7BNGbdZz0rH8HhsByc42tpb4x/hXtL3i8u/IkHpX3c/KiHJIXEixcrL2ENDmz4Zu4DxuP8FuLjq9mbNw1lLMQi1Smwbe0BWRSBBy6K8sXjWSWOoxYeilgZyrNjg5tBcFvEBjHUVG49feuzz7qGgYWKXnesgN7GUdHao5I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Date: Wed, 30 Aug 2023 10:16:20 -0700
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: Michal Orzel <michal.orzel@amd.com>
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, julien@xen.org,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [XEN][PATCH v10 03/20] xen/arm/device: Remove __init from
 function type
Message-ID: <ZO95ZLh9FdpmGMWL@amd.com>
References: <20230825080222.14247-1-vikram.garhwal@amd.com>
 <20230825080222.14247-4-vikram.garhwal@amd.com>
 <64099c1c-42d6-aeb4-6d2f-566dc17580da@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <64099c1c-42d6-aeb4-6d2f-566dc17580da@amd.com>
X-ClientProxiedBy: BYAPR05CA0096.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::37) To MW3PR12MB4409.namprd12.prod.outlook.com
 (2603:10b6:303:2d::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4409:EE_|IA0PR12MB7627:EE_
X-MS-Office365-Filtering-Correlation-Id: ec1b4adc-5650-403e-748a-08dba97cd5d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	t8yEXNDjKNMZEbZ1Oh53zsPj4f85GAizoad7Mt/5Wik0JTV03AblECdHON5SwLl/w4IXoznEaYm0H/8/FfdKIKrEYGUlAUqUnD8sgSgOWJWbZbYs/8zxux+Gp0PI3hlFq1WK+O/OyArNS6FjTFAgtN5AhA4hPfCgFuEWjQSdmZNXV+wJ3wUKSb/ZIiJen+JY+WdxtDuHdu0ZHS5FIdpNhRdo/d10s7xITBSU9qJB4ilVTRka68Lnufk7aybQntcOmUTUhrVfjcz1RaeJ387SN3tKj6TCKZMAMk+3S5Ka4d/Y/by7wcgBb1HQyn4ahHbrGwcyY9D7K1LZC3ZGkF8BK3CXBZa3UzyuIQNz8ggYk4O4jhOFZB8MUuWA1fn+GQkcdn8qt4KqEAa+oDUYRe332uPt5O3wehJzUTWNiOpl88cbEdA37fIBF6eejGnw/zjUJpNiawfSCGeN1GjpQQ7S3PUfhBXtHQAJTWvC2mSWbMRCxAdbTJ/7GW0/gD1vWa2BQaGCN2JUIFIq6hyZFWqx4AlaR8lPsNYvs96fYUDYEbyCiYYeNp0xvFW9JIXrgvkn
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4409.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(366004)(39860400002)(346002)(396003)(376002)(1800799009)(186009)(451199024)(6506007)(6486002)(6512007)(36756003)(86362001)(38100700002)(2616005)(26005)(2906002)(53546011)(478600001)(5660300002)(66946007)(6862004)(66556008)(4326008)(41300700001)(8936002)(8676002)(44832011)(83380400001)(6636002)(66476007)(37006003)(316002)(54906003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YWJGQTVRcXJRVEkzdnhmYSt4NkxIMnJRdXMvbFBoalN3Yk1Td2pJZm5Ld2RZ?=
 =?utf-8?B?M0xUK1dZZjR2M0ZyWjUxZGpzSXhlYzVyNEQzZ2lXSjNXTEF3Yy9JUWJiUXgw?=
 =?utf-8?B?QXk5VjlhOFd6WFJLVERuZzZRYTdzNk5GSDlmVEtiTTdlTFl0aUxSQkVyeTl0?=
 =?utf-8?B?Z2RKV2VNUHprNlo5VDVJLy9Zc3YvaXZsRlExdGFDTHpkRHRIWDBXU2dKZUll?=
 =?utf-8?B?QjExRlBLKyt5RVZCaFNDMmdjZUZLYXlueUVCN2ZuVlFEM1czTklBcW5uMWxu?=
 =?utf-8?B?ZHZSZEh4REx6Y3ZzeUhhdXVvOHRla0oweXNQZjRUTTcwTlRvVWlwUFk5ckdR?=
 =?utf-8?B?WTdJUmNXdVA0azRpWnhmWWh6Z1JqZDlrTWVOUVF4aVlBV2U3SHhkSlVGeFJD?=
 =?utf-8?B?SmlkT3J4ZURRemhzUG8yYkN2UXF3Wk5SVkhCTW4zemRWWVM2RXhySnhIa1Y3?=
 =?utf-8?B?TzFXeEdDUFJYSDJOR3BSK1JZNTJpZ1VrUXBLN1FUS2dhVWdvTzNRaUtMMTJt?=
 =?utf-8?B?R1dCVmVDaGhyNkFzaEd3SDhybXUzOTNlaitWWFFRUVlhWFVkc3d0cDdYUjRW?=
 =?utf-8?B?eStadmVJR2tIREo5QWJPL3IyS3BDZmN4clkwZXN6YzRwQzF5NWFpbzBaYi9K?=
 =?utf-8?B?YkFPL2RNa05vakMyb2RJam1TYldVT0NsQ2lxdndGbWZMQWlNbElhck1wZTk4?=
 =?utf-8?B?eGkyd1dOMzZaVVpGUmxjOFpyZlgxMldmcm1PSWZxUHZxYlQ0cTFEOHFGZEZt?=
 =?utf-8?B?ODdLQVcxSW1ISTgxMUZ1SytBRnJUK0VLYXR2THRhdWxyamRqbERXejA5b3A3?=
 =?utf-8?B?RFhST0xMTmR2UWVKZVlLWW1zeFFuUU54aE9PMjhZeC9yclFRSDU4anI3ZGNV?=
 =?utf-8?B?OGJsbytKRFd6cDR4Z1lEOVFrWEQ2Yit5NHVsZDFqdWZlOHdHSFYzR21QcWdz?=
 =?utf-8?B?ZllJR1hiMFluRmQrS3BVdVdTY0VRWU9BVEVHUWF6ODhzMG5OOTF5M1VVV3Y4?=
 =?utf-8?B?K1FUQWZJMmtIcFBlUWI1eWllVmV3Yy9Lc2h5Mm13UTZJM3Vsa2RrMVZkaUQv?=
 =?utf-8?B?Qlc5WHp1c0lDV3hCZ0VFTlBYK21BYVJNeEFlZUxURmhzSEpGRzY4M1l4dE1Q?=
 =?utf-8?B?WEpNUERzOU1qSHdRdW1Va3g5eXZvaitORE1iUW1jSXFwNHZPSWdKQUJqZGpM?=
 =?utf-8?B?bHJubGM2RkxwNFIxbExjeFlOalRLMzVQeGlQb1M1NkFCR0dhWko1Tll4d1lR?=
 =?utf-8?B?OFJ2Ui9HVVVyaU1zVGtXbExQVjRDOFBFUFlyRnpuTHdVTTdKcncyRDJ2WnN4?=
 =?utf-8?B?dWZZQ0ZJK016TWoveVM0Z0JFQTZQRk1sdGZBRHFLWXFTeGVBL0JZU1RWTTV6?=
 =?utf-8?B?T1lVWWpqemRjSmduYjNPbTQwdTl2UCs5V282dlJueDNUQThTTCtqeWJUVko0?=
 =?utf-8?B?NzJHTzdnU3ZDa1h5azBrZVpYaC92bElhTWJDaStjaFBWa1JxVHU2eVJydGIv?=
 =?utf-8?B?SDBmTHBRaFA4SkV3Q2h3ZWhkWjdQdThZQ1lnZjJFUi8zZWZCYnJKMytHeUtM?=
 =?utf-8?B?TkQxSmdoZkoyZkxSVGlnSXJobjBmOWdwa00rS1d4T0lVTlNZSllVQnlwbWFK?=
 =?utf-8?B?QXppb0VySkVtTXJtL0VLR29OUk04Z2xyd212ZEZmdlkrbnRFMGE5eVREWmpF?=
 =?utf-8?B?RVo2RUdJK09PckwwZmlNTFIwQXhpVXdBSzBKTnhFeURERTFXaVV5VEJYNkZE?=
 =?utf-8?B?QXNiMGo2ZU5HVWh3U1NNd05xYzIrVWoxK3cyaFFTZHcrNjcxNXFod1NUOThj?=
 =?utf-8?B?ZHlOd3pLczlnQlBwcEVCRVZ4L1VDRDkwTEtDaHRJaU4xanYrTERoOXhXYS9V?=
 =?utf-8?B?ZWRnaTgrYmRhOTF1eTIvd1o4eFhJeWxhc2syNU9SUVQzNmtlcGlOcUhkYytI?=
 =?utf-8?B?a094OGFFNkNJSW9nekNQMC90a0hvb2VMOUZDZ0dlaWtSWSs2UVFKbVdiN0ZV?=
 =?utf-8?B?NEt0bkhsclhsWll1Y0dBQnQzYnI2TG05cE1ZUmdybjVkcldWTVhUZ2JwV2w4?=
 =?utf-8?B?U1JIcjlDNGtaYnZwNXZSZ2tPNjRWN3dHcHdOUDFBSW9nUHRCeDhYbWFEb3Rm?=
 =?utf-8?Q?q7jcpWwWxv4oH9q7hBcnkTb3i?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec1b4adc-5650-403e-748a-08dba97cd5d5
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4409.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2023 17:16:23.3765
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p1xHvxRyKVXKnLa6ChVJAd63zcARAhIER5N8t8shjRPR7hHIOMGwXg6vLxyrZ0ZVTuswjF9RpkxYg6rk/UEaSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7627

Hi Michal,
On Tue, Aug 29, 2023 at 09:17:37AM +0200, Michal Orzel wrote:
> 
> 
> On 25/08/2023 10:02, Vikram Garhwal wrote:
> > Remove __init from following function to access during runtime:
> >     1. map_irq_to_domain()
> >     2. handle_device_interrupts()
> >     3. map_range_to_domain()
> >     4. unflatten_dt_node()
> >     5. handle_device()
> >     6. map_device_children()
> >     7. map_dt_irq_to_domain()
> > Move map_irq_to_domain() prototype from domain_build.h to setup.h.
> > 
> > Above changes will create an error on build as non-init function are still
> > in domain_build.c file. So, to avoid build fails, following changes are done:
> > 1. Move map_irq_to_domain(), handle_device_interrupts(), map_range_to_domain(),
> >     handle_device(), map_device_children() and map_dt_irq_to_domain()
> >     to device.c. After removing __init type,  these functions are not specific
> >     to domain building, so moving them out of domain_build.c to device.c.
> > 2. Remove static type from handle_device_interrupts().
> > 
> > Overall, these changes are done to support the dynamic programming of a nodes
> > where an overlay node will be added to fdt and unflattened node will be added to
> > dt_host. Furthermore, IRQ and mmio mapping will be done for the added node.
> > 
> > Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
> > 
> > ---
> > Changes from v9:
> >     Move handle_device(), map_device_children() and map_dt_irq_to_domain() out
> >         of domain_build.c
> > ---
> > ---
> >  xen/arch/arm/device.c                   | 293 ++++++++++++++++++++++++
> >  xen/arch/arm/domain_build.c             | 293 ------------------------
> >  xen/arch/arm/include/asm/domain_build.h |   2 -
> >  xen/arch/arm/include/asm/setup.h        |   9 +
> >  xen/common/device_tree.c                |  12 +-
> >  5 files changed, 308 insertions(+), 301 deletions(-)
> > 
> > diff --git a/xen/arch/arm/device.c b/xen/arch/arm/device.c
> > index ca8539dee5..857f171a27 100644
> > --- a/xen/arch/arm/device.c
> > +++ b/xen/arch/arm/device.c
> > @@ -9,8 +9,10 @@
> >   */
> >  
> >  #include <asm/device.h>
> > +#include <asm/setup.h>
> >  #include <xen/errno.h>
> >  #include <xen/init.h>
> > +#include <xen/iocap.h>
> >  #include <xen/lib.h>
> >  
> >  extern const struct device_desc _sdevice[], _edevice[];
> > @@ -75,6 +77,297 @@ enum device_class device_get_class(const struct dt_device_node *dev)
> >      return DEVICE_UNKNOWN;
> >  }
> >  
> > +int map_irq_to_domain(struct domain *d, unsigned int irq,
> > +                      bool need_mapping, const char *devname)
> > +{
> > +    int res;
> > +
> > +    res = irq_permit_access(d, irq);
> > +    if ( res )
> > +    {
> > +        printk(XENLOG_ERR "Unable to permit to %pd access to IRQ %u\n", d, irq);
> > +        return res;
> > +    }
> > +
> > +    if ( need_mapping )
> > +    {
> > +        /*
> > +         * Checking the return of vgic_reserve_virq is not
> > +         * necessary. It should not fail except when we try to map
> > +         * the IRQ twice. This can legitimately happen if the IRQ is shared
> > +         */
> > +        vgic_reserve_virq(d, irq);
> > +
> > +        res = route_irq_to_guest(d, irq, irq, devname);
> > +        if ( res < 0 )
> > +        {
> > +            printk(XENLOG_ERR "Unable to map IRQ%u to %pd\n", irq, d);
> > +            return res;
> > +        }
> > +    }
> > +
> > +    dt_dprintk("  - IRQ: %u\n", irq);
> > +    return 0;
> > +}
> > +
> > +int map_range_to_domain(const struct dt_device_node *dev,
> > +                        uint64_t addr, uint64_t len, void *data)
> > +{
> > +    struct map_range_data *mr_data = data;
> > +    struct domain *d = mr_data->d;
> > +    int res;
> > +
> > +    if ( (addr != (paddr_t)addr) || (((paddr_t)~0 - addr) < len) )
> > +    {
> > +        printk(XENLOG_ERR "%s: [0x%"PRIx64", 0x%"PRIx64"] exceeds the maximum allowed PA width (%u bits)",
> > +               dt_node_full_name(dev), addr, (addr + len), PADDR_BITS);
> > +        return -ERANGE;
> > +    }
> > +
> > +    /*
> > +     * reserved-memory regions are RAM carved out for a special purpose.
> > +     * They are not MMIO and therefore a domain should not be able to
> > +     * manage them via the IOMEM interface.
> > +     */
> > +    if ( strncasecmp(dt_node_full_name(dev), "/reserved-memory/",
> > +                     strlen("/reserved-memory/")) != 0 )
> > +    {
> > +        res = iomem_permit_access(d, paddr_to_pfn(addr),
> > +                paddr_to_pfn(PAGE_ALIGN(addr + len - 1)));
> > +        if ( res )
> > +        {
> > +            printk(XENLOG_ERR "Unable to permit to dom%d access to"
> > +                    " 0x%"PRIx64" - 0x%"PRIx64"\n",
> > +                    d->domain_id,
> > +                    addr & PAGE_MASK, PAGE_ALIGN(addr + len) - 1);
> > +            return res;
> > +        }
> > +    }
> > +
> > +    if ( !mr_data->skip_mapping )
> > +    {
> > +        res = map_regions_p2mt(d,
> > +                               gaddr_to_gfn(addr),
> > +                               PFN_UP(len),
> > +                               maddr_to_mfn(addr),
> > +                               mr_data->p2mt);
> > +
> > +        if ( res < 0 )
> > +        {
> > +            printk(XENLOG_ERR "Unable to map 0x%"PRIx64
> > +                   " - 0x%"PRIx64" in domain %d\n",
> > +                   addr & PAGE_MASK, PAGE_ALIGN(addr + len) - 1,
> > +                   d->domain_id);
> > +            return res;
> > +        }
> > +    }
> > +
> > +    dt_dprintk("  - MMIO: %010"PRIx64" - %010"PRIx64" P2MType=%x\n",
> > +               addr, addr + len, mr_data->p2mt);
> > +
> > +    return 0;
> > +}
> > +
> > +/*
> > + * handle_device_interrupts retrieves the interrupts configuration from
> > + * a device tree node and maps those interrupts to the target domain.
> > + *
> > + * Returns:
> > + *   < 0 error
> > + *   0   success
> > + */
> > +int handle_device_interrupts(struct domain *d,
> This needs to be renamed. AFAIK you agreed on map_device_irqs_to_domain().
Yeah, i changed this in v11.
> 
> > +                             struct dt_device_node *dev,
> > +                             bool need_mapping)
> > +{
> > +    unsigned int i, nirq;
> > +    int res;
> > +    struct dt_raw_irq rirq;
> > +
> > +    nirq = dt_number_of_irq(dev);
> > +
> > +    /* Give permission and map IRQs */
> > +    for ( i = 0; i < nirq; i++ )
> > +    {
> > +        res = dt_device_get_raw_irq(dev, i, &rirq);
> > +        if ( res )
> > +        {
> > +            printk(XENLOG_ERR "Unable to retrieve irq %u for %s\n",
> > +                   i, dt_node_full_name(dev));
> > +            return res;
> > +        }
> > +
> > +        /*
> > +         * Don't map IRQ that have no physical meaning
> > +         * ie: IRQ whose controller is not the GIC
> > +         */
> > +        if ( rirq.controller != dt_interrupt_controller )
> > +        {
> > +            dt_dprintk("irq %u not connected to primary controller. Connected to %s\n",
> > +                      i, dt_node_full_name(rirq.controller));
> > +            continue;
> > +        }
> > +
> > +        res = platform_get_irq(dev, i);
> > +        if ( res < 0 )
> > +        {
> > +            printk(XENLOG_ERR "Unable to get irq %u for %s\n",
> > +                   i, dt_node_full_name(dev));
> > +            return res;
> > +        }
> > +
> > +        res = map_irq_to_domain(d, res, need_mapping, dt_node_name(dev));
> > +        if ( res )
> > +            return res;
> > +    }
> > +
> > +    return 0;
> > +}
> > +
> > +static int map_dt_irq_to_domain(const struct dt_device_node *dev,
> > +                                       const struct dt_irq *dt_irq,
> > +                                       void *data)
> Parameters are not alligned. Should be:
> static int map_dt_irq_to_domain(const struct dt_device_node *dev,
>                                 const struct dt_irq *dt_irq,
>                                 void *data)
> 
> > +{
> > +    struct map_range_data *mr_data = data;
> > +    struct domain *d = mr_data->d;
> > +    unsigned int irq = dt_irq->irq;
> > +    int res;
> > +
> > +    if ( irq < NR_LOCAL_IRQS )
> > +    {
> > +        printk(XENLOG_ERR "%s: IRQ%u is not a SPI\n", dt_node_name(dev), irq);
> > +        return -EINVAL;
> > +    }
> > +
> > +    /* Setup the IRQ type */
> > +    res = irq_set_spi_type(irq, dt_irq->type);
> > +    if ( res )
> > +    {
> > +        printk(XENLOG_ERR "%s: Unable to setup IRQ%u to %pd\n",
> > +               dt_node_name(dev), irq, d);
> > +        return res;
> > +    }
> > +
> > +    res = map_irq_to_domain(d, irq, !mr_data->skip_mapping, dt_node_name(dev));
> > +
> > +    return res;
> > +}
> > +
> > +/*
> > + * For a node which describes a discoverable bus (such as a PCI bus)
> > + * then we may need to perform additional mappings in order to make
> > + * the child resources available to domain 0.
> > + */
> > +static int map_device_children(const struct dt_device_node *dev,
> > +                                      struct map_range_data *mr_data)
> Parameter is not aligned.
Fixed the style here.
> 
> [...]
> > diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
> > index 19dc637d55..1a052ed924 100644
> > --- a/xen/arch/arm/include/asm/setup.h
> > +++ b/xen/arch/arm/include/asm/setup.h
> > @@ -165,9 +165,18 @@ void device_tree_get_reg(const __be32 **cell, uint32_t address_cells,
> >  u32 device_tree_get_u32(const void *fdt, int node,
> >                          const char *prop_name, u32 dflt);
> >  
> > +int handle_device(struct domain *d, struct dt_device_node *dev, p2m_type_t p2mt,
> > +                  struct rangeset *iomem_ranges, struct rangeset *irq_ranges);
> Remove the rangeset parameters. AFAIK you'll introduce it later, so this is a mistake
> causing the build to fail.
Fixed this.
> 
> > +
> > +int handle_device_interrupts(struct domain *d, struct dt_device_node *dev,
> > +                             bool need_mapping);
> Don't forget to rename.
> 
> 
> With all the remarks above addressed:
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>
> 
> ~Michal
> 

