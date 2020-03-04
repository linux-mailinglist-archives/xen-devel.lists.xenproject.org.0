Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26FF5178EC2
	for <lists+xen-devel@lfdr.de>; Wed,  4 Mar 2020 11:46:19 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j9RVB-0008Gn-5l; Wed, 04 Mar 2020 10:43:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Jt9l=4V=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1j9RVA-0008Gh-4l
 for xen-devel@lists.xenproject.org; Wed, 04 Mar 2020 10:43:44 +0000
X-Inumbo-ID: 044f7452-5e05-11ea-8eb5-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 044f7452-5e05-11ea-8eb5-bc764e2007e4;
 Wed, 04 Mar 2020 10:43:43 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 72B42B077;
 Wed,  4 Mar 2020 10:43:42 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
References: <20200303173904.23492-1-jgross@suse.com>
 <d2696b52-b838-bd59-48b4-dc46bbeb501c@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <5f7d70bf-699c-34e0-1ff0-9976c8e11dcd@suse.com>
Date: Wed, 4 Mar 2020 11:43:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <d2696b52-b838-bd59-48b4-dc46bbeb501c@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] xen/sched: fix cpu offlining with core
 scheduling
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
Cc: xen-devel@lists.xenproject.org, George Dunlap <george.dunlap@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDQuMDMuMjAgMTA6NTMsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDAzLjAzLjIwMjAgMTg6
MzksIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IC0tLSBhL3hlbi9jb21tb24vc2NoZWQvY29yZS5j
Cj4+ICsrKyBiL3hlbi9jb21tb24vc2NoZWQvY29yZS5jCj4+IEBAIC0yMjk5LDYgKzIyOTksMTAg
QEAgdm9pZCBzY2hlZF9jb250ZXh0X3N3aXRjaGVkKHN0cnVjdCB2Y3B1ICp2cHJldiwgc3RydWN0
IHZjcHUgKnZuZXh0KQo+PiAgICAgICByY3VfcmVhZF91bmxvY2soJnNjaGVkX3Jlc19yY3Vsb2Nr
KTsKPj4gICB9Cj4+ICAgCj4+ICsvKgo+PiArICogU3dpdGNoIHRvIGEgbmV3IGNvbnRleHQgb3Ig
a2VlcCB0aGUgY3VycmVudCBvbmUgcnVubmluZy4KPj4gKyAqIE9uIHg4NiBpdCB3b24ndCByZXR1
cm4sIHNvIGl0IHdpbGwgZHJvcCB0aGUgc3RpbGwgaGVsZCBzY2hlZF9yZXNfcmN1bG9jay4KPj4g
KyAqLwo+PiAgIHN0YXRpYyB2b2lkIHNjaGVkX2NvbnRleHRfc3dpdGNoKHN0cnVjdCB2Y3B1ICp2
cHJldiwgc3RydWN0IHZjcHUgKnZuZXh0LAo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIGJvb2wgcmVzZXRfaWRsZV91bml0LCBzX3RpbWVfdCBub3cpCj4+ICAgewo+IAo+IEkg
ZG9uJ3QgZm9sbG93IHRoZSBjb21tZW50OiBUaGVyZSdzCj4gCj4gICAgICAgICAgcmV0dXJuIGNv
bnRpbnVlX3J1bm5pbmcodnByZXYpOwo+IAo+IGluIHRoZSBmdW5jdGlvbiB3aGljaCBhZmFpY3Qg
Y2FuIGhhcHBlbiBvbiBhbGwgYXJjaGl0ZWN0dXJlcy4KPiBUaGUgbG9jayBnZXRzIGRyb3BwZWQg
dGhlcmUgdG9vLiBJIHNlZSBubyBwYXRoIHRocm91Z2ggdGhpcwo+IGZ1bmN0aW9uIHdoZXJlIHRo
ZSBsb2NrIHdvdWxkIG5vdCBnZXQgZHJvcHBlZC4KCkl0IHdhcyBtZWFudCBhcyByZWFzb25pbmc6
IGR1ZSB0byB0aGUgZmFjdCB0aGF0IHNjaGVkX2NvbnRleHRfc3dpdGNoKCkKd29uJ3QgcmV0dXJu
IG9uIHg4NiwgaXQgaXMgcmVxdWlyZWQgdGhhdCBpdCB3aWxsIGRyb3Agc2NoZWRfcmVzX3JjdWxv
Y2suCgo+IAo+PiBAQCAtMjQwOCw2ICsyNDEyLDkgQEAgc3RhdGljIHN0cnVjdCB2Y3B1ICpzY2hl
ZF9mb3JjZV9jb250ZXh0X3N3aXRjaChzdHJ1Y3QgdmNwdSAqdnByZXYsCj4+ICAgICogemVybyBk
b19zY2hlZHVsZSgpIGlzIGNhbGxlZCBhbmQgdGhlIHJlbmRlenZvdXMgY291bnRlciBmb3IgbGVh
dmluZwo+PiAgICAqIGNvbnRleHRfc3dpdGNoKCkgaXMgc2V0LiBBbGwgb3RoZXIgbWVtYmVycyB3
aWxsIHdhaXQgdW50aWwgdGhlIGNvdW50ZXIgaXMKPj4gICAgKiBiZWNvbWluZyB6ZXJvLCBkcm9w
cGluZyB0aGUgc2NoZWR1bGUgbG9jayBpbiBiZXR3ZWVuLgo+PiArICogRWl0aGVyIHJldHVybnMg
dGhlIG5ldyB1bml0IHRvIHJ1biwgb3IgTlVMTCBpZiBubyBjb250ZXh0IHN3aXRjaCBpcwo+PiAr
ICogcmVxdWlyZWQgb3IgKG9uIEFSTSkgaGFzIGFscmVhZHkgYmVlbiBwZXJmb3JtZWQuIElmIE5V
TEwgaXMgcmV0dXJuZWQKPj4gKyAqIHNjaGVkX3Jlc19yY3Vsb2NrIGhhcyBiZWVuIGRyb3BwZWQu
Cj4gCj4gSSBndWVzcyBvZmZpY2lhbCBBcm0gZm9sa3Mgd291bGQgbGlrZSBBcm0gdG8gbm90IGJl
IHNwZWxsZWQgYWxsCj4gdXBwZXIgY2FzZSBhbnltb3JlLgoKT2theS4KCj4gCj4+IEBAIC0yNDgy
LDYgKzI0OTAsMjEgQEAgc3RhdGljIHN0cnVjdCBzY2hlZF91bml0ICpzY2hlZF93YWl0X3JlbmRl
enZvdXNfaW4oc3RydWN0IHNjaGVkX3VuaXQgKnByZXYsCj4+ICAgICAgICAgICAgICAgYXRvbWlj
X3NldCgmcHJldi0+bmV4dF90YXNrLT5yZW5kZXp2b3VzX291dF9jbnQsIDApOwo+PiAgICAgICAg
ICAgICAgIHByZXYtPnJlbmRlenZvdXNfaW5fY250ID0gMDsKPj4gICAgICAgICAgIH0KPj4gKwo+
PiArICAgICAgICAvKgo+PiArICAgICAgICAgKiBDaGVjayBmb3Igc2NoZWR1bGluZyByZXNvdXJj
ZWQgc3dpdGNoZWQuIFRoaXMgaGFwcGVucyB3aGVuIHdlIGFyZQo+PiArICAgICAgICAgKiBtb3Zl
ZCBhd2F5IGZyb20gb3VyIGNwdXBvb2wgYW5kIGNwdXMgYXJlIHN1YmplY3Qgb2YgdGhlIGlkbGUK
Pj4gKyAgICAgICAgICogc2NoZWR1bGVyIG5vdy4KPj4gKyAgICAgICAgICovCj4gCj4gVGhlICdk
JyBvbiBib3RoICJyZXNvdXJjZWQiIGFuZCAic3dpdGNoZWQiIGFyZSBvZGQgdG8gcmVhZCBhdAo+
IGxlYXN0IHRvIG1lLCBhbmQgaGVuY2UgbWFrZSBtZSB1bmNlcnRhaW4gd2hldGhlciBJIGFjdHVh
bGx5Cj4gY29ycmVjdGx5IHVuZGVyc3RhbmQgd2hhdCBpcyBtZWFudCBoZXJlLgoKU2hvdWxkIGJl
ICJyZXNvdXJjZXMiLCBvZiBjb3Vyc2UuCgoKSnVlcmdlbgoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
