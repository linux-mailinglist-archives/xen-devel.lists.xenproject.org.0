Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55692AFE2BA
	for <lists+xen-devel@lfdr.de>; Wed,  9 Jul 2025 10:34:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1037872.1410367 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZQFx-0000t6-M1; Wed, 09 Jul 2025 08:34:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1037872.1410367; Wed, 09 Jul 2025 08:34:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZQFx-0000r0-IC; Wed, 09 Jul 2025 08:34:21 +0000
Received: by outflank-mailman (input) for mailman id 1037872;
 Wed, 09 Jul 2025 08:34:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mjof=ZW=valinux.co.jp=den@srs-se1.protection.inumbo.net>)
 id 1uZQFw-0000qu-Dl
 for xen-devel@lists.xenproject.org; Wed, 09 Jul 2025 08:34:21 +0000
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c406::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7f1e79bc-5c9f-11f0-a317-13f23c93f187;
 Wed, 09 Jul 2025 10:34:16 +0200 (CEST)
Received: from OS3P286MB0979.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:10d::7)
 by TYYP286MB4095.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:14e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.21; Wed, 9 Jul
 2025 08:34:11 +0000
Received: from OS3P286MB0979.JPNP286.PROD.OUTLOOK.COM
 ([fe80::80f1:db56:4a11:3f7a]) by OS3P286MB0979.JPNP286.PROD.OUTLOOK.COM
 ([fe80::80f1:db56:4a11:3f7a%4]) with mapi id 15.20.8922.017; Wed, 9 Jul 2025
 08:34:10 +0000
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
X-Inumbo-ID: 7f1e79bc-5c9f-11f0-a317-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UyFZQ9zaQQmgleess/LZ/S/Q9wH12Ik74Q74kWLJL+9N5WyGdLj7qBvt4qBRtBEQPuj3vUyEo+O2cTfkT67j6ZLKFNoXY5rhizTwHMlAlkfoUKuUMBIuj43ipbFrOg7809bpq78eF9mIyl4yroMbRN3yltdihia+Gu4cqaf2s2xKD+BsGBYUhPJgirU7LGPQKyrFh9Lxh0xPXOpQD9iqiLUKvypyOeb61SbvVfPwkDJ2afjrlpqW9mHgH+vYIXATbK6ggyG77O6NT55IzuCt0swGZUpO8HUN5L9YwRKg+jea+VhsLXrLKZKBLW8cDAxxzFkl57mTxSi86VvBGj28/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VxTnT3BKD6SDOAHUydAL515NndY1mZccjJUY5qBU++0=;
 b=GA7+7jvt4WYF6XxG3Dw32xSlEBtE+RwnAoqhb1k1BzzH3gpFWycIXP5coeNHrX8RaV6eyM1/lpIiJ9/U78gyat1SA0IUMGjbODqGpqGPgiXpBcDu8ONo4oLji9NHfSyv2uvw6hcs/C6QLHNaP3c95ng26572+rzD48n7CXBLmElyAKitPvDymx+kPdKRsCmUI/40xwSM+44kxSfjjT6bFhg4UY4XKQ0dPLPh3j+7x6DhJbCacmO3AqEF/Hd7LZdRV4AgpJVfNCMTOS8uhxPM9A+yMkSaVHMXkd7fFzDVvqkEExMemLmweZYsLSg9NSnLj8OismYiHvwlTh9GqHzvAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VxTnT3BKD6SDOAHUydAL515NndY1mZccjJUY5qBU++0=;
 b=ZP5FxfxwDTnNv2hJX6fVQNwt82TceGYe55XvlQravw0/FmlumBDcKMIffH8ARwb9+zTj0IDvpxhyQNhCjs+6STywHK+DZbTnwjGpNGEh7cJdHs1qtdaedcDQxMnoxPTTEoSNK/tU+LAKaXkK1MQncVQIHZkKFDhbwHgnFfYLnaA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Date: Wed, 9 Jul 2025 17:34:09 +0900
From: Koichiro Den <den@valinux.co.jp>
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: xen-devel@lists.xenproject.org, 
	Anthony PERARD <anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Michal Orzel <michal.orzel@amd.com>, 
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 5/5] xen/arm: Support ARM standard PV time for domains
 created via toolstack
