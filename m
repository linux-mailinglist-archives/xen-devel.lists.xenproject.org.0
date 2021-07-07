Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 169C43BE4B0
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jul 2021 10:49:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.152027.280910 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m13Er-0003L4-HP; Wed, 07 Jul 2021 08:49:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 152027.280910; Wed, 07 Jul 2021 08:49:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m13Er-0003Iy-BY; Wed, 07 Jul 2021 08:49:01 +0000
Received: by outflank-mailman (input) for mailman id 152027;
 Wed, 07 Jul 2021 08:49:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Y63D=L7=citrix.com=christian.lindig@srs-us1.protection.inumbo.net>)
 id 1m13Ep-0003Im-QP
 for xen-devel@lists.xenproject.org; Wed, 07 Jul 2021 08:48:59 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 617f8c8a-15cd-4b79-927a-dfc71ee37b0e;
 Wed, 07 Jul 2021 08:48:58 +0000 (UTC)
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
X-Inumbo-ID: 617f8c8a-15cd-4b79-927a-dfc71ee37b0e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1625647738;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=L82sEQxmveU9lkhTLZhH/G/fIyZa1Y2FySsoZsTWR9c=;
  b=B0rDbSMEVXaqYt37ndyzTCi7Z5dzBoPoUsZp3lD6YZ0VbswhB/MMgmL9
   LQ7N9nwv+c3bxCNOs8GJ08WCLLdz6IkyeLihWdTAQOQKgEKnIEq8YUgFr
   LDvj0mNs9460qv+x6htCwt2sf+gwAZy6JAEHdsgdHg9wa2IjkFB8xvNHj
   Q=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: tEB3pzazbTMA9XG0yKEZjoTQp1ptDgoTYBJoZFhdYDfJOFwgTQCUCQnSEIkqUV7D2z7qO7v14r
 jGSP+djY4FNoh7VkfMHMzmVjliRFrbHFDzoeONkCK6JqZZ5EGUh9NYh1f0syc+2giS8X10jVoC
 fDLVTmZq5awroTiihdPj4JVUQrjRANGyk+tUNuoqe7IH7kAHgwH3C8gIOTgabmPNUq8yl2oKQr
 VRx3MO+4r0lJtM9WMGCYUIy3Tmsg/PRDYxp8nFjVjRKIaU4uO5gACxmyscyqwPTNkHDnIw+Twf
 +TQ=
X-SBRS: 5.1
X-MesageID: 47424540
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:crRD3qHKcFSXJ3VdpLqFY5HXdLJyesId70hD6qkvc3Nom52j+/
 xGws536fatskdtZJkh8erwXZVoMkmsiaKdgLNhcotKOTOJhILGFvAa0WKP+UyCJ8S6zJ8m6U
 4CSdkxNDSTNykDsS+S2mDReLxAoOVvsprY/ts2p00dFT2CAJsQizuRfzzrdHGeMzM2YqbReq
 DshPZvln6FQzA6f867Dn4KU6zovNvQjq/rZhYAGloO9BSOpSnA0s+6LzGomjMlFx9fy7Yr9m
 bI1ybj4L+4jv29whjAk0fO8pVtnsf7wNcrPr3NtiFVEESutu+bXvUlZ1SwhkFwnAhp0idsrD
 D4mWZjAy200QKWQoj6m2q15+Cq6kdQ15ar8y7nvZKkm72jeNtyMbswuatJNhTe8EYup9d6ze
 ZC2H+YrYNeCVfakD36/MWgbWAhqqIlyUBS4NL7okYvGbf2UoUh5rD3PXklZ6soDWb/8sQqAe
 NuBMbT6LJfdk6bdWnQui1qzMa3Vno+Ex+aSgxa0/blnwR+jTR81Q8V1cYflnAP+NY0TIRF/f
 3NNuBtmKtVRsEbYKphDKMKQNexCGbKXRXQWVjibGgP1Jt3ck4ljqSHlIndyNvaCqDg/aFC7q
 gpCmkoxlLaU3iefPGz4A==
