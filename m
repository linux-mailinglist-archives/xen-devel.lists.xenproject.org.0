Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17924AA3A35
	for <lists+xen-devel@lfdr.de>; Tue, 29 Apr 2025 23:54:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.973086.1361303 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9sto-00069S-BW; Tue, 29 Apr 2025 21:53:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 973086.1361303; Tue, 29 Apr 2025 21:53:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9sto-00067c-7i; Tue, 29 Apr 2025 21:53:56 +0000
Received: by outflank-mailman (input) for mailman id 973086;
 Tue, 29 Apr 2025 21:53:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rc0E=XP=linuxfoundation.org=torvalds@srs-se1.protection.inumbo.net>)
 id 1u9stm-00067W-NE
 for xen-devel@lists.xenproject.org; Tue, 29 Apr 2025 21:53:54 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 70dd8bf8-2544-11f0-9eb4-5ba50f476ded;
 Tue, 29 Apr 2025 23:53:53 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-ac2aeada833so61388166b.0
 for <xen-devel@lists.xenproject.org>; Tue, 29 Apr 2025 14:53:53 -0700 (PDT)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com.
 [209.85.208.46]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ace6ecf77dasm830922066b.87.2025.04.29.14.53.48
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Apr 2025 14:53:48 -0700 (PDT)
Received: by mail-ed1-f46.google.com with SMTP id
 4fb4d7f45d1cf-5efe8d9eb1eso515374a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 29 Apr 2025 14:53:48 -0700 (PDT)
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
X-Inumbo-ID: 70dd8bf8-2544-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1745963632; x=1746568432; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fqNEBXZSbJGWmL1W/E0BdQ0WH7FE/Nb9rr17rLaU2hw=;
        b=Qk5mAu+2sgkr5r/GaCC2+UTX8dY5l1FUD3dOcZmbHqQ6i0j/j4uNDHx9wQ0wSmKfRJ
         azem3+80qGfPxatTZ0WI7vlIQvNa2sNIrCQK3DR1fTKZGqy6SVetNkZyFna++6yTYZeK
         Y76TaQzMuOTXJSVyQ+YWObJ0ZKK+c01X+wd+g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745963632; x=1746568432;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fqNEBXZSbJGWmL1W/E0BdQ0WH7FE/Nb9rr17rLaU2hw=;
        b=u0EXz81lEVXZo7BYMhDSyIMMG5/ailvafd7j+H9Bk+9JML23SU9iHIK7AbEH345vfF
         n6dWSQI/aIyYmM/n3a1isxygNvRQJVgR4x2bKH0MPfpz3cLYHFiO7qRR0vgDT0+Lc6MD
         q0JwYO87Hs5cDajLbpCKtglbus+A9j2uqPJSDShmUnScGoD1D3clOkyBkD7vZniYphXu
         jQtwFl2gi+ikUK2v3HwKu7jecQhShYgo1EKW8tWLtRQzVosJBhneuqHCmuBTKhDsXQW/
         OBipB/YO1sNJV5/5MJ/PmEzjjC2TeI8OExrgkRA/BFK6DKuCS7HFyVoXeHxakayJemlT
         iJHQ==
X-Forwarded-Encrypted: i=1; AJvYcCWwMWkEgPJx9oOqkDl+upCyIwyIz1JyhyM52kxGo0No8CY3xh7lV1kadw9J17SXwo8T7hgmkWaOkkY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxwP4ch1A2QkvqaaHjnvrUZZnQyIDDA2Fx7zurtj59plQsmdSDr
	xoSNsJiifc8/5lRnbnNZSZHgT9NxHW4FISZFlm7SmP8QBxKki9sDzYF31zhvusxkcUYD5vxJk9e
	4wViP5Q==
X-Gm-Gg: ASbGncsTNisWD9hvRo8djZlurVf+IOamd2IS1EkCj7VTEdM0up5P5n/BFp5Y2Fd5rBn
	2cy9ZiQSsBHQAFXDHKOVgtzoEDz/uG4X0aAcs3yaA5hmdUA04a59gGTFFJ/mhKRvxUqDNtLS8Uv
	g+EpICU8B0EMxqXoGhTRj8/xdOHppkN2nVptfcXrEVxNtsYGal/vWuK0nOG8f6guOCo6RwEiF1G
	0VVrRkFJANnBTbR1lSAeLhSTPdYfIaQ6gjextu6ePYe1AanLn7RWlc1nUak1pvumi7OooIc1qZS
	g9HQSZGLNDKWhvlwMU7qHsDQXNO6LSiuglf11ehIhnNY4FNO3crDrI8m+JZzyEbUya1KcwNj939
	jS6vItUGxEuP9cjw=
