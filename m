Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F58481AE75
	for <lists+xen-devel@lfdr.de>; Thu, 21 Dec 2023 06:39:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.658463.1027609 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGBm6-00013i-NE; Thu, 21 Dec 2023 05:39:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 658463.1027609; Thu, 21 Dec 2023 05:39:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGBm6-000121-KR; Thu, 21 Dec 2023 05:39:14 +0000
Received: by outflank-mailman (input) for mailman id 658463;
 Thu, 21 Dec 2023 05:39:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QwbI=IA=linuxfoundation.org=torvalds@srs-se1.protection.inumbo.net>)
 id 1rGBm5-00011r-RQ
 for xen-devel@lists.xenproject.org; Thu, 21 Dec 2023 05:39:13 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 44b8e112-9fc3-11ee-9b0f-b553b5be7939;
 Thu, 21 Dec 2023 06:39:11 +0100 (CET)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a233a60f8feso39354766b.0
 for <xen-devel@lists.xenproject.org>; Wed, 20 Dec 2023 21:39:11 -0800 (PST)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com.
 [209.85.218.50]) by smtp.gmail.com with ESMTPSA id
 e2-20020a170906374200b00a1d2b0d4500sm549857ejc.168.2023.12.20.21.39.09
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Dec 2023 21:39:09 -0800 (PST)
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-a2331caab22so37608866b.3
 for <xen-devel@lists.xenproject.org>; Wed, 20 Dec 2023 21:39:09 -0800 (PST)
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
X-Inumbo-ID: 44b8e112-9fc3-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1703137151; x=1703741951; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=I4Z30xKd74ObUozsJeNEksBVIOfy4kYjAEpzTgDQdMk=;
        b=D1bwxMVvwe+IOSpjC6nW6gRlIUiu7hJCaNn9m2eUHcqUg0Bu0dVaLpQcohn9Vmnfek
         YkSDfutSY6lJ3detqdtDuAhMoV3MqB0RaNBThZEsZbr+VG2rLQ+p1Qu0kjypDxN0FE59
         69vFdW2d4243qYIqllAsjDFSYRqvpxzH9IO8I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703137151; x=1703741951;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I4Z30xKd74ObUozsJeNEksBVIOfy4kYjAEpzTgDQdMk=;
        b=Ric8/stA1sJn0kGA/eGvTwBR2Zk/nnYHw1941aryHsS3VTOeZuZQBXdP/fQiBCmzYf
         Q9i2VAxl1xzVegwO6/+mALjIorLuwmKkxc/ffI0tpLDgvPee/0ya/gPek9xNY0qL/Yc5
         kjT+zwgUkFTgSS1Ce6MNkOlJI3aYSuCs6rqYy1e0zBUqIg76PrZFbMTwcvYiNlncOTEU
         p4pOeucXcggFOq+xVJVlV+v3SGY02k6Vm/afXEIIUVNxwv5g5+3Xr3WDqZL6ucCQ4Rhi
         U/6mIlDOpIFxs+rCHuiDDu4SypnMFp9NhaP262AxXGPGlAzwW33WGGWkI71jRKrcxXVY
         7N6w==
X-Gm-Message-State: AOJu0YwoKm7/Q1ByEVHL1+okfDZtJyvK2XkyRTXkELUfXfONGgA0tV6S
	xx7fvg/p+jUgWpH7voKXc13EYRzXLO8UWaS71ewfRTO/
X-Google-Smtp-Source: AGHT+IE6KNsIBNzbyeuC/L7g2fb5k0lQTB07Gfji4gKDjtsk6SC0IKGohQsgJFQP+VXW+zIAoGhi1w==
X-Received: by 2002:a17:906:1004:b0:a23:6ea2:de83 with SMTP id 4-20020a170906100400b00a236ea2de83mr2355594ejm.1.1703137151011;
        Wed, 20 Dec 2023 21:39:11 -0800 (PST)
X-Received: by 2002:a17:906:27d4:b0:a23:6493:7211 with SMTP id
 k20-20020a17090627d400b00a2364937211mr2723108ejc.114.1703137148904; Wed, 20
 Dec 2023 21:39:08 -0800 (PST)
MIME-Version: 1.0
References: <202312191507.348721d2-oliver.sang@intel.com> <20231219095821.GAZYFpPUSKexZAcl05@fat_crate.local>
 <CAHk-=wimbX8UF6ECo53Hm4Vz0tCC7jjN9e3tEhZfoEtsxyfU-A@mail.gmail.com>
 <87013f74-5828-4bef-848b-ffedde8e86f5@citrix.com> <CAHk-=wh=z-aXw6o8Hi9SiC5-vwP403-ZpDHUOXdXmLbaG93dvQ@mail.gmail.com>
 <CAHk-=whfpRxuucUL1oguRivq0e7JSxNWC2p_6gvKriNTHmr0UQ@mail.gmail.com> <CABCJKud8PG_ho79it34JxHG07n_Kbe9SLeBkEJwMYP_kS80D_g@mail.gmail.com>
In-Reply-To: <CABCJKud8PG_ho79it34JxHG07n_Kbe9SLeBkEJwMYP_kS80D_g@mail.gmail.com>
From: Linus Torvalds <torvalds@linuxfoundation.org>
Date: Wed, 20 Dec 2023 21:38:51 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgQvNhB+7nwUkWs8jkh8qbd0nipotYhhghFSVBNNoagcQ@mail.gmail.com>
Message-ID: <CAHk-=wgQvNhB+7nwUkWs8jkh8qbd0nipotYhhghFSVBNNoagcQ@mail.gmail.com>
Subject: Re: [linus:master] [x86/entry] be5341eb0d: WARNING:CPU:#PID:#at_int80_emulation
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Borislav Petkov <bp@alien8.de>, 
	kernel test robot <oliver.sang@intel.com>, Thomas Gleixner <tglx@linutronix.de>, oe-lkp@lists.linux.dev, 
	lkp@intel.com, linux-kernel@vger.kernel.org, 
	Dave Hansen <dave.hansen@linux.intel.com>, 
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 20 Dec 2023 at 15:40, Sami Tolvanen <samitolvanen@google.com> wrote:
>
> I tested the patch with the 0-day bot reproducer and it does fix the
> warning. My usual arm64 and riscv configs also seem to build and boot
> just fine.

Thanks. I've been running it on my machine too, and still don't see
anything wrong with it..

I suspect all sane people are already on xmas break, which explains
why people are being quiet. They _should_ be.

But since I'm not in that sane group, I decided to just bypass the
normal channels and apply it directly.

It really isn't all that critical, since I don't expect anybody to
actually disable the posix timer subsystem: I think the config
variable came out of the kernel minimization project, and it's
probably much more likely that people turn off CFI (particularly since
you afaik still need to build with clang to get it) than that they'd
turn off the posix timer support.

But I think it's a worthy cleanup of some messy system call macros, so
I wanted to put this behind us whether it truly matters or not.

            Linus

