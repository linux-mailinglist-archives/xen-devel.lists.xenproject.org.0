Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9E0949890
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jun 2019 07:09:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hd6JE-0001zR-Te; Tue, 18 Jun 2019 05:05:28 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=EF/9=UR=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1hd6JD-0001zM-Mz
 for xen-devel@lists.xenproject.org; Tue, 18 Jun 2019 05:05:27 +0000
X-Inumbo-ID: ae83281c-9186-11e9-8980-bc764e045a96
Received: from mail-lf1-x141.google.com (unknown [2a00:1450:4864:20::141])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id ae83281c-9186-11e9-8980-bc764e045a96;
 Tue, 18 Jun 2019 05:05:26 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id a9so8202659lff.7
 for <xen-devel@lists.xenproject.org>; Mon, 17 Jun 2019 22:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=eR4eHEo4NtHyWYg3n4D7ZzM9tX/RwsAqIZaGZetDtGs=;
 b=ZwasV0TatArvmqw6ODIt99I32QC2mVI1yNJx2YIjrP7a7Kaq0tZP3vHbLAlBDuo/7o
 rEvnqQv1aCRp02OWHGg4wgAqzL4Q92Wx7zruc7GpqQXcW+0G3NnDd0pKULwgFX48HqrZ
 EZgcrE4ntk7SzIzyizkIfF03UlMYLUK/WXdEyM8SdtHvs92X4OIurMUasoPwVDeMzNFR
 dkTAYnTcIpkVhKJaVRvLwMSI9wixgMg2VF+OJcvArDG7klLtUAcTf5+jdG/vKxfU2ZA6
 my+TPeUbyaFuOS2X2vtle8Tp6u8oozplT2hn5AbHO+q10SqSUm+4p268gCrJ9r+PpW9k
 8cdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=eR4eHEo4NtHyWYg3n4D7ZzM9tX/RwsAqIZaGZetDtGs=;
 b=cMwYpiHGu4peAco3iXkf3kZPCSF5ayFM7a7dlA4rS3A5tbciUum/47+smRNSfMn7wP
 LUbsKWSJw74JaTaxT3zYqdIvh7TZkd9gnGp7jzlA3vXpOGvGnNSkC0OxGUiw6GftDB7H
 /qV/cq7goaRd1YiL/eq0XEIzlHhMtjUgceCAe/0Wv6+anF++0FsxeA+vmQc7KvrbuBjh
 hh86xpm24n10zy4wdzSiLfLAVq5/keiHfhvZaLdi+o6vJhSddnBDUDr5AEkjdlfTIeYt
 /5TLKm5Aq2ayE/KSzGLzbsVuJnDMvhjoUR6K5Zou8nyJLnNTw0tWjk+2JfZZScFYs/6o
 i1iw==
X-Gm-Message-State: APjAAAUAizkqT6/SpS6fWvp8SPJ0q1h0wDBgd1OxUj72z3oXsds+tB+i
 yxGX1ArRA/VnH6juDuoIIvg=
X-Google-Smtp-Source: APXvYqw89359eC7nc/xQKqR59kE/D0wTBIOqH5/iKL/g+Z63Hya1hx13SPTTcUZtDNoNapg1BrK8ow==
X-Received: by 2002:a19:6a01:: with SMTP id u1mr55460428lfu.141.1560834324449; 
 Mon, 17 Jun 2019 22:05:24 -0700 (PDT)
Received: from [10.17.182.20] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id
 n1sm2017366lfk.19.2019.06.17.22.05.23
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 17 Jun 2019 22:05:23 -0700 (PDT)
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
 <20190614203615.12639-39-daniel.vetter@ffwll.ch>
