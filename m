Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AEDAAA3B8F
	for <lists+xen-devel@lfdr.de>; Wed, 30 Apr 2025 00:35:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.973183.1361372 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9tXV-0007OB-PU; Tue, 29 Apr 2025 22:34:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 973183.1361372; Tue, 29 Apr 2025 22:34:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9tXV-0007Kp-Mw; Tue, 29 Apr 2025 22:34:57 +0000
Received: by outflank-mailman (input) for mailman id 973183;
 Tue, 29 Apr 2025 22:34:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rc0E=XP=linuxfoundation.org=torvalds@srs-se1.protection.inumbo.net>)
 id 1u9tXU-0007Kj-H2
 for xen-devel@lists.xenproject.org; Tue, 29 Apr 2025 22:34:56 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 28e6d1c0-254a-11f0-9ffb-bf95429c2676;
 Wed, 30 Apr 2025 00:34:49 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-acb615228a4so66051266b.0
 for <xen-devel@lists.xenproject.org>; Tue, 29 Apr 2025 15:34:49 -0700 (PDT)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com.
 [209.85.208.44]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ace6ed701f9sm842797766b.139.2025.04.29.15.34.47
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Apr 2025 15:34:47 -0700 (PDT)
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-5efe8d9eb1eso563897a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 29 Apr 2025 15:34:47 -0700 (PDT)
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
X-Inumbo-ID: 28e6d1c0-254a-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1745966088; x=1746570888; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Oc5Kg3k3xlsA9pOUU6bgWUdMQMuuSGtxKsnW3LcmO1M=;
        b=fNo2daedeiRKbiYe2DMijIX18AufzYfv6BaVwOzu4EGSaM5XMJdVMIeKJ0/PYkT4LF
         gFlJIVYujWJMQslCTCpQyuMsWK9eFl/O2mN7IK3BhNIRLjrtyV73uiKKnf9br+Hivvrq
         xdLjo19SfpKH9Rzg+2zRb1iLWLjhbDcaG5Q5U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745966088; x=1746570888;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Oc5Kg3k3xlsA9pOUU6bgWUdMQMuuSGtxKsnW3LcmO1M=;
        b=I6covf4trEetRViqWjjSJXU3sOhXyncfbNhs7srAhKWvgWBezxyhkKWWXDOKCXGnHc
         4WGRbGroEh6XiyUgA0VYWOJ8X/8jiWZznZagQh/mNCqtGZX5zAZ+RkJUEcnM08kx0iUj
         ASfaHdgQu0ogO/cfcY1N+6bH2smXzE2LNfDkb94+WNwCyv0QeHWM7scfVAOjepp4c39L
         s6q3Qodc9B6toDRHkubih+4bieJIQ4FuyVA1vhpBnObsdO8SS/GHK2rvhubFpucXA7Fe
         wJu0EFJU5hyccAT+wOexCppMcAh+4ryhQ1R7c5dmeSl06T4nKnv0Z244AJhbtLsY5Ny6
         RO8w==
X-Forwarded-Encrypted: i=1; AJvYcCUWggGxkGyXusOO+LxogXHLdQZf98Mq+bSbkkY7h0Z+ZpMgZEe1C8hvJzzs7/T48LoLxLGPaD0CPcc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzhxorJw6dpaTGRzNa97oA2t9CckWixWjfr3TvWKqrY+YYGLchv
	HU5Cx1yomVxaZLUsn2lxv8koyPMP9rrPM0PcTlGj9TLKTX275VlMqSFevaq3MDO99ajUS2mC6iv
	t7AocJA==
X-Gm-Gg: ASbGncvuVwJID+Rgdc2wsz+Zy7HdsmzXsYiTosHqVMQ2bhvaFWnl3dj6N0cRfpndnvJ
	O+IgMflqQzeKlM6nBb2z8uMB20zLAcWgKUUyrS0vIp4KjEDlGKOZAziFgPzZ3ks2MS4tNLHHt7z
	RuGcYPciocQJmqrYqgGyFZn6buMta1jUkOIP/eHt0lXX2cH3PyJHjJF7Iayv5Q7fO45bC2n463i
	IDtezUfqdFDCX9p7HsMJljGLU2PpveYjrenIn/9p0wWBT2sNOcASHGyg7mS1GxOKkeOjKYvtl7r
	R6eWlYr2WHRl/mHDZP9v1TVQbb5fcWYDdEOyX4qJ8eagycyGIjkeHigItB0G7yP8vlExxNENPZp
	LZlvLoificjeUBWI=
