Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 371FE22013
	for <lists+xen-devel@lfdr.de>; Sat, 18 May 2019 00:07:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hRkyO-0006YE-TF; Fri, 17 May 2019 22:05:04 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+Ke0=TR=gmail.com=alistair23@srs-us1.protection.inumbo.net>)
 id 1hRkyN-0006Y7-7P
 for xen-devel@lists.xenproject.org; Fri, 17 May 2019 22:05:03 +0000
X-Inumbo-ID: d0caa49d-78ef-11e9-8980-bc764e045a96
Received: from mail-lj1-x242.google.com (unknown [2a00:1450:4864:20::242])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id d0caa49d-78ef-11e9-8980-bc764e045a96;
 Fri, 17 May 2019 22:05:01 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id w1so7621289ljw.0
 for <xen-devel@lists.xenproject.org>; Fri, 17 May 2019 15:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SGcQpgL93rAKxmj6EmLPS2dflDowXVj+LfnmrTNAfyw=;
 b=mB97t0yTiU9YX/P0EyEiURxWwqd3iR32aNdNds92M5CIUBfsYfZwUyDP4SwgzMTn+K
 HFEX2w1r1GGvKjWSlk62ZNkuByws+zd/0wBaNKLsmXudrH6g5Dc3YsW4FwOTqfy/g9W1
 Ry+ESDHPuofujmzTcSyhlzAqA3Xc6yGV4jLpxK9r1wjWhjvXCmFRs2Zs3zhSkuP3M7M9
 RlYSmzRdBgS05iIElqhvVz9OC1fFiH2P5Qo42k0kWrvLXY+vDKIqbLoRk5SNMS4ZB1ta
 86c/OhWtRyDZmYmffXQ6idfzXYA5R3Yq09Vd6enpZGJgkocV0UUqZfSCfjpTBGldXF1N
 wSQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SGcQpgL93rAKxmj6EmLPS2dflDowXVj+LfnmrTNAfyw=;
 b=iVkb1Qu/f600ahTKO+nSY5IH/EJ+3VUghTOsN/s0v1vlG7puwLmoHGNbzgZfobIcAC
 Cqly0Q812Zd2ep5hFkLfckyFwdxmU4XnMZat+0e8VaSxFeosn1ZTtwnY3W0t95uVBEcV
 0cXgKSxn7BgGtiSiI7WDTsIbx9qH6RT42WJ4ioNATjbSGV7fKQnY0EJeBiDqv50gyrgo
 9xsCV4vSKTNkA9MOMh7iwFdJtFdIaScKZc7jtwlhHF2zl+78EhqO63CThkAouKDxbc8f
 pTnigkYVjWHabSb9LaoE8FKvdjszB7Q+VcJYFDIvKNh8wPubUHo9JwMEJJjToyo2yCdx
 T2dg==
X-Gm-Message-State: APjAAAVLTLb4qBc6sTk/PUr8zhbygTNa2p4ujTB15scoWSUhdgt1U2v/
 qrkFVo0IMXQypSX5o5jvG7oDcsgWyEog0voVMsE=
X-Google-Smtp-Source: APXvYqxbvKXNOMxpATU5ZKhbI5x0bcWa7l/C0PNDdNOaSYL4autgzbw7/aIBRA0X58NqnP5UXWMUd6ENQQbZnogasvg=
X-Received: by 2002:a2e:8583:: with SMTP id b3mr4002234lji.136.1558130700307; 
 Fri, 17 May 2019 15:05:00 -0700 (PDT)
MIME-Version: 1.0
References: <20190516000212.13468-1-alistair.francis@wdc.com>
 <20190516000212.13468-2-alistair.francis@wdc.com>
 <5CDD3C4B020000780022F8BE@prv1-mh.provo.novell.com>
 <CAKmqyKPhUK9LDpJA8+H16uO4augfEHW+WdnBMjZzdwHa3dM8YA@mail.gmail.com>
 <5CDE5414020000780022FED3@prv1-mh.provo.novell.com>
In-Reply-To: <5CDE5414020000780022FED3@prv1-mh.provo.novell.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 17 May 2019 15:02:47 -0700
Message-ID: <CAKmqyKN5N6sQ4rpzGpSgCHRPU7Y490YT=3FhNXKWo3EA8zsXjg@mail.gmail.com>
To: Jan Beulich <JBeulich@suse.com>
Subject: Re: [Xen-devel] [PATCH 2/3] xen/drivers/char: Don't require vpl011
 for all non-x86 archs
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
Cc: Ian Jackson <Ian.Jackson@eu.citrix.com>,
 Alistair Francis <alistair.francis@wdc.com>, Wei Liu <wei.liu2@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBNYXkgMTYsIDIwMTkgYXQgMTE6MjYgUE0gSmFuIEJldWxpY2ggPEpCZXVsaWNoQHN1
