Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 593FAE37FC
	for <lists+xen-devel@lfdr.de>; Thu, 24 Oct 2019 18:35:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNg3l-00045w-VE; Thu, 24 Oct 2019 16:34:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=/iVV=YR=kernel.org=luto@srs-us1.protection.inumbo.net>)
 id 1iNg3k-00045o-DN
 for xen-devel@lists.xenproject.org; Thu, 24 Oct 2019 16:34:00 +0000
X-Inumbo-ID: 14cc7f46-f67c-11e9-beca-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 14cc7f46-f67c-11e9-beca-bc764e2007e4;
 Thu, 24 Oct 2019 16:34:00 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 29EF321A4A
 for <xen-devel@lists.xenproject.org>; Thu, 24 Oct 2019 16:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1571934839;
 bh=1SNHEg6+c998ctNCmd9SgwSXFWQKSNG1btG3g+zXoyw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=b/TQ/9/CbwW5SRUBfFuJHDwGl6ndjWOCM/d9EMkad3YaXL0FAm+86hjsxnERu7yH4
 sjURls7sokdzhUyNIzGgkzPpElNUh3EDG/lcGFuqXN7wtCXu2GD11z6lecOndhLUod
 EBQXFXo8LqoUIoKIATNtZqQ0XBcc89G+oAiFVsoE=
Received: by mail-wr1-f50.google.com with SMTP id v9so15545002wrq.5
 for <xen-devel@lists.xenproject.org>; Thu, 24 Oct 2019 09:33:59 -0700 (PDT)
X-Gm-Message-State: APjAAAUUajtb7R9gG9LLWcTsSBHUhHv3w+I7Yydr97+0vYvWuj7Y4wWr
 nn6hXVLbyzSzG4EJ7wR78AEMXjwQZUCfcH+pMTY3Pg==
X-Google-Smtp-Source: APXvYqyYjlrS0PO0VZ1qRMGKSsFiVVDLw2A2GrTFkiqLwXEeea+luMRqO7GJCnjTjc6QcZfFsb1uJ7GKgNFlLm/NEro=
X-Received: by 2002:adf:f342:: with SMTP id e2mr4921768wrp.61.1571934837618;
 Thu, 24 Oct 2019 09:33:57 -0700 (PDT)
MIME-Version: 1.0
References: <ef1c9381-dfc7-7150-feca-581f4d798513@suse.com>
 <CALCETrWAALF7EgxHGs-rtZwk1Fxttr56QKXeB6QssXbyXDs+kA@mail.gmail.com>
 <8f9f812b-c28a-5828-d8d9-37ae7e2f99da@citrix.com>
In-Reply-To: <8f9f812b-c28a-5828-d8d9-37ae7e2f99da@citrix.com>
From: Andy Lutomirski <luto@kernel.org>
Date: Thu, 24 Oct 2019 09:33:45 -0700
X-Gmail-Original-Message-ID: <CALCETrXp0oEu1zeCHUjPJb+i6Y7vR6zCtHGKzP3qpW3S49mhBg@mail.gmail.com>
Message-ID: <CALCETrXp0oEu1zeCHUjPJb+i6Y7vR6zCtHGKzP3qpW3S49mhBg@mail.gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [Xen-devel] [PATCH] x86/stackframe/32: repair 32-bit Xen PV
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 X86 ML <x86@kernel.org>, lkml <linux-kernel@vger.kernel.org>,
 Jan Beulich <jbeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBPY3QgMjQsIDIwMTkgYXQgOTozMiBBTSBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29v
cGVyM0BjaXRyaXguY29tPiB3cm90ZToKPgo+IE9uIDI0LzEwLzIwMTkgMTc6MTEsIEFuZHkgTHV0
b21pcnNraSB3cm90ZToKPiA+PiArIyBkZWZpbmUgVVNFUl9TRUdNRU5UX1JQTF9NQVNLIChTRUdN
RU5UX1JQTF9NQVNLICYgfjEpCj4gPj4gKyNlbmRpZgo+ID4+ICsKPiA+PiAgICAgICAgIC5zZWN0
aW9uIC5lbnRyeS50ZXh0LCAiYXgiCj4gPj4KPiA+PiAgLyoKPiA+PiBAQCAtMTcyLDcgKzE4Myw3
IEBACj4gPj4gICAgICAgICBBTFRFUk5BVElWRSAiam1wIC5MZW5kX1xAIiwgIiIsIFg4Nl9GRUFU
VVJFX1BUSQo+ID4+ICAgICAgICAgLmlmIFxub191c2VyX2NoZWNrID09IDAKPiA+PiAgICAgICAg
IC8qIGNvbWluZyBmcm9tIHVzZXJtb2RlPyAqLwo+ID4+IC0gICAgICAgdGVzdGwgICAkU0VHTUVO
VF9SUExfTUFTSywgUFRfQ1MoJWVzcCkKPiA+PiArICAgICAgIHRlc3RsICAgJFVTRVJfU0VHTUVO
VF9SUExfTUFTSywgUFRfQ1MoJWVzcCkKPiA+IFNob3VsZG4ndCBQVF9DUyglZXNwKSBiZSAwIGlm
IHdlIGNhbWUgZnJvbSB0aGUga2VybmVsPyAgSSdtIGd1ZXNzaW5nCj4gPiB0aGUgYWN0dWFsIGJ1
ZyBpcyBpbiB3aGF0ZXZlciBjb2RlIHB1dCAxIGluIGhlcmUgaW4gdGhlIGZpcnN0IHBsYWNlLgo+
Cj4gUmluZzEga2VybmVscyAoMzJiaXQpIGNvbnNpc3RlbnRseSBzZWUgUlBMMSBldmVyeXdoZXJl
IHVuZGVyIFhlbi4KPgo+IEJhY2sgaW4gdGhlIGRheXMgb2YgYSAzMmJpdCBYZW4sIGludCAkMHg4
MCByZWFsbHkgd2FzIHdpcmVkIGRpcmVjdGx5Cj4gZnJvbSByaW5nIDMgdG8gMSwgYW5kIGRpZG4n
dCBib3VuY2UgdGhyb3VnaCBYZW4uICBUaGlzIGlzbid0IHBvc3NpYmxlIGluCj4gbG9uZyBtb2Rl
LCBiZWNhdXNlIGFsbCBJRFQgZ2F0ZXMgYXJlIHJlcXVpcmVkIHRvIGJlIDY0Yml0IGNvZGUgc2Vn
bWVudHMuCj4KPiBSaW5nMyBrZXJuZWxzICg2NGJpdCkgY29uc2lzdGVudGx5IHNlZSBSUEwwIGV2
ZXJ5d2hlcmUgdW5kZXIgWGVuLAo+IGJlY2F1c2UgcHJlc3VtYWJseSB0aGlzIHdhcyBsZXNzIGlu
dmFzaXZlIHdoZW4gZGVzaWduaW5nIHRoZSBBQkkuCj4KCk9LLCBnb3RjaGEuCgpTbyBJJ20gZmlu
ZSB3aXRoIHRoaXMgcGF0Y2ggaWYgeW91IGltcHJvdmUgdGhlIGNvbW1lbnQgYW5kIGRlZmluaXRp
b24uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
