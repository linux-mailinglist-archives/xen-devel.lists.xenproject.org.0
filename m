Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 538AA12F704
	for <lists+xen-devel@lfdr.de>; Fri,  3 Jan 2020 12:14:34 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1inKrx-0002JY-J9; Fri, 03 Jan 2020 11:11:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=swuY=2Y=gmail.com=pdurrant@srs-us1.protection.inumbo.net>)
 id 1inKrw-0002JO-Fm
 for xen-devel@lists.xenproject.org; Fri, 03 Jan 2020 11:11:52 +0000
X-Inumbo-ID: d750f2fc-2e19-11ea-a914-bc764e2007e4
Received: from mail-pj1-x1042.google.com (unknown [2607:f8b0:4864:20::1042])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d750f2fc-2e19-11ea-a914-bc764e2007e4;
 Fri, 03 Jan 2020 11:11:51 +0000 (UTC)
Received: by mail-pj1-x1042.google.com with SMTP id s7so4617561pjc.0
 for <xen-devel@lists.xenproject.org>; Fri, 03 Jan 2020 03:11:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZOrorGY3Mf15fMS3nc4Tef1IOAUDCdZErXlTGdk+YY8=;
 b=pERwaZ/hG5JPiB9uZn9CIvialqocaFyqtSU+KjK9agjErgPyr+KeV05iLRH4zeZNrD
 LK70MT/tC6bHoIq4fI3JTOLuW6wgFIT0x/RsNwdh9MHqhK4qdamZctPXLnhIT2/c+TRn
 qnMwxlT4YJjZTCoiWRk25FJ3HmSW9jSkqxnwDckLW6OZTFpH7OI1hhOETB9JLdwezon3
 mmro4TQ467qXtWelcqdTC2LeGTKnTpli8ShyyPQcFWY1el1FqOj4pIui6DTY1gxhneV5
 iusjCJ+maHWYtrvJ08ZaX9Lo4ktjhdu02JqEVZ7HuTaXCEv/CvIgFpNW1PBNfIfua4j2
 GJ1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZOrorGY3Mf15fMS3nc4Tef1IOAUDCdZErXlTGdk+YY8=;
 b=rITgy96MqaOPPKlZBo+CPD3mPVW3pNPyCdiru0levgmKhJbpLk8fEw8Vi6rflzFI9Q
 fNyJdV7DLeedFMeuRqfDkaVl7x8q8DDPtk7qX3w46GezjbKYBqttHfmFzZOEgTz0CniL
 PlRP8rOClXZkCAeS8XD7y3cZYcYu5SkP4D14FadpaYj1Uuv30RPPLdvPjXdJI+K4sqp6
 ivNEyo+IRD7xh+p8lyv7nEqtENiw3LL+nkfB5UZW6Qc6DSr1QyCfwr85al5BBc0VA9rd
 02OXfqFQ+RXL1+Ls0/ILjpaetwNxutjMPozKbf7u2jww5G3PIYILYpMU+6K42Yf1V7tb
 HKVw==
X-Gm-Message-State: APjAAAXRYOecQlxbctW+YDgtMMiRPHaV3gI4FKqWND3W1M2XL0/fGBBS
 JnoIkZRBf/hNXAhSb3S54yvu8iwdvwYxdNOEQVk=
X-Google-Smtp-Source: APXvYqxT4dY/NZeya+QUuuZ0D+R1VrB5yuctDHZLGciy2FrUgu8jz1O/Fb3Tm59uxnjdpc2eGWzKL9OEmz1xnQ41pSg=
X-Received: by 2002:a17:902:7c85:: with SMTP id
 y5mr26120557pll.227.1578049910608; 
 Fri, 03 Jan 2020 03:11:50 -0800 (PST)
MIME-Version: 1.0
References: <20191229183341.14877-1-liuwe@microsoft.com>
 <20191229183341.14877-8-liuwe@microsoft.com>
In-Reply-To: <20191229183341.14877-8-liuwe@microsoft.com>
From: Paul Durrant <pdurrant@gmail.com>
Date: Fri, 3 Jan 2020 11:11:39 +0000
Message-ID: <CACCGGhD3qSsyGUikfY_urtk7=MrN_k0ZYO_8NiiFf72uWvtJyA@mail.gmail.com>
To: Wei Liu <wl@xen.org>
Subject: Re: [Xen-devel] [PATCH 7/8] x86/hyperv: retrieve vp_index from
 Hyper-V
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
Cc: Wei Liu <liuwe@microsoft.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Michael Kelley <mikelley@microsoft.com>, Jan Beulich <jbeulich@suse.com>,
 Xen Development List <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gU3VuLCAyOSBEZWMgMjAxOSBhdCAxODozNSwgV2VpIExpdSA8d2xAeGVuLm9yZz4gd3JvdGU6
