Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2311F145945
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jan 2020 17:03:54 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iuIQa-0000XR-VB; Wed, 22 Jan 2020 16:00:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=q9GK=3L=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iuIQa-0000XM-6q
 for xen-devel@lists.xenproject.org; Wed, 22 Jan 2020 16:00:24 +0000
X-Inumbo-ID: 4c037e7e-3d30-11ea-bc9b-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4c037e7e-3d30-11ea-bc9b-12813bfff9fa;
 Wed, 22 Jan 2020 16:00:23 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 64944AFB0;
 Wed, 22 Jan 2020 16:00:22 +0000 (UTC)
To: "Durrant, Paul" <pdurrant@amazon.co.uk>
References: <20200121120009.1767-1-pdurrant@amazon.com>
 <20200121120009.1767-3-pdurrant@amazon.com>
 <018a1293-ad4f-44e3-ab73-90491077e434@suse.com>
 <9ad0b7eec02945dba00017f3bfe85730@EX13D32EUC003.ant.amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6e32eeac-29d8-6e1b-f7be-5e2df9d104e4@suse.com>
Date: Wed, 22 Jan 2020 17:00:30 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <9ad0b7eec02945dba00017f3bfe85730@EX13D32EUC003.ant.amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 2/3] x86 / hvm: add
 domain_relinquish_resources() method
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
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjIuMDEuMjAyMCAxNjo1NiwgRHVycmFudCwgUGF1bCB3cm90ZToKPj4gLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0KPj4gRnJvbTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+
PiBTZW50OiAyMiBKYW51YXJ5IDIwMjAgMTU6NTEKPj4gVG86IER1cnJhbnQsIFBhdWwgPHBkdXJy
YW50QGFtYXpvbi5jby51az4KPj4gQ2M6IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZzsg
QW5kcmV3IENvb3Blcgo+PiA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT47IFdlaSBMaXUgPHds
QHhlbi5vcmc+OyBSb2dlciBQYXUgTW9ubsOpCj4+IDxyb2dlci5wYXVAY2l0cml4LmNvbT47IEp1
biBOYWthamltYSA8anVuLm5ha2FqaW1hQGludGVsLmNvbT47IEtldmluIFRpYW4KPj4gPGtldmlu
LnRpYW5AaW50ZWwuY29tPgo+PiBTdWJqZWN0OiBSZTogW1BBVENIIDIvM10geDg2IC8gaHZtOiBh
ZGQgZG9tYWluX3JlbGlucXVpc2hfcmVzb3VyY2VzKCkKPj4gbWV0aG9kCj4+Cj4+IE9uIDIxLjAx
LjIwMjAgMTM6MDAsIFBhdWwgRHVycmFudCB3cm90ZToKPj4+IFRoZXJlIGFyZSB0d28gZnVuY3Rp
b25zIGluIGh2bS5jIHRvIGRlYWwgd2l0aCB0ZWFyLWRvd24gYW5kIGEgZG9tYWluOgo+Pj4gaHZt
X2RvbWFpbl9yZWxpbnF1aXNoX3Jlc291cmNlcygpIGFuZCBodm1fZG9tYWluX2Rlc3Ryb3koKS4g
SG93ZXZlciwKPj4gb25seQo+Pj4gdGhlIGxhdHRlciBoYXMgYW4gYXNzb2NpYXRlZCBtZXRob2Qg
aW4gJ2h2bV9mdW5jcycuIFRoaXMgcGF0Y2ggYWRkcwo+Pj4gYSBtZXRob2QgZm9yIHRoZSBmb3Jt
ZXIgYW5kIHN0dWIgZGVmaW5pdGlvbnMgZm9yIFNWTSBhbmQgVk1YLgo+Pgo+PiBXaHkgdGhlIHN0
dWJzPyBTaW1wbHkgLi4uCj4+Cj4+PiAtLS0gYS94ZW4vYXJjaC94ODYvaHZtL2h2bS5jCj4+PiAr
KysgYi94ZW4vYXJjaC94ODYvaHZtL2h2bS5jCj4+PiBAQCAtNzE1LDYgKzcxNSw4IEBAIGludCBo
dm1fZG9tYWluX2luaXRpYWxpc2Uoc3RydWN0IGRvbWFpbiAqZCkKPj4+Cj4+PiAgdm9pZCBodm1f
ZG9tYWluX3JlbGlucXVpc2hfcmVzb3VyY2VzKHN0cnVjdCBkb21haW4gKmQpCj4+PiAgewo+Pj4g
KyAgICBodm1fZnVuY3MuZG9tYWluX3JlbGlucXVpc2hfcmVzb3VyY2VzKGQpOwo+Pgo+PiAuLi4g
c3RpY2sgYSBOVUxMIGNoZWNrIGFyb3VuZCB0aGlzIG9uZS4gSSBhbHNvIHdvbmRlciB3aGV0aGVy
LCBpdAo+PiBiZWluZyBlbnRpcmVseSBuZXcsIHRoaXMgd291bGRuJ3QgYmV0dGVyIHVzZSBhbHRl
cm5hdGl2ZSBjYWxsCj4+IHBhdGNoaW5nIHJpZ2h0IGZyb20gdGhlIGJlZ2lubmluZy4gSXQncyBu
b3QgdGhlIGhvdHRlc3QgcGF0aCwgYnV0Cj4+IGF2b2lkaW5nIGluZGlyZWN0IGNhbGxzIHNlZW1z
IHF1aXRlIGRlc2lyYWJsZSwgZXNwZWNpYWxseSB3aGVuCj4+IGRvaW5nIHNvIGlzIHJlbGF0aXZl
bHkgY2hlYXAuCj4+Cj4gCj4gSSdkIGxpa2UgaXQgdG8gYWxpZ24gd2l0aCB0aGUgcmVzdCBvZiB0
aGUgaHZtX2Z1bmNzIHNvIEknbGwgYWRkIHRoZQo+IE5VTEwgY2hlY2ssIGJ1dCBhbHRlcm5hdGl2
ZXMgcGF0Y2ggZm9yIGFsbCBodm1fZnVuY3Mgc2VlbXMgbGlrZSBhCj4gZ29vZCB0aGluZyBJIHRo
ZSBsb25nZXIgdGVybS4KClRoZSBmcmVxdWVudGx5IHVzZWQgb25lcyBoYXZlIGJlZW4gY29udmVy
dGVkIGFscmVhZHkuIEhlbmNlIG15CnN1Z2dlc3Rpb24gdG8gbWFrZSBuZXcgb25lcyB1c2UgdGhh
dCBtb2RlbCBmcm9tIHRoZSBiZWdpbm5pbmcuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
