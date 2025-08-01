Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9B3CB18149
	for <lists+xen-devel@lfdr.de>; Fri,  1 Aug 2025 13:45:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1067196.1432127 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhoCG-00062U-VJ; Fri, 01 Aug 2025 11:45:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1067196.1432127; Fri, 01 Aug 2025 11:45:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhoCG-00060z-R4; Fri, 01 Aug 2025 11:45:12 +0000
Received: by outflank-mailman (input) for mailman id 1067196;
 Fri, 01 Aug 2025 11:45:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N9B3=2N=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1uhoCF-00060t-9x
 for xen-devel@lists.xenproject.org; Fri, 01 Aug 2025 11:45:11 +0000
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [2607:f8b0:4864:20::22e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f988a163-6ecc-11f0-b896-0df219b8e170;
 Fri, 01 Aug 2025 13:45:09 +0200 (CEST)
Received: by mail-oi1-x22e.google.com with SMTP id
 5614622812f47-41b4ebb15e2so978854b6e.3
 for <xen-devel@lists.xenproject.org>; Fri, 01 Aug 2025 04:45:09 -0700 (PDT)
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
X-Inumbo-ID: f988a163-6ecc-11f0-b896-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1754048708; x=1754653508; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1OlFcRTGjo+XBPKGhcZipxmDk8NlzuRt/DeJY9bvaKw=;
        b=lV1tGSscx/L9ad2Eb1otJGCUJjaRjpEnPqWKr5Oi6ErXWXxwQYcGE4lE4TQKLGN9/p
         KsGT+Bmh9P6RLFPHnt5HUoGoK4VQ9IAb+rMDX2NMLrvNEZYyIZRcI16vwguQEoMNH1/C
         h0tU4eSC9CuaBiUiv7EPscZfyRe/8kXQJN174=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754048708; x=1754653508;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1OlFcRTGjo+XBPKGhcZipxmDk8NlzuRt/DeJY9bvaKw=;
        b=UdqFLhl3vf2/dmT7z4Fqr7k4vfesI5Ux46JTzpHFk2aDMgCp8RCQBwS12Yh9VZrguC
         FVpMNjifNSZ2PknBhuvqL2sG93oNl9X6VMJlV4jJAcluhJcpRzwkezHPlW9VKKuqCy5j
         V7KVDnh0PKUvlR2YRIU3Cp3bIwzNKJqpJ3HnOmB/SvzVavyofNTlDTWyFRic4S3hy2qy
         YE/78SPZavl17urAMiRBe56eIV9R0V+nGyHmmQA8hmzl+/lUJplXpyoIVT6lK1EvgQ0n
         kuv01WqP/DsyQRy+Mowt57liCXoQNCnQwgVsYFxs9vGgEj4Px+BHGVm2u6XK9pPcBxxH
         7fCg==
X-Gm-Message-State: AOJu0YwukYM38CRRBmGyoDOt6xDSrOr/Qz2kEql1b5vI27rAImALDV+B
	Pb+OW0yLh7+KPJ+vgoAvAbw7xL5fpHjjVU56v7z4tmD7J3HcjPLIRjWRrtYO7AcMnzmqyCmY2vx
	7Mrs7wC52ph+5nqKt7dXM6VfZZcYm5Mekl5D0DOzZ6Q==
X-Gm-Gg: ASbGnctqXl2+CHUJW8wOcWcCebpYBp+sJuEPLqWWnm/zeUcoRCUpOrRvRRq1PmWH/Md
	rxlcznu5ZaOGXrn69D/cAg0ov3sDwXaTBAAwmhftPAAePoszEaZD201l9MlxQAfJ70gSRYp6EhF
	EeGH70LssCdkPHcH709QwAmD/kZ2Q2FrOqVj/laORgUMjstKQqhblZnT4mp3s09oQnSvoPCd8/B
	2g0qx8=
X-Google-Smtp-Source: AGHT+IFtF4y0tnfNuIHefeNb52zUFGW2wkiQ9ClS+SpSJ1xKaLd07vJyTMsmfLtt3DHf0+HHevJAfxPJWnNfn6tAcoY=
X-Received: by 2002:a05:6808:6702:b0:406:45ae:b0 with SMTP id
 5614622812f47-4319c1ef726mr7322580b6e.35.1754048707922; Fri, 01 Aug 2025
 04:45:07 -0700 (PDT)
MIME-Version: 1.0
References: <e742cee1-450d-4df0-a3a6-af635a940472@citrix.com>
In-Reply-To: <e742cee1-450d-4df0-a3a6-af635a940472@citrix.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Fri, 1 Aug 2025 12:44:57 +0100
X-Gm-Features: Ac12FXw4kXbLuRe8A2LolUx6iP80Z629ue7VAKmsl9g1-T6ipHV4GHC3pNTBY80
Message-ID: <CACHz=ZhOnnCAZ9W=j0fTWnpy7BzqjZF7B-X0sxLagKa-7q1ZiQ@mail.gmail.com>
Subject: Re: Console vs serial
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 1, 2025 at 12:25=E2=80=AFPM Andrew Cooper <andrew.cooper3@citri=
x.com> wrote:
>
> Hello,
>
> There's a long-standing irritation in Xen, whereby printk()'s which
> occur prior to console_init_preirq() get half-lost.
>
> They end up in the console ring, and hence are available via `xl dmesg`,
> but they're missing from serial console.
>
> e.g. these 4 lines don't escape
>
>     (XEN) Enabling lockdown mode because Secure Boot is enabled
>     (XEN) Lockdown mode is enabled
>     (XEN) Ignoring cmdline option 'hap_2mb' in lockdown mode
>     (XEN) Ignoring cmdline option 'hap_1gb' in lockdown mode
>      __  __            _  _    _  ___   ____
>      \ \/ /___ _ __   | || |  / |/ _ \ |___ \
>
>
> This is from a testcase failure I've just debugged, but the issue is not
> specific to secureboot.  More generally, any diagnostic from cmdline
> parsing ends up in this state.
>
> For PVShim, we did a gross hack to assume the PV console is usable right
> from the outset, but all other console configurations don't start
> working until the cmdline has been parsed.
>
> Is anything stopping us from feeding the current contents of the console
> ring into serial in console_init_preirq()?
>
> ~Andrew
>

I don't think there's a problem replaying the console logs into the
serial once the serial is set up.
It will slow down the boot maybe but beside that it should be fine.

Frediano

