Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C789F145772
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jan 2020 15:07:37 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iuGcW-0004XV-WD; Wed, 22 Jan 2020 14:04:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=GdgK=3L=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1iuGcV-0004XL-V8
 for xen-devel@lists.xenproject.org; Wed, 22 Jan 2020 14:04:35 +0000
X-Inumbo-ID: 1e765784-3d20-11ea-9fd7-bc764e2007e4
Received: from mail-lf1-x141.google.com (unknown [2a00:1450:4864:20::141])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1e765784-3d20-11ea-9fd7-bc764e2007e4;
 Wed, 22 Jan 2020 14:04:35 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id z18so5426138lfe.2
 for <xen-devel@lists.xenproject.org>; Wed, 22 Jan 2020 06:04:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=g8XJmgjU7AtLh2IDtrTowvIGt1KTG9KvGoDJK3ioNDA=;
 b=WjmFjDUu2NQCbBdchdIyprm+tZa2oY5W+CJbtDWs723AIAD6dIyXLpFwR4ZLLzKZCW
 XCWvu9sPtFt25rOlKIBp1ceCcrzVBLuNOqYWtYMsLbFB0X7YeibnpqHQRjebV3oIkh1u
 cHACCQHXv2RSlBP7yGuERUXQBi3SiG60FIjQBlGH4FHu2EqZmSYuaR6hsQhesplBQOq1
 LFZZzO/p45ucmXZek4g8ncEDh/4vZum4bJCe/f7tk55ELFRNygw7LG94Z5h8gxFnLvff
 c8wDIbAIT4djPo+sugQx5BNHrHtBl5iqQyZ5PvvmQYMWIYmHrPgYHgqTCWp63xUifnYX
 lsmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=g8XJmgjU7AtLh2IDtrTowvIGt1KTG9KvGoDJK3ioNDA=;
 b=WF3BRcggi/hkqAwj8I3MaiXhDK7eXY4QbWCuHzRsRVBpiz9M+BMaMZSB62eSvarvEP
 ya9uNSi0bwklyW8oD9eaRiuY/u7kVMqSVbyl5EVF/8a1qB+tlaqMB2tZ+q1U07uhi/SA
 wiAJgOt4M+f76vWFJuDus5dRk1J04ymK7CAuQ+QNCE+KRIxXj15E8VK1IqCIzMqdtzN5
 LPCmgbNeP3i4psQMr/VXBThZ4O8PD7ET0tKBXCI+ewB5GkrsPqunjujyzU7rGvEImqqU
 zutnHtJC3bHDRofKNu1nZXVgFxTebRDcYHxw7ki4+kIkP8AkKZMkB8KndaUqyRYfrxWg
 9c+g==
X-Gm-Message-State: APjAAAXBmhkjC9NixtFdKrBQw3552Y3QAnuaOiejzMFcmANprB45qILk
 6fiet8miWd5acW0Yusuw46gGTCIdHb6+EwRXvFk=
X-Google-Smtp-Source: APXvYqyO2kKEfunx40i5cCq9xUFb+xZFJ4Xyy+0L+aaCxbPpD7omab29byQPsV1scaM/q9KKKi3KxSxJ7k7Q92t8Mg8=
X-Received: by 2002:ac2:4214:: with SMTP id y20mr1932032lfh.212.1579701874216; 
 Wed, 22 Jan 2020 06:04:34 -0800 (PST)
MIME-Version: 1.0
References: <cover.f819645cd9f5cf7a6f692f9661cfb4e670a2cd08.1579055705.git-series.marmarek@invisiblethingslab.com>
 <5f675457fe322c265b3337607bc78f07ffdb43bb.1579055705.git-series.marmarek@invisiblethingslab.com>
 <CAKf6xpt5Pjs_XWoEHaJkfgo-FnMigfgKKZ0weZ6egokcpiwwwA@mail.gmail.com>
 <20200121210840.GO1314@mail-itl>
