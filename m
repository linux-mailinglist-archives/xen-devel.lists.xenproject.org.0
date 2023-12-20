Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD0A81AB26
	for <lists+xen-devel@lfdr.de>; Thu, 21 Dec 2023 00:40:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.658381.1027539 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rG6Aq-0006ni-CJ; Wed, 20 Dec 2023 23:40:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 658381.1027539; Wed, 20 Dec 2023 23:40:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rG6Aq-0006lF-9K; Wed, 20 Dec 2023 23:40:24 +0000
Received: by outflank-mailman (input) for mailman id 658381;
 Wed, 20 Dec 2023 23:40:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mMzY=H7=google.com=samitolvanen@srs-se1.protection.inumbo.net>)
 id 1rG6Ao-0006l9-Hi
 for xen-devel@lists.xenproject.org; Wed, 20 Dec 2023 23:40:22 +0000
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [2607:f8b0:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 22348f8e-9f91-11ee-9b0f-b553b5be7939;
 Thu, 21 Dec 2023 00:40:19 +0100 (CET)
Received: by mail-ot1-x32a.google.com with SMTP id
 46e09a7af769-6da4893142aso129554a34.0
 for <xen-devel@lists.xenproject.org>; Wed, 20 Dec 2023 15:40:19 -0800 (PST)
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
X-Inumbo-ID: 22348f8e-9f91-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1703115618; x=1703720418; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UT9ddCwESgsBoC0klthrCGoZVKiU2GhW3IYmRpWSVN4=;
        b=n8Gs+6OekXS4rQsY9DOFI3B90rCoypWLaJBMhW9V1s5U8k3sLK1/J+jmOabeVGG98J
         GdB8UlfCYFeL55bEBCrcFxlDRZiB/BBop7JDwYYbET9tJ94F2W3/5pTd7rwSyaak8P/b
         yWVNDox+ElTlG8uQRoiV8ijJ/ymft9inzACSXjyIxhiOO2nu1u3f4xE7KocnIsdnbmTk
         chkZISlFlEljDhxyVK1EX7CAn93bCb5pg5jdVYng9TjARpY4DPHIR5JUK77EgHYe0hpl
         waSy/jp07JZUgWUAfUNVr1VWY4/ORmmXUxjmdHX4MjHDukTiKUn2DNT76o4x3/QvUVJZ
         vh/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703115618; x=1703720418;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UT9ddCwESgsBoC0klthrCGoZVKiU2GhW3IYmRpWSVN4=;
        b=CMZ/mvPKUbzhuNkqA2Gl8n73XtkimjTD6DpyGdmAwXQUS7lH3aRqvDvfc/GOtJyzuR
         fKaKucpVmvocnupYuZLzzGq3JeZ9kh60u4YWGrPVFxqUQtsxctgVswZ73J8JgAATCFhu
         GIoVJvf5GA6yKfh4vJaRyKF4bN2YGU2KErhmptIcFVBMPYF8Q6SQdwDKLYxp2+x9rS/U
         jkPYBiFhBkZvOt0p/bkzoaGatMNEeXXYLT++YLa9sAkIthMD+uZp61GEv8jlYLmI5O5V
         vk1sNyPHK3w6aEl57B1S7y9i1pHpjlQ5qpLDtaHEFw0FQvWzl73xxyjNG/0/DOXTiaFF
         TgCA==
X-Gm-Message-State: AOJu0YzTfX65sp4uB/IhHmew7F8bU3Xt6WcZjMgkagIuA1CJ1sOZQcbV
	4MqpTXre0/2Ov5iLon1FIz4EuDG5hxkBz0jc4ajkZg==
X-Google-Smtp-Source: AGHT+IFl1yH9HmEtW/GRt/3W2yqcGB7F1oFfk9bZiSKJ12kXycsrXzJ5TDlaI7WhVRoyr+AHA0ljXKlr1IzXq/x2Slk=
X-Received: by 2002:a05:6830:18c2:b0:6d9:f031:4e76 with SMTP id
 v2-20020a05683018c200b006d9f0314e76mr20116594ote.69.1703115618088; Wed, 20
 Dec 2023 15:40:18 -0800 (PST)
MIME-Version: 1.0
References: <202312191507.348721d2-oliver.sang@intel.com> <20231219095821.GAZYFpPUSKexZAcl05@fat_crate.local>
 <CAHk-=wimbX8UF6ECo53Hm4Vz0tCC7jjN9e3tEhZfoEtsxyfU-A@mail.gmail.com>
 <87013f74-5828-4bef-848b-ffedde8e86f5@citrix.com> <CAHk-=wh=z-aXw6o8Hi9SiC5-vwP403-ZpDHUOXdXmLbaG93dvQ@mail.gmail.com>
 <CAHk-=whfpRxuucUL1oguRivq0e7JSxNWC2p_6gvKriNTHmr0UQ@mail.gmail.com>
In-Reply-To: <CAHk-=whfpRxuucUL1oguRivq0e7JSxNWC2p_6gvKriNTHmr0UQ@mail.gmail.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Wed, 20 Dec 2023 15:39:40 -0800
Message-ID: <CABCJKud8PG_ho79it34JxHG07n_Kbe9SLeBkEJwMYP_kS80D_g@mail.gmail.com>
Subject: Re: [linus:master] [x86/entry] be5341eb0d: WARNING:CPU:#PID:#at_int80_emulation
To: Linus Torvalds <torvalds@linuxfoundation.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Borislav Petkov <bp@alien8.de>, 
	kernel test robot <oliver.sang@intel.com>, Thomas Gleixner <tglx@linutronix.de>, oe-lkp@lists.linux.dev, 
	lkp@intel.com, linux-kernel@vger.kernel.org, 
	Dave Hansen <dave.hansen@linux.intel.com>, 
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 19, 2023 at 3:15=E2=80=AFPM Linus Torvalds
<torvalds@linuxfoundation.org> wrote:
>
> On Tue, 19 Dec 2023 at 12:17, Linus Torvalds
> <torvalds@linuxfoundation.org> wrote:
> >
> > That said, I still think that just getting rid of this horrid special
> > case for posix timers is the right thing, and we should just remove
> > that SYS_NI() alias thing entirely.
>
> IOW, something like the attached patch.
>
> It's not extensively tested, but hey, the diffstat looks nice:
>
>   arch/arm64/include/asm/syscall_wrapper.h |  4 ---
>   arch/riscv/include/asm/syscall_wrapper.h |  5 ----
>   arch/s390/include/asm/syscall_wrapper.h  | 13 +--------
>   arch/x86/include/asm/syscall_wrapper.h   | 34 +++---------------------
>   kernel/sys_ni.c                          | 14 ++++++++++
>   kernel/time/posix-stubs.c                | 45 -------------------------=
-------
>   6 files changed, 19 insertions(+), 96 deletions(-)
>
> and it builds in at least a *couple* of configurations, including with
> CONFIG_POSIX_TIMERS disabled.
>
> I did *not* check whether it might fix the warning, since I doubt my
> user space would even boot without that posix timer support (actually,
> honestly, because I'm just lazy and "it _looks_ fine to me" was the
> main real thing).

I tested the patch with the 0-day bot reproducer and it does fix the
warning. My usual arm64 and riscv configs also seem to build and boot
just fine.

> But that SYS_NI() thing really does deserve to die, as it was purely
> used as a hack for some random timer system calls.
>
> Comments?

Removing the SYS_NI bits is definitely a cleaner solution. Looks good to me=
.

Reviewed-by: Sami Tolvanen <samitolvanen@google.com>
Tested-by: Sami Tolvanen <samitolvanen@google.com>

Sami

