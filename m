Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D5EBF151E
	for <lists+xen-devel@lfdr.de>; Wed,  6 Nov 2019 12:28:29 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iSJRl-0001GK-3t; Wed, 06 Nov 2019 11:25:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rf37=Y6=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1iSJRj-0001FF-Pf
 for xen-devel@lists.xenproject.org; Wed, 06 Nov 2019 11:25:55 +0000
X-Inumbo-ID: 320a497e-0088-11ea-9631-bc764e2007e4
Received: from mail-lj1-x243.google.com (unknown [2a00:1450:4864:20::243])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 320a497e-0088-11ea-9631-bc764e2007e4;
 Wed, 06 Nov 2019 11:25:55 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id q2so19096606ljg.7
 for <xen-devel@lists.xenproject.org>; Wed, 06 Nov 2019 03:25:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/qbKy+zX6ZTppWujVCb7mRyolNwd9TXaxr9dWmPtFVA=;
 b=tthyYmIAiWjOcFUOo/UYZ9YR8WXZwxZa/Jmlnc72tcYXIXoSL8xSZ4uAPsWO/TUj/c
 60RJIJR7ywqpqm5Y2TC/3Dq5f94F8zWAnZMHEgmetBWlwhFvxXDbU1UZjKV12ldiqHi5
 2UtTk501FmdIcqsXEq4ntYp+nUpOCgAY7KyRJAtpXrqYo9T8bWjeiKmssLvt2naf2d65
 AaGi1bDesbVh1xGlNkxHNtdRnT7JgSAb/vXABq1IiBpMIuxOD7vgHJY+HTizNpuOqJFq
 5E9+2nNE2SMbEGcBqRFhJR9pv/Bxh3K7n+2P5C5Go782I7YhMyA/WR84kZMgTjUWEXm5
 t+zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/qbKy+zX6ZTppWujVCb7mRyolNwd9TXaxr9dWmPtFVA=;
 b=DZEGlFezRj9/YwbUkAqPYGUs9oajjlVWvybZ1ahvdvrwD2s0eZyDr/uxPC0TdV0VYC
 XPExR58VTeurr1dEYIZ7mLNmVmaQ9w2xoSODwFcIXqzas9PZh8jbqJLeFj23uxSojxaD
 Mqjsfgr8wc8aTBwptZ8sD4awn5rmFsgPE8wwsxzTfB05NHFHOuUVN94Z2E9ZVHeU2Gvy
 By1lLPcSNi9StbB9WyKyWec0AxqMYVlmvPk0T07Mh785v5WJ5J2PdhXr9pIjB80HtRaY
 TVhgEqWNYHONvVlisnOhsrBn2VfSyOqa1PzoOf7+3gVQNEou5HrvJBaut+kkyaTgV8He
 0F/g==
X-Gm-Message-State: APjAAAX53PoXARNqasIb1zIWMsK1dhTIeAiETcpey6JWxXG0G2a/SLRL
 x8bO6lUYlvBXd2gYC+7+Wng=
X-Google-Smtp-Source: APXvYqwY7UcihHhYBkBjI/S2KjlOmrbNA7HTHM++KxXENCXvBG40678KefObOjyntBrl/429Sw4FYQ==
X-Received: by 2002:a2e:92c4:: with SMTP id k4mr1587707ljh.10.1573039553778;
 Wed, 06 Nov 2019 03:25:53 -0800 (PST)
Received: from [10.17.180.84] (ll-74.141.223.85.sovam.net.ua. [85.223.141.74])
 by smtp.gmail.com with ESMTPSA id
 m62sm7808071lfd.14.2019.11.06.03.25.51
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 06 Nov 2019 03:25:52 -0800 (PST)
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
References: <1568197942-15374-1-git-send-email-andrii.anisov@gmail.com>
 <1568197942-15374-3-git-send-email-andrii.anisov@gmail.com>
 <0bd624d0-adbc-c14f-54ad-26dae1f67bf6@arm.com>
