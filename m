Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE00599A591
	for <lists+xen-devel@lfdr.de>; Fri, 11 Oct 2024 15:58:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.817121.1231236 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1szGAA-00005X-Ib; Fri, 11 Oct 2024 13:58:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 817121.1231236; Fri, 11 Oct 2024 13:58:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1szGAA-0008Uf-Fd; Fri, 11 Oct 2024 13:58:38 +0000
Received: by outflank-mailman (input) for mailman id 817121;
 Fri, 11 Oct 2024 13:58:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rkux=RH=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1szGA8-0008UZ-V3
 for xen-devel@lists.xenproject.org; Fri, 11 Oct 2024 13:58:36 +0000
Received: from mail-oa1-x31.google.com (mail-oa1-x31.google.com
 [2001:4860:4864:20::31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e8471608-87d8-11ef-a0bd-8be0dac302b0;
 Fri, 11 Oct 2024 15:58:35 +0200 (CEST)
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-27d0e994ae3so966140fac.3
 for <xen-devel@lists.xenproject.org>; Fri, 11 Oct 2024 06:58:35 -0700 (PDT)
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
X-Inumbo-ID: e8471608-87d8-11ef-a0bd-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1728655114; x=1729259914; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IBDKl3SX4DxvkNYd9S1ez6LqIY+4BE0G3z3I6ZrQlLU=;
        b=fP5zn5ZUBUJvnv++bKxg8u/2J4ogOGTupNg5+UytYSmNFL5b65TmTmMWljADIrHZqv
         Ywy1ROVixURvVICe5aKEKglcJ56Q6DcWUvgl5RLWYcLG1Gxw78bQVtmboct9OYm2L9wj
         3rQXcyAsqSLbVAsQfs0/9zmAEYYtEn9oRLOro=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728655114; x=1729259914;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IBDKl3SX4DxvkNYd9S1ez6LqIY+4BE0G3z3I6ZrQlLU=;
        b=LerMJbTjcjBwmTgj+MQJ8k1e5MKMQv+PdBjW0lc2nGYqLeSa6biNzUAWep8gjxy0Yf
         Uw4Hdio8nGRiy4m1C3iHdZUzT4AmENCU2t77QHRjKE97uf1kbnMfOECIx9xsDnPT2Hpe
         nnSZDKyyLlCbYz8Lq+MJ/OvheNreYvon50xx03OApEZaDXkWskVhTRzbQKm1HccVZ664
         XNOtgCiQpLItZ5gU+KNDSN9xW6ArhjP46bU/tnC10uHQk2MGd0+/h6o8JBozadegK2Ch
         b/vEIiN6DUkIVETwq4mE4Iduht78nwvqbJQKg/dL6ECSHnXdpYFvbqesCCidVH2AqZKF
         HPVA==
X-Forwarded-Encrypted: i=1; AJvYcCXjHKd7c4LTJKzkKPtcylhSrYpk5JncltGEfviWtSkL1hCJ+Ar4EpljYVhXN3jiiKHhWMYvtS3/1Ww=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw2NGec1YRlbpkDQbAF/r2GSA3odOkDRwmhg0nRn5pipoz8xs57
	ignOe8NjhnTZkg6gPUQPX1IKcaKL771Y5RstbUsh0I6pc9viOz4xbwpSwX7wVq1MmyoKoHoEypl
	6k4YdYVzANF1gcqGSNu9Yc3g6bO0Q9DgmqyTwhextaY4RVsyupf4=
X-Google-Smtp-Source: AGHT+IEO0VToe4QSzdkPvb63uR+O1LENxaBkf+VHZAfmBRgnY/amyJQ9Vk8fErvNyslPiEh4VdA5I4wtt+9QPP8kB8Q=
X-Received: by 2002:a05:6870:158d:b0:270:4219:68fe with SMTP id
 586e51a60fabf-2886dd74f10mr1710493fac.1.1728655114653; Fri, 11 Oct 2024
 06:58:34 -0700 (PDT)
MIME-Version: 1.0
References: <20241011085244.432368-1-frediano.ziglio@cloud.com>
 <20241011085244.432368-6-frediano.ziglio@cloud.com> <uvlmtx752sl45xmsy7o2unxa7rxwwen7eu4lutszfsoprre4sj@b5wre6lirrpf>
 <CACHz=ZgUbDEJOo0f5SBzOZCVDNkaGBrbkBAPSND8Sby0bkJ8+Q@mail.gmail.com>
 <wbpdfwa3hgjqkixl7usy7ta3r4337txb5ppvj74oat2no5wk52@sisyzgauolhq> <48f0d04a-f1e8-4c00-b71a-42fe035a3d0f@citrix.com>
In-Reply-To: <48f0d04a-f1e8-4c00-b71a-42fe035a3d0f@citrix.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Fri, 11 Oct 2024 14:58:23 +0100
Message-ID: <CACHz=ZgRPEWYK8hh-mi+308gYEBbzq=aUE6ic8O1ONeV29-5mQ@mail.gmail.com>
Subject: Re: [PATCH v3 5/5] x86/boot: Clarify comment
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>, xen-devel@lists.xenproject.org, 
	Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 11, 2024 at 2:38=E2=80=AFPM Andrew Cooper <andrew.cooper3@citri=
x.com> wrote:
>
> On 11/10/2024 2:28 pm, Alejandro Vallejo wrote:
> > On Fri, Oct 11, 2024 at 02:08:37PM +0100, Frediano Ziglio wrote:
> >> On Fri, Oct 11, 2024 at 1:56=E2=80=AFPM Alejandro Vallejo
> >> <alejandro.vallejo@cloud.com> wrote:
> >>> On Fri, Oct 11, 2024 at 09:52:44AM +0100, Frediano Ziglio wrote:
> >>>> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
> >>>> ---
> >>>>  xen/arch/x86/boot/reloc.c | 2 +-
> >>>>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>>>
> >>>> diff --git a/xen/arch/x86/boot/reloc.c b/xen/arch/x86/boot/reloc.c
> >>>> index e50e161b27..e725cfb6eb 100644
> >>>> --- a/xen/arch/x86/boot/reloc.c
> >>>> +++ b/xen/arch/x86/boot/reloc.c
> >>>> @@ -65,7 +65,7 @@ typedef struct memctx {
> >>>>      /*
> >>>>       * Simple bump allocator.
> >>>>       *
> >>>> -     * It starts from the base of the trampoline and allocates down=
wards.
> >>>> +     * It starts on top of space reserved for the trampoline and al=
locates downwards.
> >>> nit: Not sure this is much clearer. The trampoline is not a stack (an=
d even if
> >>> it was, I personally find "top" and "bottom" quite ambiguous when it =
grows
> >>> backwards), so calling top to its lowest address seems more confusing=
 than not.
> >>>
> >>> If anything clarification ought to go in the which direction it takes=
. Leaving
> >>> "base" instead of "top" and replacing "downwards" by "backwards" to m=
ake it
> >>> crystal clear that it's a pointer that starts where the trampoline st=
arts, but
> >>> moves in the opposite direction.
> >>>
> >> Base looks confusing to me, but surely that comment could be confusing=
.
> >> For the trampoline 64 KB are reserved. Last 4 KB are used as a normal
> >> stack (push/pop/call/whatever), first part gets a copy of the
> >> trampoline code/data (about 6 Kb) the rest (so 64 - 4 - ~6 =3D ~54 kb)
> >> is used for the copy of MBI information. That "rest" is what we are
> >> talking about here.
> > Last? From what I looked at it seems to be the first 12K.
> >
> >    #define TRAMPOLINE_STACK_SPACE  PAGE_SIZE
> >    #define TRAMPOLINE_SPACE        (KB(64) - TRAMPOLINE_STACK_SPACE)
> >
> > To put it another way, with left=3Dlo-addr and right=3Dhi-addr. The cod=
e seems to
> > do this...
> >
> >  |<--------------64K-------------->|
> >  |<-----12K--->|                   |
> >  +-------------+-----+-------------+
> >  | stack-space | mbi | trampoline  |
> >  +-------------+-----+-------------+
> >                ^  ^
> >                |  |
> >                |  +-- copied Multiboot info + modules
> >                +----- initial memctx.ptr
> >
> > ... with the stack growing backwards to avoid overflowing onto mbi.
> >
> > Or am I missing something?
>
> So I was hoping for some kind of diagram like this, to live in
> arch/x86/include/asm/trampoline.h with the other notes about the trampoli=
ne.
>
> But, is that diagram accurate?  Looking at

       /* Switch to low-memory stack which lives at the end of
trampoline region. */
       mov     sym_esi(trampoline_phys), %edi
       lea     TRAMPOLINE_SPACE+TRAMPOLINE_STACK_SPACE(%edi),%esp
       lea     trampoline_boot_cpu_entry-trampoline_start(%edi),%eax
       pushl   $BOOT_CS32
       push    %eax

       /* Copy bootstrap trampoline to low memory, below 1MB. */
       lea     sym_esi(trampoline_start), %esi
       mov     $((trampoline_end - trampoline_start) / 4),%ecx
       rep movsl

So, from low to high
- trampoline code/data (%edi at beginning of copy is trampoline_phys,
%esi is trampoline_start)
- space (used for MBI copy)
- stack (%esp is set to trampoline_phys + TRAMPOLINE_SPACE +
TRAMPOLINE_STACK_SPACE)

Frediano

