Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EFAABF448
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 15:43:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDTzo-0000zb-AH; Thu, 26 Sep 2019 13:39:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=KCTf=XV=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1iDTzm-0000zW-Kl
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 13:39:46 +0000
X-Inumbo-ID: 19e09e38-e063-11e9-97fb-bc764e2007e4
Received: from mail-lf1-x142.google.com (unknown [2a00:1450:4864:20::142])
 by localhost (Halon) with ESMTPS
 id 19e09e38-e063-11e9-97fb-bc764e2007e4;
 Thu, 26 Sep 2019 13:39:45 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id w67so1748009lff.4
 for <xen-devel@lists.xenproject.org>; Thu, 26 Sep 2019 06:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=epN/3yEpw6jmW/EeG4J1+J7JK0nNWynRcgVM1U3jR6o=;
 b=lPX5O0luEGUeB4C/CqRTnDHGn5KI0oPYR4U2FC5ewSaS+I8p50GzemezllYFGux5Qf
 bHItnPLgYMw5rd3CsMLIqKFdcXF/A9pnHKvSjPQybdo5x9dSpXdm3S8ORqynF3fNbMN+
 Bkp9IOemDX1g1o+B4aosWMWBm7l0IbQQZPf3rAWi5yg57tvo3/jptpTN8uCUk1CRLKhj
 Cd6I5X8+1aPfCHGnGI9xdoMqdy7/dx7Ujei1DQ8EYMzw6rG6Sa9ZK223Hecx3EPnAmPh
 WaWvv+MSoW4Bgn1Kz4NtVcLdllVysz4iikoiRY0w7wmXuG1PzuNacCDcLLa1tPhQsahn
 PyhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=epN/3yEpw6jmW/EeG4J1+J7JK0nNWynRcgVM1U3jR6o=;
 b=AeO0HoYC/edV8NmUqxxl2bsbdCT+2KDIGxjOgezHvvLLJwOQ0M0oEsc59tdKq/d9v2
 rjg5hPzHIW0FWqzm3QUvNPI62VyjbamSFm+pyajlki/PJcZIyEWGDLjv5LbnL/+MeqgQ
 jjKtUJJ306VEZi5OV/ln9PAsz+K6TR+06jlPbvrAM82mzd6xz6fUrywKpzYxV1Wp723G
 Zx9Ps2/O9YKwLHkmLV+u4RcgcDdQTu1Haza+hKIy+ok6iPM+YFjjrmwqRPU01H6zvENn
 qFKaaOsr7B7aoT3vtoLTlKut0jhMrqc0ZjDQMPgtxuwR+XQphm6sFb3xYeWbSeNgRUaF
 Oogg==
X-Gm-Message-State: APjAAAVR8kxFc6+1axuYYU9Pr9p2K9OCrm2Vaz1L0x/Y9NCYdS8fP0fB
 VMTgBJQITAdvbyBzK0ij1BM=
X-Google-Smtp-Source: APXvYqzy0CGEWuAsO7Jj+ctWF3zVBz4zvouC6aN0qy74/orRgO1ZkCIDtwvBX7lkn74LwlYSzrHiRQ==
X-Received: by 2002:ac2:4567:: with SMTP id k7mr2317843lfm.46.1569505184706;
 Thu, 26 Sep 2019 06:39:44 -0700 (PDT)
Received: from [10.17.182.120] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id f5sm529007lfh.52.2019.09.26.06.39.41
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 26 Sep 2019 06:39:44 -0700 (PDT)
To: Jan Beulich <jbeulich@suse.com>
References: <1569496834-7796-1-git-send-email-olekstysh@gmail.com>
 <1569496834-7796-4-git-send-email-olekstysh@gmail.com>
 <32234ca5-75b2-3908-5f46-484fc53104af@suse.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <29f4f366-8c8a-a7ff-ccca-d17847b4fd1b@gmail.com>
