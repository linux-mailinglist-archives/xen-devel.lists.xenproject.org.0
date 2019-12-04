Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86D7C1136CF
	for <lists+xen-devel@lfdr.de>; Wed,  4 Dec 2019 21:54:29 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1icbbT-0005sy-Uh; Wed, 04 Dec 2019 20:50:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cR3Y=Z2=soleen.com=pasha.tatashin@srs-us1.protection.inumbo.net>)
 id 1icbbR-0005st-Qv
 for xen-devel@lists.xenproject.org; Wed, 04 Dec 2019 20:50:29 +0000
X-Inumbo-ID: b3995498-16d7-11ea-9c09-bc764e2007e4
Received: from mail-ed1-x541.google.com (unknown [2a00:1450:4864:20::541])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b3995498-16d7-11ea-9c09-bc764e2007e4;
 Wed, 04 Dec 2019 20:50:28 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id c26so630979eds.8
 for <xen-devel@lists.xenproject.org>; Wed, 04 Dec 2019 12:50:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=soleen.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hq3LxKYOOomc+/QE33SRTklsyQdBe2jME5WH5NYH7Hk=;
 b=XofnVsh9JkrhplZ0OE7AUH7DsGvWdzLDYNfCfoxP0l7uUCOPFmiZWxdtwZzblCYEz8
 nzcH3SxfKhsCeer285czBZtVUVdiqAvyDPXXHbvpBPdshfdh4w4FF5Ng8H+oA31OjfUI
 vZPAxNhB2mjGDNunaPVs6r6Df+EF+XB70UgvdAQdXKp02x6VP+txnFgTTh5mY2PbTWBh
 aPKP8kNjSZ9Nvrd6ldUJWoy7jknWIGTYAA4U6EpTMVIIsriQ4TSB6X2dF7Rx8utkpo3r
 RjUET3r64LH2ttN2w9Ab+JOyQfISd+xC71qLWTi6TcfKwVeInFWLiTuMVy3Xo0/BLupS
 8Apg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hq3LxKYOOomc+/QE33SRTklsyQdBe2jME5WH5NYH7Hk=;
 b=mtjf7X+t9q6bIpoS9rRwJfiWryj8mG9Xc8C/pcUpCz74r/Sy6gsNNxWxaAW8FvthDa
 xHIX3mWLWMqSfGrw2hSTpZpStQr2ew/xqzHmAD7MXxhYym9ZOhP1WrOII0L+t/nHipIr
 nIfzF9mF+6rP8dPbdRhHtllNqj0BOxOPbjvzcGBpTz1/TnQ6XrDGHfxZyOld6+52vs53
 NOGvQN0BWtLgoZHWaNChmqX3LuoRqgUwxHM2uwBwZ6usk41CIxmkPJnNOmsMMS3D/rJM
 iSuKZ/y2G3xv6vZA6hOd3oDy4t7vxvd1YpEZWHMGt9a4lMkUQlOgZAjBVX/jZhBn1Hwq
 wqVA==
X-Gm-Message-State: APjAAAXnoFucrnLPLmxSnV1tC3AuKdNOKh93PgQAJiDtW68DQCU+H9ew
 TYDxVeVCSBIs3rcYe7OsxWt6g8SYSNR5XvKwBe9w7w==
X-Google-Smtp-Source: APXvYqwMdNLsGxvlCa1i0ErELJP4i0sWpocovAjl4xGOHiGed8ZySML2zMNhKfShRaQbEjYyznCmIueYA6VatjBeKCI=
X-Received: by 2002:a17:906:3798:: with SMTP id
 n24mr5230843ejc.15.1575492627075; 
 Wed, 04 Dec 2019 12:50:27 -0800 (PST)
MIME-Version: 1.0
References: <20191127184453.229321-1-pasha.tatashin@soleen.com>
 <20191127184453.229321-3-pasha.tatashin@soleen.com>
 <20191128145151.GB22314@lakrids.cambridge.arm.com>
In-Reply-To: <20191128145151.GB22314@lakrids.cambridge.arm.com>
From: Pavel Tatashin <pasha.tatashin@soleen.com>
Date: Wed, 4 Dec 2019 15:50:15 -0500
Message-ID: <CA+CK2bDPjLSECOeduZY7hVPreYYCTpgNMd4aTGSy=35E86W72Q@mail.gmail.com>
To: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [Xen-devel] [PATCH 2/3] arm64: remove uaccess_ttbr0 asm macros
 from cache functions
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
Cc: Catalin Marinas <catalin.marinas@arm.com>, Stefan Agner <stefan@agner.ch>,
 Russell King - ARM Linux admin <linux@armlinux.org.uk>,
 Masahiro Yamada <yamada.masahiro@socionext.com>, Will Deacon <will@kernel.org>,
 boris.ostrovsky@oracle.com, Sasha Levin <sashal@kernel.org>,
 Stefano Stabellini <sstabellini@kernel.org>, James Morris <jmorris@namei.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 xen-devel@lists.xenproject.org, Vladimir Murzin <vladimir.murzin@arm.com>,
 Marc Zyngier <marc.zyngier@arm.com>, alexios.zavras@intel.com,
 Thomas Gleixner <tglx@linutronix.de>, allison@lohutok.net, jgross@suse.com,
 steve.capper@arm.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 LKML <linux-kernel@vger.kernel.org>, James Morse <james.morse@arm.com>,
 info@metux.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBOb3YgMjgsIDIwMTkgYXQgOTo1MSBBTSBNYXJrIFJ1dGxhbmQgPG1hcmsucnV0bGFu