X-Google-Smtp-Source: AGHT+IFcYEVpsnoW3AHg048dbXOtQMMVtUexVJfIGmk8SX0OFHq3lQt58qNfDRk+qNyOSgy0dKXZbQ==
X-Received: by 2002:a17:906:6a1e:b0:ace:8176:9870 with SMTP id a640c23a62f3a-acedf68d357mr37655466b.9.1745963632260;
        Tue, 29 Apr 2025 14:53:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVeITs4JVCTXjihqqyhmHjQ5hLrPypjRVXS2ZMglgPJIqrEkOiVjXeILhefQmQhFSz9rnev7eU3XWk=@lists.xenproject.org
X-Received: by 2002:a05:6402:90e:b0:5f8:3a9f:fdca with SMTP id
 4fb4d7f45d1cf-5f89f7689ddmr371432a12.9.1745963628390; Tue, 29 Apr 2025
 14:53:48 -0700 (PDT)
MIME-Version: 1.0
References: <20250425141740.734030-1-arnd@kernel.org> <d2b0e71c-e79b-40d6-8693-3202cd894d66@app.fastmail.com>
 <CAHk-=wh=TUsVv6xhtzYsWJwJggrjyOfYT3kBu+bHtoYLK0M9Xw@mail.gmail.com>
 <CAHk-=wgfk69H-T-vMWR33xUpVsWJLrF34d0OwUXa2sHhtpSwZg@mail.gmail.com>
 <e54f1943-e0ff-4f59-b24f-9b5a7a38becf@citrix.com> <CAHk-=wj0S2vWui0Y+1hpYMEhCiXKexbQ01h+Ckvww8hB29az_A@mail.gmail.com>
 <aA8nF0moBYOIgC5J@gmail.com> <aA8oqKUaFU-0wb-D@gmail.com> <CAHk-=wgJfWfWa2NTiTmev+Xr=e8Uo=aFkrXujLAQBVAVN-VigQ@mail.gmail.com>
 <B364FF6D-DFCC-42A7-ACA1-6A74E27EE57E@zytor.com> <67be5eee-b67b-409a-8309-829f891b9944@citrix.com>
 <916BD58C-E6A7-495E-9A60-722E130AC7A7@zytor.com> <e5e97ff8-9670-40d1-a0fa-69504d34c4c4@citrix.com>
 <956DB0ED-F3DB-456D-8D06-6F40DBDB815A@zytor.com> <06d04c13-76e8-45fb-a563-e365e1f19362@citrix.com>
 <CAHk-=wig1E4B-e1_6=it1LfVQ64DJsVgO6f6Ytnbzm2qChbAdw@mail.gmail.com>
 <81ed8b53-1a40-4777-ab87-4f4abe032dbc@citrix.com> <CAHk-=wiAPQFf-RUr=8ra1sYdfGPGLb4QbV8THE9zY3n820L94g@mail.gmail.com>
 <72078B8D-F03E-4783-8AC2-A36464A4B6A1@zytor.com>
In-Reply-To: <72078B8D-F03E-4783-8AC2-A36464A4B6A1@zytor.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 29 Apr 2025 14:53:31 -0700
X-Gmail-Original-Message-ID: <CAHk-=wi=nuDW6yCXSA-dEztZhXNuzLOaH--s_V7GOAE7n6RsRw@mail.gmail.com>
X-Gm-Features: ATxdqUF2WEWyDNEqWzlgzyXTf4abegFsgsXzBlk2KHwHm9gaQxxnui60dOXB01E
Message-ID: <CAHk-=wi=nuDW6yCXSA-dEztZhXNuzLOaH--s_V7GOAE7n6RsRw@mail.gmail.com>
Subject: Re: [PATCH] bitops/32: Convert variable_ffs() and fls() zero-case
 handling to C
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Ingo Molnar <mingo@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Arnd Bergmann <arnd@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Juergen Gross <jgross@suse.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	Alexander Usyskin <alexander.usyskin@intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?Q?Mateusz_Jo=C5=84czyk?= <mat.jonczyk@o2.pl>, 
	Mike Rapoport <rppt@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org
Content-Type: multipart/mixed; boundary="000000000000dcb6610633f1d539"

--000000000000dcb6610633f1d539
Content-Type: text/plain; charset="UTF-8"

