Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80D4B7C7849
	for <lists+xen-devel@lfdr.de>; Thu, 12 Oct 2023 23:00:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.616030.957706 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qr2md-0007Y5-LN; Thu, 12 Oct 2023 20:59:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 616030.957706; Thu, 12 Oct 2023 20:59:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qr2md-0007Vm-Ib; Thu, 12 Oct 2023 20:59:51 +0000
Received: by outflank-mailman (input) for mailman id 616030;
 Thu, 12 Oct 2023 20:59:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Qqh1=F2=gmail.com=ubizjak@srs-se1.protection.inumbo.net>)
 id 1qr2mc-0007Vg-Iv
 for xen-devel@lists.xenproject.org; Thu, 12 Oct 2023 20:59:50 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 48102159-6942-11ee-98d4-6d05b1d4d9a1;
 Thu, 12 Oct 2023 22:59:49 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-53e08e439c7so2054165a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 12 Oct 2023 13:59:49 -0700 (PDT)
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
X-Inumbo-ID: 48102159-6942-11ee-98d4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697144389; x=1697749189; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BCC/dYmMqHRaR4te/Bo8/FimzrWr4aPFE83miAoEsEU=;
        b=YTywEXS+wJB510pw7GQB5ZrFxkHoagAuwj7V/2piluDXQJOHnrfAeJ7exHlROFP4g7
         rKugHh7XnK4T3FaRaFTXuHbJiFeHrDvMj3SX/98OTEyO8BC6Tuo+FUgJ1G5FbjGYKdrL
         aR+zI8cLHE2LGTXjs9p1vr751bIBHVf3Am1Sdg5osKc7o5Ri8jpMdRTYb0KloYFXG77Z
         QnsXumZwBTNHhX3xiERzCqVWEBpka4NzOywmpwEv+UxnsVverPB6s+Yqo2jQov6EP+cz
         kpZPuAx4wnnC0zh9Pe8qD6h6XxoR/cFG2qYcjh+CM+0cJvUz3SoH+x/uhT2eTENALgtR
         dfeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697144389; x=1697749189;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BCC/dYmMqHRaR4te/Bo8/FimzrWr4aPFE83miAoEsEU=;
        b=R98TcwNOwSUCGKDEkQeHl7bYa8Vzs718NWwApI3j002VLjmxy02IG3kGXGUYfJi0xn
         +EwfSX8cQACVyU7anU56QEqFal1LDg8FACS0kXgYWaPVA1Ey5Qh1dRJ+T/r+QMWRqvCG
         qWGkBflDvQHuC0/RJPW6TZpVbe5XQB2gi4bjFj3v5xdjNsRcD/86k/p/1OC+/FsnQ/Rx
         JTY7lQDRckqVOUBD+poa1j+G56D2PU6FOS4e16JytUYJsRzv1ArWi4tc8zo9iuZJQlMv
         uVRxM/65SAMdQL+Hvuedt4Naz+BAYVeWv4J9N7v1xS82n81EAA9VEk86WCeMYZr0ZZ/5
         m07A==
X-Gm-Message-State: AOJu0YwO/ZBcuqE7+h1lhAVNimXw1xPUDJX5nZva38LDSY1Z8cPXUmNU
	QeCycEb36smi8XQnGdyFM0x2mrt6jqrGC76uFXQ=
X-Google-Smtp-Source: AGHT+IHZwMvd2wgWbNi1gGdYLOSduJ0nYCAO57TK6PS6Rx2dIRYj1pM6S3C+nzgoUWkC0bS4WzGbE3OYqm4XYpZhvuY=
X-Received: by 2002:a05:6402:520b:b0:53d:9471:76b3 with SMTP id
 s11-20020a056402520b00b0053d947176b3mr8876672edd.7.1697144388617; Thu, 12 Oct
 2023 13:59:48 -0700 (PDT)
MIME-Version: 1.0
References: <20231012201743.292149-1-ubizjak@gmail.com> <3af8dcec-66ec-4bd4-b7bf-4bc6f5f3c70f@intel.com>
In-Reply-To: <3af8dcec-66ec-4bd4-b7bf-4bc6f5f3c70f@intel.com>
From: Uros Bizjak <ubizjak@gmail.com>
Date: Thu, 12 Oct 2023 22:59:37 +0200
Message-ID: <CAFULd4byzHyoz4xM1gL_T1wFkNE-ab8K4upXfPirxM9PdX5JWg@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] Introduce %rip-relative addressing to PER_CPU_VAR macro
To: Dave Hansen <dave.hansen@intel.com>
Cc: x86@kernel.org, xen-devel@lists.xenproject.org, 
	linux-kernel@vger.kernel.org, Juergen Gross <jgross@suse.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 12, 2023 at 10:53=E2=80=AFPM Dave Hansen <dave.hansen@intel.com=
> wrote:
>
> On 10/12/23 13:12, Uros Bizjak wrote:
> > The last patch introduces (%rip) suffix and uses it for x86_64 target,
> > resulting in a small code size decrease: text data bss dec hex filename
> > 25510677 4386685 808388 30705750 1d48856 vmlinux-new.o 25510629 4386685
> > 808388 30705702 1d48826 vmlinux-old.o
>
> I feel like I'm missing some of the motivation here.
>
> 50 bytes is great and all, but it isn't without the cost of changing
> some rules and introducing potential PER_CPU_ARG() vs. PER_CPU_VAR()
> confusion.
>
> Are there some other side benefits?  What else does this enable?

These changes are necessary to build the kernel as Position
Independent Executable (PIE) on x86_64 [1]. And since I was working in
percpu area I thought that it was worth implementing them.

[1] https://lore.kernel.org/lkml/cover.1682673542.git.houwenlong.hwl@antgro=
up.com/

Uros.