ZEBhcm0uY29tPiB3cm90ZToKPgo+IE9uIFdlZCwgTm92IDI3LCAyMDE5IGF0IDAxOjQ0OjUyUE0g
LTA1MDAsIFBhdmVsIFRhdGFzaGluIHdyb3RlOgo+ID4gV2UgY3VycmVudGx5IGR1cGxpY2F0ZSB0
aGUgbG9naWMgdG8gZW5hYmxlL2Rpc2FibGUgdWFjY2VzcyB2aWEgVFRCUjAsCj4gPiB3aXRoIEMg
ZnVuY3Rpb25zIGFuZCBhc3NlbWJseSBtYWNyb3MuIFRoaXMgaXMgYSBtYWludGVuZW5hY2UgYnVy
ZGVuCj4gPiBhbmQgaXMgbGlhYmxlIHRvIGxlYWQgdG8gc3VidGxlIGJ1Z3MsIHNvIGxldCdzIGdl
dCByaWQgb2YgdGhlIGFzc2VtYmx5Cj4gPiBtYWNyb3MsIGFuZCBhbHdheXMgdXNlIHRoZSBDIGZ1
bmN0aW9ucy4gVGhpcyByZXF1aXJlcyByZWZhY3RvcmluZwo+ID4gc29tZSBhc3NlbWJseSBmdW5j
dGlvbnMgdG8gaGF2ZSBhIEMgd3JhcHBlci4KPgo+IFsuLi5dCj4KPiA+ICtzdGF0aWMgaW5saW5l
IGludCBpbnZhbGlkYXRlX2ljYWNoZV9yYW5nZSh1bnNpZ25lZCBsb25nIHN0YXJ0LAo+ID4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgZW5kKQo+
ID4gK3sKPiA+ICsgICAgIGludCBydjsKPgo+IFBsZWFzZSBtYWtlIHRoaXMgJ3JldCcsIGZvciBj
b25zaXN0ZW5jeSB3aXRoIG90aGVyIGFybTY0IGNvZGUuIFdlIG9ubHkKPiB1c2UgJ3J2JyBpbiBv
bmUgcGxhY2Ugd2hlcmUgaXQncyBzaG9ydCBmb3IgIlJldmlzaW9uIGFuZCBWYXJpYW50IiwgYW5k
Cj4gJ3JldCcgaXMgb3VyIHVzdWFsIG5hbWUgZm9yIGEgdGVtcG9yYXJ5IHZhcmlhYmxlIHVzZWQg
dG8gaG9sZCBhIHJldHVybgo+IHZhbHVlLgoKT0sKCj4KPiA+ICsKPiA+ICsgICAgIGlmIChjcHVz
X2hhdmVfY29uc3RfY2FwKEFSTTY0X0hBU19DQUNIRV9ESUMpKSB7Cj4gPiArICAgICAgICAgICAg
IGlzYigpOwo+ID4gKyAgICAgICAgICAgICByZXR1cm4gMDsKPiA+ICsgICAgIH0KPiA+ICsgICAg
IHVhY2Nlc3NfdHRicjBfZW5hYmxlKCk7Cj4KPiBQbGVhc2UgcGxhY2UgYSBuZXdsaW5lIGJldHdl
ZW4gdGhlc2UgdHdvLCBmb3IgY29uc2lzdGVuY3kgd2l0aCBvdGhlcgo+IGFybTY0IGNvZGUuCgpP
SwoKPgo+ID4gKyAgICAgcnYgPSBhc21faW52YWxpZGF0ZV9pY2FjaGVfcmFuZ2Uoc3RhcnQsIGVu
ZCk7Cj4gPiArICAgICB1YWNjZXNzX3R0YnIwX2Rpc2FibGUoKTsKPiA+ICsKPiA+ICsgICAgIHJl
dHVybiBydjsKPiA+ICt9Cj4gPiArCj4gPiAgc3RhdGljIGlubGluZSB2b2lkIGZsdXNoX2ljYWNo
ZV9yYW5nZSh1bnNpZ25lZCBsb25nIHN0YXJ0LCB1bnNpZ25lZCBsb25nIGVuZCkKPiA+ICB7Cj4g
PiAgICAgICBfX2ZsdXNoX2ljYWNoZV9yYW5nZShzdGFydCwgZW5kKTsKPiA+IGRpZmYgLS1naXQg
YS9hcmNoL2FybTY0L21tL2NhY2hlLlMgYi9hcmNoL2FybTY0L21tL2NhY2hlLlMKPiA+IGluZGV4
IGRiNzY3YjA3MjYwMS4uYTQ4YjZkYmEzMDRlIDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9hcm02NC9t
bS9jYWNoZS5TCj4gPiArKysgYi9hcmNoL2FybTY0L21tL2NhY2hlLlMKPiA+IEBAIC0xNSw3ICsx
NSw3IEBACj4gPiAgI2luY2x1ZGUgPGFzbS9hc20tdWFjY2Vzcy5oPgo+ID4KPiA+ICAvKgo+ID4g
LSAqICAgZmx1c2hfaWNhY2hlX3JhbmdlKHN0YXJ0LGVuZCkKPiA+ICsgKiAgIF9fYXNtX2ZsdXNo
X2ljYWNoZV9yYW5nZShzdGFydCxlbmQpCj4gPiAgICoKPiA+ICAgKiAgIEVuc3VyZSB0aGF0IHRo
ZSBJIGFuZCBEIGNhY2hlcyBhcmUgY29oZXJlbnQgd2l0aGluIHNwZWNpZmllZCByZWdpb24uCj4g
PiAgICogICBUaGlzIGlzIHR5cGljYWxseSB1c2VkIHdoZW4gY29kZSBoYXMgYmVlbiB3cml0dGVu
IHRvIGEgbWVtb3J5IHJlZ2lvbiwKPiA+IEBAIC0yNCwxMSArMjQsMTEgQEAKPiA+ICAgKiAgIC0g
c3RhcnQgICAtIHZpcnR1YWwgc3RhcnQgYWRkcmVzcyBvZiByZWdpb24KPiA+ICAgKiAgIC0gZW5k
ICAgICAtIHZpcnR1YWwgZW5kIGFkZHJlc3Mgb2YgcmVnaW9uCj4gPiAgICovCj4gPiAtRU5UUlko
X19mbHVzaF9pY2FjaGVfcmFuZ2UpCj4gPiArRU5UUlkoX19hc21fZmx1c2hfaWNhY2hlX3Jhbmdl
KQo+ID4gICAgICAgLyogRkFMTFRIUk9VR0ggKi8KPiA+Cj4gPiAgLyoKPiA+IC0gKiAgIF9fZmx1
c2hfY2FjaGVfdXNlcl9yYW5nZShzdGFydCxlbmQpCj4gPiArICogICBfX2FzbV9mbHVzaF9jYWNo
ZV91c2VyX3JhbmdlKHN0YXJ0LGVuZCkKPiA+ICAgKgo+ID4gICAqICAgRW5zdXJlIHRoYXQgdGhl
IEkgYW5kIEQgY2FjaGVzIGFyZSBjb2hlcmVudCB3aXRoaW4gc3BlY2lmaWVkIHJlZ2lvbi4KPiA+
ICAgKiAgIFRoaXMgaXMgdHlwaWNhbGx5IHVzZWQgd2hlbiBjb2RlIGhhcyBiZWVuIHdyaXR0ZW4g
dG8gYSBtZW1vcnkgcmVnaW9uLAo+ID4gQEAgLTM3LDggKzM3LDcgQEAgRU5UUlkoX19mbHVzaF9p
Y2FjaGVfcmFuZ2UpCj4gPiAgICogICAtIHN0YXJ0ICAgLSB2aXJ0dWFsIHN0YXJ0IGFkZHJlc3Mg
b2YgcmVnaW9uCj4gPiAgICogICAtIGVuZCAgICAgLSB2aXJ0dWFsIGVuZCBhZGRyZXNzIG9mIHJl
Z2lvbgo+ID4gICAqLwo+ID4gLUVOVFJZKF9fZmx1c2hfY2FjaGVfdXNlcl9yYW5nZSkKPiA+IC0g
ICAgIHVhY2Nlc3NfdHRicjBfZW5hYmxlIHgyLCB4MywgeDQKPiA+ICtFTlRSWShfX2FzbV9mbHVz
aF9jYWNoZV91c2VyX3JhbmdlKQo+ID4gIGFsdGVybmF0aXZlX2lmIEFSTTY0X0hBU19DQUNIRV9J
REMKPgo+IEl0J3MgdW5mb3J0dW5hdGUgdGhhdCB3ZSBwdWxsZWQgdGhlIElEQyBhbHRlcm5hdGl2
ZSBvdXQgZm9yCj4gaW52YWxpZGF0ZV9pY2FjaGVfcmFuZ2UoKSwgYnV0IG5vdCBoZXJlLgoKR29v
ZCBwb2ludC4gSSB3aWxsIGZpeCB0aGF0IGluIGEgc2VwYXJhdGUgcGF0Y2guCgpUaGFuayB5b3Us
ClBhc2hhCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
