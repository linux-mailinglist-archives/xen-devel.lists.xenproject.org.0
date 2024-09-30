Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09DA0989DC4
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2024 11:14:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.807155.1218427 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svCTG-0005Bt-Uj; Mon, 30 Sep 2024 09:13:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 807155.1218427; Mon, 30 Sep 2024 09:13:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svCTG-00058h-RZ; Mon, 30 Sep 2024 09:13:34 +0000
Received: by outflank-mailman (input) for mailman id 807155;
 Mon, 30 Sep 2024 09:13:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Slsa=Q4=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1svCTF-00058a-6G
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2024 09:13:33 +0000
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com
 [2607:f8b0:4864:20::c30])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4261399f-7f0c-11ef-99a2-01e77a169b0f;
 Mon, 30 Sep 2024 11:13:31 +0200 (CEST)
Received: by mail-oo1-xc30.google.com with SMTP id
 006d021491bc7-5da686531d3so2394437eaf.3
 for <xen-devel@lists.xenproject.org>; Mon, 30 Sep 2024 02:13:30 -0700 (PDT)
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
X-Inumbo-ID: 4261399f-7f0c-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1727687609; x=1728292409; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8dsp8968ebIRuffewtTBriJKIPW7grSzD/WXH0iBkGg=;
        b=ISUtp/o4wtlUDlcelmB8udfXk7jWMykdRezwbIPWg2lzr8Tju4TC6AoRgjPfoKizGG
         1IWYDnh3+c9hpobBBVpZ8p6qYHU2UO8KjQACwFXTfYGBEVEIJJUP2dxYoSXV0+bXg5oo
         75siwxSLTIyZP+DdiICv7sXDjcTM2eNCnh7H0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727687609; x=1728292409;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8dsp8968ebIRuffewtTBriJKIPW7grSzD/WXH0iBkGg=;
        b=uhsSiCDHSiQQByiEFc4EuQ0DlnJ9BqX27AOJzenFnpVmovLjxdyDtcvSm5D/72KEdt
         ayMYrtlUvCPeP5bn9bSvZR6OZ79SrtR23yyPWY1JaUNnlqIdvg80lK9ItBx3KRkpQnBQ
         26lkzbSHwWsiUhFFijXIlY980m/mi4k7PUWV5E7CUUdYdh8mJ19MnbNYZmjWi7PM8W0h
         Qcm6SJS5YaTaW/RFawF9ah9/AVqt6Vm2gbdPyoMrZRkjhDAPt9W710ztiaEUSTm7CyDB
         iqZ2QanSATIFC12ktFG7zFyLUx2lMVm7gM+Nr2cjgohwTbwSeDIeamh4v3xbFVXpetuJ
         ECaA==
X-Forwarded-Encrypted: i=1; AJvYcCXQrkJLv50fYgKNr8LMcya1T8bHElbCrei39EpWJguKXbfwTHZZAhw1V692J4LvuZTz8NicCcv8J7A=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz5Cm7nAAjr6jfIJ/nliMmywroWrpP5BN9nMxsqWVlm64qYHyWg
	ekrqTvoJR9WpINvvYt0xELBuaLHsVST5Ufe8OU714+HAxQ51smV3CuJWN7XVSUrPjLZHfarDNjx
	zqe3cjErI5twtfKoY8jjqcRRKWFG0Kw0ssEgP/A==
X-Google-Smtp-Source: AGHT+IF61HSVLojzLivVS4D5RHKKuNeRVKg21rAi/nI0lAHOM6Qw3wd5MHX53dvgrrcDz4JgTDU10OgYeXzUI4uWoiw=
X-Received: by 2002:a05:6870:71c1:b0:268:2efa:2de0 with SMTP id
 586e51a60fabf-28710a4c863mr6427888fac.13.1727687609603; Mon, 30 Sep 2024
 02:13:29 -0700 (PDT)
