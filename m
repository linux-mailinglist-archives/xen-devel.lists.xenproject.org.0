Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B562FA38A4F
	for <lists+xen-devel@lfdr.de>; Mon, 17 Feb 2025 18:06:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.890748.1299884 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tk4ZW-0007TE-1i; Mon, 17 Feb 2025 17:06:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 890748.1299884; Mon, 17 Feb 2025 17:06:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tk4ZV-0007RH-VH; Mon, 17 Feb 2025 17:06:17 +0000
Received: by outflank-mailman (input) for mailman id 890748;
 Mon, 17 Feb 2025 17:06:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=j0rV=VI=cloud.com=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1tk4ZU-0007RB-0t
 for xen-devel@lists.xenproject.org; Mon, 17 Feb 2025 17:06:16 +0000
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [2607:f8b0:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7e3e60c8-ed51-11ef-9aa6-95dc52dad729;
 Mon, 17 Feb 2025 18:06:14 +0100 (CET)
Received: by mail-ot1-x32f.google.com with SMTP id
 46e09a7af769-71e1158fe3eso2737837a34.1
 for <xen-devel@lists.xenproject.org>; Mon, 17 Feb 2025 09:06:14 -0800 (PST)
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
X-Inumbo-ID: 7e3e60c8-ed51-11ef-9aa6-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1739811973; x=1740416773; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EyFMcRxqWRISEOqHPVkg8H7aNloALZBq7EnIILl0UTg=;
        b=D586nr1Goy9KUTuURwVLEdso6AvPEyCdJgeImuec+5LMp5CiNjj4WGgcpMT6QvA70f
         K5sCN2AEST+oIBdC+KjkWC+WP1oNTeRPlYX8AMoK6W2Olk1FJrjtU96I268B/khVHz8v
         glKoWhyOsqsPRvsXMJlXHwTAxc9SRbS7JBhdQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739811973; x=1740416773;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EyFMcRxqWRISEOqHPVkg8H7aNloALZBq7EnIILl0UTg=;
        b=cy0JVaXHj17+19wahUjE/HvC33EkFtDEx8kL4G0Rx3pV9Akd/6EGb4ymICEePSE1hp
         zSB7gQbGmbxQCe8fKVtMPh2Gqon+bGKYQA6VAoEEiKW6ylZ/iM9aa77XHYaEF8ObSqqG
         uPZBUlSNDzeAi5iTcfi6IMRzXYRVR5Ph79nIJB1HIJvrMpCpsvhqPLNAkS0TThIkZ7Yk
         Rm5QLGOTWwAkINi79NqLw0iY7hbKTuFhtkrS0FVPZz6XhpY0LK8789pmeq20zkxWUvmr
         Cytw+Cfnd4tD34YeKMObXryc9jRSAD9mYmURoxocqtZ/uEWTN6PJpvIvaWYg1KYwHA2L
         ac2g==
X-Forwarded-Encrypted: i=1; AJvYcCVBJmpc/9WZ9LCrMa95zIwJ6lxjAXd0P7XVVa4H7XpDP3SyF0FfEawMcvS5MIX4C3GXJ/P2ymhf1bY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz8u0Lvwr2t5+fDiL/yqB2jF+TJdPv00DNssLC9Vc3mwg/TbZsD
	bUCHLhrKMOPFXplWCY+bA6Uqp69uG9UcwPmDDRKCVat+nyC/iEC1yUKq45DJgs7Fc0+WRnypLbv
	0SLH0y19VMCQzWGjb7LcoRuyQ5ZqANVop/nSI
X-Gm-Gg: ASbGncvKkn+b1jOTUIxQs9HdFrPoySQQy/yc7x2YrVIZ8Pc5Fuj0MAeWgF6YbYB4OdN
	88ar6rQ544ZgmLwfnh1txZvv4rh8n9HWqQydIqUBL8fAZjqRmHwWvmkt3nkRi6/BTSHCfL8I=
X-Google-Smtp-Source: AGHT+IFOOOuf5RuNR359xVYMzDcR/A+cO5Hl8pvtKvty3Zj8ddYSZ/x0gWHvfNWRNV2lzwTpIftpnxQqW/EqJLx4WrM=
X-Received: by 2002:a05:6808:2209:b0:3f3:e1aa:dc67 with SMTP id
 5614622812f47-3f3eb0ba07bmr8551650b6e.23.1739811973185; Mon, 17 Feb 2025
 09:06:13 -0800 (PST)
MIME-Version: 1.0
References: <20250217160844.3164003-1-ross.lagerwall@citrix.com> <42687b94-22ff-40a0-ba91-de6251d4b420@citrix.com>
In-Reply-To: <42687b94-22ff-40a0-ba91-de6251d4b420@citrix.com>
From: Ross Lagerwall <ross.lagerwall@citrix.com>
Date: Mon, 17 Feb 2025 17:06:02 +0000
X-Gm-Features: AWEUYZnavuwlmR64W0aGThK_fbCcDBd6gkZG91Okr3bLz6E8QF-zXYkSNSoEKao
Message-ID: <CAG7k0EpuScuFCU-9yk_s7_-yC5Fg9ufmLS+p5mQ=WqF4v3dNgg@mail.gmail.com>
Subject: Re: [PATCH] x86/ucode: Add option to scan microcode by default
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 17, 2025 at 4:44=E2=80=AFPM Andrew Cooper <andrew.cooper3@citri=
x.com> wrote:
>
> On 17/02/2025 4:08 pm, Ross Lagerwall wrote:
> > A lot of systems automatically add microcode to the initrd so it can be
> > useful as a vendor policy to always scan for microcode. Add a Kconfig
> > option to allow setting the default behaviour.
> >
> > The default behaviour is unchanged since the new option defaults to
> > "no".
> >
> > Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
>
> I'm pretty sure this is safe on 4.20.
>
> Prior versions of Xen need the fix to make idx/scan be mutually
> exclusive, which hasn't been backported yet IIRC.
>
> > ---
> >  xen/arch/x86/Kconfig              | 11 +++++++++++
> >  xen/arch/x86/cpu/microcode/core.c |  2 +-
> >  2 files changed, 12 insertions(+), 1 deletion(-)
> >
> > diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
> > index 9cdd04721afa..b806d8bc3319 100644
> > --- a/xen/arch/x86/Kconfig
> > +++ b/xen/arch/x86/Kconfig
> > @@ -383,6 +383,17 @@ config ALTP2M
> >
> >         If unsure, stay with defaults.
> >
> > +config UCODE_SCAN_DEFAULT
> > +     def_bool n
> > +     prompt "Scan for microcode by default"
> > +     help
> > +       During boot, Xen can scan the multiboot images for a CPIO archi=
ve
> > +       containing CPU microcode to be loaded.
>
> ", which is Linux's mechanism for early microcode loading."
>
> This is quite an important point to cover.
>
> > +
> > +       Enabling this option will cause Xen to scan for it by default.
> > +
> > +       If unsure, say N.
>
> Personally I don't like this "If unsure", because it's almost always
> redundant with the default.
>
> In this case, it really ought to be "set if you have a Linux dom0",
> which in turn begs the question as to whether it ought to be bool y.
>

I agree with you that changing the default to yes is probably a good
idea but I think it would be better to separate making it configurable
from changing the default behaviour.

Ross

