Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78C7A99A729
	for <lists+xen-devel@lfdr.de>; Fri, 11 Oct 2024 17:06:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.817207.1231286 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1szHDq-0001CV-GW; Fri, 11 Oct 2024 15:06:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 817207.1231286; Fri, 11 Oct 2024 15:06:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1szHDq-0001Ah-Dk; Fri, 11 Oct 2024 15:06:30 +0000
Received: by outflank-mailman (input) for mailman id 817207;
 Fri, 11 Oct 2024 15:06:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XZOt=RH=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1szHDp-00012f-88
 for xen-devel@lists.xenproject.org; Fri, 11 Oct 2024 15:06:29 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6397bb29-87e2-11ef-99a2-01e77a169b0f;
 Fri, 11 Oct 2024 17:06:27 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a994cd82a3bso300427066b.2
 for <xen-devel@lists.xenproject.org>; Fri, 11 Oct 2024 08:06:27 -0700 (PDT)
Received: from localhost ([217.156.233.154]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a99a7f23377sm219264666b.47.2024.10.11.08.06.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Oct 2024 08:06:26 -0700 (PDT)
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
X-Inumbo-ID: 6397bb29-87e2-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1728659187; x=1729263987; darn=lists.xenproject.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0FgNzPuOpge8q+y7tFl/QWEN96EmrxUGmzV32bQ0MlM=;
        b=ITAxrdHpixoKOD9diyKOp+JLg33lBzZ4tMwWT+Q5yd6Xm81Tg/BHpZX/uVSQCWc8/V
         U4hhOLBNQx8a8++4m1Ls7tyzvARBUnfyu6bgzNWI9fpga1N/UPfRmGFTaZNWJlg8mGkU
         a/GEZgQihmnvsaxB6MH8Khr8bYTcEuQHSBO10=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728659187; x=1729263987;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0FgNzPuOpge8q+y7tFl/QWEN96EmrxUGmzV32bQ0MlM=;
        b=h28DdHXYDWUsyOUOaYGcOiHT7/SygQrhThTWtUqgjHedlher5lL3bljPCWBb1MW8BB
         qNpAhLyDreWEU6xyOyOotZgm3VXBk0QtCoMUvLPWytrn9hQCTb/STcTf/x5D3buKXC1J
         VWM1iopaYqxhFNpw8euKhPr8ZJnObe4zznNiKPLhezgFtpe5r+KLN1CHV8L052H5UxyH
         nsMPshlQOX+9UL0SmZJ3S9dem5fV5INP7dkNak4f9eUeqpITK32afoTc3iX274VSzO53
         xBmVmbUnnFRPmWjQ68RXT/5WO5c/KlwmAntdJqqiaZHSM8+JbjnlkaoH4rg+QxIfFzyr
         Lqlg==
X-Gm-Message-State: AOJu0Yw/mu4QIfoXbtm3ARaaYbJ5lfnQwMOPuAWM5JcXlHPcqHVuoO6q
	gxtELEuMEYtVscIaSqKlDryziLop/bL+Q4UbE7BvznQ4LqvyoxlHdL+L4LeJB5o=
X-Google-Smtp-Source: AGHT+IHC1fmAdAA18V4kc7GATzfoadqQXE2XshRYC/yZYK3HQcxruOxIuDElkkRkYQgd+3jjQCkmlg==
X-Received: by 2002:a17:907:7fa1:b0:a99:6363:8a21 with SMTP id a640c23a62f3a-a99b93a78eemr257721766b.11.1728659186895;
        Fri, 11 Oct 2024 08:06:26 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 11 Oct 2024 16:06:25 +0100
Message-Id: <D4T2JEKDK7KE.6N9GUPZMAVPC@cloud.com>
To: "Frediano Ziglio" <frediano.ziglio@cloud.com>, "Andrew Cooper"
 <andrew.cooper3@citrix.com>
Cc: <xen-devel@lists.xenproject.org>, "Jan Beulich" <jbeulich@suse.com>,
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v3 5/5] x86/boot: Clarify comment
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
X-Mailer: aerc 0.18.2
References: <20241011085244.432368-1-frediano.ziglio@cloud.com>
 <20241011085244.432368-6-frediano.ziglio@cloud.com>
 <uvlmtx752sl45xmsy7o2unxa7rxwwen7eu4lutszfsoprre4sj@b5wre6lirrpf>
 <CACHz=ZgUbDEJOo0f5SBzOZCVDNkaGBrbkBAPSND8Sby0bkJ8+Q@mail.gmail.com>
 <wbpdfwa3hgjqkixl7usy7ta3r4337txb5ppvj74oat2no5wk52@sisyzgauolhq>
 <48f0d04a-f1e8-4c00-b71a-42fe035a3d0f@citrix.com>
 <CACHz=ZgRPEWYK8hh-mi+308gYEBbzq=aUE6ic8O1ONeV29-5mQ@mail.gmail.com>
In-Reply-To: <CACHz=ZgRPEWYK8hh-mi+308gYEBbzq=aUE6ic8O1ONeV29-5mQ@mail.gmail.com>

