Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9C9198EC48
	for <lists+xen-devel@lfdr.de>; Thu,  3 Oct 2024 11:27:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.809224.1221440 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swI7O-0007nk-Vc; Thu, 03 Oct 2024 09:27:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 809224.1221440; Thu, 03 Oct 2024 09:27:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swI7O-0007kZ-SX; Thu, 03 Oct 2024 09:27:30 +0000
Received: by outflank-mailman (input) for mailman id 809224;
 Thu, 03 Oct 2024 09:27:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d1Re=Q7=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1swI7N-0007kT-VS
 for xen-devel@lists.xenproject.org; Thu, 03 Oct 2024 09:27:30 +0000
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com
 [2001:4860:4864:20::2f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b42bb66d-8169-11ef-a0ba-8be0dac302b0;
 Thu, 03 Oct 2024 11:27:27 +0200 (CEST)
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-27cdb92376aso440878fac.0
 for <xen-devel@lists.xenproject.org>; Thu, 03 Oct 2024 02:27:27 -0700 (PDT)
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
X-Inumbo-ID: b42bb66d-8169-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1727947646; x=1728552446; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2gjvdHmJaI+bpqMYthr/OX1EjaRZf5XpiLwYjhJRz6M=;
        b=GQv9/0drGsB7H66FGG2mDPcvgT52lfekeJ0zsU8Ii1yXWi4CO1pEa5w76btUb1tBai
         R9j5ZrnA6c30mfDIYMAAc7eRIJsSxcmbsmhSFNXCRmf0qxOatNrmxyfyzFA39mnkRlPH
         cKTBBD31J+1FdM9os4gQTyA8b51wnpeqHFOqU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727947646; x=1728552446;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2gjvdHmJaI+bpqMYthr/OX1EjaRZf5XpiLwYjhJRz6M=;
        b=MRYMufMEzfXEYCIEyXsNqk+U3ZEX++G6Hx+VDHhEj3313DHFFtr8fTRGQV+D66qHIl
         6E85iJZCxPlQ1G05mA0zDD8aLa+3N0SxHRJU2dq3JAPYbvFTEXCcXkzkkNQfPI+nbsiM
         F3NoXx1aUQfJf74LtIyxVWYJZgn0IyNnEsLiBLESQzyanFAYEdKAvcjt5XUU5jYAlW+5
         FBj9hb26S2cc/TeTN5RfbmhnITvNW3j7E/sdY5PS/P8QhvtDmdG3TyuIfE3Ch5vJYA3f
         Z8DD7Sps2ZoLoO8Ai7KEFKTMp9hCBIug8nLSsC+uXruRfEIZSkPqorv2Q68ZgFusxHVy
         plkQ==
X-Gm-Message-State: AOJu0Yw1f+GCyKMEUKbf3MaUlFCAMwntzWdNovF/2/rHX9hc4Z66QMEc
	rBIopMpxYTAX+UwAX2S5Rc5m++4GrYGmKFuvrvflVnRfpABNN4m2X9qZIVbWTIPBUhb4S++eHfQ
	v0eg+SMzWn4P5kezTnd7L4dj/UbzkTkZOdvuyzQ==
X-Google-Smtp-Source: AGHT+IHR191ouKxHGELbjsluEAuByWTAyI+y6w+RegilG4QMIQf5Bl1vCLgxSANu3O6tAdxlTND1BHl6mlCkSMRxbfk=
X-Received: by 2002:a05:6871:4ccb:b0:287:b133:8aca with SMTP id
 586e51a60fabf-287b1338cc0mr388919fac.25.1727947645966; Thu, 03 Oct 2024
 02:27:25 -0700 (PDT)
MIME-Version: 1.0
References: <20241001102239.2609631-1-frediano.ziglio@cloud.com>
 <Zv1S88isxSSMuqqk@mail-itl> <CACHz=ZhmsA_7eiV+MXi6=3NRzro_sZZK+-Kt-PJ_FS6RfZPZ6g@mail.gmail.com>
 <Zv3vUCLlaZSN84D_@mail-itl>
In-Reply-To: <Zv3vUCLlaZSN84D_@mail-itl>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Thu, 3 Oct 2024 10:27:15 +0100
Message-ID: <CACHz=Zj141V4LCfDHKqV6ie9AHkYom4DaaJjxh9DQQaoe7bnGA@mail.gmail.com>
Subject: Re: [PATCH v7 0/2] x86/boot: Reduce assembly code
To: =?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 3, 2024 at 2:11=E2=80=AFAM Marek Marczykowski-G=C3=B3recki
<marmarek@invisiblethingslab.com> wrote:
>
> On Wed, Oct 02, 2024 at 04:27:19PM +0100, Frediano Ziglio wrote:
> > On Wed, Oct 2, 2024 at 3:04=E2=80=AFPM Marek Marczykowski-G=C3=B3recki
> > <marmarek@invisiblethingslab.com> wrote:
> > >
> > > On Tue, Oct 01, 2024 at 11:22:37AM +0100, Frediano Ziglio wrote:
> > > > This series came from part of the work of removing duplications bet=
ween
> > > > boot code and rewriting part of code from assembly to C.
> > > > Rewrites EFI code in pure C.
> > >
> > > The MB2+EFI tests on Adler Lake fail with this series:
> > > https://gitlab.com/xen-project/people/marmarek/xen/-/pipelines/147876=
6782
> > > Looking at the VGA output (unfortunately not collected by the test
> > > itself) it hangs just after bootloader, before printing anything on t=
he
> > > screen (or even clearing it after bootloader). The serial is silent t=
oo.
> > >
> >
> > I tried multiple times to take a look at the logs, but I keep getting e=
rror 500.
>
> 500? That's weird. Anyway, serial log is empty, so you haven't lost
> much.

I'm getting pretty consistently. I can see the full pipeline, but not
the single logs. I tried with both Firefox and Chrome, I also tried
from home (just to check for something like firewall issues), always
error 500.

> But also, I've ran it a couple more times and it is some regression.
> Staging reliably passes while staging+this series fails.
>
> Unfortunately I don't have any more info besides it hangs before
> printing anything on serial or VGA. Maybe it hanging only on Intel but
> not AMD is some hint? Or maybe it's some memory layout or firmware
> differences that matter here (bootloader is exactly the same)?
> FWIW some links:
> successful staging run on ADL: https://gitlab.com/xen-project/people/marm=
arek/xen/-/jobs/7980146338
> failed staging+this run on ADL: https://gitlab.com/xen-project/people/mar=
marek/xen/-/jobs/7980330394
> successful staging run on Zen3+: https://gitlab.com/xen-project/people/ma=
rmarek/xen/-/jobs/7980146359
> successful staging+this run on Zen3+: https://gitlab.com/xen-project/peop=
le/marmarek/xen/-/jobs/7980146359
>

Furthermore, I tried with 2 additional machines in our Lab, one Intel,
another AMD, both working for me.
Either your compiler did something different or something special on
the firmware.

I could try downloading your executables and machines there, but as I
said, I'm getting error 500 (not sure if we package artifacts).

Can you try without last commit ?

Frediano

> > > It does pass on Zen 3+ runners.
> > >
> > > Since there were some issues with the ADL runner today on plain stagi=
ng,
> > > I'm not 100% sure if it isn't some infrastructure issue yet. But the
> > > symptoms look different than usual infra issues (and different than
> > > todays failures on staging), so I think it's more likely an issue wit=
h
> > > the patches here.
> > >
> > > > Changes since v1, more details in specific commits:
> > > > - style updates;
> > > > - comments and descriptions improvements;
> > > > - other improvements.
> > > >
> > > > Changes since v2:
> > > > - rebased on master, resolved conflicts;
> > > > - add comment on trampoline section.
> > > >
> > > > Changes since v3:
> > > > - changed new function name;
> > > > - declare efi_multiboot2 in a separate header;
> > > > - distinguish entry point from using magic number;
> > > > - other minor changes (see commens in commits).
> > > >
> > > > Changes since v4:
> > > > - rebase on staging;
> > > > - set %fs and %gs as other segment registers;
> > > > - style and other changes.
> > > >
> > > > Changes since v5:
> > > > - fixed a typo.
> > > >
> > > > Changes since v6:
> > > > - remove merged patch;
> > > > - comment and style;
> > > > - change some pointer checks to avoid overflows;
> > > > - rename parse-mbi2.c to mbi2.c.
> > > >
> > > > Frediano Ziglio (2):
> > > >   x86/boot: Rewrite EFI/MBI2 code partly in C
> > > >   x86/boot: Improve MBI2 structure check
> > > >
> > > >  xen/arch/x86/boot/head.S       | 146 +++++++----------------------=
----
> > > >  xen/arch/x86/efi/Makefile      |   1 +
> > > >  xen/arch/x86/efi/efi-boot.h    |   7 +-
> > > >  xen/arch/x86/efi/mbi2.c        |  66 +++++++++++++++
> > > >  xen/arch/x86/efi/stub.c        |  10 +--
> > > >  xen/arch/x86/include/asm/efi.h |  18 ++++
> > > >  6 files changed, 123 insertions(+), 125 deletions(-)
> > > >  create mode 100644 xen/arch/x86/efi/mbi2.c
> > > >  create mode 100644 xen/arch/x86/include/asm/efi.h
> > > >

