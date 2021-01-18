Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 112912F9B43
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jan 2021 09:29:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.69436.124247 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1Pub-000780-G0; Mon, 18 Jan 2021 08:29:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 69436.124247; Mon, 18 Jan 2021 08:29:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1Pub-00077b-Ci; Mon, 18 Jan 2021 08:29:21 +0000
Received: by outflank-mailman (input) for mailman id 69436;
 Mon, 18 Jan 2021 08:29:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c1WU=GV=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1l1PuZ-00077W-Hh
 for xen-devel@lists.xenproject.org; Mon, 18 Jan 2021 08:29:19 +0000
Received: from mail-wm1-x329.google.com (unknown [2a00:1450:4864:20::329])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8477f333-667e-4631-8e9c-4e5588a83c60;
 Mon, 18 Jan 2021 08:29:18 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id v184so8767156wma.1
 for <xen-devel@lists.xenproject.org>; Mon, 18 Jan 2021 00:29:18 -0800 (PST)
Received: from CBGR90WXYV0 (host86-183-162-242.range86-183.btcentralplus.com.
 [86.183.162.242])
 by smtp.gmail.com with ESMTPSA id z130sm25556769wmb.33.2021.01.18.00.29.16
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 18 Jan 2021 00:29:16 -0800 (PST)
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
X-Inumbo-ID: 8477f333-667e-4631-8e9c-4e5588a83c60
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:thread-index
         :content-language;
        bh=lNvLNq5sZ9XnVgw4q+H3pHlbWBrg7v/5wz1MoQfHlrU=;
        b=hSjKdD1mxI03attYtwnRsdVYGE+nvSmSRgZhlJE9cP/aLRaAahAWgGSsa0yHB2UqpR
         4t6kOg8moO2QcOCh+OB/pTAGc2Wc0GMNT+8lDvoHRnmUT4pgAXdcrfBGcnxYHmnk4tHc
         J+29FyDnH9uRyVH41mz1EL2VAKgSusoNgvjXz0kMmGgxCQ+U3jVuCJ46w2guXU4IzMHg
         E15nNjoNYtfZN2vGEHkncQbIOEpf9xq1J/a2bUMM1KPI7iAff2lvFykEkFdSLrQTXrLU
         mvzcnNKTyDM49V4iUqkyPKsikaSXnMHp8HPY1lqGLzUWlDc1fzHiT8ORULwNPl/xmZ4M
         7MlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
         :subject:date:message-id:mime-version:content-transfer-encoding
         :thread-index:content-language;
        bh=lNvLNq5sZ9XnVgw4q+H3pHlbWBrg7v/5wz1MoQfHlrU=;
        b=hIf0OsDpa88eY1OoxyyE8ujdJYd3sQ/VXciwq9HmPs1sFRsN0ALxuhAoWUwgZzMt7q
         ignBVSSZAZ8pYqcfwBeA9oKJ+HZISFaEYMM0LKCsB4nDKtC6KIBEGayrpwfVpS6PUBH2
         vOgmMEN5CjFSjz7XTHC2jTy2gTFV/+oBDdpwBqPXXR1AoGdP3JB3dDQMBIdHZChlj+af
         3SM2RYw9DOzfkJhj0vZBd7JmnZAq/xlBOGuUX3jCaGp6HI34jVNfJ97yGTKXsGqQnNoL
         xf01WzOODFx72lUxcVQrafDSZ2J2IMasF1Ra1fapNz1O1if6cyMwurz0sN7iinlEuW+X
         mlLw==
X-Gm-Message-State: AOAM531nG8mlxQ1F40lQqCVIDptBL2PFt4lzfN+Bc/BU0ZWZuLDD9iPB
	SIhvqlpI7iQpM4QOnvVRFag=
X-Google-Smtp-Source: ABdhPJwfF5aqiSslzY8sanfFhn1UoGcpFOcSFvisbodGfLp2jFnsFEN1sNdYwPvcb29ZyoNypSU2pQ==
X-Received: by 2002:a05:600c:21cb:: with SMTP id x11mr3960584wmj.29.1610958557445;
        Mon, 18 Jan 2021 00:29:17 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
Reply-To: <paul@xen.org>
To: "'Oleksandr Tyshchenko'" <olekstysh@gmail.com>,
	<xen-devel@lists.xenproject.org>
Cc: "'Oleksandr Tyshchenko'" <oleksandr_tyshchenko@epam.com>,
	"'Jan Beulich'" <jbeulich@suse.com>,
	"'Andrew Cooper'" <andrew.cooper3@citrix.com>,
	=?utf-8?Q?'Roger_Pau_Monn=C3=A9'?= <roger.pau@citrix.com>,
	"'Wei Liu'" <wl@xen.org>,
	"'Julien Grall'" <julien@xen.org>,
	"'Stefano Stabellini'" <sstabellini@kernel.org>,
	"'Julien Grall'" <julien.grall@arm.com>