On Fri Oct 11, 2024 at 2:58 PM BST, Frediano Ziglio wrote:
> On Fri, Oct 11, 2024 at 2:38=E2=80=AFPM Andrew Cooper <andrew.cooper3@cit=
rix.com> wrote:
> >
> > On 11/10/2024 2:28 pm, Alejandro Vallejo wrote:
> > > On Fri, Oct 11, 2024 at 02:08:37PM +0100, Frediano Ziglio wrote:
> > >> On Fri, Oct 11, 2024 at 1:56=E2=80=AFPM Alejandro Vallejo
> > >> <alejandro.vallejo@cloud.com> wrote:
> > >>> On Fri, Oct 11, 2024 at 09:52:44AM +0100, Frediano Ziglio wrote:
> > >>>> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
> > >>>> ---
> > >>>>  xen/arch/x86/boot/reloc.c | 2 +-
> > >>>>  1 file changed, 1 insertion(+), 1 deletion(-)
> > >>>>
> > >>>> diff --git a/xen/arch/x86/boot/reloc.c b/xen/arch/x86/boot/reloc.c
> > >>>> index e50e161b27..e725cfb6eb 100644
> > >>>> --- a/xen/arch/x86/boot/reloc.c
> > >>>> +++ b/xen/arch/x86/boot/reloc.c
> > >>>> @@ -65,7 +65,7 @@ typedef struct memctx {
> > >>>>      /*
> > >>>>       * Simple bump allocator.
> > >>>>       *
> > >>>> -     * It starts from the base of the trampoline and allocates do=
wnwards.
> > >>>> +     * It starts on top of space reserved for the trampoline and =
allocates downwards.
> > >>> nit: Not sure this is much clearer. The trampoline is not a stack (=
and even if
> > >>> it was, I personally find "top" and "bottom" quite ambiguous when i=
t grows
> > >>> backwards), so calling top to its lowest address seems more confusi=
ng than not.
> > >>>
> > >>> If anything clarification ought to go in the which direction it tak=
es. Leaving
> > >>> "base" instead of "top" and replacing "downwards" by "backwards" to=
 make it
> > >>> crystal clear that it's a pointer that starts where the trampoline =
starts, but
> > >>> moves in the opposite direction.
> > >>>
> > >> Base looks confusing to me, but surely that comment could be confusi=
ng.
> > >> For the trampoline 64 KB are reserved. Last 4 KB are used as a norma=
l
> > >> stack (push/pop/call/whatever), first part gets a copy of the
> > >> trampoline code/data (about 6 Kb) the rest (so 64 - 4 - ~6 =3D ~54 k=
b)
> > >> is used for the copy of MBI information. That "rest" is what we are
> > >> talking about here.
> > > Last? From what I looked at it seems to be the first 12K.
> > >
> > >    #define TRAMPOLINE_STACK_SPACE  PAGE_SIZE
> > >    #define TRAMPOLINE_SPACE        (KB(64) - TRAMPOLINE_STACK_SPACE)
> > >
> > > To put it another way, with left=3Dlo-addr and right=3Dhi-addr. The c=
ode seems to
> > > do this...
> > >
> > >  |<--------------64K-------------->|
> > >  |<-----12K--->|                   |

s/12K/4K/

My brain merged the 12bits in the wrong place. Too much bit twiddling.

> > >  +-------------+-----+-------------+
> > >  | stack-space | mbi | trampoline  |
> > >  +-------------+-----+-------------+
> > >                ^  ^
> > >                |  |
> > >                |  +-- copied Multiboot info + modules
> > >                +----- initial memctx.ptr
> > >
> > > ... with the stack growing backwards to avoid overflowing onto mbi.
> > >
> > > Or am I missing something?
> >
> > So I was hoping for some kind of diagram like this, to live in
> > arch/x86/include/asm/trampoline.h with the other notes about the trampo=
line.
> >
> > But, is that diagram accurate?  Looking at
>
>        /* Switch to low-memory stack which lives at the end of
> trampoline region. */
>        mov     sym_esi(trampoline_phys), %edi
>        lea     TRAMPOLINE_SPACE+TRAMPOLINE_STACK_SPACE(%edi),%esp
>        lea     trampoline_boot_cpu_entry-trampoline_start(%edi),%eax
>        pushl   $BOOT_CS32
>        push    %eax
>
>        /* Copy bootstrap trampoline to low memory, below 1MB. */
>        lea     sym_esi(trampoline_start), %esi
>        mov     $((trampoline_end - trampoline_start) / 4),%ecx
>        rep movsl
>
> So, from low to high
> - trampoline code/data (%edi at beginning of copy is trampoline_phys,
> %esi is trampoline_start)
> - space (used for MBI copy)
> - stack (%esp is set to trampoline_phys + TRAMPOLINE_SPACE +
> TRAMPOLINE_STACK_SPACE)
>
> Frediano

So it's reversed from what I thought

 |<--------------64K-------------->|
 |                   |<-----4K---->|
 +-------------+-----+-------------+
 |  text-(ish) | mbi | stack-space |
 +-------------+-----+-------------+
                  ^                ^
                  |                |
                  |                +-- initial memctx.ptr
                  +------------------- copied Multiboot info + modules


Your version of the comment is a definite improvement over the nonsense tha=
t
was there before. Sorry for the noise :)

Cheers,
Alejandro

