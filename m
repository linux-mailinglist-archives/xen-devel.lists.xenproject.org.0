Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B32811852F
	for <lists+xen-devel@lfdr.de>; Tue, 10 Dec 2019 11:34:59 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iecoH-0000sh-My; Tue, 10 Dec 2019 10:32:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=1mH3=2A=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iecoG-0000sW-C7
 for xen-devel@lists.xenproject.org; Tue, 10 Dec 2019 10:32:04 +0000
X-Inumbo-ID: 4e30b578-1b38-11ea-88e7-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4e30b578-1b38-11ea-88e7-bc764e2007e4;
 Tue, 10 Dec 2019 10:32:03 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id A307AB17A;
 Tue, 10 Dec 2019 10:32:02 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20191209173757.46833-1-roger.pau@citrix.com>
 <d2709b23-ea42-e3aa-7018-4d4d93f6c0ee@suse.com>
 <20191210101848.GE980@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f04e56da-fa68-2dce-e2a3-0e631db9d869@suse.com>
Date: Tue, 10 Dec 2019 11:32:22 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191210101848.GE980@Air-de-Roger>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4] x86: do not enable global pages when
 virtualized on AMD hardware
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTAuMTIuMjAxOSAxMToxOCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiBPbiBUdWUsIERl
YyAxMCwgMjAxOSBhdCAxMToxMToxOEFNICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24g
MDkuMTIuMjAxOSAxODozNywgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+Pj4gLS0tIGEveGVuL2Fy
Y2gveDg2L3B2L2RvbWFpbi5jCj4+PiArKysgYi94ZW4vYXJjaC94ODYvcHYvZG9tYWluLmMKPj4+
IEBAIC0xMTgsNiArMTE4LDE5IEBAIHVuc2lnbmVkIGxvbmcgcHZfZml4dXBfZ3Vlc3RfY3I0KGNv
bnN0IHN0cnVjdCB2Y3B1ICp2LCB1bnNpZ25lZCBsb25nIGNyNCkKPj4+ICAgICAgICAgICAgICAo
bW11X2NyNF9mZWF0dXJlcyAmIFBWX0NSNF9HVUVTVF9WSVNJQkxFX01BU0spKTsKPj4+ICB9Cj4+
PiAgCj4+PiArc3RhdGljIGludDhfdCBfX3JlYWRfbW9zdGx5IG9wdF9nbG9iYWxfcGFnZXMgPSAt
MTsKPj4+ICtib29sZWFuX3J1bnRpbWVfcGFyYW0oImdsb2JhbC1wYWdlcyIsIG9wdF9nbG9iYWxf
cGFnZXMpOwo+Pj4gKwo+Pj4gK3N0YXRpYyBpbnQgX19pbml0IHBnZV9pbml0KHZvaWQpCj4+PiAr
ewo+Pj4gKyAgICBpZiAoIG9wdF9nbG9iYWxfcGFnZXMgPT0gLTEgKQo+Pj4gKyAgICAgICAgb3B0
X2dsb2JhbF9wYWdlcyA9ICFjcHVfaGFzX2h5cGVydmlzb3IgfHwKPj4+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICBib290X2NwdV9kYXRhLng4Nl92ZW5kb3IgIT0gWDg2X1ZFTkRPUl9BTUQ7
Cj4+Cj4+IEkgd2FzIGFib3V0IHRvIGNvbW1pdCB0aGlzIHdoZW4gSSBub3RpY2VkIC0gd2hhdCBh
Ym91dCBIeWdvbiBoZXJlPwo+IAo+IE9oIHRoZSB2ZW5kb3IgSUQgaXMgZGlmZmVyZW50IGFsYmVp
dCBpdCdzIGp1c3QgYSBjbG9uZS4gUGxlYXNlIGZlZWwKPiBmcmVlIHRvIGFkZCBpdCBhdCBjb21t
aXQuCj4gCj4gSSBhbHNvIHdvbmRlcjogaXQgbWlnaHQgYmUgZ29vZCB0byBoYXZlIHNvbWUga2lu
ZCBvZiBtYWNybyB0aGF0Cj4gbWF0Y2hlcyBib3RoIEFNRCBhbmQgSHlnb24gKElTX0FNRF9DT01Q
QVQgb3Igc29tZSBzdWNoKSBpbiBvcmRlciB0bwo+IGF2b2lkIHRoaXMga2luZCBvZiBtaXN0YWtl
cyBpbiB0aGUgZnV0dXJlLgoKQmVjYXVzZSBpdCdzIGEgY2xvbmUsIGRvd24gdGhlIHJvYWQgdGhp
cyBtYXkgYmUgbW9yZSByaXNreS4gSGVyZQp3aGF0IHdlJ3JlIHJlYWxseSBpbnRlcmVzdGVkIGlu
IGlzIFNWTSwganVzdCB0aGF0IHdlIGNhbid0IGNoZWNrCnRoZSBmZWF0dXJlIGZsYWcgKGJlY2F1
c2UgaXQgbWF5IG5vdCBiZSBleHBvc2VkIHRvIHVzKS4KCkphbgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