X-Google-Smtp-Source: AGHT+IE38+YtziS7gWG67JrO4RNQVQ4vPMQuDq4SMEpt9UOkJsJh+r0sh3uIE+R8KyXhdqkQn+w7JQ==
X-Received: by 2002:a17:906:6a1e:b0:ace:8176:9870 with SMTP id a640c23a62f3a-acedf68d357mr47492266b.9.1745966088575;
        Tue, 29 Apr 2025 15:34:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWgyHKdgCIn/1odd0Rw+KNhK9rfR0HwO6gVAZ7mAikTR9BNZRGJ9ooQPdp/csHC/55Ic91psb334C4=@lists.xenproject.org
X-Received: by 2002:a05:6402:3488:b0:5f6:4a5b:930d with SMTP id
 4fb4d7f45d1cf-5f89fe51d37mr514981a12.11.1745966086672; Tue, 29 Apr 2025
 15:34:46 -0700 (PDT)
MIME-Version: 1.0
References: <20250425141740.734030-1-arnd@kernel.org> <CAHk-=wj0S2vWui0Y+1hpYMEhCiXKexbQ01h+Ckvww8hB29az_A@mail.gmail.com>
 <aA8nF0moBYOIgC5J@gmail.com> <aA8oqKUaFU-0wb-D@gmail.com> <CAHk-=wgJfWfWa2NTiTmev+Xr=e8Uo=aFkrXujLAQBVAVN-VigQ@mail.gmail.com>
 <B364FF6D-DFCC-42A7-ACA1-6A74E27EE57E@zytor.com> <67be5eee-b67b-409a-8309-829f891b9944@citrix.com>
 <916BD58C-E6A7-495E-9A60-722E130AC7A7@zytor.com> <e5e97ff8-9670-40d1-a0fa-69504d34c4c4@citrix.com>
 <956DB0ED-F3DB-456D-8D06-6F40DBDB815A@zytor.com> <06d04c13-76e8-45fb-a563-e365e1f19362@citrix.com>
 <CAHk-=wig1E4B-e1_6=it1LfVQ64DJsVgO6f6Ytnbzm2qChbAdw@mail.gmail.com>
 <81ed8b53-1a40-4777-ab87-4f4abe032dbc@citrix.com> <CAHk-=wiAPQFf-RUr=8ra1sYdfGPGLb4QbV8THE9zY3n820L94g@mail.gmail.com>
 <72078B8D-F03E-4783-8AC2-A36464A4B6A1@zytor.com> <CAHk-=wi=nuDW6yCXSA-dEztZhXNuzLOaH--s_V7GOAE7n6RsRw@mail.gmail.com>
 <565ac06a-005f-4b77-930e-d63285c025b9@citrix.com> <CAHk-=wiMN7eMYE=SiA07f2aFFeuEV0YJ-ewoW4rJ3yQfbviuJA@mail.gmail.com>
 <7e0c2b99-00c1-4e64-ac68-50ba7500fd20@citrix.com>
In-Reply-To: <7e0c2b99-00c1-4e64-ac68-50ba7500fd20@citrix.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 29 Apr 2025 15:34:30 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjpUbDYw5O+zXWMq8yq91zaZFLUgZJ0Y1PU1g-OCiftrQ@mail.gmail.com>
X-Gm-Features: ATxdqUG9ooiLW1FjokHyuPv-6NWWppXUVmXsmKprDfDV5sYeskxfWUGa3Yy8OuE
Message-ID: <CAHk-=wjpUbDYw5O+zXWMq8yq91zaZFLUgZJ0Y1PU1g-OCiftrQ@mail.gmail.com>
Subject: Re: [PATCH] bitops/32: Convert variable_ffs() and fls() zero-case
 handling to C
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Arnd Bergmann <arnd@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Juergen Gross <jgross@suse.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	Alexander Usyskin <alexander.usyskin@intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?Q?Mateusz_Jo=C5=84czyk?= <mat.jonczyk@o2.pl>, 
	Mike Rapoport <rppt@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 29 Apr 2025 at 15:22, Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>
> Oh, I didn't realise there was also a perf difference too, but Agner Fog
> agrees.

The perf difference is exactly because of the issue where the non-rep
one acts as a cmov, and has basically two inputs (the bits to test in
the source, and the old value of the result register)

I guess it's not "fundamental", but lzcnt is basically a bit simpler
for hardware to implement, and the non-rep legacy bsf instruction
basically has a dependency on the previous value of the result
register.

So even when it's a single uop for both cases, that single uop can be
slower for the bsf because of the (typically false) dependency and
extra pressure on the rename registers.

       Linus

