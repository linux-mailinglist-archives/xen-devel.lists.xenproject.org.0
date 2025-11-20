Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 568A7C7464E
	for <lists+xen-devel@lfdr.de>; Thu, 20 Nov 2025 14:59:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1167413.1493729 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vM5CH-00006c-7a; Thu, 20 Nov 2025 13:59:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1167413.1493729; Thu, 20 Nov 2025 13:59:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vM5CH-0008VX-4Z; Thu, 20 Nov 2025 13:59:41 +0000
Received: by outflank-mailman (input) for mailman id 1167413;
 Thu, 20 Nov 2025 13:59:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Eeu9=54=gmail.com=freddy77@srs-se1.protection.inumbo.net>)
 id 1vM5CG-0008VL-5Y
 for xen-devel@lists.xenproject.org; Thu, 20 Nov 2025 13:59:40 +0000
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com
 [2607:f8b0:4864:20::1129])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 26739614-c619-11f0-980a-7dc792cee155;
 Thu, 20 Nov 2025 14:59:37 +0100 (CET)
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-78802ac22abso9878537b3.3
 for <xen-devel@lists.xenproject.org>; Thu, 20 Nov 2025 05:59:37 -0800 (PST)
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
X-Inumbo-ID: 26739614-c619-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763647176; x=1764251976; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Cu8tDr/sTqgaI4RP7K7LOTF8umLiwVvgTb4uqyemA5E=;
        b=kvHzGYhNb+Y+BK/NEIjLvVnzcUANpY8fS7QEWsEXnmcYV9BIBv34/XBpvOKPLMbArl
         zkldIQVOs57+paz6rMRh5XVGptKSIe8m7rfhR9NZjCju98XMqaBTh+9m2AgTXLHxpof7
         ub8pLdrH0i1e9cpG43jE84KoCJpnzTn3QZQfdUf0eD7OxB3sZnW21AnSpgGu1JrUmXaC
         qZYwRzBbxA5ryHvWqmYv/0OMBNzUikwmpr7r84qvR/5qGuc66vD0Y1GZTbHpNDxZGF+Z
         sa7KWI+x8BmY0FEAvPbNo6a3Yf3ZOhdlSi2vw/OcQ8fqJ9jaUQMopz3ByZxHZV4XZ49k
         9Lww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763647176; x=1764251976;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cu8tDr/sTqgaI4RP7K7LOTF8umLiwVvgTb4uqyemA5E=;
        b=EQmBK/9rajhGAdBZTnR4V+KlY0W05O1Pv6R78XQ4d85G8xQ5DSpnMZZJ3qrPmvSrfO
         Rh5iCm/sit20xWIKC/w/im0ldrv1PMTLUXW42jwQ6cRi/RyRMvUj4DGmu3VxLWvYt3bT
         PGZ5LHTidaPHEtgaOQJZzAJWHkn9WI8ZlUjmtBTmvRPRMH7xlHeGb+WOj4sEacmpWRie
         e3XMGAVBblAfFC7ZfiS84D/IwVcN0INwDnysKyIHhNDS7mJpiQa3ZG0P/HbxidNhxCbr
         HWRJsfdWB/zzusJm5fnTupjPhnf8wl8ASBKMXKHvmoUMqmia5Db02fpUxr3Q0c42+uEN
         TqDA==
X-Forwarded-Encrypted: i=1; AJvYcCX0Hn7c7xbqfsP9llAjXC572GJQL5H+03ulr+eR/bIpDsIT3zEFYVtHy/B8i9Unk5eXHIMcnL8KYvg=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywc47TI5kXSxDPqJ4rrMPkJXmhWf6mt34yKybo947bvp7xIc3s+
	8FV7FL8wwzqgMYrgI9+vv+jBikNmKudQmMfuZwstvqurAqgSNUsoIAs0sla3F4XmXiOUAZT1NhH
	+CeJA2CCvIaVxqVTpAmIFP9VszUrIxL8=
X-Gm-Gg: ASbGncucSuS4dtVlXjIsmdp/BhEnjMuhn7JRzyIDOThO1L3dKPnnLKBVWX7zd2xM41g
	AwESIGOHxwS2VbmvxLlh+4RW0unMkJcmPt59BmAtflUboNlZkNlhOibIAmmIJk2hhhJ/AeYDMvx
	QHY5rKdl0egvroZQD42NgeRf6PDCzhjV9ITwNQi6Wxfie5NnOSJA24Z7xXhD0tgQB00UQcWUsnQ
	6V2q9Gy+zpqm9lARx6Ui++trEF3pbWkAS8sXSvZKJDMQ89DT/IWxmCMfx5BBbQRi4cbygU=
X-Google-Smtp-Source: AGHT+IH5rIrK9D71CjDzw1fIDaPwmrFjbnxMtqDQ1sylELXBZvakdyfDitIwK7JcotqXpFFREaeq3dvrcxKMgbsJ3j8=
X-Received: by 2002:a05:690c:6e88:b0:786:72ec:6f6c with SMTP id
 00721157ae682-78a795a2f71mr22297157b3.31.1763647176323; Thu, 20 Nov 2025
 05:59:36 -0800 (PST)
MIME-Version: 1.0
References: <20251113154358.28704-1-frediano.ziglio@citrix.com>
 <6729f3d9-618c-4dcd-93f8-d02ca7cea017@gmail.com> <8f8a769d-95ea-4554-8ee0-d6247f583e37@citrix.com>
 <CAHt6W4eDDm-fNUB7W1Zgj+x-bkK2fxTB50C38T4Uy0_Ofy_cww@mail.gmail.com>
