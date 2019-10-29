Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 421B3E8ACE
	for <lists+xen-devel@lfdr.de>; Tue, 29 Oct 2019 15:32:40 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iPSW5-00005m-N3; Tue, 29 Oct 2019 14:30:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hhGJ=YW=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1iPSW4-00005h-KN
 for xen-devel@lists.xenproject.org; Tue, 29 Oct 2019 14:30:36 +0000
X-Inumbo-ID: ab634dd8-fa58-11e9-beca-bc764e2007e4
Received: from mail-wr1-x443.google.com (unknown [2a00:1450:4864:20::443])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ab634dd8-fa58-11e9-beca-bc764e2007e4;
 Tue, 29 Oct 2019 14:30:35 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id w18so13922427wrt.3
 for <xen-devel@lists.xenproject.org>; Tue, 29 Oct 2019 07:30:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=KtWQlDKAsVnezy3HaOcukO+O+gydej4ahMeWZNzcUMc=;
 b=HLYur52QoPE5mfbeBQyUYnDaPUHtxYGa57Ly8NMoV/K09OYToiAUfSsDTl+1JzdqML
 humpcNWANm7dLewH0oK5ijhS6pRaBulESOEHBvqGMmcdcOCgSnmvbtr9BcE8cii/xI3f
 MTtfoRIyHxtp8vYGS17Ey7v9lOg97Cj1CkEA/6VBWACa/LzoeWp1W8HiFVy9xeftjjVg
 N1gaXgc5CK9zJYkFtmte13z0PzAXWzbuwrtpubDq66ibIlhzoZxX6RouOBqlCFUhie74
 97Ul7HO98lL3VAuqw2SHEw0VVe8tjIg4JSCnQBg5XfmCfc+kccVM5TZ/eDpjFB9N8Ph8
 Z2YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KtWQlDKAsVnezy3HaOcukO+O+gydej4ahMeWZNzcUMc=;
 b=edhR3XYzhkL4z7DqDkAwBbe8vcRi7fzKRFpfit1vlFISy/XAdPDqdbT5L1QRfeDkp9
 9cIm4J7CifuUP7SJdzy3HURQgJazQLQX1t5e5BHzKcGef5MkoKN++bbPAGCrHdJHXxi+
 rtTKSeSS0JheC+DAXCdjdQiZ8ImaYxOVo8wq4xo2TwVC33NjVl1RmTYQPXGzOfco+eva
 kl4IWnNNR24PqDDbIpPcUntPH3DruseS/liI0woGJOUfW9rc6MZBxsMdu9eLeprsJxbW
 zoDKBjaA6kCSwVAQg8PVdxamD1zyvYSb3I1Czr4AXotVMXD9BMXV3K5t1Wft5+d3f/oT
 Ev1A==
X-Gm-Message-State: APjAAAWtrN+Bv8bFsUl02vQsL4aGVVCaxN0cOTeUlzTjveDziJUt3fUx
 qI6U5DjnrPrZmebnVT7r7T8=
X-Google-Smtp-Source: APXvYqxIxQ458AterisMy8I3KDmFrA1Z0qqdKHSGEEol1JYfXV3Z5Bn1fFnpTZh6bJ370tmlMM2c8A==
X-Received: by 2002:a5d:4644:: with SMTP id j4mr15037577wrs.355.1572359434781; 
 Tue, 29 Oct 2019 07:30:34 -0700 (PDT)
Received: from ?IPv6:::1? ([206.189.23.0])
 by smtp.gmail.com with ESMTPSA id u10sm3876278wmj.0.2019.10.29.07.30.33
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 29 Oct 2019 07:30:34 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>
References: <4f0a30c7-911e-90ab-0875-83f3d4c454b5@suse.com>
 <a2ed0638-846a-fd4a-9093-0f5026eac881@gmail.com>
 <alpine.DEB.2.21.1910281144180.29150@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien.grall.oss@gmail.com>