X-IronPort-AV: E=Sophos;i="5.83,331,1616472000"; 
   d="scan'208,217";a="47424540"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RjqNt6g0W8oKSRDJptCdcFua7FS7zGT8xm5V/X6h8TX8pzwDtZl+jYPZghTXc43K2Mv/cho7tXVWrYV/cvGEetfWIh3uiKmiDRmbk95Do4P5K/xLy3xKaNcESQBgJ/Ndbc/OjWsqsrLBaeKIQk/4u6e2Ej6qKww3Fv1tX96q6Zs02BbsgOBYxmN8NqqQgIGdwp/DhXOH67DvBZEEFqmAdmqkd9fq8tvNAEVazH2PiImekf1YASNTWyL7cGqYnLP3BzxzwloOKqH1prG76lraw4+rZPURjglDcB1Yp2TFJkhJXfA7y854C4QiGUiZcfwfgPvps6jPj2Z1/Z07UjhmoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dxyu8WD+lPu/fW4qAOY7KHzCx9GOPJkrLIVAG5vdQZw=;
 b=XVTwoywrR1Bo5/AJcYtESu5pgqWTUBHYjZ+MeJXbyGI6PrvXm9qwB8Pd7hGluN6tqJO+RQKLu8LHNNwkyTj4vFJlNaqXyp/xwzGui1NMJuJ2YSGbcWoCV+rXyouxnvv/oJa3Ru5xPb+GiRATZk6oUKYUKyhqP5mjyZClB7d2c1yQ+7LQAEDNvhHiCCTj/MJJrdF4UwojGs1GvBKv14naeFk0PmQ5ckmzRlRCpI3k8rjtYMtNJflX/WYjYuzER+n7MprYrPXQG8WiLPazTkRkjwtVEfDXCSp4K/3HuaR793w8rszehxS8VCOlh2i4VFxKL0s9korAeqjpnnjbm4qVJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dxyu8WD+lPu/fW4qAOY7KHzCx9GOPJkrLIVAG5vdQZw=;
 b=Zj6JI6b4yqSdJEqO6rwxykWAM2ES73eeq2cxogmu9jE+nj0pKSBAkr3mzglhd6tA6KrheF5iCW2FzrSJV9TRhtTCJg99BnembRsQ+wxGmozNyEr6tWTV1GZ6NlaqrsfoPSaCxPBGeSRhTyoAQ33E5kfP0Rfe85Y/i1gAI12UDzw=
From: Christian Lindig <christian.lindig@citrix.com>
To: Igor Druzhinin <igor.druzhinin@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Ian
 Jackson" <iwj@xenproject.org>, Wei Liu <wl@xen.org>, Andrew Cooper
	<Andrew.Cooper3@citrix.com>, George Dunlap <George.Dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, "julien@xen.org" <julien@xen.org>,
	"sstabellini@kernel.org" <sstabellini@kernel.org>, "jgross@suse.com"
	<jgross@suse.com>, "dave@recoil.org" <dave@recoil.org>
Subject: Re: [PATCH] tools/libxc: use uint32_t for pirq in
 xc_domain_irq_permission
Thread-Topic: [PATCH] tools/libxc: use uint32_t for pirq in
 xc_domain_irq_permission
