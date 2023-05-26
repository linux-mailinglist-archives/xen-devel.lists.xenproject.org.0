Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33766711C62
	for <lists+xen-devel@lfdr.de>; Fri, 26 May 2023 03:17:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.539910.841249 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2M40-0001TC-OL; Fri, 26 May 2023 01:16:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 539910.841249; Fri, 26 May 2023 01:16:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2M40-0001Qa-Kk; Fri, 26 May 2023 01:16:16 +0000
Received: by outflank-mailman (input) for mailman id 539910;
 Fri, 26 May 2023 01:16:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=i5vf=BP=gmail.com=alistair23@srs-se1.protection.inumbo.net>)
 id 1q2M3z-0001QU-GZ
 for xen-devel@lists.xenproject.org; Fri, 26 May 2023 01:16:15 +0000
Received: from mail-ua1-x933.google.com (mail-ua1-x933.google.com
 [2607:f8b0:4864:20::933])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e72922c5-fb62-11ed-b230-6b7b168915f2;
 Fri, 26 May 2023 03:16:13 +0200 (CEST)
Received: by mail-ua1-x933.google.com with SMTP id
 a1e0cc1a2514c-7865ce76c6dso62219241.2
 for <xen-devel@lists.xenproject.org>; Thu, 25 May 2023 18:16:13 -0700 (PDT)
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
X-Inumbo-ID: e72922c5-fb62-11ed-b230-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685063771; x=1687655771;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NB5REcbLpwjs6+Y48dM4uBEElXpnuURkA3t4yUlx7h8=;
        b=CJf+e7RuT6G0XZq3UF4RVieEdm9Eul75geX6129LVYurhkwzadqBbGIhaDj78Adro9
         9/mSRA0JkFWLs0mry+bmzL6OOY6OAxZB6yA9aFb4ywfXDtqhITRFor+b0gtqXKUsI8r9
         pKMkvJ2iD7lths8YzNpaCJYkSeeujqHNyU7FSXQdIE3oh4D4hIokC8rvchFfXztugqea
         la06NFZmhK9BYhANhDwg24J9vlTrJsnHZRIDrlmL7M5JMVcVvlu7yJOuk4mPCOOYqHTX
         FF8ZAODMN2zt70skhIz/kg52ymElEu0oH7lAPpAOtpxVp77yT/drXd72y5FjaqOxEd6H
         O21w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685063772; x=1687655772;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NB5REcbLpwjs6+Y48dM4uBEElXpnuURkA3t4yUlx7h8=;
        b=SjBWlJp/N9RLZKmPcFLDQwo7jJif8QGl64YWnBZphe+qtS09QnjZFXptLfvKymeQwf
         q1Z09MVdz1vqGaF0OyWNI3aiNEYW+ZYQin9rCpFT8KvzDTDLggeMf03AxDze8dUb5V+Y
         DtQ6pUm5u/Pw/Ih4jjdAfeVZWZL8nz0+QzJ6ja0245vmYKuExfIvQvdZM8PI6ht1F5EL
         dac7Mc1bBFWbZNSiuKnDX1QVL8evtRrh07/sM7C0Hz78qPeOzK5jtJ0VuHKg+sW5vyeG
         upQzwFTyMU9FxqEl+CwYGB0WzEsHoA/kbG6fPUdpM9lYkfH4uJ3Z/Ar15yrazDYE+loA
         R3lA==
X-Gm-Message-State: AC+VfDzg0ulBxRpuuFuiedaMLkfiDeIDuHZNfVUrjn5wQR9A4Nn5Afl+
	R+Dibfo6NBIHAJuD2FrYGGdlEAHDSALNBmcFKYQ=
X-Google-Smtp-Source: ACHHUZ548+vK/qS35LDCn2jIrt2OtiARxrAZizkWeIMagbrka75GyGA7V+WCUgsLM7rI/yq2wlZKwe+Vwfi9QiOVvdY=
X-Received: by 2002:a05:6102:1d2:b0:434:70b4:b356 with SMTP id
 s18-20020a05610201d200b0043470b4b356mr53546vsq.28.1685063771697; Thu, 25 May
 2023 18:16:11 -0700 (PDT)
