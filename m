Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F65710B1F0
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2019 16:13:17 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZyxS-0006jv-E1; Wed, 27 Nov 2019 15:10:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8bDK=ZT=soleen.com=pasha.tatashin@srs-us1.protection.inumbo.net>)
 id 1iZyxQ-0006jq-PV
 for xen-devel@lists.xenproject.org; Wed, 27 Nov 2019 15:10:20 +0000
X-Inumbo-ID: 069f0c42-1128-11ea-83b8-bc764e2007e4
Received: from mail-ed1-x542.google.com (unknown [2a00:1450:4864:20::542])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 069f0c42-1128-11ea-83b8-bc764e2007e4;
 Wed, 27 Nov 2019 15:10:20 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id m13so19920533edv.9
 for <xen-devel@lists.xenproject.org>; Wed, 27 Nov 2019 07:10:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=soleen.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=edWCWNJl31yQrbW0RZTxPYG82aTNE1yVNktB5ng+jf4=;
 b=mTekDiyG/xSD58MUN5RTKNnzPqxt+1ORlhcDVQSCtgZD7sNjGt7a7DEpyDJLCHSio+
 3duP0FXDUc/mOAzY3EV2Wa2JzDM2Z6fS8MEMH3ayihsodOPFsYkMEIBd7LfOfZB6anIx
 lM37RhXs12XiLUpTvHp3EPdsIp/U+F7GUFDci+3U9wwSRjHah2bgF25bCd+pqiRnIpVx
 SSVZOZFYRGW9qiOgMuEt9xfCdXkVY79xtc1sUWMxJbK2jnkeRKtKhnSTEbh8wAreQAAq
 LSHHTXHfzKolX04pR5vPDEdVs+lUuicziBwzYA/5s3QiUQiy3q1ddUB9m+130YMPSr77
 GYQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=edWCWNJl31yQrbW0RZTxPYG82aTNE1yVNktB5ng+jf4=;
 b=CB6R7EUHRjXm05fcD7v/voKxcS3rkssk/hfJTwOb0YHZRV2uCwAfz2i+wpQJp0QsXG
 fnDy8woZqVBwjC1R/6PKihYEZzmApUjT/7+6+zghbAqn7kZd9sVdadg2ophJ7ajm9/YC
 elZK8cAwJ6k+6XDuTO4evu0DXFuhQLyrQDhknKNV43vpISIOIoKOFghkJOI/oi2iZuSK
 UvrbvJ89XTBr0OwWhxhR1DrhGJ8W8M4wpImAg1fdXZkdb3hmY68mJpHsWmWaipxFfk+b
 3aNU/UwyWTw1AK/Rv9kEgDwt+C3REoOM1SU7lDV96xYcaqGMafaIy571BHEjobYGwKrJ
 6PJA==
X-Gm-Message-State: APjAAAXQoOvwmzeSF9pDiNue/eGX+KVjfBD9dyBI8VkncLmi3drEVUIM
 J65+0rZlKYDLDEWiIAT2UjfPy6RxL91LqFx59CPGXQ==
X-Google-Smtp-Source: APXvYqyPH1e9Ql392wF4i1O7GHWfwg6/A8SLFBgaaht+RqQI1k7Yx/GSlGoDs4aBwXnGTvjkilYo3d8M41CYZdYnigY=
X-Received: by 2002:a05:6402:324:: with SMTP id
 q4mr32625784edw.108.1574867419153; 
 Wed, 27 Nov 2019 07:10:19 -0800 (PST)
MIME-Version: 1.0
References: <20191122022406.590141-1-pasha.tatashin@soleen.com>
 <20191122022406.590141-3-pasha.tatashin@soleen.com>
 <20191127150137.GB51937@lakrids.cambridge.arm.com>
In-Reply-To: <20191127150137.GB51937@lakrids.cambridge.arm.com>
From: Pavel Tatashin <pasha.tatashin@soleen.com>
Date: Wed, 27 Nov 2019 10:10:07 -0500
Message-ID: <CA+CK2bBvgDe5zVur7EYJgYhoZesuQkZVeyRxPCBSySqsR=-YPQ@mail.gmail.com>
To: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [Xen-devel] [PATCH v2 2/3] arm64: remove uaccess_ttbr0 asm
 macros from cache functions
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

