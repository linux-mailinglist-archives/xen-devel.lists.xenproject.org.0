Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 138F214C811
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jan 2020 10:29:35 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwjdI-0007J7-3m; Wed, 29 Jan 2020 09:27:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=W/IS=3S=amazon.de=prvs=290504bcf=vrd@srs-us1.protection.inumbo.net>)
 id 1iwjdG-0007J2-5q
 for xen-devel@lists.xenproject.org; Wed, 29 Jan 2020 09:27:34 +0000
X-Inumbo-ID: 945ca8fa-4279-11ea-b211-bc764e2007e4
Received: from smtp-fw-6001.amazon.com (unknown [52.95.48.154])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 945ca8fa-4279-11ea-b211-bc764e2007e4;
 Wed, 29 Jan 2020 09:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1580290054; x=1611826054;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=M+AHrTw0Mf6V13SBmvMLHEr0G53V+3iGNp8ExyCBPQ4=;
 b=txIhU7UO6LTWyPi1f1+a+4rnA+VObdibhKc9ytCmkMcEf30EXMfxSpgF
 pZ8pltymKG5pPTknZZPn3Zx0JJuQff7ve7hDRGvM4eiIG5WfrLC0SU1DR
 25+3e5FCMU6HX9yD8Lhi6kMMrJgl1cPZbknNtggu1ftCJAW4s9nalVUkb o=;
IronPort-SDR: qdcgOY0p1uopUbLx/IJmg1GNljjdmmyHM/tl7eKRFf9BHYzz5Z5fDQZURLnHMMvGKFZmNaFbr7
 Y0ZFeGoFnNLg==
X-IronPort-AV: E=Sophos;i="5.70,377,1574121600"; d="scan'208";a="15262014"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2c-87a10be6.us-west-2.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP;
 29 Jan 2020 09:27:33 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2c-87a10be6.us-west-2.amazon.com (Postfix) with ESMTPS
 id 4DDF1A17D1; Wed, 29 Jan 2020 09:27:31 +0000 (UTC)
Received: from EX13D22EUA004.ant.amazon.com (10.43.165.129) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Wed, 29 Jan 2020 09:27:31 +0000
Received: from EX13MTAUEE002.ant.amazon.com (10.43.62.24) by
 EX13D22EUA004.ant.amazon.com (10.43.165.129) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 29 Jan 2020 09:27:29 +0000
Received: from u908889d5e8f057.ant.amazon.com (10.28.86.33) by
 mail-relay.amazon.com (10.43.62.224) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Wed, 29 Jan 2020 09:27:27 +0000
To: Julien Grall <julien@xen.org>, Varad Gautam <vrd@amazon.de>,
 <xen-devel@lists.xenproject.org>
References: <1562165173-31383-1-git-send-email-vrd@amazon.de>
 <1576666417-20989-1-git-send-email-vrd@amazon.de>
 <b89a250a-2b6b-0cc4-655c-2c27c0b8ab76@xen.org>