In-Reply-To: <20200121210840.GO1314@mail-itl>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Wed, 22 Jan 2020 09:04:22 -0500
Message-ID: <CAKf6xptU7swA2dKadq_Aa7656khr1pSkcE5y3bLpfpgZK8dKeA@mail.gmail.com>
To: =?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: Re: [Xen-devel] [PATCH v4 02/16] Document ioemu Linux stubdomain
 protocol
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
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBKYW4gMjEsIDIwMjAgYXQgNDowOCBQTSBNYXJlayBNYXJjenlrb3dza2ktR8OzcmVj
a2kKPG1hcm1hcmVrQGludmlzaWJsZXRoaW5nc2xhYi5jb20+IHdyb3RlOgo+Cj4gT24gTW9uLCBK
YW4gMjAsIDIwMjAgYXQgMDE6NTQ6MDRQTSAtMDUwMCwgSmFzb24gQW5kcnl1ayB3cm90ZToKPiA+
IE9uIFR1ZSwgSmFuIDE0LCAyMDIwIGF0IDk6NDEgUE0gTWFyZWsgTWFyY3p5a293c2tpLUfDs3Jl
Y2tpCj4gPiA8bWFybWFyZWtAaW52aXNpYmxldGhpbmdzbGFiLmNvbT4gd3JvdGU6Cj4gPgo+ID4g
PHNuaXA+Cj4gPgo+ID4gPiArCj4gPiA+ICtMaW1pdGF0aW9uczoKPiA+ID4gKyAtIFBDSSBwYXNz
dGhyb3VnaCByZXF1aXJlIHBlcm1pc3NpdmUgbW9kZQo+ID4gPiArIC0gb25seSBvbmUgbmljIGlz
IHN1cHBvcnRlZAo+ID4KPiA+IFdoeSBpcyBvbmx5IDEgbmljIHN1cHBvcnRlZD8gIE11bHRpcGxl
IHdlcmUgc3VwcG9ydGVkIHByZXZpb3VzbHksIGJ1dAo+ID4gcGVla2luZyBhaGVhZCBpbiB0aGUg
c2VyaWVzLAo+Cj4gVGhpcyBpcyBtb3N0bHkgbGltaXRhdGlvbiBvZiBzdHViZG9tYWluIHNpZGUs
IG5vdCB0b29sc3RhY2sgc2lkZS4KPiBTdGFydHVwIHNjcmlwdCBzZXR1cCBldGgwIG9ubHkuCgpJ
IHBlZWtlZCB0aGUgc2NyaXB0LCBhbmQgaXQgbG9va3MgbGlrZSB0aGUgbmljIGlmbmFtZT0gc2Vk
IGV4cHJlc3Npb24Kb25seSBoYW5kbGVzIG9uZSBuaWMuICBTaW5jZSBkbWFyZ3MgaXMgbm93IGFu
IGFycmF5LCBpdCBzaG91bGQgdG8KaGFuZGxlIG11bHRpcGxlLgoKQW55d2F5LCB0aGVyZSBkb2Vz
bid0IHNlZW0gdG8gYmUgYW4gaGFyZCBsaW1pdGF0aW9uLgoKPiA+IHNjcmlwdD0vZXRjL3FlbXUt
aWZ1cCBpcyBubyBsb25nZXIKPiA+IHNwZWNpZmllZC4KPgo+IFllcywgdGhhdCdzIHRvIGFsbG93
IC1zYW5kYm94IC4uLixzcGF3bj1kZW55IGluc2lkZSBzdHViZG9tYWluLgo+IFRoZSBlcXVpdmFs
ZW50IGFjdGlvbnMgYXJlIGhhbmRsZWQgYnkgbGlzdGVuaW5nIGZvciBxbXAgZXZlbnRzLgoKQWgs
IG9rYXkuICBZZWFoLCB0aGF0J3MgYSBnb29kIGlkZWEuCgpUaGFua3MsCkphc29uCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
