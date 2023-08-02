Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B62C176C52D
	for <lists+xen-devel@lfdr.de>; Wed,  2 Aug 2023 08:15:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.574704.900231 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qR57I-00034l-AM; Wed, 02 Aug 2023 06:13:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 574704.900231; Wed, 02 Aug 2023 06:13:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qR57I-00032c-6e; Wed, 02 Aug 2023 06:13:52 +0000
Received: by outflank-mailman (input) for mailman id 574704;
 Wed, 02 Aug 2023 06:13:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4j5E=DT=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qR57F-00032W-Qg
 for xen-devel@lists.xenproject.org; Wed, 02 Aug 2023 06:13:50 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on20605.outbound.protection.outlook.com
 [2a01:111:f400:fe12::605])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bce8901e-30fb-11ee-b25e-6b7b168915f2;
 Wed, 02 Aug 2023 08:13:46 +0200 (CEST)
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AS8PR08MB8683.eurprd08.prod.outlook.com (2603:10a6:20b:563::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.45; Wed, 2 Aug
 2023 06:13:43 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::7083:22dc:6b5f:5965]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::7083:22dc:6b5f:5965%7]) with mapi id 15.20.6631.045; Wed, 2 Aug 2023
 06:13:43 +0000
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
X-Inumbo-ID: bce8901e-30fb-11ee-b25e-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=POlnQ7PiXPHuezO7vc8Wineosa+11S/uSCLo/RAiAkrizh//25AKCzrF1tKbYR3UVpUacR3W2yqBhzwd8GH4oUTzjybBZixs+gR9ldxNSf/y7NFXde486p0MQC2+LApEjbC0ASYc0F3nvzjJ+qrGeZ1sHcWBCt/olLPkxwlXRAyetwZGQwkcR2mvlVMSoULBSzyv4viOPJFA73lLWfimIs9TwfyTDRskp8IIFURIW8Orv7qoQQ0SDZZwsJG9wQ3gLbkMk73QaQsozZoF6zxssogxST//vuw/KyVZg8WQFT5Tbe4wCwtSdajqZvOFEpWDTco7A9ztOjWss6E+TC57RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ndeMOJpnV5l16pEpE8gpP+JmxPx03elHUu9IBQo0zVo=;
 b=jY7rm7twOOdLZuJ/tYI1lVUkxVMTh/c/qsIKwogkRXuyUdvm0ZoJi76tTxGZ8m/Fs3piFQ3cbkA1TR7fuKBznPUnNEeRofE5XTb3I5ycI90wDjXNUOMHNM64Vo6XCUdxa0bS7N8PoVgE29s+kAgbGvYCiZAwGxLW7z6eg8kyFnCWIBDD90j5EbYtdhlazX5j+rO+LsVvO6P1LtEdslnEsmKGNqNuU439tjs+mvc0YlE6i921W2gN5lzs2shQZl88pmKlgGOODJ7wDARhk1ZVWvo2f1F/WopEpAt15Bj1L2P8QpR7ltVnO1+Y/7Ys1m3MIIxHMVH6b+JBFl2I9d2huw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ndeMOJpnV5l16pEpE8gpP+JmxPx03elHUu9IBQo0zVo=;
 b=6PYK/fFsrIqdkye56VaIOjNoDtxJPWi45Kscs2pvovW0eV/uZxBmRqwvg+y/2uxS1+VwkhjdgbSOAlOJcVfjSKPSI+cI7zZBujW41u5HF1dRGl8sIuYgxSEPaw7wW294DoQJh4GYPATQJVTLYTOQ/UpHbIXdJ3/hG3UzBqjSDvw=
From: Henry Wang <Henry.Wang@arm.com>
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>
Subject: RE: [PATCH 2/2] fdt: make fdt handling reusable across arch
Thread-Topic: [PATCH 2/2] fdt: make fdt handling reusable across arch
Thread-Index: AQHZxJNabMSouWTajUmNjHUgHUELYa/Whhow
Date: Wed, 2 Aug 2023 06:13:42 +0000
Message-ID:
 <AS8PR08MB799102916C8CA24C276DB51A920BA@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20230801161409.25905-1-dpsmith@apertussolutions.com>
 <20230801161409.25905-3-dpsmith@apertussolutions.com>
