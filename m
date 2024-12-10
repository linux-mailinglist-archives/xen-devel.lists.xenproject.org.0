Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACA189EB326
	for <lists+xen-devel@lfdr.de>; Tue, 10 Dec 2024 15:26:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.852507.1266281 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tL1B9-0000gY-7k; Tue, 10 Dec 2024 14:25:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 852507.1266281; Tue, 10 Dec 2024 14:25:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tL1B9-0000e7-42; Tue, 10 Dec 2024 14:25:35 +0000
Received: by outflank-mailman (input) for mailman id 852507;
 Tue, 10 Dec 2024 14:25:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o3V8=TD=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tL1B8-0000e1-3b
 for xen-devel@lists.xenproject.org; Tue, 10 Dec 2024 14:25:34 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9cd1f0e2-b702-11ef-99a3-01e77a169b0f;
 Tue, 10 Dec 2024 15:25:32 +0100 (CET)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-aa66ead88b3so521224866b.0
 for <xen-devel@lists.xenproject.org>; Tue, 10 Dec 2024 06:25:32 -0800 (PST)
Received: from localhost ([217.156.233.154]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa6707a5110sm448345366b.36.2024.12.10.06.25.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Dec 2024 06:25:30 -0800 (PST)
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
X-Inumbo-ID: 9cd1f0e2-b702-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1733840731; x=1734445531; darn=lists.xenproject.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NEofE3HrwNK50C5MWDNYe5n8nJp/eQjHZSP9LC4WWcU=;
        b=lakQIxO1njjVtMNNUqiNWswK+jFhyuodPNo+VO3vdKTt+6+8DjPBnsVbaFRszALZWP
         kbMcgZxiEZykWXZ9xpgRo+L5zDJEhyOYX40oDBok/XeD6M+RS8yHLFz0NRKAgUcsR+bP
         xT5FZWLBtB8Iv7cVlHQbUm8xbYJjUwaSP7yI0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733840731; x=1734445531;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NEofE3HrwNK50C5MWDNYe5n8nJp/eQjHZSP9LC4WWcU=;
        b=xHSpoHbSMgzH2QGCeEjdoJ7K8Mn4cQ7Q3GOJpSiwkkd7K8tF8IGqxdpAI9xxNm9+/l
         +eEtbu6f2+W+/T9hM2o+R59RpbE7Hd+gNHkf81BBr8TyGQA6x3cPShcCXxoHCE71lc9W
         2TUGVHCWNZiy9MRxBL2zVo9WKN2CXSkLS77bYV6kwT3REdAkufgjLZ03DMvXwfk/lPvJ
         BtIflKiDoqlGr1Y/zGB3JV4HA3k0zAioJmDbdTZdwgxbs2K+ex+VBfAE2R3c97qMxdNr
         +egsXsOMUUBMdSZKZGHDsfanvDl1OzrFJmfNdsNK2HgADOWFL1yWsFgTIHxusPdwFEzx
         6Dbw==
X-Forwarded-Encrypted: i=1; AJvYcCUhEMLt2MxZpWrG0BzFx3dEcE76wIfolEZIQ1YkWfpZaDeP0awW9+9PU4oP7AJMLS/dki/63XKMr5A=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy0HLGkUDQo5Lz2RUdgHbSLCWkSClmtnnI6aiy9S1mBR42bPGn+
	CFg+Nzz//FZmMNsfoMGXYDH7tiGA661PtVuUWgWuoBFJZOPTPIVsITOvyW3LLhA=
X-Gm-Gg: ASbGncsHwFyWNFfaX/A8pEjPABjnloy6T64o0GaDCJHll8+tF8wVsOY+V54oG/NYrX5
	9niQ7VuWQHqsqG0QxnIbh+XBNpiFUe9vc3YE7KpLTsRUykojYqvW+4xssIPrNvXAU9fiMp2hXzD
	9ZGDSXfYL9jriWzlbYqIvsYamJ+ej+fV+dhi3qcB/w3FkovgqUsF/b3JBBGKsf3VBlq8GHUudi1
	cPTAE/bnfPa0Xj97NpowFu0kSB2fvNvqJCQ1neVvokC9w/EG+3bsgadRKv0hvw=
X-Google-Smtp-Source: AGHT+IFqoO8jyHrhvAG1IBFxy2Z6cpDlsKT+KPu2mgmpUZ10cpjmSX1y9hQpdi+4iwraJ7IJ77xIzw==
X-Received: by 2002:a17:906:1da9:b0:aa6:77a4:f675 with SMTP id a640c23a62f3a-aa69cd468d3mr451613566b.13.1733840731491;
        Tue, 10 Dec 2024 06:25:31 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 10 Dec 2024 14:25:29 +0000
Message-Id: <D6838QWBS1OG.37M94XNPN17P7@cloud.com>
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>,
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH] x86/FPU: make vcpu_reset_fpu() build again with old gcc
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Jan Beulich" <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.18.2
References: <da8320f7-1baf-41f5-b7ac-c05b6371e1e4@suse.com>
In-Reply-To: <da8320f7-1baf-41f5-b7ac-c05b6371e1e4@suse.com>

On Mon Dec 9, 2024 at 3:13 PM GMT, Jan Beulich wrote:
> Fields of anonymous structs/unions may not be part of an initializer for
> rather old gcc.

Can you add the specific version for tracking purposes?

>
> Fixes: 49a068471d77 ("x86/fpu: Rework fpu_setup_fpu() uses to split it in=
 two")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>
> --- a/xen/arch/x86/i387.c
> +++ b/xen/arch/x86/i387.c
> @@ -306,13 +306,13 @@ void vcpu_reset_fpu(struct vcpu *v)
>  {
>      v->fpu_initialised =3D false;
>      *v->arch.xsave_area =3D (struct xsave_struct) {
> -        .fpu_sse =3D {
> -            .mxcsr =3D MXCSR_DEFAULT,
> -            .fcw =3D FCW_RESET,
> -            .ftw =3D FXSAVE_FTW_RESET,
> -        },
>          .xsave_hdr.xstate_bv =3D X86_XCR0_X87,
>      };
> +
> +    /* Old gcc doesn't permit these to be part of the initializer. */
> +    v->arch.xsave_area->fpu_sse.mxcsr =3D MXCSR_DEFAULT;
> +    v->arch.xsave_area->fpu_sse.fcw =3D FCW_RESET;
> +    v->arch.xsave_area->fpu_sse.ftw =3D FXSAVE_FTW_RESET;

That's not quite the same though. A more apt equivalence would be to memset=
 the
area to zero ahead of the assignments. Otherwise rubble will be left behind=
.

>  }
> =20
>  void vcpu_setup_fpu(struct vcpu *v, const void *data)

Out of context and not triggering the GCC bug, but vcpu_setup_fpu() should
probably share the same initialization style as vcpu_reset_fpu(), imo.

Cheers,
Alejandro