From: <vrd@amazon.com>
Message-ID: <faabd882-c848-370f-f6d2-3f66bae2c110@amazon.com>
Date: Wed, 29 Jan 2020 10:27:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <b89a250a-2b6b-0cc4-655c-2c27c0b8ab76@xen.org>
Content-Language: en-US
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v2] x86: irq: Do not BUG_ON multiple unbind
 calls for shared pirqs
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGV5IEp1bGllbiwKCk9uIDEyLzE4LzE5IDI6NTcgUE0sIEp1bGllbiBHcmFsbCB3cm90ZToKPiBI
aSBWYXJhZCwKPgo+IFBsZWFzZSBzZW5kIG5ldyB2ZXJzaW9uIG9mIGEgcGF0Y2ggaW4gYSBuZXcg
dGhyZWFkIHJhdGhlciB0aGFuIAo+IGluLXJlcGx5IHRvIHRoZSBmaXJzdCB2ZXJzaW9uLgo+Cj4g
T24gMTgvMTIvMjAxOSAxMDo1MywgVmFyYWQgR2F1dGFtIHdyb3RlOgo+PiBYRU5fRE9NQ1RMX2Rl
c3Ryb3lkb21haW4gY3JlYXRlcyBhIGNvbnRpbnVhdGlvbiBpZiBkb21haW5fa2lsbCAKPj4gLUVS
RVNUQVJUUy4KPj4gSW4gdGhhdCBzY2VuYXJpbywgaXQgaXMgcG9zc2libGUgdG8gcmVjZWl2ZSBt
dWx0aXBsZSBfcGlycV9ndWVzdF91bmJpbmQKPj4gY2FsbHMgZm9yIHRoZSBzYW1lIHBpcnEgZnJv
bSBkb21haW5fa2lsbCwgaWYgdGhlIHBpcnEgaGFzIG5vdCB5ZXQgYmVlbgo+PiByZW1vdmVkIGZy
b20gdGhlIGRvbWFpbidzIHBpcnFfdHJlZSwgYXM6Cj4+IMKgwqAgZG9tYWluX2tpbGwoKQo+PiDC
oMKgwqDCoCAtPiBkb21haW5fcmVsaW5xdWlzaF9yZXNvdXJjZXMoKQo+PiDCoMKgwqDCoMKgwqAg
LT4gcGNpX3JlbGVhc2VfZGV2aWNlcygpCj4+IMKgwqDCoMKgwqDCoMKgwqAgLT4gcGNpX2NsZWFu
X2RwY2lfaXJxKCkKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqAgLT4gcGlycV9ndWVzdF91bmJpbmQo
KQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLT4gX19waXJxX2d1ZXN0X3VuYmluZCgpCj4+
Cj4+IEZvciBhIHNoYXJlZCBwaXJxIChucl9ndWVzdHMgPiAxKSwgdGhlIGZpcnN0IGNhbGwgd291
bGQgemFwIHRoZSBjdXJyZW50Cj4+IGRvbWFpbiBmcm9tIHRoZSBwaXJxJ3MgZ3Vlc3RzW10gbGlz
dCwgYnV0IHRoZSBhY3Rpb24gaGFuZGxlciBpcyBuZXZlciAKPj4gZnJlZWQKPj4gYXMgdGhlcmUg
YXJlIG90aGVyIGd1ZXN0cyB1c2luZyB0aGlzIHBpcnEuIEFzIGEgcmVzdWx0LCBvbiB0aGUgc2Vj
b25kIAo+PiBjYWxsLAo+PiBfX3BpcnFfZ3Vlc3RfdW5iaW5kIHNlYXJjaGVzIGZvciB0aGUgY3Vy
cmVudCBkb21haW4gd2hpY2ggaGFzIGJlZW4gCj4+IHJlbW92ZWQKPj4gZnJvbSB0aGUgZ3Vlc3Rz
W10gbGlzdCwgYW5kIGhpdHMgYSBCVUdfT04uCj4+Cj4+IE1ha2UgX19waXJxX2d1ZXN0X3VuYmlu
ZCBzYWZlIHRvIGJlIGNhbGxlZCBtdWx0aXBsZSB0aW1lcyBieSBsZXR0aW5nIHhlbgo+PiBjb250
aW51ZSBpZiBhIHNoYXJlZCBwaXJxIGhhcyBhbHJlYWR5IGJlZW4gdW5ib3VuZCBmcm9tIHRoaXMg
Z3Vlc3QuIFRoZQo+PiBQSVJRIHdpbGwgYmUgY2xlYW5lZCB1cCBmcm9tIHRoZSBkb21haW4ncyBw
aXJxX3RyZWUgZHVyaW5nIHRoZSAKPj4gZGVzdHJ1Y3Rpb24KPj4gaW4gY29tcGxldGVfZG9tYWlu
X2Rlc3Ryb3kgYW55d2F5cy4KPj4KPj4gU2lnbmVkLW9mZi1ieTogVmFyYWQgR2F1dGFtIDx2cmRA
YW1hem9uLmRlPgo+PiBDQzogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+PiBDQzog
Um9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4+IENDOiBBbmRyZXcgQ29v
cGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgo+Pgo+PiB2MjogU3BsaXQgdGhlIGNoZWNr
IG9uIGFjdGlvbi0+bnJfZ3Vlc3RzID4gMCBhbmQgbWFrZSBpdCBhbiBBU1NFUlQsIAo+PiByZXdv
cmQuCj4+IC0tLQo+PiDCoCB4ZW4vYXJjaC94ODYvaXJxLmMgfCAxMSArKysrKysrKysrLQo+PiDC
oCAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Pgo+PiBk
aWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2lycS5jIGIveGVuL2FyY2gveDg2L2lycS5jCj4+IGlu
ZGV4IDVkMGQ5NGMuLjNlYjdiMjIgMTAwNjQ0Cj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni9pcnEuYwo+
PiArKysgYi94ZW4vYXJjaC94ODYvaXJxLmMKPj4gQEAgLTE4NjMsNyArMTg2MywxNiBAQCBzdGF0
aWMgaXJxX2d1ZXN0X2FjdGlvbl90ICpfX3BpcnFfZ3Vlc3RfdW5iaW5kKAo+PiDCoCDCoMKgwqDC
oMKgIGZvciAoIGkgPSAwOyAoaSA8IGFjdGlvbi0+bnJfZ3Vlc3RzKSAmJiAoYWN0aW9uLT5ndWVz
dFtpXSAhPSAKPj4gZCk7IGkrKyApCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBjb250aW51ZTsKPj4g
LcKgwqDCoCBCVUdfT04oaSA9PSBhY3Rpb24tPm5yX2d1ZXN0cyk7Cj4+ICvCoMKgwqAgaWYgKCBp
ID09IGFjdGlvbi0+bnJfZ3Vlc3RzICkgewo+Cj4gVGhlIHsgc2hvdWxkIGJlIGEgbmV3IGxpbmUu
Cj4KPj4gK8KgwqDCoMKgwqDCoMKgIEFTU0VSVChhY3Rpb24tPm5yX2d1ZXN0cyA+IDApIDsKPgo+
IFRoZSBzcGFjZSBiZWZvcmUgOyBpcyBub3QgbmVjZXNzYXJ5Lgo+Cj4+ICvCoMKgwqDCoMKgwqDC
oCAvKiBJbiBjYXNlIHRoZSBwaXJxIHdhcyBzaGFyZWQsIHVuYm91bmQgZm9yIHRoaXMgZG9tYWlu
IGluIAo+PiBhbiBlYXJsaWVyIGNhbGwsIGJ1dCBzdGlsbAo+PiArwqDCoMKgwqDCoMKgwqDCoCAq
IGV4aXN0ZWQgb24gdGhlIGRvbWFpbidzIHBpcnFfdHJlZSwgd2Ugc3RpbGwgcmVhY2ggaGVyZSBp
ZiAKPj4gdGhlcmUgYXJlIGFueSBsYXRlcgo+PiArwqDCoMKgwqDCoMKgwqDCoCAqIHVuYmluZCBj
YWxscyBvbiB0aGUgc2FtZSBwaXJxLiBSZXR1cm4gaWYgc3VjaCBhbiB1bmJpbmQgCj4+IGhhcHBl
bnMuICovCj4KPiBUaGUgY29kaW5nIHN0eWxlIGZvciBjb21tZW50IGlzOgo+Cj4gLyoKPiDCoCog
Rm9vCj4gwqAqIEJhcgo+IMKgKi8KPgo+PiArwqDCoMKgwqDCoMKgwqAgaWYgKCBhY3Rpb24tPnNo
YXJlYWJsZSApCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiBOVUxMOwo+PiArwqDC
oMKgwqDCoMKgwqAgQlVHKCk7Cj4KPiBHaXZlbiB0aGF0IHRoZSBwcmV2aW91cyBCVUdfT04oKSB3
YXMgaGl0LCB3b3VsZCBpdCBtYWtlIHNlbnNlIHRvIHRyeSAKPiB0byBhdm9pZCBhIG5ldyBCVUco
KS4KPgo+IFNvIHdoeSBub3QganVzdCByZXR1cm5pbmcgTlVMTCBhcyB5b3UgZG8gZm9yIGFjdGlv
bi0+c2hhcmVhYmxlPwo+CgpUaGFua3MsIEkndmUgZG9uZSB0aGUgc3R5bGUgZml4dXBzIGluIHYz
LgoKSSdkIGFyZ3VlIHRoYXQgaXMgaW5kZWVkIGEgQlVHLCBpZiB0aGUgcGlycSB3YXMgX25vdF8g
c2hhcmVhYmxlIGFuZCB0aGUgCmxvb3AgYWJvdmUgY291bGRuJ3QgZmluZCBhIG1hdGNoaW5nIGRv
bWFpbiBmb3IgaXQgLSB0aGF0IGltcGxpZXMgdGhlIApwaXJxIHNob3VsZG4ndCBoYXZlIGV4aXN0
ZWQgaW4gdGhlIGZpcnN0IHBsYWNlLgoKCj4+ICvCoMKgwqAgfQo+PiArCj4+IMKgwqDCoMKgwqAg
bWVtbW92ZSgmYWN0aW9uLT5ndWVzdFtpXSwgJmFjdGlvbi0+Z3Vlc3RbaSsxXSwKPj4gwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgKGFjdGlvbi0+bnJfZ3Vlc3RzLWktMSkgKiBzaXplb2YoYWN0
aW9uLT5ndWVzdFswXSkpOwo+PiDCoMKgwqDCoMKgIGFjdGlvbi0+bnJfZ3Vlc3RzLS07Cj4+Cj4K
PiBDaGVlcnMsCj4KCgoKCkFtYXpvbiBEZXZlbG9wbWVudCBDZW50ZXIgR2VybWFueSBHbWJICkty
YXVzZW5zdHIuIDM4CjEwMTE3IEJlcmxpbgpHZXNjaGFlZnRzZnVlaHJ1bmc6IENocmlzdGlhbiBT
Y2hsYWVnZXIsIEpvbmF0aGFuIFdlaXNzCkVpbmdldHJhZ2VuIGFtIEFtdHNnZXJpY2h0IENoYXJs
b3R0ZW5idXJnIHVudGVyIEhSQiAxNDkxNzMgQgpTaXR6OiBCZXJsaW4KVXN0LUlEOiBERSAyODkg
MjM3IDg3OQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