Thread-Index: AQHXcsvXTynNtpWrykaXALTlaqCPOqs3NCuA
Date: Wed, 7 Jul 2021 08:48:40 +0000
Message-ID: <640E969C-62AA-44C8-9CA6-F393E7038E0E@citrix.com>
References: <1625619764-23537-1-git-send-email-igor.druzhinin@citrix.com>
In-Reply-To: <1625619764-23537-1-git-send-email-igor.druzhinin@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3608.120.23.2.4)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5a335d0f-f0a4-4b6b-ee9a-08d9412404ca
x-ms-traffictypediagnostic: MWHPR03MB2878:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR03MB2878345A3F9934716DCFED42F61A9@MWHPR03MB2878.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: d+S8ZizkzFNw4gYPpa1xP62gNFR8+ERZ/SGnPDAt9ndAkjukeQKBw9YbczpzYzjrUEkQf0iTOv9+SOwpap3TssXtwpOhABjI5O2p126OM6DfRU9678cYodfekI9tRCRTUiDDsnF11Wd3UX3bmVQ7DMTz5dqEgxs940EWlPwZ7zBLiCdmpWr48JiZgp9gDz8/4z3rT93y2/ZJ/cV0dC4vO+VDDx5VXQ4kDUG19qRFhkVgctgGyVz4cq66u1orFPIXS/MqvYlpvkQjJXoqi+0PymZ4Dnk8+UxMQ+xOv3f3Rz0Bl586bU2B640AxHoqqgSIOBVGsKtFIoESO/AyOBYk7bmUZcV3/f0ScU78gbpTYWQdiUobDRgRCKyJfeJAVUgR3YqfricIRBuIueJ2MHxI6PZkUb0KGqWWDdz4E2zN1bIi7szoYMmobAkLzrYAzoT3ptB5xOHbmu8m+/jcGbMLLntAisn8yiOXm5t0Eugrzv0xEs5YpsVu3qiGgvCazKwKw7WtwoQn/KPy4RWr6AJogOTArI+nIQZWb3/oO79W39E4FvBP9G0vWnuUUPFd/1yz0G4OaH1ty/pQmUWG4BdoleXqXWYmED6/oCCcdjGw0qjb7wtW3iP8EJ/QR/VCjEe3kHVHh/OFLVWnKnoUDvd0dvKjqkTKlssZIJaNbtOh1RQVlPIBkC2RwSCTZr9+3TGoHhXmW7r+dLAbKtvqDvkMrg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR03MB6380.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(396003)(136003)(376002)(39860400002)(38100700002)(83380400001)(186003)(86362001)(71200400001)(36756003)(122000001)(33656002)(5660300002)(6636002)(37006003)(316002)(6862004)(2906002)(8936002)(4326008)(4744005)(6512007)(44832011)(8676002)(26005)(6506007)(91956017)(53546011)(76116006)(478600001)(66446008)(64756008)(66556008)(66476007)(66946007)(6486002)(2616005)(54906003)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?0zRJTSID3ctwUG1qb5rg2MaMngeE12lq3n5xPfaqZPR2jCO9O2mLNxQQ6SSx?=
 =?us-ascii?Q?BcLGTBnGrfZfDdE93v6o5wuy7a5lUtT1b4Ou+FYXofl/2Iy0V/YO9Yqo17n6?=
 =?us-ascii?Q?YFET7ZbDrvtRaUloB4VW/kPKvK8MXnLcQRQlPdMbtTcuJc1jXPXkcPQUo4t/?=
 =?us-ascii?Q?yAY5Dto/pss8b2PxkX9/MDI4148uNsf0WVsKfqJgGVlBA11LwCTZGZJn9KDq?=
 =?us-ascii?Q?gEs3FLavMo4lOoKQBDp4eEmoT5mLlbvYRLa9J1rmBzoPt0AY5WeS5n1DJKmJ?=
 =?us-ascii?Q?EBjYJt2F6dtTKriITpZaid9zlQyni/FQtfWUNnhCActRo/i3xFIbWnYmdY+J?=
 =?us-ascii?Q?5gIjSEHB9/PZuL/yaHZ1Gevq2LVlHe8Wd0dWF51VnTcqRSIJnXgHNPylSKGz?=
 =?us-ascii?Q?UNyGyK428x0km9hh/Vkp+3l5Jln8t4YvMPHKUg0L0svTh58icYfpqqcr1tTX?=
 =?us-ascii?Q?iTZW4nke/ZCUi+BBkiZWmmvXeDLnxlhNZ7ReD8ysbu97KSSsozFGelhfYDSk?=
 =?us-ascii?Q?6VvULasat0GG+oAdFr0DobSv8phY8Ma0vl1MwuKr8iuGLOgGpoX1pLLhgT/C?=
 =?us-ascii?Q?YNsZb/VdA8gX3nfB7fMEaj5YsuaPEL57skMN03nvZmT0xdGW5GT12uCX+uMx?=
 =?us-ascii?Q?nDXU6NiYldoD1n8QXidZqCRAV6rkYfkib2l2uM5N4a3MtHiXkBStuSNQi6JR?=
 =?us-ascii?Q?4d5VkbPaFcsUok4wqV9r5acVOGY+Uwe9p6ndA+WBYF1j8QQI5NSLNmLGiyqh?=
 =?us-ascii?Q?syZExSYC3eceBPqunm5nZyco1c5K4+ovUBtPEFSIVgNeweS2JY+8jliOx3Kv?=
 =?us-ascii?Q?8ZxyzJS8ipA3G6tOyc4vhaiMcKwPLFzJo1MGyIjfgkXxnvTowBllvIkdHxa7?=
 =?us-ascii?Q?5KSzqp06zp/AHSffhtZo2sM+JS5Idm9A2iig00FVv1iXSNl3nVw4ynYtmuJ/?=
 =?us-ascii?Q?nlXBgltYicLN3BN9DZKl6xewQ41vqet4p0UxvEYXiBnX5XAbSfuJmAe+qbLN?=
 =?us-ascii?Q?o11ukdRl6hQhPh4j3FqDw0RrRdUR9hx0bfKVHqFIYhfHNfWrIhIjBq61Rxz1?=
 =?us-ascii?Q?rDOAPHhokmbRIARIisyStEDZrz/g70DZlGiGvPSwji/r8BCLkJyrSj+c07RA?=
 =?us-ascii?Q?q7P5OG4onTSwhzJIRGUn5WHuLUcWY14v0++/Nf4LYH9UJZkylTIKhnav6vLZ?=
 =?us-ascii?Q?9IfpjjeSH1AH5ekNpasdXJaotfz9WaOEGPTTM1nSh6cWG2z7bCmUqa7UIvA+?=
 =?us-ascii?Q?OYe8LzXT/wX9OPjMPVr9KvCWQ57COD67DCtKMuWKRmMZ5MR/ef+06FaDbDoM?=
 =?us-ascii?Q?twdRX1BbmsJX9e6aGzR3vavJ?=
