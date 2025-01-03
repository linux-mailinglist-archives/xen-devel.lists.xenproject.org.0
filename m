Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83A06A00DA6
	for <lists+xen-devel@lfdr.de>; Fri,  3 Jan 2025 19:33:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.864620.1275830 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTmTn-0005pa-Jh; Fri, 03 Jan 2025 18:33:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 864620.1275830; Fri, 03 Jan 2025 18:33:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTmTn-0005nS-GO; Fri, 03 Jan 2025 18:33:03 +0000
Received: by outflank-mailman (input) for mailman id 864620;
 Fri, 03 Jan 2025 18:33:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ayzF=T3=gmail.com=geert.uytterhoeven@srs-se1.protection.inumbo.net>)
 id 1tTmTm-0005nM-QG
 for xen-devel@lists.xenproject.org; Fri, 03 Jan 2025 18:33:02 +0000
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com
 [209.85.217.54]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 28cc483f-ca01-11ef-99a4-01e77a169b0f;
 Fri, 03 Jan 2025 19:33:00 +0100 (CET)
Received: by mail-vs1-f54.google.com with SMTP id
 ada2fe7eead31-4afe6a8d2e1so6618044137.1
 for <xen-devel@lists.xenproject.org>; Fri, 03 Jan 2025 10:33:00 -0800 (PST)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com.
 [209.85.217.52]) by smtp.gmail.com with ESMTPSA id
 ada2fe7eead31-4b2bf98ee73sm5781514137.1.2025.01.03.10.32.55
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Jan 2025 10:32:56 -0800 (PST)
Received: by mail-vs1-f52.google.com with SMTP id
 ada2fe7eead31-4aff1c57377so6704892137.0
 for <xen-devel@lists.xenproject.org>; Fri, 03 Jan 2025 10:32:55 -0800 (PST)
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
X-Inumbo-ID: 28cc483f-ca01-11ef-99a4-01e77a169b0f
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735929178; x=1736533978;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=puPJTtoESUJcppwT4hmEcdnIo/YZOWUajNX8x0J/UiA=;
        b=LYyoG0HVHOiU+3LRQhANvPHD1A7RhU7AVVqi6TZh7SfhutSYiKJXfTnSTdOU4iw3Ws
         akdtLO/AKGiAQFCA456YBDwHVvxSoBPd95alwXOvlbTaKZqHVZx4GXJSeIJPKHyB2258
         NHJV248x9xj2alsIooKChCj9kOPpvtFJ9b/w6bh5bLt24jXi6YTnt12HjrD6PrjjcFpw
         mVH4ddrX3V6t4fMOh3Qoga1VIL16k0g7QjwevIOXYCqgJjrOTrk0RV07luvDRP/p/WtS
         NVSnKrY8r6ez4rJsCDNstRBHZPMUIQDfykc9gBHqJz3D4ly2X1TzyR+mJXqgkFrYs8tF
         tmVA==
X-Forwarded-Encrypted: i=1; AJvYcCU6+O/wLtUXl/ix2HVJNDCXw6JHiKjdPUPhCfwWiH2PipNg0PN1cs+5JzIDHPmogJ30Gi+807H1IFk=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxim0HztQMy+UYr1uYTwOLJmo2jp3whj7MXpamP4YpcBnnitRoW
	bb24Soz84V94WKo/wOYeRaEP5GNisPlLoQpvpRIENG2e9K6TkXF1A6OfSzmLosQ=
X-Gm-Gg: ASbGncvee3g5pyn50KGfZtiEU2aJOR6sMigEbsgDSgBCuZFrQwFGVyFhzvIj1WihmFs
	yHx7k+iRCcPxQTusw94iKdJDeRENK3VQictPq/AbkUnIGSsanVaO3Vrj80Pl8KyDfWefimHTAK3
	q1N4efRtpW1louOb2++OeW6BjgD5VpF9vBPW9fePHOKzMrGANWqfips0OdP/ZEbZlLkpUneLkmR
	9y047G84evXPnlagDYpo5U6iLyCl9pGsLectfOuDxU1ZIYJsHBMSleIxVtpkJe1aKJN9npN0e28
	zzTal+D0EMAIeR8oChs=
X-Google-Smtp-Source: AGHT+IH6+HqCh6UllxGrBtNLZz6FDQlusgUozrspl2LTSH5UTXbcXg5fOQKXCue3hKqlpAuwzeEO7Q==
X-Received: by 2002:a05:6102:26cf:b0:4af:cb0c:390b with SMTP id ada2fe7eead31-4b2cd718373mr41873162137.7.1735929178101;
        Fri, 03 Jan 2025 10:32:58 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU6hb/Gn6WcD4voUwkvP8wopDrkievfGB6qagZ8w4r2wB3KpkEq63rKhD2CAvFJP85BLZ9fGht5xno=@lists.xenproject.org
