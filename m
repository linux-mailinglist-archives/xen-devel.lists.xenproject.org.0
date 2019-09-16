Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFE09B3D42
	for <lists+xen-devel@lfdr.de>; Mon, 16 Sep 2019 17:06:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i9sXR-0004IN-1l; Mon, 16 Sep 2019 15:03:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xTZH=XL=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1i9sXP-0004I8-NT
 for xen-devel@lists.xenproject.org; Mon, 16 Sep 2019 15:03:35 +0000
X-Inumbo-ID: 255cdf38-d893-11e9-b76c-bc764e2007e4
Received: from mail-lj1-x242.google.com (unknown [2a00:1450:4864:20::242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 255cdf38-d893-11e9-b76c-bc764e2007e4;
 Mon, 16 Sep 2019 15:03:31 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id s19so249321lji.6
 for <xen-devel@lists.xenproject.org>; Mon, 16 Sep 2019 08:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=WauWqapxuO7jna3UcU/iQL15RYvXvHCZTK1HS8CzCKc=;
 b=E9tpFxgaf7CO3mAlMBESi5zqDQCs63z0IKxInez2pxvZxXNb+VxZ++nSy9tYCF0hax
 sJC+hm6f5oGWWDdUbeGjAYnRsdQCzFaj6Mi3Q6X6fd9pQ2sex//DSxTJ6DmAA7nLQj0Y
 D2J4yjlD+DREpuFgtj0qK4dSgLJ3PBg8BywzdOeeCWCWyJJ35CI2NHL3IKtNVO1wEylu
 1T8HWfMtGKclYy0da4GD4P08oU2orFVpg3F4wS5LLHgChRZXFyhi00wiFMwkOTjWyISx
 f+849zXiK36EXGu37HGJNLkq+5Kwtjjz0eIW8Ygd+qc5VGK9si240NqFtnhGHfCETR+P
 ixRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=WauWqapxuO7jna3UcU/iQL15RYvXvHCZTK1HS8CzCKc=;
 b=aLVkx7CqxdxFDCT48jORQEiu98OzRpjcCUcY8opGjuf4crf06JmLtUF51Ym00nc3j2
 Gk4Sjp/+2+WB+M4eau0+WS4+nmGjR0sdmr3BweQRF3yy9WqhQhdGr6oPpGk3kX6FaB9q
 plWiJ3sEorIu8Wou+qlchtGsY+7TlpGkpVP3hrvJ/VSnnc8cod2UsMYbNaTosJfgQk8q
 CCL6pTgnBbV8dTtrcqWCwEj3Y1yYIvFvc5kAkVe1FlXW4Vr+waEts+R0b8dtMiFIpJcT
 WsK7+Ovk6uccM3J6yP69P1aDC5jRz6TXKBjP69U6EDNkafZLwYLs8KgZD8cTlXkw1Qpr
 /KPw==
X-Gm-Message-State: APjAAAUAwBh8xn1r1SvlG1cKWnST575voRVomVXRXtQwnFZD/f47QASM
 sSD6JTzTz6UhU5MzKedSBIs=
X-Google-Smtp-Source: APXvYqwrmILGp/YIzrFTlJPseepz0xF8adDMBtdmRzDIojdgRPaasbinsctunrw20P6Nk8qNUhM3aw==
X-Received: by 2002:a2e:9081:: with SMTP id l1mr56884ljg.33.1568646210093;
 Mon, 16 Sep 2019 08:03:30 -0700 (PDT)
Received: from [10.17.182.120] (ll-74.141.223.85.sovam.net.ua. [85.223.141.74])
 by smtp.gmail.com with ESMTPSA id l9sm8279757ljg.79.2019.09.16.08.03.28
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 16 Sep 2019 08:03:29 -0700 (PDT)
To: Jan Beulich <jbeulich@suse.com>
References: <1568388917-7287-1-git-send-email-olekstysh@gmail.com>
 <1568388917-7287-5-git-send-email-olekstysh@gmail.com>
 <81c2099d-ee08-2e0a-134c-0a9889748ac8@suse.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <0021c5ab-457e-7cbf-a5c7-7d8676503116@gmail.com>
Date: Mon, 16 Sep 2019 18:03:28 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <81c2099d-ee08-2e0a-134c-0a9889748ac8@suse.com>
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ck9uIDE2LjA5LjE5IDEzOjEzLCBKYW4gQmV1bGljaCB3cm90ZToKCkhpLCBKYW4KCj4gT24gMTMu
MDkuMjAxOSAxNzozNSwgT2xla3NhbmRyIFR5c2hjaGVua28gd3JvdGU6Cj4+IC0tLSBhL3hlbi9j
b21tb24veG1hbGxvY190bHNmLmMKPj4gKysrIGIveGVuL2NvbW1vbi94bWFsbG9jX3Rsc2YuYwo+
PiBAQCAtNTk4LDYgKzU5OCw1OCBAQCB2b2lkICpfeHphbGxvYyh1bnNpZ25lZCBsb25nIHNpemUs
IHVuc2lnbmVkIGxvbmcgYWxpZ24pCj4+ICAgICAgIHJldHVybiBwID8gbWVtc2V0KHAsIDAsIHNp
emUpIDogcDsKPj4gICB9Cj4+ICAgCj4+ICt2b2lkICpfeHJlYWxsb2Modm9pZCAqcHRyLCB1bnNp
Z25lZCBsb25nIHNpemUsIHVuc2lnbmVkIGxvbmcgYWxpZ24pCj4+ICt7Cj4+ICsgICAgdW5zaWdu
ZWQgbG9uZyBjdXJyX3NpemUsIHRtcF9zaXplOwo+PiArICAgIHZvaWQgKnA7Cj4+ICsKPj4gKyAg
ICBpZiAoICFzaXplICkKPj4gKyAgICB7Cj4+ICsgICAgICAgIHhmcmVlKHB0cik7Cj4+ICsgICAg
ICAgIHJldHVybiBaRVJPX0JMT0NLX1BUUjsKPj4gKyAgICB9Cj4+ICsKPj4gKyAgICBpZiAoIHB0
ciA9PSBOVUxMIHx8IHB0ciA9PSBaRVJPX0JMT0NLX1BUUiApCj4+ICsgICAgICAgIHJldHVybiBf
eG1hbGxvYyhzaXplLCBhbGlnbik7Cj4+ICsKPj4gKyAgICBpZiAoICEoKHVuc2lnbmVkIGxvbmcp
cHRyICYgKFBBR0VfU0laRSAtIDEpKSApCj4+ICsgICAgICAgIGN1cnJfc2l6ZSA9IFBGTl9PUkRF
Uih2aXJ0X3RvX3BhZ2UocHRyKSkgPDwgUEFHRV9TSElGVDsKPiBXaGlsZSB0aGUgcHJlc2VudCBN
QVhfT1JERVIgc2V0dGluZyB3aWxsIHByZXZlbnQgYWxsb2NhdGlvbnMgb2YKPiA0R2lCIG9yIGFi
b3ZlIGZyb20gc3VjY2VlZGluZywgbWF5IEkgYXNrIHRoYXQgeW91IGRvbid0IGludHJvZHVjZQo+
IGxhdGVudCBpc3N1ZXMgaW4gY2FzZSBNQVhfT1JERVIgd291bGQgZXZlciBuZWVkIGJ1bXBpbmc/
ClN1cmUgKEkgYXNzdW1lLCB5b3UgYXJlIHRhbGtpbmcgYWJvdXQgcG9zc2libGUgdHJ1bmNhdGlv
bik6CgppZiAoICEoKHVuc2lnbmVkIGxvbmcpcHRyICYgKFBBR0VfU0laRSAtIDEpKSApCiDCoMKg
wqAgY3Vycl9zaXplID0gKHVuc2lnbmVkIGxvbmcpUEZOX09SREVSKHZpcnRfdG9fcGFnZShwdHIp
KSA8PCBQQUdFX1NISUZUOwoKCj4KPj4gKyAgICBlbHNlCj4+ICsgICAgewo+PiArICAgICAgICBz
dHJ1Y3QgYmhkciAqYiA9IChzdHJ1Y3QgYmhkciAqKSgoY2hhciAqKXB0ciAtIEJIRFJfT1ZFUkhF
QUQpOwo+PiArCj4+ICsgICAgICAgIGlmICggYi0+c2l6ZSAmIEZSRUVfQkxPQ0sgKQo+PiArICAg
ICAgICB7Cj4+ICsgICAgICAgICAgICBwID0gKGNoYXIgKilwdHIgLSAoYi0+c2l6ZSAmIH5GUkVF
X0JMT0NLKTsKPj4gKyAgICAgICAgICAgIGIgPSAoc3RydWN0IGJoZHIgKikoKGNoYXIgKilwIC0g
QkhEUl9PVkVSSEVBRCk7Cj4+ICsgICAgICAgICAgICBBU1NFUlQoIShiLT5zaXplICYgRlJFRV9C
TE9DSykpOwo+PiArICAgICAgICB9Cj4gVGhpcyBtYXRjaGVzIHRoZSByZXNwZWN0aXZlIHhmcmVl
KCkgY29kZSBmcmFnbWVudCwgYW5kIG5lZWRzIHRvCj4gcmVtYWluIGluIHN5bmMuIFdoaWNoIHN1
Z2dlc3RzIGludHJvZHVjaW5nIGEgaGVscGVyIGZ1bmN0aW9uCj4gaW5zdGVhZCBvZiBkdXBsaWNh
dGluZyB0aGUgY29kZS4gQW5kIHBsZWFzZSBvbWl0IHRoZSB1bm5lY2Vzc2FyeQo+IGNhc3RzIHRv
IGNoYXIgKi4KClNvdW5kcyByZWFzb25hYmxlLCB3aWxsIGRvLgoKCj4KPj4gKyAgICAgICAgY3Vy
cl9zaXplID0gYi0+c2l6ZSAmIEJMT0NLX1NJWkVfTUFTSzsKPiBfeG1hbGxvYygpIGhhcwo+Cj4g
ICAgICAgICAgYi0+c2l6ZSA9IHBhZCB8IEZSRUVfQkxPQ0s7Cj4KPiBpLmUuIGFpdWkgd2hhdCB5
b3UgY2FsY3VsYXRlIGFib3ZlIGlzIHRoZSBwYWRkaW5nIHNpemUsIG5vdCB0aGUKPiBvdmVyYWxs
IGJsb2NrIHNpemUuCgpJIGhhdmUgdG8gYWRtaXQgdGhhdCBJIGFtIG5vdCBmYW1pbGlhciB3aXRo
IGFsbG9jYXRvciBpbnRlcm5hbHMgZW5vdWdoLCBidXQKCkkgbWVhbnQgdG8gY2FsY3VsYXRlIG92
ZXJhbGwgYmxvY2sgc2l6ZSAodGhlIGFsaWdubWVudCBwYWRkaW5nIGlzIApzdHJpcHBlZCBpZiBw
cmVzZW50KS4uLgoKCj4+ICsgICAgfQo+PiArCj4+ICsgICAgQVNTRVJUKChhbGlnbiAmIChhbGln
biAtIDEpKSA9PSAwKTsKPj4gKyAgICBpZiAoIGFsaWduIDwgTUVNX0FMSUdOICkKPj4gKyAgICAg
ICAgYWxpZ24gPSBNRU1fQUxJR047Cj4+ICsgICAgdG1wX3NpemUgPSBzaXplICsgYWxpZ24gLSBN
RU1fQUxJR047Cj4+ICsKPj4gKyAgICBpZiAoIHRtcF9zaXplIDwgUEFHRV9TSVpFICkKPj4gKyAg
ICAgICAgdG1wX3NpemUgPSAoIHRtcF9zaXplIDwgTUlOX0JMT0NLX1NJWkUgKSA/IE1JTl9CTE9D
S19TSVpFIDoKPiBTdHJheSBibGFua3MgaW5zaWRlIHBhcmVudGhlc2VzLgoKb2sKCgo+Cj4+ICsg
ICAgICAgICAgICBST1VORFVQX1NJWkUodG1wX3NpemUpOwo+PiArCj4+ICsgICAgaWYgKCB0bXBf
c2l6ZSA8PSBjdXJyX3NpemUgJiYgKCh1bnNpZ25lZCBsb25nKXB0ciAmIChhbGlnbiAtIDEpKSA9
PSAwICkKPj4gKyAgICAgICAgcmV0dXJuIHB0cjsgLyogdGhlIHNpemUgYW5kIGFsaWdubWVudCBm
aXQgaW4gYWxyZWFkeSBhbGxvY2F0ZWQgc3BhY2UgKi8KPiBZb3UgYWxzbyBkb24ndCBzZWVtIHRv
IGV2ZXIgdXBkYXRlIHB0ciBpbiBjYXNlIHlvdSB3YW50IHRvIHVzZSB0aGUKPiAoaGVhZCkgcGFk
ZGluZywgaS5lLiB5b3UnZCBoYW5kIGJhY2sgYSBwb2ludGVyIHRvIGEgYmxvY2sgd2hpY2ggdGhl
Cj4gY2FsbGVyIHdvdWxkIGFzc3VtZSBleHRlbmRzIHBhc3QgaXRzIGFjdHVhbCBlbmQuIEkgdGhp
bmsgeW91IHdhbnQKPiB0byBjYWxjdWxhdGUgdGhlIG5ldyB0ZW50YXRpdmUgcG9pbnRlciAodGFr
aW5nIHRoZSByZXF1ZXN0ZWQKPiBhbGlnbm1lbnQgaW50byBhY2NvdW50KSwgYW5kIG9ubHkgZnJv
bSB0aGF0IGNhbGN1bGF0ZSBjdXJyX3NpemUKPiAod2hpY2ggcGVyaGFwcyB3b3VsZCBiZXR0ZXIg
YmUgbmFtZWQgInVzYWJsZSIgb3IgInNwYWNlIiBvciBzb21lCj4gc3VjaCkuIE9idmlvdXNseSB0
aGUgKGhlYWQpIHBhZGRpbmcgYmxvY2sgbWF5IG5lZWQgdXBkYXRpbmcsIHRvby4KCkkgYW0gYWZy
YWlkIEkgZG9uJ3QgY29tcGxldGVseSB1bmRlcnN0YW5kIHlvdXIgcG9pbnQgaGVyZS4gQW5kIHNv
cnJ5IGZvciAKdGhlIG1heWJlIG5haXZlIHF1ZXN0aW9uLCBidXQgd2hhdCBpcyB0aGUgIihoZWFk
KSBwYWRkaW5nIiBoZXJlPwoKCj4+ICsgICAgcCA9IF94bWFsbG9jKHNpemUsIGFsaWduKTsKPj4g
KyAgICBpZiAoIHAgKQo+PiArICAgIHsKPj4gKyAgICAgICAgbWVtY3B5KHAsIHB0ciwgbWluKGN1
cnJfc2l6ZSwgc2l6ZSkpOwo+PiArICAgICAgICB4ZnJlZShwdHIpOwo+PiArICAgIH0KPj4gKwo+
PiArICAgIHJldHVybiBwOwo+PiArfQo+IEFzIGEgZmluYWwgcmVtYXJrIC0gZGlkIHlvdSBjb25z
aWRlciB6ZXJvKD8pLWZpbGxpbmcgdGhlIHRhaWwKPiBwb3J0aW9uPyBXaGlsZSBDJ3MgcmVhbGxv
YygpIGlzbid0IHNwZWNpZmllZCB0byBkbyBzbywgc2luY2UgdGhlcmUncwo+IG5vIChub3QgZ29p
bmcgdG8gYmUgYSkgemVyb2luZyBjb3VudGVycGFydCwgZG9pbmcgc28gbWF5IGJlIHNhZmVyCj4g
b3ZlcmFsbC4KClByb2JhYmx5LCB3b3J0aCBkb2luZy4gV2lsbCB6ZXJvIGl0LgoKCi0tIApSZWdh
cmRzLAoKT2xla3NhbmRyIFR5c2hjaGVua28KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