MIME-Version: 1.0
References: <a68267c7465a9b0d2ed8f844a5e0145de50b0f3a.1725550985.git.alessandro.zucchelli@bugseng.com>
 <7357f6e8-2630-4027-b339-eedab9ae48c5@suse.com> <alpine.DEB.2.22.394.2409092149210.3672@ubuntu-linux-20-04-desktop>
 <44738f93-e99b-4f1c-9ed3-59dd2eac7aff@suse.com> <alpine.DEB.2.22.394.2409111808580.611587@ubuntu-linux-20-04-desktop>
 <24e33cc2-c9eb-4609-a074-51df81997aba@suse.com>
In-Reply-To: <24e33cc2-c9eb-4609-a074-51df81997aba@suse.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Mon, 30 Sep 2024 10:12:32 +0100
Message-ID: <CACHz=Zg7_h8Aqpf2=Gwnec5+TnoxoERa=VZNaQ4F=t+1WKjOKg@mail.gmail.com>
Subject: Re: [XEN PATCH v6] CODING_STYLE: Add a section on header guards
 naming conventions
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, 
	Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>, consulting@bugseng.com, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 30, 2024 at 9:58=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 12.09.2024 03:13, Stefano Stabellini wrote:
> > Hi Jan, we have gone back and forth on this a few times, but neither
> > Alessandro nor I fully understand your perspective. To help streamline
> > the process and save time for everyone, I suggest you provide an exampl=
e
> > of the rules written in the style you believe is appropriate. Once you
> > set the initial direction, Alessandro and I can continue and complete
> > the rest in that preferred style.
>
> Header inclusion guards
> -----------------------
>
> Unless otherwise specified, all header files should include proper
> guards to prevent multiple inclusions. The following naming conventions
> apply:
>
> - Guard names are derived from directory path underneath xen/ and the
>   actual file name.  Path components are separated by double underscores.
>   Alphabetic characters are converted to upper case.  Non-alphanumeric
>   characters are replaced by single underscores.

Possibly there should be no cases; but about "Non-alphanumeric
characters are replaced by single underscores" are we talking about
sequences or single entities? I would say sequences so
"Non-alphanumeric character sequences are replaced by single
underscores".
For instance "foo--bar.h" -> "FOO_BAR_H" and not "foo--bar.h" -> "FOO__BAR_=
H".

Another maybe not supported case is no ASCII characters in name. As
far as I can see they are not supported. Is it written somewhere?

> - Certain directory components are omitted, to keep identifier length
>   bounded:
>   - The top level include/,
>   - Any architecture's arch/<arch>/include/asm/ collapses to
>     ASM__<ARCH>__,
>   - Architecture-specific private files' arch/.
>
> For example:
>
> - Xen headers: XEN__<filename>_H
>   - include/xen/something.h -> XEN__SOMETHING_H
>
> - asm-generic headers: ASM_GENERIC__<filename>_H
>   - include/asm-generic/something.h -> ASM_GENERIC__SOMETHING_H
>
> - arch-specific headers: ASM__<architecture>__<subdir>__<filename>_H
>   - arch/x86/include/asm/something.h -> ASM__X86__SOMETHING_H
>
> - Private headers: <dir>__<filename>_H
>   - arch/arm/arm64/lib/something.h -> ARM__ARM64__LIB__SOMETHING_H
>   - arch/x86/lib/something.h -> X86__LIB__SOMETHING_H
>   - common/something.h -> COMMON__SOMETHING_H
>
> Note that this requires some discipline on the naming of future new
> sub-directories: There shouldn't be any random asm/ one anywhere, for
> example.  Nor should any new ports be named the same as top-level (within
> xen/) directories.  Which may in turn require some care if any new top-
> level directories were to be added.  Rule of thumb: Whenever a new sub-
> directory is added, check the rules for no collisions to result.
>
> Jan
>

Thanks for taking time to get to a proposal.

Frediano

