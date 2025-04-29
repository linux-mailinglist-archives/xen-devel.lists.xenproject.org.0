Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB531AA1BD9
	for <lists+xen-devel@lfdr.de>; Tue, 29 Apr 2025 22:13:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.973045.1361273 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9rKL-0000Qt-1f; Tue, 29 Apr 2025 20:13:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 973045.1361273; Tue, 29 Apr 2025 20:13:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9rKK-0000P8-V4; Tue, 29 Apr 2025 20:13:12 +0000
Received: by outflank-mailman (input) for mailman id 973045;
 Tue, 29 Apr 2025 20:13:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rc0E=XP=linuxfoundation.org=torvalds@srs-se1.protection.inumbo.net>)
 id 1u9rKJ-0000P2-IT
 for xen-devel@lists.xenproject.org; Tue, 29 Apr 2025 20:13:11 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5e9af3db-2536-11f0-9eb4-5ba50f476ded;
 Tue, 29 Apr 2025 22:13:09 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-ac2bdea5a38so952173666b.0
 for <xen-devel@lists.xenproject.org>; Tue, 29 Apr 2025 13:13:09 -0700 (PDT)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com.
 [209.85.218.45]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ace6ecfa347sm847784266b.91.2025.04.29.13.13.06
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Apr 2025 13:13:06 -0700 (PDT)
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-ac25d2b2354so978238266b.1
 for <xen-devel@lists.xenproject.org>; Tue, 29 Apr 2025 13:13:06 -0700 (PDT)
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
X-Inumbo-ID: 5e9af3db-2536-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1745957589; x=1746562389; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GD6DJTcwCWd1erihJG2XGCn33fsN6axQdQziR16yUsw=;
        b=HjeMKqRO3oYkbRRsgrZsqMvQ/YRtKEq4gf09PS+oYaDEyHu9gjyrF48p05xbvwITCR
         7uqQ+71FLqv2IpYm9STdudMdk+kUzBpatjhTMGv9lYewZgWqBS+riy2MVNG1eK2RRTyc
         +BuzboHgKrbQ80coZ0aaNA3VbAN0Gofoel5D4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745957589; x=1746562389;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GD6DJTcwCWd1erihJG2XGCn33fsN6axQdQziR16yUsw=;
        b=FVdHI2UUr+WHCslJrXYISDeuHFSq7RcqgG8YbYYfJPZzud+qgN2vIa5esAEKrwu/MN
         V3Yxbg2pYDGmdtbcoNWBiYwEdKFWgNv/GWB+issy8bZ58Mhllbr8CBbVyH5Qf4zJrzZG
         +/yvW3Jv/XKt6qQFWbGtpzVt+XvNlD+ST03AEBd7x4vZeMpN41BMDzzo+62Q/UVeW4QG
         O5swoN4ycCHN8LNawfj0upZPPLFCOuN+zIUtaS/RHNm6q7ZvBoblZeozlRU6p5pHYxkg
         87PJcQ0LpEoZ8buWDtJ9zMJkH5kvCSi+Y7aNtFRhNROgvIaCaDADlQsPzUG68Wb+sUqp
         OitA==
X-Forwarded-Encrypted: i=1; AJvYcCXkE8AVweexwv8LabIpyF9XYbV6lmLnJh6iVfvwEJweNaOQEn5nGjLvSvHQVTqQkySNWJDuFUoeuLY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzYuGBzX2HlGltArcVJTlY0+68W7WgEJO/S7jp6lVhnjBs3+TI2
	XjFfXfOwd3xtnPH693KBCXSwJrjiGxhyN0pS/5btDAZIqCJHgyASM5vRP63XIc8vfha8aK960eH
	gQPw=
X-Gm-Gg: ASbGncvvu+swpurV2qyKA8XHorrge2GvjwLlIzYrw7ARWs/U2LCfsc0iOwlld0t7F5g
	lY2OJ61h8ZDeFzNFTxdnlPzyVbgLO7vi+Vp18qjsZaMHFHNELOHmL0KIt6rI9LHwZQe34pQhvm9
	sNumRDKeTkx93l+JPsV9pHcTE34ODCycAPLTL1fDy7hM1cMl9hhXNBeR8yzqck3aTWyR07tgb42
	GmfJGQxsCP4uzBmr8lrI55DXorepMY296MuTOlo31q7BykLn4zH+vTwW5mLcoloWJUKIyMFRZSF
	togq7Ks52crqslGhw8upNymk9qPFzj1ZKHhnRTlfiDFgT18nX/e2KmtOo6sJJ2ZuxvFqZ+aWjel
	v+kwe3cXVpLeiL5Fp9qYOWHn7qA==
