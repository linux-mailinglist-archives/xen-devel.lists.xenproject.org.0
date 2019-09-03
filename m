Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03333A6C0E
	for <lists+xen-devel@lfdr.de>; Tue,  3 Sep 2019 17:00:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5AEo-00038N-By; Tue, 03 Sep 2019 14:56:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=CRa/=W6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i5AEm-00038D-JW
 for xen-devel@lists.xenproject.org; Tue, 03 Sep 2019 14:56:52 +0000
X-Inumbo-ID: 0fa9cb7a-ce5b-11e9-ab96-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0fa9cb7a-ce5b-11e9-ab96-12813bfff9fa;
 Tue, 03 Sep 2019 14:56:51 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id DB5ECAC97;
 Tue,  3 Sep 2019 14:56:50 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>
References: <20190829101846.21369-1-jgross@suse.com>
 <20190829101846.21369-2-jgross@suse.com>
 <6ece6c17-362b-f2ec-eedd-6b2a57dc7d56@suse.com>
 <ec7e18d1-6041-3476-1509-6c150eb6f87a@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <724eea4f-5998-97f2-3b70-88f2e4e28bca@suse.com>
Date: Tue, 3 Sep 2019 16:56:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <ec7e18d1-6041-3476-1509-6c150eb6f87a@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 1/5] xen/spinlocks: in debug builds store
 cpu holding the lock
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

T24gMDMuMDkuMjAxOSAxNjozMSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBPbiAwMy4wOS4xOSAx
NjoxMSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDI5LjA4LjIwMTkgMTI6MTgsIEp1ZXJnZW4g
R3Jvc3Mgd3JvdGU6Cj4+PiAtLS0gYS94ZW4vaW5jbHVkZS94ZW4vc3BpbmxvY2suaAo+Pj4gKysr
IGIveGVuL2luY2x1ZGUveGVuL3NwaW5sb2NrLmgKPj4+IEBAIC02LDE0ICs2LDIxIEBACj4+PiAg
ICNpbmNsdWRlIDxhc20vdHlwZXMuaD4KPj4+ICAgCj4+PiAgICNpZm5kZWYgTkRFQlVHCj4+PiAt
c3RydWN0IGxvY2tfZGVidWcgewo+Pj4gLSAgICBzMTYgaXJxX3NhZmU7IC8qICsxOiBJUlEtc2Fm
ZTsgMDogbm90IElSUS1zYWZlOyAtMTogZG9uJ3Qga25vdyB5ZXQgKi8KPj4+ICt1bmlvbiBsb2Nr
X2RlYnVnIHsKPj4+ICsgICAgdWludDE2X3QgdmFsOwo+Pj4gKyNkZWZpbmUgTE9DS19ERUJVR19J
TklUVkFMIDB4ZmZmZgo+Pj4gKyAgICBzdHJ1Y3Qgewo+Pj4gKyAgICAgICAgdWludDE2X3QgY3B1
OjEyOwo+Pgo+PiBJJ20gYWZyYWlkIEkgaGF2ZSBvbmUgbW9yZSByZXF1ZXN0OiBUaGUgbGl0ZXJh
bCAxMiBpbiBzdHJ1Y3Qgc3BpbmxvY2sgaXMKPj4gc2l0dGluZyByaWdodCBuZXh0IHRvIHRoZSBT
UElOTE9DS19OT19DUFUgZGVmaW5pdGlvbiwgbWFraW5nIGl0IHByZXR0eQo+PiB1bmxpa2VseSB0
aGF0IGJvdGggYXV0aG9yIGFuZCByZXZpZXdlciBvZiBhIGNoYW5nZSB3b3VsZG4ndCBub3RpY2Ug
b25lCj4+IGdldHRpbmcgY2hhbmdlZCB3aXRob3V0IGFkanVzdG1lbnQgdG8gdGhlIG90aGVyLiBU
aGUgbGl0ZXJhbCAxMiBoZXJlLAo+PiB0aG91Z2gsIGlzIHN1ZmZpY2llbnRseSByZW1vdGUgdG8g
dGhhdCBvdGhlciBwbGFjZSwgc28gdGhlcmUgbmVlZHMgdG8gYmUKPj4gYSBjb25uZWN0aW9uIGVz
dGFibGlzaGVkLiBCZXN0IEkgY2FuIHRoaW5rIG9mIHJpZ2h0IGF3YXkgaXMgdG8gaGF2ZSBhCj4+
ICNkZWZpbmUgZm9yIHRoZSAxMiwgbW92ZSBTUElOTE9DS19OT19DUFUncyBkZWZpbml0aW9uIG5l
eHQgdG8gaXQsIGFuZAo+PiB1c2UgdGhlIG5ldyBjb25zdGFudCBpbiBib3RoIHBsYWNlcy4KPiAK
PiBDYW4gZG8uCj4gCj4+Cj4+PiArICAgICAgICB1aW50MTZfdCBwYWQ6MjsKPj4KPj4gV2hpbGUg
YXQgaXQsIHdvdWxkIHlvdSBtaW5kIG1ha2luZyB0aGlzIGFuIHVubmFtZWQgZmllbGQ/Cj4gCj4g
TlAuIEkgZ3Vlc3MgdGhlICIyIiBzaG91bGQgdGhlbiBiZSByZXBsYWNlZCB0byBkZXBlbmQgb24g
dGhlIGFkZGVkCj4gI2RlZmluZSBhYm92ZS4KCkFoIHllcywgSSBkaWRuJ3QgZXZlbiBub3RpY2Ug
dGhpcyB5ZXQuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
