Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F18261245
	for <lists+xen-devel@lfdr.de>; Sat,  6 Jul 2019 18:53:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hjntO-0008Oh-So; Sat, 06 Jul 2019 16:50:30 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=L7pd=VD=gmail.com=denisobrezkov@srs-us1.protection.inumbo.net>)
 id 1hjntN-0008Oc-PO
 for xen-devel@lists.xenproject.org; Sat, 06 Jul 2019 16:50:29 +0000
X-Inumbo-ID: 27d6d79c-a00e-11e9-8980-bc764e045a96
Received: from mail-ed1-x543.google.com (unknown [2a00:1450:4864:20::543])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 27d6d79c-a00e-11e9-8980-bc764e045a96;
 Sat, 06 Jul 2019 16:50:27 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id e2so3821367edi.12
 for <xen-devel@lists.xenproject.org>; Sat, 06 Jul 2019 09:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9grknJxdy4N8TzaG+0PFMs+AedGxX7g0lNVG62zSr0s=;
 b=n7KiWRXQPW2TasCYUmWhlha1H/of5z3PyI0bV3aZSPokW0CndX7O2p2oVMMZ6MI4pv
 lHl5RV3VCuSKWyyZjplNM3tyVCcRksFq2nj+0fHbi7LFeH32+c1kLuws8wMFLpzpIV0u
 BLoN6vhlXAHXQ2Kd5DNeTjNa7lJtFsFPjsZTxip/Vvpw6lSj6KCYLQmNjW/6r5tjACfl
 k2rn9LLs8R49ostyC3fPoyGh6lgdk6CQqdKSaix+Gmlopk+qn69EII7SarnqD0xdyYhw
 vFswXvi8Zt93W9wJZGwbIAPDHDxSzTSUaAy2wF58LHanaFKBOu/+K5GQayPjwmagcOFO
 eVfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=9grknJxdy4N8TzaG+0PFMs+AedGxX7g0lNVG62zSr0s=;
 b=Ttl5grkQGbFtQHdROMbXMqin/6+wxqV0/iLQfuYMmyZvo6PXw6Mwb6eZ+hTyyj+lbD
 N1z9O0ZNm1WXsfFP8W/bzA4E76/1qDGB6LJxmdMdXmIc1CKCHP18btEEQVZ+pg94o9Am
 yYvJqz2+NXSywgjsw4l0OqpgvRdQHjuA+zFtr8+L6i8ohIpDCiJe8zeLnC5/z6iwh/ZL
 2qV/elg4o7pR2JpPeQa77FnZ7EeGt4jmlC/OpYx8wo00El3ix9mW2pHmg4jKoHi6pyul
 cMazeE/2f1BJq21qH4vNSs6OfAPw/mVR1qzjy/IrFtBShIDwsTaiQFEKjoCqFs0EWU4M
 xkAA==
X-Gm-Message-State: APjAAAUo6vg+5Y9L3uS2gxSB30j96KzXjFMGyP+4NIIYhqzsn1BXYMd6
 Jxf5CnA9dvqn55ME6m/OzuE=
X-Google-Smtp-Source: APXvYqykR+yIfcw+C01ft5vLFbetbjT5+0Vn0xQQHBRiL+rAhrGklgj0s+t6FaepVZNP4GnW4y+7IQ==
X-Received: by 2002:a17:906:401a:: with SMTP id
 v26mr8865626ejj.62.1562431826636; 
 Sat, 06 Jul 2019 09:50:26 -0700 (PDT)
Received: from ?IPv6:2001:16b8:6619:6c00:1e4b:d6ff:fef9:46e6?
 (200116b866196c001e4bd6fffef946e6.dip.versatel-1u1.de.
 [2001:16b8:6619:6c00:1e4b:d6ff:fef9:46e6])
 by smtp.gmail.com with ESMTPSA id d1sm2320354ejc.72.2019.07.06.09.50.25
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 06 Jul 2019 09:50:26 -0700 (PDT)
To: Julien Grall <Julien.Grall@arm.com>, Iain Hunter <drhunter95@gmail.com>
References: <4ec41ede-a8cb-6724-aa88-254387b2aa15@gmail.com>
 <CALC81-tWyUTXVf5uxtdi_i5Ndz0CRtoJ=XwTecz40bzyL7Ps1w@mail.gmail.com>
 <779518d6-b7f8-9faa-f22d-558013dc8cfb@gmail.com>
 <583833d2-8303-48f5-7cab-f9e4e112a694@gmail.com>
 <3a2a6185-0056-d931-a194-578239eedabc@gmail.com>
 <c85dcf69-2a56-811d-fa95-b313ca9ea66f@arm.com>
 <42daf482-9f3e-55c7-9bad-c61b147252af@gmail.com>
 <da1d04bb-54ad-5bf7-f62e-1fecbb1e7611@arm.com>
 <e22d87c2-d09b-848a-b520-e80599d895a1@gmail.com>
 <625d8126-5baa-4d83-b27c-fabd94fe5f77@arm.com>
