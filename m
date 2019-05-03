Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6CDF131A1
	for <lists+xen-devel@lfdr.de>; Fri,  3 May 2019 17:59:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hMaYa-0006pz-9C; Fri, 03 May 2019 15:57:04 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=COEE=TD=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hMaYY-0006nj-7E
 for xen-devel@lists.xenproject.org; Fri, 03 May 2019 15:57:02 +0000
X-Inumbo-ID: 15b857b8-6dbc-11e9-843c-bc764e045a96
Received: from mail-lf1-x142.google.com (unknown [2a00:1450:4864:20::142])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 15b857b8-6dbc-11e9-843c-bc764e045a96;
 Fri, 03 May 2019 15:57:00 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id v1so4768962lfg.5
 for <xen-devel@lists.xenproject.org>; Fri, 03 May 2019 08:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=T1BC+rFSYabBI974W1PQmdWSyybtHl+XusGbOfkfKoY=;
 b=ue38yoZSkWGofBGpc6KXt5pHe/EwPM6c7RO3JZsB2fxZNv3UZFla2Y8BrFVhHqkrWx
 AFf7MWv6oI33QFBxfa8g310ViVe4ImN7vuFp5e414CdE8icynCV1Dv1AA2R65/72+FP7
 4B2Wlh+0x9l3pptLcScP8N7IhMbyQpNjwy3Yr/YiYi4OdI17Z74UxhH6QjyKH5rRlKUH
 9fPRBnQTjq9Y3ecbty8Moc/MTHLcP3ktuWkJMOoOvil6s/K+s9kJ3PhnGzKL49IVIy/K
 +8Hc0nfsjakKc0wHReJyE6dI/6tprblZxVdjDUJk5tnhiuQo0IXvI23ZQq+rmzKU9d86
 +f8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=T1BC+rFSYabBI974W1PQmdWSyybtHl+XusGbOfkfKoY=;
 b=rgqh/7Qoo5dggQD6vpquq+vizG6Jn1u/I/yEinRBhemMEQcu4Xeu+rVJZd7W1raQA8
 rEP+P+jZnvXVecHRoCL9uJeGOq24YEeua5c7zT3Y3FO7jgR5P9j0FWqcd5tf66PmsuFI
 i7fDoJpCxUPhtIHOPOE1SwBWCMQ47cABglFgZYIUf9KCdZx00ymU1c3zT1o/ZEr2w18Q
 ndxIYymS2mk9P7q6AjWAy91YpEgkaZhD4qarRwlKxGaSiK3lLMbmge7dWhxjQhyp3t9D
 Y1pA8/jeBQ8RIwOpx30LJ2StUWId77JwsqazmGXM+bJ1H+rcr/Ht5OIhPPRvFe/FHa7F
 d/rQ==
X-Gm-Message-State: APjAAAUat8IG1EGaoN7u8siC4nOfZorhpKf4D5d+EihQmOCq9THFmLcE
 1svGHTihOdk/TBmJZpmJJKU=
X-Google-Smtp-Source: APXvYqybXDiHUD08kd2g6h1aomSp8XhPdOzKJjQtNrIc+8wbHC7Jvlizbr+EVlWqdvQ6I3dICJ0b3g==
X-Received: by 2002:ac2:52b1:: with SMTP id r17mr5370137lfm.39.1556899019224; 
 Fri, 03 May 2019 08:56:59 -0700 (PDT)
Received: from [10.17.180.71] (ll-74.141.223.85.sovam.net.ua. [85.223.141.74])
 by smtp.gmail.com with ESMTPSA id 63sm492616lfz.2.2019.05.03.08.56.57
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 03 May 2019 08:56:58 -0700 (PDT)
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
References: <20190422164937.21350-1-julien.grall@arm.com>
 <20190422164937.21350-7-julien.grall@arm.com>
From: Andrii Anisov <andrii.anisov@gmail.com>
Message-ID: <da08e713-f660-3207-ec2b-381dfec5631a@gmail.com>
Date: Fri, 3 May 2019 18:56:57 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190422164937.21350-7-julien.grall@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 06/20] xen/arm: Remove parameter cpuid from
 start_xen
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
Cc: Oleksandr_Tyshchenko@epam.com, sstabellini@kernel.org,
 Andrii_Anisov@epam.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGVsbG8gSnVsaWVuLAoKT24gMjIuMDQuMTkgMTk6NDksIEp1bGllbiBHcmFsbCB3cm90ZToKPiBU