On Tue, 29 Apr 2025 at 14:24, H. Peter Anvin <hpa@zytor.com> wrote:
>
> Could you file a gcc bug? Gcc shouldn't generate worse code than inline asm ...

Honestly, I've given up on that idea.

That's basically what the bug report I reported about clts was - gcc
generating worse code than inline asm.

But why would we use gcc builtins at all if we have inline asm that is
better than what som eversions of gcc generates? The inline asm works
for all versions.

Anyway, attached is a test file that seems to generate basically
"optimal" code. It's not a kernel patch, but a standalone C file for
testing with a couple of stupid test-cases to make sure that it gets
the constant argument case right, and that it optimizes the "I know
it's not zero" case.

That is why it also uses that "#if __SIZEOF_LONG__ == 4" instead of
something like CONFIG_64BIT.

So it's a proof-of-concept thing, and it does seem to be fairly simple.

The "important" parts are just the

  #define variable_ffs(x) \
        (statically_true((x)!=0) ? __ffs(x)+1 : do_variable_ffs(x))
  #define constant_ffs(x) __builtin_ffs(x)
  #define ffs(x) \
        (__builtin_constant_p(x) ? constant_ffs(x) : variable_ffs(x))

lines which end up picking the right choice. The rest is either the
"reimplement the kernel infrastructure for testing" or the trivial
do_variable_ffs() thing.

I just did

    gcc -m32 -O2 -S -fomit-frame-pointer t.c

(with, and without that -m32) and looked at the result to see that it
looks sane. No *actual* testing.


                Linus

--000000000000dcb6610633f1d539
Content-Type: text/x-csrc; charset="US-ASCII"; name="t.c"
Content-Disposition: attachment; filename="t.c"
Content-Transfer-Encoding: base64
Content-ID: <f_ma31mmgj0>
X-Attachment-Id: f_ma31mmgj0

c3RhdGljIGlubGluZSB1bnNpZ25lZCBpbnQgX19mZnModW5zaWduZWQgaW50IHgpCnsKCXVuc2ln
bmVkIGludCByZXQ7Cglhc20oInJlcCBic2ZsICUxLCUwIgoJCToiPXIiIChyZXQpCgkJOiJybSIg
KHgpKTsKCXJldHVybiByZXQ7Cn0KI2RlZmluZSBzdGF0aWNhbGx5X3RydWUoeCkgKF9fYnVpbHRp
bl9jb25zdGFudF9wKHgpICYmICh4KSkKCnN0YXRpYyBpbmxpbmUgdW5zaWduZWQgaW50IGRvX3Zh
cmlhYmxlX2Zmcyh1bnNpZ25lZCBpbnQgeCkKewojaWYgX19TSVpFT0ZfTE9OR19fID09IDQKCXJl
dHVybiBfX2J1aWx0aW5fZmZzKHgpOwojZWxzZQoJdW5zaWduZWQgaW50IHJldDsKCWFzbSgicmVw
IGJzZmwgJTEsJTAiCgkJOiI9ciIgKHJldCkKCQk6InJtIiAoeCksICIwIiAoLTEpKTsKCXJldHVy
biByZXQrMTsKI2VuZGlmCn0KCiNkZWZpbmUgdmFyaWFibGVfZmZzKHgpIChzdGF0aWNhbGx5X3Ry
dWUoKHgpIT0wKSA/IF9fZmZzKHgpKzEgOiBkb192YXJpYWJsZV9mZnMoeCkpCiNkZWZpbmUgY29u
c3RhbnRfZmZzKHgpIF9fYnVpbHRpbl9mZnMoeCkKCiNkZWZpbmUgZmZzKHgpIChfX2J1aWx0aW5f
Y29uc3RhbnRfcCh4KSA/IGNvbnN0YW50X2Zmcyh4KSA6IHZhcmlhYmxlX2Zmcyh4KSkKCnVuc2ln
bmVkIGludCBteWZmcyh1bnNpZ25lZCBpbnQgeCkgeyByZXR1cm4gZmZzKHgpOyB9CnVuc2lnbmVk
IGludCBmZnM1KHZvaWQpIHsgcmV0dXJuIGZmcyg1KTsgfQp1bnNpZ25lZCBpbnQgYWRkZmZzKGlu
dCB4KQp7Cgl1bnNpZ25lZCBpbnQgc3VtID0gMDsKCXdoaWxlICh4KSB7CgkJc3VtICs9IGZmcyh4
KTsKCQl4LS07Cgl9CglyZXR1cm4gc3VtOwp9Cg==
--000000000000dcb6610633f1d539--