c2UuY29tPiB3cm90ZToKPgo+ID4+PiBPbiAxNi4wNS4xOSBhdCAyMTozMCwgPGFsaXN0YWlyMjNA
Z21haWwuY29tPiB3cm90ZToKPiA+IE9uIFRodSwgTWF5IDE2LCAyMDE5IGF0IDM6MzIgQU0gSmFu
IEJldWxpY2ggPEpCZXVsaWNoQHN1c2UuY29tPiB3cm90ZToKPiA+Pgo+ID4+ID4+PiBPbiAxNi4w
NS4xOSBhdCAwMjowMiwgPGFsaXN0YWlyLmZyYW5jaXNAd2RjLmNvbT4gd3JvdGU6Cj4gPj4gPiBN
YWtlIHRoZSBhc20vdnBsMDExLmggZGVwZW5kZW50IG9uIHRoZSBBUk0gYXJjaGl0ZWN0dXJlLgo+
ID4+Cj4gPj4gQnV0IHdlIG9ubHkgaGF2ZSB4ODYgYW5kIEFybSByaWdodCBub3cuIEEgd29yZCBt
b3JlIGFib3V0Cj4gPj4geW91ciBtb3RpdmF0aW9uIHdvdWxkIGhlbHAuCj4gPgo+ID4gQXMgdGhl
IGNvZGUgY3VycmVudGx5IGlzIG5vIG9uZSBjYW4gYWRkIGFub3RoZXIgYXJjaGl0ZWN0dXJlLiBU
aGlzIGlzCj4gPiBqdXN0IGEgZ2VuZXJhbCBmaXh1cCBhcyBhc3N1bWluZyBYZW4gd2lsbCBvbmx5
IGV2ZXIgc3VwcG9ydCB0d28gYXJjaHMKPiA+IHNlZW1zIHN0cmFuZ2UuCj4KPiBCdXQgdGhhdCdz
IHRoZW4gbm90IHRoZSBvbmx5IHBsYWNlLCBpcyBpdD8gSSdkIG5vdCBleHBlY3QgYSBzaW5nbGUs
Cj4gcmFuZG9tIGNoYW5nZSBvZiB0aGlzIGtpbmQgdG8gYmUgc2VudCBhbGwgb24gaXRzIG93biBp
biBzdWNoIGEKPiBjYXNlLgoKVGhpcyBpcyB0aGUgb25seSBjYXNlIHRoYXQgSSBoYXZlIHJ1biBp
bnRvIHdoZXJlIHRoZXJlIGlzbid0IGEgc2FuZQojZWxzZSBjb25kaXRpb24uIE1vc3Qgb3RoZXIg
I2lmZGVmcyBmYWxsIHRocm91Z2ggdG8gYW4gIlVuc3VwcG9ydGVkLi4iCm1lc3NhZ2UgaW4gdGhl
ICNlbHNlLgoKPgo+ID4+IEFsc28gSSBkb24ndCB0aGluayB5b3VyIENjIGxpc3QgaXMgd2lkZSBl
bm91Z2ggZm9yIHRoaXMgY2hhbmdlLgo+ID4KPiA+IEkgY291bGRuJ3QgZmluZCBhbnlvdGhlciBw
ZW9wbGUgaW4gdGhlIE1BSU5UQUlORVJTIGZpbGUsIHdobyBlbHNlIHNob3VsZCBJCj4gPiBDQz8K
Pgo+IFdlbGwsIGhvdyBkaWQgeW91IGxhbmQgYXQgQ2MtaW5nIHRoZSB0b29sIHN0YWNrIG1haW50
YWluZXJzIG9uCj4gdGhpcyBoeXBlcnZpc29yIGNoYW5nZT8gQW55d2F5IC0gdGhlcmUncyBhIHNl
Y3Rpb24gVEhFIFJFU1QKPiBhdCB0aGUgYm90dG9tIG9mIC4vTUFJTlRBSU5FUlMsIGFuZCB3ZSBh
bHNvIGhhdmUgdGhlIHR3bwo+IHNjcmlwdHMvKl9tYWludGFpbmVycy5wbCBzY3JpcHRzIHRvIGFp
ZCB5b3Ugd2l0aCBkZXRlcm1pbmluZwo+IHdobyB0byBDYy4KCkFoLCBzb3JyeS4gSSBqdXN0IGdy
ZXBwZWQgdGhlIGZpbGUgbmV4dCB0aW1lIEknbGwgbWFrZSBzdXJlIHRvIHR1cm4gdGhlIHNjcmlw
dC4KCkFsaXN0YWlyCgo+Cj4gSmFuCj4KPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
