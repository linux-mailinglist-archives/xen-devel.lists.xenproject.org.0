Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95CAC10C657
	for <lists+xen-devel@lfdr.de>; Thu, 28 Nov 2019 11:04:18 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iaGbh-0004oB-J9; Thu, 28 Nov 2019 10:01:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Hmpo=ZU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iaGbg-0004o4-1V
 for xen-devel@lists.xenproject.org; Thu, 28 Nov 2019 10:01:04 +0000
X-Inumbo-ID: fbe5badc-11c5-11ea-a55d-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fbe5badc-11c5-11ea-a55d-bc764e2007e4;
 Thu, 28 Nov 2019 10:01:02 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id A3B03B436;
 Thu, 28 Nov 2019 10:01:01 +0000 (UTC)
To: Yi Sun <yi.y.sun@linux.intel.com>
References: <1574835871-5005-1-git-send-email-yi.y.sun@linux.intel.com>
 <accd9696-9215-c1b3-9223-a2a3f783da4f@suse.com>
 <20191128081706.GT18465@yi.y.sun>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <cb8566ec-014c-b1b1-15a0-cb20a05647ed@suse.com>
Date: Thu, 28 Nov 2019 11:01:09 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191128081706.GT18465@yi.y.sun>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v1] psr: fix bug which may cause crash
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
Cc: andrew.cooper3@citrix.com, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjguMTEuMjAxOSAwOToxNywgWWkgU3VuIHdyb3RlOgo+IE9uIDE5LTExLTI3IDExOjA2OjQ5
LCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMjcuMTEuMjAxOSAwNzoyNCwgWWkgU3VuIHdyb3Rl
Ogo+Pj4gLS0tIGEveGVuL2FyY2gveDg2L3Bzci5jCj4+PiArKysgYi94ZW4vYXJjaC94ODYvcHNy
LmMKPj4+IEBAIC0zMTYsNiArMzE2LDcgQEAgc3RhdGljIGJvb2wgY2F0X2luaXRfZmVhdHVyZShj
b25zdCBzdHJ1Y3QgY3B1aWRfbGVhZiAqcmVncywKPj4+ICAgICAgICAgIFtGRUFUX1RZUEVfTDNf
Q0RQXSA9ICJMMyBDRFAiLAo+Pj4gICAgICAgICAgW0ZFQVRfVFlQRV9MMl9DQVRdID0gIkwyIENB
VCIsCj4+PiAgICAgIH07Cj4+PiArICAgIHVuc2lnbmVkIGludCBpID0gMDsKPj4KPj4gVW5uZWNl
c3NhcnkgaW5pdGlhbGl6ZXIgYW5kIHRvbyB3aWRlIGEgc2NvcGUuCj4+Cj4gT2ssIHU4IGlzIGVu
b3VnaC4KCkRpZCB5b3UgcGVyaGFwcyBtaXN0YWtlICJzY29wZSIgZm9yICJ3aWR0aCI/IFlvdSBz
aG91bGRuJ3QgdXNlCmZpeGVkIHdpZHRoIHR5cGVzIHdoZW4gdGhlcmUncyBubyBzdHJpY3QgbmVl
ZCB0byBkbyBzby4KCj4+PiBAQCAtMzMyLDcgKzMzMyw4IEBAIHN0YXRpYyBib29sIGNhdF9pbml0
X2ZlYXR1cmUoY29uc3Qgc3RydWN0IGNwdWlkX2xlYWYgKnJlZ3MsCj4+PiAgICAgICAgICAgICAg
cmV0dXJuIGZhbHNlOwo+Pj4gIAo+Pj4gICAgICAgICAgLyogV2UgcmVzZXJ2ZSBjb3M9MCBhcyBk
ZWZhdWx0IGNibSAoYWxsIGJpdHMgd2l0aGluIGNibV9sZW4gYXJlIDEpLiAqLwo+Pj4gLSAgICAg
ICAgZmVhdC0+Y29zX3JlZ192YWxbMF0gPSBjYXRfZGVmYXVsdF92YWwoZmVhdC0+Y2F0LmNibV9s
ZW4pOwo+Pj4gKyAgICAgICAgZm9yKGkgPSAwOyBpIDwgTUFYX0NPU19SRUdfQ05UOyBpKyspCj4+
Cj4+IFRoZXJlIGFyZSBudW1iZXIgb2YgYmxhbmtzIG1pc3NpbmcgaGVyZSAoYW5kIGV2ZW4gbW9y
ZSBvbmVzIGluCj4+IHRoZSBvdGhlciBpbnN0YW5jZSBiZWxvdykuIEl0IGFsc28gc2VlbXMgdG8g
bWUgdGhhdCB0aGUgY29tbWVudAo+PiBlbmRzIHVwIG1pc3BsYWNlZCBub3cuIElmIC4uLgo+Pgo+
IFNvcnJ5LCB0aGUgY29tbWVudCBzaG91bGQgYmUgbW9kaWZpZWQuCj4gCj4+PiArICAgICAgICAg
ICAgZmVhdC0+Y29zX3JlZ192YWxbaV0gPSBjYXRfZGVmYXVsdF92YWwoZmVhdC0+Y2F0LmNibV9s
ZW4pOwo+Pj4gIAo+Pj4gICAgICAgICAgd3Jtc3JsKCh0eXBlID09IEZFQVRfVFlQRV9MM19DQVQg
Pwo+Pj4gICAgICAgICAgICAgICAgICBNU1JfSUEzMl9QU1JfTDNfTUFTSygwKSA6Cj4+Cj4+IC4u
LiB0aGlzIGluZGVlZCBpcyB0byByZW1haW4gYSBzaW5nbGUgd3JpdGUsIGl0IG1heSB3YW50IHRv
IG1vdmUKPj4gaGVyZS4gQnV0IGFzIHBlciBhYm92ZSBrZWVwaW5nIGNhY2hlZCBhbmQgYWN0dWFs
IHZhbHVlcyBpbiBzeW5jCj4+IG1heSBtYWtlIGl0IG5lY2Vzc2FyeSB0byBtb3ZlIHRoaXMgd3Jp
dGUgaW50byB0aGUgbG9vcCBhcyB3ZWxsLgo+Pgo+IFlvdSBhcmUgcmlnaHQsIEkgbWlzc2VkIHRv
IGxvb3AgdGhpcyBzZW50ZW5jZS4KPiAKPiBBbm90aGVyIGlkZWE6Cj4gSSByZW1lbWJlcmVkIHRo
YXQgdGhlIG9yaWdpbmFsIHB1cnBvc2UgdG8gb25seSB3cml0ZSBDT1NbMF0gaGVyZSBpcyB0bwo+
IGltcHJvdmUgcGVyZm9ybWFuY2UgYnkgbm90IHdyaXRpbmcgdG9vIG1hbnkgTVNScy4gU28gSSBh
bSB0aGlua2luZyB0bwo+IGNoYW5nZSB0aGUgZml4IHRvIGJlbG93IGxpbmUgaW4gZG9fd3JpdGVf
cHNyX21zcnMoKS4KPiAgICAgaWYgKCBmZWF0LT5jb3NfcmVnX3ZhbFtjb3MgKiBjb3NfbnVtICsg
al0gIT0gaW5mby0+dmFsW2luZGV4XSAmJgo+ICAgICAgICAgIGNvcyA8PSBmZWF0LT5jb3NfbWF4
ICkKPiAKPiBXaGF0IGlzIHlvdXIgb3Bpbmlvbj8gVGhhbmtzIQoKTG9va3MgcmVhc29uYWJsZSwg
cHJvdmlkZWQgaXQgZ2V0cyBhY2NvbXBhbmllZCBieSBhIGJyaWVmIGJ1dApwcmVjaXNlIGNvbW1l
bnQuIEknZCBhbHNvIHN1Z2dlc3Qgc3dpdGNoaW5nIGFyb3VuZCB0aGUgdHdvCnNpZGVzIG9mIHRo
ZSAmJiAuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
