Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C94A8190AA
	for <lists+xen-devel@lfdr.de>; Tue, 19 Dec 2023 20:24:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.657107.1025815 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFfgX-0000H1-N1; Tue, 19 Dec 2023 19:23:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 657107.1025815; Tue, 19 Dec 2023 19:23:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFfgX-0000Dw-Jr; Tue, 19 Dec 2023 19:23:21 +0000
Received: by outflank-mailman (input) for mailman id 657107;
 Tue, 19 Dec 2023 19:18:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hvN/=H6=google.com=samitolvanen@srs-se1.protection.inumbo.net>)
 id 1rFfc3-0006RU-Po
 for xen-devel@lists.xenproject.org; Tue, 19 Dec 2023 19:18:43 +0000
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com
 [2607:f8b0:4864:20::b2e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6aa50da4-9ea3-11ee-9b0f-b553b5be7939;
 Tue, 19 Dec 2023 20:18:40 +0100 (CET)
Received: by mail-yb1-xb2e.google.com with SMTP id
 3f1490d57ef6-db538b07865so4027589276.2
 for <xen-devel@lists.xenproject.org>; Tue, 19 Dec 2023 11:18:41 -0800 (PST)
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
X-Inumbo-ID: 6aa50da4-9ea3-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1703013520; x=1703618320; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vk2WOblYJMsl3hzTJZL7x+a3eKwopbV7abftu0jaO3o=;
        b=rxMVh0fwbuxkgPJgXeK7OdgskOb8ajIkS09qt2nLalEVuAocpF3k5I7iWbN8av29Kk
         1y8t7HW+91SuLIC4egbADgea+AKbTxIH35aWV78vsvLHJfhsQ62QbS68+t2pTDj1Aeme
         mD/wrfDys5DM2JHCt0KXqvTzbr4e5yPb/67D6ZfxNvTqxKl5ToGlgVcWgpxGU5TfX9/e
         SXDpcVl1NsPxDory5c6PhaVZhmS/Q7tQtGu0+BStzHJScUXtsR+bCcCVvelvF6tR1nrw
         qt9pj8tbVsns+G1dT9v+/82b7fvb3+nGAo+6nfH2R5cvgvvS1uaEv3vspxgBz+S69YQi
         P8zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703013520; x=1703618320;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vk2WOblYJMsl3hzTJZL7x+a3eKwopbV7abftu0jaO3o=;
        b=gVb69KwdCLbUg1HYe7ZezwflcRKTMGUqduQTN02TZCcl18IvAMxjgQAw0G7iOV1Y30
         6SLvmtDN480hfVtGaBMikKWNgZ5QibdZUFLiMZ4tuq7yasKzl77txxq398JEAyGu+lcu
         61B9Jolptal1dvI/1IjM4eJkPNZVyzVP7RP26FaaVG9XVEvPP8mGsZM0DzFT8dzZlXgf
         Jd75WEicINTdUL1siyYU4o6GyNNi+4v9Q4Y01gpmjcPmaRxir77uoE1fxPULHx3K+qe6
         L6p4oF2fYY2bEKA86+XWyqlzFmZ+acfozBFEgOJbfxym5vDPSIcm6cnkt+N8C/Zr/wYA
         6LnA==
X-Gm-Message-State: AOJu0YwmC90kpmeGbPQtLC6JnEgF8BwaKlvVOXPIU9ma5QYTDhU/GcY1
	CIYP+3sk+7CJIa8EEuXO5dP7nuzzMB5Zh5vJRq/Ibw==
X-Google-Smtp-Source: AGHT+IEQnJH2FyDceXOzOBMy4ilQPUAbQxXDL6OLSAh4zACKDqdNbLqCjwWUh4R2wa3Q2YxVRYIHrhk3t3bA+xnDWvc=
X-Received: by 2002:a25:fc20:0:b0:dbc:dea7:19a8 with SMTP id
 v32-20020a25fc20000000b00dbcdea719a8mr6143146ybd.121.1703013520291; Tue, 19
 Dec 2023 11:18:40 -0800 (PST)
MIME-Version: 1.0
References: <202312191507.348721d2-oliver.sang@intel.com> <20231219095821.GAZYFpPUSKexZAcl05@fat_crate.local>
 <CAHk-=wimbX8UF6ECo53Hm4Vz0tCC7jjN9e3tEhZfoEtsxyfU-A@mail.gmail.com>
In-Reply-To: <CAHk-=wimbX8UF6ECo53Hm4Vz0tCC7jjN9e3tEhZfoEtsxyfU-A@mail.gmail.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Tue, 19 Dec 2023 11:18:02 -0800
Message-ID: <CABCJKufi2_BcSwc+j=L9VMwGVteSFX509RO6QCC3g-ZtRo5cGQ@mail.gmail.com>
Subject: Re: [linus:master] [x86/entry] be5341eb0d: WARNING:CPU:#PID:#at_int80_emulation
To: Linus Torvalds <torvalds@linuxfoundation.org>
Cc: Borislav Petkov <bp@alien8.de>, kernel test robot <oliver.sang@intel.com>, 
	Thomas Gleixner <tglx@linutronix.de>, oe-lkp@lists.linux.dev, lkp@intel.com, 
	linux-kernel@vger.kernel.org, Dave Hansen <dave.hansen@linux.intel.com>, 
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, xen-devel@lists.xenproject.org, 
	Kees Cook <keescook@chromium.org>, Peter Zijlstra <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 19, 2023 at 10:21=E2=80=AFAM Linus Torvalds
<torvalds@linuxfoundation.org> wrote:
>
> On Tue, 19 Dec 2023 at 01:58, Borislav Petkov <bp@alien8.de> wrote:
> >
> > Looking at the dmesg, I think you missed the most important part - the
> > preceding line:
> >
> > [   13.480504][   T48] CFI failure at int80_emulation+0x67/0xb0 (target=
: sys_ni_posix_timers+0x0/0x70; expected type: 0xb02b34d9)
> >                         ^^^^^^^^^^^
>
> So I think the issue here is that sys_ni_posix_timers is just linker
> alias that is used for any non-implemented posix timer system call.
>
> See:
>
>   #define __SYS_NI(abi, name)                                            =
 \
>         SYSCALL_ALIAS(__##abi##_##name, sys_ni_posix_timers);
>
> and this all worked fine when the actual call to this was done in
> assembly code that happily just called that function directly and
> didn't care about any argument types.

Yes, that's exactly the issue.

> But commit be5341eb0d43 ("x86/entry: Convert INT 0x80 emulation to
> IDTENTRY") moved that call from assembly into C, and in the process
> ended up enabling CFI for it all, and now the compiler will check that
> the function types match. Which they don't, because we use that dummy
> function (I don't think they do in general).
>
> I don't know what the best fix is. Either CFI should be turned off for
> that call, or we should make sure to generate those NI system calls
> with the proper types.

Probably the easiest fix would be to use SYSCALL_DEFINE0 for
sys_ni_posix_timers, and for architectures that implement syscall
wrappers, change sys_ni_posix_timers references to
__<abi>_sys_ni_posix_timers.

Something like this should fix the issue for x86, but it looks like
arm64, riscv, and s390 would need similar syscall wrapper changes:

diff --git a/arch/x86/include/asm/syscall_wrapper.h
b/arch/x86/include/asm/syscall_wrapper.h
index fd2669b1cb2d..ed38265cad27 100644
--- a/arch/x86/include/asm/syscall_wrapper.h
+++ b/arch/x86/include/asm/syscall_wrapper.h
@@ -87,7 +87,7 @@ extern long __ia32_sys_ni_syscall(const struct pt_regs *r=
egs);
        }

 #define __SYS_NI(abi, name)                                            \
-       SYSCALL_ALIAS(__##abi##_##name, sys_ni_posix_timers);
+       SYSCALL_ALIAS(__##abi##_##name, __##abi##_sys_ni_posix_timers);

 #ifdef CONFIG_X86_64
 #define __X64_SYS_STUB0(name)                                          \
diff --git a/kernel/time/posix-stubs.c b/kernel/time/posix-stubs.c
index 828aeecbd1e8..d58f976ec926 100644
--- a/kernel/time/posix-stubs.c
+++ b/kernel/time/posix-stubs.c
@@ -22,7 +22,7 @@
 #include <asm/syscall_wrapper.h>
 #endif

-asmlinkage long sys_ni_posix_timers(void)
+SYSCALL_DEFINE0(ni_posix_timers)
 {
        pr_err_once("process %d (%s) attempted a POSIX timer syscall "
                    "while CONFIG_POSIX_TIMERS is not set\n",

Sami

