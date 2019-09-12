Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17444B0D2A
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2019 12:47:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8MbY-0006ML-Ac; Thu, 12 Sep 2019 10:45:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ncEf=XH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i8MbX-0006MG-0G
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2019 10:45:35 +0000
X-Inumbo-ID: 7279e2d0-d54a-11e9-b299-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7279e2d0-d54a-11e9-b299-bc764e2007e4;
 Thu, 12 Sep 2019 10:45:34 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 29FF2AEE0;
 Thu, 12 Sep 2019 10:45:33 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <f6accb8b-38d9-ad9a-ec68-992d75f36a88@suse.com>
 <f58f9215-4005-9c1d-0701-1e7fe705b786@suse.com>
 <20190912103441.le4zets5ey73uxwl@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <56a7bf8f-74b6-7d69-f6e5-30644e677869@suse.com>
Date: Thu, 12 Sep 2019 12:45:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190912103441.le4zets5ey73uxwl@Air-de-Roger>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 3/9] x86/mm: honor opt_pcid also for 32-bit
 PV domains
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 AndrewCooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTIuMDkuMjAxOSAxMjozNCwgUm9nZXIgUGF1IE1vbm7DqSAgd3JvdGU6Cj4gT24gV2VkLCBT
ZXAgMTEsIDIwMTkgYXQgMDU6MjI6NTFQTSArMDIwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IEkg
Y2FuJ3Qgc2VlIGFueSB0ZWNobmljYWwgb3IgcGVyZm9ybWFuY2UgcmVhc29uIHdoeSB3ZSBzaG91
bGQgdHJlYXQKPj4gMzItYml0IFBWIGRpZmZlcmVudCBmcm9tIDY0LWJpdCBQViBpbiB0aGlzIHJl
Z2FyZC4KPj4KPj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29t
Pgo+IAo+IFRoZSBvcmlnaW5hbCBjb21taXQgbWVudGlvbnMgdGhhdCBQQ0lEIGRvZXNuJ3QgaW1w
cm92ZSBwZXJmb3JtYW5jZSBmb3IKPiBub24tWFBUSSBkb21haW5zLCBidXQgaXQgZG9lc24ndCBt
ZW50aW9uIHdoZXRoZXIgaXQgbWFrZXMgcGVyZm9ybWFuY2UKPiB3b3JzZS4KCldlbGwsIHllcyAt
IGl0J3Mgbm90IGxpa2Ugd2UncmUgZGVmYXVsdGluZyB0byB1c2luZyBQQ0lEIG5vdyBmb3IKMzIt
Yml0IGd1ZXN0cy4gQnV0IHdlIGFsbG93IHBlb3BsZSB0byB0dXJuIG9uIGl0cyB1c2UuIEFmdGVy
IGFsbAp0aGUgb3JpZ2luYWwgbWVhc3VyZW1lbnRzIHdlcmUgZG9uZSBvbiBhIGxpbWl0ZWQgc2V0
IG9mIGhhcmR3YXJlLAphbmQgaGFyZHdhcmUgYWxzbyBjaGFuZ2VzL2FkdmFuY2VzIGFsbCB0aGUg
dGltZS4KCj4gVGhlIGNoYW5nZSBMR1RNLCBpZiB5b3UgYXJlIGZpbmUgcGVyZm9ybWFuY2Ugd2lz
ZToKPiAKPiBSZXZpZXdlZC1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5j
b20+CgpUaGFua3MuCgo+PiAtLS0gYS94ZW4vYXJjaC94ODYvcHYvZG9tYWluLmMKPj4gKysrIGIv
eGVuL2FyY2gveDg2L3B2L2RvbWFpbi5jCj4+IEBAIC0xODAsNyArMTgwLDI0IEBAIGludCBzd2l0
Y2hfY29tcGF0KHN0cnVjdCBkb21haW4gKmQpCj4+ICAgICAgZC0+YXJjaC54ODdfZmlwX3dpZHRo
ID0gNDsKPj4gIAo+PiAgICAgIGQtPmFyY2gucHYueHB0aSA9IGZhbHNlOwo+PiAtICAgIGQtPmFy
Y2gucHYucGNpZCA9IGZhbHNlOwo+PiArCj4+ICsgICAgaWYgKCB1c2VfaW52cGNpZCAmJiBjcHVf
aGFzX3BjaWQgKQo+PiArICAgICAgICBzd2l0Y2ggKCBBQ0NFU1NfT05DRShvcHRfcGNpZCkgKQo+
PiArICAgICAgICB7Cj4+ICsgICAgICAgIGNhc2UgUENJRF9PRkY6Cj4+ICsgICAgICAgIGNhc2Ug
UENJRF9YUFRJOgo+PiArICAgICAgICAgICAgZC0+YXJjaC5wdi5wY2lkID0gZmFsc2U7Cj4+ICsg
ICAgICAgICAgICBicmVhazsKPj4gKwo+PiArICAgICAgICBjYXNlIFBDSURfQUxMOgo+PiArICAg
ICAgICBjYXNlIFBDSURfTk9YUFRJOgo+PiArICAgICAgICAgICAgZC0+YXJjaC5wdi5wY2lkID0g
dHJ1ZTsKPj4gKyAgICAgICAgICAgIGJyZWFrOwo+PiArCj4+ICsgICAgICAgIGRlZmF1bHQ6Cj4+
ICsgICAgICAgICAgICBBU1NFUlRfVU5SRUFDSEFCTEUoKTsKPj4gKyAgICAgICAgICAgIGJyZWFr
Owo+PiArICAgICAgICB9Cj4gCj4gVGhpcyBjaHVuayBpcyAoZnVuY3Rpb25hbGl0eSB3aXNlKSBl
eGFjdGx5IHRoZSBzYW1lIGFzIHRoZSBvbmUgaW4KPiBwdl9kb21haW5faW5pdGlhbGlzZSwgaXQg
bWlnaHQgYmUgZ29vZCB0byBwdXQgdGhpcyBpbiBhIHNlcGFyYXRlCj4gaGVscGVyPwoKQ291bGQg
YmUsIGluZGVlZCwgYnV0IHdvdWxkIGF0IGxlYXN0IGRvdWJsZSB0aGUgc2l6ZSBvZiB0aGlzIHBh
dGNoLgpJIHdhc24ndCBjb252aW5jZWQgdGhhdCdzIHdvcnRoIGl0LiBJJ2xsIHNlZSB3aGF0IEFu
ZHJldyB0aGlua3MsCnNpbmNlIEknbGwgbmVlZCBoaXMgYWNrIGFueXdheSAoYXQgbGVhc3QgaW4g
bXkgdW5kZXJzdGFuZGluZyBvZiB0aGUKc3RpbGwgdW4tcmVmaW5lZCwgdW4td3JpdHRlbiBydWxl
cyBvZiB3aGF0IGlzIG5lY2Vzc2FyeSBmb3IKY29tbWl0dGluZyBhIG1haW50YWluZXIncyBwYXRj
aCkuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
