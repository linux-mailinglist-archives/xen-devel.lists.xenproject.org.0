Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC37CB3758
	for <lists+xen-devel@lfdr.de>; Mon, 16 Sep 2019 11:43:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i9nUq-0004Z4-9q; Mon, 16 Sep 2019 09:40:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ZJ1s=XL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i9nUp-0004Yy-MX
 for xen-devel@lists.xenproject.org; Mon, 16 Sep 2019 09:40:35 +0000
X-Inumbo-ID: 0762157a-d866-11e9-978d-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0762157a-d866-11e9-978d-bc764e2007e4;
 Mon, 16 Sep 2019 09:40:33 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D0FD5AF2C;
 Mon, 16 Sep 2019 09:40:32 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <339bee59-b89b-b3fc-fb7d-114e8ffe1716@suse.com>
Date: Mon, 16 Sep 2019 11:40:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Language: en-US
Subject: [Xen-devel] [PATCH] x86/HVM: use single (atomic) MOV for aligned
 emulated writes
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VXNpbmcgbWVtY3B5KCkgbWF5IHJlc3VsdCBpbiBtdWx0aXBsZSBpbmRpdmlkdWFsIGJ5dGUgYWNj
ZXNzZXMKKGRlcGVuZGVuaW5nIGhvdyBtZW1jcHkoKSBpcyBpbXBsZW1lbnRlZCBhbmQgaG93IHRo
ZSByZXN1bHRpbmcgaW5zbnMsCmUuZy4gUkVQIE1PVlNCLCBnZXQgY2FycmllZCBvdXQgaW4gaGFy
ZHdhcmUpLCB3aGljaCBpc24ndCB3aGF0IHdlCndhbnQvbmVlZCBmb3IgY2Fycnlpbmcgb3V0IGd1
ZXN0IGluc25zIGFzIGNvcnJlY3RseSBhcyBwb3NzaWJsZS4gRmFsbApiYWNrIHRvIG1lbWNweSgp
IG9ubHkgZm9yIGFjY2Vzc2VzIG5vdCAyLCA0LCBvciA4IGJ5dGVzIGluIHNpemUuCgpTdWdnZXN0
ZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+ClNpZ25lZC1v
ZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KLS0tClRCRDogQmVzaWRlcyBp
dCBzdGlsbCBiZWluZyBvcGVuIHdoZXRoZXIgdGhlIGxpbmVhcl93cml0ZSgpIHBhdGggYWxzbwog
ICAgIG5lZWRzIHBsYXlpbmcgd2l0aCksIGEgcXVlc3Rpb24gYWxzbyBjb250aW51ZXMgdG8gYmUg
d2hldGhlciB3ZSdkCiAgICAgd2FudCB0byBleHRlbmQgdGhpcyB0byByZWFkcyBhcyB3ZWxsLiBs
aW5lYXJfe3JlYWQsd3JpdGV9KCkKICAgICBjdXJyZW50bHkgZG9uJ3QgdXNlIGh2bWVtdWxfbWFw
X2xpbmVhcl9hZGRyKCksIGkuZS4gaW4gYm90aCBjYXNlcwogICAgIEknZCBuZWVkIHRvIGFsc28g
ZmlkZGxlIHdpdGggX19odm1fY29weSgpIChwZXJoYXBzIGJ5IG1ha2luZyB0aGUKICAgICBjb25z
dHJ1Y3QgYmVsb3cgYSBoZWxwZXIgZnVuY3Rpb24pLgoKLS0tIGEveGVuL2FyY2gveDg2L2h2bS9l
bXVsYXRlLmMKKysrIGIveGVuL2FyY2gveDg2L2h2bS9lbXVsYXRlLmMKQEAgLTEzMjQsNyArMTMy
NCwxNCBAQCBzdGF0aWMgaW50IGh2bWVtdWxfd3JpdGUoCiAgICAgaWYgKCAhbWFwcGluZyApCiAg
ICAgICAgIHJldHVybiBsaW5lYXJfd3JpdGUoYWRkciwgYnl0ZXMsIHBfZGF0YSwgcGZlYywgaHZt
ZW11bF9jdHh0KTsKIAotICAgIG1lbWNweShtYXBwaW5nLCBwX2RhdGEsIGJ5dGVzKTsKKyAgICAv
KiBXaGVyZSBwb3NzaWJsZSB1c2Ugc2luZ2xlIChhbmQgaGVuY2UgZ2VuZXJhbGx5IGF0b21pYykg
TU9WIGluc25zLiAqLworICAgIHN3aXRjaCAoIGJ5dGVzICkKKyAgICB7CisgICAgY2FzZSAyOiB3
cml0ZV91MTZfYXRvbWljKG1hcHBpbmcsICoodWludDE2X3QgKilwX2RhdGEpOyBicmVhazsKKyAg
ICBjYXNlIDQ6IHdyaXRlX3UzMl9hdG9taWMobWFwcGluZywgKih1aW50MzJfdCAqKXBfZGF0YSk7
IGJyZWFrOworICAgIGNhc2UgODogd3JpdGVfdTY0X2F0b21pYyhtYXBwaW5nLCAqKHVpbnQ2NF90
ICopcF9kYXRhKTsgYnJlYWs7CisgICAgZGVmYXVsdDogbWVtY3B5KG1hcHBpbmcsIHBfZGF0YSwg
Ynl0ZXMpOyAgICAgICAgICAgICAgICBicmVhazsKKyAgICB9CiAKICAgICBodm1lbXVsX3VubWFw
X2xpbmVhcl9hZGRyKG1hcHBpbmcsIGFkZHIsIGJ5dGVzLCBodm1lbXVsX2N0eHQpOwogCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
