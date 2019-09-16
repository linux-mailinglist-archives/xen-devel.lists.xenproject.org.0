Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6EC1B37E2
	for <lists+xen-devel@lfdr.de>; Mon, 16 Sep 2019 12:16:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i9o0n-00089f-8T; Mon, 16 Sep 2019 10:13:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ZJ1s=XL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i9o0m-00089W-69
 for xen-devel@lists.xenproject.org; Mon, 16 Sep 2019 10:13:36 +0000
X-Inumbo-ID: a23d973c-d86a-11e9-b299-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a23d973c-d86a-11e9-b299-bc764e2007e4;
 Mon, 16 Sep 2019 10:13:31 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 91DC4AD63;
 Mon, 16 Sep 2019 10:13:30 +0000 (UTC)
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
References: <1568388917-7287-1-git-send-email-olekstysh@gmail.com>
 <1568388917-7287-5-git-send-email-olekstysh@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <81c2099d-ee08-2e0a-134c-0a9889748ac8@suse.com>
Date: Mon, 16 Sep 2019 12:13:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1568388917-7287-5-git-send-email-olekstysh@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V4 4/8] xen/common: Introduce _xrealloc
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
 Volodymyr_Babchuk@epam.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTMuMDkuMjAxOSAxNzozNSwgT2xla3NhbmRyIFR5c2hjaGVua28gd3JvdGU6Cj4gLS0tIGEv