References: <1610488352-18494-1-git-send-email-olekstysh@gmail.com> <1610488352-18494-4-git-send-email-olekstysh@gmail.com>
In-Reply-To: <1610488352-18494-4-git-send-email-olekstysh@gmail.com>
Subject: RE: [PATCH V4 03/24] x86/ioreq: Provide out-of-line wrapper for the handle_mmio()
Date: Mon, 18 Jan 2021 08:29:15 -0000
Message-ID: <00bb01d6ed74$0285ca00$07915e00$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQJtR7ihpnpDvKGK8VeC26+r2ffFKQHMjd7tqPHzuiA=
Content-Language: en-gb

> -----Original Message-----
> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of =
Oleksandr Tyshchenko
> Sent: 12 January 2021 21:52
> To: xen-devel@lists.xenproject.org
> Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>; Paul Durrant =
<paul@xen.org>; Jan Beulich
> <jbeulich@suse.com>; Andrew Cooper <andrew.cooper3@citrix.com>; Roger =
Pau Monn=C3=A9
> <roger.pau@citrix.com>; Wei Liu <wl@xen.org>; Julien Grall =
<julien@xen.org>; Stefano Stabellini
> <sstabellini@kernel.org>; Julien Grall <julien.grall@arm.com>
> Subject: [PATCH V4 03/24] x86/ioreq: Provide out-of-line wrapper for =
the handle_mmio()
>=20
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>=20
> The IOREQ is about to be common feature and Arm will have its own
> implementation.
>=20
> But the name of the function is pretty generic and can be confusing
> on Arm (we already have a try_handle_mmio()).
>=20
> In order not to rename the function (which is used for a varying
> set of purposes on x86) globally and get non-confusing variant on Arm
> provide a wrapper arch_ioreq_complete_mmio() to be used on common
> and Arm code.
>=20
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Reviewed-by: Paul Durrant <paul@xen.org>

> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> CC: Julien Grall <julien.grall@arm.com>
> [On Arm only]
> Tested-by: Wei Chen <Wei.Chen@arm.com>
>=20
> ---
> Please note, this is a split/cleanup/hardening of Julien's PoC:
> "Add support for Guest IO forwarding to a device emulator"
>=20
> Changes RFC -> V1:
>    - new patch
>=20
> Changes V1 -> V2:
>    - remove "handle"
>    - add Jan's A-b
>=20
> Changes V2 -> V3:
>    - remove Jan's A-b
>    - update patch subject/description
>    - use out-of-line function instead of #define
>    - put earlier in the series to avoid breakage
>=20
> Changes V3 -> V4:
>    - add Jan's R-b
>    - rename ioreq_complete_mmio() to arch_ioreq_complete_mmio()
> ---
>  xen/arch/x86/hvm/ioreq.c        | 7 ++++++-
>  xen/include/asm-x86/hvm/ioreq.h | 1 +
>  2 files changed, 7 insertions(+), 1 deletion(-)
>=20
> diff --git a/xen/arch/x86/hvm/ioreq.c b/xen/arch/x86/hvm/ioreq.c
> index ff9a546..00c68f5 100644
> --- a/xen/arch/x86/hvm/ioreq.c
> +++ b/xen/arch/x86/hvm/ioreq.c
> @@ -35,6 +35,11 @@
>  #include <public/hvm/ioreq.h>
>  #include <public/hvm/params.h>
>=20
> +bool arch_ioreq_complete_mmio(void)
> +{
> +    return handle_mmio();
> +}
> +
>  static void set_ioreq_server(struct domain *d, unsigned int id,
>                               struct hvm_ioreq_server *s)
>  {
> @@ -225,7 +230,7 @@ bool handle_hvm_io_completion(struct vcpu *v)
>          break;
>=20
>      case HVMIO_mmio_completion:
> -        return handle_mmio();
> +        return arch_ioreq_complete_mmio();
>=20
>      case HVMIO_pio_completion:
>          return handle_pio(vio->io_req.addr, vio->io_req.size,
> diff --git a/xen/include/asm-x86/hvm/ioreq.h =
b/xen/include/asm-x86/hvm/ioreq.h
> index f140ef4..0e64e76 100644
> --- a/xen/include/asm-x86/hvm/ioreq.h
> +++ b/xen/include/asm-x86/hvm/ioreq.h
> @@ -58,6 +58,7 @@ unsigned int hvm_broadcast_ioreq(ioreq_t *p, bool =
buffered);
>=20
>  void hvm_ioreq_init(struct domain *d);
>=20
> +bool arch_ioreq_complete_mmio(void);
>  bool arch_vcpu_ioreq_completion(enum hvm_io_completion =
io_completion);
>  int arch_ioreq_server_map_pages(struct hvm_ioreq_server *s);
>  void arch_ioreq_server_unmap_pages(struct hvm_ioreq_server *s);
> --
> 2.7.4
>=20



