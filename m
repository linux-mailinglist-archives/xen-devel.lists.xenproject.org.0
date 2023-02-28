Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B3276A5E25
	for <lists+xen-devel@lfdr.de>; Tue, 28 Feb 2023 18:21:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.503602.775911 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pX3fL-0003MQ-BE; Tue, 28 Feb 2023 17:21:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 503602.775911; Tue, 28 Feb 2023 17:21:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pX3fL-0003J6-6W; Tue, 28 Feb 2023 17:21:27 +0000
Received: by outflank-mailman (input) for mailman id 503602;
 Tue, 28 Feb 2023 17:21:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YG3a=6Y=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pX3fJ-0003IB-Tu
 for xen-devel@lists.xenproject.org; Tue, 28 Feb 2023 17:21:25 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 52e9fc8c-b78c-11ed-9695-2f268f93b82a;
 Tue, 28 Feb 2023 18:21:23 +0100 (CET)
Received: by mail-lf1-x12e.google.com with SMTP id i28so1443733lfv.0
 for <xen-devel@lists.xenproject.org>; Tue, 28 Feb 2023 09:21:23 -0800 (PST)
Received: from [192.168.8.114] (46.204.108.203.nat.umts.dynamic.t-mobile.pl.
 [46.204.108.203]) by smtp.gmail.com with ESMTPSA id
 s16-20020ac25ff0000000b004cb3e97bff8sm1409793lfg.284.2023.02.28.09.21.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 09:21:21 -0800 (PST)
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
X-Inumbo-ID: 52e9fc8c-b78c-11ed-9695-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=RtlQ5muvjdD0FlQL2RYNDXzuLCtF6tEFzlHWSlX0cK4=;
        b=iAVEdVdS2/gSOBj93x18LcvF7jrAqyPqlDuqd6X3pJXvmGhvUTp661WsQHfG37+lQR
         xZ3EIRFNceCkTttnEWT+S68u/DyEM6egcwgdMZLkGpfkAsJC3NhpaJEmT7640xzKBIjJ
         no45QxL4rSeJ6LfAC7R4xElssvCoUOgbvjk8fSoPx3ykUQNc323CqyaaBVENvyHXaYU+
         Y2gehdzGNUiif8tsX0XEaWukb3s9cbVlOUNZQauVpWRTWYareIb0c5jCjS56lBSPSR1P
         Ke+bIRI1LNoweM1eujdUU8PL8iPufCgLDzDwHNtg2ENpd1QVs0+Sd6aoejo+UlYKSgbx
         m9Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RtlQ5muvjdD0FlQL2RYNDXzuLCtF6tEFzlHWSlX0cK4=;
        b=PO+BCFg2osIiRSaIRpdQGNgsKA0JhH6NuiYWCDgSTRwqADgxq+H7lhapkU6WUGtjGd
         r542eogVVW3ayuTjrHDv7ZIk45tUcUWI+U4E8dQKqN5+iMSQ7UiYWml20fNxurPfljbS
         NhXDBSvcLjeTRuAU6/7ZqceIcPtIu2ivhWXndOOAcNnEf3jvhq/i92xydF4Wjw8ddqPI
         g27Pbs8zMjvPAofo+YvaxSBiIrzCn5ahj8MgvAX8zcKWgmqBE4XGZPGo3z1emO48Sxjv
         duEjbhhvO0Wm5lf47RWbUGMRuCUJLzhyPZOemrvsrIaybHZR9Ig3VOX6zaZ7nMngrlQJ
         0Uew==
X-Gm-Message-State: AO0yUKVefHg/urABJGnJ5FcMRuVEL3Rzfh9YgevrsOlfrsA1+zxCwNZW
	ZF28Bug/X3HwwnQ5dFSGWEI=
X-Google-Smtp-Source: AK7set/qT43gIq99eTrDUnPitzHdjj9fx2zlPfBmSCdb7rpy02yriCkLVmTeK+YoNzsIH3vrU7zb+g==
X-Received: by 2002:a05:6512:1046:b0:4b6:e405:1027 with SMTP id c6-20020a056512104600b004b6e4051027mr1148408lfb.14.1677604882280;
        Tue, 28 Feb 2023 09:21:22 -0800 (PST)
Message-ID: <6735859208c6dcb7320f89664ae298005f70827b.camel@gmail.com>
Subject: Re: [PATCH v3 3/4] xen/arm: switch ARM to use generic
 implementation of bug.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>,  Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>, Bertrand Marquis
 <bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Date: Tue, 28 Feb 2023 19:21:17 +0200
In-Reply-To: <ae96eb36-aeba-86f0-3b72-a8b62f4dce60@xen.org>
References: <cover.1677233393.git.oleksii.kurochko@gmail.com>
	 <d80c136720c156d6ef83f27f1ce8dca5dba5b5a0.1677233393.git.oleksii.kurochko@gmail.com>
	 <f82b8c50-47f2-d8b0-5a2c-60203e5d5e26@xen.org>
	 <ae96eb36-aeba-86f0-3b72-a8b62f4dce60@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0

Hi Julien,

