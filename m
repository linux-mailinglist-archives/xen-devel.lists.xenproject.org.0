Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 419689A1E21
	for <lists+xen-devel@lfdr.de>; Thu, 17 Oct 2024 11:21:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.820468.1233961 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1Mg8-0004eV-F2; Thu, 17 Oct 2024 09:20:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 820468.1233961; Thu, 17 Oct 2024 09:20:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1Mg8-0004bq-CM; Thu, 17 Oct 2024 09:20:20 +0000
Received: by outflank-mailman (input) for mailman id 820468;
 Thu, 17 Oct 2024 09:20:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZcP3=RN=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1t1Mg6-0004bk-Fk
 for xen-devel@lists.xenproject.org; Thu, 17 Oct 2024 09:20:18 +0000
Received: from mail-oo1-xc31.google.com (mail-oo1-xc31.google.com
 [2607:f8b0:4864:20::c31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 05b674cf-8c69-11ef-a0be-8be0dac302b0;
 Thu, 17 Oct 2024 11:20:17 +0200 (CEST)
Received: by mail-oo1-xc31.google.com with SMTP id
 006d021491bc7-5e7ae4c504fso385168eaf.1
 for <xen-devel@lists.xenproject.org>; Thu, 17 Oct 2024 02:20:17 -0700 (PDT)
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
X-Inumbo-ID: 05b674cf-8c69-11ef-a0be-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1729156816; x=1729761616; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tRRdHUCI6TO5aNDHIH9xZe1wa7+CvVleKjs1UzB58oY=;
        b=XSinDvEC8gs/U+ddMD04Ul5dPjfOS1qZ7HvrbTjq6QORvUVebLCJtH78CCX7paauHP
         ksqDO8ErLTDsp8G78Dq0VjcHdzet1YAXXCBQsJOuzQYFPA9K7uuDrGT6fla8H/xSjcUr
         UlvBvvnnmObDn6kZV7WCAx+oGjVpzkK8jKFU4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729156816; x=1729761616;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tRRdHUCI6TO5aNDHIH9xZe1wa7+CvVleKjs1UzB58oY=;
        b=ulAcNZeRJyirAkU3RDucWFljYjyF/fEhNUHzYE/L2OSOczfvkGXZubbpxaet8ZMbiT
         5Rkvy8+akbPpyp+86sV6yvwW5ONULKCwBjRxwHA/K9yWuKjvDv6YxDQ8UuHkwtPeoUoT
         atL4MVR/VrVZQ94eVfSoA/S10CCB/7XgmU1rdJ0iMzLmYl+cmWtRSnHpo6fJLgO4nqZ0
         d5+O7BayE6BYqxCtLGp760nezrWvePuHWJcgSCm/6E3LF+nsYVNCCciuwCsTG7OzUh7l
         /eOFtObVBoDKBbLXnwCmFDmcJTGuhm6IbOB6n4DHu23dlA4ekeFO22uumnIvR/GsPxFj
         AmZg==
X-Gm-Message-State: AOJu0YwgWrtt1HOrYlQLX2ViyHnBh9afrEqGPPOkfDMTuP033Jw9tJOm
	rbtmUPnWP09HbPVMAPb3wbLIrY4sxSF/mYEwxEr89azC6DNUoY3TctroqXgGWD3IkzyFlEwPWym
	L2u15Te0+8C8LQm0FRTJNpceE5fVHxKQvlm7Utw==
X-Google-Smtp-Source: AGHT+IGeALP8gUxnhZwe8KsP9uDxzavZZ8aNOkLVSMkNSLoKgZ0N37+jq1WzGBsDVhyCzrs7H+ytAXTxnBwgKJ/BPHE=
X-Received: by 2002:a4a:ee12:0:b0:5eb:6c26:1ca0 with SMTP id
 006d021491bc7-5eb6c2621aemr1693317eaf.1.1729156816096; Thu, 17 Oct 2024
 02:20:16 -0700 (PDT)
MIME-Version: 1.0
References: <20241016092154.1493035-1-frediano.ziglio@cloud.com>
 <821ac8cc-a0ac-412b-8069-73c52541b70b@citrix.com> <CACHz=Zj9m2tkPPbtJuCT5g_NtDRA3iMPBzxM8R5Jxp1ofVc8oQ@mail.gmail.com>
In-Reply-To: <CACHz=Zj9m2tkPPbtJuCT5g_NtDRA3iMPBzxM8R5Jxp1ofVc8oQ@mail.gmail.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Thu, 17 Oct 2024 10:20:05 +0100
Message-ID: <CACHz=ZjvgZHvP9G382Mc2kR6PSJJnTyPY9Hf40dE7rCy734rvw@mail.gmail.com>
Subject: Re: lib32 followup (visibility issue and/or toolchain bug?)
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
	"Daniel P. Smith" <dpsmith@apertussolutions.com>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 16, 2024 at 3:53=E2=80=AFPM Frediano Ziglio
<frediano.ziglio@cloud.com> wrote:
>
> On Wed, Oct 16, 2024 at 2:30=E2=80=AFPM Andrew Cooper <andrew.cooper3@cit=
rix.com> wrote:
> >
> > Hello,
> >
> > Preempting some future work I'm expecting to arrive, I had a go at usin=
g
> > __builtin_*() in obj32.
> >
> > This is formed of 2 patches on top of this series:
> > https://xenbits.xen.org/gitweb/?p=3Dpeople/andrewcoop/xen.git;a=3Dshort=
log;h=3Drefs/heads/xen-lib32
> >
>
> You are confident we'll have a lot of shared code to need an
> additional "lib32" in the Makefile!
> I would personally stick with obj32.
> Note that file should be strlen.c, not strlen.32.c, otherwise you are
> possibly going to pick up the general rule and not the one in the
> Makefile (but maybe is what you wanted).
>
> > Patch 1 introduces lib32 beside obj32, with strlen() being the first
> > broken-out function, and patch 2 swaps to __builtin_strlen().
> >
> > Both compile, but the difference that patch 2 introduces was unexpected=
.
> >
> > With just lib32, and taking strsubcmp() as an example, we get:
> >
> > 00000000 <strsubcmp>:
> >    0:        83 ec 0c                 sub    $0xc,%esp
> >    3:        89 5c 24 04              mov    %ebx,0x4(%esp)
> >    7:        89 74 24 08              mov    %esi,0x8(%esp)
> >    b:        89 c6                    mov    %eax,%esi
> >    d:        89 d3                    mov    %edx,%ebx
> >    f:        89 d0                    mov    %edx,%eax
> >   11:    /-- e8 fc ff ff ff           call   12 <strsubcmp+0x12>
> >             12: R_386_PC32    strlen
> >   16:        89 c1                    mov    %eax,%ecx
> >   18:        89 da                    mov    %ebx,%edx
> >   1a:        89 f0                    mov    %esi,%eax
> >   1c:    /-- e8 fc ff ff ff           call   1d <strsubcmp+0x1d>
> >             1d: R_386_PC32    .text.strncmp
> >   21:        8b 5c 24 04              mov    0x4(%esp),%ebx
> >   25:        8b 74 24 08              mov    0x8(%esp),%esi
> >   29:        83 c4 0c                 add    $0xc,%esp
> >   2c:        c3                       ret
> >
> > which all seems fine.  We get a plain PC32 relocation to strlen (which
> > is now in the separate library).
> >
> > However, with patch 2 in place (simply swapping the plain extern for
> > __builtin_strlen(), we now get:
> >
> > 00000000 <strsubcmp>:
> >    0:        83 ec 0c                 sub    $0xc,%esp
> >    3:        89 1c 24                 mov    %ebx,(%esp)
> >    6:        89 74 24 04              mov    %esi,0x4(%esp)
> >    a:        89 7c 24 08              mov    %edi,0x8(%esp)
> >    e:    /-- e8 fc ff ff ff           call   f <strsubcmp+0xf>
> >             f: R_386_PC32    __x86.get_pc_thunk.bx
> >   13:        81 c3 02 00 00 00        add    $0x2,%ebx
> >             15: R_386_GOTPC    _GLOBAL_OFFSET_TABLE_
> >   19:        89 c7                    mov    %eax,%edi
> >   1b:        89 d6                    mov    %edx,%esi
> >   1d:        89 d0                    mov    %edx,%eax
> >   1f:    /-- e8 fc ff ff ff           call   20 <strsubcmp+0x20>
> >             20: R_386_PLT32    strlen
>
> PLT means it not declared hidden, otherwise it would have used the
> relative relocation.
> Maybe
>
> size_t strlen(const char *s);
> #define strlen(s) __builtin_strlen(s)
>
> xen/compiler.h is included, so all declaration should get the hidden
> by default ? Or add __attribute__((visibility("hidden"))) explicitly.
>
> >   24:        89 c1                    mov    %eax,%ecx
> >   26:        89 f2                    mov    %esi,%edx
> >   28:        89 f8                    mov    %edi,%eax
> >   2a:    /-- e8 fc ff ff ff           call   2b <strsubcmp+0x2b>
> >             2b: R_386_PC32    .text.strncmp
> >   2f:        8b 1c 24                 mov    (%esp),%ebx
> >   32:        8b 74 24 04              mov    0x4(%esp),%esi
> >   36:        8b 7c 24 08              mov    0x8(%esp),%edi
> >   3a:        83 c4 0c                 add    $0xc,%esp
> >   3d:        c3                       ret
> >
> >
> > The builtin hasn't managed to optimise away the call to strlen (that's
> > fine).  But, we've ended up spilling %ebx to the stack, calculating the
> > location of the GOT and not using it.
> >
>
> Maybe the ABI for PLT is to have %ebx set to the GOT ? Not sure about it.
>
> > So, as it stands, trying to use __builtin_strlen() results in worse cod=
e
> > generation.  One thing I noticed was that we're not passing
> > -fvisibility=3Dhidden into CFLAGS_x86_32, but fixing that doesn't help
> > either.  We do have the pragma from compiler.h, so I'm out of visibilit=
y
> > ideas.
> >
>
> The -fvisibility=3Dhidden should be overridden by the xen/compiler.h;
> but should be overridden with hidden!
> Maybe strlen is defined by default with another visibility?
> If you generate the assembly, you should see if the strlen symbol gets
> the .hidden bless or not.
>

I did some more experiments, but I didn't manage to fix the issue. It
looks like when __builtin_strlen fallback to calling strlen it uses a
private declaration of strlen. -mregparam argument is taken into
account, but not visibility. I tried to declare strlen as hidden
(checking also preprocessor output to see if other declaration were
present, none found), still the @PLT. I tried to add a "static inline
strlen"... and it was not used.

I found this workaround:

diff --git a/xen/arch/x86/boot/cmdline.c b/xen/arch/x86/boot/cmdline.c
index 80ffd0885e..ac2b0b0a4d 100644
--- a/xen/arch/x86/boot/cmdline.c
+++ b/xen/arch/x86/boot/cmdline.c
@@ -51,7 +51,12 @@ static const char delim_chars_comma[] =3D ", \n\r\t";

#define delim_chars    (delim_chars_comma + 1)

-#define strlen(s) __builtin_strlen(s)
+size_t strlen(const char *s);
+#define strlen(str) \
+  (__extension__ (__builtin_constant_p(str) \
+                 ? __builtin_strlen(str)    \
+                 : strlen(str)))
+

static int strncmp(const char *cs, const char *ct, size_t count)
{
diff --git a/xen/arch/x86/boot/strlen.32.c b/xen/arch/x86/boot/strlen.c
similarity index 100%
rename from xen/arch/x86/boot/strlen.32.c
rename to xen/arch/x86/boot/strlen.c

Frediano