From: Andrii Anisov <andrii.anisov@gmail.com>
Message-ID: <beec2cdd-aa44-0059-28cc-cb6cc3276aae@gmail.com>
Date: Wed, 6 Nov 2019 13:25:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <0bd624d0-adbc-c14f-54ad-26dae1f67bf6@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [RFC 2/9] sysctl: extend XEN_SYSCTL_getcpuinfo
 interface
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
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Andrii Anisov <andrii_anisov@epam.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Jan Beulich <jbeulich@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGVsbG8gSnVsaWVuCgpPbiAyOC4xMC4xOSAxNjo1MiwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhp
LAo+IAo+IE9uIDExLzA5LzIwMTkgMTE6MzIsIEFuZHJpaSBBbmlzb3Ygd3JvdGU6Cj4+IEZyb206
IEFuZHJpaSBBbmlzb3YgPGFuZHJpaV9hbmlzb3ZAZXBhbS5jb20+Cj4+Cj4+IEV4dGVuZCBYRU5f
U1lTQ1RMX2dldGNwdWluZm8gaW50ZXJmYWNlIHdpdGggdGltaW5nIGluZm9ybWF0aW9uCj4+IHBy
b3ZpZGVkIGJ5IGludHJvZHVjZWQgdGltZSBhY2NvdW50aW5nIGluZnJhc3RydWN0dXJlLgo+Pgo+
PiBTaWduZWQtb2ZmLWJ5OiBBbmRyaWkgQW5pc292IDxhbmRyaWlfYW5pc292QGVwYW0uY29tPgo+
PiAtLS0KPj4gwqAgeGVuL2NvbW1vbi9zY2hlZHVsZS5jwqDCoMKgwqDCoMKgIHwgMzMgKysrKysr
KysrKysrKysrKysrKysrKysrKysrKy0tLS0tCj4+IMKgIHhlbi9jb21tb24vc3lzY3RsLmPCoMKg
wqDCoMKgwqDCoMKgIHzCoCA0ICsrKysKPj4gwqAgeGVuL2luY2x1ZGUvcHVibGljL3N5c2N0bC5o
IHzCoCA0ICsrKysKPj4gwqAgeGVuL2luY2x1ZGUveGVuL3NjaGVkLmjCoMKgwqDCoCB8wqAgNCAr
KysrCj4+IMKgIDQgZmlsZXMgY2hhbmdlZCwgNDAgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMo
LSkKPj4KPj4gZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vc2NoZWR1bGUuYyBiL3hlbi9jb21tb24v
c2NoZWR1bGUuYwo+PiBpbmRleCA2ZGQ2NjAzLi4yMDA3MDM0IDEwMDY0NAo+PiAtLS0gYS94ZW4v
Y29tbW9uL3NjaGVkdWxlLmMKPj4gKysrIGIveGVuL2NvbW1vbi9zY2hlZHVsZS5jCj4+IEBAIC0y
MDgsMTMgKzIwOCwzNiBAQCB2b2lkIHZjcHVfcnVuc3RhdGVfZ2V0KHN0cnVjdCB2Y3B1ICp2LCBz
dHJ1Y3QgdmNwdV9ydW5zdGF0ZV9pbmZvICpydW5zdGF0ZSkKPj4gwqAgdWludDY0X3QgZ2V0X2Nw
dV9pZGxlX3RpbWUodW5zaWduZWQgaW50IGNwdSkKPj4gwqAgewo+PiAtwqDCoMKgIHN0cnVjdCB2
Y3B1X3J1bnN0YXRlX2luZm8gc3RhdGUgPSB7IDAgfTsKPj4gLcKgwqDCoCBzdHJ1Y3QgdmNwdSAq
diA9IGlkbGVfdmNwdVtjcHVdOwo+PiArwqDCoMKgIHN0cnVjdCB0YWNjICp0YWNjID0gJnBlcl9j
cHUodGFjYywgY3B1KTsKPj4gLcKgwqDCoCBpZiAoIGNwdV9vbmxpbmUoY3B1KSAmJiB2ICkKPj4g
LcKgwqDCoMKgwqDCoMKgIHZjcHVfcnVuc3RhdGVfZ2V0KHYsICZzdGF0ZSk7Cj4+ICvCoMKgwqAg
cmV0dXJuIHRhY2MtPnN0YXRlX3RpbWVbVEFDQ19JRExFXTsKPiAKPiBTbyB3aGF0J3MgdGhlIGRp
ZmZlcmVuY2UgYmV0d2VlbiB0aGUgY3VycmVudCBpZGxlIHRpbWUgYW5kIHRoZSBuZXcgdmVyc2lv
bj8KCkN1cnJlbnRseSwgaWRsZSB0aW1lIGlzIHRoZSBpZGxlIHZjcHUgcnVuIHRpbWUsIHdoYXQg
aW5jbHVkZXMgdGFza2xldHMsIHNjaGVkdWxpbmcsIGlycSBwcm9jZXNzaW5nIGV0Yy4KSU1PIGl0
IG1heSBjb25mdXNlIGNwdWZyZXEgYW5kIHBvd2VyIG1hbmFnZW1lbnQuCgo+IAo+PiArfQo+PiAr
Cj4+ICt1aW50NjRfdCBnZXRfY3B1X2d1ZXN0X3RpbWUodW5zaWduZWQgaW50IGNwdSkKPj4gK3sK
Pj4gK8KgwqDCoCBzdHJ1Y3QgdGFjYyAqdGFjYyA9ICZwZXJfY3B1KHRhY2MsIGNwdSk7Cj4+ICsK
Pj4gK8KgwqDCoCByZXR1cm4gdGFjYy0+c3RhdGVfdGltZVtUQUNDX0dVRVNUXTsKPj4gK30KPj4g
Kwo+PiArdWludDY0X3QgZ2V0X2NwdV9oeXBfdGltZSh1bnNpZ25lZCBpbnQgY3B1KQo+PiArewo+
PiArwqDCoMKgIHN0cnVjdCB0YWNjICp0YWNjID0gJnBlcl9jcHUodGFjYywgY3B1KTsKPj4gKwo+
PiArwqDCoMKgIHJldHVybiB0YWNjLT5zdGF0ZV90aW1lW1RBQ0NfSFlQXTsKPj4gK30KPj4gKwo+
PiArdWludDY0X3QgZ2V0X2NwdV9pcnFfdGltZSh1bnNpZ25lZCBpbnQgY3B1KQo+PiArewo+PiAr
wqDCoMKgIHN0cnVjdCB0YWNjICp0YWNjID0gJnBlcl9jcHUodGFjYywgY3B1KTsKPj4gKwo+PiAr
wqDCoMKgIHJldHVybiB0YWNjLT5zdGF0ZV90aW1lW1RBQ0NfSVJRXTsKPj4gK30KPj4gK3VpbnQ2
NF90IGdldF9jcHVfZ3N5bmNfdGltZSh1bnNpZ25lZCBpbnQgY3B1KQo+PiArewo+PiArwqDCoMKg
IHN0cnVjdCB0YWNjICp0YWNjID0gJnBlcl9jcHUodGFjYywgY3B1KTsKPj4gLcKgwqDCoCByZXR1
cm4gc3RhdGUudGltZVtSVU5TVEFURV9ydW5uaW5nXTsKPj4gK8KgwqDCoCByZXR1cm4gdGFjYy0+
c3RhdGVfdGltZVtUQUNDX0dTWU5DXTsKPj4gwqAgfQo+IAo+IFlvdSBtYXkgd2FudCB0byBpbnRy
b2R1Y2UgYW4gaGVscGVyIHJldHJpZXZpbmcgdGhlIHRpbWUgZm9yIGEgZ2l2ZW4gc3RhdGUgcmF0
aGVyIHRoYW4gZHVwbGljYXRpbmcgaXQuCgpZZXAuCgo+IAo+PiDCoCAvKgo+PiBkaWZmIC0tZ2l0
IGEveGVuL2NvbW1vbi9zeXNjdGwuYyBiL3hlbi9jb21tb24vc3lzY3RsLmMKPj4gaW5kZXggOTJi
NGVhMC4uYjYzMDgzYyAxMDA2NDQKPj4gLS0tIGEveGVuL2NvbW1vbi9zeXNjdGwuYwo+PiArKysg
Yi94ZW4vY29tbW9uL3N5c2N0bC5jCj4+IEBAIC0xNTIsNiArMTUyLDEwIEBAIGxvbmcgZG9fc3lz
Y3RsKFhFTl9HVUVTVF9IQU5ETEVfUEFSQU0oeGVuX3N5c2N0bF90KSB1X3N5c2N0bCkKPj4gwqDC
oMKgwqDCoMKgwqDCoMKgIGZvciAoIGkgPSAwOyBpIDwgbnJfY3B1czsgaSsrICkKPj4gwqDCoMKg
wqDCoMKgwqDCoMKgIHsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY3B1aW5mby5pZGxl
dGltZSA9IGdldF9jcHVfaWRsZV90aW1lKGkpOwo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBj
cHVpbmZvLmd1ZXN0dGltZSA9IGdldF9jcHVfZ3Vlc3RfdGltZShpKTsKPj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgY3B1aW5mby5oeXB0aW1lID0gZ2V0X2NwdV9oeXBfdGltZShpKTsKPj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgY3B1aW5mby5nc3luY3RpbWUgPSBnZXRfY3B1X2dzeW5jX3Rp
bWUoaSk7Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNwdWluZm8uaXJxdGltZSA9IGdldF9j
cHVfaXJxX3RpbWUoaSk7Cj4gCj4gSXQgZmVlbHMgdG8gbWUgd2Ugd2FudCBhIGZ1bmN0aW9uIHRo
YXQgZmlsbHMgdXAgdGhlIHN0cnVjdHVyZS4KCk1heWJlLgoKPiAKPj4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgaWYgKCBjb3B5X3RvX2d1ZXN0X29mZnNldChvcC0+dS5nZXRjcHVpbmZvLmlu
Zm8sIGksICZjcHVpbmZvLCAxKSApCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgZ290byBvdXQ7Cj4+IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9wdWJsaWMvc3lzY3RsLmgg
Yi94ZW4vaW5jbHVkZS9wdWJsaWMvc3lzY3RsLmgKPj4gaW5kZXggNTQwMWY5Yy4uY2RhZGExZiAx
MDA2NDQKPj4gLS0tIGEveGVuL2luY2x1ZGUvcHVibGljL3N5c2N0bC5oCj4+ICsrKyBiL3hlbi9p
bmNsdWRlL3B1YmxpYy9zeXNjdGwuaAo+IAo+IEFzIGEgc2lkZSBub3RlLCBTWVNDVEwgdmVyc2lv
biB3aWxsIG5lZWQgdG8gYmUgYnVtcGVkIGlmIHRoaXMgd2Fzbid0IGRvbmUgYmVmb3JlIGR1cmlu
ZyB0aGUgY3VycmVudCByZWxlYXNlLgo+IAo+PiBAQCAtMTY4LDYgKzE2OCwxMCBAQCBzdHJ1Y3Qg
eGVuX3N5c2N0bF9kZWJ1Z19rZXlzIHsKPj4gwqAgLyogWEVOX1NZU0NUTF9nZXRjcHVpbmZvICov
Cj4+IMKgIHN0cnVjdCB4ZW5fc3lzY3RsX2NwdWluZm8gewo+PiDCoMKgwqDCoMKgIHVpbnQ2NF9h
bGlnbmVkX3QgaWRsZXRpbWU7Cj4+ICvCoMKgwqAgdWludDY0X2FsaWduZWRfdCBoeXB0aW1lOwo+
PiArwqDCoMKgIHVpbnQ2NF9hbGlnbmVkX3QgZ3Vlc3R0aW1lOwo+PiArwqDCoMKgIHVpbnQ2NF9h
bGlnbmVkX3QgaXJxdGltZTsKPj4gK8KgwqDCoCB1aW50NjRfYWxpZ25lZF90IGdzeW5jdGltZTsK
Pj4gwqAgfTsKPj4gwqAgdHlwZWRlZiBzdHJ1Y3QgeGVuX3N5c2N0bF9jcHVpbmZvIHhlbl9zeXNj
dGxfY3B1aW5mb190Owo+PiDCoCBERUZJTkVfWEVOX0dVRVNUX0hBTkRMRSh4ZW5fc3lzY3RsX2Nw
dWluZm9fdCk7Cj4+IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS94ZW4vc2NoZWQuaCBiL3hlbi9p
bmNsdWRlL3hlbi9zY2hlZC5oCj4+IGluZGV4IDA0YTg3MjQuLjgxNjc2MDggMTAwNjQ0Cj4+IC0t
LSBhL3hlbi9pbmNsdWRlL3hlbi9zY2hlZC5oCj4+ICsrKyBiL3hlbi9pbmNsdWRlL3hlbi9zY2hl
ZC5oCj4+IEBAIC04NzYsNiArODc2LDEwIEBAIHZvaWQgcmVzdG9yZV92Y3B1X2FmZmluaXR5KHN0
cnVjdCBkb21haW4gKmQpOwo+PiDCoCB2b2lkIHZjcHVfcnVuc3RhdGVfZ2V0KHN0cnVjdCB2Y3B1
ICp2LCBzdHJ1Y3QgdmNwdV9ydW5zdGF0ZV9pbmZvICpydW5zdGF0ZSk7Cj4+IMKgIHVpbnQ2NF90
IGdldF9jcHVfaWRsZV90aW1lKHVuc2lnbmVkIGludCBjcHUpOwo+PiArdWludDY0X3QgZ2V0X2Nw
dV9oeXBfdGltZSh1bnNpZ25lZCBpbnQgY3B1KTsKPj4gK3VpbnQ2NF90IGdldF9jcHVfZ3Vlc3Rf
dGltZSh1bnNpZ25lZCBpbnQgY3B1KTsKPj4gK3VpbnQ2NF90IGdldF9jcHVfZ3N5bmNfdGltZSh1
bnNpZ25lZCBpbnQgY3B1KTsKPj4gK3VpbnQ2NF90IGdldF9jcHVfaXJxX3RpbWUodW5zaWduZWQg
aW50IGNwdSk7Cj4+IMKgIC8qCj4+IMKgwqAgKiBVc2VkIGJ5IGlkbGUgbG9vcCB0byBkZWNpZGUg
d2hldGhlciB0aGVyZSBpcyB3b3JrIHRvIGRvOgo+Pgo+IAo+IENoZWVycywKPiAKCi0tIApTaW5j
ZXJlbHksCkFuZHJpaSBBbmlzb3YuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
