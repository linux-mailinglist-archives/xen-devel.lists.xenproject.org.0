Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7018DA6924
	for <lists+xen-devel@lfdr.de>; Tue,  3 Sep 2019 14:59:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i58Mi-000061-RH; Tue, 03 Sep 2019 12:56:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=CRa/=W6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i58Mh-00005w-Qb
 for xen-devel@lists.xenproject.org; Tue, 03 Sep 2019 12:56:55 +0000
X-Inumbo-ID: 4e0c036c-ce4a-11e9-9b57-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4e0c036c-ce4a-11e9-9b57-bc764e2007e4;
 Tue, 03 Sep 2019 12:56:54 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id A597EAF38;
 Tue,  3 Sep 2019 12:56:53 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20190903101428.3543-1-roger.pau@citrix.com>
 <275b3560-2191-364a-96d8-214d6bdcac0d@suse.com>
 <20190903125159.3kdnhkjrx3isnhao@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <238481d1-c0db-3380-53b1-129124e39263@suse.com>
Date: Tue, 3 Sep 2019 14:56:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190903125159.3kdnhkjrx3isnhao@Air-de-Roger>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3] vpci: honor read-only devices
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDMuMDkuMjAxOSAxNDo1MSwgUm9nZXIgUGF1IE1vbm7DqSAgd3JvdGU6Cj4gT24gVHVlLCBT
ZXAgMDMsIDIwMTkgYXQgMDI6MTY6NTJQTSArMDIwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9u
IDAzLjA5LjIwMTkgMTI6MTQsIFJvZ2VyIFBhdSBNb25uZSB3cm90ZToKPj4+IERvbid0IGFsbG93
IHRoZSBoYXJkd2FyZSBkb21haW4gd3JpdGUgYWNjZXNzIHRoZSBQQ0kgY29uZmlnIHNwYWNlIG9m
Cj4+PiBkZXZpY2VzIG1hcmtlZCBhcyByZWFkLW9ubHkuCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTog
Um9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4+PiAtLS0KPj4+IENoYW5n
ZXMgc2luY2UgdjI6Cj4+PiAgLSBGaXggdGVzdCBoYXJuZXNzLgo+Pj4gIC0gRG8gdGhlIFJPIGNo
ZWNrIGJlZm9yZSB0aGUgb3duZXJzaGlwIG9uZS4KPj4+Cj4+PiBDaGFuZ2VzIHNpbmNlIHYxOgo+
Pj4gIC0gQ2hhbmdlIHRoZSBhcHByb2FjaCBhbmQgYWxsb3cgZnVsbCByZWFkIGFjY2Vzcywgd2hp
bGUgbGltaXRpbmcKPj4+ICAgIHdyaXRlIGFjY2VzcyB0byBkZXZpY2VzIG1hcmtlZCBSTy4KPj4+
IC0tLQo+Pj4gIHRvb2xzL3Rlc3RzL3ZwY2kvZW11bC5oIHwgMyArKysKPj4+ICB4ZW4vZHJpdmVy
cy92cGNpL3ZwY2kuYyB8IDUgKysrKysKPj4+ICAyIGZpbGVzIGNoYW5nZWQsIDggaW5zZXJ0aW9u
cygrKQo+Pj4KPj4+IGRpZmYgLS1naXQgYS90b29scy90ZXN0cy92cGNpL2VtdWwuaCBiL3Rvb2xz
L3Rlc3RzL3ZwY2kvZW11bC5oCj4+PiBpbmRleCA1ZDQ3NTQ0YmY3Li4yZTFkMzA1N2M5IDEwMDY0
NAo+Pj4gLS0tIGEvdG9vbHMvdGVzdHMvdnBjaS9lbXVsLmgKPj4+ICsrKyBiL3Rvb2xzL3Rlc3Rz
L3ZwY2kvZW11bC5oCj4+PiBAQCAtOTIsNiArOTIsOSBAQCB0eXBlZGVmIHVuaW9uIHsKPj4+ICAj
ZGVmaW5lIHhmcmVlKHApIGZyZWUocCkKPj4+ICAKPj4+ICAjZGVmaW5lIHBjaV9nZXRfcGRldl9i
eV9kb21haW4oLi4uKSAmdGVzdF9wZGV2Cj4+PiArI2RlZmluZSBwY2lfZ2V0X3JvX21hcCguLi4p
IE5VTEwKPj4+ICsKPj4+ICsjZGVmaW5lIHRlc3RfYml0KC4uLikgZmFsc2UKPj4KPj4gVGhlIGxh
dHRlciBzZWVtcyByYXRoZXIgZGFuZ2Vyb3VzIHRvIG1lLCBhcyBhIGZ1cnRoZXIgYWRkaXRpb24g
b2YKPj4gdGVzdF9iaXQoKSB3b3VsZCBzaWxlbnRseSBidWlsZCBmaW5lLCBidXQgcG9zc2libHkg
cHJvZHVjZSBhIG5vbi0KPj4gd29ya2luZyBiaW5hcnkuIEJ1dCB5b3UncmUgdGhlIGRlZmFjdG8g
bWFpbnRhaW5lciBvZiB0aGlzCj4+IGhhcm5lc3MsIHNvIGlmIHlvdSBiZWxpZXZlIGl0J3MgZmlu
ZSBzbyBiZSBpdC4gKElmIGV2ZW4KPj4geGVucGFnaW5nIGlzIGNvbnNpZGVyZWQgImZpbmUiIHRv
IGluY2x1ZGUgeGNfYml0b3BzLmgsIEkgd29uZGVyCj4+IGlmIHRoaXMgaGFybmVzcyBjb3VsZG4n
dCBkbyBzbyB0b28uIEFuZCB0aGVuIHRoZXJlIGFyZSB0aHJlZQo+PiB0ZXN0X2JpdCgpIGRlZmlu
aXRpb25zIG92ZXJhbGwgdW5kZXIgdG9vbHMvIC0gSSB3b25kZXIgaWYgdGhvc2UKPj4gY291bGRu
J3QgYmUgY29uc29saWRhdGVkIGludG8gYSBzaW5nbGUsIHVuaXZlcnNhbGx5IHVzYWJsZSBvbmUu
KQo+IAo+IE9uZSBvcHRpb24gd291bGQgYmUgdG8gdHVybiB0ZXN0X2JpdCBpbnRvIGFzc2VydCgw
KSB3aGljaCBzaG91bGQgd29yawo+IGZvciB0aGUgY3VycmVudCB1c2FnZSwgc2luY2UgdGVzdF9i
aXQgc2hvdWxkbid0IGJlIGNhbGxlZCBnaXZlbiB0aGUKPiBjdXJyZW50IGNvZGUgYW5kIHdpbGwg
dHJpZ2dlciBpZiBpdCBhY3R1YWxseSBnZXRzIHVzZWQuIFdvdWxkIHlvdSBiZQo+IGZpbmUgd2l0
aCBtZXJnaW5nIHRoZSBjaHVuayBiZWxvdyBpbnRvIHRoZSBjdXJyZW50IHBhdGNoPwoKVGhhdCdz
IG1hcmdpbmFsbHkgYmV0dGVyLCBidXQgbm90IGVub3VnaCBmb3IgbXkgdGFzdGUuIElJUkMgdW5k
ZXIKdG9vbHMvIHdlIGNhbid0IHJlbHkgb24gRENFLCBhbmQgaGVuY2UgZGVjbGFyaW5nIChidXQg
bm90IGRlZmluaW5nKQp0ZXN0X2JpdCgpIGlzbid0IGFuIG9wdGlvbiBlaXRoZXIuCgpBbnl3YXks
IGFzIHNhaWQsIEkgd29uJ3Qgb2JqZWN0IHRvIHdoYXRldmVyIHRoZSB0b29sIHN0YWNrCm1haW50
YWluZXJzIGFyZSB3aWxsaW5nIHRvIGdpdmUgYW4gYWNrIGZvci4KCj4gSSB3b3VsZCBsaWtlIHRv
IGF2b2lkIGluY2x1ZGluZyB4Y19iaXRvcHMuaCwgc2luY2UgdGhlIHhlbnBhZ2luZwo+IE1ha2Vm
aWxlIGFscmVhZHkgY29udGFpbnMgYSBjb21tZW50IHJlZ2FyZGluZyB0aGUgd3JvbmcgdXNhZ2Ug
b2YgbGlieGMKPiBpbnRlcm5hbHMuCgpSaWdodCwgYW5kIEkgd291bGRuJ3QgaGF2ZSBkYXJlZCB0
byBzdWdnZXN0IHRoaXMgZm9yIHNvbWV0aGluZyB0aGF0Cmlzbid0IGp1c3QgYSB0ZXN0IGJpbmFy
eS4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