aGUgcGFyYW1ldGVyIGNwdWlkIGlzIG5vdCB1c2VkIGJ5IHN0YXJ0X3hlbi4gU28gcmVtb3ZlIGl0
Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+
Cj4gLS0tCj4gICB4ZW4vYXJjaC9hcm0vYXJtMzIvaGVhZC5TIHwgMSAtCj4gICB4ZW4vYXJjaC9h
cm0vYXJtNjQvaGVhZC5TIHwgMSAtCj4gICB4ZW4vYXJjaC9hcm0vc2V0dXAuYyAgICAgIHwgMyAr
LS0KPiAgIDMgZmlsZXMgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDQgZGVsZXRpb25zKC0pCj4g
Cj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9hcm0zMi9oZWFkLlMgYi94ZW4vYXJjaC9hcm0v
YXJtMzIvaGVhZC5TCj4gaW5kZXggYjcxZDdmYjExZC4uOWY0MGZhY2U5OCAxMDA2NDQKPiAtLS0g
YS94ZW4vYXJjaC9hcm0vYXJtMzIvaGVhZC5TCj4gKysrIGIveGVuL2FyY2gvYXJtL2FybTMyL2hl
YWQuUwo+IEBAIC00NDgsNyArNDQ4LDYgQEAgbGF1bmNoOgo+ICAgICAgICAgICB0ZXEgICByMTIs
ICMwCj4gICAgICAgICAgIG1vdmVxIHIwLCByMTAgICAgICAgICAgICAgICAgLyogTWFyc2hhbCBh
cmdzOiAtIHBoeXNfb2Zmc2V0ICovCj4gICAgICAgICAgIG1vdmVxIHIxLCByOCAgICAgICAgICAg
ICAgICAgLyogICAgICAgICAgICAgICAtIERUQiBhZGRyZXNzICovCj4gLSAgICAgICAgbW92ZXEg
cjIsIHI3ICAgICAgICAgICAgICAgICAvKiAgICAgICAgICAgICAgIC0gQ1BVIElEICovCgpJIGRv
bid0IHJlYWxseSBsaWtlIG1ha2luZyBjaGFuZ2VzIHdoaWNoIGFyZSB0aGVuIGZpeGVkIGluIG5l
eHQgcGF0Y2hlcy4KSSdkIGxpa2UgdG8gc2VlIGl0IGNvdXBsZWQgdGhpcyB3aXRoIHRoZSBwcmV2
aW91cyBwYXRjaC4KCj4gICAgICAgICAgIGJlcSAgIHN0YXJ0X3hlbiAgICAgICAgICAgICAgLyog
YW5kIGRpc2FwcGVhciBpbnRvIHRoZSBsYW5kIG9mIEMgKi8KPiAgICAgICAgICAgYiAgICAgc3Rh
cnRfc2Vjb25kYXJ5ICAgICAgICAvKiAodG8gdGhlIGFwcHJvcHJpYXRlIGVudHJ5IHBvaW50KSAq
Lwo+ICAgCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9hcm02NC9oZWFkLlMgYi94ZW4vYXJj
aC9hcm0vYXJtNjQvaGVhZC5TCj4gaW5kZXggYjI2MTI2ZGU1My4uY2IzMGQ2ZjIyZSAxMDA2NDQK
PiAtLS0gYS94ZW4vYXJjaC9hcm0vYXJtNjQvaGVhZC5TCj4gKysrIGIveGVuL2FyY2gvYXJtL2Fy
bTY0L2hlYWQuUwo+IEBAIC01ODYsNyArNTg2LDYgQEAgbGF1bmNoOgo+ICAgCj4gICAgICAgICAg
IG1vdiAgIHgwLCB4MjAgICAgICAgICAgICAgICAgLyogTWFyc2hhbCBhcmdzOiAtIHBoeXNfb2Zm
c2V0ICovCj4gICAgICAgICAgIG1vdiAgIHgxLCB4MjEgICAgICAgICAgICAgICAgLyogICAgICAg
ICAgICAgICAtIEZEVCAqLwo+IC0gICAgICAgIG1vdiAgIHgyLCB4MjQgICAgICAgICAgICAgICAg
LyogICAgICAgICAgICAgICAtIENQVSBJRCAqLwo+ICAgICAgICAgICBiICAgICBzdGFydF94ZW4g
ICAgICAgICAgICAgIC8qIGFuZCBkaXNhcHBlYXIgaW50byB0aGUgbGFuZCBvZiBDICovCj4gICAx
Ogo+ICAgICAgICAgICBiICAgICBzdGFydF9zZWNvbmRhcnkgICAgICAgIC8qICh0byB0aGUgYXBw
cm9wcmlhdGUgZW50cnkgcG9pbnQpICovCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9zZXR1
cC5jIGIveGVuL2FyY2gvYXJtL3NldHVwLmMKPiBpbmRleCBjY2IwZjE4MWVhLi42ZGZiYmEyOTI3
IDEwMDY0NAo+IC0tLSBhL3hlbi9hcmNoL2FybS9zZXR1cC5jCj4gKysrIGIveGVuL2FyY2gvYXJt
L3NldHVwLmMKPiBAQCAtNzI4LDggKzcyOCw3IEBAIHNpemVfdCBfX3JlYWRfbW9zdGx5IGRjYWNo
ZV9saW5lX2J5dGVzOwo+ICAgCj4gICAvKiBDIGVudHJ5IHBvaW50IGZvciBib290IENQVSAqLwo+
ICAgdm9pZCBfX2luaXQgc3RhcnRfeGVuKHVuc2lnbmVkIGxvbmcgYm9vdF9waHlzX29mZnNldCwK
PiAtICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgZmR0X3BhZGRyLAo+IC0gICAg
ICAgICAgICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBjcHVpZCkKPiArICAgICAgICAgICAgICAg
ICAgICAgIHVuc2lnbmVkIGxvbmcgZmR0X3BhZGRyKQo+ICAgewo+ICAgICAgIHNpemVfdCBmZHRf
c2l6ZTsKPiAgICAgICBpbnQgY3B1cywgaTsKPiAKClRob3VnaDoKClJldmlld2VkLWJ5OiBBbmRy
aWkgQW5pc292IDxhbmRyaWlfYW5pc292QGVwYW0uY29tPgoKLS0gClNpbmNlcmVseSwKQW5kcmlp
IEFuaXNvdi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