X-Google-Smtp-Source: AGHT+IHl6krutDBYAFQQtbqvG/ZowWWUBcufRCJn/BIelXiA3BC2SE3i9g5gr8ty/8yP6QkBO9+szg==
X-Received: by 2002:a17:907:7e96:b0:aca:96a7:d373 with SMTP id a640c23a62f3a-acedc766b7bmr67732666b.57.1745957588793;
        Tue, 29 Apr 2025 13:13:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU/TT8AWc1C9buJ/zcUdRisB50HcQAC1q6I2qrv2iRWbYicXyMwlZDwGmYRFOGiE2U7GnT3z6uMtII=@lists.xenproject.org
X-Received: by 2002:a17:907:6d1c:b0:acb:ba0f:4b12 with SMTP id
 a640c23a62f3a-acedc66e49amr67356066b.36.1745957586006; Tue, 29 Apr 2025
 13:13:06 -0700 (PDT)
MIME-Version: 1.0
References: <20250425141740.734030-1-arnd@kernel.org> <aAyiganPp_UsNlnZ@gmail.com>
 <d2b0e71c-e79b-40d6-8693-3202cd894d66@app.fastmail.com> <CAHk-=wh=TUsVv6xhtzYsWJwJggrjyOfYT3kBu+bHtoYLK0M9Xw@mail.gmail.com>
 <CAHk-=wgfk69H-T-vMWR33xUpVsWJLrF34d0OwUXa2sHhtpSwZg@mail.gmail.com>
 <e54f1943-e0ff-4f59-b24f-9b5a7a38becf@citrix.com> <CAHk-=wj0S2vWui0Y+1hpYMEhCiXKexbQ01h+Ckvww8hB29az_A@mail.gmail.com>
 <aA8nF0moBYOIgC5J@gmail.com> <aA8oqKUaFU-0wb-D@gmail.com> <CAHk-=wgJfWfWa2NTiTmev+Xr=e8Uo=aFkrXujLAQBVAVN-VigQ@mail.gmail.com>
 <B364FF6D-DFCC-42A7-ACA1-6A74E27EE57E@zytor.com> <67be5eee-b67b-409a-8309-829f891b9944@citrix.com>
 <916BD58C-E6A7-495E-9A60-722E130AC7A7@zytor.com> <e5e97ff8-9670-40d1-a0fa-69504d34c4c4@citrix.com>
 <956DB0ED-F3DB-456D-8D06-6F40DBDB815A@zytor.com> <06d04c13-76e8-45fb-a563-e365e1f19362@citrix.com>
 <CAHk-=wig1E4B-e1_6=it1LfVQ64DJsVgO6f6Ytnbzm2qChbAdw@mail.gmail.com> <81ed8b53-1a40-4777-ab87-4f4abe032dbc@citrix.com>
In-Reply-To: <81ed8b53-1a40-4777-ab87-4f4abe032dbc@citrix.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 29 Apr 2025 13:12:48 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiAPQFf-RUr=8ra1sYdfGPGLb4QbV8THE9zY3n820L94g@mail.gmail.com>
X-Gm-Features: ATxdqUGerTZyFJ8KMx9SH7AYZ47WuJ2Hfngvi8M9Z27cjt3IrNr0gN037dkObQQ
Message-ID: <CAHk-=wiAPQFf-RUr=8ra1sYdfGPGLb4QbV8THE9zY3n820L94g@mail.gmail.com>
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

On Tue, 29 Apr 2025 at 12:13, Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>
> That would improve code generation for 32bit, but generally regress 64bit.
>
> Preloading the destination register with -1 is better than the CMOV form
> emitted by the builtin; BSF's habit of conditionally not writing the
> destination register *is* a CMOV of sorts.

Right you are. So we'd need to do this just for the x86-32 case. Oh
well. Ugly, but still prettier than what we have now, I guess.

         Linus

