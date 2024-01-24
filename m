Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 078B783A4FA
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jan 2024 10:16:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.670824.1043859 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSZM0-0003L0-Ge; Wed, 24 Jan 2024 09:15:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 670824.1043859; Wed, 24 Jan 2024 09:15:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSZM0-0003JQ-E0; Wed, 24 Jan 2024 09:15:28 +0000
Received: by outflank-mailman (input) for mailman id 670824;
 Wed, 24 Jan 2024 09:15:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k9jB=JC=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rSZLy-0003Iy-IW
 for xen-devel@lists.xenproject.org; Wed, 24 Jan 2024 09:15:26 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1bbfbc24-ba99-11ee-98f5-6d05b1d4d9a1;
 Wed, 24 Jan 2024 10:15:25 +0100 (CET)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-55cca88b6a5so210831a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jan 2024 01:15:25 -0800 (PST)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 h9-20020a0564020e0900b00559736b84ffsm11044750edh.89.2024.01.24.01.15.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jan 2024 01:15:24 -0800 (PST)
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
X-Inumbo-ID: 1bbfbc24-ba99-11ee-98f5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706087725; x=1706692525; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9BEar1HU8T7eftDSQ6Z4GKnAGz6bSQ3j5Ys1+r4Vbgg=;
        b=UCtHggJDPwimFiDBntRtJO4IXXx5jPKjjWT0r3g586+nDcbhBFl3rdrPdX/sWPDyvz
         b6N9vkdodUkQdcHn11myLl9KPDRXG91xRwLEbBw2b4gdrmDEW/4Sgr7jHWcoIVJHuVv2
         61es+xCLUDEH0pkEM3N7iI5PvUcha2eLIvuaRxkKakbhbGXjFFu5Ol79NiAKegsN5Y4B
         Q9CK/lGVLrzVxqkueFk2r6W1f3EFvr0/S0fz3F+4HxpK2K7gb0/iJjxozgmAb8594N+g
         UTC8eA4x9MUh4FPOjWLnAkerC/k8qn27HgQDgvovkJc75T+HWLG2j3xQWH2n5gUyzmeD
         tsmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706087725; x=1706692525;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9BEar1HU8T7eftDSQ6Z4GKnAGz6bSQ3j5Ys1+r4Vbgg=;
        b=BfjKT89BIlkP2ArY5XbywBCn2SZUZlGMf8+QIKvkczAHmO2TIqItnSGYYuRXkMJwaY
         drKzkNv2lnX0N+M2lm7o3JFkLgbeCncPOGht2tO+QzIhAZfq6AQynjUypx8lUEPVEYXc
         AIyuoqXNsxjf6w1/kQAco69kRWtQ+MxwsA78xtQv7OWDTC0q24qxdQtZHmuCNfSz0Awx
         D3oIXzOa9ream1spjeBF2MYb5i7qVFOOgBCuMXR2Kv4drDU8qyBlMzRj+WJEC8ClaI1q
         X2TvkkSLEDJz715C2kje0iJL/U+nDv64je+mp++l2j284qvJdLO1NJrH3Lh/8H7G+2dW
         h0ZQ==
X-Gm-Message-State: AOJu0YzjjazK+obelSp7nbQYpazbm+WBgLfVQTkkPUnMP3D7G6YTSgXs
	uV49YhwGNgTOSJwBsXRp7ZnffvH3RNdOoLtXcWakvTzwe5H5IBk4
X-Google-Smtp-Source: AGHT+IEBM+V/cjbnzJ2r80lvSZKH9FPCZ7UZoWjBENcm6ZiwxHzb1I+sF8CBsvr8ESwl4jhJVRwczg==
X-Received: by 2002:aa7:d399:0:b0:559:f4b4:3077 with SMTP id x25-20020aa7d399000000b00559f4b43077mr1996589edq.45.1706087724677;
        Wed, 24 Jan 2024 01:15:24 -0800 (PST)
Message-ID: <3c6aead1a067c6202474e9752b343d268c335b8c.camel@gmail.com>
Subject: Re: [PATCH v3 13/34] xen/riscv: introduce cmpxchg.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>,  Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
 xen-devel@lists.xenproject.org
Date: Wed, 24 Jan 2024 11:15:23 +0200
In-Reply-To: <c57e17ed-61db-4da2-975b-083bfabcbe47@suse.com>
References: <cover.1703255175.git.oleksii.kurochko@gmail.com>
	 <214bfd61c8ccf2a5b2c640b815ebfa6a705f6234.1703255175.git.oleksii.kurochko@gmail.com>
	 <8ee35a76-f3ef-4143-93ef-8e6089f82a80@suse.com>
	 <56c23efdd79c0b1393ceef1adfcb45f66d4d1cf6.camel@gmail.com>
	 <c5872ae0-a26a-4f51-bad6-08fd0c37d488@suse.com>
	 <835c58c1deb89db2fa500bd7cd767facd5b5fb78.camel@gmail.com>
	 <c57e17ed-61db-4da2-975b-083bfabcbe47@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

