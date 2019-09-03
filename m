Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CA36A660D
	for <lists+xen-devel@lfdr.de>; Tue,  3 Sep 2019 11:50:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i55Q9-0007M9-Kn; Tue, 03 Sep 2019 09:48:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=CRa/=W6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i55Q7-0007M4-VN
 for xen-devel@lists.xenproject.org; Tue, 03 Sep 2019 09:48:16 +0000
X-Inumbo-ID: f25b3c79-ce2f-11e9-ab8c-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f25b3c79-ce2f-11e9-ab8c-12813bfff9fa;
 Tue, 03 Sep 2019 09:48:15 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 2B468AD46;
 Tue,  3 Sep 2019 09:48:14 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20190902153037.99845-1-roger.pau@citrix.com>
 <773670ce-53bb-0677-8e07-69c84531847a@suse.com>
 <20190903092803.p5o33gl5ctnmue64@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b17f112a-22f7-b361-069d-9351139a1a0c@suse.com>
Date: Tue, 3 Sep 2019 11:48:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190903092803.p5o33gl5ctnmue64@Air-de-Roger>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] vpci: honor read-only devices
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
 Ian Jackson <ian.jackson@eu.citrix.com>, TimDeegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDMuMDkuMjAxOSAxMToyOCwgUm9nZXIgUGF1IE1vbm7DqSAgd3JvdGU6Cj4gT24gVHVlLCBT