From: Oleksandr Andrushchenko <andr2000@gmail.com>
Message-ID: <3a4fe06d-56da-2548-82e2-820174a6ff07@gmail.com>
Date: Tue, 18 Jun 2019 08:05:22 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190614203615.12639-39-daniel.vetter@ffwll.ch>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 38/59] drm/xen: Drop
 drm_gem_prime_export/import
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
Cc: Daniel Vetter <daniel.vetter@intel.com>, xen-devel@lists.xenproject.org,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gNi8xNC8xOSAxMTozNSBQTSwgRGFuaWVsIFZldHRlciB3cm90ZToKPiBUaGV5J3JlIHRoZSBk
ZWZhdWx0Lgo+Cj4gQXNpZGU6IFdvdWxkIGJlIHJlYWxseSBuaWNlIHRvIHN3aXRjaCB0aGUgb3Ro
ZXJzIG92ZXIgdG8KPiBkcm1fZ2VtX29iamVjdF9mdW5jcy4KPgo+IFNpZ25lZC1vZmYtYnk6IERh
bmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAaW50ZWwuY29tPgo+IENjOiBPbGVrc2FuZHIgQW5k
cnVzaGNoZW5rbyA8b2xla3NhbmRyX2FuZHJ1c2hjaGVua29AZXBhbS5jb20+Cj4gQ2M6IHhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpSZXZpZXdlZC1ieTogT2xla3NhbmRyIEFuZHJ1c2hj
aGVua28gPG9sZWtzYW5kcl9hbmRydXNoY2hlbmtvQGVwYW0uY29tPgo+IC0tLQo+ICAgZHJpdmVy
cy9ncHUvZHJtL3hlbi94ZW5fZHJtX2Zyb250LmMgfCAyIC0tCj4gICAxIGZpbGUgY2hhbmdlZCwg
MiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGVuL3hlbl9k
cm1fZnJvbnQuYyBiL2RyaXZlcnMvZ3B1L2RybS94ZW4veGVuX2RybV9mcm9udC5jCj4gaW5kZXgg
YWVmZmVjODJhNWNlLi4wNTE4MjJlZTViMzYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L3hlbi94ZW5fZHJtX2Zyb250LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGVuL3hlbl9kcm1f
ZnJvbnQuYwo+IEBAIC00OTEsOCArNDkxLDYgQEAgc3RhdGljIHN0cnVjdCBkcm1fZHJpdmVyIHhl
bl9kcm1fZHJpdmVyID0gewo+ICAgCS5nZW1fZnJlZV9vYmplY3RfdW5sb2NrZWQgID0geGVuX2Ry
bV9kcnZfZnJlZV9vYmplY3RfdW5sb2NrZWQsCj4gICAJLnByaW1lX2hhbmRsZV90b19mZCAgICAg
ICAgPSBkcm1fZ2VtX3ByaW1lX2hhbmRsZV90b19mZCwKPiAgIAkucHJpbWVfZmRfdG9faGFuZGxl
ICAgICAgICA9IGRybV9nZW1fcHJpbWVfZmRfdG9faGFuZGxlLAo+IC0JLmdlbV9wcmltZV9pbXBv
cnQgICAgICAgICAgPSBkcm1fZ2VtX3ByaW1lX2ltcG9ydCwKPiAtCS5nZW1fcHJpbWVfZXhwb3J0
ICAgICAgICAgID0gZHJtX2dlbV9wcmltZV9leHBvcnQsCj4gICAJLmdlbV9wcmltZV9pbXBvcnRf
c2dfdGFibGUgPSB4ZW5fZHJtX2Zyb250X2dlbV9pbXBvcnRfc2dfdGFibGUsCj4gICAJLmdlbV9w
cmltZV9nZXRfc2dfdGFibGUgICAgPSB4ZW5fZHJtX2Zyb250X2dlbV9nZXRfc2dfdGFibGUsCj4g
ICAJLmdlbV9wcmltZV92bWFwICAgICAgICAgICAgPSB4ZW5fZHJtX2Zyb250X2dlbV9wcmltZV92
bWFwLAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
