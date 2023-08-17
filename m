Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8156777EE57
	for <lists+xen-devel@lfdr.de>; Thu, 17 Aug 2023 02:32:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.584977.915908 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWQvm-0000nP-Li; Thu, 17 Aug 2023 00:32:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 584977.915908; Thu, 17 Aug 2023 00:32:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWQvm-0000kX-I1; Thu, 17 Aug 2023 00:32:06 +0000
Received: by outflank-mailman (input) for mailman id 584977;
 Thu, 17 Aug 2023 00:32:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IvtK=EC=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1qWQvk-0000kR-Mp
 for xen-devel@lists.xenproject.org; Thu, 17 Aug 2023 00:32:04 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20602.outbound.protection.outlook.com
 [2a01:111:f400:7e8a::602])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7ab24012-3c95-11ee-8779-cb3800f73035;
 Thu, 17 Aug 2023 02:32:01 +0200 (CEST)
Received: from MW3PR12MB4409.namprd12.prod.outlook.com (2603:10b6:303:2d::23)
 by CYYPR12MB8702.namprd12.prod.outlook.com (2603:10b6:930:c8::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.29; Thu, 17 Aug
 2023 00:31:54 +0000
Received: from MW3PR12MB4409.namprd12.prod.outlook.com
 ([fe80::1280:3c61:6568:3908]) by MW3PR12MB4409.namprd12.prod.outlook.com
 ([fe80::1280:3c61:6568:3908%5]) with mapi id 15.20.6678.029; Thu, 17 Aug 2023
 00:31:54 +0000
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
X-Inumbo-ID: 7ab24012-3c95-11ee-8779-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cNuo8QtF4cc/jjxS6y2/86l7+aekwQ6eFgcO23A31XRGUTK+4G48gQC+37nNZYzW9pj+gzE6ic9Qo2JQtVqWz1WxT7QAmlBvtHnvm1xXGOw1gkp4+XlHLgClydGSoGSpJUBqLl6mcW3trxd18szZB37mdJi0v57guFWu0KfXAm5cFmNP9XL4VamSf7WCvgmalPvvygL50gRvlQygd4ZEvIo2jRKPHocMc9x0x+1yx9PhoPM+pDmJM37ElbuHpQfsMgIY4HEwM95RMFVaMoo4E9tIhEzl0z2PdorSI7cRws8rGeM55JZaOK2/zlvOphNNyRPj3cKr+JTr3Nfq+zETaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QAWia6PSozJ7vu2WsSMESsSKkg1WqcaFUVoioHc2RW0=;
 b=QRiBhbaLIomYi/TQXPDL5FDKl2zQO2ljaeX1k6aB2Q6Wr8wFHMmChjcnaEQL41GY5CLL9AExx5rBo1qdECqKf4RjnbbSknTOIexx4NqQWuvzWklIxjB+44c3Y3kkkThreMV90hYV0E7PL4Rd+ofBvvm5h4G6ktdhtkWFFUIX0L/Wa47bYL/BHq45swkmdrlogVbZaBM0G/aTAexfjYIr8fiMDGALc4zG0hPzGzcMyNWxoNNtMOflHfkWuQhQJVjSi/UqEVGpBRirqzfdFWX2TPbVbnfFWaRd8fc0JBZ6noGMchekCizIacWOPTKkGQ/M+JMl1dzAx/qfqboxkGqbEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QAWia6PSozJ7vu2WsSMESsSKkg1WqcaFUVoioHc2RW0=;
 b=QmaVMs0moJn6Pb2RwnqpX44VpJaVstRdSol7/ertbQomQ69D6NcYrBGKi3x459zZcvsWk/69MRJdAlXvaOA90ixzlR02QQa32Y5Pj6tT/2v+eo2DLG+EinjKDFtsK2/oyifRR3E1ltff2evkkaO1uTgfDlh3DCwYBa9sxf+ch+Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Date: Wed, 16 Aug 2023 17:31:36 -0700
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, michal.orzel@amd.com,
	sstabellini@kernel.org, jbeulich@suse.com,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [XEN][PATCH v7 15/19] xen/arm: Implement device tree node
 removal functionalities
Message-ID: <ZN1qaMn+5GONuzmS@amd.com>
References: <20230602004824.20731-1-vikram.garhwal@amd.com>
 <20230602004824.20731-16-vikram.garhwal@amd.com>
 <e1597b22-a756-5141-e7d9-5fd60a9a05ff@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e1597b22-a756-5141-e7d9-5fd60a9a05ff@xen.org>
X-ClientProxiedBy: BY3PR05CA0044.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::19) To MW3PR12MB4409.namprd12.prod.outlook.com
 (2603:10b6:303:2d::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4409:EE_|CYYPR12MB8702:EE_
X-MS-Office365-Filtering-Correlation-Id: c027d470-2d3c-42a2-19ce-08db9eb95b58
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ghAWP5Qhce3t2CqAcfr3LWB+PkJMxlNyWjhGeCSBSpmqWkRFhCedmIp1ZniwjSfh4lBfZh/HSDS7HP8I7laelH6wjSRmKUHqPYWODLEW8zo9kYY5ET3xXh9etT8uu0m9JjBZ1Nzqc6aGr1KV5h99JizHFMe0dEW526Dx6wKZ+wTeTTqJyB0LAP4bcD/F3WylpcguqPfYsB5gTVofXl3WYglRM+zVhcmwR92Mh9vdt5Ie2byR4Q9XuRixSL/WU4GqtYM90sN3X6S47E2n28YpjiAO/v2fz5muuAscCrSt6NrrD3Ntsd0lrRXVOc4+9fOMghHH6b+64jB3oo2mgx7KFqEl6O3UHdLl4+jVP3AVmKF8lB3TBKzxmYQR7gXYYY0H0X+7Tj23q5Pu0fmsLn2Iz7ZGKoSGhRMIxflq+CDrY7GExtRVi9bcpl1FvIQDJgerOJYYISdtvn08eUSPiwll1J3noGFzyhy+p0xY2AOjJsTzXuWsWTBzXiUajoOdwNwe
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4409.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39860400002)(346002)(136003)(366004)(376002)(451199024)(1800799009)(186009)(316002)(54906003)(6916009)(66556008)(66946007)(66476007)(966005)(5660300002)(41300700001)(44832011)(38100700002)(4326008)(8936002)(8676002)(26005)(30864003)(2906002)(83380400001)(478600001)(86362001)(53546011)(6512007)(36756003)(6506007)(6666004)(6486002)(2616005)(333604002)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bU9xWGlkUkdVaFRycnR0NTNPa25Oa2Q0SHV4SlBCUTVaQ2wzQXd5b2tjdEJO?=
 =?utf-8?B?OVBZQ0UvR0ZDVE0wQkg1blVpajhIZXZOdUxQbU5OMHVuYmYxWVMzZ0ozUmM4?=
 =?utf-8?B?bmtkN0NVWW4zb1k4M3pJcEw2QzNxMDAvREdwdWcwUVZOSGh1Y2dFRE9XeVhS?=
 =?utf-8?B?c05WMVVISzNndTU2bytkRlYyTGhKcGJWNmNQaS9CSWlRVWlqRllrRlNWdGRS?=
 =?utf-8?B?OXVVbG1hVUNKKzhNazF3bHBNdXZmSExkRUNZYWJITHpTVWpxRkIyV1pOWHVU?=
 =?utf-8?B?UlhRSjZxOURiUjBQdmh0bU5EaThyRklmR09qbUlFZDZLSE1ldERYWXdMd0pQ?=
 =?utf-8?B?TDBRU1JoZTI5NHRRRVVNbTZwbnNuZEYwbEw4OTlJc2Q4MExaUjhtU21tMUtn?=
 =?utf-8?B?TFhxak1vdUpBdnh1ZjNuTzVDUDNGVm96ZkFmMkVDN0FvcXpEY1VjVkJzaWpu?=
 =?utf-8?B?eE1BbWdqVk5mb0U4Y2t3czRsbjEyeHNRVVpXQ2NMOEQ2TkYvdGVlUjBua0Z3?=
 =?utf-8?B?ZHVKdTNjUG1NcS9CSGZrcE45TW5ydnRHbEJxMk5JK29GazR2Zk55UjlJei92?=
 =?utf-8?B?TjNIZ1g5OWU4Lzd6bTg3dFBLV3R0bm5UNWZYNG5aWmRucW5tUXNGaitwL2Fx?=
 =?utf-8?B?cThCRXFFNitMYklUbVJhVjFJWmZOUjQ5alpTMmdnaUtYYkp6UGV5WEViNnRj?=
 =?utf-8?B?QUtaOVo4eU5IMURnYzFIc1Y4S3hTMm9PWUFjTzg4a0duSnhiSEpYbXRscjlC?=
 =?utf-8?B?NlZ1YUNtUnFMMlFmZlhjZ3RCekhDRlU5aDIrSGdsd1RzLzBWZDBVK3B6dW9D?=
 =?utf-8?B?OE5oTGl6d2dSWWltMlViWHF0WUs0aVJoQlpjME1ZaUxOQnNKUTVrdjdPUzlJ?=
 =?utf-8?B?WEhZTUR3TnkzMmc1Q1ZUaFVySS9BSWZMd2l2aWVEOWZqTmt4SHM3a1dualJi?=
 =?utf-8?B?WUh3KzZFa2t0VUpMSE14N29hdUJubk5weXdrL2xRSzV4NmE3QXRjSjY4aEVB?=
 =?utf-8?B?dmFYbEUwUHo2UFpBVWl0QlNtU0JRMUFwU0tuWUtLV3VzV0VwcUFBK040SGRR?=
 =?utf-8?B?UWNrd0E3WENhVnpXbVFtZTNZWDJNR2lDdWpwWTU5T0diS0VORzcwZzllSUVS?=
 =?utf-8?B?YmF1Z3ZvSDlDS3lCcDk0SjNuamFvcWhOK3BMdHIzbEZyd1BORzI5Vk52SU9p?=
 =?utf-8?B?VGRWLzk2T1hhZjVEZ0wwTjdDbWJ0RVVYQlBxTmlGWktoMVVNNjFPNlVOZzVU?=
 =?utf-8?B?cEkzNDNhcVI2M0kyTklCdmRKOGE2TkVuMUxVdFIvTmtneUNNcG01Rzdzc0c3?=
 =?utf-8?B?R05vL3pvbTRPN3RVYmhudjVOakNJL2oxWUNpZUdsRmhvMEl0cWJwcitnenRG?=
 =?utf-8?B?MUFqVzBBSkQ5R1ZxWU5HQmFGR2tXOTA2Mks4VFFhVEtlV3VPdjI4c0pYbm9l?=
 =?utf-8?B?anVZbC9KbUxqRk1OcWZ1S1I2dmVwRjNWZFErUitrMlovRStJd0dpdDc1UWFV?=
 =?utf-8?B?VjBKb25zaERtOGR2TWkwbEpTTG8ySllwa0t4VUVhaWNUQU9YbG9hcDFNQXNW?=
 =?utf-8?B?MmpxSkhIbWxrNXFFZGdLSWNVVVQwYzQ4MU1aZUYzcVZIZit6MGxlTEZSdnBn?=
 =?utf-8?B?NWgxNXQ3RjRtVXhFVkxoVzIycTZEL3lKT3ZyUHQ3SnpHdHI4ZE9TeWMrYUtM?=
 =?utf-8?B?clNHN0VpQlp1cGFkcGQ4dGphY2ljdGF0bWI2VllkK1lYRTNZakpRUm44Z3RR?=
 =?utf-8?B?d0o1Y0drN3NrZWx6NXpNQlNOOS9FZDBRVHVJbXVtbUVCdUJnSGp1RnpGK2l2?=
 =?utf-8?B?WGhUNmFzVUdNSUFMSTh2U244cmQ1L1JJSExwZE5yL3N3eTlzVnpleC9ieXI5?=
 =?utf-8?B?NytYYmU1MWJtQXRuTzRhZHRZODIzSWZBa1VXUjBNcHdnQnZPUXJJdzhxVWJV?=
 =?utf-8?B?c3ZQSEVBblZ2OFZNeGtCNk1HcFF3cUZNOXdhbzF0K3pXc205eFgyT0NhbVdD?=
 =?utf-8?B?c0dQT1hCdGxYRHBETlVBRVlOeEErZEpjSkhLTGN4K1NVWUpOREZoOURIK2xZ?=
 =?utf-8?B?RTh4QndQNDdid2tyZVdRWUdFMHlBc1F2a1kxQzZocTNqalg1Vi9wbWZNZnFN?=
 =?utf-8?Q?Wd0QUK3HY1xlb2wnjj1RjLlhv?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c027d470-2d3c-42a2-19ce-08db9eb95b58
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4409.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2023 00:31:54.3789
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mKm95CpDVPIb+xWakuT9ARDn0SnSTXYGhYUNU7GMe5PYyDiFb79HWvDM0OeGDfWK70Mraq4FllgsJngm+KbKaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8702

