Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FED4C60094
	for <lists+xen-devel@lfdr.de>; Sat, 15 Nov 2025 07:24:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1162914.1490376 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vK9gz-0002PS-QG; Sat, 15 Nov 2025 06:23:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1162914.1490376; Sat, 15 Nov 2025 06:23:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vK9gz-0002Mx-Kj; Sat, 15 Nov 2025 06:23:25 +0000
Received: by outflank-mailman (input) for mailman id 1162914;
 Sat, 15 Nov 2025 06:23:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aqlM=5X=gmail.com=freddy77@srs-se1.protection.inumbo.net>)
 id 1vK9gx-0002Mr-PJ
 for xen-devel@lists.xenproject.org; Sat, 15 Nov 2025 06:23:23 +0000
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com
 [2607:f8b0:4864:20::112f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 94b4bc9a-c1eb-11f0-9d18-b5c5bf9af7f9;
 Sat, 15 Nov 2025 07:23:21 +0100 (CET)
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-786635a8ce4so23589817b3.2
 for <xen-devel@lists.xenproject.org>; Fri, 14 Nov 2025 22:23:21 -0800 (PST)
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
X-Inumbo-ID: 94b4bc9a-c1eb-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763187800; x=1763792600; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FJ2y61QwBwP4GyAg3QVko/gFVDcVKUY9ce9QUrVZDDY=;
        b=N5K5CoeoQKOFdzGjYC1KSGac0ottZg3AThuHBNyzIn9RekHFhnh0leTlRj1vuEiNwI
         gGoPmrYnqd/g/QnreJpPr1zj53sZT4O8kJF2K2yj6UV7k/xF2kuETLbvvp8X2s5kNEku
         SFTqs8NVxYY64basAFbswV6fr9e54yw9UieIZ4b23/mIx9n4Q9Rxe0eceerAJDJ0zK41
         4iSCWOGCUMXUsySZz1PWrexbL+8Nu55lrXUjdx3aS5DRz8tfWyJHPir41Cc3gegggwub
         mTVcVzeiK8BhMr8CEMSUVs9gO/WLa12/QFQ9s8RUHQwrRZ2uZCLtmUSjZadQVYg9dSq3
         HZKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763187800; x=1763792600;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FJ2y61QwBwP4GyAg3QVko/gFVDcVKUY9ce9QUrVZDDY=;
        b=n7xZU3r5gyFaJqsFjMimTCNdSulzixDMtg0tj5iXujRZtIoSzfy8c0wWYGZDL6EDff
         pOChwMcYyi3NJhIWiAp8pfizJVivH+oIqLiGRCkReOEzt2Ct1lj+R4/7QYFFyCG7U+g8
         dnBYTFpmgPwi06ZWfLBGEI/hu2aitZX+sGYlQLH5/DfNu8Fil6JXWrZErGFr+8BL2YqG
         BrHB8LxhBWZwEoIW7llho9I8r1CPN67AlUxonR0owt3wpmMkNHdB6aPZyiDysj0YwXYR
         rLFkY9Q8nj0avXbZ3kdAWYkm638rCFhuHz/QNvpmZelAP8twa/YPmKphN5TTD8hX6uxR
         pjPw==
X-Forwarded-Encrypted: i=1; AJvYcCV1VSgdJI0Rqad96X1sdI28pMLUhZ6zBlKsVC8bpet+wWtAZYX5KSlb5/Yfmk5hNEOoQYqPJqgXeLk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwLr1YZKxAroQPbA5c3ZMDQhkBdW350KdGSD48Suj76MujSc6Fl
	HwsTnN0xYX1dJagvWUOdRxObhvvCTE8+EC9rWSvN0zsBEPYFFLIuTYecstVGmtM6GLvKiTGpHJu
	Os4P/POfoUYs/XGrMJ34V1C3kwUn3E1A=
X-Gm-Gg: ASbGncu75sHzqXi/AUkKs64wimC94nb8mL3RU4cUm0s7iYM3tcO27Ml6GOE7t0SDsq2
	Tr7Z23NPlONGLENfhNZvkTpNnoRXT4fSJVKuYFo8HoHsJekwTmXOrJ+1SVCmFVRv7Bke+8q+6O5
	s/zYCO3uQwtiVh+pi/J4dFDNxMmQdvNgh4epiev1GBAcczJTzLgC3Dl/oUQBMvCMorTJE92lMe0
	a+vFyvfvvQlq0Et2VTJGUiCzHNWurFjprXtstWU2jHtw+tARnFMAnyfmUSc
X-Google-Smtp-Source: AGHT+IE5yt15o7yFmkSbTtMqG+hbN4FCKFGZhE9D0XAg+u99VJsuFTT889TgY0lY0OJgJG8KPABt9sjHMgndiuM57qc=
X-Received: by 2002:a05:690c:a79a:b0:787:fec5:7090 with SMTP id
 00721157ae682-78929e3f56emr37690307b3.10.1763187799865; Fri, 14 Nov 2025
 22:23:19 -0800 (PST)
MIME-Version: 1.0
References: <20251113154358.28704-1-frediano.ziglio@citrix.com>
 <6729f3d9-618c-4dcd-93f8-d02ca7cea017@gmail.com> <8f8a769d-95ea-4554-8ee0-d6247f583e37@citrix.com>
In-Reply-To: <8f8a769d-95ea-4554-8ee0-d6247f583e37@citrix.com>
From: Frediano Ziglio <freddy77@gmail.com>
Date: Sat, 15 Nov 2025 06:23:08 +0000
X-Gm-Features: AWmQ_bmU30pKVwITGKKBYza3lhINdd4lGPLiZ8i2QtdUFIRM-pceOAFSb_bKknc
Message-ID: <CAHt6W4eDDm-fNUB7W1Zgj+x-bkK2fxTB50C38T4Uy0_Ofy_cww@mail.gmail.com>
Subject: Re: [PATCH v8] xen: Strip xen.efi by default
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>, 
	Frediano Ziglio <frediano.ziglio@citrix.com>, xen-devel@lists.xenproject.org, 
	Frediano Ziglio <frediano.ziglio@cloud.com>, Anthony PERARD <anthony.perard@vates.tech>, 
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Demi Marie Obenour <demiobenour@gmail.com>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	Stewart Hildebrand <stewart.hildebrand@amd.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 14 Nov 2025 at 19:18, Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>
> On 14/11/2025 3:40 pm, Oleksii Kurochko wrote:
> >
> >
> > On 11/13/25 4:43 PM, Frediano Ziglio wrote:
> >> From: Frediano Ziglio <frediano.ziglio@cloud.com>
> >>
> >> For xen.gz file we strip all symbols and have an additional
> >> xen-syms.efi file version with all symbols.
> >> Make xen.efi more coherent stripping all symbols too.
> >> xen-syms.efi can be used for debugging.
> >>
> >> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
> > Release-Acked-By: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> >
> > Thanks.
>
> Thanks.  Unfortunately CI says no.
>
> Ubuntu's 20.04, 18.04 and 16.04 all fail:
> https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/2159622869
>
> From 16.04:
>
> 2025-11-14T18:01:51.192964Z 01O strip xen-syms.efi -o xen.efi
> 2025-11-14T18:01:51.198151Z 01O strip:xen-syms.efi[.init]: relocation count is negative: File truncated
> 2025-11-14T18:01:51.198166Z 01O strip: xen.efi: Failed to read debug data section
> 2025-11-14T18:01:51.198169Z 01O strip:xen.efi: error copying private BFD data: File truncated
> 2025-11-14T18:01:51.198932Z 01O arch/x86/Makefile:207: recipe for target 'xen.efi' failed
> 2025-11-14T18:01:51.198937Z 01O make[3]: *** [xen.efi] Error 1
> 2025-11-14T18:01:51.199616Z 01O build.mk:90: recipe for target 'xen' failed
> 2025-11-14T18:01:51.199619Z 01O make[2]: *** [xen] Error 2
> 2025-11-14T18:01:51.200402Z 01O Makefile:600: recipe for target 'xen' failed
> 2025-11-14T18:01:51.200409Z 01O make[1]: *** [xen] Error 2
>
>
> I find it hard to believe that the relocation count is really negative,
> and given that newer binuitls works, I expect this is a binutils bug.
>

Unless the message is just misleading I find it hard to have a
negative number of items in a container.

> Nevertheless, we need some workaround.  Given that the previous
> behaviour was not to strip, I think we can reuse that for broken toolchains?
>

Something like that ?

diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index a154ffe6b2..c465eb12e2 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -236,7 +236,9 @@ ifeq ($(CONFIG_DEBUG_INFO),y)
        $(if $(filter --strip-debug,$(EFI_LDFLAGS)),:$(space))$(OBJCOPY) \
                -O elf64-x86-64 $(TARGET)-syms.efi $@.elf
 endif
-       $(STRIP) $(TARGET)-syms.efi -o $@
+       $(STRIP) $(TARGET)-syms.efi -o $@ || { \
+               LANG=C strip $(TARGET)-syms.efi -o $@ 2>&1 | grep -q \
+               "relocation count is negative" && mv -f $(TARGET)-syms.efi $@; }
 ifneq ($(CONFIG_DEBUG_INFO),y)
        rm -f $(TARGET)-syms.efi
 endif

It will fall back to not stripping in case that bug is detected. I
don't know how to test it.
(the LANG=C is to always force the English message).

> ~Andrew

Frediano

