Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64451819141
	for <lists+xen-devel@lfdr.de>; Tue, 19 Dec 2023 21:18:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.657202.1025924 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFgXT-0002L6-90; Tue, 19 Dec 2023 20:18:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 657202.1025924; Tue, 19 Dec 2023 20:18:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFgXT-0002Ig-52; Tue, 19 Dec 2023 20:18:03 +0000
Received: by outflank-mailman (input) for mailman id 657202;
 Tue, 19 Dec 2023 20:18:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XNVD=H6=linuxfoundation.org=torvalds@srs-se1.protection.inumbo.net>)
 id 1rFgXR-0002Ia-8k
 for xen-devel@lists.xenproject.org; Tue, 19 Dec 2023 20:18:01 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b4552933-9eab-11ee-98eb-6d05b1d4d9a1;
 Tue, 19 Dec 2023 21:17:59 +0100 (CET)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-55372c1338bso2923730a12.2
 for <xen-devel@lists.xenproject.org>; Tue, 19 Dec 2023 12:17:59 -0800 (PST)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com.
 [209.85.218.42]) by smtp.gmail.com with ESMTPSA id
 vx12-20020a170907a78c00b00a1ddb5a2f7esm15912080ejc.60.2023.12.19.12.17.58
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Dec 2023 12:17:58 -0800 (PST)
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-a2331caab22so407121766b.3
 for <xen-devel@lists.xenproject.org>; Tue, 19 Dec 2023 12:17:58 -0800 (PST)
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
X-Inumbo-ID: b4552933-9eab-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1703017079; x=1703621879; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2YQISh9f/hMVihywyg7rkbccdS6kJ5BjuKERfau1fMo=;
        b=Gfopgk2OPF0t1jhqGQfVn+qC7NuOnvfag4ynoduMwrcOm9ilXI48XFDH2cjnoVDj2S
         hw6tFSMlxc4lmQjv0O/IjOFs/FnQCbBE8M0xcH3cCaZOYX3S/lntPdZsFdGJ/SYJaxf/
         xHWxPBhMW776xqbg0NuIUs8+z3Wn4HXDH0Ils=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703017079; x=1703621879;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2YQISh9f/hMVihywyg7rkbccdS6kJ5BjuKERfau1fMo=;
        b=q9SIbL/hATcmtlOWUiW9pGDVhc47xD4FtrI3ksUlq6rPvpP6gmRaYF1TY8DYY3jByD
         RHm1XhbD2cokfiTLkk776tOWlzR/Dm334nHz39yOhfv8Jt4fQnQMEAag6MqHms0AJ5Q+
         j00LqccwBSgZZAN0K7ar3M4WJU/y3W4xL/Izp8s7l8hn49iL7tg+dnIdHyA8az1bn0kS
         8eYbIlNwGEV4U9TSJL6y5rmeUXj17l6JW4ku+rWTdP0yeFppqJqqlXhB206eRqEKmeT5
         hLWIjA6zx/8SG2F8BYFCTITB2aeMG31AFAY6JTMWRA55aENHorM658ZqOPxAUd2U8iec
         Xdbw==
X-Gm-Message-State: AOJu0Yy6CbIfdE1GwPQOrlTLuJ9iP1nrLUhl3mktBqBni3Rfps1u5lnY
	eulgoEpQRtHTWEoIpzGUX3E1ijpEzFFNC+n1o6KIYn9y
X-Google-Smtp-Source: AGHT+IF73DDNUHFj8PsHIimgsDvk5b3sVHsVAsPzO+R/FBjBf2L0p3d82NWCzcm5T2R7c8QrrAe1Xw==
X-Received: by 2002:a17:906:74c2:b0:a23:2e46:84cc with SMTP id z2-20020a17090674c200b00a232e4684ccmr2305318ejl.153.1703017079254;
        Tue, 19 Dec 2023 12:17:59 -0800 (PST)
X-Received: by 2002:a17:906:aed8:b0:a23:7576:3551 with SMTP id
 me24-20020a170906aed800b00a2375763551mr696466ejb.109.1703017078207; Tue, 19
 Dec 2023 12:17:58 -0800 (PST)
MIME-Version: 1.0
References: <202312191507.348721d2-oliver.sang@intel.com> <20231219095821.GAZYFpPUSKexZAcl05@fat_crate.local>
 <CAHk-=wimbX8UF6ECo53Hm4Vz0tCC7jjN9e3tEhZfoEtsxyfU-A@mail.gmail.com> <87013f74-5828-4bef-848b-ffedde8e86f5@citrix.com>
In-Reply-To: <87013f74-5828-4bef-848b-ffedde8e86f5@citrix.com>
From: Linus Torvalds <torvalds@linuxfoundation.org>
Date: Tue, 19 Dec 2023 12:17:40 -0800
X-Gmail-Original-Message-ID: <CAHk-=wh=z-aXw6o8Hi9SiC5-vwP403-ZpDHUOXdXmLbaG93dvQ@mail.gmail.com>
Message-ID: <CAHk-=wh=z-aXw6o8Hi9SiC5-vwP403-ZpDHUOXdXmLbaG93dvQ@mail.gmail.com>
Subject: Re: [linus:master] [x86/entry] be5341eb0d: WARNING:CPU:#PID:#at_int80_emulation
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Borislav Petkov <bp@alien8.de>, kernel test robot <oliver.sang@intel.com>, 
	Thomas Gleixner <tglx@linutronix.de>, oe-lkp@lists.linux.dev, lkp@intel.com, 
	linux-kernel@vger.kernel.org, Dave Hansen <dave.hansen@linux.intel.com>, 
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 19 Dec 2023 at 11:15, Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>
> -asmlinkage long sys_ni_posix_timers(void);
> +asmlinkage long sys_ni_posix_timers(const struct pt_regs *regs);

I don't think it should be asmlinkage. That means "use legacy asm
calling conventions", and for x86-32 that means pass on stack. Which I
don't think these actually are.

I think it's an old artefect, and it doesn't matter for something that
doesn't take any arguments, but when you add an argument it's actively
wrong.

Of course, that argument isn't _used_, so it still doesn't matter, but
if the point is to use the right prototype, I think we should just
make it be

    long sys_ni_posix_timers(const struct pt_regs *regs);

although I think Sami's suggestion is probably nicer.

That said, I still think that just getting rid of this horrid special
case for posix timers is the right thing, and we should just remove
that SYS_NI() alias thing entirely.

          Linus

