Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46AA2ACCB66
	for <lists+xen-devel@lfdr.de>; Tue,  3 Jun 2025 18:39:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1004697.1384421 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMUfT-0003fH-U1; Tue, 03 Jun 2025 16:39:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1004697.1384421; Tue, 03 Jun 2025 16:39:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMUfT-0003cP-QJ; Tue, 03 Jun 2025 16:39:15 +0000
Received: by outflank-mailman (input) for mailman id 1004697;
 Tue, 03 Jun 2025 16:39:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VpGW=YS=cloud.com=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1uMUfS-0003cJ-33
 for xen-devel@lists.xenproject.org; Tue, 03 Jun 2025 16:39:14 +0000
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [2607:f8b0:4864:20::22e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 46dd8c80-4099-11f0-b894-0df219b8e170;
 Tue, 03 Jun 2025 18:39:11 +0200 (CEST)
Received: by mail-oi1-x22e.google.com with SMTP id
 5614622812f47-4066a0d0256so3700926b6e.3
 for <xen-devel@lists.xenproject.org>; Tue, 03 Jun 2025 09:39:11 -0700 (PDT)
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
X-Inumbo-ID: 46dd8c80-4099-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1748968750; x=1749573550; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mz2eFOP4xXzeoBysviyy+w23/MgnulMoveTa63frXq8=;
        b=cZtT4y3pmssONVJNEd7tYXczK2GWN0bv5THMMXQoefG2Ts2niWY8Uzp21gV4f1Qji4
         /FlCkXZDpCZ5BQKKL+X2InvC7UTGIq0aQBvSpOWaVPLCbx1JghlXz7XWkk+3P/Ontsti
         PYRXZJZcl4U/zECv9V4wwCYGDlBmcFeWr6Lkw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748968750; x=1749573550;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mz2eFOP4xXzeoBysviyy+w23/MgnulMoveTa63frXq8=;
        b=YBjnXHC8tdeLdSNu6jxg8GcpxsgR/YiJVFmXR0HQl2nCQv0uUYQDZgl//G+vCx14F7
         uNOC3IKRA3n+w45B8Q94eetiecUxxbrH8FyLsqb7pR+5W1cL7/ISH3pAhto9cf0Y8Kob
         arQ36+0MEjVIHnMTleJikqDc5JMtzWVRTsOdjyEFbq53sDZK0BfU84tatnikFrviAiSB
         MCulKsvNSIFhBIPlkj26yU72veJZDiSJ8gn0VS53V7PHscdnFroszKhCrjDn4IBYx2LW
         FDAcIYMGy/HXrEycGbNOiQzQhKZlQa15qFpAq98oa2P67AQ1z0D29RFMee68QKUgkRru
         RPJQ==
X-Forwarded-Encrypted: i=1; AJvYcCUznIIlVE3gSQLw2hdgQH6D32StVw32MeWgbInFuctvzzb0hl43n2CwzqbisiFZRlypaAKdi24tejs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwPbLicCswiqf4NjYGwzovgM3+0cBNp12iz+E0vsw4xth2YE8iy
	VawkDIYINZkZNYOofYRtqQoLGJB7thC87ZDmMmZiMws+LP2CheboQfoOUYQoj5L8dkHL//koSmg
	Oo7OZthHwNQkBMFhwLZuTNYpNeHATWuGmtWQigLve
X-Gm-Gg: ASbGncuPIyWCfV/UE4QLA1+ahEv0fx5pBGLGfOxAvV1SY+17rFTvVAewHPC9bpXCREP
	pi61ZH4LgGDk4/AV4kg8VctNYMJfmI8McSfG3jm0dPOUN2s0LkS9Uk6dOs9URp/nzxw7EDv436d
	fYzAYvnXdVmgmIst9cmhjymWNUf5au5qc=
X-Google-Smtp-Source: AGHT+IEPsAUGln4BnpMpjKtCG5527JWb/M4eTwWfCaK+ZFEQVYQx88QlHY6wjQsxB4ZH1h/3Bx9/XO8mQ/En8HVU7Ms=
X-Received: by 2002:a05:6808:4484:b0:406:6bf5:cb61 with SMTP id
 5614622812f47-406796b4916mr12813186b6e.13.1748968750574; Tue, 03 Jun 2025
 09:39:10 -0700 (PDT)
MIME-Version: 1.0
References: <20250602134656.3836280-1-kevin.lampis@cloud.com>
 <20250602134656.3836280-3-kevin.lampis@cloud.com> <32e3df0b-9ce2-4de7-9f48-d68aab8f2177@citrix.com>
In-Reply-To: <32e3df0b-9ce2-4de7-9f48-d68aab8f2177@citrix.com>
From: Ross Lagerwall <ross.lagerwall@citrix.com>
Date: Tue, 3 Jun 2025 17:38:58 +0100
X-Gm-Features: AX0GCFs9ZIcyBTnmGq-HGMuj8CnPPmUafTETz0F8bOYk0KMprCXBp2TtQx877Xc
Message-ID: <CAG7k0EqDZabrrg0zAQS8v3NDhTVQCNxXE2H_e+qAR85-JCpcuA@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] Add lockdown mode
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Kevin Lampis <kevin.lampis@cloud.com>, xen-devel@lists.xenproject.org, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	Daniel Smith <dpsmith@apertussolutions.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 3, 2025 at 5:29=E2=80=AFPM Andrew Cooper <andrew.cooper3@citrix=
.com> wrote:
>
> On 02/06/2025 2:46 pm, Kevin Lampis wrote:
> > diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
> > index 1f5cb67bd0..efeed5eafc 100644
> > --- a/xen/arch/x86/setup.c
> > +++ b/xen/arch/x86/setup.c
> > @@ -15,6 +15,7 @@
> >  #include <xen/kexec.h>
> >  #include <xen/keyhandler.h>
> >  #include <xen/lib.h>
> > +#include <xen/lockdown.h>
> >  #include <xen/multiboot.h>
> >  #include <xen/nodemask.h>
> >  #include <xen/numa.h>
>
> As the only modification to setup.c, this hunk surely isn't in the right
> patch.
>
> > diff --git a/xen/common/Kconfig b/xen/common/Kconfig
> > index 0951d4c2f2..33cd669110 100644
> > --- a/xen/common/Kconfig
> > +++ b/xen/common/Kconfig
> > @@ -587,4 +587,12 @@ config BUDDY_ALLOCATOR_SIZE
> >         Amount of memory reserved for the buddy allocator to serve Xen =
heap,
> >         working alongside the colored one.
> >
> > +config LOCKDOWN_DEFAULT
> > +       bool "Enable lockdown mode by default"
> > +       default n
>
> default n is redundant.  Please drop it.
>
> > +       help
> > +         Lockdown mode prevents attacks from a rogue dom0 userspace fr=
om
> > +         compromising the system. This is automatically enabled when S=
ecure
> > +         Boot is enabled.
>
> It's more than just rogue dom0 userspace.  But, are we using lockdown
> mode for anything more than just cmdline filtering?

Not as part of this series, but it is expected that lockdown mode will
eventually be tied into certain other functionality. E.g. requiring live
patches to be signed when it is enabled.

Ross

