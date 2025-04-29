Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88B72AA3AF2
	for <lists+xen-devel@lfdr.de>; Wed, 30 Apr 2025 00:05:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.973139.1361343 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9t4T-0001Ki-0x; Tue, 29 Apr 2025 22:04:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 973139.1361343; Tue, 29 Apr 2025 22:04:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9t4S-0001I7-UX; Tue, 29 Apr 2025 22:04:56 +0000
Received: by outflank-mailman (input) for mailman id 973139;
 Tue, 29 Apr 2025 22:04:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rc0E=XP=linuxfoundation.org=torvalds@srs-se1.protection.inumbo.net>)
 id 1u9t4R-0001Hz-Ad
 for xen-devel@lists.xenproject.org; Tue, 29 Apr 2025 22:04:55 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f88c8da8-2545-11f0-9ffb-bf95429c2676;
 Wed, 30 Apr 2025 00:04:50 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-ac3b12e8518so1112590766b.0
 for <xen-devel@lists.xenproject.org>; Tue, 29 Apr 2025 15:04:50 -0700 (PDT)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com.
 [209.85.218.47]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ace6e587f2csm836726266b.77.2025.04.29.15.04.47
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Apr 2025 15:04:47 -0700 (PDT)
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-ac339f53df9so1268839466b.1
 for <xen-devel@lists.xenproject.org>; Tue, 29 Apr 2025 15:04:47 -0700 (PDT)
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
X-Inumbo-ID: f88c8da8-2545-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1745964289; x=1746569089; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+FkXn5f7fGyaodgP6TJybZs8fgnt4L8M65LDm06LK3Y=;
        b=XxncL4H+aNLrWDCHuBzBYFjlsEUvuMt8VhB4Dnsyry92SH1vWzSsVhtvTytuhJAIcS
         +FfKev+EliukayCUcdbRwxBJY7crUz9xmJeJ6QU5fH6vItJHXEbv18vywdx+lbhPDB5L
         IZcts1kQ2bUvB/W76mesN1y32boGt3Ke22lBg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745964289; x=1746569089;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+FkXn5f7fGyaodgP6TJybZs8fgnt4L8M65LDm06LK3Y=;
        b=PKw+QzT+sixQtDnWdhZvWVrGAkts0gP/qAd6atkG0ajfjCgmKMKfe3MSVBkGf4iYfv
         5Xc7GVOPC4tx7qDu3qQuyd0UaRb4XkvPtQeKaAQnUKvUfMCzabKtQ9O8CqbiLSIOzKOF
         e4eKbi2OCfXmZqTykMse7114lCVW0YJ/USqz/yPpSn3Z+qQiL/ZsQqY9eyhz/XxdfUcE
         XjmmHL+8KOQqUXgjZlCr1t60BmA7x+m3uhfBDkHZKzRf7LB14sk7TNnoDYHG+1XUmTsM
         F5L/uREje7v1lPWRBO382HDldzvJ8+1t/jytubX7pEZti6gsWQlP5zDV8e2VE44H+YyF
         zwdg==
X-Forwarded-Encrypted: i=1; AJvYcCUZt5SPntbU8BXs2AzZWtX3ml8W713pVyr3RCAWzOXrUsbFAVAOOYW/kkXKXspb0tTQbZWqNBFwe6k=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzjOrUt/93Z1wi+zwD/YFt6PgJ9nVis6PTvqiXbqjCxINBW8qNT
	wpufEx74aoUKDXqPXAJAosM7gwa6WZSJrSJwlGu4oXZHx4vi0+XF9VGhDUrO8j/XtcFqo7JMWep
	wDP5kpg==
X-Gm-Gg: ASbGnctUdlAZT9zO0zPQ+ZhrGyrqE15SvvkN5kDAMTmaHMm6fn8AcjhbbS/a6YraNA+
	RX2o6BW0VvTRW5t0H1WbQDY6+uyO/CWfXglnGseYH6+VaCrRkZvOoMtqb61ZmFvfwHEDW9vzjAX
	jDCfqXJ3dGYrQv4xMkX9+T6UYlwG0B0WwpPdSlsbt5RP/NX+8lN8H+xNZQPcZq9pMSU9vCZ/ABW
	7A9djN3qG7Z6RcYa3Z2qaLAfyMqgfe1n7WLt3kb+5Owpzv28s7UQW4yHw9ZTbEYRK6FJGsfQrxo
	4cj7gMy6h+eCfWmD1oUZ42+X5zF4EU8HAJQe3fpa+t/cM/h5Kn49Msj7HM+HiIdJDmM8vpLEKMh
	OAdwU43BkUiC0RCd3701OdIyzbA==