ZXAgMDMsIDIwMTkgYXQgMTE6MDk6MDlBTSArMDIwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9u
IDAyLjA5LjIwMTkgMTc6MzAsIFJvZ2VyIFBhdSBNb25uZSB3cm90ZToKPj4+IC0tLSBhL3hlbi9k
cml2ZXJzL3ZwY2kvdnBjaS5jCj4+PiArKysgYi94ZW4vZHJpdmVycy92cGNpL3ZwY2kuYwo+Pj4g
QEAgLTQxOCwxMyArNDE4LDIxIEBAIHZvaWQgdnBjaV93cml0ZShwY2lfc2JkZl90IHNiZGYsIHVu
c2lnbmVkIGludCByZWcsIHVuc2lnbmVkIGludCBzaXplLAo+Pj4gICAgICAgICAgcmV0dXJuOwo+
Pj4gICAgICB9Cj4+PiAgCj4+PiAtICAgIC8qCj4+PiAtICAgICAqIEZpbmQgdGhlIFBDSSBkZXYg
bWF0Y2hpbmcgdGhlIGFkZHJlc3MuCj4+PiAtICAgICAqIFBhc3N0aHJvdWdoIGV2ZXJ5dGhpbmcg
dGhhdCdzIG5vdCB0cmFwcGVkLgo+Pj4gLSAgICAgKi8KPj4+ICsgICAgLyogRmluZCB0aGUgUENJ
IGRldiBtYXRjaGluZyB0aGUgYWRkcmVzcy4gKi8KPj4+ICAgICAgcGRldiA9IHBjaV9nZXRfcGRl
dl9ieV9kb21haW4oZCwgc2JkZi5zZWcsIHNiZGYuYnVzLCBzYmRmLmRldmZuKTsKPj4+ICAgICAg
aWYgKCAhcGRldiApCj4+PiAgICAgIHsKPj4+ICsgICAgICAgIGNvbnN0IHVuc2lnbmVkIGxvbmcg
KnJvX21hcCA9IHBjaV9nZXRfcm9fbWFwKHNiZGYuc2VnKTsKPj4+ICsKPj4+ICsgICAgICAgIGlm
ICggcm9fbWFwICYmIHRlc3RfYml0KHNiZGYuYmRmLCByb19tYXApICkKPj4+ICsgICAgICAgICAg
ICAvKiBJZ25vcmUgd3JpdGVzIHRvIHJlYWQtb25seSBkZXZpY2VzLiAqLwo+Pj4gKyAgICAgICAg
ICAgIHJldHVybjsKPj4+ICsKPj4+ICsgICAgICAgIC8qCj4+PiArICAgICAgICAgKiBMZXQgdGhl
IGhhcmR3YXJlIGRvbWFpbiBhY2Nlc3MgY29uZmlnIHNwYWNlIHJlZ2lvbnMgZm9yIG5vbi1leGlz
dGVudAo+Pj4gKyAgICAgICAgICogZGV2aWNlcy4KPj4+ICsgICAgICAgICAqIFRPRE86IHJldmlz
aXQgZm9yIGRvbVUgc3VwcG9ydC4KPj4+ICsgICAgICAgICAqLwo+Pj4gICAgICAgICAgdnBjaV93
cml0ZV9odyhzYmRmLCByZWcsIHNpemUsIGRhdGEpOwo+Pj4gICAgICAgICAgcmV0dXJuOwo+Pj4g
ICAgICB9Cj4+Pgo+Pgo+PiBJbiBwcmluY2lwbGUgSSdtIG9rYXkgd2l0aCB0aGUgY2hhbmdlLCBi
dXQgSSBoYXZlIHR3byBtb3JlIHRoaW5ncwo+PiB0byBiZSBjb25zaWRlcmVkOgo+Pgo+PiAxKSBJ
J2QgcHJlZmVyIGlmIHRoZSBjaGVjayB3YXMgaW5kZXBlbmRlbnQgb2YgdGhlIHJldHVybiB2YWx1
ZSBvZgo+PiBwY2lfZ2V0X3BkZXZfYnlfZG9tYWluKCksIHRvIGJlIG1vcmUgcm9idXN0IGFnYWlu
c3QgdGhlIHIvbyBtYXAKPj4gaGF2aW5nIGdvdCB1cGRhdGVkIGJ1dCB0aGUgb3duZXIgc3RpbGwg
YmVpbmcgaHdkb20uCj4gCj4gU28gdGhlIFJPIGNoZWNrIHdvdWxkIGJlIGRvbmUgYWhlYWQgb2Yg
dGhlIG93bmVyIGNoZWNrPwo+IAo+IEkgY2FuIGRvIHRoYXQsIGJ1dCBpdCBzZWVtcyBsaWtlIGEg
Ym9kZ2UgZm9yIHRoZSBsb2NraW5nIGlzc3VlcyAob3IKPiBsYWNrIG9mIGl0KSB3ZSBoYXZlIGlu
IHRoZSBoYW5kbGluZyBvZiBQQ0kgZGV2aWNlcy4gSSBhc3N1bWUgaGF2aW5nIGEKPiBSTyBkZXZp
Y2UgYXNzaWduZWQgdG8gYSBkb21haW4gZGlmZmVyZW50IHRoYW4gZG9tX3hlbiBpcyBub3QgcG9z
c2libGUuCgpJdCBvdWdodCBub3QgYmUgcG9zc2libGUuIEhlbmNlIG1lIHNheWluZyAibW9yZSBy
b2J1c3QiIChpLmUuIGluCmNhc2UgdGhlICJvdWdodCBub3QiIHNvbWVob3cgZ2V0cyBicm9rZW4p
LiBBbmQgbm8sIHRoZSBjb21tZW50Cndhc24ndCByZWFsbHkgcmVsYXRlZCB0byB0aGUgKGxhY2sg
b2YpIGxvY2tpbmcgaGVyZSAtIHRoYXQncyBhbgpvcnRob2dvbmFsIGlzc3VlLgoKPj4gMikgV291
bGRuJ3QgaXQgYmUgYmV0dGVyIHRvIG1vdmUgdGhlIGNoZWNrIGludG8gdGhlIGNhbGxlcnMgb2YK
Pj4gdnBjaV93cml0ZSgpLCB0byBhdm9pZCB0aGUgZHVwbGljYXRlIGxvb2t1cCBpbiB0aGUgcXdv
cmQtTUNGRy0KPj4gd3JpdGUgY2FzZT8gVGhlIG1haW4gcXVlc3Rpb25hYmxlIHBvaW50IGhlcmUg
aXMgd2hlcmUsIGZvciBEb21VCj4+IHN1cHBvcnQsIHRoZSBTQkRGIHRyYW5zbGF0aW9uIGlzIGdv
aW5nIHRvIGxpdmUuCj4gCj4gU28gSSBoYXZlIGEgc2VyaWVzIEknbSBnb2luZyB0byBzZW5kIHF1
aXRlIHNvb24gaW4gb3JkZXIgdG8gaW50ZWdyYXRlCj4gdlBDSSB3aXRoIGlvcmVxLCBhcyBhIGZp
cnN0IHN0ZXAgaW4gb3JkZXIgdG8gbWFrZSBpdCBhdmFpbGFibGUgdG8KPiBkb21Vcy4KPiAKPiBU
aGUgU0JERiB0cmFuc2xhdGlvbiB0aGVyZSBpcyBnb2luZyB0byBiZSBwZXJmb3JtZWQgYnkgdGhl
IGlvcmVxIGNvZGUKPiAoaWU6IGh2bV9zZWxlY3RfaW9yZXFfc2VydmVyKSwgYnV0IGNoZWNraW5n
IGFnYWluc3QgdGhlIFJPIG1hcCB0aGVyZQo+IHdvdWxkIGJlIHdyb25nLCBhcyBpb3JlcSBkb2Vz
bid0IGtub3cgd2hldGhlciB0aGUgdW5kZXJseWluZyBoYW5kbGVyCj4gaXMgZm9yIGFuIGVtdWxh
dGVkIGRldmljZSBvciBmb3IgYSBwYXNzdGhyb3VnaCBvbmUuIEkgdGhpbmsgdGhlIFJPCj4gY2hl
Y2sgbmVlZHMgdG8gYmUgaW4gdGhlIHZQQ0kgY29kZSBpdHNlbGYuCgpPaCwgc3VyZS4gVGhlIHF1
ZXN0aW9uIHRoZW4gc2ltcGx5IGNvbnZlcnRzIHRvICJXaGVyZSBjYW4gaXQgYmUgZG9uZQp0aGUg
ZWFybGllc3Q/IiBJLmUuIHdoZW4vd2hlcmUgZG8gd2UgaGF2ZSB0aGUgcGh5c2ljYWwgU0JERiBp
biBvdXIKaGFuZHM/CgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
