Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA4F51002FF
	for <lists+xen-devel@lfdr.de>; Mon, 18 Nov 2019 11:54:26 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iWec5-0002DA-OB; Mon, 18 Nov 2019 10:50:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Wvs4=ZK=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1iWec4-0002D5-64
 for xen-devel@lists.xenproject.org; Mon, 18 Nov 2019 10:50:32 +0000
X-Inumbo-ID: 3cf41258-09f1-11ea-9631-bc764e2007e4
Received: from mail-lj1-x243.google.com (unknown [2a00:1450:4864:20::243])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3cf41258-09f1-11ea-9631-bc764e2007e4;
 Mon, 18 Nov 2019 10:50:31 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id g3so18325427ljl.11
 for <xen-devel@lists.xenproject.org>; Mon, 18 Nov 2019 02:50:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=ISrQ5sKbmu2dQggEErUdRfIHugpvTJGlxKeIPkGDdHA=;
 b=TchGGWiBUYb7Rt2E+7BzjpXrZGgMFjvW3ikZ59mT5vuYQBSUtvIIHhGP/mBTZcWpe6
 XItofUMS2xfrsDJOlizf019b88UC9CuLF0y0O+HT6Q3IJIc9i3BgcbN2IF0cIIVu/9j+
 +P6OHJHiQcPU/5m5CMMx2Srx1qo5ioJIRA2Rc7JctSs0aFsKKqxyf/xqLpGNxsL3vLml
 amEG1d2pD8LRl8pQjGvQRVlqunRDdjC01ULewQj9hNRUAQ4N8JJ+2iE480lVUV4D8tz2
 NyUfHCtPBfVA4m5TRCqL03rRs60TXl79XbhOgWh295r0Pl/Yz00vtq3R335gmK1Oo/Li
 imLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=ISrQ5sKbmu2dQggEErUdRfIHugpvTJGlxKeIPkGDdHA=;
 b=qasZWmN/DjtIc39qvRikYa1n/3QA1Q5h14t90FeDCsiMnKbwNYg9efnqd7mDrobfFV
 0UwD5qayEGlUbbgCaG3tkizA/FftIagoW+s6T3BWh4FG2qhh3Wm6Y4HyW0BagSM0qxrB
 0RXKXZCh/8cU9mEZpdB13kFiePBrsnpJap+6jNvfK7UG51bBvkWKBnCbUxhxaNV44DwY
 vUHULiEOdCMW5sIxxIH49CjiUhKOsHmJeq/lOCdnRj6/YHj4jRsuWYGmKVldpg2+OTrN
 tgGfyg3PyuhNcUgQDdsDyErItWPoEaMgfPfWuhcHkFvuhnDJIIdesPO6y88VZk1i/TtB
 QkPA==
X-Gm-Message-State: APjAAAXVm4gRj4nV+EN/RzYlPurfn4Roo+1yNw+mgmsj+n75u4/zBB0V
 xMjoe6Nk97TM1IxeEzlFVr4=
X-Google-Smtp-Source: APXvYqxWCiwzujghNL2buvDwxtuXuC0i3NaZEv7ob3D8BF+pct9/0Ryf6eZ712c8O0Ktr/btoWSP0Q==
X-Received: by 2002:a2e:8544:: with SMTP id u4mr21222346ljj.25.1574074229623; 
 Mon, 18 Nov 2019 02:50:29 -0800 (PST)
Received: from [10.17.182.20] (ll-74.141.223.85.sovam.net.ua. [85.223.141.74])
 by smtp.gmail.com with ESMTPSA id
 u23sm84438lfc.88.2019.11.18.02.50.28
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 18 Nov 2019 02:50:28 -0800 (PST)
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20191118103536.17675-1-daniel.vetter@ffwll.ch>
 <20191118103536.17675-14-daniel.vetter@ffwll.ch>