X-Received: by 2002:a05:6102:589b:b0:4b2:5c4b:b32a with SMTP id
 ada2fe7eead31-4b2bc1258a6mr38271366137.12.1735929174831; Fri, 03 Jan 2025
 10:32:54 -0800 (PST)
MIME-Version: 1.0
References: <Z2RGfpJkO0z_nKV6@mail-itl> <ab9c27d5-f3f2-4b8a-960d-f880ec136199@suse.com>
 <6bb03333-74ca-4c2c-85a8-72549b85a5b4@suse.com> <Z3aFdrygLF9yK2EK@mail-itl>
 <Z3bg-gvaBEdSIuRW@mail-itl> <08f9604b-df23-4766-a290-ef9daa506f8d@suse.com>
 <Z3brZQmYhx-QTnga@mail-itl> <Z3cs1-wG5WJ9FrAR@mail-itl> <Z3cyhdKu6M1vdBe_@mail-itl>
 <b4b2229f-a139-4cfe-9cb1-e218b7123c08@citrix.com> <Z3gn8OD6a5weneAM@mail-itl>
In-Reply-To: <Z3gn8OD6a5weneAM@mail-itl>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 3 Jan 2025 19:32:43 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX-iMzh+R0-tquz5Jb0Q0dhSOd-f3NmrOzUy_k4xiq_hA@mail.gmail.com>
X-Gm-Features: AbW1kvZZaP-dmLLikfdz34d5LDNGV7YpoF8SIsL5yKm6srCyil7MkqMAFaogJr0
Message-ID: <CAMuHMdX-iMzh+R0-tquz5Jb0Q0dhSOd-f3NmrOzUy_k4xiq_hA@mail.gmail.com>
Subject: Re: Linux 6.13-rc5 Xen HVM with PCI passthrough (USB controller) crash
To: =?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>, 
	xen-devel <xen-devel@lists.xenproject.org>, Mike Rapoport <rppt@kernel.org>, 
	Luis Chamberlain <mcgrof@kernel.org>, Andreas Larsson <andreas@gaisler.com>, 
	Andy Lutomirski <luto@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Borislav Petkov <bp@alien8.de>, Brian Cain <bcain@quicinc.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Christoph Hellwig <hch@lst.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Dinh Nguyen <dinguyen@kernel.org>, Guo Ren <guoren@kernel.org>, Helge Deller <deller@gmx.de>, 
	Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Johannes Berg <johannes@sipsolutions.net>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Kent Overstreet <kent.overstreet@linux.dev>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Mark Rutland <mark.rutland@arm.com>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Matt Turner <mattst88@gmail.com>, 
	Max Filippov <jcmvbkbc@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>, Michal Simek <monstr@monstr.eu>, 
	Oleg Nesterov <oleg@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Peter Zijlstra <peterz@infradead.org>, Richard Weinberger <richard@nod.at>, 
	Russell King <linux@armlinux.org.uk>, Song Liu <song@kernel.org>, 
	Stafford Horne <shorne@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Suren Baghdasaryan <surenb@google.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Thomas Gleixner <tglx@linutronix.de>, Uladzislau Rezki <urezki@gmail.com>, Vineet Gupta <vgupta@kernel.org>, 
	Will Deacon <will@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Marek,

On Fri, Jan 3, 2025 at 7:10=E2=80=AFPM Marek Marczykowski-G=C3=B3recki
<marmarek@invisiblethingslab.com> wrote:
> On Fri, Jan 03, 2025 at 02:00:28AM +0000, Andrew Cooper wrote:
> > On 03/01/2025 12:42 am, Marek Marczykowski-G=C3=B3recki wrote:
> > > On Fri, Jan 03, 2025 at 01:18:31AM +0100, Marek Marczykowski-G=C3=B3r=
ecki wrote:
> > >> On Thu, Jan 02, 2025 at 08:39:16PM +0100, Marek Marczykowski-G=C3=B3=
recki wrote:
> > >>> On Thu, Jan 02, 2025 at 08:17:00PM +0100, J=C3=BCrgen Gro=C3=9F wro=
te:
> > >>>> On 02.01.25 19:54, Marek Marczykowski-G=C3=B3recki wrote:
> > >>>>> There is
> > >>>>> one issue (likely unrelated to this change) - sys-usb (HVM domU w=
ith USB
> > >>>>> controllers passed through) crashes on a system with Raptor Lake =
CPU
> > >>>>> (only, others, including ADL and MTL look fine):
> > >> Correction, it does happen on some others too, just got the crash on=
 the ADL