MIME-Version: 1.0
References: <a261b10b-25e4-3374-d6c4-05b307619d81@suse.com> <aa76774a-0d73-989e-e054-1b30490160e1@suse.com>
In-Reply-To: <aa76774a-0d73-989e-e054-1b30490160e1@suse.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 26 May 2023 11:15:45 +1000
Message-ID: <CAKmqyKPR===gfi0A0h0qMy-2s=aANGzNvkBWdFecc_xDtsQt3w@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] build: shorten macro references
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Bobby Eshleman <bobbyeshleman@gmail.com>, Alistair Francis <alistair.francis@wdc.com>, 
	Connor Davis <connojdavis@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 8, 2023 at 10:58=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> Presumably by copy-and-paste we've accumulated a number of instances of
> $(@D)/$(@F), which really is nothing else than $@. The split form only
> needs using when we want to e.g. insert a leading . at the beginning of
> the file name portion of the full name.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
> v2: Insert blanks after ">".
>
> --- a/xen/arch/arm/Makefile
> +++ b/xen/arch/arm/Makefile
> @@ -104,9 +104,9 @@ $(TARGET)-syms: $(objtree)/prelink.o $(o
>         $(MAKE) $(build)=3D$(@D) $(@D)/.$(@F).1.o
>         $(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds -N $< $(build_id_linker) \
>             $(@D)/.$(@F).1.o -o $@
> -       $(NM) -pa --format=3Dsysv $(@D)/$(@F) \
> +       $(NM) -pa --format=3Dsysv $@ \
>                 | $(objtree)/tools/symbols --all-symbols --xensyms --sysv=
 --sort \
> -               >$(@D)/$(@F).map
> +               > $@.map
>         rm -f $(@D)/.$(@F).[0-9]*
>
>  .PHONY: include
> --- a/xen/arch/riscv/Makefile
> +++ b/xen/arch/riscv/Makefile
> @@ -10,9 +10,9 @@ $(TARGET): $(TARGET)-syms
>
>  $(TARGET)-syms: $(objtree)/prelink.o $(obj)/xen.lds
>         $(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds -N $< $(build_id_linker) -=
o $@
> -       $(NM) -pa --format=3Dsysv $(@D)/$(@F) \
> +       $(NM) -pa --format=3Dsysv $@ \
>                 | $(objtree)/tools/symbols --all-symbols --xensyms --sysv=
 --sort \
> -               >$(@D)/$(@F).map
> +               > $@.map
>
>  $(obj)/xen.lds: $(src)/xen.lds.S FORCE
>         $(call if_changed_dep,cpp_lds_S)
> --- a/xen/arch/x86/Makefile
> +++ b/xen/arch/x86/Makefile
> @@ -150,9 +150,9 @@ $(TARGET)-syms: $(objtree)/prelink.o $(o
>         $(MAKE) $(build)=3D$(@D) $(@D)/.$(@F).1.o
>         $(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds -N $< $(build_id_linker) \
>             $(orphan-handling-y) $(@D)/.$(@F).1.o -o $@
> -       $(NM) -pa --format=3Dsysv $(@D)/$(@F) \
> +       $(NM) -pa --format=3Dsysv $@ \
>                 | $(objtree)/tools/symbols --all-symbols --xensyms --sysv=
 --sort \
> -               >$(@D)/$(@F).map
> +               > $@.map
>         rm -f $(@D)/.$(@F).[0-9]* $(@D)/..$(@F).[0-9]*
>  ifeq ($(CONFIG_XEN_IBT),y)
>         $(SHELL) $(srctree)/tools/check-endbr.sh $@
> @@ -224,8 +224,9 @@ endif
>         $(MAKE) $(build)=3D$(@D) .$(@F).1r.o .$(@F).1s.o
>         $(LD) $(call EFI_LDFLAGS,$(VIRT_BASE)) -T $(obj)/efi.lds -N $< \
>               $(@D)/.$(@F).1r.o $(@D)/.$(@F).1s.o $(orphan-handling-y) $(=
note_file_option) -o $@
> -       $(NM) -pa --format=3Dsysv $(@D)/$(@F) \
> -               | $(objtree)/tools/symbols --all-symbols --xensyms --sysv=
 --sort >$(@D)/$(@F).map
> +       $(NM) -pa --format=3Dsysv $@ \
> +               | $(objtree)/tools/symbols --all-symbols --xensyms --sysv=
 --sort \
> +               > $@.map
>  ifeq ($(CONFIG_DEBUG_INFO),y)
>         $(if $(filter --strip-debug,$(EFI_LDFLAGS)),:$(space))$(OBJCOPY) =
-O elf64-x86-64 $@ $@.elf
>  endif
>
>