On Sat, 2023-02-25 at 17:05 +0000, Julien Grall wrote:
>=20
>=20
> On 25/02/2023 16:49, Julien Grall wrote:
> > Hi Oleksii,
> >=20
> > On 24/02/2023 11:31, Oleksii Kurochko wrote:
> > > The following changes were made:
> > > * make GENERIC_BUG_FRAME mandatory for ARM
> >=20
> > I have asked in patch #1 but will ask it again because I think this
> > should be recorded in the commit message. Can you outline why it is
> > not=20
> > possible to completely switch to the generic version?
>=20
> I have just tried to remove it on arm64 and it seems to work. This
> was=20
> only tested with GCC 10 though. But given the generic version is not
> not=20
> using the %c modifier, then I wouldn't expect any issue.
>=20
> Cheers,
>=20

I tried to switch ARM to generic implementation.

Here is the patch: [1]

diff --git a/xen/arch/arm/include/asm/bug.h
b/xen/arch/arm/include/asm/bug.h
index e6cc37e1d6..ffb0f569fc 100644
--- a/xen/arch/arm/include/asm/bug.h
+++ b/xen/arch/arm/include/asm/bug.h
@@ -1,8 +1,6 @@
 #ifndef __ARM_BUG_H__
 #define __ARM_BUG_H__
=20
-#include <xen/types.h>
-
 #if defined(CONFIG_ARM_32)
 # include <asm/arm32/bug.h>
 #elif defined(CONFIG_ARM_64)
@@ -11,63 +9,7 @@
 # error "unknown ARM variant"
 #endif
=20
-#define BUG_FRAME_STRUCT
-
-struct bug_frame {
-    signed int loc_disp;    /* Relative address to the bug address */
-    signed int file_disp;   /* Relative address to the filename */
-    signed int msg_disp;    /* Relative address to the predicate (for
ASSERT) */
-    uint16_t line;          /* Line number */
-    uint32_t pad0:16;       /* Padding for 8-bytes align */
-};
-
-#define bug_ptr(b) ((const void *)(b) + (b)->file_disp)
-#define bug_line(b) ((b)->line)
-#define bug_msg(b) ((const char *)(b) + (b)->msg_disp)
-
-/* Many versions of GCC doesn't support the asm %c parameter which
would
- * be preferable to this unpleasantness. We use mergeable string
- * sections to avoid multiple copies of the string appearing in the
- * Xen image. BUGFRAME_run_fn needs to be handled separately.
- */
-#define BUG_FRAME(type, line, file, has_msg, msg) do {              =20
\
-    BUILD_BUG_ON((line) >> 16);                                     =20
\
-    BUILD_BUG_ON((type) >=3D BUGFRAME_NR);                            =20
\
-    asm ("1:"BUG_INSTR"\n"                                          =20
\
-         ".pushsection .rodata.str, \"aMS\", %progbits, 1\n"        =20
\
-         "2:\t.asciz " __stringify(file) "\n"                       =20
\
-         "3:\n"                                                     =20
\
-         ".if " #has_msg "\n"                                       =20
\
-         "\t.asciz " #msg "\n"                                      =20
\
-         ".endif\n"                                                 =20
\
-         ".popsection\n"                                            =20
\
-         ".pushsection .bug_frames." __stringify(type) ", \"a\",
%progbits\n"\
-         "4:\n"                                                     =20
\
-         ".p2align 2\n"                                             =20
\
-         ".long (1b - 4b)\n"                                        =20
\
-         ".long (2b - 4b)\n"                                        =20
\
-         ".long (3b - 4b)\n"                                        =20
\
-         ".hword " __stringify(line) ", 0\n"                        =20
\
-         ".popsection");                                            =20
\
-} while (0)
-
-/*
- * GCC will not allow to use "i"  when PIE is enabled (Xen doesn't set
the
- * flag but instead rely on the default value from the compiler). So
the
- * easiest way to implement run_in_exception_handler() is to pass the
to
- * be called function in a fixed register.
- */
-#define  run_in_exception_handler(fn) do {                          =20
\
-    asm ("mov " __stringify(BUG_FN_REG) ", %0\n"                    =20
\
-         "1:"BUG_INSTR"\n"                                          =20
\
-         ".pushsection .bug_frames." __stringify(BUGFRAME_run_fn) ","
\
-         "             \"a\", %%progbits\n"                         =20
\
-         "2:\n"                                                     =20
\
-         ".p2align 2\n"                                             =20
\
-         ".long (1b - 2b)\n"                                        =20
\
-         ".long 0, 0, 0\n"                                          =20
\
-         ".popsection" :: "r" (fn) : __stringify(BUG_FN_REG) );     =20
\
-} while (0)
+#define BUG_ASM_CONST   "c"
=20
 #endif /* __ARM_BUG_H__ */
...
(it will be merged with patch 3 if it is OK )

And looks like we can switch ARM to generic implementation as all tests
passed:
https://gitlab.com/xen-project/people/olkur/xen/-/pipelines/791549396

The only issue is with yocto-arm:
https://gitlab.com/xen-project/people/olkur/xen/-/pipelines/791549396/failu=
res
But I am not sure that it is because of my patch

Is this enough from a verification point of view?

[1]
https://gitlab.com/xen-project/people/olkur/xen/-/commit/5ff7a06e1d354e1e42=
bde1c203f3cf05a3653ad6
https://gitlab.com/xen-project/people/olkur/xen/-/commit/5ff7a06e1d354e1e42=
bde1c203f3cf05a3653ad6

