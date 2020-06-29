Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2D3720CE5A
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2020 13:50:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jpsIB-00066X-15; Mon, 29 Jun 2020 11:49:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xxse=AK=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jpsIA-00066S-1Y
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2020 11:49:42 +0000
X-Inumbo-ID: 9de5d110-b9fe-11ea-8496-bc764e2007e4
Received: from mail-wr1-x444.google.com (unknown [2a00:1450:4864:20::444])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9de5d110-b9fe-11ea-8496-bc764e2007e4;
 Mon, 29 Jun 2020 11:49:41 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id g18so16265377wrm.2
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2020 04:49:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=81RmdWf3FIrFu6KuRBwVUJPkgQUjijKfVyCOBzVOIYo=;
 b=vX+10zpVYSOeBxnrbL33b9MZk4xc9wS0LxPofOkiLM0L+ZcAFfK9t77nhcMF5rPZg6
 97I3uJR4b10VzCvEyhOuM5zKT6Lh1lLuI3TgXSvXBNfwnEDJYdti/Y5mF9mu9MRgC3r2
 fEAOG490uC/z+8aQDaJZL6tqdmRPvPPBdPENWBt/lKAGvtfoI1T6tJ0BHROzQg3ywu2d
 nLa54hKQbHwf+W5e3GoYyyV5sIjSt0ffVyu0D3L3YMSm2UpLcDHV34OUeW19ymBFcvHm
 PX/PgITiVczzwYK5Pdof3lCqkRh8aEGR85QGIolIEUcnVDXLCU1h+cUR1UgORWm2bvdd
 EYeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=81RmdWf3FIrFu6KuRBwVUJPkgQUjijKfVyCOBzVOIYo=;
 b=dLxjZAilFTsF+9lYXFVRvEP4fsWnfDRdaJ9q3ZWKsmKA+R9JqqsSfd/TPxWShJUiIm
 NtE37Uw+CRmxBtUCdO/ypz2G16eUbUFZc7BCrdNrjkXToTL209CzKUsXMQxnLYDobxUM
 EbvZ3EEmyiyYCVOTYAtvff0Sc6pzAQ2/tPG4u3m9w/DP9FOacTTMrl+hsOPYpXMUBwNQ
 3st90NX2dvmQDjSEDwpYmtlZP+eDO1x78Hu+0FktmdR0ywU9uWXBl0q7koVjgcgo9rXS
 NWVQGqh9AyxcKwjhdufpQzRrUL+wzKAgoxv9YOkqoAVEUfPDsf8u11KhnP5mMllrToXn
 Armg==
X-Gm-Message-State: AOAM5312uc0WEBDmWQuDQq898bzfv56S3Ce/JLIf44T4zyB9Pl1vt0bW
 v0ny9022OjXqXQvYQcw7ccA=
X-Google-Smtp-Source: ABdhPJxVyUMLyoFhGN4r8M2n1tDkCdscRNgD+sb3fPNVautRgNuH+gKXihutk+llRWuz9rUt9YSxPg==
X-Received: by 2002:adf:f34e:: with SMTP id e14mr16543308wrp.299.1593431380651; 
 Mon, 29 Jun 2020 04:49:40 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-233.amazon.com. [54.240.197.233])
 by smtp.gmail.com with ESMTPSA id y16sm48327027wro.71.2020.06.29.04.49.39
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 29 Jun 2020 04:49:40 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Andrew Cooper'" <andrew.cooper3@citrix.com>,
 "'Xen-devel'" <xen-devel@lists.xenproject.org>
References: <20200629103113.9328-1-andrew.cooper3@citrix.com>
In-Reply-To: <20200629103113.9328-1-andrew.cooper3@citrix.com>
Subject: RE: [PATCH] x86/boot: Don't disable PV32 when XEN_SHSTK is compiled
 out
Date: Mon, 29 Jun 2020 12:49:38 +0100
Message-ID: <000701d64e0b$5f0c59a0$1d250ce0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQFLqu8eC5z5XvXfLQMJf8ab2IBDd6oEwKug
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Reply-To: paul@xen.org
Cc: 'Wei Liu' <wl@xen.org>, 'Jan Beulich' <JBeulich@suse.com>,
 =?utf-8?Q?'Roger_Pau_Monn=C3=A9'?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Andrew Cooper <andrew.cooper3@citrix.com>
> Sent: 29 June 2020 11:31
> To: Xen-devel <xen-devel@lists.xenproject.org>
> Cc: Andrew Cooper <andrew.cooper3@citrix.com>; Jan Beulich =
<JBeulich@suse.com>; Wei Liu <wl@xen.org>;
> Roger Pau Monn=C3=A9 <roger.pau@citrix.com>; Paul Durrant =
<paul@xen.org>
> Subject: [PATCH] x86/boot: Don't disable PV32 when XEN_SHSTK is =
compiled out
>=20
> There is no need to automatically disable PV32 support on =
SHSTK-capable
> hardware if Xen isn't actually using the feature.
>=20
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Wei Liu <wl@xen.org>
> CC: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> CC: Paul Durrant <paul@xen.org>
>=20
> For 4.14.  Minor bugfix.

Release-acked-by: Paul Durrant <paul@xen.org>

> ---
>  xen/arch/x86/setup.c | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
> index 2aa1cd50b8..c9b6af826d 100644
> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -95,7 +95,11 @@ unsigned long __initdata highmem_start;
>  size_param("highmem-start", highmem_start);
>  #endif
>=20
> +#ifdef CONFIG_XEN_SHSTK
>  static bool __initdata opt_xen_shstk =3D true;
> +#else
> +#define opt_xen_shstk false
> +#endif
>=20
>  static int __init parse_cet(const char *s)
>  {
> --
> 2.11.0



