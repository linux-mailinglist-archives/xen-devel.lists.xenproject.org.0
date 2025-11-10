Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38384C469F1
	for <lists+xen-devel@lfdr.de>; Mon, 10 Nov 2025 13:34:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1158311.1486661 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vIR6G-0008Pq-2u; Mon, 10 Nov 2025 12:34:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1158311.1486661; Mon, 10 Nov 2025 12:34:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vIR6G-0008OP-0J; Mon, 10 Nov 2025 12:34:24 +0000
Received: by outflank-mailman (input) for mailman id 1158311;
 Mon, 10 Nov 2025 12:34:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=thpE=5S=gmail.com=freddy77@srs-se1.protection.inumbo.net>)
 id 1vIR6F-0008OJ-6k
 for xen-devel@lists.xenproject.org; Mon, 10 Nov 2025 12:34:23 +0000
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com
 [2607:f8b0:4864:20::1135])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8d848cf2-be31-11f0-980a-7dc792cee155;
 Mon, 10 Nov 2025 13:34:09 +0100 (CET)
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-78665368a5cso26951157b3.3
 for <xen-devel@lists.xenproject.org>; Mon, 10 Nov 2025 04:34:09 -0800 (PST)
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
X-Inumbo-ID: 8d848cf2-be31-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762778048; x=1763382848; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mjcld7zYhMN6TAnYLFoVGfl+DSMvi2tJblgnEWonM24=;
        b=FaMsMIZDEfKtf+mmOWjyPPx0jYtqcl2a8BQiHixkd8XmOHkdfM5jenkAHRGW1gdFQd
         tbS+fSQK3259b2TmAnJ4Mpk3dc9ZOlG/h62APOiqm2MaDcjz9adRc6VoM+G+NfA6F6eh
         PL/iTVkm2ukxsVa/TZa5QJMEJwyBVC/TNv5uGfqyrf3iI4+QVafvHZxk0xaGaStVKOsY
         SxPAFnm9A9AgYV9X8+6+ZdfHTGlxvBBAr+/mpRLOymXg+xRBkrGRoP2sRBJWMAudJxkn
         svT+CzhHUdDV3+s+tKsWoro+mlxgn5+m3zIaF6SYZZK6HsqIRb6/b+yc+4RbVTXn0Klz
         h2ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762778048; x=1763382848;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mjcld7zYhMN6TAnYLFoVGfl+DSMvi2tJblgnEWonM24=;
        b=JsGITrGK0y0Fn5Ng19hvrrPJ+SIea6a5DyJp4awXlajcOvLs/qIlu6KJcwR6K9+6yJ
         ELplRcmZvc7TLuK5oPZPbEXIjYyfr2pYtQDj64AU09Za8/v2eG+Ia3lTNVkNBadkxXcb
         qOOeoGiefcdqoZaqdOWGYQNCotMlsdhB3HVWO1k0hDnZBYc+o3TOKSQJWyQjXGURA3tG
         0o+mC3ha0UOQioX/jMDWZiUPtoUD0F9D0Fr3JF5Ln5gwWVNTTTGrEbqfNSbGElg19hTK
         JME2x9+J7SCRRBpTXbXZOl2V/c48y+2lfkihumQUWgDXUgq0lK8ovGrfDsDCo8O4Pt33
         MQkQ==
X-Forwarded-Encrypted: i=1; AJvYcCXCcmlmzQXObwPgvpnTMQmQKZc74qbk8GzPi+cNlNg/ti27SmtoyLWyR+TD6GRUkLPHE92c6Hkj/Z4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxbbQIi6hYFNHHTqcRSCZQ4xgGpVA+6O/h+y+sodQxEvRjnQ4dc
	Wdds8lrXQPI3U40nhVNBENCqzDf05Q5TSKxhKp4k5FZvok46Zvxkz9luamLIW9TfZxwOLT+F7Pv
	ALqDP/OAi/BxEwLhzNvF75e67/eaNlkU=
X-Gm-Gg: ASbGncudWLkcRSD1RMZWkX58J/30khH3gR1ejGYQ6Wvp7axg/S+l58M/9sERsLkDp+t
	2jIUf3W7LdLdpOPKnKos3jFMOxUVL8YH/UWkQ7T5aax9bgETYuBfcTqNYI7Unv92eJE9q9yPZjF
	3P2t1Axfld8GMUp0DMarMEQWX+iQ5+SGRQQOzB2YfzYYJomuzRH9DaRZO/tYsPTqu2sxCMwoN2w
	JMUzuh6Zyr9d3lkyHS4Nb+pvxL2NtJzCxP8vcF8VqPE5nxiWBpBsrhIyunHO+RXdhPiFEw=
X-Google-Smtp-Source: AGHT+IECnJtKtQG4p4Nvi7wT8vPtBdN2mXckrMlbcYbo51IkLk8cRTxhiEXCBhQg53xQjymmEUDszkN2rYzff/w89eg=
X-Received: by 2002:a05:690c:6284:b0:787:c849:6544 with SMTP id
 00721157ae682-787d535092cmr75648767b3.5.1762778047953; Mon, 10 Nov 2025
 04:34:07 -0800 (PST)
MIME-Version: 1.0
References: <20251105153808.20278-1-frediano.ziglio@citrix.com>
 <97611b79-228c-40a6-9fb2-4571b2447258@suse.com> <CAHt6W4ce9cPwdaYXwgL4Unkprh4BQ2Qh_CSM0q9WjP2fdVf-Gg@mail.gmail.com>
 <c0a7d349-8338-45a3-b701-f07ef3e6526b@suse.com>
