Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5415197D3B
	for <lists+xen-devel@lfdr.de>; Wed, 21 Aug 2019 16:38:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i0Rig-0006a2-4U; Wed, 21 Aug 2019 14:36:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=yiYo=WR=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1i0Rie-0006Zx-7q
 for xen-devel@lists.xenproject.org; Wed, 21 Aug 2019 14:36:12 +0000
X-Inumbo-ID: 04ed8652-c421-11e9-951b-bc764e2007e4
Received: from mail-lj1-x241.google.com (unknown [2a00:1450:4864:20::241])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 04ed8652-c421-11e9-951b-bc764e2007e4;
 Wed, 21 Aug 2019 14:36:11 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id f9so2325619ljc.13
 for <xen-devel@lists.xenproject.org>; Wed, 21 Aug 2019 07:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=6XNRIQsYBPY75jP14ac7vuRqGUD6qwR7hpF0FtEHWAQ=;
 b=H21q1IybH2D1egw0w5nlVryprz6EIUmM+C7PJ11hZc3pqR/lq4l56M0uNFHDA9w/Kb
 6Ex98F9KePZTTp0xJQbd4fqo8lzLzZ5m+dPXhZOZhyWK0hdHvW5nLBiNcaZetIoWfBVJ
 iu9/w62MAP8pM//EwpRAgNE6AfK+m5L0DdKR/LpeIRDXO8cA2+YxEE2BA5GRVMWlVMzi
 CtzGz9c+IaDi2i85WlNA/Vsq1oN1sZxC7W9XLphyCH1oDRXH1YXuTw5ejFqz9HGspcQA
 fMX1HhIUuXfcK99yKQM+FU5Z/uC9onRcEQ7bPJ2yx91rxbfpjXAjDIwD098WF+YM8RAR
 AcSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=6XNRIQsYBPY75jP14ac7vuRqGUD6qwR7hpF0FtEHWAQ=;
 b=a6041+E7eKsfRbq8nbHLBxi7PnzEQRsVG0u6WIk0psN04jr+tp6FLbtGFI0bAScuZe
 DJn3R4AjIiN9g5RzzViWJJc/5DENrzIco/GonoLfxLPqTvax+0NE+MXXqR0UqqqWsAq2
 UpkoBPKrhAasl2wN27zTpeQ+pv/dzdKpCrNbXX8h5n3FTzO7o+jeV1fJsZfkmw1Ik+xq
 BgJmjn9xW4Yj9No6c/9e87Wi5pVrn7NWmTbQ2z7te4JLiujL5VJk+BMJe23yv74xr+DA
 9V2fUhYknuO9wbimBJJEjtwpD9Adq9+Dsj5fNAF1wXRjrBYRbyXH4Q2NA9VYcLqsOStg
 sSoA==
X-Gm-Message-State: APjAAAWt+Cy9E1sa4uFhVr08URwqFH4LYWb+HcIL0N+dy7wQC/aL0jKe
 pQ5VYYhDILs/IHtsrgWJ0zM=
X-Google-Smtp-Source: APXvYqxt+xt94dmfCIxha1SSETA0Px33ic7XEuh+dBJuCja7lLWHe88XoUcR/5SaZATqKcy6rfSuEg==
X-Received: by 2002:a2e:9989:: with SMTP id w9mr18928156lji.133.1566398170078; 
 Wed, 21 Aug 2019 07:36:10 -0700 (PDT)
Received: from [10.17.182.120] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id r76sm3346650ljb.13.2019.08.21.07.36.08
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 21 Aug 2019 07:36:09 -0700 (PDT)
To: Paul Durrant <Paul.Durrant@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <1566324587-3442-1-git-send-email-olekstysh@gmail.com>
 <1566324587-3442-4-git-send-email-olekstysh@gmail.com>
 <a12616b4e61e418ab2d17a5e0ed02754@AMSPEX02CL03.citrite.net>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <5cac4d1b-2406-a8e8-90c2-e04176a837ae@gmail.com>
Date: Wed, 21 Aug 2019 17:36:08 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <a12616b4e61e418ab2d17a5e0ed02754@AMSPEX02CL03.citrite.net>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V3 3/8] xen/common: Introduce _xrealloc
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
Cc: "sstabellini@kernel.org" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim \(Xen.org\)" <tim@xen.org>,
 George Dunlap <George.Dunlap@citrix.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 "julien.grall@arm.com" <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 Ian Jackson <Ian.Jackson@citrix.com>,
 "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ck9uIDIxLjA4LjE5IDExOjA5LCBQYXVsIER1cnJhbnQgd3JvdGU6CgpIaSwgUGF1bAoKPj4gICB9