Message-ID: <u7vkuhymewcjegim3andok7pxpbp3ocyvyirgz2jbehld6msfh@m6ztic55uvcm>
References: <20250705142703.2769819-1-den@valinux.co.jp>
 <20250705142703.2769819-6-den@valinux.co.jp>
 <405399e5-b6a2-487d-9937-1ed5aaf0d957@amd.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <405399e5-b6a2-487d-9937-1ed5aaf0d957@amd.com>
X-ClientProxiedBy: TYCP301CA0047.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:384::11) To OS3P286MB0979.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:10d::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3P286MB0979:EE_|TYYP286MB4095:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c90b4ac-9039-4b47-482d-08ddbec360b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?URRQ8+sN8Rq6FUiB1QVcT9Hv3jGVoBFUHhft8BJcMPjlMIRbyDCt/BFcmqJ9?=
 =?us-ascii?Q?ObYSBkH2Ttt+54eM15pDaI/187zzCCJ1PnWfu+TRXelGTmJOwUKQJDVl4o1H?=
 =?us-ascii?Q?iQBpI7vwTyl+QCAwxAE6ULc9a/YSWai+yNAov99ABD73anTdzRIX6IitNKRB?=
 =?us-ascii?Q?QRuFfZUolx/empHrVGaVCKFPgN914ljY5oTaR5dsnyNlh5BCKSl2u7ijrlP+?=
 =?us-ascii?Q?ESK3ZOrguBtiuxKlxKR8ZIC1X4tq9BXDwsaBAUZ49moW/FewFlRWsB4k3K1D?=
 =?us-ascii?Q?6TclFDevnyEqjXetf/EhLfDmJFPSUv/k6HLZ381E4llNXcxSBAHQKGG0XSEh?=
 =?us-ascii?Q?WXWdzRiYS9sINTZOen15pNjKXJKbzvg8mjKlb9VPdhQnNnxy+dHsoEoAigPJ?=
 =?us-ascii?Q?lrzykyS1YCyYatU5uTblkKU3m4AWu8bWYxvVzmqR5f6FlLKXr/1Ux+HvgitL?=
 =?us-ascii?Q?jM7wOcl3EtleupD7pm2LvM3hr5KgprbIUdmyEv52hQjP8+aR1I3SUJLhaPui?=
 =?us-ascii?Q?u/lemNQCRRyrL9huKOFDZbFUgP51UoODD2Xsr/YxnnQ80s1YcIEo5n+OhQpy?=
 =?us-ascii?Q?JkDZhehcI1Ufylbsrf1CSB0bh12D84nMQWpzO8asz0cXXVkTnADRGE+IUlF2?=
 =?us-ascii?Q?UBO+lIHv/ptvKoZmTDjkbQuAdsFP6jDyJdxSXA3CGlmWTPIzDTY/ulZDkgzq?=
 =?us-ascii?Q?oNhUgd13ImhMZMh8O+zIVHMTu3t7Jq807RP+a40K6sAcQ4WBAdBiTtv6iT+B?=
 =?us-ascii?Q?f+4IUuRilQzn7HAh04N3vkq3MI0XiLHcxSScNPjSqpcTvuPwE32b6hDRisOU?=
 =?us-ascii?Q?FB6DExdMaEq1Hjq8+xznd0FmPWRoRTtwzz5IsKOSAWN3CCiRKoTnpHWK6sEx?=
 =?us-ascii?Q?b0iGuEQSp5l3f9Jt0huyRzLCm6ZqClB062PH/uXSjLVYjTNF0olMIJnjyWU2?=
 =?us-ascii?Q?trA0WzVHSnfFIo902b6v7lDUIs7KkN8a2n3gRJZYzafrre5/DO2NCApKVUjK?=
 =?us-ascii?Q?/IWSFGLZywJystX/RCUSJBvF/gBnaVcwDaR9159AGjengc8gWa432VxEu+79?=
 =?us-ascii?Q?ra7Q8V+nA1eo+VYQfG7XIz/OBz/sqi+SQ9t9PgUC/edyBKGJxGs8oLtqiVRR?=
 =?us-ascii?Q?Fc0pW59NptEyBUBmna4fyRWY7F/rEx2jiOStAytyh7Et+IcbS2jz1jAEt0Pz?=
 =?us-ascii?Q?lMpVvmTUP0DoCc7FKEm+TdVCND9VhEMVo1MN+wRq++pKezDc2nUYWfVFgRxq?=
 =?us-ascii?Q?qNtxyMtjKYDCTnfHXYW36Ih6P1G/WJ7zamXJj0QP7LDTgDgQBTDXPNLpKiN5?=
 =?us-ascii?Q?cBEGA4ljedxjb8mhgC46AHhpUSK+hVzfkeKtwECWYRvQr7+v1bCW7E2b1lZc?=
 =?us-ascii?Q?GWtOJBvVXBzHu2xoZ25iUfecLCYFpM/2diePeys/SelHdVoBrDtAWtZwWW55?=
 =?us-ascii?Q?qFw/6S+rsTc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3P286MB0979.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(10070799003)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hSX4boflEu3ZOPbQ7ZAfW8iR6kMCOnW6itFLGWGGk8WOpdNgIdjL1cMjRQ0X?=
 =?us-ascii?Q?vUQmFVDyP5cZ8BAtKTAib1E+jzRy138uUuPwKJqgr0lZZp4Ic+7BfU3ArrYj?=
 =?us-ascii?Q?ZAMDrKQPrH2fmLNPVCFSLpk+LbxqONj5PiPuaFoL7WkSwXIUw7NQP1rQqP7y?=
 =?us-ascii?Q?Cr1kZWFlFdxt9aIpjTjPqF4HMCoufvMUPnpOR6nOE0oJ4xMfuyvjAdtin6R2?=
 =?us-ascii?Q?Aua3H9WXfDYrLbOLMRI70wxdEUv7Mr/uW5ZxYMkRIfhhA0ZOPd6YBg6I5O3M?=
 =?us-ascii?Q?PI3r8FgxI4Z6nPk/FK8HOV8ap/DUScuep85XwcHt62uhyCU3O8lQfHD8oIsh?=
 =?us-ascii?Q?anTa1j7yzf2KFODiktOcjBe2D7VVxbi30qW2PY7LLCFBwBCbWUnEnYPms4pE?=
 =?us-ascii?Q?xJflZ/Y1RGnG97rujfTAoEAC7R9iZJj7Rq064LnVyNsInmn4lthBYi+PvJj3?=
 =?us-ascii?Q?xHZbV+3ORjQGe2Es2uWgI0c+6E8pm7c5wtIxi8gp88Jt7GdbImdFWspIyFDB?=
 =?us-ascii?Q?oftNoKsRUFm/Cw1krFzJTll40v2AwDlNn2ku2PyuWs57qi22cwbvIRQ3PtJT?=
 =?us-ascii?Q?Me8lsWzmvoWsVJKGZLdyEYsg2LSuD+8Dy0eF0g0WrHeWvju+ol2iVJir3gPZ?=
 =?us-ascii?Q?T6fdukXAPtY7IqM4IRimYdRU9Afc70Szoze6LNpjmH3xN54xQqt6xA3Zvdkf?=
 =?us-ascii?Q?NKOTRmBfnMk5FCi1VtgdOxz7LNoGjGmLu/3ES14mZ1kly5sB7JY6/+EOryvT?=
 =?us-ascii?Q?HRFt/tN5C+F1ebsqkX/a2mSfvNx7cUtKTcXpDS/1Fhj/xX1zWP4OcoMK9pLL?=
 =?us-ascii?Q?r+5EGExLFXfvVQYQMyN+jO/AkXtbCkoZBkDbHQG8OPUf4mqWG3T9MpywaXvw?=
 =?us-ascii?Q?aQnYY922uJ8M9G2npsF31rG4orKSv1U5qbZIDJDyzBg9KTggxecJ9r3l8Up3?=
 =?us-ascii?Q?8n02wrRazmFaCjQaVrT/3gT8NJplnkU/rqQchr3VOn1TCLTu5yh86dRdqsq2?=
 =?us-ascii?Q?kGAelvhAsYwMXRjEybZcEJwdA2TMrKrIuH530jdhiymTsY1fHi4V4XGm0FFC?=
 =?us-ascii?Q?ys5dHErRmPWlAMDKtIKvM1iC638rq9lV8bT76H1iEpxCFDuDkl7BCfexUeNW?=
 =?us-ascii?Q?bsKZbwNwVXPLDxsRWbn4pMJtJ+FoAJVeZKzXEzgvQejKTXaOR3cUdVftHPn8?=
 =?us-ascii?Q?9eoP8FRq4NFaBP0ZVONVMvfvt7Dk/LhDjD9weC682UNGumyvgYjIUyaOkFhE?=
 =?us-ascii?Q?Yfb6tNdWBA8JWtlIbSw0nk2BgSsRYV6w2E2tc1t/shpWuTQ7yN6b7ui8xL5Q?=
 =?us-ascii?Q?OgwNNHKfERQUEYYJrUmFSoc7ENEE66oCwbnvM/lrcjYhPpKu2Hwo9VP3iwqP?=
 =?us-ascii?Q?xCiRHEaqQMg4vG+lC6KrzPFDmw8du/JLMutunVksNT8QngUrgxTz7AiLgqn4?=
 =?us-ascii?Q?XVs+2xV5UmeR4vkwi5B6SZgQ1+Xk04ckpYFrezBXTLuOPjBvby1XHLhspfoV?=
 =?us-ascii?Q?GWJn3QCGXejyGCz0sQhQNHuyEAeFPiQzEqZED6yLpBzYNGukpbwnWMWEWAej?=
 =?us-ascii?Q?LCYSnS/jUpeYqLDF4bhtGkkdHhtsyvBSkflYVENBd8R5tWNvY83GvZVb244n?=
 =?us-ascii?Q?Fsnvj5vsXjPM+FNjQcVyxvs=3D?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c90b4ac-9039-4b47-482d-08ddbec360b5