Content-Type: multipart/alternative;
	boundary="_000_640E969C62AA44C89CA6F393E7038E0Ecitrixcom_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR03MB6380.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a335d0f-f0a4-4b6b-ee9a-08d9412404ca
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jul 2021 08:48:40.3945
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: D9nx21JS42UjMcUSE+YxD5rvNXkqfYlBSpVVgYKTFWDccb0iydEeimeb/RHfjgSkOjej0nXygff+51kJ3l9y99+++Kgxxedj43O/006F+cM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR03MB2878
X-OriginatorOrg: citrix.com

--_000_640E969C62AA44C89CA6F393E7038E0Ecitrixcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



On 7 Jul 2021, at 02:02, Igor Druzhinin <igor.druzhinin@citrix.com<mailto:i=
gor.druzhinin@citrix.com>> wrote:

Current unit8_t for pirq argument in this interface is too restrictive
causing failures on modern hardware with lots of GSIs. That extends down to
XEN_DOMCTL_irq_permission ABI structure where it needs to be fixed up
as well. Internal Xen structures appear to be fine. Existing users of
the interface in tree (libxl, ocaml and python bindings) are already using
int for pirq representation that should be wide enough.

Domctl interface version is needed to be bumped with this change but that
was already done by 918b8842a8 ("arm64: Change type of hsr, cpsr, spsr_el1
to uint64_t") in this release cycle.

Signed-off-by: Igor Druzhinin <igor.druzhinin@citrix.com<mailto:igor.druzhi=
nin@citrix.com>>
---
tools/include/xenctrl.h             | 2 +-
tools/libs/ctrl/xc_domain.c         | 2 +-
tools/ocaml/libs/xc/xenctrl_stubs.c | 2 +-
xen/include/public/domctl.h         | 2 +-
4 files changed, 4 insertions(+), 4 deletions(-)

Acked-by: Christian Lindig <christian.lindig@citrix.com<mailto:christian.li=
ndig@citrix.com>>


--_000_640E969C62AA44C89CA6F393E7038E0Ecitrixcom_
Content-Type: text/html; charset="us-ascii"
Content-ID: <6A686C45CEB90A43A17A8B19DCF015C7@namprd03.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
</head>
<body style=3D"word-wrap: break-word; -webkit-nbsp-mode: space; line-break:=
 after-white-space;" class=3D"">
<br class=3D"">
<div><br class=3D"">
<blockquote type=3D"cite" class=3D"">
<div class=3D"">On 7 Jul 2021, at 02:02, Igor Druzhinin &lt;<a href=3D"mail=
to:igor.druzhinin@citrix.com" class=3D"">igor.druzhinin@citrix.com</a>&gt; =
wrote:</div>
<br class=3D"Apple-interchange-newline">
<div class=3D"">
<div class=3D"">Current unit8_t for pirq argument in this interface is too =
restrictive<br class=3D"">
causing failures on modern hardware with lots of GSIs. That extends down to=
<br class=3D"">
XEN_DOMCTL_irq_permission ABI structure where it needs to be fixed up<br cl=
ass=3D"">
as well. Internal Xen structures appear to be fine. Existing users of<br cl=
ass=3D"">
the interface in tree (libxl, ocaml and python bindings) are already using<=
br class=3D"">
int for pirq representation that should be wide enough.<br class=3D"">
<br class=3D"">
Domctl interface version is needed to be bumped with this change but that<b=
r class=3D"">
was already done by 918b8842a8 (&quot;arm64: Change type of hsr, cpsr, spsr=
_el1<br class=3D"">
to uint64_t&quot;) in this release cycle.<br class=3D"">
<br class=3D"">
Signed-off-by: Igor Druzhinin &lt;<a href=3D"mailto:igor.druzhinin@citrix.c=
om" class=3D"">igor.druzhinin@citrix.com</a>&gt;<br class=3D"">
---<br class=3D"">
tools/include/xenctrl.h &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;| 2 +-<br class=3D"">
tools/libs/ctrl/xc_domain.c &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;| 2 +-<br class=3D"">
tools/ocaml/libs/xc/xenctrl_stubs.c | 2 +-<br class=3D"">
xen/include/public/domctl.h &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;| 2 +-<br class=3D"">
4 files changed, 4 insertions(+), 4 deletions(-)<br class=3D"">
</div>
</div>
</blockquote>
</div>
<div style=3D"margin: 0px; font-stretch: normal; font-size: 14px; line-heig=
ht: normal; font-family: Menlo;" class=3D"">
<span style=3D"font-variant-ligatures: no-common-ligatures" class=3D""><br =
class=3D"">
</span></div>
<div style=3D"margin: 0px; font-stretch: normal; font-size: 14px; line-heig=
ht: normal; font-family: Menlo;" class=3D"">
<span style=3D"font-variant-ligatures: no-common-ligatures" class=3D"">Acke=
d-by: Christian Lindig &lt;<a href=3D"mailto:christian.lindig@citrix.com" c=
lass=3D"">christian.lindig@citrix.com</a>&gt;</span></div>
<div class=3D""><span style=3D"font-variant-ligatures: no-common-ligatures"=
 class=3D""><br class=3D"">
</span></div>
</body>
</html>

--_000_640E969C62AA44C89CA6F393E7038E0Ecitrixcom_--