T24gVHVlLCAyMDI0LTAxLTIzIGF0IDE0OjI3ICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToKPiBP
biAyMy4wMS4yMDI0IDEzOjE4LCBPbGVrc2lpIHdyb3RlOgo+ID4gT24gVHVlLCAyMDI0LTAxLTIz
IGF0IDExOjI4ICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToKPiA+ID4gT24gMjMuMDEuMjAyNCAx
MToxNSwgT2xla3NpaSB3cm90ZToKPiA+ID4gPiBPbiBNb24sIDIwMjQtMDEtMjIgYXQgMTc6Mjcg
KzAxMDAsIEphbiBCZXVsaWNoIHdyb3RlOgo+ID4gPiA+ID4gT24gMjIuMTIuMjAyMyAxNjoxMiwg
T2xla3NpaSBLdXJvY2hrbyB3cm90ZToKPiA+ID4gPiA+ID4gK3N0YXRpYyBpbmxpbmUgdW5zaWdu
ZWQgbG9uZyBfX3hjaGcodm9sYXRpbGUgdm9pZCAqcHRyLAo+ID4gPiA+ID4gPiB1bnNpZ25lZAo+
ID4gPiA+ID4gPiBsb25nIHgsIGludCBzaXplKQo+ID4gPiA+ID4gPiArewo+ID4gPiA+ID4gPiAr
wqDCoMKgIHN3aXRjaCAoc2l6ZSkgewo+ID4gPiA+ID4gPiArwqDCoMKgIGNhc2UgMToKPiA+ID4g
PiA+ID4gK8KgwqDCoMKgwqDCoMKgIHJldHVybiBfX2NtcHhjaGdfY2FzZV8xKHB0ciwgKHVpbnQz
Ml90KS0xLCB4KTsKPiA+ID4gPiA+ID4gK8KgwqDCoCBjYXNlIDI6Cj4gPiA+ID4gPiA+ICvCoMKg
wqDCoMKgwqDCoCByZXR1cm4gX19jbXB4Y2hnX2Nhc2VfMihwdHIsICh1aW50MzJfdCktMSwgeCk7
Cj4gPiA+ID4gPiAKPiA+ID4gPiA+IEhvdyBhcmUgdGhlc2UgZ29pbmcgdG8gd29yaz8gWW91J2xs
IGNvbXBhcmUgYWdhaW5zdCB+MCwgYW5kCj4gPiA+ID4gPiBpZgo+ID4gPiA+ID4gdGhlCj4gPiA+
ID4gPiB2YWx1ZQo+ID4gPiA+ID4gaW4gbWVtb3J5IGlzbid0IH4wLCBtZW1vcnkgd29uJ3QgYmUg
dXBkYXRlZDsgeW91IHdpbGwgb25seQo+ID4gPiA+ID4gKGNvcnJlY3RseSkKPiA+ID4gPiA+IHJl
dHVybiB0aGUgdmFsdWUgZm91bmQgaW4gbWVtb3J5Lgo+ID4gPiA+ID4gCj4gPiA+ID4gPiBPciB3
YWl0IC0gbG9va2luZyBhdCBfX2NtcHhjaGdfY2FzZV97MSwyfSgpIGZhciBmdXJ0aGVyIGRvd24s
Cj4gPiA+ID4gPiB5b3UKPiA+ID4gPiA+IGlnbm9yZQo+ID4gPiA+ID4gIm9sZCIgdGhlcmUuIFdo
aWNoIGFwcGFyZW50bHkgbWVhbnMgdGhleSdsbCB3b3JrIGZvciB0aGUgdXNlCj4gPiA+ID4gPiBo
ZXJlLAo+ID4gPiA+ID4gYnV0Cj4gPiA+ID4gPiBub3QgZm9yIHRoZSB1c2UgaW4gX19jbXB4Y2hn
KCkuCj4gPiA+ID4gWWVzLCB0aGUgdHJpY2sgaXMgdGhhdCBvbGQgaXMgaWdub3JlZCBhbmQgaXMg
cmVhZCBpbgo+ID4gPiA+IF9fZW11bGF0ZV9jbXB4Y2hnX2Nhc2UxXzIoKSBiZWZvcmUgX19jbXB4
Y2hnX2Nhc2VfNCBpcyBjYWxsZWQ6Cj4gPiA+ID4gwqDCoMKgIGRvCj4gPiA+ID4ge8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IAo+ID4gPiA+IMKgwqDCoMKgwqDCoMKgIHJlYWRfdmFsID0KPiA+ID4gPiByZWFkX2Z1bmMoYWxp
Z25lZF9wdHIpO8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCAKPiA+ID4gPiDCoMKgwqDCoMKgwqDCoCBzd2FwcGVkX25ldyA9IHJlYWRfdmFsICYK
PiA+ID4gPiB+bWFzazvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgCj4gPiA+ID4gwqDCoMKgwqDCoMKgwqAgc3dhcHBlZF9uZXcgfD0K
PiA+ID4gPiBtYXNrZWRfbmV3O8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgCj4gPiA+ID4gwqDCoMKgwqDCoMKgwqAg
cmV0ID0gY21weGNoZ19mdW5jKGFsaWduZWRfcHRyLCByZWFkX3ZhbCwKPiA+ID4gPiBzd2FwcGVk
X25ldyk7wqDCoMKgwqDCoMKgIAo+ID4gPiA+IMKgwqDCoCB9IHdoaWxlICggcmV0ICE9IHJlYWRf
dmFsCj4gPiA+ID4gKTvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAKPiA+ID4gPiByZWFkX3ZhbCBpdCBpcyAn
b2xkJy4KPiA+ID4gPiAKPiA+ID4gPiBCdXQgbm93IEkgYW0gbm90IDEwMCUgc3VyZSB0aGF0IGl0
IGlzIGNvcnJlY3QgZm9yIF9fY21weGNoZy4uLgo+ID4gPiAKPiA+ID4gSXQganVzdCBjYW4ndCBi
ZSBjb3JyZWN0IC0geW91IGNhbid0IGlnbm9yZSAib2xkIiB0aGVyZS4gSSB0aGluawo+ID4gPiB5
b3UKPiA+ID4gd2FudCBzaW1wbGUgY21weGNoZyBwcmltaXRpdmVzLCB3aGljaCB4Y2hnIHRoZW4g
dXNlcyBpbiBhIGxvb3AKPiA+ID4gKHdoaWxlCj4gPiA+IGNtcHhjaGcgdXNlcyB0aGVtIHBsYWlu
bHkpLgo+ID4gQnV0IHhjaGcgZG9lc24ndCByZXF1aXJlICdvbGQnIHZhbHVlLCBzbyBpdCBzaG91
bGQgYmUgaWdub3JlZCBpbgo+ID4gc29tZQo+ID4gd2F5IGJ5IGNtcHhjaGcuCj4gCj4gV2VsbCwg
bm8uIElmIHlvdSBoYXZlIG9ubHkgY21weGNoZywgSSB0aGluayB5b3VyIG9ubHkgY2hvaWNlIGlz
IC0gYXMKPiBzYWlkIC0gdG8gcmVhZCB0aGUgb2xkIHZhbHVlIGFuZCB0aGVuIGxvb3Agb3ZlciBj
bXB4Y2hnIHVudGlsIHRoYXQKPiBzdWNjZWVkcy4gTm90IHJlYWxseSBkaWZmZXJlbnQgZnJvbSBv
dGhlciBvcGVyYXRpb25zIHdoaWNoIG5lZWQKPiBlbXVsYXRpbmcgdXNpbmcgY21weGNoZy4KVGhl
biBpdCBsb29rcyBsaWtlIHRoZSBtYWluIGVycm9yIGluIF9fZW11bGF0ZV9jbXB4Y2hnX2Nhc2Ux
XzIgaXMgdGhhdApJIHJlYWQgdGhlIHZhbHVlIGVhY2ggdGltZSwgc28gcmVhZF92YWwgPSByZWFk
X2Z1bmMoYWxpZ25lZF9wdHIpOyAKc2hvdWxkIGJlIGJlZm9yZSB0aGUgZG8gey4uLn0gd2hpbGUo
KS4gQWxzbywgaXQgd291bGQgYmUgYmV0dGVyIHRvCnJlbmFtZSBpdCB0byBvbGRfdmFsIG9yIGp1
c3Qgb2xkLgoKPiAKPiA+ID4gPiA+ID4gK3N0YXRpYyBhbHdheXNfaW5saW5lIHVuc2lnbmVkIHNo
b3J0Cj4gPiA+ID4gPiA+IF9fY21weGNoZ19jYXNlXzIodm9sYXRpbGUKPiA+ID4gPiA+ID4gdWlu
dDMyX3QgKnB0ciwKPiA+ID4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgCj4gPiA+ID4gPiA+IHVpbnQzMl90Cj4gPiA+ID4gPiA+IG9sZCwKPiA+
ID4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
Cj4gPiA+ID4gPiA+IHVpbnQzMl90Cj4gPiA+ID4gPiA+IG5ldykKPiA+ID4gPiA+ID4gK3sKPiA+
ID4gPiA+ID4gK8KgwqDCoCAodm9pZCkgb2xkOwo+ID4gPiA+ID4gPiArCj4gPiA+ID4gPiA+ICvC
oMKgwqAgaWYgKCgodW5zaWduZWQgbG9uZylwdHIgJiAzKSA9PSAzKQo+ID4gPiA+ID4gPiArwqDC
oMKgIHsKPiA+ID4gPiA+ID4gKyNpZmRlZiBDT05GSUdfNjRCSVQKPiA+ID4gPiA+ID4gK8KgwqDC
oMKgwqDCoMKgIHJldHVybiBfX2VtdWxhdGVfY21weGNoZ19jYXNlMV8yKCh1aW50NjRfdCAqKXB0
ciwKPiA+ID4gPiA+ID4gbmV3LAo+ID4gPiA+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
cmVhZHEsCj4gPiA+ID4gPiA+IF9fY21weGNoZ19jYXNlXzgsCj4gPiA+ID4gPiA+IDB4ZmZmZlUp
Owo+ID4gPiA+ID4gCj4gPiA+ID4gPiBXaGF0IGlmICgodW5zaWduZWQgbG9uZylwdHIgJiA3KSA9
PSA3ICh3aGljaCBpcyBhIHN1Yi1jYXNlIG9mCj4gPiA+ID4gPiB3aGF0Cj4gPiA+ID4gPiB0aGUK
PiA+ID4gPiA+IGlmKCkgYWJvdmUgY2hlY2tzIGZvcj8gSXNuJ3QgaXQgbW9yZSByZWFzb25hYmxl
IHRvIHJlcXVpcmUKPiA+ID4gPiA+IGFsaWduZWQKPiA+ID4gPiA+IDE2LWJpdCBxdWFudGl0aWVz
IGhlcmU/IE9yIGlmIG1pcy1hbGlnbmVkIGFkZHJlc3NlcyBhcmUgb2theSwKPiA+ID4gPiA+IHlv
dQo+ID4gPiA+ID4gY291bGQKPiA+ID4gPiA+IGFzIHdlbGwgZW11bGF0ZSB1c2luZyBfX2NtcHhj
aGdfY2FzZV80KCkuCj4gPiA+ID4gWWVzLCBpdCB3aWxsIGJlIG1vcmUgcmVhc29uYWJsZS4gSSds
bCB1c2UgSVNfQUxJR05FRCBpbnN0ZWFkLgo+ID4gPiAKPiA+ID4gTm90IHN1cmUgSSBnZXQgeW91
ciB1c2Ugb2YgImluc3RlYWQiIGhlcmUgY29ycmVjdGx5LiBUaGVyZSdzIG1vcmUKPiA+ID4gdG8g
Y2hhbmdlIGhlcmUgdGhhbiBqdXN0IHRoZSBpZigpIGNvbmRpdGlvbi4KPiA+IEkgbWVhbnQgc29t
ZXRoaW5nIGxpa2U6Cj4gPiAKPiA+IGlmICggSVNfQUxJR05FRChwdHIsIDE2KSApCj4gPiDCoMKg
wqAgX19lbXVsYXRlX2NtcHhjaGdfY2FzZTFfMiguLi4pOwo+ID4gZWxzZQo+ID4gwqDCoMKgIGFz
c2VydF9mYWlsZWQoInB0ciBpc24ndCBhbGlnbmVkXG4iKTsKPiAKPiBFeGNlcHQgdGhhdCB5b3Un
ZCBiZXR0ZXIgbm90IHVzZSBhc3NlcnRfZmFpbGVkKCkgZGlyZWN0bHkgYW55d2hlcmUsCj4gYW5k
IHRoZSBhYm92ZSBpcyBlYXNpZXIgYXMKPiAKPiDCoMKgwqAgQVNTRVJUKElTX0FMSUdORUQocHRy
LCAxNikpOwo+IMKgwqDCoCBfX2VtdWxhdGVfY21weGNoZ19jYXNlMV8yKC4uLik7Cj4gCj4gYW55
d2F5IChsZWF2aW5nIGFzaWRlIHRoYXQgSSBndWVzcyB5b3UgbWVhbiAyLCBub3QgMTYpLgpZZWFo
LCBpdCBzaG91bGQgYmUgMi4gVGhhbmtzLgoKfiBPbGVrc2lpCg==