X-MS-Exchange-CrossTenant-AuthSource: OS3P286MB0979.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2025 08:34:10.8066
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fV4MCp4Z9Y0KsAY8yoArajVMKIBxlTuUnXn8aU/GP9lZ3nJBj84BTilfjZFp8YDVvc0bZBGT0bCgmqSsQ45aag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYP286MB4095

On Tue, Jul 08, 2025 at 05:10:46PM -0400, Stewart Hildebrand wrote:
> On 7/5/25 10:27, Koichiro Den wrote:
> > Implement ARM DEN 0057A PV time support for domains created via the
> > toolstack, utilizing the newly introduced XENMAPSPACE_pv_time.
> > 
> > Signed-off-by: Koichiro Den <den@valinux.co.jp>
> > ---
> >  tools/libs/light/libxl_arm.c | 185 ++++++++++++++++++++++++++++-------
> >  xen/arch/arm/mm.c            |  14 +++
> >  xen/include/public/memory.h  |   1 +
> >  3 files changed, 167 insertions(+), 33 deletions(-)
> > 
> > diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
> > index 4a19a8d22bdf..33251520c07a 100644
> > --- a/tools/libs/light/libxl_arm.c
> > +++ b/tools/libs/light/libxl_arm.c
> > @@ -684,6 +684,40 @@ static int make_memory_nodes(libxl__gc *gc, void *fdt,
> >      return 0;
> >  }
> >  
> > +static int make_resv_memory_node(libxl__gc *gc, void *fdt,
> > +                                 const struct xc_dom_image *dom)
> > +{
> > +    int res;
> > +
> > +    if (strcmp(dom->guest_type, "xen-3.0-aarch64"))
> > +        /*
> > +         * The stolen time shared memory region for ARM DEN 0057A is currently
> > +         * the only user of /reserved-memory node when a domain is created via
> > +         * the toolstack, and it requires both the hypervisor and the domain to
> > +         * be AArch64.
> > +         */
> > +        return 0;
> > +
> > +    res = fdt_begin_node(fdt, "reserved-memory");
> > +    if (res) return res;
> > +
> > +    res = fdt_property_cell(fdt, "#address-cells", GUEST_ROOT_ADDRESS_CELLS);
> > +    if (res) return res;
> > +
> > +    res = fdt_property_cell(fdt, "#size-cells", GUEST_ROOT_SIZE_CELLS);
> > +    if (res) return res;
> > +
> > +    /* reg 0 is a placeholder for PV time region */
> > +    res = fdt_property_reg_placeholder(gc, fdt, GUEST_ROOT_ADDRESS_CELLS,
> > +                                       GUEST_ROOT_SIZE_CELLS, 1);
> > +    if (res) return res;
> > +
> > +    res = fdt_end_node(fdt);
> > +    if (res) return res;
> > +
> > +    return 0;
> > +}
> > +
> >  static int make_gicv2_node(libxl__gc *gc, void *fdt,
> >                             uint64_t gicd_base, uint64_t gicd_size,
> >                             uint64_t gicc_base, uint64_t gicc_size)
> > @@ -1352,6 +1386,7 @@ next_resize:
> >          FDT( make_psci_node(gc, fdt) );
> >  
> >          FDT( make_memory_nodes(gc, fdt, dom) );
> > +        FDT( make_resv_memory_node(gc, fdt, dom) );
> >  
> >          switch (info->arch_arm.gic_version) {
> >          case LIBXL_GIC_VERSION_V2:
> > @@ -1519,6 +1554,9 @@ static void finalise_one_node(libxl__gc *gc, void *fdt, const char *uname,
> >  
> >  #define EXT_REGION_MIN_SIZE   xen_mk_ullong(0x0004000000) /* 64MB */
> >  
> > +/* As per ARM DEN 0057A, stolen time memory regions are 64-byte aligned */
> > +#define PV_REGIONS_PER_PAGE  (XC_PAGE_SIZE / 64)
> > +
> >  static int compare_iomem(const void *a, const void *b)
> >  {
> >      const libxl_iomem_range *x = a, *y = b;
> > @@ -1530,24 +1568,92 @@ static int compare_iomem(const void *a, const void *b)
> >      return 0;
> >  }
> >  
> > -static int finalize_hypervisor_node(libxl__gc *gc,
> > -                                    libxl_domain_build_info *b_info,
> > -                                    struct xc_dom_image *dom)
> > +static int get_pv_region(libxl_domain_build_info *b_info,
> > +                         struct xc_dom_image *dom,
> > +                         uint64_t *start, uint64_t end,
> > +                         uint64_t *region_base, uint64_t *region_size)
> > +{
> > +    unsigned int npages = DIV_ROUNDUP(b_info->max_vcpus, PV_REGIONS_PER_PAGE);
> > +    unsigned int len = npages * XC_PAGE_SIZE;
> > +    uint32_t domid = dom->guest_domid;
> > +    xc_interface *xch = dom->xch;
> > +    unsigned long idx = 0;
> > +    uint64_t size;
> > +    int rc;
> > +
> > +    if (*start >= end)
> > +        return -1;
> > +    size = end - *start;
> > +    if (size < len)
> > +        return -1;
> > +
> > +    for (; npages; npages--, idx++) {
> > +        rc = xc_domain_add_to_physmap(xch, domid, XENMAPSPACE_pv_time, idx,
> > +                                      (*start >> XC_PAGE_SHIFT) + idx);
> > +        if (rc)
> > +            return rc;
> > +    }
> > +
> > +    region_base[0] = *start;
> > +    region_size[0] = len;
> > +    *start += len;
> > +    return 0;
> > +}
> > +
> > +static void get_ext_region(uint64_t start, uint64_t end, uint64_t *region_base,
> > +                           uint64_t *region_size, unsigned int *nr_regions)
> > +{
> > +    uint64_t size;
> > +
> > +    start = ALIGN_UP_TO_2MB(start);
> > +    if (start >= end)
> > +        return;
> > +
> > +    size = end - start;
> > +    if (size < EXT_REGION_MIN_SIZE)
> > +        return;
> > +
> > +    region_base[*nr_regions] = start;
> > +    region_size[*nr_regions] = size;
> > +    (*nr_regions)++;
> > +}
> > +
> > +static int finalize_extra_regions(libxl__gc *gc,
> > +                                  libxl_domain_build_info *b_info,
> > +                                  struct xc_dom_image *dom)
> >  {
> >      void *fdt = dom->devicetree_blob;
> > -    uint64_t region_base[MAX_NR_EXT_REGIONS], region_size[MAX_NR_EXT_REGIONS];
> > -    uint32_t regs[(GUEST_ROOT_ADDRESS_CELLS + GUEST_ROOT_SIZE_CELLS) *
> > +
> > +    /* For extended regions */
> > +    uint64_t ext_region_base[MAX_NR_EXT_REGIONS], ext_region_size[MAX_NR_EXT_REGIONS];
> > +    uint32_t ext_regs[(GUEST_ROOT_ADDRESS_CELLS + GUEST_ROOT_SIZE_CELLS) *
> >                    (MAX_NR_EXT_REGIONS + 1)];
> > -    be32 *cells = &regs[0];
> > +    be32 *ext_cells = &ext_regs[0];
> > +    int hyp_offset;
> > +
> > +    /* For pv regions */
> > +    uint64_t pv_region_base[1], pv_region_size[1];
> > +    uint32_t pv_regs[GUEST_ROOT_ADDRESS_CELLS + GUEST_ROOT_SIZE_CELLS];
> > +    be32 *pv_cells = &pv_regs[0];
> > +    int resv_offset;
> > +
> >      const uint64_t bankbase[] = GUEST_RAM_BANK_BASES;
> >      const uint64_t banksize[] = GUEST_RAM_BANK_SIZES;
> >      unsigned int i, j, len, nr_regions = 0;
> > +    bool pv_region_pending = true;
> >      libxl_dominfo info;
> > -    int offset, rc;
> > +    int rc;
> >  
> > -    offset = fdt_path_offset(fdt, "/hypervisor");
> > -    if (offset < 0)
> > -        return offset;
> > +    resv_offset = fdt_path_offset(fdt, "/reserved-memory");
> > +    if (!strcmp(dom->guest_type, "xen-3.0-aarch64")) {
> > +        if (resv_offset < 0)
> > +            return resv_offset;
> > +    } else
> > +        pv_region_pending = false;
> > +
> > +    hyp_offset = fdt_path_offset(fdt, "/hypervisor");
> > +    if (hyp_offset < 0)
> > +        return hyp_offset;
> >  
> >      rc = libxl_domain_info(CTX, &info, dom->guest_domid);
> >      if (rc)
> > @@ -1572,8 +1678,7 @@ static int finalize_hypervisor_node(libxl__gc *gc,
> >          } unallocated;
> >          uint64_t unallocated_size = 0;
> >  
> > -        unallocated.start = bankbase[i] +
> > -            ALIGN_UP_TO_2MB((uint64_t)dom->rambank_size[i] << XC_PAGE_SHIFT);
> > +        unallocated.start = bankbase[i] + ((uint64_t)dom->rambank_size[i] << XC_PAGE_SHIFT);
> >  
> >          unallocated.end = ~0ULL >> (64 - info.gpaddr_bits);
> >          unallocated.end = min(unallocated.end, bankbase[i] + banksize[i] - 1);
> > @@ -1581,7 +1686,7 @@ static int finalize_hypervisor_node(libxl__gc *gc,
> >          if (unallocated.end >= unallocated.start)
> >              unallocated_size = unallocated.end - unallocated.start + 1;
> >  
> > -        if (unallocated_size < EXT_REGION_MIN_SIZE)
> > +        if (unallocated_size <= 0)
> >              continue;
> >  
> >          /* Exclude iomem */
> > @@ -1605,14 +1710,14 @@ static int finalize_hypervisor_node(libxl__gc *gc,
> >                      if (unallocated.start > unallocated.end)
> >                          break;
> >                  } else {
> > -                    uint64_t size = iomem.start - unallocated.start;
> > -
> > -                    if (size >= EXT_REGION_MIN_SIZE) {
> > -                        region_base[nr_regions] = unallocated.start;
> > -                        region_size[nr_regions] = size;
> > -                        nr_regions++;
> > +                    if (pv_region_pending) {
> > +                        rc = get_pv_region(b_info, dom, &unallocated.start, iomem.start,
> > +                                           pv_region_base, pv_region_size);
> > +                        if (!rc)
> > +                            pv_region_pending = false;
> >                      }
> > -
> > +                    get_ext_region(unallocated.start, iomem.start, ext_region_base,
> > +                                   ext_region_size, &nr_regions);
> >                      unallocated.start = iomem.end + 1;
> >  
> >                      if (unallocated.start > unallocated.end)
> > @@ -1624,38 +1729,52 @@ static int finalize_hypervisor_node(libxl__gc *gc,
> >          if (unallocated.end >= unallocated.start
> >              && nr_regions < MAX_NR_EXT_REGIONS)
> >          {
> > -            uint64_t size = unallocated.end - unallocated.start + 1;
> > -
> > -            if (size >= EXT_REGION_MIN_SIZE) {
> > -                region_base[nr_regions] = unallocated.start;
> > -                region_size[nr_regions] = size;
> > -                nr_regions++;
> > +            if (pv_region_pending) {
> > +                rc = get_pv_region(b_info, dom, &unallocated.start, unallocated.end,
> > +                                   pv_region_base, pv_region_size);
> > +                if (!rc)
> > +                    pv_region_pending = false;
> >              }
> > +            get_ext_region(unallocated.start, unallocated.end, ext_region_base,
> > +                           ext_region_size, &nr_regions);
> >          }
> >      }
> >  
> > +    if (!strcmp(dom->guest_type, "xen-3.0-aarch64")) {
> > +        if (pv_region_pending) {
> > +            LOG(ERROR, "The PV time region cannot be allocated, not enough space");
> > +            return ERROR_FAIL;
> > +        }
> > +        set_range(&pv_cells, GUEST_ROOT_ADDRESS_CELLS, GUEST_ROOT_SIZE_CELLS,
> > +                  pv_region_base[0], pv_region_size[0]);
> > +        len = sizeof(pv_regs[0]) * (GUEST_ROOT_ADDRESS_CELLS + GUEST_ROOT_SIZE_CELLS);
> > +        rc = fdt_setprop(fdt, resv_offset, "reg", pv_regs, len);
> 
> I can appreciate the effort that it took to get this working. However,
> given the relatively small size of PV time region, is there a reason
> that you chose to allocate it from unallocated guest RAM rather than
> reserving a new region/space in xen/include/public/arch-arm.h? Doing so
> may also simplify the dom0less case.

I thought that hard-coded fixed assignment should be avoided wherever
possible, but there is no strong reason other than that.

Thanks.
-Koichiro

> 
> E.g.:
> 
> diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
> index e2412a17474e..681e3d4778ba 100644
> --- a/xen/include/public/arch-arm.h
> +++ b/xen/include/public/arch-arm.h
> @@ -466,6 +466,13 @@ typedef uint64_t xen_callback_t;
>  #define GUEST_VPCI_MEM_ADDR                 xen_mk_ullong(0x23000000)
>  #define GUEST_VPCI_MEM_SIZE                 xen_mk_ullong(0x10000000)
>  
> +/* Current supported guest VCPUs */
> +#define GUEST_MAX_VCPUS 128
> +
> +/* PV time region */
> +#define GUEST_PVTIME_BASE xen_mk_ullong(0x37000000)
> +#define GUEST_PVTIME_SIZE xen_mk_ullong(GUEST_MAX_VCPUS * 64)
> +
>  /*
>   * 16MB == 4096 pages reserved for guest to use as a region to map its
>   * grant table in.
> @@ -501,9 +508,6 @@ typedef uint64_t xen_callback_t;
>  #define GUEST_RAM_BANK_BASES   { GUEST_RAM0_BASE, GUEST_RAM1_BASE }
>  #define GUEST_RAM_BANK_SIZES   { GUEST_RAM0_SIZE, GUEST_RAM1_SIZE }
>  
> -/* Current supported guest VCPUs */
> -#define GUEST_MAX_VCPUS 128
> -
>  /* Interrupts */
>  
>  #define GUEST_TIMER_VIRT_PPI    27
> 