Date: Thu, 26 Sep 2019 16:39:40 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <32234ca5-75b2-3908-5f46-484fc53104af@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V6 3/8] xen/common: Introduce _xrealloc
 function
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
Cc: sstabellini@kernel.org, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, julien.grall@arm.com,
 Paul Durrant <paul.durrant@citrix.com>, xen-devel@lists.xenproject.org,
 volodymyr_babchuk@epam.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ck9uIDI2LjA5LjE5IDE1OjE5LCBKYW4gQmV1bGljaCB3cm90ZToKCkhpLCBKYW4KCj4gT24gMjYu
MDkuMjAxOSAxMzoyMCwgT2xla3NhbmRyIFR5c2hjaGVua28gd3JvdGU6Cj4+IEZyb206IE9sZWtz
YW5kciBUeXNoY2hlbmtvIDxvbGVrc2FuZHJfdHlzaGNoZW5rb0BlcGFtLmNvbT4KPj4KPj4gVGhp
cyBwYXRjaCBpbnRyb2R1Y2VzIHR5cGUtdW5zYWZlIGZ1bmN0aW9uIHdoaWNoIGJlc2lkZXMKPj4g
cmUtYWxsb2NhdGlvbiBoYW5kbGVzIHRoZSBmb2xsb3dpbmcgY29ybmVyIGNhc2VzOgo+PiAxLiBp
ZiByZXF1ZXN0ZWQgc2l6ZSBpcyB6ZXJvLCBpdCB3aWxsIGJlaGF2ZSBsaWtlIHhmcmVlCj4+IDIu
IGlmIGluY29taW5nIHBvaW50ZXIgaXMgbm90IHZhbGlkIChOVUxMIG9yIFpFUk9fQkxPQ0tfUFRS
KSwKPj4gICAgIGl0IHdpbGwgYmVoYXZlIGxpa2UgeG1hbGxvYwo+Pgo+PiBJZiBib3RoIHBvaW50
ZXIgYW5kIHNpemUgYXJlIHZhbGlkIHRoZSBmdW5jdGlvbiB3aWxsIHJlLWFsbG9jYXRlIGFuZAo+
PiBjb3B5IG9ubHkgaWYgcmVxdWVzdGVkIHNpemUgYW5kIGFsaWdubWVudCBkb24ndCBmaXQgaW4g
YWxyZWFkeQo+PiBhbGxvY2F0ZWQgc3BhY2UuCj4+Cj4+IFN1YnNlcXVlbnQgcGF0Y2ggd2lsbCBh
ZGQgdHlwZS1zYWZlIGhlbHBlciBtYWNyb3MuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IE9sZWtzYW5k
ciBUeXNoY2hlbmtvIDxvbGVrc2FuZHJfdHlzaGNoZW5rb0BlcGFtLmNvbT4KPiBSZXZpZXdlZC1i
eTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKVGhhbmsgeW91IQoKCj4gcHJlZmVy
YWJseSB3aXRoIHR3byBtb3JlIGNvc21ldGljcyBhZGRyZXNzZWQgKGNhbiBzdXJlbHkgYmUgZG9u
ZQo+IHdoaWxlIGNvbW1pdHRpbmcpOgo+Cj4+IC0tLSBhL3hlbi9jb21tb24veG1hbGxvY190bHNm
LmMKPj4gKysrIGIveGVuL2NvbW1vbi94bWFsbG9jX3Rsc2YuYwo+PiBAQCAtNTQ5LDEwICs1NDks
NDAgQEAgc3RhdGljIHZvaWQgdGxzZl9pbml0KHZvaWQpCj4+ICAgICogeG1hbGxvYygpCj4+ICAg
ICovCj4+ICAgCj4+ICtzdGF0aWMgdm9pZCAqc3RyaXBfcGFkZGluZyh2b2lkICpwKQo+PiArewo+
PiArICAgIHN0cnVjdCBiaGRyICpiID0gcCAtIEJIRFJfT1ZFUkhFQUQ7Cj4gTG9va3MgbGlrZSB0
aGlzIGNhbiAoYW5kIGhlbmNlIHNob3VsZCkgYmUgcG9pbnRlciB0byBjb25zdC4KCmFncmVlCgoK
Pgo+Cj4+IEBAIC01OTMsMTAgKzYxNiw3MSBAQCB2b2lkICpfeHphbGxvYyh1bnNpZ25lZCBsb25n
IHNpemUsIHVuc2lnbmVkIGxvbmcgYWxpZ24pCj4+ICAgICAgIHJldHVybiBwID8gbWVtc2V0KHAs
IDAsIHNpemUpIDogcDsKPj4gICB9Cj4+ICAgCj4+IC12b2lkIHhmcmVlKHZvaWQgKnApCj4+ICt2
b2lkICpfeHJlYWxsb2Modm9pZCAqcHRyLCB1bnNpZ25lZCBsb25nIHNpemUsIHVuc2lnbmVkIGxv
bmcgYWxpZ24pCj4+ICAgewo+PiAtICAgIHN0cnVjdCBiaGRyICpiOwo+PiArICAgIHVuc2lnbmVk
IGxvbmcgY3Vycl9zaXplOwo+PiArICAgIHZvaWQgKnA7Cj4+ICsKPj4gKyAgICBpZiAoICFzaXpl
ICkKPj4gKyAgICB7Cj4+ICsgICAgICAgIHhmcmVlKHB0cik7Cj4+ICsgICAgICAgIHJldHVybiBa
RVJPX0JMT0NLX1BUUjsKPj4gKyAgICB9Cj4+ICAgCj4+ICsgICAgaWYgKCBwdHIgPT0gTlVMTCB8
fCBwdHIgPT0gWkVST19CTE9DS19QVFIgKQo+PiArICAgICAgICByZXR1cm4gX3htYWxsb2Moc2l6
ZSwgYWxpZ24pOwo+PiArCj4+ICsgICAgQVNTRVJUKCEoYWxpZ24gJiAoYWxpZ24gLSAxKSkpOwo+
PiArICAgIGlmICggYWxpZ24gPCBNRU1fQUxJR04gKQo+PiArICAgICAgICBhbGlnbiA9IE1FTV9B
TElHTjsKPj4gKwo+PiArICAgIGlmICggISgodW5zaWduZWQgbG9uZylwdHIgJiAoUEFHRV9TSVpF
IC0gMSkpICkKPj4gKyAgICB7Cj4+ICsgICAgICAgIGN1cnJfc2l6ZSA9ICh1bnNpZ25lZCBsb25n
KVBGTl9PUkRFUih2aXJ0X3RvX3BhZ2UocHRyKSkgPDwgUEFHRV9TSElGVDsKPj4gKwo+PiArICAg
ICAgICBpZiAoIHNpemUgPD0gY3Vycl9zaXplICYmICEoKHVuc2lnbmVkIGxvbmcpcHRyICYgKGFs
aWduIC0gMSkpICkKPj4gKyAgICAgICAgICAgIHJldHVybiBwdHI7Cj4+ICsgICAgfQo+PiArICAg
IGVsc2UKPj4gKyAgICB7Cj4+ICsgICAgICAgIHVuc2lnbmVkIGxvbmcgdG1wX3NpemU7Cj4+ICsg
ICAgICAgIHN0cnVjdCBiaGRyICpiOwo+IFNhbWUgaGVyZS4KCmFncmVlCgoKPgo+PiArICAgICAg
ICB0bXBfc2l6ZSA9IHNpemUgKyBhbGlnbiAtIE1FTV9BTElHTjsKPiBUaGlzIGNvdWxkIGFsc28g
YmUgdGhlIGluaXRpYWxpemVyIG9mIHRoZSB2YXJpYWJsZS4KCmFncmVlCgotLSAKUmVnYXJkcywK
Ck9sZWtzYW5kciBUeXNoY2hlbmtvCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