eGVuL2NvbW1vbi94bWFsbG9jX3Rsc2YuYwo+ICsrKyBiL3hlbi9jb21tb24veG1hbGxvY190bHNm
LmMKPiBAQCAtNTk4LDYgKzU5OCw1OCBAQCB2b2lkICpfeHphbGxvYyh1bnNpZ25lZCBsb25nIHNp
emUsIHVuc2lnbmVkIGxvbmcgYWxpZ24pCj4gICAgICByZXR1cm4gcCA/IG1lbXNldChwLCAwLCBz
aXplKSA6IHA7Cj4gIH0KPiAgCj4gK3ZvaWQgKl94cmVhbGxvYyh2b2lkICpwdHIsIHVuc2lnbmVk
IGxvbmcgc2l6ZSwgdW5zaWduZWQgbG9uZyBhbGlnbikKPiArewo+ICsgICAgdW5zaWduZWQgbG9u
ZyBjdXJyX3NpemUsIHRtcF9zaXplOwo+ICsgICAgdm9pZCAqcDsKPiArCj4gKyAgICBpZiAoICFz
aXplICkKPiArICAgIHsKPiArICAgICAgICB4ZnJlZShwdHIpOwo+ICsgICAgICAgIHJldHVybiBa
RVJPX0JMT0NLX1BUUjsKPiArICAgIH0KPiArCj4gKyAgICBpZiAoIHB0ciA9PSBOVUxMIHx8IHB0
ciA9PSBaRVJPX0JMT0NLX1BUUiApCj4gKyAgICAgICAgcmV0dXJuIF94bWFsbG9jKHNpemUsIGFs
aWduKTsKPiArCj4gKyAgICBpZiAoICEoKHVuc2lnbmVkIGxvbmcpcHRyICYgKFBBR0VfU0laRSAt
IDEpKSApCj4gKyAgICAgICAgY3Vycl9zaXplID0gUEZOX09SREVSKHZpcnRfdG9fcGFnZShwdHIp
KSA8PCBQQUdFX1NISUZUOwoKV2hpbGUgdGhlIHByZXNlbnQgTUFYX09SREVSIHNldHRpbmcgd2ls
bCBwcmV2ZW50IGFsbG9jYXRpb25zIG9mCjRHaUIgb3IgYWJvdmUgZnJvbSBzdWNjZWVkaW5nLCBt
YXkgSSBhc2sgdGhhdCB5b3UgZG9uJ3QgaW50cm9kdWNlCmxhdGVudCBpc3N1ZXMgaW4gY2FzZSBN
QVhfT1JERVIgd291bGQgZXZlciBuZWVkIGJ1bXBpbmc/Cgo+ICsgICAgZWxzZQo+ICsgICAgewo+
ICsgICAgICAgIHN0cnVjdCBiaGRyICpiID0gKHN0cnVjdCBiaGRyICopKChjaGFyICopcHRyIC0g
QkhEUl9PVkVSSEVBRCk7Cj4gKwo+ICsgICAgICAgIGlmICggYi0+c2l6ZSAmIEZSRUVfQkxPQ0sg
KQo+ICsgICAgICAgIHsKPiArICAgICAgICAgICAgcCA9IChjaGFyICopcHRyIC0gKGItPnNpemUg
JiB+RlJFRV9CTE9DSyk7Cj4gKyAgICAgICAgICAgIGIgPSAoc3RydWN0IGJoZHIgKikoKGNoYXIg
KilwIC0gQkhEUl9PVkVSSEVBRCk7Cj4gKyAgICAgICAgICAgIEFTU0VSVCghKGItPnNpemUgJiBG
UkVFX0JMT0NLKSk7Cj4gKyAgICAgICAgfQoKVGhpcyBtYXRjaGVzIHRoZSByZXNwZWN0aXZlIHhm
cmVlKCkgY29kZSBmcmFnbWVudCwgYW5kIG5lZWRzIHRvCnJlbWFpbiBpbiBzeW5jLiBXaGljaCBz
dWdnZXN0cyBpbnRyb2R1Y2luZyBhIGhlbHBlciBmdW5jdGlvbgppbnN0ZWFkIG9mIGR1cGxpY2F0
aW5nIHRoZSBjb2RlLiBBbmQgcGxlYXNlIG9taXQgdGhlIHVubmVjZXNzYXJ5CmNhc3RzIHRvIGNo
YXIgKi4KCj4gKyAgICAgICAgY3Vycl9zaXplID0gYi0+c2l6ZSAmIEJMT0NLX1NJWkVfTUFTSzsK
Cl94bWFsbG9jKCkgaGFzCgogICAgICAgIGItPnNpemUgPSBwYWQgfCBGUkVFX0JMT0NLOwoKaS5l
LiBhaXVpIHdoYXQgeW91IGNhbGN1bGF0ZSBhYm92ZSBpcyB0aGUgcGFkZGluZyBzaXplLCBub3Qg
dGhlCm92ZXJhbGwgYmxvY2sgc2l6ZS4KCj4gKyAgICB9Cj4gKwo+ICsgICAgQVNTRVJUKChhbGln
biAmIChhbGlnbiAtIDEpKSA9PSAwKTsKPiArICAgIGlmICggYWxpZ24gPCBNRU1fQUxJR04gKQo+
ICsgICAgICAgIGFsaWduID0gTUVNX0FMSUdOOwo+ICsgICAgdG1wX3NpemUgPSBzaXplICsgYWxp
Z24gLSBNRU1fQUxJR047Cj4gKwo+ICsgICAgaWYgKCB0bXBfc2l6ZSA8IFBBR0VfU0laRSApCj4g
KyAgICAgICAgdG1wX3NpemUgPSAoIHRtcF9zaXplIDwgTUlOX0JMT0NLX1NJWkUgKSA/IE1JTl9C
TE9DS19TSVpFIDoKClN0cmF5IGJsYW5rcyBpbnNpZGUgcGFyZW50aGVzZXMuCgo+ICsgICAgICAg
ICAgICBST1VORFVQX1NJWkUodG1wX3NpemUpOwo+ICsKPiArICAgIGlmICggdG1wX3NpemUgPD0g
Y3Vycl9zaXplICYmICgodW5zaWduZWQgbG9uZylwdHIgJiAoYWxpZ24gLSAxKSkgPT0gMCApCj4g
KyAgICAgICAgcmV0dXJuIHB0cjsgLyogdGhlIHNpemUgYW5kIGFsaWdubWVudCBmaXQgaW4gYWxy
ZWFkeSBhbGxvY2F0ZWQgc3BhY2UgKi8KCllvdSBhbHNvIGRvbid0IHNlZW0gdG8gZXZlciB1cGRh
dGUgcHRyIGluIGNhc2UgeW91IHdhbnQgdG8gdXNlIHRoZQooaGVhZCkgcGFkZGluZywgaS5lLiB5
b3UnZCBoYW5kIGJhY2sgYSBwb2ludGVyIHRvIGEgYmxvY2sgd2hpY2ggdGhlCmNhbGxlciB3b3Vs
ZCBhc3N1bWUgZXh0ZW5kcyBwYXN0IGl0cyBhY3R1YWwgZW5kLiBJIHRoaW5rIHlvdSB3YW50CnRv
IGNhbGN1bGF0ZSB0aGUgbmV3IHRlbnRhdGl2ZSBwb2ludGVyICh0YWtpbmcgdGhlIHJlcXVlc3Rl
ZAphbGlnbm1lbnQgaW50byBhY2NvdW50KSwgYW5kIG9ubHkgZnJvbSB0aGF0IGNhbGN1bGF0ZSBj
dXJyX3NpemUKKHdoaWNoIHBlcmhhcHMgd291bGQgYmV0dGVyIGJlIG5hbWVkICJ1c2FibGUiIG9y
ICJzcGFjZSIgb3Igc29tZQpzdWNoKS4gT2J2aW91c2x5IHRoZSAoaGVhZCkgcGFkZGluZyBibG9j
ayBtYXkgbmVlZCB1cGRhdGluZywgdG9vLgoKPiArICAgIHAgPSBfeG1hbGxvYyhzaXplLCBhbGln
bik7Cj4gKyAgICBpZiAoIHAgKQo+ICsgICAgewo+ICsgICAgICAgIG1lbWNweShwLCBwdHIsIG1p
bihjdXJyX3NpemUsIHNpemUpKTsKPiArICAgICAgICB4ZnJlZShwdHIpOwo+ICsgICAgfQo+ICsK
PiArICAgIHJldHVybiBwOwo+ICt9CgpBcyBhIGZpbmFsIHJlbWFyayAtIGRpZCB5b3UgY29uc2lk
ZXIgemVybyg/KS1maWxsaW5nIHRoZSB0YWlsCnBvcnRpb24/IFdoaWxlIEMncyByZWFsbG9jKCkg
aXNuJ3Qgc3BlY2lmaWVkIHRvIGRvIHNvLCBzaW5jZSB0aGVyZSdzCm5vIChub3QgZ29pbmcgdG8g
YmUgYSkgemVyb2luZyBjb3VudGVycGFydCwgZG9pbmcgc28gbWF5IGJlIHNhZmVyCm92ZXJhbGwu
CgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