In-Reply-To: <c0a7d349-8338-45a3-b701-f07ef3e6526b@suse.com>
From: Frediano Ziglio <freddy77@gmail.com>
Date: Mon, 10 Nov 2025 12:33:55 +0000
X-Gm-Features: AWmQ_bnn4Y9t4Y5Q3zMjC-AGE1mpF9S2-VxCecq0gdoRAEsrscdbz8xSvyjp89c
Message-ID: <CAHt6W4dqe9mX=CFrdbUTkfxwy8XYNi+2eRCfaQZOmbo=195ZRg@mail.gmail.com>
Subject: Re: [PATCH v3] xen: Strip xen.efi by default
To: Jan Beulich <jbeulich@suse.com>
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Anthony PERARD <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, 
	Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 7 Nov 2025 at 07:08, Jan Beulich <jbeulich@suse.com> wrote:
>
> On 06.11.2025 17:37, Frediano Ziglio wrote:
> > On Thu, 6 Nov 2025 at 10:32, Jan Beulich <jbeulich@suse.com> wrote:
> >> On 05.11.2025 16:38, Frediano Ziglio wrote:
> >>> --- a/xen/Kconfig.debug
> >>> +++ b/xen/Kconfig.debug
> >>> @@ -147,12 +147,7 @@ config DEBUG_INFO
> >>>         Say Y here if you want to build Xen with debug information. This
> >>>         information is needed e.g. for doing crash dump analysis of the
> >>>         hypervisor via the "crash" tool.
> >>> -       Saying Y will increase the size of the xen-syms and xen.efi
> >>> -       binaries. In case the space on the EFI boot partition is rather
> >>> -       limited, you may want to install a stripped variant of xen.efi in
> >>> -       the EFI boot partition (look for "INSTALL_EFI_STRIP" in
> >>> -       docs/misc/efi.pandoc for more information - when not using
> >>> -       "make install-xen" for installing xen.efi, stripping needs to be
> >>> -       done outside the Xen build environment).
> >>> +       Saying Y will increase the size of the xen-syms and xen.efi.elf
> >>> +       binaries.
> >>
> >> Why xen.efi.elf and not xen-syms.efi?
> >>
> >
> > I forgot to update this part.
> > Now that I see the comment, was the suggestion about having an
> > additional xen-syms.efi file or having xen-syms.efi instead of
> > xen.efi.elf ?
>
> The former. We want to have the binary available that the linker produced
> directly. Anything else are extra's for what people think they may need.
>

Done in v4.

> >>> --- a/xen/arch/x86/Makefile
> >>> +++ b/xen/arch/x86/Makefile
> >>> @@ -228,14 +228,17 @@ endif
> >>>       $(MAKE) $(build)=$(@D) .$(@F).1r.o .$(@F).1s.o
> >>>       $(LD) $(call EFI_LDFLAGS,$(VIRT_BASE)) -T $(obj)/efi.lds $< \
> >>>             $(dot-target).1r.o $(dot-target).1s.o $(orphan-handling-y) \
> >>> -           $(note_file_option) -o $@
> >>> -     $(NM) -pa --format=sysv $@ \
> >>> +           $(note_file_option) -o $@.tmp
> >>> +     $(NM) -pa --format=sysv $@.tmp \
> >>>               | $(objtree)/tools/symbols --all-symbols --xensyms --sysv --sort \
> >>>               > $@.map
> >>>  ifeq ($(CONFIG_DEBUG_INFO),y)
> >>> -     $(if $(filter --strip-debug,$(EFI_LDFLAGS)),:$(space))$(OBJCOPY) -O elf64-x86-64 $@ $@.elf
> >>> +     $(if $(filter --strip-debug,$(EFI_LDFLAGS)),:$(space))cp -f \
> >>> +        $@.tmp $(TARGET)-syms.efi
> >>> +     $(if $(filter --strip-debug,$(EFI_LDFLAGS)),:$(space))$(STRIP) $@.tmp
> >>>  endif
> >>>       rm -f $(dot-target).[0-9]* $(@D)/..$(@F).[0-9]*
> >>> +     mv -f $@.tmp $@
> >>>  ifeq ($(CONFIG_XEN_IBT),y)
> >>>       $(SHELL) $(srctree)/tools/check-endbr.sh $@
> >>>  endif
> >>
> >> I see $@.tmp here, but no sign of xen-syms. Did you submit a stake patch? Am
> >> I missing something?
> >>
> >
> > I don't know what a "stake patch" is.
>
> Sorry, typo - "stale" was meant.
>
> > xen-syms.efi (that is $(TARGET)-syms.efi in the Makefile) is not a
> > target of this rule so if the rule fails it will be generated again.
>
> How does this matter in this context? The description talks of a xen-syms.efi
> being generated, yet I'm simply unable to spot where that would be happening.
>

It was "generated" with a "cp" command, now I use "mv" + "strip -o"
(in v4) to make it more clear.

> >> I also think the mv should sit ahead of the cleaning-up rm.
> >
> > Are you sure?
> > Usually you want it as the last command so any failure won't create
> > the target. For instance here if check-endbr.sh is failing the target
> > is still created and next make command will succeed.
>
> Except that the rm is tidying up rather than creating anything.
>

Updated this moving endbr check before the "mv" and the cleanup after.

> Jan

Frediano