On Mon, Jun 05, 2023 at 10:07:48PM +0100, Julien Grall wrote:
> Hi Vikram,
> 
> On 02/06/2023 01:48, Vikram Garhwal wrote:
> > Introduce sysctl XEN_SYSCTL_dt_overlay to remove device-tree nodes added using
> > device tree overlay.
> > 
> > xl dt-overlay remove file.dtbo:
> >      Removes all the nodes in a given dtbo.
> >      First, removes IRQ permissions and MMIO accesses. Next, it finds the nodes
> >      in dt_host and delete the device node entries from dt_host.
> > 
> >      The nodes get removed only if it is not used by any of dom0 or domio.
> > 
> > Also, added overlay_track struct to keep the track of added node through device
> > tree overlay. overlay_track has dt_host_new which is unflattened form of updated
> > fdt and name of overlay nodes. When a node is removed, we also free the memory
> > used by overlay_track for the particular overlay node.
> > 
> > Nested overlay removal is supported in sequential manner only i.e. if
> > overlay_child nests under overlay_parent, it is assumed that user first removes
> > overlay_child and then removes overlay_parent.
> > 
> > Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
> > 
> > ---
> > Changes from v6:
> >      Add explicit padding for xen_system_dt_overlay{}
> >      Update license.
> >      Rearrange xfree in dt_sysctl()
> >      Update overlay_track struct comment with relevant message.
> >      Fix missing xen/errno.h for builds without CONFIG_OVERLAY_DTB cases.
> >      Fix header formatting.
> > ---
> >   xen/arch/arm/sysctl.c        |  16 +-
> >   xen/common/Makefile          |   1 +
> >   xen/common/dt-overlay.c      | 420 +++++++++++++++++++++++++++++++++++
> 
> I think the new dt-overlay.c wants to be added under the section
> "Device-Tree" in MAINTAINERS.
Updated MAINTAINER in v8.
> 
> >   xen/include/public/sysctl.h  |  24 ++
> >   xen/include/xen/dt-overlay.h |  59 +++++
> >   5 files changed, 519 insertions(+), 1 deletion(-)
> >   create mode 100644 xen/common/dt-overlay.c
> >   create mode 100644 xen/include/xen/dt-overlay.h
> > 
> > diff --git a/xen/arch/arm/sysctl.c b/xen/arch/arm/sysctl.c
> > index b0a78a8b10..8b813c970f 100644
> > --- a/xen/arch/arm/sysctl.c
> > +++ b/xen/arch/arm/sysctl.c
> > @@ -9,6 +9,7 @@
> >   #include <xen/types.h>
> >   #include <xen/lib.h>
> > +#include <xen/dt-overlay.h>
> >   #include <xen/errno.h>
> >   #include <xen/hypercall.h>
> >   #include <public/sysctl.h>
> > @@ -21,7 +22,20 @@ void arch_do_physinfo(struct xen_sysctl_physinfo *pi)
> >   long arch_do_sysctl(struct xen_sysctl *sysctl,
> >                       XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
> >   {
> > -    return -ENOSYS;
> > +    long ret;
> > +
> > +    switch ( sysctl->cmd )
> > +    {
> > +    case XEN_SYSCTL_dt_overlay:
> > +        ret = dt_sysctl(&sysctl->u.dt_overlay);
> > +        break;
> > +
> > +    default:
> > +        ret = -ENOSYS;
> > +        break;
> > +    }
> > +
> > +    return ret;
> >   }
> >   /*
> > diff --git a/xen/common/Makefile b/xen/common/Makefile
> > index 46049eac35..e7e96b1087 100644
> > --- a/xen/common/Makefile
> > +++ b/xen/common/Makefile
> > @@ -8,6 +8,7 @@ obj-$(CONFIG_DEBUG_TRACE) += debugtrace.o
> >   obj-$(CONFIG_HAS_DEVICE_TREE) += device_tree.o
> >   obj-$(CONFIG_IOREQ_SERVER) += dm.o
> >   obj-y += domain.o
> > +obj-$(CONFIG_OVERLAY_DTB) += dt-overlay.o
> >   obj-y += event_2l.o
> >   obj-y += event_channel.o
> >   obj-y += event_fifo.o
> > diff --git a/xen/common/dt-overlay.c b/xen/common/dt-overlay.c
> > new file mode 100644
> > index 0000000000..b2a7e441df
> > --- /dev/null
> > +++ b/xen/common/dt-overlay.c
> > @@ -0,0 +1,420 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +/*
> > + * xen/common/dt-overlay.c
> > + *
> > + * Device tree overlay support in Xen.
> > + *
> > + * Copyright (C) 2023, Advanced Micro Devices, Inc. All Rights Reserved.
> > + * Written by Vikram Garhwal <vikram.garhwal@amd.com>
> > + *
> > + */
> > +#include <asm/domain_build.h>
> > +#include <xen/dt-overlay.h>
> > +#include <xen/guest_access.h>
> > +#include <xen/iocap.h>
> > +#include <xen/xmalloc.h>
> > +
> > +static LIST_HEAD(overlay_tracker);
> > +static DEFINE_SPINLOCK(overlay_lock);
> > +
> > +/* Find last descendants of the device_node. */
> > +static struct dt_device_node *
> > +                find_last_descendants_node(struct dt_device_node *device_node)
> > +{
> > +    struct dt_device_node *child_node;
> > +
> > +    for ( child_node = device_node->child; child_node->sibling != NULL;
> > +          child_node = child_node->sibling );
> > +
> > +    /* If last child_node also have children. */
> > +    if ( child_node->child )
> > +        child_node = find_last_descendants_node(child_node);
> > +
> > +    return child_node;
> > +}
> > +
> > +static int dt_overlay_remove_node(struct dt_device_node *device_node)
> > +{
> > +    struct dt_device_node *np;
> > +    struct dt_device_node *parent_node;
> > +    struct dt_device_node *device_node_last_descendant = device_node->child;
> > +
> > +    parent_node = device_node->parent;
> > +
> > +    if ( parent_node == NULL )
> 
> Is this trying to check if we are trying to remove "/"? If not, what's this
> for?
> 
> Either way, I would suggest to add a comment explaining what this check is
> for.
Yeah, the check is to make sure we don't remove the root node. Update the code
with comment
> 
> > +    {
> > +        dt_dprintk("%s's parent node not found\n", device_node->name);
> > +        return -EFAULT;
> > +    }
> > +
> > +    np = parent_node->child;
> > +
> > +    if ( np == NULL )
> 
> Why would parent_node->child is NULL if we found the parent from
> device_node?
This was a sanity check to make sure parent->child exist to avoid accessing a
NULL pointer.
> 
> > +    {
> > +        dt_dprintk("parent node %s's not found\n", parent_node->name);
> > +        return -EFAULT;
> > +    }
> > +
> > +    /* If node to be removed is only child node or first child. */
> > +    if ( !dt_node_cmp(np->full_name, device_node->full_name) )
> > +    {
> > +        parent_node->child = np->sibling;
> > +
> > +        /*
> > +         * Iterate over all child nodes of device_node.
> 
> I am not sure how this matches the code below. I think it might be better to
> explain why it is necessary to find the last descendant. AFAIU, you seem to
> rely on the fact that allnext will point to the next children and every node
> in that list up to the last descandant will be under device_node.
I added explanation as comment. Hopefully, it's better now.
> 
> > Given that we are
> > +         * removing parent node, we need to remove all it's descendants too.
> > +         */
> > +        if ( device_node_last_descendant )
> > +        {
> > +            device_node_last_descendant =
> > +                                        find_last_descendants_node(device_node);
> 
> This indentation is not nice. Can we shorten the variable to
> last_descendant?
Done
> 
> > +            parent_node->allnext = device_node_last_descendant->allnext;
> > +        }
> > +        else
> > +            parent_node->allnext = np->allnext;
> > +
> > +        return 0;
> > +    }
> > +
> > +    for ( np = parent_node->child; np->sibling != NULL; np = np->sibling )
> > +    {
> > +        if ( !dt_node_cmp(np->sibling->full_name, device_node->full_name) )
> > +        {
> > +            /* Found the node. Now we remove it. */
> > +            np->sibling = np->sibling->sibling;
> > +
> > +            if ( np->child )
> > +                np = find_last_descendants_node(np);
> > +
> > +            /*
> > +             * Iterate over all child nodes of device_node. Given that we are
> > +             * removing parent node, we need to remove all it's descendants too.
> > +             */
> > +            if ( device_node_last_descendant )
> > +                device_node_last_descendant =
> > +                                        find_last_descendants_node(device_node);
> > +
> > +            if ( device_node_last_descendant )
> > +                np->allnext = device_node_last_descendant->allnext;
> > +            else
> > +                np->allnext = np->allnext->allnext;
> > +
> > +            break;
> > +        }
> > +    }
> > +
> > +    return 0;
> > +}
> > +
> > +/* Basic sanity check for the dtbo tool stack provided to Xen. */
> > +static int check_overlay_fdt(const void *overlay_fdt, uint32_t overlay_fdt_size)
> > +{
> > +    if ( (fdt_totalsize(overlay_fdt) != overlay_fdt_size) ||
> > +          fdt_check_header(overlay_fdt) )
> > +    {
> > +        printk(XENLOG_ERR "The overlay FDT is not a valid Flat Device Tree\n");
> > +        return -EINVAL;
> > +    }
> > +
> > +    return 0;
> > +}
> > +
> > +/* Count number of nodes till one level of __overlay__ tag. */
> > +static unsigned int overlay_node_count(const void *overlay_fdt)
> > +{
> > +    unsigned int num_overlay_nodes = 0;
> > +    int fragment;
> > +
> > +    fdt_for_each_subnode(fragment, overlay_fdt, 0)
> > +    {
> > +        int subnode;
> > +        int overlay;
> > +
> > +        overlay = fdt_subnode_offset(overlay_fdt, fragment, "__overlay__");
> > +
> > +        /*
> > +         * overlay value can be < 0. But fdt_for_each_subnode() loop checks for
> > +         * overlay >= 0. So, no need for a overlay>=0 check here.
> > +         */
> > +        fdt_for_each_subnode(subnode, overlay_fdt, overlay)
> > +        {
> > +            num_overlay_nodes++;
> > +        }
> > +    }
> > +
> > +    return num_overlay_nodes;
> > +}
> > +
> > +static int handle_remove_irq_iommu(struct dt_device_node *device_node)
> 
> How about remove_resources()? This would avoid to miss the fact you are
> removing MMIO mapping as well and make the name a bit more palatable.
Changed in v8.
> 
> > +{
> > +    int rc = 0;
> > +    struct domain *d = hardware_domain;
> > +    domid_t domid;
> > +    unsigned int naddr, len;
> > +    unsigned int i, nirq;
> > +
> > +    domid = dt_device_used_by(device_node);
> 
> Looking at the caller, it is not clear to me which lock is preventing the
> device to be assigned whilst you remove it.
So, this is on user to make sure the domain is not using the device.
The part 2 of this series, where we assign/deassign nodes to a running VM, there
we have the check to make sure no one is assigning it when it's being removed.
For now, can we protect it with dtdevs_lock?
> 
> > +
> > +    dt_dprintk("Checking if node %s is used by any domain\n",
> > +               device_node->full_name);
> > +
> > +    /* Remove the node if only it's assigned to domain 0 or domain io. */
> 
> Hmmm... Above, you are using hardware_domain. This may be dom0. So shouldn't
> you check against hardware_domain->domain_id?
Changed this one
> 
> > +    if ( domid != 0 && domid != DOMID_IO )
> > +    {
> > +        printk(XENLOG_ERR "Device %s is being used by domain %u. Removing nodes failed\n",
> > +               device_node->full_name, domid);
> > +        return -EINVAL;
> > +    }
> > +
> > +    dt_dprintk("Removing node: %s\n", device_node->full_name);
> > +
> > +    nirq = dt_number_of_irq(device_node); > +
> > +    /* Remove IRQ permission */
> > +    for ( i = 0; i < nirq; i++ )
> > +    {
> > +        rc = platform_get_irq(device_node, i);
> 
> As I mentioned in [1], I think that parsing the Device-Tree again when
> removing any interrupts/mappings is a bit odd as there are more possible
> failures and is more complex than necessary. I have proposed a way to do it
> with rangeset, but I can't find any reason why this wasn't done. Can you
> explain?
IIUC, range sets can work if we have only one level of node i.e. no children.
I tried in previous version to use range but it's complicated to get info in
correct order using rangeset. Example, we have three nodes, node A, B and C. A
has three child A_a, A_b and A_c. While adding the nodes, we add A first then
A_a, A_b, A_c and finally B and C. And rangeset is updated in same order but 
when we remove node, first A_c is removed followed by A_b and A_a and then A.
So, this was the problem for me on how to keep track which interrupt belong to
which node.

> 
> > +        if ( rc < 0 )
> > +        {
> > +            printk(XENLOG_ERR "Failed to get IRQ num for device node %s\n",
> > +                   device_node->full_name);
> > +            return -EINVAL;
> > +        }
> > +
> > +        if ( irq_access_permitted(d, rc) == false )
> 
> We commonly use "!irq_acess_permitted()". But, as pointed out in [1] with
> this check, it means that we would not be able to call remove again on the
> same node if the removal was partially done.
> 
> You suggested that the admin would need to reboot the platform. But this
> decision doesn't seem to documented in the commit message nor in the tools
> documentation. Can this be done?
Added in commit message.
> 
> > +        {
> > +            printk(XENLOG_ERR "IRQ %d is not routed to domain %u\n", rc,
> > +                   domid);
> 
> I am probably missing something here. From my understanding,
> irq_access_permitted() only tells you if the domain is allowed to manage the
> interrupt. So you could have two domains (the hardware domain and the guest)
> with irq_access_permitted() set. In fact, the hardware domain should always
> have it permitted.
> 
> If you want to check for the routing, then you will have to look for the
> information in the 'irq->desc'.

Yeah, this was a redundant check. removed it.
> > +            return -EINVAL;
> > +        }
> > +        /*
> > +         * TODO: We don't handle shared IRQs for now. So, it is assumed that
> > +         * the IRQs was not shared with another devices.
> > +         */
> > +        rc = irq_deny_access(d, rc);
> > +        if ( rc )
> > +        {
> > +            printk(XENLOG_ERR "unable to revoke access for irq %u for %s\n",
> > +                   i, device_node->full_name);
> > +            return rc;
> > +        }
> 
> You don't reverse the change in the routing. What would happen if the next
> overlay is updated to now pass the same device to a guest?
> 
> I would be OK if this is not handled in this series. But it should be marked
> as a TODO.
So, i explained the reason behind this in v4:
    https://www.mail-archive.com/xen-devel@lists.xenproject.org/msg137490.html
Let me copy paste here if the link doesn't work:
"The main purpose of this series to address first part of dynamic programming
i.e. making Xen aware of new device tree node which means updating the dt_host
with overlay node information. Here we are adding/removing node from dt_host,
and checking/set IOMMU and IRQ permission but never mapping them to any domain.
Right now, mapping/Un-mapping will happen only when a new domU is
created/destroyed using "xl create".
To map IOREQ and IOMMU during runtime, there will be another small series after 
this one where we will do the actual IOMMU and IRQ mapping do a running domain
and will call  unmap_mmio_regions() to remove the mapping.

Here is the patch for that series:
https://github.com/Xilinx/xen/commit/76fcd5defc1c7c375cb99ac73a4d1138aa87d474
I will clean it and send once current series is done.

Also, If you see addition part of this series, we put "skip_mapping = true"
which means map_range_to_domain()->map_range_p2mt() is never called.
The only thing function which will be called is iomem_permit_access() while
adding the node and here we are calling opposite function to remove the access."

> 
> > +    }
> > +
> > +    /* Check if iommu property exists. */
> > +    if ( dt_get_property(device_node, "iommus", &len) )
> > +    {
> > +        rc = iommu_remove_dt_device(device_node);
> > +        if ( rc != 0 && rc != -ENXIO )
> 
> Checking iommu_remove_dt_device() (I didn't check the driver
> implementation), I can't find any use of ENXIO. So can you explain in which
> condition this is meant to be returned?
There were some cases it was returning ENXIO for valid overlay with wrong IOMMU
but i cannot find that example anymore. Removed the check for now.
> 
> > +            return rc;
> > +    }
> > +
> > +    naddr = dt_number_of_address(device_node);
> > +
> > +    /* Remove mmio access. */
> > +    for ( i = 0; i < naddr; i++ )
> > +    {
> > +        uint64_t addr, size;
> > +
> > +        rc = dt_device_get_address(device_node, i, &addr, &size);
> > +        if ( rc )
> > +        {
> > +            printk(XENLOG_ERR "Unable to retrieve address %u for %s\n",
> > +                   i, dt_node_full_name(device_node));
> > +            return rc;
> > +        }
> > +
> > +        rc = iomem_deny_access(d, paddr_to_pfn(addr),
> > +                               paddr_to_pfn(PAGE_ALIGN(addr + size - 1)));
> 
> As pointed out in [1], I expect the function remove to be the inverse of
> add. Yet, you are not removing the mapping in the P2M.
> 
> I still don't think it is correct to leave the mapping around. But if you
> think it is necessary then I think this should be documented.
> 
> > +        if ( rc )
> > +        {
> > +            printk(XENLOG_ERR "Unable to remove dom%d access to"
> > +                   " 0x%"PRIx64" - 0x%"PRIx64"\n",
> > +                   d->domain_id,
> > +                   addr & PAGE_MASK, PAGE_ALIGN(addr + size) - 1);
> > +            return rc;
> > +        }
> > +
> > +    }
> > +
> > +    return rc;
> > +}
> > +
> > +/* Removes all descendants of the given node. */
> > +static int remove_all_descendant_nodes(struct dt_device_node *device_node)
> > +{
> > +    int rc = 0;
> > +    struct dt_device_node *child_node;
> > +
> > +    for ( child_node = device_node->child; child_node != NULL;
> > +         child_node = child_node->sibling )
> > +    {
> > +        if ( child_node->child )
> > +            remove_all_descendant_nodes(child_node);
> 
> AFAICT, the function could return an error. Can you explain why this is not
> checked?
Added
> 
> > +
> > +        rc = handle_remove_irq_iommu(child_node);
> > +        if ( rc )
> > +            return rc;
> > +    }
> > +
> > +    return rc;
> > +}
> > +
> > +/* Remove nodes from dt_host. */
> > +static int remove_nodes(const struct overlay_track *tracker)
> > +{
> > +    int rc = 0;
> > +    struct dt_device_node *overlay_node;
> > +    unsigned int j;
> > +
> > +    for ( j = 0; j < tracker->num_nodes; j++ )
> > +    {
> > +        overlay_node = (struct dt_device_node *)tracker->nodes_address[j];
> > +        if ( overlay_node == NULL )
> > +        {
> > +            printk(XENLOG_ERR "Device %s is not present in the tree. Removing nodes failed\n",
> > +                   overlay_node->full_name);
> > +            return -EINVAL;
> > +        }
> > +
> > +        rc = remove_all_descendant_nodes(overlay_node);
> > +
> > +        /* All children nodes are unmapped. Now remove the node itself. */
> > +        rc = handle_remove_irq_iommu(overlay_node);
> > +        if ( rc )
> > +            return rc;
> > +
> > +        read_lock(&dt_host->lock);
> Shouldn't this be a write_lock()?
Changed
> 
> > +
> > +        rc = dt_overlay_remove_node(overlay_node);
> > +        if ( rc )
> > +        {
> > +            read_unlock(&dt_host->lock);
> > +
> > +            return rc;
> > +        }
> > +
> > +        read_unlock(&dt_host->lock);
> > +    }
> > +
> > +    return rc;
> > +}
> > +
> > +/*
> > + * First finds the device node to remove. Check if the device is being used by
> > + * any dom and finally remove it from dt_host. IOMMU is already being taken care
> > + * while destroying the domain.
> > + */
> > +static long handle_remove_overlay_nodes(void *overlay_fdt,
> > +                                        uint32_t overlay_fdt_size)
> > +{
> > +    int rc;
> > +    struct overlay_track *entry, *temp, *track;
> > +    bool found_entry = false;
> > +
> > +    rc = check_overlay_fdt(overlay_fdt, overlay_fdt_size);
> > +    if ( rc )
> > +        return rc;
> > +
> > +    if ( overlay_node_count(overlay_fdt) == 0 )
> > +        return -EINVAL;
> 
> Why do you need to check the validity of the FDT when...
> 
> > +
> > +    spin_lock(&overlay_lock);
> > +
> > +    /*
> > +     * First check if dtbo is correct i.e. it should one of the dtbo which was
> > +     * used when dynamically adding the node.
> > +     * Limitation: Cases with same node names but different property are not
> > +     * supported currently. We are relying on user to provide the same dtbo
> > +     * as it was used when adding the nodes.
> > +     */
> > +    list_for_each_entry_safe( entry, temp, &overlay_tracker, entry )
> > +    {
> > +        if ( memcmp(entry->overlay_fdt, overlay_fdt, overlay_fdt_size) == 0 )
> 
> ... you compare against what we stored in Xen? If we found the entry, then
> wouldn't it mean that the FDT is valid?
> 
Updated this one!
> > +        {
> > +            track = entry;
> > +            found_entry = true;
> > +            break;
> > +        }
> > +    }
> > +
> > +    if ( found_entry == false )
> 
> We commonly use !found_entry.
> 
> > +    {
> > +        rc = -EINVAL;
> > +
> > +        printk(XENLOG_ERR "Cannot find any matching tracker with input dtbo."
> > +               " Removing nodes is supported only for prior added dtbo.\n");
> > +        goto out;
> > +
> > +    }
> > +
> > +    rc = remove_nodes(entry);
> > +    if ( rc )
> > +    {
> > +        printk(XENLOG_ERR "Removing node failed\n");
> > +        goto out;
> > +    }
> > +
> > +    list_del(&entry->entry);
> > +
> > +    xfree(entry->dt_host_new);
> > +    xfree(entry->fdt);
> > +    xfree(entry->overlay_fdt);
> > +
> > +    xfree(entry->nodes_address);
> > +
> > +    xfree(entry);
> > +
> > +out:
> > +    spin_unlock(&overlay_lock);
> > +    return rc;
> > +}
> > +
> > +long dt_sysctl(struct xen_sysctl_dt_overlay *op)
> 
> It would be best to name it dt_overlay_sysctl() is this is meant to handle
> only overlay operations. If we want to do more, then I think we want to name
> the sysctl SYSCTL_DEVICE_TREE to reflect the more general purpose (renaming
> the sysctl after the fact is a pain).
> 
Changed it to dt_overlay_sysctl
> > +{
> > +    long ret;
> > +    void *overlay_fdt;
> > +
> > +    if ( op->overlay_fdt_size == 0 ||
> 
> Do you expect the rest of the code to misbehave if we pass 0?
> 
> > op->overlay_fdt_size > KB(500) )
> 
> How did you decide the value KB(500)?
That maximum overlay dtb used for FPGA examples was 128KB. We put the size to
500KB. I can increase/decrease it if 500KB doesn't make sense.
> 
> > +        return -EINVAL;
> > +
> > +    if ( op->pad[0] || op->pad[1] || op->pad[2] )
> > +        return -EINVAL;
> > +
> > +    overlay_fdt = xmalloc_bytes(op->overlay_fdt_size);
> > +
> > +    if ( overlay_fdt == NULL )
> > +        return -ENOMEM;
> > +
> > +    ret = copy_from_guest(overlay_fdt, op->overlay_fdt, op->overlay_fdt_size);
> > +    if ( ret )
> > +    {
> > +        gprintk(XENLOG_ERR, "copy from guest failed\n");
> > +        xfree(overlay_fdt);
> > +
> > +        return -EFAULT;
> > +    }
> > +
> > +    switch ( op->overlay_op )
> > +    {
> > +    case XEN_SYSCTL_DT_OVERLAY_REMOVE:
> > +        ret = handle_remove_overlay_nodes(overlay_fdt, op->overlay_fdt_size);
> > +
> > +        break;
> > +
> > +    default:
> 
> I think you want to set ret to -EOPNOTSUPP here rather than returning 0.
> Also, it feels to me you want to first check the validity of the operation
> before checking for overlay_fdt_size and the allocation.
> 
> This would allow to re-use the fields 'overlay_fdt_size'/'overlay_fdt' for a
> different purpose on a new operation and also avoid allocating memory when
> we know it will fail.
> 
> The former would not be possible in your current approach because a Xen
> without the hypothetical new sysctl may return -EINVAL/-EFAULT rather than
> -EOPNOTSUPP. So it would be more difficult to differentiate it in the
> toolstack.
> 
So, i re-organized the code now. First, validity of ops is checked, next
memory is allocated and add/remove ops are done.
> > +        break;
> > +    }
> > +
> > +    xfree(overlay_fdt);
> > +
> > +    return ret;
> > +}
> > +
> > +/*
> > + * Local variables:
> > + * mode: C
> > + * c-file-style: "BSD"
> > + * c-basic-offset: 4
> > + * indent-tabs-mode: nil
> > + * End:
> > + */
> > diff --git a/xen/include/public/sysctl.h b/xen/include/public/sysctl.h
> > index 2b24d6bfd0..ff54607617 100644
> > --- a/xen/include/public/sysctl.h
> > +++ b/xen/include/public/sysctl.h
> > @@ -1057,6 +1057,25 @@ typedef struct xen_sysctl_cpu_policy xen_sysctl_cpu_policy_t;
> >   DEFINE_XEN_GUEST_HANDLE(xen_sysctl_cpu_policy_t);
> >   #endif
> > +#if defined(__arm__) || defined (__aarch64__)
> > +/*
> > + * XEN_SYSCTL_dt_overlay
> > + * Performs addition/removal of device tree nodes under parent node using dtbo.
> > + * This does in three steps:
> > + *  - Adds/Removes the nodes from dt_host.
> > + *  - Adds/Removes IRQ permission for the nodes.
> > + *  - Adds/Removes MMIO accesses.
> > + */
> > +struct xen_sysctl_dt_overlay {
> > +    XEN_GUEST_HANDLE_64(void) overlay_fdt;  /* IN: overlay fdt. */
> > +    uint32_t overlay_fdt_size;              /* IN: Overlay dtb size. */
> > +#define XEN_SYSCTL_DT_OVERLAY_ADD                   1
> > +#define XEN_SYSCTL_DT_OVERLAY_REMOVE                2
> > +    uint8_t overlay_op;                     /* IN: Add or remove. */
> > +    uint8_t pad[3];                         /* IN: Must be zero. */
> > +};
> > +#endif
> > +
> >   struct xen_sysctl {
> >       uint32_t cmd;
> >   #define XEN_SYSCTL_readconsole                    1
> > @@ -1087,6 +1106,7 @@ struct xen_sysctl {
> >   #define XEN_SYSCTL_livepatch_op                  27
> >   /* #define XEN_SYSCTL_set_parameter              28 */
> >   #define XEN_SYSCTL_get_cpu_policy                29
> > +#define XEN_SYSCTL_dt_overlay                    30
> >       uint32_t interface_version; /* XEN_SYSCTL_INTERFACE_VERSION */
> >       union {
> >           struct xen_sysctl_readconsole       readconsole;
> > @@ -1117,6 +1137,10 @@ struct xen_sysctl {
> >   #if defined(__i386__) || defined(__x86_64__)
> >           struct xen_sysctl_cpu_policy        cpu_policy;
> >   #endif
> > +
> > +#if defined(__arm__) || defined (__aarch64__)
> > +        struct xen_sysctl_dt_overlay        dt_overlay;
> > +#endif
> >           uint8_t                             pad[128];
> >       } u;
> >   };
> > diff --git a/xen/include/xen/dt-overlay.h b/xen/include/xen/dt-overlay.h
> > new file mode 100644
> > index 0000000000..43fa5a02a0
> > --- /dev/null
> > +++ b/xen/include/xen/dt-overlay.h
> > @@ -0,0 +1,59 @@
> > + /* SPDX-License-Identifier: GPL-2.0-only */
> > + /*
> > + * xen/dt-overlay.h
> > + *
> > + * Device tree overlay support in Xen.
> > + *
> > + * Copyright (C) 2023, Advanced Micro Devices, Inc. All Rights Reserved.
> > + * Written by Vikram Garhwal <vikram.garhwal@amd.com>
> > + *
> > + */
> > +#ifndef __XEN_DT_OVERLAY_H__
> > +#define __XEN_DT_OVERLAY_H__
> > +
> > +#include <xen/list.h>
> > +#include <xen/libfdt/libfdt.h>
> 
> Nothing below is using libfdt.h and ...
Moved this to dt-overlay.c
> 
> > +#include <xen/device_tree.h>
> > +#include <xen/rangeset.h>
> 
> .. rangeset.h. So why do you include them?
> 
Remove this.

Thank you so much for reviewing this patch series!
> > +
> > +/*
> > + * overlay_track describes information about added nodes through dtbo.
> > + * @entry: List pointer.
> > + * @dt_host_new: Pointer to the updated dt_host_new which is unflattened from
> > +    the 'updated fdt'.
> > + * @fdt: Stores the fdt.
> > + * @overlay_fdt: Stores a copy of input overlay_fdt.
> > + * @nodes_address: Stores each overlay_node's address.
> > + * @num_nodes: Total number of nodes in overlay dtb.
> > + */
> > +struct overlay_track {
> > +    struct list_head entry;
> > +    struct dt_device_node *dt_host_new;
> > +    void *fdt;
> > +    void *overlay_fdt;
> > +    unsigned long *nodes_address;
> > +    unsigned int num_nodes;
> > +};
> > +
> > +struct xen_sysctl_dt_overlay;
> > +
> > +#ifdef CONFIG_OVERLAY_DTB
> > +long dt_sysctl(struct xen_sysctl_dt_overlay *op);
> > +#else
> > +#include <xen/errno.h>
> > +static inline long dt_sysctl(struct xen_sysctl_dt_overlay *op)
> > +{
> > +    return -EOPNOTSUPP;
> > +}
> > +#endif
> > +
> > +#endif /* __XEN_DT_OVERLAY_H__ */
> > +/*
> > + * Local variables:
> > + * mode: C
> > + * c-file-style: "BSD"
> > + * c-basic-offset: 4
> > + * tab-width: 4
> > + * indent-tabs-mode: nil
> > + * End:
> > + */
> 
> Cheers,
> 
> [1]
> https://lore.kernel.org/all/478d4c20-31b7-e98d-25c1-4b4e9afe7e0a@xen.org/
> 
> -- 
> Julien Grall