Message-ID: <a95dbdf3-9c71-b521-4486-7fa5b2dca4c7@gmail.com>
Date: Tue, 29 Oct 2019 14:30:33 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1910281144180.29150@sstabellini-ThinkPad-T480s>
Content-Language: en-US
Subject: Re: [Xen-devel] getting 4.11.3 ready
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
Cc: Lars Kurth <lars.kurth@citrix.com>, Wei Liu <wl@xen.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAyOC8xMC8yMDE5IDIxOjQzLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4gT24gTW9u
LCAyOCBPY3QgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+PiBIaSwKPj4KPj4gT24gMjUvMTAv
MjAxOSAxMTozMSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+PiBBbGwsCj4+Pgo+Pj4gdGhlIDQuMTEu
MyBzdGFibGUgcmVsZWFzZSBpcyBkdWUuIEkgaW50ZW5kIHRvIHdhaXQgZm9yIHRoZSBYU0EgZml4
ZXMKPj4+IGdvaW5nIHB1YmxpYyBvbiB0aGUgMzFzdCwgYnV0IG5vdCAobXVjaCkgbG9uZ2VyLiBQ
bGVhc2UgcG9pbnQgb3V0Cj4+PiBiYWNrcG9ydGluZyBjYW5kaWRhdGVzIHRoYXQgeW91IGZpbmQg
bWlzc2luZyBmcm9tIHRoZSByZXNwZWN0aXZlCj4+PiBzdGFibGUgdHJlZXMuIEkgaGF2ZSB0aHJl
ZSBvbmVzIHF1ZXVlZCB3aGljaCBoYXZlbid0IHBhc3NlZCB0aGUgcHVzaAo+Pj4gZ2F0ZSB0byB0
aGUgbWFzdGVyIGJyYW5jaCB5ZXQ6Cj4+Pgo+Pj4gOTI1N2MyMThlNQl4ODYvdnZteDogRml4IHRo
ZSB1c2Ugb2YgUkRUU0NQIHdoZW4gaXQgaXMgaW50ZXJjZXB0ZWQgYXQgTDAKPj4+IDdlZWU5YzE2
ZDYJeDg2L3RzYzogdXBkYXRlIHZjcHUgdGltZSBpbmZvIG9uIGd1ZXN0IFRTQyBhZGp1c3RtZW50
cwo+Pj4gOTYzMzkyOTgyNAl4ODY6IGZpeCBvZmYtYnktb25lIGluIGlzX3hlbl9maXhlZF9tZm4o
KQo+Pgo+PiBXZSBkb24ndCBzZWVtIHRvIGhhdmUgYmFja3BvcnRlZCBwYXRjaGVzIGZvciBxdWl0
ZSBhIHdoaWxlIG9uIEFybS4gU29tZSBvZiBteQo+PiBwYXRjaGVzIGhhdmUgYmVlbiBtYXJrZWQg
YXMgdG8gYmUgYmFja3BvcnRlZCBmcm9tIHRoZSBiZWdpbm5pbmcgWzFdLiBJIGFtCj4+IHNwZWNp
ZmljYWxseSB0aGlua2luZyB0bzoKPj4gCQo+PiBlMDQ4MThiNDZkIHhlbi9hcm06IHRyYXBzOiBB
dm9pZCB1c2luZyBCVUdfT04oKSB0byBjaGVjayBndWVzdCBzdGF0ZSBpbgo+PiBhZHZhbmNlX3Bj
KCkKClVyZ2gsIEkgZ2F2ZSB0aGUgY29ycmVjdCB0aXRsZSBidXQgdGhlIHdyb25nIGNvbW1pdCBz
aGExLiBJdCBzaG91bGQgYmUgCgo3MjYxNWYyZTZiOThlODYxYzA4YWJiMWQyYjE5NDEyNjAxM2Q1
NGZlCgo+IAo+IEkgaGF2ZSBlMDQ4MThiNDZkLCBwbHVzIHRoZSBmb2xsb3dpbmcgbWFya2VkIGZv
ciBiYWNrcG9ydDoKPiAKPiBlOThlZGNjYjk0NGE4MGRiNzgyZTU1MWYzMDkwNjI4ZTY2YzdmYjUy
IHhlbi9hcm06IFNDVExSX0VMMSBpcyBhIDY0LWJpdCByZWdpc3RlciBvbiBBcm02NAoKVGhlcmUg
YXJlIG1vcmUgdGhhbiB0aGF0IHRvIGJhY2twb3J0OgoKMzBmNTA0N2IyYzRlNTc3NDM2YjUwNWJh
NzYyN2YzNGMzYmUwMjAxNCAgICB4ZW4vYXJtOiBnaWM6IE1ha2Ugc3VyZSB0aGUgbnVtYmVyIG9m
IGludGVycnVwdCBsaW5lcyBpcyB2YWxpZCBiZWZvcmUgdXNpbmcgaXQgIFs0LjExXQo4YWEyNzYy
MzViOTNlZWI0ZjgxMDk1YzYzODk3MDkwMGUxOWIzMWU1ICAgIHhlbi9hcm06IGlycTogRW5kIGNs
ZWFubHkgc3B1cmlvdXMgaW50ZXJydXB0ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgWzQuMTFdCmI0ZGY3M2RlNDkzOTU0YzQ0ZjI0MGY3ODc3OWM5YmQzNzgyZTE1NzIgICAgeGVu
L2FybTogZ2ljLXYyOiBkZWFjdGl2YXRlIGludGVycnVwdHMgZHVyaW5nIGluaXRpYWxpemF0aW9u
ICAgICAgICAgICAgICAgICAgICBbNC4xMV0KMDMyMmUwZGI1YjI5YTBkMWNlNGI0NTI4ODVlMzQw
MjNlM2E0YjAwZSAgICBhcm06IGdpYy12MzogZGVhY3RpdmF0ZSBpbnRlcnJ1cHRzIGR1cmluZyBp
bml0aWFsaXphdGlvbiAgICAgICAgICAgICAgICAgICAgICAgIFs0LjExXQoKNWJhMWM1ZDA2NDFj
ZjYzMDg2YjMwNThlNTQ3ZmNkMjhjM2M0YTAxMSAgICB4ZW4vYXJtOiBtZW1hY2Nlc3M6IEluaXRp
YWxpemUgY29ycmVjdGx5ICphY2Nlc3MgaW4gX19wMm1fZ2V0X21lbV9hY2Nlc3MgICAgICAgIFs0
LjEyXQowN2U0NGIzZDFiZTMyZmEyMTY1YzIzNjdhZTNlZjljNmM4YjM5ZTFlICAgIHhlbi9hcm06
IEltcGxlbWVudCB3b3JrYXJvdW5kIGZvciBDb3J0ZXggQS01NyBhbmQgQ29ydGV4IEE3MiBBVCBz
cGVjdWxhdGUgICAgICAgWzQuMTJdCgowOGUyMDU5ZmFjZDc4ZDVmZmFmMjA2YmEwNmFjMjAxN2M0
YWRlZWQ0ICAgIHhlbi9hcm06IHNldHVwOiBDYWxjdWxhdGUgY29ycmVjdGx5IHRoZSBzaXplIG9m
IFhlbiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgWzQuMTErXQo4ZGJhOWE4MWU3YzYyYjhh
N2RiZTAyM2ZmZmVjZDJlMTZjYzIwNDg2ICAgIHhlbi9hcm06IERvbid0IHVzZSBfZW5kIGluIGlz
X3hlbl9maXhlZF9tZm4oKSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgWzQuMTEr
XQo2NzE4Nzg3Nzk3NDFiMzhjNWYyMzYzYWRjZWVmOGRlMmNlMGIzOTQ1ICAgIHhlbi9hcm06IHAy
bTogRnJlZSB0aGUgcDJtIGVudHJ5IGFmdGVyIGZsdXNoaW5nIHRoZSBJT01NVSBUTEJzICAgICAg
ICAgICAgICAgICAgWzQuMTErXQo3ZjQyMTdjYzYwNTc0ODY2Y2I5MGQ2N2Q5NzUwMjI4YzZiODZj
OTFlICAgIHhlbi9hcm06IHZzbWM6IFRoZSBmdW5jdGlvbiBpZGVudGlmaWVyIGlzIGFsd2F5cyAz
Mi1iaXQgICAgICAgICAgICAgICAgICAgICAgICAgWzQuMTErXQo2MTJkNDc2ZTc0YTMxNGJlNTE0
ZWU2YTk3NDRlZWE4ZGIwOWQzMmU1ICAgIHhlbi9hcm02NDogQ29ycmVjdGx5IGNvbXB1dGUgdGhl
IHZpcnR1YWwgYWRkcmVzcyBpbiBtYWRkcl90b192aXJ0KCkgICAgICAgICAgICAgWzQuMTErXQpm
NTEwMjdiZTA2ODg1NDBhYWFiNjE1MTNiMDZhODY5M2EzN2U0YzAwICAgIHhlbi9hcm06IGZpeCBu
cl9wZHhzIGNhbGN1bGF0aW9uICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgWzQuMTErXQphMTg5ZWYwMjdkYmI3YTNjMGRmZTU2NjEzN2YwNWMwNmQ2Njg1ZmI5
ICAgIHhlbi9hcm06IG1tOiBGbHVzaCB0aGUgVExCcyBldmVuIGlmIGEgbWFwcGluZyBmYWlsZWQg
aW4gY3JlYXRlX3hlbl9lbnRyaWVzICAgICAgWzQuMTErXQoKQ2hlZXJzLAoKLS0gCkp1bGllbiBH
cmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
