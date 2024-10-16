Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E9159A0D65
	for <lists+xen-devel@lfdr.de>; Wed, 16 Oct 2024 16:54:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.820086.1233585 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t15Pd-0007OB-Ni; Wed, 16 Oct 2024 14:54:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 820086.1233585; Wed, 16 Oct 2024 14:54:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t15Pd-0007MZ-Kt; Wed, 16 Oct 2024 14:54:09 +0000
Received: by outflank-mailman (input) for mailman id 820086;
 Wed, 16 Oct 2024 14:54:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zOTK=RM=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1t15Pb-0007MT-Ty
 for xen-devel@lists.xenproject.org; Wed, 16 Oct 2024 14:54:07 +0000
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [2607:f8b0:4864:20::22a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7dbe44c0-8bce-11ef-a0be-8be0dac302b0;
 Wed, 16 Oct 2024 16:54:06 +0200 (CEST)
Received: by mail-oi1-x22a.google.com with SMTP id
 5614622812f47-3e5f835c024so283668b6e.2
 for <xen-devel@lists.xenproject.org>; Wed, 16 Oct 2024 07:54:06 -0700 (PDT)
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
X-Inumbo-ID: 7dbe44c0-8bce-11ef-a0be-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1729090445; x=1729695245; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ggVZTExQuEWabaaIEg4MKPe8PJVnLzDsRtgbEuoiAsg=;
        b=UBnNEk3ttDiqqVlGP91LPLRGu9FPCDBtkOrskUqnXk/ZrDgedDeZnFel7YBky4GBkm
         rSCjLzxl30aO1INK7Weu2+sZwt7VeU3WGIuIlj7h7vAgcz2uMFoDnaj8eJvhHbUq0ix/
         I02mPLPP28f3lQX67OV3KT5HTgJF7ozr3dUJw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729090445; x=1729695245;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ggVZTExQuEWabaaIEg4MKPe8PJVnLzDsRtgbEuoiAsg=;
        b=JFYOKIGeFbEVjGlgDCXcFsVgBhW2BTfTdFJKWz8kHDgKjITX/wa4kUuvf7pyiMWPqU
         XUxlW5xOM53Ylw/9uuQL2vG+RAm3CDdHvVS097eaXl10fOmcupFh5msH9+u5l71w/9qz
         fXpPmREIJowR/nB2cB5tIZNguDQ15tIQGOUHyzY5Gp01FRCucr4M+6wt1exhHJTnYGWl
         vttKnZig/PoVEDt+GgjBhgrR2dyDSiOX0WL3UPnyBe+tsUCFybZza271qw+gmhyGe4UT
         OU9mJZ8m8UWhh2jfiCritXrlVxUpJyhBVrQmYpv6jq1pXy8nHBuqiMdR/e4UaZtMalOu
         A/Bw==
X-Gm-Message-State: AOJu0YyLGAK60sVjwVmq4NgwACWWXtTOBjnAU0RZ+ebwu21BdmVZBox7
	y4bv+gf7WhubpHmvv3O11pHUROKHesqydOS15q3sgSegT53w36UdYl/cnp2Gr3CTC5OuVA365qi
	FrFgFweu5gu+ASz4TrETF7NcXQrMGy9kI+8vpbA==
X-Google-Smtp-Source: AGHT+IErzRxcgDCbDbQkefhj5iMP86l33yIDrwVMB0hAetJjLNMPN2yCIAqmQZMaXYvzO9AzyTEORoaJLca39Ti/RvY=
X-Received: by 2002:a05:6808:f87:b0:3e2:8696:4b4f with SMTP id
 5614622812f47-3e5f0249e47mr4405767b6e.19.1729090445504; Wed, 16 Oct 2024
 07:54:05 -0700 (PDT)
MIME-Version: 1.0
References: <20241016092154.1493035-1-frediano.ziglio@cloud.com> <821ac8cc-a0ac-412b-8069-73c52541b70b@citrix.com>
In-Reply-To: <821ac8cc-a0ac-412b-8069-73c52541b70b@citrix.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Wed, 16 Oct 2024 15:53:54 +0100
Message-ID: <CACHz=Zj9m2tkPPbtJuCT5g_NtDRA3iMPBzxM8R5Jxp1ofVc8oQ@mail.gmail.com>
Subject: Re: lib32 followup (visibility issue and/or toolchain bug?)
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
	"Daniel P. Smith" <dpsmith@apertussolutions.com>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 16, 2024 at 2:30=E2=80=AFPM Andrew Cooper <andrew.cooper3@citri=
x.com> wrote:
>
> Hello,
>
> Preempting some future work I'm expecting to arrive, I had a go at using
> __builtin_*() in obj32.
>
> This is formed of 2 patches on top of this series:
> https://xenbits.xen.org/gitweb/?p=3Dpeople/andrewcoop/xen.git;a=3Dshortlo=
g;h=3Drefs/heads/xen-lib32
>

You are confident we'll have a lot of shared code to need an
additional "lib32" in the Makefile!
I would personally stick with obj32.
Note that file should be strlen.c, not strlen.32.c, otherwise you are
possibly going to pick up the general rule and not the one in the
Makefile (but maybe is what you wanted).

> Patch 1 introduces lib32 beside obj32, with strlen() being the first
> broken-out function, and patch 2 swaps to __builtin_strlen().
>
> Both compile, but the difference that patch 2 introduces was unexpected.
>
> With just lib32, and taking strsubcmp() as an example, we get:
>
> 00000000 <strsubcmp>:
>    0:        83 ec 0c                 sub    $0xc,%esp
>    3:        89 5c 24 04              mov    %ebx,0x4(%esp)
>    7:        89 74 24 08              mov    %esi,0x8(%esp)
>    b:        89 c6                    mov    %eax,%esi
>    d:        89 d3                    mov    %edx,%ebx
>    f:        89 d0                    mov    %edx,%eax
>   11:    /-- e8 fc ff ff ff           call   12 <strsubcmp+0x12>
>             12: R_386_PC32    strlen
>   16:        89 c1                    mov    %eax,%ecx
>   18:        89 da                    mov    %ebx,%edx
>   1a:        89 f0                    mov    %esi,%eax
>   1c:    /-- e8 fc ff ff ff           call   1d <strsubcmp+0x1d>
>             1d: R_386_PC32    .text.strncmp
>   21:        8b 5c 24 04              mov    0x4(%esp),%ebx
>   25:        8b 74 24 08              mov    0x8(%esp),%esi
>   29:        83 c4 0c                 add    $0xc,%esp
>   2c:        c3                       ret
>
> which all seems fine.  We get a plain PC32 relocation to strlen (which
> is now in the separate library).
>
> However, with patch 2 in place (simply swapping the plain extern for
> __builtin_strlen(), we now get:
>
> 00000000 <strsubcmp>:
>    0:        83 ec 0c                 sub    $0xc,%esp
>    3:        89 1c 24                 mov    %ebx,(%esp)
>    6:        89 74 24 04              mov    %esi,0x4(%esp)
>    a:        89 7c 24 08              mov    %edi,0x8(%esp)
>    e:    /-- e8 fc ff ff ff           call   f <strsubcmp+0xf>
>             f: R_386_PC32    __x86.get_pc_thunk.bx
>   13:        81 c3 02 00 00 00        add    $0x2,%ebx
>             15: R_386_GOTPC    _GLOBAL_OFFSET_TABLE_
>   19:        89 c7                    mov    %eax,%edi
>   1b:        89 d6                    mov    %edx,%esi
>   1d:        89 d0                    mov    %edx,%eax
>   1f:    /-- e8 fc ff ff ff           call   20 <strsubcmp+0x20>
>             20: R_386_PLT32    strlen

PLT means it not declared hidden, otherwise it would have used the
relative relocation.
Maybe

size_t strlen(const char *s);
#define strlen(s) __builtin_strlen(s)

xen/compiler.h is included, so all declaration should get the hidden
by default ? Or add __attribute__((visibility("hidden"))) explicitly.

>   24:        89 c1                    mov    %eax,%ecx
>   26:        89 f2                    mov    %esi,%edx
>   28:        89 f8                    mov    %edi,%eax
>   2a:    /-- e8 fc ff ff ff           call   2b <strsubcmp+0x2b>
>             2b: R_386_PC32    .text.strncmp
>   2f:        8b 1c 24                 mov    (%esp),%ebx
>   32:        8b 74 24 04              mov    0x4(%esp),%esi
>   36:        8b 7c 24 08              mov    0x8(%esp),%edi
>   3a:        83 c4 0c                 add    $0xc,%esp
>   3d:        c3                       ret
>
>
> The builtin hasn't managed to optimise away the call to strlen (that's
> fine).  But, we've ended up spilling %ebx to the stack, calculating the
> location of the GOT and not using it.
>

Maybe the ABI for PLT is to have %ebx set to the GOT ? Not sure about it.

> So, as it stands, trying to use __builtin_strlen() results in worse code
> generation.  One thing I noticed was that we're not passing
> -fvisibility=3Dhidden into CFLAGS_x86_32, but fixing that doesn't help
> either.  We do have the pragma from compiler.h, so I'm out of visibility
> ideas.
>

The -fvisibility=3Dhidden should be overridden by the xen/compiler.h;
but should be overridden with hidden!
Maybe strlen is defined by default with another visibility?
If you generate the assembly, you should see if the strlen symbol gets
the .hidden bless or not.

> Anything else I've missed?
>

Coffee :-)

Frediano

