Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2348130C4DB
	for <lists+xen-devel@lfdr.de>; Tue,  2 Feb 2021 17:05:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.80621.147544 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6yBQ-0006U8-O9; Tue, 02 Feb 2021 16:05:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 80621.147544; Tue, 02 Feb 2021 16:05:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6yBQ-0006Tj-Kx; Tue, 02 Feb 2021 16:05:40 +0000
Received: by outflank-mailman (input) for mailman id 80621;
 Tue, 02 Feb 2021 16:05:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XtUW=HE=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1l6yBO-0006Te-Lu
 for xen-devel@lists.xenproject.org; Tue, 02 Feb 2021 16:05:38 +0000
Received: from mail-wm1-x329.google.com (unknown [2a00:1450:4864:20::329])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3f2ff961-e135-408b-934e-95516fd27975;
 Tue, 02 Feb 2021 16:05:37 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id y187so2774978wmd.3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Feb 2021 08:05:37 -0800 (PST)
Received: from CBGR90WXYV0 (host86-190-149-163.range86-190.btcentralplus.com.
 [86.190.149.163])
 by smtp.gmail.com with ESMTPSA id c62sm3845103wmd.43.2021.02.02.08.05.34
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 02 Feb 2021 08:05:35 -0800 (PST)
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
X-Inumbo-ID: 3f2ff961-e135-408b-934e-95516fd27975
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:thread-index
         :content-language;
        bh=J50FcM9Xuz2nuuwVsOHs0CLSxTRB3uDXE4eudLz4aM4=;
        b=qrkMLA3seqJMHuNgODSKDXHuSLKmDH4p0dzA+rUEshoDC415nUII4P9GE1STh27f4/
         72kl//YpdRAIuvKDs1mEk7BbsfL7S5xTun5vZZPk3dmLKpchZs0BSl2XDQovFGb+7UG3
         uVtrec0d7u2clCaYr35vEp0axF/0YlD542ZFt1ktuWb92AME8HtioZodSbf4yomxsrY3
         tRUcvaV8p4B5mjRdGk02H7PaE9P+xTvAyCTTwDSOFln81v34tU+Z7iyaLlXBFAkNttg7
         E6WSCLUJeXLo0R6dYyxd3QAoVzoyQ0cp2Eot03Mzwdrm+UDkUEalcL2/6hYem1S1yqlG
         85Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
         :subject:date:message-id:mime-version:content-transfer-encoding
         :thread-index:content-language;
        bh=J50FcM9Xuz2nuuwVsOHs0CLSxTRB3uDXE4eudLz4aM4=;
        b=gKwKBLHN5+jIr+rCR5NXfFaG0bzWOpypN+ihcaGHL6nsowm1Hkmag+doFgvzqg1Eve
         pNCqVNpml3+Oxc2FcjpX8Z9LJ7/0v3Uio+GAiU/oh7k+5nTMgcA8esXZHfPrLxAoZ48f
         FJTaUtLqb4viHnjlfh1kacpCMouzPEAnJxHP5Vg1tgHsGgG56TmPm0+r7v0HKfiRt/7O
         TdUtiMbWs5BgDaU4PfPZX52LIERwpRTd11G94sqPc/QAluz1LvvAZsE3xr/N6JRjadyv
         chftoeixdvnAsWa8ehQfKSMKcvxsqnpij0KVHWqK7cadgnquvsTNQgXhK0pBVR9144yX
         CqYA==
X-Gm-Message-State: AOAM533HhSwjiqjINwgYg70DRWItXX89D1D4+XN3dAT10n7D69Xbm/WS
	iX+MZSPACyIUWKzFpNHqWec=
X-Google-Smtp-Source: ABdhPJy/49XXN1Evx6YRHjuIWKhFBSVJHREEYrjkPlVJuxjo9IsapchrbzDO3/D4W+gHE9tR0TboIw==
X-Received: by 2002:a1c:1d8b:: with SMTP id d133mr4412376wmd.172.1612281936831;
        Tue, 02 Feb 2021 08:05:36 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
