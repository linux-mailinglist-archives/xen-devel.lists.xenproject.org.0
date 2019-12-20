Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D533F128099
	for <lists+xen-devel@lfdr.de>; Fri, 20 Dec 2019 17:25:35 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iiL39-0002EC-Ly; Fri, 20 Dec 2019 16:22:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=fFWP=2K=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iiL37-0002E5-KQ
 for xen-devel@lists.xenproject.org; Fri, 20 Dec 2019 16:22:45 +0000
X-Inumbo-ID: f1f9285c-2344-11ea-9392-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f1f9285c-2344-11ea-9392-12813bfff9fa;
 Fri, 20 Dec 2019 16:22:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 05E89B183;
 Fri, 20 Dec 2019 16:22:41 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <339bee59-b89b-b3fc-fb7d-114e8ffe1716@suse.com>
Message-ID: <e06491b8-58cc-46b1-3f79-d06d6765d089@suse.com>
Date: Fri, 20 Dec 2019 17:23:10 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <339bee59-b89b-b3fc-fb7d-114e8ffe1716@suse.com>
Content-Language: en-US
Subject: [Xen-devel] Ping: [PATCH] x86/HVM: use single (atomic) MOV for
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTYuMDkuMjAxOSAxMTo0MCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gVXNpbmcgbWVtY3B5KCkg
bWF5IHJlc3VsdCBpbiBtdWx0aXBsZSBpbmRpdmlkdWFsIGJ5dGUgYWNjZXNzZXMKPiAoZGVwZW5k
ZW5pbmcgaG93IG1lbWNweSgpIGlzIGltcGxlbWVudGVkIGFuZCBob3cgdGhlIHJlc3VsdGluZyBp
bnNucywKPiBlLmcuIFJFUCBNT1ZTQiwgZ2V0IGNhcnJpZWQgb3V0IGluIGhhcmR3YXJlKSwgd2hp
Y2ggaXNuJ3Qgd2hhdCB3ZQo+IHdhbnQvbmVlZCBmb3IgY2Fycnlpbmcgb3V0IGd1ZXN0IGluc25z
IGFzIGNvcnJlY3RseSBhcyBwb3NzaWJsZS4gRmFsbAo+IGJhY2sgdG8gbWVtY3B5KCkgb25seSBm
b3IgYWNjZXNzZXMgbm90IDIsIDQsIG9yIDggYnl0ZXMgaW4gc2l6ZS4KPiAKPiBTdWdnZXN0ZWQt
Ynk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Cj4gU2lnbmVkLW9m
Zi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+IC0tLQo+IFRCRDogQmVzaWRl
cyBpdCBzdGlsbCBiZWluZyBvcGVuIHdoZXRoZXIgdGhlIGxpbmVhcl93cml0ZSgpIHBhdGggYWxz
bwo+ICAgICAgbmVlZHMgcGxheWluZyB3aXRoLCBhIHF1ZXN0aW9uIGFsc28gY29udGludWVzIHRv
IGJlIHdoZXRoZXIgd2UnZAo+ICAgICAgd2FudCB0byBleHRlbmQgdGhpcyB0byByZWFkcyBhcyB3
ZWxsLiBsaW5lYXJfe3JlYWQsd3JpdGV9KCkKPiAgICAgIGN1cnJlbnRseSBkb24ndCB1c2UgaHZt
ZW11bF9tYXBfbGluZWFyX2FkZHIoKSwgaS5lLiBpbiBib3RoIGNhc2VzCj4gICAgICBJJ2QgbmVl
ZCB0byBhbHNvIGZpZGRsZSB3aXRoIF9faHZtX2NvcHkoKSAocGVyaGFwcyBieSBtYWtpbmcgdGhl
Cj4gICAgICBjb25zdHJ1Y3QgYmVsb3cgYSBoZWxwZXIgZnVuY3Rpb24pLgo+IAo+IC0tLSBhL3hl
bi9hcmNoL3g4Ni9odm0vZW11bGF0ZS5jCj4gKysrIGIveGVuL2FyY2gveDg2L2h2bS9lbXVsYXRl
LmMKPiBAQCAtMTMyNCw3ICsxMzI0LDE0IEBAIHN0YXRpYyBpbnQgaHZtZW11bF93cml0ZSgKPiAg
ICAgIGlmICggIW1hcHBpbmcgKQo+ICAgICAgICAgIHJldHVybiBsaW5lYXJfd3JpdGUoYWRkciwg
Ynl0ZXMsIHBfZGF0YSwgcGZlYywgaHZtZW11bF9jdHh0KTsKPiAgCj4gLSAgICBtZW1jcHkobWFw
cGluZywgcF9kYXRhLCBieXRlcyk7Cj4gKyAgICAvKiBXaGVyZSBwb3NzaWJsZSB1c2Ugc2luZ2xl
IChhbmQgaGVuY2UgZ2VuZXJhbGx5IGF0b21pYykgTU9WIGluc25zLiAqLwo+ICsgICAgc3dpdGNo
ICggYnl0ZXMgKQo+ICsgICAgewo+ICsgICAgY2FzZSAyOiB3cml0ZV91MTZfYXRvbWljKG1hcHBp
bmcsICoodWludDE2X3QgKilwX2RhdGEpOyBicmVhazsKPiArICAgIGNhc2UgNDogd3JpdGVfdTMy
X2F0b21pYyhtYXBwaW5nLCAqKHVpbnQzMl90ICopcF9kYXRhKTsgYnJlYWs7Cj4gKyAgICBjYXNl
IDg6IHdyaXRlX3U2NF9hdG9taWMobWFwcGluZywgKih1aW50NjRfdCAqKXBfZGF0YSk7IGJyZWFr
Owo+ICsgICAgZGVmYXVsdDogbWVtY3B5KG1hcHBpbmcsIHBfZGF0YSwgYnl0ZXMpOyAgICAgICAg
ICAgICAgICBicmVhazsKPiArICAgIH0KPiAgCj4gICAgICBodm1lbXVsX3VubWFwX2xpbmVhcl9h
ZGRyKG1hcHBpbmcsIGFkZHIsIGJ5dGVzLCBodm1lbXVsX2N0eHQpOwo+ICAKPiAKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
