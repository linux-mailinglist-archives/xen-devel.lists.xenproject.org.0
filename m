Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A452D984884
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2024 17:22:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.803052.1213452 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1st7Mb-0001V8-GL; Tue, 24 Sep 2024 15:22:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 803052.1213452; Tue, 24 Sep 2024 15:22:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1st7Mb-0001TD-Cg; Tue, 24 Sep 2024 15:22:05 +0000
Received: by outflank-mailman (input) for mailman id 803052;
 Tue, 24 Sep 2024 15:22:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CoXS=QW=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1st7MZ-0001T1-Jd
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2024 15:22:03 +0000
Received: from mail-oo1-xc2b.google.com (mail-oo1-xc2b.google.com
 [2607:f8b0:4864:20::c2b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id be058708-7a88-11ef-99a2-01e77a169b0f;
 Tue, 24 Sep 2024 17:22:00 +0200 (CEST)
Received: by mail-oo1-xc2b.google.com with SMTP id
 006d021491bc7-5d5c7f23f22so3074398eaf.0
 for <xen-devel@lists.xenproject.org>; Tue, 24 Sep 2024 08:22:00 -0700 (PDT)
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
X-Inumbo-ID: be058708-7a88-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1727191319; x=1727796119; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ByZ+wPleSJybj4bxwsMWBkQvqFecvkspQafgkmhpBys=;
        b=QMnox/y+O2YrhV4pnCilqYoZGpBYlecXxUZmbVVrhlsrg7VW6JPJ8aoVHwM86shtFJ
         ZuTDEk6DPWrSF7uxO7Rc58qMV4hToshdSHryQeNNF1uQtKw4ENBwEEkUxaQ+xDp0cezT
         GgFuhQmrXkKbInernEz93sscV1WG2W0gXxYaI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727191319; x=1727796119;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ByZ+wPleSJybj4bxwsMWBkQvqFecvkspQafgkmhpBys=;
        b=AJ86jb03w1w2ztYzGae4WNqsr6qfHggiMGpMdGCqK0Pntm357YayNazzQsdlsKCnVp
         SZZNzJGvu+hiQymB/luO4+NTYxkSrYTJZ74qUfmGmElprL2c0SJLK1ejjidMevLWQySC
         TkvtYOGJtowtx9OUoGHAWEaT9ifDUIhjmIWxMuybKcyVe6LGbA0cOSAn/EmkD0glZWYi
         kSXTHyggw8uSYW5numoeS4gJPZzCzZp/qBP8qo+FFpgR6I1dGdoRdXJbmQ7UihuCa9+L
         okzC3aHy7l3tLlkK46r69UFVn9mAls5SGO1Jc9WxhY2gB+bOsGlpUObYqcV9fHbXKhAX
         7aXw==
X-Forwarded-Encrypted: i=1; AJvYcCUuyDdRQtGgvh0DLt+Z7JZZaZTKTTnX9uVLBHL8Miok4CASeAby+K1mVrySBas/f6iLy52j3J7EF2M=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyFnmH6KfzHCa1rCn6JbtPy2/2GQqH5DPo1625VHzE+IiliroWl
	/ENW+GL9G/A4opAJD4WXEeOnZQONOFpjIN24JrU1laPRSOkLXsvGYIALHCuKnpcmp9VpQItxTWo
	Mtj2tTmVAFDWNFycCc3oZ78ZKf3qgD2Hm0+nzmg==
X-Google-Smtp-Source: AGHT+IHTdSeetGS5bUFu3LweEBktwGqGaDrgeT4qSNRmJil7DvksY59CM4fCdAL6pEs+mA5r9qZbE8ikQt5gyW0ZbjE=
X-Received: by 2002:a05:6820:1626:b0:5e5:c0a0:2b44 with SMTP id
 006d021491bc7-5e5c0a031c6mr1172841eaf.0.1727191318845; Tue, 24 Sep 2024
 08:21:58 -0700 (PDT)
MIME-Version: 1.0
References: <20240910161612.242702-1-frediano.ziglio@cloud.com>
 <20240910161612.242702-4-frediano.ziglio@cloud.com> <5cf6fad1-16ce-46b4-9bed-151f936e3772@suse.com>
 <CACHz=Zifc9rKvfxh1EmH5VQQ1YtB7L-GUrBrMP734uc6Uhk_mQ@mail.gmail.com> <6133b856-1c02-486c-8932-b213e8b9ce0b@suse.com>
In-Reply-To: <6133b856-1c02-486c-8932-b213e8b9ce0b@suse.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Tue, 24 Sep 2024 16:21:48 +0100
Message-ID: <CACHz=Zg1UnDD9bXYgm01smay=mzRciNZ20v7ERi4OHsqSYGZFw@mail.gmail.com>
Subject: Re: [PATCH 3/3] x86/boot: Rewrite EFI start part in C
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	"Daniel P. Smith" <dpsmith@apertussolutions.com>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 23, 2024 at 3:26=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wro=
te:
>

... omissis ...

>
> >>> --- a/xen/arch/x86/efi/stub.c
> >>> +++ b/xen/arch/x86/efi/stub.c
> >>> @@ -17,7 +17,8 @@
> >>>   */
> >>>
> >>>  void __init noreturn efi_multiboot2(EFI_HANDLE ImageHandle,
> >>> -                                    EFI_SYSTEM_TABLE *SystemTable)
> >>> +                                    EFI_SYSTEM_TABLE *SystemTable,
> >>> +                                    const char *cmdline)
> >>>  {
> >>>      static const CHAR16 __initconst err[] =3D
> >>>          L"Xen does not have EFI code build in!\r\nSystem halted!\r\n=
";
> >>
> >> This, if not a separate change, wants mentioning in the description.
> >> It's a related observation that this wasn't properly updated, but
> >> nothing that necessarily needs doing here. Question is whether the
> >> declaration of the function wouldn't better go into a header now in
> >> the first place.
> >
> > I had the same though about a header. But currently there's no such
> > header, I mean it should be able to be included by both stub.c and
> > efi-boot.h which are both x86 only code so it should go in
> > xen/arch/x86/ I suppose. Suggestions? Maybe a different solution would
> > be to have a xen/arch/x86/efi/efi-boot-stub.h instead of
> > xen/arch/x86/efi/stub.c ?
>
> It's not quite the right place, but maybe (ab)using asm/efibind.h would
> be slightly better than introducing asm/efi.h just for a single decl?
>
> Jan

Okay, I found the comment on the header to place the declaration.

Kind of works... but the headers are very crazily depending on each
other, the header change is

diff --git a/xen/arch/x86/include/asm/efibind.h
b/xen/arch/x86/include/asm/efibind.h
index bce02f3707..1fa5522a0d 100644
--- a/xen/arch/x86/include/asm/efibind.h
+++ b/xen/arch/x86/include/asm/efibind.h
@@ -1,2 +1,13 @@
#include <xen/types.h>
+#include <xen/init.h>
#include <asm/x86_64/efibind.h>
+#include <efi/efidef.h>
+#include <efi/eficapsule.h>
+#include <efi/eficon.h>
+#include <efi/efidevp.h>
+#include <efi/efiapi.h>
+
+void __init efi_multiboot2(EFI_HANDLE ImageHandle,
+                           EFI_SYSTEM_TABLE *SystemTable,
+                           const char *cmdline);
+

How does it sound ?

Frediano