Reply-To: <paul@xen.org>
To: =?utf-8?Q?'Philippe_Mathieu-Daud=C3=A9'?= <philmd@redhat.com>,
	<qemu-devel@nongnu.org>
Cc: "'Richard Henderson'" <richard.henderson@linaro.org>,
	"'Paolo Bonzini'" <pbonzini@redhat.com>,
	"'Eduardo Habkost'" <ehabkost@redhat.com>,
	<qemu-trivial@nongnu.org>,
	"'Michael S. Tsirkin'" <mst@redhat.com>,
	"'Marcel Apfelbaum'" <marcel.apfelbaum@gmail.com>,
	<xen-devel@lists.xenproject.org>,
	"'Anthony Perard'" <anthony.perard@citrix.com>,
	"'Stefano Stabellini'" <sstabellini@kernel.org>
References: <20210202155644.998812-1-philmd@redhat.com>
In-Reply-To: <20210202155644.998812-1-philmd@redhat.com>
Subject: RE: [PATCH] hw/i386/xen: Remove dead code
Date: Tue, 2 Feb 2021 16:05:34 -0000
Message-ID: <036801d6f97d$3d9f0bf0$b8dd23d0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQHU213CX1E5gjnLtJG8R95suaIaVKpJQttA
Content-Language: en-gb

> -----Original Message-----
> From: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Sent: 02 February 2021 15:57
> To: qemu-devel@nongnu.org
> Cc: Richard Henderson <richard.henderson@linaro.org>; Paolo Bonzini =
<pbonzini@redhat.com>; Eduardo
> Habkost <ehabkost@redhat.com>; qemu-trivial@nongnu.org; Michael S. =
Tsirkin <mst@redhat.com>; Marcel
> Apfelbaum <marcel.apfelbaum@gmail.com>; =
xen-devel@lists.xenproject.org; Paul Durrant <paul@xen.org>;
> Anthony Perard <anthony.perard@citrix.com>; Stefano Stabellini =
<sstabellini@kernel.org>; Philippe
> Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Subject: [PATCH] hw/i386/xen: Remove dead code
>=20
> 'drivers_blacklisted' is never accessed, remove it.
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

FTR this is a vestige of an ancient mechanism that's not used any more =
(see =
https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dblob;f=3Ddocs/misc/hvm-em=
ulated-unplug.pandoc step 5).

Reviewed-by: Paul Durrant <paul@xen.org>

> ---
>  hw/i386/xen/xen_platform.c | 13 ++-----------
>  1 file changed, 2 insertions(+), 11 deletions(-)
>=20
> diff --git a/hw/i386/xen/xen_platform.c b/hw/i386/xen/xen_platform.c
> index 7c4db35debb..01ae1fb1618 100644
> --- a/hw/i386/xen/xen_platform.c
> +++ b/hw/i386/xen/xen_platform.c
> @@ -60,7 +60,6 @@ struct PCIXenPlatformState {
>      MemoryRegion bar;
>      MemoryRegion mmio_bar;
>      uint8_t flags; /* used only for version_id =3D=3D 2 */
> -    int drivers_blacklisted;
>      uint16_t driver_product_version;
>=20
>      /* Log from guest drivers */
> @@ -245,18 +244,10 @@ static void platform_fixed_ioport_writeb(void =
*opaque, uint32_t addr, uint32_t v
>=20
>  static uint32_t platform_fixed_ioport_readw(void *opaque, uint32_t =
addr)
>  {
> -    PCIXenPlatformState *s =3D opaque;
> -
>      switch (addr) {
>      case 0:
> -        if (s->drivers_blacklisted) {
> -            /* The drivers will recognise this magic number and =
refuse
> -             * to do anything. */
> -            return 0xd249;
> -        } else {
> -            /* Magic value so that you can identify the interface. */
> -            return 0x49d2;
> -        }
> +        /* Magic value so that you can identify the interface. */
> +        return 0x49d2;
>      default:
>          return 0xffff;
>      }
> --
> 2.26.2