In-Reply-To: <CAHt6W4eDDm-fNUB7W1Zgj+x-bkK2fxTB50C38T4Uy0_Ofy_cww@mail.gmail.com>
From: Frediano Ziglio <freddy77@gmail.com>
Date: Thu, 20 Nov 2025 13:59:24 +0000
X-Gm-Features: AWmQ_bnsirLIoamjNwu5s83Gj_BQo4119w_B6kWjzKg5yxGESsbsiWkCeSTGdW4
Message-ID: <CAHt6W4einkyNX9sV3Ns87fLRaAN+N1b9CM=KVo5kvb1Qk7y=qg@mail.gmail.com>
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

On Sat, 15 Nov 2025 at 06:23, Frediano Ziglio <freddy77@gmail.com> wrote:
>
> On Fri, 14 Nov 2025 at 19:18, Andrew Cooper <andrew.cooper3@citrix.com> wrote:
> >
> > On 14/11/2025 3:40 pm, Oleksii Kurochko wrote:
> > >
> > >
> > > On 11/13/25 4:43 PM, Frediano Ziglio wrote:
> > >> From: Frediano Ziglio <frediano.ziglio@cloud.com>
> > >>
> > >> For xen.gz file we strip all symbols and have an additional
> > >> xen-syms.efi file version with all symbols.
> > >> Make xen.efi more coherent stripping all symbols too.
> > >> xen-syms.efi can be used for debugging.
> > >>
> > >> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
> > > Release-Acked-By: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > >
> > > Thanks.
> >
> > Thanks.  Unfortunately CI says no.
> >
> > Ubuntu's 20.04, 18.04 and 16.04 all fail:
> > https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/2159622869
> >
> > From 16.04:
> >
> > 2025-11-14T18:01:51.192964Z 01O strip xen-syms.efi -o xen.efi
> > 2025-11-14T18:01:51.198151Z 01O strip:xen-syms.efi[.init]: relocation count is negative: File truncated
> > 2025-11-14T18:01:51.198166Z 01O strip: xen.efi: Failed to read debug data section
> > 2025-11-14T18:01:51.198169Z 01O strip:xen.efi: error copying private BFD data: File truncated
> > 2025-11-14T18:01:51.198932Z 01O arch/x86/Makefile:207: recipe for target 'xen.efi' failed
> > 2025-11-14T18:01:51.198937Z 01O make[3]: *** [xen.efi] Error 1
> > 2025-11-14T18:01:51.199616Z 01O build.mk:90: recipe for target 'xen' failed
> > 2025-11-14T18:01:51.199619Z 01O make[2]: *** [xen] Error 2
> > 2025-11-14T18:01:51.200402Z 01O Makefile:600: recipe for target 'xen' failed
> > 2025-11-14T18:01:51.200409Z 01O make[1]: *** [xen] Error 2
> >
> >
> > I find it hard to believe that the relocation count is really negative,
> > and given that newer binuitls works, I expect this is a binutils bug.
> >
>
> Unless the message is just misleading I find it hard to have a
> negative number of items in a container.
>
> > Nevertheless, we need some workaround.  Given that the previous
> > behaviour was not to strip, I think we can reuse that for broken toolchains?
> >
>
> Something like that ?
>
> diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
> index a154ffe6b2..c465eb12e2 100644
> --- a/xen/arch/x86/Makefile
> +++ b/xen/arch/x86/Makefile
> @@ -236,7 +236,9 @@ ifeq ($(CONFIG_DEBUG_INFO),y)
>         $(if $(filter --strip-debug,$(EFI_LDFLAGS)),:$(space))$(OBJCOPY) \
>                 -O elf64-x86-64 $(TARGET)-syms.efi $@.elf
>  endif
> -       $(STRIP) $(TARGET)-syms.efi -o $@
> +       $(STRIP) $(TARGET)-syms.efi -o $@ || { \
> +               LANG=C strip $(TARGET)-syms.efi -o $@ 2>&1 | grep -q \
> +               "relocation count is negative" && mv -f $(TARGET)-syms.efi $@; }
>  ifneq ($(CONFIG_DEBUG_INFO),y)
>         rm -f $(TARGET)-syms.efi
>  endif
>
> It will fall back to not stripping in case that bug is detected. I
> don't know how to test it.
> (the LANG=C is to always force the English message).
>

It looks like this change works better and CI is happy.
It duplicates the linking with -s option if the strip fails.
Yes, it's a hack and almost duplicates the one command above.
What about it?

diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index a154ffe6b2..5f5162841e 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -236,7 +236,10 @@ ifeq ($(CONFIG_DEBUG_INFO),y)
        $(if $(filter --strip-debug,$(EFI_LDFLAGS)),:$(space))$(OBJCOPY) \
                -O elf64-x86-64 $(TARGET)-syms.efi $@.elf
 endif
-       $(STRIP) $(TARGET)-syms.efi -o $@
+       $(STRIP) $(TARGET)-syms.efi -o $@ || \
+       $(LD) $(call EFI_LDFLAGS,$(VIRT_BASE)) -T $(obj)/efi.lds $< \
+             $(dot-target).1r.o $(dot-target).1s.o $(orphan-handling-y) \
+             $(note_file_option) -s -o $@
 ifneq ($(CONFIG_DEBUG_INFO),y)
        rm -f $(TARGET)-syms.efi
 endif

Frediano

