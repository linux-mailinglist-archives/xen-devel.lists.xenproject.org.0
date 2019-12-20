Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA8F8128307
	for <lists+xen-devel@lfdr.de>; Fri, 20 Dec 2019 21:06:02 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iiOUS-0006du-7F; Fri, 20 Dec 2019 20:03:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=YXk5=2K=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iiOUR-0006dp-Gs
 for xen-devel@lists.xenproject.org; Fri, 20 Dec 2019 20:03:11 +0000
X-Inumbo-ID: be5a6263-2363-11ea-93f8-12813bfff9fa
Received: from mail-lj1-f193.google.com (unknown [209.85.208.193])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id be5a6263-2363-11ea-93f8-12813bfff9fa;
 Fri, 20 Dec 2019 20:03:10 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id r19so11198928ljg.3
 for <xen-devel@lists.xenproject.org>; Fri, 20 Dec 2019 12:03:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=c1tOLQ5nhlc2MEneTIpPlg0kw3XKvvjnbYe7Zy9O3Mg=;
 b=DiihxQbmV9Tq+Gkde8PSnj0ouvtFAMPz4kTdvl40MIsg9DBv6sSXWS7mLl2RdAjA7a
 xufAEdSc0X0ctCg5vumCm/lJuA12/IRUvIoFvW1O0iiD0Zfuw87Tp6R+fzyVc4EzoQd1
 pdRn9tc6exkDTPusmGBLBBkLvzQccgpYJz1cXMZ8UbDg6vwRZcmlTWo96CNPKj14i5xp
 sN9SnoRbyNypeNAsCIsWp53QIrVOfaFf4GFmCWaBD27+jrRTiG04wJuTkq+hvjHmB6bv
 ZG75v3b002QeY0nBKcnwg/pD5oqfSp8FOXvOlra+hpYkSNlHF1oTo2LEARv9MLXSll7W
 Ov7Q==
X-Gm-Message-State: APjAAAUSQ1ENinwjktY/UKdAmeHXRPD4uw5QM/PQpdoYA0x8RmfiNlfY
 EqWTyRalFJ2iayH1/+s0xF4Uf4U8wxw=
X-Google-Smtp-Source: APXvYqzMi+CBglg7K/TwN0SkYgo5c/JHEgE0tn0SNzuTjy+YYR4HnRPYpx5uvtPqXQ7HK9YzBGcCEw==
X-Received: by 2002:a2e:87ca:: with SMTP id v10mr10936189ljj.253.1576872189664; 
 Fri, 20 Dec 2019 12:03:09 -0800 (PST)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com.
 [209.85.208.181])
 by smtp.gmail.com with ESMTPSA id u24sm4652432ljo.77.2019.12.20.12.03.09
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Dec 2019 12:03:09 -0800 (PST)
Received: by mail-lj1-f181.google.com with SMTP id e28so11190988ljo.9
 for <xen-devel@lists.xenproject.org>; Fri, 20 Dec 2019 12:03:09 -0800 (PST)
X-Received: by 2002:a2e:9510:: with SMTP id f16mr92452ljh.249.1576872189210;
 Fri, 20 Dec 2019 12:03:09 -0800 (PST)
MIME-Version: 1.0
References: <20191220194749.19692-1-liuwe@microsoft.com>
 <0b3f3a90-a8ae-caed-9ed9-33a0dc5cfe97@citrix.com>
In-Reply-To: <0b3f3a90-a8ae-caed-9ed9-33a0dc5cfe97@citrix.com>
From: Wei Liu <wl@xen.org>
Date: Fri, 20 Dec 2019 20:02:52 +0000
X-Gmail-Original-Message-ID: <CAK9nU=oeK0X8QAGw2Wwu+E01kymXKWDiu39KfZqrKqR+5J6ABw@mail.gmail.com>
Message-ID: <CAK9nU=oeK0X8QAGw2Wwu+E01kymXKWDiu39KfZqrKqR+5J6ABw@mail.gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [Xen-devel] [PATCH] x86: Hyper-V clock source's offset should
 be signed
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
Cc: Wei Liu <liuwe@microsoft.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <pdurrant@amazon.com>, Michael Kelley <mikelley@microsoft.com>,
 Jan Beulich <JBeulich@suse.com>,
 Xen Development List <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCAyMCBEZWMgMjAxOSBhdCAxOTo1NywgQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3Bl
cjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4KPiBPbiAyMC8xMi8yMDE5IDE5OjQ3LCBXZWkgTGl1IHdy
b3RlOgo+ID4gRml4ZXM6IDY4NWQxNmJkNSAoeDg2OiBpbXBsZW1lbnQgSHlwZXItViBjbG9jayBz
b3VyY2UpCj4gPiBTaWduZWQtb2ZmLWJ5OiBXZWkgTGl1IDxsaXV3ZUBtaWNyb3NvZnQuY29tPgo+
ID4gLS0tCj4gPiBJIGRpc2NvdmVyIHRoaXMgc3R1cGlkIG1pc3Rha2Ugd2hlbiBJIHdvcmsgb24g
ZXh0cmFjdGluZyBjb21tb24gY29kZQo+ID4gZnJvbSB2aXJpZGlhbiBhbmQgdGhlIGNsb2NrIHNv
dXJjZSBpbXBsZW1lbnRhdGlvbi4KPgo+IERvZXMgaXQgbWFrZSBhIHByYWN0aWNhbCBkaWZmZXJl
bmNlPwo+CgpQcm9iYWJseSBub3QuIFRoZSBzcGVjcyBzYXlzIHRoYXQgZmllbGQgaXMgc2lnbmVk
LCBzbyBvdXIgY29kZSBzaG91bGQKcmVmbGVjdCB0aGF0LgoKPiA+IC0tLQo+ID4gIHhlbi9hcmNo
L3g4Ni90aW1lLmMgfCAzICsrLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyks
IDEgZGVsZXRpb24oLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L3RpbWUuYyBi
L3hlbi9hcmNoL3g4Ni90aW1lLmMKPiA+IGluZGV4IGEzYzliOTI3ZTguLmJiY2M5YjEwYjggMTAw
NjQ0Cj4gPiAtLS0gYS94ZW4vYXJjaC94ODYvdGltZS5jCj4gPiArKysgYi94ZW4vYXJjaC94ODYv
dGltZS5jCj4gPiBAQCAtNjk4LDcgKzY5OCw4IEBAIHN0YXRpYyBpbnQ2NF90IF9faW5pdCBpbml0
X2h5cGVydl90aW1lcihzdHJ1Y3QgcGxhdGZvcm1fdGltZXNvdXJjZSAqcHRzKQo+ID4KPiA+ICBz
dGF0aWMgaW5saW5lIHVpbnQ2NF90IHJlYWRfaHlwZXJ2X3RpbWVyKHZvaWQpCj4KPiBBbHNvLCB0
aGlzIGZ1bmN0aW9uIGlzIG9ubHkgZXZlciBhY2Nlc3NlZCB2aWEgcG9pbnRlci4gIFRoZSBpbmxp
bmUgY2FuJ3QKPiBiZSBzYXRpc2ZpZWQgYXQgYWxsLgo+CgpJIGNhbiBkcm9wIHRoZSBpbmxpbmUg
aGVyZS4KCldlaS4KCj4gfkFuZHJldwo+Cj4gPiAgewo+ID4gLSAgICB1aW50NjRfdCBzY2FsZSwg
b2Zmc2V0LCByZXQsIHRzYzsKPiA+ICsgICAgdWludDY0X3Qgc2NhbGUsIHJldCwgdHNjOwo+ID4g
KyAgICBpbnQ2NF90IG9mZnNldDsKPiA+ICAgICAgdWludDMyX3Qgc2VxOwo+ID4gICAgICBjb25z
dCBzdHJ1Y3QgbXNfaHlwZXJ2X3RzY19wYWdlICp0c2NfcGFnZSA9IGh5cGVydl90c2M7Cj4gPgo+
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