SGkgTWFyaywKClRoYW5rIHlvdSBmb3IgcmV2aWV3aW5nIHRoaXMgd29yay4KCj4gQSBjb21taXQg
bWVzc2FnZSBzaG91bGQgcHJvdmlkZSByYXRpb25hbGUsIHJhdGhlciB0aGFuIGp1c3QgYQo+IGRl
c2NyaXB0aW9uIG9mIHRoZSBwYXRjaC4gU29tZXRoaW5nIGxpa2U6Cj4KPiB8IFdlIGN1cnJlbnRs
eSBkdXBsaWNhdGUgdGhlIGxvZ2ljIHRvIGVuYWJsZS9kaXNhYmxlIHVhY2Nlc3MgdmlhIFRUQlIw
LAo+IHwgd2l0aCBDIGZ1bmN0aW9ucyBhbmQgYXNzZW1ibHkgbWFjcm9zLiBUaGlzIGlzIGEgbWFp
bnRlbmVuYWNlIGJ1cmRlbgo+IHwgYW5kIGlzIGxpYWJsZSB0byBsZWFkIHRvIHN1YnRsZSBidWdz
LCBzbyBsZXQncyBnZXQgcmlkIG9mIHRoZSBhc3NlbWJseQo+IHwgbWFjcm9zLCBhbmQgYWx3YXlz
IHVzZSB0aGUgQyBmdW5jdGlvbnMuIFRoaXMgcmVxdWlyZXMgcmVmYWN0b3JpbmcKPiB8IHNvbWUg
YXNzZW1ibHkgZnVuY3Rpb25zIHRvIGhhdmUgYSBDIHdyYXBwZXIuCgpUaGFuayB5b3UgZm9yIHN1
Z2dlc3Rpb24sIEkgd2lsbCBmaXggbXkgY29tbWl0IGxvZy4KPgo+IFsuLi5dCj4KPiA+ICtzdGF0
aWMgaW5saW5lIGludCBpbnZhbGlkYXRlX2ljYWNoZV9yYW5nZSh1bnNpZ25lZCBsb25nIHN0YXJ0
LAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxv
bmcgZW5kKQo+ID4gK3sKPiA+ICsgICAgIGludCBydjsKPiA+ICsjaWYgQVJNNjRfSEFTX0NBQ0hF
X0RJQwo+ID4gKyAgICAgcnYgPSBhcmNoX2ludmFsaWRhdGVfaWNhY2hlX3JhbmdlKHN0YXJ0LCBl
bmQpOwo+ID4gKyNlbHNlCj4gPiArICAgICB1YWNjZXNzX3R0YnIwX2VuYWJsZSgpOwo+ID4gKyAg
ICAgcnYgPSBhcmNoX2ludmFsaWRhdGVfaWNhY2hlX3JhbmdlKHN0YXJ0LCBlbmQpOwo+ID4gKyAg
ICAgdWFjY2Vzc190dGJyMF9kaXNhYmxlKCk7Cj4gPiArI2VuZGlmCj4gPiArICAgICByZXR1cm4g
cnY7Cj4gPiArfQo+Cj4gVGhpcyBpZmRlZmZlcnkgaXMgbm90IHRoZSBzYW1lIGFzIGFuIGFsdGVy
bmF0aXZlX2lmLCBhbmQgZXZlbiBpZiBpdCB3ZXJlCj4gdGhlIEFSTTY0X0hBU19DQUNIRV9ESUMg
YmVoYXZpb3VyIGlzIG5vdCB0aGUgc2FtZSBhcyB0aGUgZXhpc3RpbmcKPiBhc3NlbWJseS4KPgo+
IFRoaXMgc2hvdWxkIGJlOgo+Cj4gc3RhdGljIGlubGluZSBpbnQgaW52YWxpZGF0ZV9pY2FjaGVf
cmFuZ2UodW5zaWduZWQgbG9uZyBzdGFydCwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nIGVuZCkKPiB7Cj4gICAgICAgICBpbnQgcmV0Owo+
Cj4gICAgICAgICBpZiAoY3B1c19oYXZlX2NvbnN0X2NhcChBUk02NF9IQVNfQ0FDSEVfRElDKSkg
ewo+ICAgICAgICAgICAgICAgICBpc2IoKTsKPiAgICAgICAgICAgICAgICAgcmV0dXJuIDA7Cj4g
ICAgICAgICB9Cj4KPiAgICAgICAgIHVhY2Nlc3NfdHRicjBfZW5hYmxlKCk7Cj4gICAgICAgICBy
ZXQgPSBhcmNoX2ludmFsaWRhdGVfaWNhY2hlX3JhbmdlKHN0YXJ0LCBlbmQpOwo+ICAgICAgICAg
dWFjY2Vzc190dGJyMF9kaXNhYmxlKCk7Cj4KPiAgICAgICAgIHJldHVybiByZXQ7Cj4gfQoKSSB3
aWxsIGZpeCBpdCwgdGhhbmtzLgoKPgo+IFRoZSAnYXJjaF8nIHByZWZpeCBzaG91bGQgcHJvYmFi
bHkgYmUgJ2FzbV8nIChvciBoYXZlIGFuICdfYXNtJyBzdWZmaXgpLAo+IHNpbmNlIHRoaXMgaXMg
ZW50aXJlbHkgbG9jYWwgdG8gdGhlIGFyY2ggY29kZSwgYW5kIGV2ZW4gdGhlbiBzaG91bGQgb25s
eQo+IGJlIGNhbGxlZCBmcm9tIHRoZSBDIHdyYXBwZXJzLgoKU3VyZSwgSSBjYW4gY2hhbmdlIGl0
IHRvIGFzbV8qLCBJIHdhcyB1c2luZyBhcmNoXyogdG8gYmUgY29uc2lzdGVudAp3aXRoIF9fYXJj
aF9jb3B5X2Zyb21fdXNlcigpIGFuZCBmcmllbmRzLgoKVGhhbmsgeW91LApQYXNoYQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