In-Reply-To: <20230801161409.25905-3-dpsmith@apertussolutions.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 5506CBA16CD1DC4AA5CB26A3932700C5.0
x-checkrecipientchecked: true
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR08MB7991:EE_|AS8PR08MB8683:EE_
x-ms-office365-filtering-correlation-id: c7b406d1-58fc-462a-bc83-08db931f9f5c
nodisclaimer: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 Xsyvd2dpE9PFM7AXt9Jbs0j6xC0tQMeBEb5Uv7Ss+utSx/EhxfIHCgEJNShXEzrXtEcn/5JPF9anGpIFmuw931LlSnAUMnPkN/tfHI62xOQCSAqI96jWSC4vcqBdAwvtHEfGe2/hFwLGfrk/NFVDD6j8t9D0LkrTwmoicWSASwXNq9i+xJ2AHdDOJlSK9e6pG/HatdCda5tAatmYI5abnJIC4z/iWyjWNye/E5f5M5o+M2k/f7UBZvTYV/Q5xIC/I2pYe0giHMw5ZNOSpTvy60/Y9yxBJBE1+4DxgkoOgsXQYDAsy/SYt89+druEl1TTbk6Who2kkPrcFoo/yL+K1usEO0VxEtaEoIEaOhH55qwS1AeNpOMLUqSSQOdXk1+3Y8gkgV7G1nvc8f0qndZyn+Y9z/3u6hDvZXUXQoyTkRDDXgW1xbirVjuYjo5Jeq5tcE7agvM/EHwMv2aqKwl+ktOttrNRBCUYupzzTBkvjhv+FNfKuR94xFkdfJg2oNQH/uDIASZvkDFM6vBX9ZPqb5QvJ1z58hWLopRBW/8gMzQucevbdNIWHlKIe+Is7QHn36/7ZpSBkPCdlambYiLKFMKyrUscoBjIDMzRJ4vihf2Ya5WOlqfCTff6G5bS20Zg
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(346002)(376002)(39860400002)(136003)(451199021)(66476007)(66446008)(64756008)(4326008)(316002)(41300700001)(66556008)(66946007)(76116006)(2906002)(86362001)(52536014)(38070700005)(8936002)(8676002)(55016003)(5660300002)(6506007)(33656002)(26005)(186003)(122000001)(71200400001)(83380400001)(9686003)(54906003)(110136005)(478600001)(38100700002)(7696005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?DZcZAyNa3isCz2bRybKF8v/qObguEZv6ErUvnXLIBMtsgPlhRkLURtLwRcC7?=
 =?us-ascii?Q?Us7/9EQFqA+zLQZb7vQ7fzX+qZuVXcB5UpmnEZTW+BmIYoyGw91alwDKPb87?=
 =?us-ascii?Q?8tup0BwdnK2XyH08bb3IPBkOvxSyeVsTAeR1KT7jLwNLgMv0p36z9qcRRJHL?=
 =?us-ascii?Q?G9NsJFSKqsEUnEzCTARTaHZPdUhqQKVQAhmIYD86y6NYx1jr6eBH+HhjdfHq?=
 =?us-ascii?Q?FeGMpwoQmyWNvwkhg1fhnkKkQg8P98vCEuuJI4ktNEpGnyAGTiOkK1QvSyM1?=
 =?us-ascii?Q?XQEu7iAkdLrsg7BwLSey7tRCm9QFDA/1J4iF3tir9Bo3qqlycBXFpXbumD7s?=
 =?us-ascii?Q?RnmPN2WX9u2R2Otq4qkTxI04jMrByYVj9FprSMpiVTeZ56mSTKdF8EiebCpu?=
 =?us-ascii?Q?lAeD4Mw7MN9yq2+yHFvAofOtOGZP0oqS2Tnv4Mtj/BmIyjebiI4IrF+ao8ed?=
 =?us-ascii?Q?Kg/89+1vVdxhyx8QkPlsf4oHle8CNKjuVaTnrdbATIBqWOghWFAOUyvaRwKl?=
 =?us-ascii?Q?lQXjCl5hqTc9bB5SKUz9M0W+VTnAc6Anxl5pMznjFD88B01TDJpyq2RPdzyB?=
 =?us-ascii?Q?ozSbYCv/FOG7ZqAkSRM7OCt+m0E7SIvF3oVeoXPBOjOl56K8k8ffu1JtaffC?=
 =?us-ascii?Q?Wc7dR1BnK+kaJwdwBPKQkpkltyTiIDZy5rSg6Tn2ACFGRyjA4xI2rHy8hHdI?=
 =?us-ascii?Q?miL3YW5ADRhCHTPoOrU1mIBNU/tHPw+McBXgWQkWJn4PMZ249AXhDldznQ6F?=
 =?us-ascii?Q?D/TsBdH8Kwf5tOgNBioRO+etjqtMU7BNl+jZLs4WnbT/V/5ddHFTMd+vFAJu?=
 =?us-ascii?Q?UxG/zQhZ9IhS85ANrLFm4PgWAxsRwSl6pWqbgRA/RAKJE9ddzPPvPuAQEsz4?=
 =?us-ascii?Q?LhEqKt7Ukb/x73KgL88pv7P8cnXNt86IDy5IiSJ/OuPDiixpjD2RpFZ54QAd?=
 =?us-ascii?Q?odiHxIBVZO2XfUnxKFI1mCt8Kvmjgxs9NFYzqVexbBZwgCAiemQNpVyKmSrB?=
 =?us-ascii?Q?LDSXuGF7kDWQeDTjLVMeR/DIe5jUSb2vOaFOgTvrF/V9MmxDn4seTvVrcrgI?=
 =?us-ascii?Q?FFBiXb67FRDPJEdsfsrm1eTsx7xcJfhQmxyxvzAwBc+CtMAQb1TmrOqCGY12?=
 =?us-ascii?Q?rRrAh3wJiDy1OjYbSe6/2R2/HPacR3ZqfHeOEhRP5QrjJOGPMhLH/z5QEuKo?=
 =?us-ascii?Q?9AnA+E4eSLlGeUb8/qTjFnlcoP26U15gN2ekm7/MOE6avy77mR5PjHp4yJ3O?=
 =?us-ascii?Q?f90DpW7StptPKf9GrM71KwoKPTwFyv+IrakBgIG4j3E9znTYMcOLjSB/cWBw?=
 =?us-ascii?Q?idmejFQ8FUVqNcxc+YGXGFNv02l8P8v0OHuH7Wcn1UyZgPMDo8eKcR75dbfl?=
 =?us-ascii?Q?t69cyWMxSNvrSh/YZ4P6zGHQ6s9NbMB3sS2WSANyHg5PlHjPqAIqXVOyWqRx?=
 =?us-ascii?Q?uZebadfhTdCKGQbnjh69BoWhiVpo52RK+LSzbu32PIzygNgJWmYsPhJj785Y?=
 =?us-ascii?Q?V4mNGGEqepGi46AiVKhmeCav5Fx38AqBRNraRIa0RqfzNCIoIEwq5IOBKy6V?=
 =?us-ascii?Q?j+1qkOvKnxyW3Km2Y0kr6DuYfGyxW40k5lbezBLH?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7991.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7b406d1-58fc-462a-bc83-08db931f9f5c
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Aug 2023 06:13:42.9426
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AugjDFum2+Fe5HKJKJ7AzuaGII+Ph/5HIZMDyKljNFUHDqP8RJL2QI8LEZ+pCCVaFF/2LZgSCuJ0nLT16w+aag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8683

Hi Daniel,

> -----Original Message-----
> Subject: [PATCH 2/2] fdt: make fdt handling reusable across arch
>=20
> This refactors reusable code from Arm's bootfdt.c and device-tree.h that =
is
> general fdt handling code.  The Kconfig parameter CORE_DEVICE_TREE is
> introduced for when the ability of parsing DTB files is needed by a capab=
ility
> such as hyperlaunch.
>=20
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> ---
>  MAINTAINERS                   |   2 +
>  xen/arch/arm/bootfdt.c        | 141 +------------------------------
>  xen/common/Kconfig            |   4 +
>  xen/common/Makefile           |   3 +-
>  xen/common/fdt.c              | 153 ++++++++++++++++++++++++++++++++++
>  xen/include/xen/device_tree.h |  50 +----------
>  xen/include/xen/fdt.h         |  79 ++++++++++++++++++
>  7 files changed, 242 insertions(+), 190 deletions(-)
>  create mode 100644 xen/common/fdt.c
>  create mode 100644 xen/include/xen/fdt.h
>=20
> +void __init device_tree_get_reg(
> +    const __be32 **cell, uint32_t address_cells, uint32_t size_cells,
> +    paddr_t *start, paddr_t *size)
> +{
> +    uint64_t dt_start, dt_size;
> +
> +    /*
> +     * dt_next_cell will return uint64_t whereas paddr_t may not be 64-b=
it.
> +     * Thus, there is an implicit cast from uint64_t to paddr_t.
> +     */
> +    dt_start =3D dt_next_cell(address_cells, cell);
> +    dt_size =3D dt_next_cell(size_cells, cell);
> +
> +    if ( dt_start !=3D (paddr_t)dt_start )
> +    {
> +        printk("Physical address greater than max width supported\n");
> +        WARN();
> +    }
> +
> +    if ( dt_size !=3D (paddr_t)dt_size )
> +    {
> +        printk("Physical size greater than max width supported\n");
> +        WARN();
> +    }
> +
> +    /*
> +     * Xen will truncate the address/size if it is greater than the maxi=
mum
> +     * supported width and it will give an appropriate warning.
> +     */
> +    *start =3D dt_start;
> +    *size =3D dt_size;
> +}
> +
> +u32 __init device_tree_get_u32(
> +    const void *fdt, int node, const char *prop_name, u32 dflt)
> +{
> +    const struct fdt_property *prop;
> +
> +    prop =3D fdt_get_property(fdt, node, prop_name, NULL);
> +    if ( !prop || prop->len < sizeof(u32) )
> +        return dflt;
> +
> +    return fdt32_to_cpu(*(uint32_t*)prop->data);
> +}

When I tested this patch by our internal CI (I applied this patch on top
of today's staging:
c2026b88b5 xen/arm/IRQ: uniform irq_set_affinity() with x86 version),
there are some build errors as below:

aarch64-linux-gnu-gcc -MMD -MP -MF ./.asm-offsets.s.d -DBUILD_ID -fno-stric=
t-aliasing -std=3Dgnu99 -Wall -Wstrict-prototypes -Wdeclaration-after-state=
ment -Wno-unused-but-set-variable -Wno-unused-local-typedefs -O2 -fomit-fra=
me-pointer -nostdinc -fno-builtin -fno-common -Werror -Wredundant-decls -Wn=
o-pointer-arith -Wvla -pipe -D__XEN__ -include /jenkins/workspace/ais-xenbi=
ts-xen/layers/xen/xen/include/xen/config.h -mcpu=3Dgeneric -mgeneral-regs-o=
nly -mno-outline-atomics -I./include -I./arch/arm/include -I/jenkins/worksp=
ace/ais-xenbits-xen/layers/xen/xen/include -I/jenkins/workspace/ais-xenbits=
-xen/layers/xen/xen/arch/arm/include -fno-pie -fno-stack-protector -fno-exc=
eptions -fno-asynchronous-unwind-tables -Wnested-externs -S -g0 -o asm-offs=
ets.s.new -MQ asm-offsets.s /jenkins/workspace/ais-xenbits-xen/layers/xen/x=
en/arch/arm/arm64/asm-offsets.c
In file included from /jenkins/workspace/ais-xenbits-xen/layers/xen/xen/arc=
h/arm/arm64/asm-offsets.c:13:
/jenkins/workspace/ais-xenbits-xen/layers/xen/xen/arch/arm/include/asm/setu=
p.h:162:6: error: redundant redeclaration of 'device_tree_get_reg' [-Werror=
=3Dredundant-decls]
  162 | void device_tree_get_reg(const __be32 **cell, uint32_t address_cell=
s,
      |      ^~~~~~~~~~~~~~~~~~~
In file included from /jenkins/workspace/ais-xenbits-xen/layers/xen/xen/inc=
lude/xen/device_tree.h:17,
                 from /jenkins/workspace/ais-xenbits-xen/layers/xen/xen/arc=
h/arm/include/asm/smp.h:6,
                 from /jenkins/workspace/ais-xenbits-xen/layers/xen/xen/inc=
lude/xen/smp.h:4,
                 from /jenkins/workspace/ais-xenbits-xen/layers/xen/xen/inc=
lude/xen/rwlock.h:6,
                 from /jenkins/workspace/ais-xenbits-xen/layers/xen/xen/inc=
lude/xen/sched.h:7,
                 from /jenkins/workspace/ais-xenbits-xen/layers/xen/xen/arc=
h/arm/arm64/asm-offsets.c:9:
/jenkins/workspace/ais-xenbits-xen/layers/xen/xen/include/xen/fdt.h:64:13: =
note: previous declaration of 'device_tree_get_reg' with type 'void(const _=
_be32 **, u32,  u32,  u64 *, u64 *)' {aka 'void(const unsigned int **, unsi=
gned int,  unsigned int,  long unsigned int *, long unsigned int *)'}
   64 | void __init device_tree_get_reg(
      |             ^~~~~~~~~~~~~~~~~~~
In file included from /jenkins/workspace/ais-xenbits-xen/layers/xen/xen/arc=
h/arm/arm64/asm-offsets.c:13:
/jenkins/workspace/ais-xenbits-xen/layers/xen/xen/arch/arm/include/asm/setu=
p.h:165:5: error: redundant redeclaration of 'device_tree_get_u32' [-Werror=
=3Dredundant-decls]
  165 | u32 device_tree_get_u32(const void *fdt, int node,
      |     ^~~~~~~~~~~~~~~~~~~
In file included from /jenkins/workspace/ais-xenbits-xen/layers/xen/xen/inc=
lude/xen/device_tree.h:17,
                 from /jenkins/workspace/ais-xenbits-xen/layers/xen/xen/arc=
h/arm/include/asm/smp.h:6,
                 from /jenkins/workspace/ais-xenbits-xen/layers/xen/xen/inc=
lude/xen/smp.h:4,
                 from /jenkins/workspace/ais-xenbits-xen/layers/xen/xen/inc=
lude/xen/rwlock.h:6,
                 from /jenkins/workspace/ais-xenbits-xen/layers/xen/xen/inc=
lude/xen/sched.h:7,
                 from /jenkins/workspace/ais-xenbits-xen/layers/xen/xen/arc=
h/arm/arm64/asm-offsets.c:9:
/jenkins/workspace/ais-xenbits-xen/layers/xen/xen/include/xen/fdt.h:68:12: =
note: previous declaration of 'device_tree_get_u32' with type 'u32(const vo=
id *, int,  const char *, u32)' {aka 'unsigned int(const void *, int,  cons=
t char *, unsigned int)'}
   68 | u32 __init device_tree_get_u32(
      |            ^~~~~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors
make[2]: *** [/jenkins/workspace/ais-xenbits-xen/layers/xen/xen/./build.mk:=
45: asm-offsets.s] Error 1
make[1]: *** [/jenkins/workspace/ais-xenbits-xen/layers/xen/xen/Makefile:59=
7: xen] Error 2
make[1]: Leaving directory '/jenkins/workspace/ais-xenbits-xen/build/xen-fv=
p-base'
make: *** [Makefile:183: __sub-make] Error 2
make: Leaving directory '/jenkins/workspace/ais-xenbits-xen/layers/xen/xen'

The staging itself passed the CI check. Did I miss some context to make
this patch works? Could you please provide some hints? Thanks in advance!

Kind regards,
Henry