> > >> system, although looks a bit different ("Corrupted page table at ...=
"):
> > > I've collected some more of them at https://github.com/QubesOS/qubes-=
issues/issues/9681
> > >
> > > Should I start new thread for this? On one hand, it's a different dom=
ain
> > > type (HVM), but on the other hand, many of the crashes are around
> > > loading modules too.
> >
> > https://lore.kernel.org/lkml/20241227072825.1288491-1-rppt@kernel.org/T=
/#t
> > looks relevant.  Probably worth following up.
>
> As responded there, I don't think so, as that series is not part of
> 6.13-rc5. But in the meantime, I bisected it and got this commit:
>
> 5185e7f9f3bd754ab60680814afd714e2673ef88 is the first bad commit
> commit 5185e7f9f3bd754ab60680814afd714e2673ef88
> Author: Mike Rapoport (Microsoft) <rppt@kernel.org>
> Date:   Wed Oct 23 19:27:11 2024 +0300
>
>     x86/module: enable ROX caches for module text on 64 bit
>
>     Enable execmem's cache of PMD_SIZE'ed pages mapped as ROX for module =
text
>     allocations on 64 bit.
>
>     Link: https://lkml.kernel.org/r/20241023162711.2579610-9-rppt@kernel.=
org
>     Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
>     Reviewed-by: Luis Chamberlain <mcgrof@kernel.org>
>     Tested-by: kdevops <kdevops@lists.linux.dev>
>     Cc: Andreas Larsson <andreas@gaisler.com>
>     Cc: Andy Lutomirski <luto@kernel.org>
>     Cc: Ard Biesheuvel <ardb@kernel.org>
>     Cc: Arnd Bergmann <arnd@arndb.de>
>     Cc: Borislav Petkov (AMD) <bp@alien8.de>
>     Cc: Brian Cain <bcain@quicinc.com>
>     Cc: Catalin Marinas <catalin.marinas@arm.com>
>     Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
>     Cc: Christoph Hellwig <hch@lst.de>
>     Cc: Dave Hansen <dave.hansen@linux.intel.com>
>     Cc: Dinh Nguyen <dinguyen@kernel.org>
>     Cc: Geert Uytterhoeven <geert@linux-m68k.org>
>     Cc: Guo Ren <guoren@kernel.org>
>     Cc: Helge Deller <deller@gmx.de>
>     Cc: Huacai Chen <chenhuacai@kernel.org>
>     Cc: Ingo Molnar <mingo@redhat.com>
>     Cc: Johannes Berg <johannes@sipsolutions.net>
>     Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
>     Cc: Kent Overstreet <kent.overstreet@linux.dev>
>     Cc: Liam R. Howlett <Liam.Howlett@Oracle.com>
>     Cc: Mark Rutland <mark.rutland@arm.com>
>     Cc: Masami Hiramatsu (Google) <mhiramat@kernel.org>
>     Cc: Matt Turner <mattst88@gmail.com>
>     Cc: Max Filippov <jcmvbkbc@gmail.com>
>     Cc: Michael Ellerman <mpe@ellerman.id.au>
>     Cc: Michal Simek <monstr@monstr.eu>
>     Cc: Oleg Nesterov <oleg@redhat.com>
>     Cc: Palmer Dabbelt <palmer@dabbelt.com>
>     Cc: Peter Zijlstra <peterz@infradead.org>
>     Cc: Richard Weinberger <richard@nod.at>
>     Cc: Russell King <linux@armlinux.org.uk>
>     Cc: Song Liu <song@kernel.org>
>     Cc: Stafford Horne <shorne@gmail.com>
>     Cc: Steven Rostedt (Google) <rostedt@goodmis.org>
>     Cc: Suren Baghdasaryan <surenb@google.com>
>     Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
>     Cc: Thomas Gleixner <tglx@linutronix.de>
>     Cc: Uladzislau Rezki (Sony) <urezki@gmail.com>
>     Cc: Vineet Gupta <vgupta@kernel.org>
>     Cc: Will Deacon <will@kernel.org>
>     Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
>
>  arch/x86/Kconfig   |  1 +
>  arch/x86/mm/init.c | 37 ++++++++++++++++++++++++++++++++++++-
>  2 files changed, 37 insertions(+), 1 deletion(-)
>
> I'm extending CC...

Do you really think adding all non-Intel maintainers will help fixing
an Intel-specific problem? Please do not do that.
Thanks!

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