From: Oleksandr Andrushchenko <andr2000@gmail.com>
Message-ID: <5425173d-30f7-88d8-b717-a310a53a9ddb@gmail.com>
Date: Mon, 18 Nov 2019 12:50:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191118103536.17675-14-daniel.vetter@ffwll.ch>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 13/15] xen/gntdev-dmabuf: Ditch dummy map
 functions
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>, xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTEvMTgvMTkgMTI6MzUgUE0sIERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4gVGhlcmUncyBubyBp
bi1rZXJuZWwgdXNlcnMgZm9yIHRoZSBrKHVuKW1hcCBzdHVmZi4gQW5kIHRoZSBtbWFwIG9uZSBp
cwo+IGFjdGl2ZWx5IGhhcm1mdWwgLSByZXR1cm4gMCBhbmQgdGhlbiBfbm90XyBhY3R1YWxseSBt
bWFwaW5nIGNhbid0IGVuZAo+IHdlbGwuCj4KPiBTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0dGVy
IDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT4KUmV2aWV3ZWQtYnk6IE9sZWtzYW5kciBBbmRydXNo
Y2hlbmtvIDxvbGVrc2FuZHJfYW5kcnVzaGNoZW5rb0BlcGFtLmNvbT4KPiBDYzogQm9yaXMgT3N0
cm92c2t5IDxib3Jpcy5vc3Ryb3Zza3lAb3JhY2xlLmNvbT4KPiBDYzogSnVlcmdlbiBHcm9zcyA8
amdyb3NzQHN1c2UuY29tPgo+IENjOiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtl
cm5lbC5vcmc+Cj4gQ2M6IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwo+IC0tCj4gQWNr
IGZvciBtZXJnaW5nIHRoaXMgdGhyb3VnaCBkcm0gdHJlZXMgdmVyeSBtdWNoIGFwcHJlY2lhdGVk
Lgo+IC1EYW5pZWwKPiAtLS0KPiAgIGRyaXZlcnMveGVuL2dudGRldi1kbWFidWYuYyB8IDIzIC0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gICAxIGZpbGUgY2hhbmdlZCwgMjMgZGVsZXRpb25zKC0p
Cj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy94ZW4vZ250ZGV2LWRtYWJ1Zi5jIGIvZHJpdmVycy94
ZW4vZ250ZGV2LWRtYWJ1Zi5jCj4gaW5kZXggMmM0ZjMyNGY4NjI2Li5mZTdiZDY5ZDY5NTUgMTAw
NjQ0Cj4gLS0tIGEvZHJpdmVycy94ZW4vZ250ZGV2LWRtYWJ1Zi5jCj4gKysrIGIvZHJpdmVycy94
ZW4vZ250ZGV2LWRtYWJ1Zi5jCj4gQEAgLTM0MiwzNSArMzQyLDEyIEBAIHN0YXRpYyB2b2lkIGRt
YWJ1Zl9leHBfb3BzX3JlbGVhc2Uoc3RydWN0IGRtYV9idWYgKmRtYV9idWYpCj4gICAJbXV0ZXhf
dW5sb2NrKCZwcml2LT5sb2NrKTsKPiAgIH0KPiAgIAo+IC1zdGF0aWMgdm9pZCAqZG1hYnVmX2V4
cF9vcHNfa21hcChzdHJ1Y3QgZG1hX2J1ZiAqZG1hX2J1ZiwKPiAtCQkJCSB1bnNpZ25lZCBsb25n
IHBhZ2VfbnVtKQo+IC17Cj4gLQkvKiBOb3QgaW1wbGVtZW50ZWQuICovCj4gLQlyZXR1cm4gTlVM
TDsKPiAtfQo+IC0KPiAtc3RhdGljIHZvaWQgZG1hYnVmX2V4cF9vcHNfa3VubWFwKHN0cnVjdCBk
bWFfYnVmICpkbWFfYnVmLAo+IC0JCQkJICB1bnNpZ25lZCBsb25nIHBhZ2VfbnVtLCB2b2lkICph
ZGRyKQo+IC17Cj4gLQkvKiBOb3QgaW1wbGVtZW50ZWQuICovCj4gLX0KPiAtCj4gLXN0YXRpYyBp
bnQgZG1hYnVmX2V4cF9vcHNfbW1hcChzdHJ1Y3QgZG1hX2J1ZiAqZG1hX2J1ZiwKPiAtCQkJICAg
ICAgIHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hKQo+IC17Cj4gLQkvKiBOb3QgaW1wbGVtZW50
ZWQuICovCj4gLQlyZXR1cm4gMDsKPiAtfQo+IC0KPiAgIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZG1h
X2J1Zl9vcHMgZG1hYnVmX2V4cF9vcHMgPSAgewo+ICAgCS5hdHRhY2ggPSBkbWFidWZfZXhwX29w
c19hdHRhY2gsCj4gICAJLmRldGFjaCA9IGRtYWJ1Zl9leHBfb3BzX2RldGFjaCwKPiAgIAkubWFw
X2RtYV9idWYgPSBkbWFidWZfZXhwX29wc19tYXBfZG1hX2J1ZiwKPiAgIAkudW5tYXBfZG1hX2J1
ZiA9IGRtYWJ1Zl9leHBfb3BzX3VubWFwX2RtYV9idWYsCj4gICAJLnJlbGVhc2UgPSBkbWFidWZf
ZXhwX29wc19yZWxlYXNlLAo+IC0JLm1hcCA9IGRtYWJ1Zl9leHBfb3BzX2ttYXAsCj4gLQkudW5t
YXAgPSBkbWFidWZfZXhwX29wc19rdW5tYXAsCj4gLQkubW1hcCA9IGRtYWJ1Zl9leHBfb3BzX21t
YXAsCj4gICB9Owo+ICAgCj4gICBzdHJ1Y3QgZ250ZGV2X2RtYWJ1Zl9leHBvcnRfYXJncyB7CgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