Cj4+Cj4+ICt2b2lkICpfeHJlYWxsb2Modm9pZCAqcHRyLCB1bnNpZ25lZCBsb25nIHNpemUsIHVu
c2lnbmVkIGxvbmcgYWxpZ24pCj4+ICt7Cj4+ICsgICAgdW5zaWduZWQgbG9uZyBjdXJyX3NpemUs
IHRtcF9zaXplOwo+PiArICAgIHZvaWQgKnA7Cj4+ICsKPj4gKyAgICBpZiAoICFzaXplICkKPj4g
KyAgICB7Cj4+ICsgICAgICAgIHhmcmVlKHB0cik7Cj4+ICsgICAgICAgIHJldHVybiBaRVJPX0JM
T0NLX1BUUjsKPj4gKyAgICB9Cj4+ICsKPj4gKyAgICBpZiAoIHB0ciA9PSBOVUxMIHx8IHB0ciA9
PSBaRVJPX0JMT0NLX1BUUiApCj4+ICsgICAgICAgIHJldHVybiBfeG1hbGxvYyhzaXplLCBhbGln
bik7Cj4+ICsKPj4gKyAgICBpZiAoICEoKHVuc2lnbmVkIGxvbmcpcHRyICYgKFBBR0VfU0laRSAt
IDEpKSApCj4+ICsgICAgICAgIGN1cnJfc2l6ZSA9IFBGTl9PUkRFUih2aXJ0X3RvX3BhZ2UocHRy
KSkgPDwgUEFHRV9TSElGVDsKPj4gKyAgICBlbHNlCj4+ICsgICAgewo+PiArICAgICAgICBzdHJ1
Y3QgYmhkciAqYjsKPj4gKyAgICAgICAgYiA9IChzdHJ1Y3QgYmhkciAqKSgoY2hhciAqKXB0ciAt
IEJIRFJfT1ZFUkhFQUQpOwo+PiArICAgICAgICBjdXJyX3NpemUgPSBiLT5zaXplICYgQkxPQ0tf
U0laRV9NQVNLOwo+PiArICAgIH0KPiBUaGF0IHNlY29uZHMgY2xhdXNlIGlzIG5vdCBnb2luZyB0
byBnaXZlIHlvdSB0aGUgYmxvY2sgc2l6ZSBpZiB0aGUgcHJldmlvdXMgYWxsb2NhdGlvbiBoYWQg
YWxpZ25tZW50IHBhZGRpbmcuIFlvdSdsbCBuZWVkIHRvIGNoZWNrIHRoZSBGUkVFX0JMT0NLIGJp
dCB0byB0ZWxsIHdoZXRoZXIgaXQncyBhIHJlYWwgYmxvY2sgaGVhZGVyIG9yIHRoZSAnZmFrZScg
YWxpZ25tZW50IGhlYWRlciBhbmQgdGhlbiBtYXliZSB3YWxrIGJhY2t3YXJkcyBvbnRvIHRoZSBy
ZWFsIGhlYWRlci4gU2VlIHRoZSBjb2RlIGluIHhmcmVlKCkuCgpJbmRlZWQuIFRoYW5rIHlvdSBm
b3IgdGhlIHBvaW50ZXIuCgoKPiBZb3Ugc2hvdWxkIGFsc28gY2hlY2sgd2hldGhlciB0aGUgbmV3
IHJlcXVlc3RlZCBhbGlnbm1lbnQgaXMgY29tcGF0aWJsZSB3aXRoIHRoZSBleGlzdGluZyBibG9j
ayBhbGlnbm1lbnQKCgpJIGFtIHdvbmRlcmluZzoKCkluIGNhc2Ugd2hlbiB3ZSB1c2Ugb25seSB0
eXBlLXNhZmUgY29uc3RydWN0aW9uIGZvciB0aGUgYmFzaWMgYWxsb2NhdGlvbiAKKHhtYWxsb2Mp
IGFuZCB0eXBlLXNhZmUgY29uc3RydWN0aW9uIGZvciB0aGUgcmUtYWxsb2NhdGlvbiAKKHhyZWFs
bG9jX2ZsZXhfc3RydWN0KSBvdmVyIHRoZSBzYW1lIHBvaW50ZXIgb2YgdGhlIGNvcnJlY3QgdHlw
ZSwgd2lsbCAKd2UgZ2V0IGEgcG9zc2libGUgYWxpZ25tZW50IGluY29tcGF0aWJpbGl0eT8KCgpU
aGlzIGlzIGhvdyBJIHNlZSBpdDoKCmRpZmYgLS1naXQgYS94ZW4vY29tbW9uL3htYWxsb2NfdGxz
Zi5jIGIveGVuL2NvbW1vbi94bWFsbG9jX3Rsc2YuYwppbmRleCBlZWNhZTJlLi5mOTBmNDUzIDEw
MDY0NAotLS0gYS94ZW4vY29tbW9uL3htYWxsb2NfdGxzZi5jCisrKyBiL3hlbi9jb21tb24veG1h
bGxvY190bHNmLmMKQEAgLTYxNiw4ICs2MTYsMTUgQEAgdm9pZCAqX3hyZWFsbG9jKHZvaWQgKnB0
ciwgdW5zaWduZWQgbG9uZyBzaXplLCAKdW5zaWduZWQgbG9uZyBhbGlnbikKIMKgwqDCoMKgwqDC
oMKgwqAgY3Vycl9zaXplID0gUEZOX09SREVSKHZpcnRfdG9fcGFnZShwdHIpKSA8PCBQQUdFX1NI
SUZUOwogwqDCoMKgwqAgZWxzZQogwqDCoMKgwqAgewotwqDCoMKgwqDCoMKgwqAgc3RydWN0IGJo
ZHIgKmI7Ci3CoMKgwqDCoMKgwqDCoCBiID0gKHN0cnVjdCBiaGRyICopKChjaGFyICopcHRyIC0g
QkhEUl9PVkVSSEVBRCk7CivCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgYmhkciAqYiA9IChzdHJ1Y3Qg
YmhkciAqKSgoY2hhciAqKXB0ciAtIEJIRFJfT1ZFUkhFQUQpOworCivCoMKgwqDCoMKgwqDCoCBp
ZiAoIGItPnNpemUgJiBGUkVFX0JMT0NLICkKK8KgwqDCoMKgwqDCoMKgIHsKK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgcCA9IChjaGFyICopcHRyIC0gKGItPnNpemUgJiB+RlJFRV9CTE9DSyk7CivC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIGIgPSAoc3RydWN0IGJoZHIgKikoKGNoYXIgKilwIC0gQkhE
Ul9PVkVSSEVBRCk7CivCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIEFTU0VSVCghKGItPnNpemUgJiBG
UkVFX0JMT0NLKSk7CivCoMKgwqDCoMKgwqDCoCB9CisKIMKgwqDCoMKgwqDCoMKgwqAgY3Vycl9z
aXplID0gYi0+c2l6ZSAmIEJMT0NLX1NJWkVfTUFTSzsKIMKgwqDCoMKgIH0KCkBAIC02MzAsOCAr
NjM3LDggQEAgdm9pZCAqX3hyZWFsbG9jKHZvaWQgKnB0ciwgdW5zaWduZWQgbG9uZyBzaXplLCAK
dW5zaWduZWQgbG9uZyBhbGlnbikKIMKgwqDCoMKgwqDCoMKgwqAgdG1wX3NpemUgPSAoIHRtcF9z
aXplIDwgTUlOX0JMT0NLX1NJWkUgKSA/IE1JTl9CTE9DS19TSVpFIDoKIMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBST1VORFVQX1NJWkUodG1wX3NpemUpOwoKLcKgwqDCoCBpZiAoIHRtcF9zaXpl
IDw9IGN1cnJfc2l6ZSApIC8qIGZpdHMgaW4gY3VycmVudCBibG9jayAqLwotwqDCoMKgwqDCoMKg
wqAgcmV0dXJuIHB0cjsKK8KgwqDCoCBpZiAoIHRtcF9zaXplIDw9IGN1cnJfc2l6ZSAmJiAoKHVu
c2lnbmVkIGxvbmcpcHRyICYgKGFsaWduIC0gMSkpID09IDAgKQorwqDCoMKgwqDCoMKgwqAgcmV0
dXJuIHB0cjsgLyogZml0cyBpbiBjdXJyZW50IGJsb2NrICovCgogwqDCoMKgwqAgcCA9IF94bWFs
bG9jKHNpemUsIGFsaWduKTsKIMKgwqDCoMKgIGlmICggcCApCgooRU5EKQoKCkRpZCBJIGdldCB5
b3VyIHBvaW50IGNvcnJlY3Q/CgoKLS0gClJlZ2FyZHMsCgpPbGVrc2FuZHIgVHlzaGNoZW5rbwoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
