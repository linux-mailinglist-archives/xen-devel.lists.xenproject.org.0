Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16A38AA582
	for <lists+xen-devel@lfdr.de>; Thu,  5 Sep 2019 16:11:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5sQN-0001CL-Ka; Thu, 05 Sep 2019 14:07:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ezPI=XA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i5sQM-0001CD-Fh
 for xen-devel@lists.xenproject.org; Thu, 05 Sep 2019 14:07:46 +0000
X-Inumbo-ID: 887afc18-cfe6-11e9-b299-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 887afc18-cfe6-11e9-b299-bc764e2007e4;
 Thu, 05 Sep 2019 14:07:45 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id A3073B65E;
 Thu,  5 Sep 2019 14:07:44 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7f995809-c993-c7aa-1fed-c155912363c7@suse.com>
Date: Thu, 5 Sep 2019 16:07:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
Content-Language: en-US
Subject: [Xen-devel] [PATCH RFC] x86/HVM: use single (atomic) MOV for
 aligned emulated writes
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <paul.durrant@citrix.com>, Wei Liu <wl@xen.org>,
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
IG9ubHkgZm9yIG1pc2FsaWduZWQgYWNjZXNzZXMgYXMgd2VsbCBhcyBvbmVzIG5vdCAyLCA0LApv
ciA4IGJ5dGVzIGluIHNpemUuCgpTdWdnZXN0ZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5j
b29wZXIzQGNpdHJpeC5jb20+ClNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBz
dXNlLmNvbT4KLS0tClJGQzogQmVzaWRlcyB3YW50aW5nIHRvIGhlYXIgaWYgdGhpcyBpcyBjb25z
aWRlcmVkIGFjY2VwdGFibGUgYW5kCiAgICAgc3VmZmljaWVudCAob3Igd2hldGhlciBpdCBpcyB0
aG91Z2h0IHRoYXQgdGhlIGxpbmVhcl93cml0ZSgpIHBhdGgKICAgICBhbHNvIG5lZWRzIHBsYXlp
bmcgd2l0aCksIHRoZSBxdWVzdGlvbiBpcyB3aGV0aGVyIHdlJ2Qgd2FudCB0bwogICAgIGV4dGVu
ZCB0aGlzIHRvIHJlYWRzIGFzIHdlbGwuIGxpbmVhcl97cmVhZCx3cml0ZX0oKSBjdXJyZW50bHkg
ZG9uJ3QKICAgICB1c2UgaHZtZW11bF9tYXBfbGluZWFyX2FkZHIoKSwgaS5lLiBpbiBib3RoIGNh
c2VzIEknZCBuZWVkIHRvIGFsc28KICAgICBmaWRkbGUgd2l0aCBfX2h2bV9jb3B5KCkgKHBlcmhh
cHMgYnkgbWFraW5nIHRoZSBjb25zdHJ1Y3QgYmVsb3cgYQogICAgIGhlbHBlciBmdW5jdGlvbiku
CgotLS0gYS94ZW4vYXJjaC94ODYvaHZtL2VtdWxhdGUuYworKysgYi94ZW4vYXJjaC94ODYvaHZt
L2VtdWxhdGUuYwpAQCAtMTM1Miw3ICsxMzUyLDE0IEBAIHN0YXRpYyBpbnQgaHZtZW11bF93cml0
ZSgKICAgICBpZiAoICFtYXBwaW5nICkKICAgICAgICAgcmV0dXJuIGxpbmVhcl93cml0ZShhZGRy
LCBieXRlcywgcF9kYXRhLCBwZmVjLCBodm1lbXVsX2N0eHQpOwogCi0gICAgbWVtY3B5KG1hcHBp
bmcsIHBfZGF0YSwgYnl0ZXMpOworICAgIC8qIEZvciBhbGlnbmVkIGFjY2Vzc2VzIHVzZSBzaW5n
bGUgKGFuZCBoZW5jZSBhdG9taWMpIE1PViBpbnNucy4gKi8KKyAgICBzd2l0Y2ggKCBieXRlcyB8
ICgodW5zaWduZWQgbG9uZyltYXBwaW5nICYgKGJ5dGVzIC0gMSkpICkKKyAgICB7CisgICAgY2Fz
ZSAyOiB3cml0ZV91MTZfYXRvbWljKG1hcHBpbmcsICoodWludDE2X3QgKilwX2RhdGEpOyBicmVh
azsKKyAgICBjYXNlIDQ6IHdyaXRlX3UzMl9hdG9taWMobWFwcGluZywgKih1aW50MzJfdCAqKXBf
ZGF0YSk7IGJyZWFrOworICAgIGNhc2UgODogd3JpdGVfdTY0X2F0b21pYyhtYXBwaW5nLCAqKHVp
bnQ2NF90ICopcF9kYXRhKTsgYnJlYWs7CisgICAgZGVmYXVsdDogbWVtY3B5KG1hcHBpbmcsIHBf
ZGF0YSwgYnl0ZXMpOyAgICAgICAgICAgICAgICBicmVhazsKKyAgICB9CiAKICAgICBodm1lbXVs
X3VubWFwX2xpbmVhcl9hZGRyKG1hcHBpbmcsIGFkZHIsIGJ5dGVzLCBodm1lbXVsX2N0eHQpOwog
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