Cj4KPiBUaGlzIHdpbGwgYmUgdXNlZnVsIHdoZW4gaW52b2tpbmcgaHlwZXJjYWxsIHRoYXQgdGFy
Z2V0cyBzcGVjaWZpYwo+IHZjcHUocykuCj4KPiBTaWduZWQtb2ZmLWJ5OiBXZWkgTGl1IDxsaXV3
ZUBtaWNyb3NvZnQuY29tPgo+IC0tLQo+ICB4ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L2h5cGVy
di5jIHwgMTIgKysrKysrKysrKysrCj4gIHhlbi9pbmNsdWRlL2FzbS14ODYvZ3Vlc3QvaHlwZXJ2
LmggfCAgMSArCj4gIDIgZmlsZXMgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAt
LWdpdCBhL3hlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvaHlwZXJ2LmMgYi94ZW4vYXJjaC94ODYv
Z3Vlc3QvaHlwZXJ2L2h5cGVydi5jCj4gaW5kZXggNjc2Njc5MzZlOS4uZGEzYThjZDg1ZCAxMDA2
NDQKPiAtLS0gYS94ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L2h5cGVydi5jCj4gKysrIGIveGVu
L2FyY2gveDg2L2d1ZXN0L2h5cGVydi9oeXBlcnYuYwo+IEBAIC0yOSw2ICsyOSw3IEBAIHN0cnVj
dCBtc19oeXBlcnZfaW5mbyBfX3JlYWRfbW9zdGx5IG1zX2h5cGVydjsKPiAgdm9pZCAqaHZfaHlw
ZXJjYWxsOwo+ICBzdGF0aWMgc3RydWN0IHBhZ2VfaW5mbyAqaHZfaHlwZXJjYWxsX3BhZ2U7Cj4g
IERFRklORV9QRVJfQ1BVX1JFQURfTU9TVExZKHN0cnVjdCBoeXBlcnZfcGNwdV9wYWdlLCBodl9w
Y3B1X2lucHV0X2FyZyk7Cj4gK0RFRklORV9QRVJfQ1BVX1JFQURfTU9TVExZKHVuc2lnbmVkIGlu
dCwgaHZfdnBfaW5kZXgpOwo+Cj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3QgaHlwZXJ2aXNvcl9vcHMg
b3BzOwo+ICBjb25zdCBzdHJ1Y3QgaHlwZXJ2aXNvcl9vcHMgKl9faW5pdCBoeXBlcnZfcHJvYmUo
dm9pZCkKPiBAQCAtMTE1LDE1ICsxMTYsMjYgQEAgc3RhdGljIHZvaWQgc2V0dXBfaHlwZXJjYWxs
X3BjcHVfYXJnKHZvaWQpCj4gICAgICB0aGlzX2NwdShodl9wY3B1X2lucHV0X2FyZykubWFwcGlu
ZyA9IG1hcHBpbmc7Cj4gIH0KPgo+ICtzdGF0aWMgdm9pZCBzZXR1cF92cF9pbmRleCh2b2lkKQo+
ICt7Cj4gKyAgICB1aW50NjRfdCB2cF9pbmRleF9tc3I7Cj4gKwo+ICsgICAgcmRtc3JsKEhWX1g2
NF9NU1JfVlBfSU5ERVgsIHZwX2luZGV4X21zcik7Cj4gKwo+ICsgICAgdGhpc19jcHUoaHZfdnBf
aW5kZXgpID0gdnBfaW5kZXhfbXNyOwo+ICt9CgpJcyBpdCB3b3J0aCBhIHNlcGFyYXRlIGZ1bmN0
aW9uIHZzLiBidW5kbGluZyB0aGlzIGludG8Kc2V0dXBfaHlwZXJjYWxsX3BjcHVfYXJnKCk/Cgog
IFBhdWwKCj4gKwo+ICBzdGF0aWMgdm9pZCBfX2luaXQgc2V0dXAodm9pZCkKPiAgewo+ICAgICAg
c2V0dXBfaHlwZXJjYWxsX3BhZ2UoKTsKPiAgICAgIHNldHVwX2h5cGVyY2FsbF9wY3B1X2FyZygp
Owo+ICsgICAgc2V0dXBfdnBfaW5kZXgoKTsKPiAgfQo+Cj4gIHN0YXRpYyB2b2lkIGFwX3NldHVw
KHZvaWQpCj4gIHsKPiAgICAgIHNldHVwX2h5cGVyY2FsbF9wY3B1X2FyZygpOwo+ICsgICAgc2V0
dXBfdnBfaW5kZXgoKTsKPiAgfQo+Cj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3QgaHlwZXJ2aXNvcl9v
cHMgb3BzID0gewo+IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9hc20teDg2L2d1ZXN0L2h5cGVy
di5oIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9ndWVzdC9oeXBlcnYuaAo+IGluZGV4IDgzZjI5NzQ2
OGYuLjRiNjM1ODI5ZjMgMTAwNjQ0Cj4gLS0tIGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9ndWVzdC9o
eXBlcnYuaAo+ICsrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYvZ3Vlc3QvaHlwZXJ2LmgKPiBAQCAt
NzAsNiArNzAsNyBAQCBzdHJ1Y3QgaHlwZXJ2X3BjcHVfcGFnZSB7Cj4gICAgICB2b2lkICptYXBw
aW5nOwo+ICB9Owo+ICBERUNMQVJFX1BFUl9DUFUoc3RydWN0IGh5cGVydl9wY3B1X3BhZ2UsIGh2
X3BjcHVfaW5wdXRfYXJnKTsKPiArREVDTEFSRV9QRVJfQ1BVKHVuc2lnbmVkIGludCwgaHZfdnBf
aW5kZXgpOwo+Cj4gIGNvbnN0IHN0cnVjdCBoeXBlcnZpc29yX29wcyAqaHlwZXJ2X3Byb2JlKHZv
aWQpOwo+Cj4gLS0KPiAyLjIwLjEKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
