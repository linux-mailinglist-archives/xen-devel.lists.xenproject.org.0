Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C7146C2EC6
	for <lists+xen-devel@lfdr.de>; Tue, 21 Mar 2023 11:27:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.512307.792229 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peZCW-0002e9-ET; Tue, 21 Mar 2023 10:26:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 512307.792229; Tue, 21 Mar 2023 10:26:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peZCW-0002b9-Bm; Tue, 21 Mar 2023 10:26:44 +0000
Received: by outflank-mailman (input) for mailman id 512307;
 Tue, 21 Mar 2023 10:26:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gvkR=7N=amd.com=Ray.Huang@srs-se1.protection.inumbo.net>)
 id 1peZCU-0002b1-HE
 for xen-devel@lists.xenproject.org; Tue, 21 Mar 2023 10:26:42 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20601.outbound.protection.outlook.com
 [2a01:111:f400:7eae::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id de1f810c-c7d2-11ed-87f5-c1b5be75604c;
 Tue, 21 Mar 2023 11:26:41 +0100 (CET)
Received: from DM5PR12MB2504.namprd12.prod.outlook.com (2603:10b6:4:b5::19) by
 BL0PR12MB4961.namprd12.prod.outlook.com (2603:10b6:208:1c9::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Tue, 21 Mar
 2023 10:26:38 +0000
Received: from DM5PR12MB2504.namprd12.prod.outlook.com
 ([fe80::4f9:60f8:cb12:d022]) by DM5PR12MB2504.namprd12.prod.outlook.com
 ([fe80::4f9:60f8:cb12:d022%3]) with mapi id 15.20.6178.037; Tue, 21 Mar 2023
 10:26:38 +0000
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
X-Inumbo-ID: de1f810c-c7d2-11ed-87f5-c1b5be75604c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FnlIhzyOQleGwleTZHUxlygQEW4UsWyeLrsWAljI1WcapKAY0XdXLEV9y76zjSmB/2Pvtfnspp5Di/Hrty9ZnrYQ7KlRycZD4jUc2PfRJPwsc49XERT8+/6hyjWj0t0sEbDH5tyDVlGpv6wJVWRCUxbwbhYaOU/VQrMRGuRnjwAmnfgD/QW/iUU5U1PzJMhb/tMQ+2MN6FtPHKfbkLmOWb8IBm70XEw+FKD9n7GlnWjXkof6BNUmPTaopuID8YW06F8qjZZ4EZbhdOiF2UZw5GvO+gvUPBVxH/fLpCbW5kDhM+QNSRmPqDtMcTdZ4RoUVZhdZtoi+QZ1cgm0z/8BYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jmzInlVEA9Um9i4v7ttmI2ehcEwXQMSIvu+TQR330sQ=;
 b=KUmYiRqel0A8t54Y/5RqG3+NScA+83ubVxYSk2iTEt+CjG/kGN6ylQT7uwGu1JObPhVO3ubQ4BTLM4OA2wynJmdt4CAD6THkrACtWz8SqSgnMpS/9NlqTnEdT+lTyEARBc+GibjKt5sCTj1ecbuCZmhbBtJSxZ3wGmQR7bqhOBDTPQLzz3I1wxQdH7PVv8f4g7wNz+np9sT8GAnp3FCxm9qE3dh83wvwKJRHnH51ixtIKKJUKElBeS5Xs1vcJqXveD9PgeqMdhmDuHcAm+Gb6sp/rZyy/V9pSyElUAtOjflOkUaZSr0OebY9dtJoBpiWY1k7nnnB9+LM0GlStNK1SQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jmzInlVEA9Um9i4v7ttmI2ehcEwXQMSIvu+TQR330sQ=;
 b=Kuk3OBlzfSOs12QJI1vDS2Nz+cXm66HOG/ZLeZxMy+dv9RvRqLG7pH82C7KXl9jN5Flw9rAXy9ErO+N7p5VFOPT58IQbG9lB4AI8iXNCXvMKxtWQIYoARJmlU55FVpbpvNmbh8KRN0qhMYEeDgeR2tN5Y7slVlRp9RLfNpttIzQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Date: Tue, 21 Mar 2023 18:26:10 +0800
From: Huang Rui <ray.huang@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>
Cc: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"Deucher, Alexander" <Alexander.Deucher@amd.com>,
	"Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>,
	Xenia Ragiadakou <burzalodowa@gmail.com>,
	"Huang, Honglei1" <Honglei1.Huang@amd.com>,
	"Zhang, Julia" <Julia.Zhang@amd.com>,
	"Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [RFC XEN PATCH 0/6] Introduce VirtIO GPU and Passthrough GPU
 support on Xen PVH dom0
Message-ID: <ZBmGQiJ1pnorhI1j@amd.com>
References: <20230312075455.450187-1-ray.huang@amd.com>
 <e8e2a3e7-5191-e310-0900-a6a9b76c0458@amd.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e8e2a3e7-5191-e310-0900-a6a9b76c0458@amd.com>
X-ClientProxiedBy: SG2PR04CA0214.apcprd04.prod.outlook.com
 (2603:1096:4:187::17) To DM5PR12MB2504.namprd12.prod.outlook.com
 (2603:10b6:4:b5::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM5PR12MB2504:EE_|BL0PR12MB4961:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c4c1918-fb5f-46a5-9c51-08db29f6c0cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	o/FX3S6Sw1pCgHg5PtGR1SM0YPijjt6AM0F4P4MYfxMy9HdGFfNDWLLkee9uSUjf2CydgIEo4IsKDN21LmwNhTSNjPy5Tl0NfnxVwMYGY8Af6/6iahy8IyeuiNhjXh4MNcCWRYlAR1ih/DUIdcJ+dhSaS7AY4kLOt4JZr1Ps+rFxvW/lHGPOmsq2g6fZYmPO/N2EvwQLV7kc/joKw4ZZs5Ia8l9CrT4D4X/Yui6VqOIwMsc92B5UIuOfXnMj/TtfL8RS2k7XMJYZP+03nC7P+Wx081thgk2gU1ds+yOP3zgFPEaqp2p8ysCRJZYfrjg4nUjlxOvX8Ql0aH+qDDre2FOfFx34PKOgFRPLc3CkVf1UTmdmt1Ivory2gudzEYiLkvIGgjmwPh7QdMC3h0/XanZ3UwrY4/qb8Dg7+G2ZBA7ut74SedHN99Wru3peeq/tOIhDcuvsEY5VMUSe0nsOmCk2HIUWvU+9zaeiF2nOcua9q6sxW2I8DO+iQl3Tq/fWCvnrh7FR4vZF2KeKlQ6NSciDOwAYtfGMyZI7oFXMBYwaQl+ccyL9Y5zGcs/BAUUbM/A21EmZXZlnGv/yb3oCfI4aAQ/NX56+otvqP9SqsWNUMb43rwmqeCkSZGC+3p/w1T8mez+knAQNtpH/17Gq3uuI9maeqQ/yP5VVFW/G0gvUj8Zq6QrbgBNTaAVUrjMpE/t6Spggfu1OCZXOYj2X8lRl+5UzFtvA5mAEAuQei4U=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR12MB2504.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(376002)(39860400002)(136003)(396003)(346002)(451199018)(66574015)(38100700002)(86362001)(316002)(37006003)(6636002)(54906003)(8676002)(36756003)(66946007)(66556008)(66476007)(5660300002)(6862004)(8936002)(4326008)(41300700001)(478600001)(2906002)(83380400001)(6666004)(2616005)(186003)(6506007)(26005)(6512007)(5930299012)(6486002)(966005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cSw91TssLnQNNoD4vSuwaB8UrWYFORLtq9nPGEPi0S/Sb5TbtSDiqQd0/0g4?=
 =?us-ascii?Q?anjLq/WHjTiDEswLetLXjZ7uwoBrpsNZIjAJefYF1yt3RaWSsFV+LMKrHjq0?=
 =?us-ascii?Q?GN0uS11dNDZq8koLOd0j8sVCazsUVAh5T7zEFrG+t/mqEZv5PW9Lhj7zSDrl?=
 =?us-ascii?Q?rRO0KJ+5T2+X2QvFsfwEnuyb0tb7l8Lygw7p1L8gF7rD/oS56fYWJOEMCixy?=
 =?us-ascii?Q?vHURSkGVv2zRv6iYU7AA5i49NUleLW7YIY4qfaM0+A+VIwQSQrD/nq9Akj1a?=
 =?us-ascii?Q?JYmVhGwsgx/DX1CNodsyO+lk45w2SgpXrXLfpKElB7GlTx/i+XH/eqM8EEq6?=
 =?us-ascii?Q?zt8NJtYJpU8Q8H8iPEXpJT3VbvbgCHtj9VGxDishLZNazD2eB/PY4HgwKgfY?=
 =?us-ascii?Q?v3fLvPpbwOYqg7ZY4ciExDaonwmQ0JbYHvC4zydzucBf/B+qbx54yQouOziA?=
 =?us-ascii?Q?Sq010mCBlR9QUGI9UqaXv4Azm6iTLTgEazI9MfBqh87q2a0wgckDQao3tQnU?=
 =?us-ascii?Q?BOB5jDlcIGOcNVFpW/TnBvuwB62Hr40nQZ/jBBNwCY8WkX6eYCIeLLhIEy6V?=
 =?us-ascii?Q?Oa905ccBzw+u9sN+KEkJB+UQSR1iW7BJspjfPxgxqEe9dkF/ZClA+t5N0lSB?=
 =?us-ascii?Q?3ebJkJSj8PjdWFVrWQksL7wdfEMvIR6Knli/NitF4hkoyUO22S3RiU3/hBL+?=
 =?us-ascii?Q?fvTKM9aJvcPjQwaiOqmPLGhp+5KG2On458hrJBnlCdqlzCjkGCtNYrtIb9Cg?=
 =?us-ascii?Q?T/hQzO4sPdfI+CBfiPYJCgO9bFDO3kl48r0tma9k2ulHiSAo6cbJBK0zrHOg?=
 =?us-ascii?Q?Fux73q7EAzEU/7J3KM8cBvy5NsAx62RQKnBr1YbOfSU+eLqkrqNB9dXyFNQb?=
 =?us-ascii?Q?CC9Dt+XbFujai+DKoYnoub8JHZdIaaWHbVrBMvAPzxnrjmnN5Ig0rAmzrYMs?=
 =?us-ascii?Q?OMXqm9UgMgW4UQIOm8wg7fhmEARuZovchC35oWdirf8OUWiO5jr8l2pkSj9N?=
 =?us-ascii?Q?V+hmhd7lHDhFaZuzQLsu1igC3UVF9eiRGTSpQwQUWk+VbaFFkwrzwOpj97V9?=
 =?us-ascii?Q?95hzqhikDPBml5cQpLd1+rGFJCSfFL2UjU41QMCWc5pIsAz5FUVyM2yPPvqw?=
 =?us-ascii?Q?Ft0SDg5ejyhJQSacWcDKnaFqUfvSUazyilEILH6pkMi99Bvyl3juCdV/0rSa?=
 =?us-ascii?Q?fOilVnMn8bE3c2ihHPp/8isCQqYXwQ0uIimLbZb3+cuPOTNiw+u5S4PXs9VX?=
 =?us-ascii?Q?scYsD4IABDp/zszQ8SNq5ZVM18RA+KheSXRukuVMDkjteO0HuL09eOrdvgKR?=
 =?us-ascii?Q?J6+onfMXhOr6+vl7gCTSnFgnBo+9vna6dwRZXtZE7tT/VKds58VqRRFvVlHF?=
 =?us-ascii?Q?d+H2SAuEmD5LjT+1zhbzMdQNlzYWnT4g94kYHs/NgsJMLDSFgujAzxzxkCJm?=
 =?us-ascii?Q?up9F2kvIko+xZZcYxWvJh+PESt56iWg4mBlBXt1tI7yQjKEpXQ4vXpyBrkgG?=
 =?us-ascii?Q?DY2uIaCdd1F090Ji6JJ9xGL5Z76DtSVyxvwE4YjbhyRkMCktqyF28iiy8t9r?=
 =?us-ascii?Q?IrG5CMIFJuQQgJt3njs9ZBypgx2w/t/mCnTEDNx4?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c4c1918-fb5f-46a5-9c51-08db29f6c0cf
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB2504.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2023 10:26:37.9707
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vn6haXK5joa6zXxsXUZ3usIDGR9syzdYCMsEhUTG6d15+Y1NdfvFL+jBY7awM0b3WLJfQUCrR1t5kR6TJfIv8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4961

On Mon, Mar 13, 2023 at 03:24:55PM +0800, Koenig, Christian wrote:
> Hi Ray,
> 
> one nit comment on the style, apart from that looks technical correct.
> 
> But I'm *really* not and expert on all that stuff.

Christian, thanks anyway. :-)

Thanks,
Ray

> 
> Regards,
> Christian.
> 
> Am 12.03.23 um 08:54 schrieb Huang Rui:
> > Hi all,
> >
> > In graphic world, the 3D applications/games are runing based on open
> > graphic libraries such as OpenGL and Vulkan. Mesa is the Linux
> > implemenatation of OpenGL and Vulkan for multiple hardware platforms.
> > Because the graphic libraries would like to have the GPU hardware
> > acceleration. In virtualization world, virtio-gpu and passthrough-gpu are
> > two of gpu virtualization technologies.
> >
> > Current Xen only supports OpenGL (virgl:
> > https://docs.mesa3d.org/drivers/virgl.html) for virtio-gpu and passthrough
> > gpu based on PV dom0 for x86 platform. Today, we would like to introduce
> > Vulkan (venus: https://docs.mesa3d.org/drivers/venus.html) and another
> > OpenGL on Vulkan (zink: https://docs.mesa3d.org/drivers/zink.html) support
> > for VirtIO GPU on Xen. These functions are supported on KVM at this moment,
> > but so far, they are not supported on Xen. And we also introduce the PCIe
> > passthrough (GPU) function based on PVH dom0 for AMD x86 platform.
> >
> > These supports required multiple repositories changes on kernel, xen, qemu,
> > mesa, and virglrenderer. Please check below branches:
> >
> > Kernel: https://git.kernel.org/pub/scm/linux/kernel/git/rui/linux.git/log/?h=upstream-fox-xen
> > Xen: https://gitlab.com/huangrui123/xen/-/commits/upstream-for-xen
> > QEMU: https://gitlab.com/huangrui123/qemu/-/commits/upstream-for-xen
> > Mesa: https://gitlab.freedesktop.org/rui/mesa/-/commits/upstream-for-xen
> > Virglrenderer: https://gitlab.freedesktop.org/rui/virglrenderer/-/commits/upstream-for-xen
> >
> > In xen part, we mainly add the PCIe passthrough support on PVH dom0. It's
> > using the QEMU to passthrough the GPU device into guest HVM domU. And
> > mainly work is to transfer the interrupt by using gsi, vector, and pirq.
> >
> > Below are the screenshot of these functions, please take a look.
> >
> > Venus:
> > https://drive.google.com/file/d/1_lPq6DMwHu1JQv7LUUVRx31dBj0HJYcL/view?usp=share_link
> >
> > Zink:
> > https://drive.google.com/file/d/1FxLmKu6X7uJOxx1ZzwOm1yA6IL5WMGzd/view?usp=share_link
> >
> > Passthrough GPU:
> > https://drive.google.com/file/d/17onr5gvDK8KM_LniHTSQEI2hGJZlI09L/view?usp=share_link
> >
> > We are working to write the documentation that describe how to verify these
> > functions in the xen wiki page. And will update it in the future version.
> >
> > Thanks,
> > Ray
> >
> > Chen Jiqian (5):
> >    vpci: accept BAR writes if dom0 is PVH
> >    x86/pvh: shouldn't check pirq flag when map pirq in PVH
> >    x86/pvh: PVH dom0 also need PHYSDEVOP_setup_gsi call
> >    tools/libs/call: add linux os call to get gsi from irq
> >    tools/libs/light: pci: translate irq to gsi
> >
> > Roger Pau Monne (1):
> >    x86/pvh: report ACPI VFCT table to dom0 if present
> >
> >   tools/include/xen-sys/Linux/privcmd.h |  7 +++++++
> >   tools/include/xencall.h               |  2 ++
> >   tools/include/xenctrl.h               |  2 ++
> >   tools/libs/call/core.c                |  5 +++++
> >   tools/libs/call/libxencall.map        |  2 ++
> >   tools/libs/call/linux.c               | 14 ++++++++++++++
> >   tools/libs/call/private.h             |  9 +++++++++
> >   tools/libs/ctrl/xc_physdev.c          |  4 ++++
> >   tools/libs/light/libxl_pci.c          |  1 +
> >   xen/arch/x86/hvm/dom0_build.c         |  1 +
> >   xen/arch/x86/hvm/hypercall.c          |  3 +--
> >   xen/drivers/vpci/header.c             |  2 +-
> >   xen/include/acpi/actbl3.h             |  1 +
> >   13 files changed, 50 insertions(+), 3 deletions(-)
> >
> 