X-Google-Smtp-Source: AGHT+IG1AFWhCvX7y/z71M+0FrHvIB3trWiHO9KTa+nrHaTXAz+JungcnZN5t8MQCSY7H1J7SGD3sg==
X-Received: by 2002:a17:907:d91:b0:acb:b267:436b with SMTP id a640c23a62f3a-acee21ec1ccmr18411566b.25.1745964289537;
        Tue, 29 Apr 2025 15:04:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWiIw8JBlUNRaUSIR3fTxCFW0K13yqgyIBEmjwck/CUAbYk8eWiUmfs8D8gNIFNDI79ZPtdrjnDVAM=@lists.xenproject.org
X-Received: by 2002:a17:906:4fc3:b0:ac2:a4ec:46c2 with SMTP id
 a640c23a62f3a-acee260f345mr11952766b.49.1745964287066; Tue, 29 Apr 2025
 15:04:47 -0700 (PDT)
MIME-Version: 1.0
References: <20250425141740.734030-1-arnd@kernel.org> <CAHk-=wgfk69H-T-vMWR33xUpVsWJLrF34d0OwUXa2sHhtpSwZg@mail.gmail.com>
 <e54f1943-e0ff-4f59-b24f-9b5a7a38becf@citrix.com> <CAHk-=wj0S2vWui0Y+1hpYMEhCiXKexbQ01h+Ckvww8hB29az_A@mail.gmail.com>
 <aA8nF0moBYOIgC5J@gmail.com> <aA8oqKUaFU-0wb-D@gmail.com> <CAHk-=wgJfWfWa2NTiTmev+Xr=e8Uo=aFkrXujLAQBVAVN-VigQ@mail.gmail.com>
 <B364FF6D-DFCC-42A7-ACA1-6A74E27EE57E@zytor.com> <67be5eee-b67b-409a-8309-829f891b9944@citrix.com>
 <916BD58C-E6A7-495E-9A60-722E130AC7A7@zytor.com> <e5e97ff8-9670-40d1-a0fa-69504d34c4c4@citrix.com>
 <956DB0ED-F3DB-456D-8D06-6F40DBDB815A@zytor.com> <06d04c13-76e8-45fb-a563-e365e1f19362@citrix.com>
 <CAHk-=wig1E4B-e1_6=it1LfVQ64DJsVgO6f6Ytnbzm2qChbAdw@mail.gmail.com>
 <81ed8b53-1a40-4777-ab87-4f4abe032dbc@citrix.com> <CAHk-=wiAPQFf-RUr=8ra1sYdfGPGLb4QbV8THE9zY3n820L94g@mail.gmail.com>
 <72078B8D-F03E-4783-8AC2-A36464A4B6A1@zytor.com> <CAHk-=wi=nuDW6yCXSA-dEztZhXNuzLOaH--s_V7GOAE7n6RsRw@mail.gmail.com>
 <565ac06a-005f-4b77-930e-d63285c025b9@citrix.com>
In-Reply-To: <565ac06a-005f-4b77-930e-d63285c025b9@citrix.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 29 Apr 2025 15:04:30 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiMN7eMYE=SiA07f2aFFeuEV0YJ-ewoW4rJ3yQfbviuJA@mail.gmail.com>
X-Gm-Features: ATxdqUEynECRHmJIlVNEBwYKhXX-8mTK6BavCcTzrr-kqqOzz7SzQVGFOa2_KmI
Message-ID: <CAHk-=wiMN7eMYE=SiA07f2aFFeuEV0YJ-ewoW4rJ3yQfbviuJA@mail.gmail.com>
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

On Tue, 29 Apr 2025 at 14:59, Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>
> do_variable_ffs() doesn't quite work.
>
> REP BSF is LZCNT, and unconditionally writes it's output operand, and
> defeats the attempt to preload with -1.
>
> Drop the REP prefix, and it should work as intended.

Bah. That's what I get for just doing it blindly without actually
looking at the kernel source. I just copied the __ffs() thing - and
there the 'rep' is not for the zero case - which we don't care about -
but because lzcnt performs better on newer CPUs.

So you're obviously right.

            Linus