From: Denis Obrezkov <denisobrezkov@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=denisobrezkov@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <27be8a8a-7bf1-2c18-bc1d-6dd4898da47b@gmail.com>
Date: Sat, 6 Jul 2019 18:50:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <625d8126-5baa-4d83-b27c-fabd94fe5f77@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [GSOC-2019] Problem with initializing crossbar on
 bb-x15 in dom0
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 nd <nd@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Hunyue Yau <hy-gsoc@hy-research.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4gT2ssIEkgY2hhbmdlZCBpdCBhbmQgd2FzIGFibGUgdG8gYm9vdCB0byB0aGUgcHJldmlvdXMg
ZXJyb3IuIEkgdGhpbmsgYQo+PiBsb2dpY2FsIG5leHQgc3RlcCB3b3VsZCBiZSB0byBzZXQgdXAg
dGhlIHVhcnQgc29tZWhvdz8KPiAKPiBEbyB5b3UgbWVhbiB0aGUgVUFSVCB1c2VkIGJ5IFhlbj8K
WWVzLCB0byBiZSBhYmxlIHRvIHN3aXRjaCBiZXR3ZWVuIHhlbiBhbmQgZG9tMCwgdG8gZG93bmxv
YWQgYSBwcm9kdWNlZApkdCBmb3IgZG9tMCBmb3IgZXhhbXBsZS4KPiAKPj4+Cj4+PiBCdXQgdGhp
cyBmZWVscyB3ZWlyZCB0byBtYXAgdGhlbiB1bm1hcCB0aGUgbW1pby4gSW5zdGVhZCwgeW91IHNo
b3VsZAo+Pj4gYmxhY2tsaXN0IHRoZSBjcm9zc2JhciBkZXZpY2UuIEhhdmUgYSBsb29rIGF0IHRo
ZSBmaWVsZCBibGFja2xpc3RfZGV2IGluCj4+PiBwbGF0Zm9ybV9kZXNjLgo+PiBIbSwgSSBjYW4g
c2VlIHRoYXQgaW4gdGhlIGRldmljZSB0cmVlIHRoZSBjcm9zc2JhciBoYXMgYSBwaGFuZGxlCj4+
IHByb3BlcnR5IDwweDAwMDAwMDA4PiBhbmQgdGhlIG1haW4gbm9kZSBoYXMgYW4gaW50ZXJydXB0
LXBhcmVudCBwcm9wZXJ0eQo+PiAweDAwMDAwMDA4LiBTbywgYWxsIHRoZSBpbnRlcnJ1cHRzIHNl
ZW1zIHRvIGJlIG1hcHBlZCB0byB0aGUgY3Jvc3NiYXIuCj4+IFdvdWxkbid0IGJlIHRoYXQgYSBw
cm9ibGVtIGlmIHdlIGJsYWNrbGlzdCB0aGUgZGV2aWNlPwo+IAo+IAo+IFRoZSBEZXZpY2UgaXMg
b3duZWQgYnkgWGVuLCBzbyB0ZWNobmljYWxseSBEb20wIGRvZXMgbm90IHNlZSB0aGUgCj4gaGFy
ZHdhcmUgb25lLiBJbnN0ZWFkIGl0IHNlZXMgYSB2aXJ0dWFsIGFuZCB0aGVyZWZvcmUgdGhlIG5v
ZGUgc2hvdWxkIGJlIAo+IGNyZWF0ZWQgdG8gcmVmbGVjdCBpdC4KPiAKPiBUaGUgcHVycG9zZSBv
ZiByZWNyZWF0aW5nIHRoZSBub2RlIGlzIHlvdSBjYW4gYWx0ZXIgaXQgdG8gbWF0Y2ggd2hhdCB3
ZSAKPiBhY3R1YWxseSBleHBvc2VkIHRvIHRoZSBkb21haW4gKHByb3BlcnR5IHZhbHVlcyBtYXkg
ZGlmZmVyKS4gSXQgbWF5IAo+IGhhcHBlbiB0aGF0IGEgbG90IG9mIGluZm9ybWF0aW9uIGFyZSBl
eGFjdGx5IHRoZSBzYW1lIGFzIHRoZSBoYXJkd2FyZSAKPiBhbmQgY2FuIGp1c3QgYmUgY29waWVk
Lgo+IAo+IFRoaXMgaXMsIGZvciBpbnN0YW5jZSwgd2hhdCB3ZSBkbyBmb3IgdGhlIEdJQyBhbmQg
dGltZXIuCkkgbWVhbiBpZiB3ZSBleHBvc2Ugb25seSBHSUMgdG8gdGhlIGRvbTAgdGhlbiB3ZSBu
ZWVkIHRvIGNoYW5nZSB0aGUKaW50ZXJydXB0LXBhcmVudCBwcm9wZXJ0eSB0byBtYWtlIGFsbCBu
b2RlcyBoYXZlIEdJQydzIHBoYW5kbGUgYXMgdGhlaXIKaW50ZXJydXB0LXBhcmVudC4gQW5kIHdo
ZW4gZG9tMCB0cmllcyB0byBtb2RpZnkgaXJxIGNvbm5lY3Rpb25zIHRoZW4geGVuCnNob3VsZCBt
b2RpZnkgdGhlIGNyb3NzYmFyLiBJdCBzZWVtcyB0byBiZSBhIGJpdCBlcnJvciBwcm9uZSBhcHBy
b2FjaC4KPiAKPj4gQWxzbywgdGhlIHRlZ3JhCj4+IGltcGxlbWVudGF0aW9uIGJsYWNrbGlzdCBv
bmx5IGEgdWFydC4KPiAKPiBJIGRvbid0IHVuZGVyc3RhbmQgdGhpcy4KSW4gaGVyZSBbMV0geW91
IGNhbiBmaW5kIHRoYXQgb25seSB1YXJ0IGlzIGJsYWNrbGlzdGVkIChpbgp0ZWdyYV9ibGFja2xp
c3RfZGV2W10pLiBTbywgaW4gdGVncmEgdGhleSBkaWRuJ3QgYmxhY2tsaXN0IHRoZWlyIHZlcnNp
b24Kb2YgdGhlIGNyb3NzYmFyLgoKClsxXQpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL2Fy
Y2hpdmVzL2h0bWwveGVuLWRldmVsLzIwMTctMDQvbXNnMDA5OTMuaHRtbAoKLS0gClJlZ2FyZHMs
IERlbmlzIE9icmV6a292CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
