Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52FDAAD84A
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2019 13:52:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7IAG-0002my-Is; Mon, 09 Sep 2019 11:49:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=NFaf=XE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i7IAF-0002ms-JE
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2019 11:48:59 +0000
X-Inumbo-ID: cee9ddd6-d2f7-11e9-b76c-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cee9ddd6-d2f7-11e9-b76c-bc764e2007e4;
 Mon, 09 Sep 2019 11:48:58 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id E1F02AD44;
 Mon,  9 Sep 2019 11:48:57 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <7f995809-c993-c7aa-1fed-c155912363c7@suse.com>
 <3fc94cce-0c85-c978-feb9-8bb9b875d14c@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8ade0941-d208-ef35-1603-9cad05c0dbe8@suse.com>
Date: Mon, 9 Sep 2019 13:49:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <3fc94cce-0c85-c978-feb9-8bb9b875d14c@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH RFC] x86/HVM: use single (atomic) MOV for
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
 Paul Durrant <paul.durrant@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkuMDkuMjAxOSAxMzowMiwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAwNS8wOS8yMDE5
IDE1OjA3LCBKYW4gQmV1bGljaCB3cm90ZToKPj4gVXNpbmcgbWVtY3B5KCkgbWF5IHJlc3VsdCBp
biBtdWx0aXBsZSBpbmRpdmlkdWFsIGJ5dGUgYWNjZXNzZXMKPj4gKGRlcGVuZGVuaW5nIGhvdyBt
ZW1jcHkoKSBpcyBpbXBsZW1lbnRlZCBhbmQgaG93IHRoZSByZXN1bHRpbmcgaW5zbnMsCj4+IGUu
Zy4gUkVQIE1PVlNCLCBnZXQgY2FycmllZCBvdXQgaW4gaGFyZHdhcmUpLCB3aGljaCBpc24ndCB3
aGF0IHdlCj4+IHdhbnQvbmVlZCBmb3IgY2Fycnlpbmcgb3V0IGd1ZXN0IGluc25zIGFzIGNvcnJl
Y3RseSBhcyBwb3NzaWJsZS4gRmFsbAo+PiBiYWNrIHRvIG1lbWNweSgpIG9ubHkgZm9yIG1pc2Fs
aWduZWQgYWNjZXNzZXMgYXMgd2VsbCBhcyBvbmVzIG5vdCAyLCA0LAo+PiBvciA4IGJ5dGVzIGlu
IHNpemUuCj4+Cj4+IFN1Z2dlc3RlZC1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNA
Y2l0cml4LmNvbT4KPj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2Uu
Y29tPgo+PiAtLS0KPj4gUkZDOiBCZXNpZGVzIHdhbnRpbmcgdG8gaGVhciBpZiB0aGlzIGlzIGNv
bnNpZGVyZWQgYWNjZXB0YWJsZSBhbmQKPj4gICAgICBzdWZmaWNpZW50IChvciB3aGV0aGVyIGl0
IGlzIHRob3VnaHQgdGhhdCB0aGUgbGluZWFyX3dyaXRlKCkgcGF0aAo+PiAgICAgIGFsc28gbmVl
ZHMgcGxheWluZyB3aXRoKSwgdGhlIHF1ZXN0aW9uIGlzIHdoZXRoZXIgd2UnZCB3YW50IHRvCj4+
ICAgICAgZXh0ZW5kIHRoaXMgdG8gcmVhZHMgYXMgd2VsbC4gbGluZWFyX3tyZWFkLHdyaXRlfSgp
IGN1cnJlbnRseSBkb24ndAo+PiAgICAgIHVzZSBodm1lbXVsX21hcF9saW5lYXJfYWRkcigpLCBp
LmUuIGluIGJvdGggY2FzZXMgSSdkIG5lZWQgdG8gYWxzbwo+PiAgICAgIGZpZGRsZSB3aXRoIF9f
aHZtX2NvcHkoKSAocGVyaGFwcyBieSBtYWtpbmcgdGhlIGNvbnN0cnVjdCBiZWxvdyBhCj4+ICAg
ICAgaGVscGVyIGZ1bmN0aW9uKS4KPj4KPj4gLS0tIGEveGVuL2FyY2gveDg2L2h2bS9lbXVsYXRl
LmMKPj4gKysrIGIveGVuL2FyY2gveDg2L2h2bS9lbXVsYXRlLmMKPj4gQEAgLTEzNTIsNyArMTM1
MiwxNCBAQCBzdGF0aWMgaW50IGh2bWVtdWxfd3JpdGUoCj4+ICAgICAgaWYgKCAhbWFwcGluZyAp
Cj4+ICAgICAgICAgIHJldHVybiBsaW5lYXJfd3JpdGUoYWRkciwgYnl0ZXMsIHBfZGF0YSwgcGZl
YywgaHZtZW11bF9jdHh0KTsKPj4gIAo+PiAtICAgIG1lbWNweShtYXBwaW5nLCBwX2RhdGEsIGJ5
dGVzKTsKPj4gKyAgICAvKiBGb3IgYWxpZ25lZCBhY2Nlc3NlcyB1c2Ugc2luZ2xlIChhbmQgaGVu
Y2UgYXRvbWljKSBNT1YgaW5zbnMuICovCj4+ICsgICAgc3dpdGNoICggYnl0ZXMgfCAoKHVuc2ln
bmVkIGxvbmcpbWFwcGluZyAmIChieXRlcyAtIDEpKSApCj4gCj4gV2h5IG9ubHkgZm9yIGFsaWdu
ZWQgdmFsdWVzP8KgIE1pc2FsaWduZWQgYXJlIGF0b21pYyBvbiBhbG1vc3QgYWxsIDY0LWJpdAo+
IGNhcGFibGUgc3lzdGVtcywgYW5kIG1hcHBpbmcgd2lsbCBjb3JyZWN0bHkgc3BhbiBhIHBhZ2Ug
Ym91bmRhcnkgaWYKPiBuZWNlc3NhcnkuCgpIbW0sIHN1cmUsIEkgY2FuIHJlbGF4IHRoaXMuCgo+
PiArICAgIHsKPj4gKyAgICBjYXNlIDI6IHdyaXRlX3UxNl9hdG9taWMobWFwcGluZywgKih1aW50
MTZfdCAqKXBfZGF0YSk7IGJyZWFrOwo+PiArICAgIGNhc2UgNDogd3JpdGVfdTMyX2F0b21pYyht
YXBwaW5nLCAqKHVpbnQzMl90ICopcF9kYXRhKTsgYnJlYWs7Cj4+ICsgICAgY2FzZSA4OiB3cml0
ZV91NjRfYXRvbWljKG1hcHBpbmcsICoodWludDY0X3QgKilwX2RhdGEpOyBicmVhazsKPj4gKyAg
ICBkZWZhdWx0OiBtZW1jcHkobWFwcGluZywgcF9kYXRhLCBieXRlcyk7ICAgICAgICAgICAgICAg
IGJyZWFrOwo+PiArICAgIH0KCkRvIHlvdSBoYXZlIGFuIG9waW5pb24gb24gd2hldGhlciB0byBo
YXZlICJjYXNlIDEiIGhlcmUgYXMgd2VsbCwgdG8KYXZvaWQgZ29pbmcgdGhyb3VnaCBtZW1jcHko
KT8KCkFsc28gZG8geW91IGhhdmUgYW55IG9waW5pb24gb24gdGhlIFJGQyBub3RlIGZ1cnRoZXIg
dXA/CgpUaGFua3MsIEphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
