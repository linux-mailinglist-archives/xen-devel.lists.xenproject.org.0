Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F4E01E850
	for <lists+xen-devel@lfdr.de>; Wed, 15 May 2019 08:35:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQnTG-00020W-Bo; Wed, 15 May 2019 06:32:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=LpR9=TP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hQnTF-00020R-L7
 for xen-devel@lists.xenproject.org; Wed, 15 May 2019 06:32:57 +0000
X-Inumbo-ID: 445864b2-76db-11e9-93d1-8fe4fa6564f7
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 445864b2-76db-11e9-93d1-8fe4fa6564f7;
 Wed, 15 May 2019 06:32:53 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Wed, 15 May 2019 00:32:52 -0600
Message-Id: <5CDBB293020000780022F118@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Wed, 15 May 2019 00:32:51 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Paul Durrant" <paul.durrant@citrix.com>
References: <20190508132403.1454-1-paul.durrant@citrix.com>
 <20190508132403.1454-4-paul.durrant@citrix.com>
 <5CD99729020000780022E4B1@prv1-mh.provo.novell.com>
 <246a87e654194e5082852b63853415d6@AMSPEX02CL03.citrite.net>
In-Reply-To: <246a87e654194e5082852b63853415d6@AMSPEX02CL03.citrite.net>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH 3/5] iommu: move iommu_get_ops() into common
 code
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien.grall@arm.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 xen-devel <xen-devel@lists.xenproject.org>, Brian Woods <brian.woods@amd.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDE0LjA1LjE5IGF0IDE4OjE5LCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+PiAgLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPj4gRnJvbTogSmFuIEJldWxpY2ggW21h
aWx0bzpKQmV1bGljaEBzdXNlLmNvbV0KPj4gU2VudDogMTMgTWF5IDIwMTkgMDk6MTEKPj4gVG86
IFBhdWwgRHVycmFudCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+Cj4+IENjOiBCcmlhbiBXb29k
cyA8YnJpYW4ud29vZHNAYW1kLmNvbT47IFN1cmF2ZWUgU3V0aGlrdWxwYW5pdCAKPiA8c3VyYXZl
ZS5zdXRoaWt1bHBhbml0QGFtZC5jb20+OyBKdWxpZW4KPj4gR3JhbGwgPGp1bGllbi5ncmFsbEBh
cm0uY29tPjsgQW5kcmV3IENvb3BlciA8QW5kcmV3LkNvb3BlcjNAY2l0cml4LmNvbT47IFJvZ2Vy
IAo+IFBhdSBNb25uZQo+PiA8cm9nZXIucGF1QGNpdHJpeC5jb20+OyBXZWkgTGl1IDx3ZWkubGl1
MkBjaXRyaXguY29tPjsgS2V2aW4gVGlhbiAKPiA8a2V2aW4udGlhbkBpbnRlbC5jb20+OyBTdGVm
YW5vCj4+IFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+OyB4ZW4tZGV2ZWwgPHhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZz4KPj4gU3ViamVjdDogUmU6IFtQQVRDSCAzLzVd
IGlvbW11OiBtb3ZlIGlvbW11X2dldF9vcHMoKSBpbnRvIGNvbW1vbiBjb2RlCj4+IAo+PiA+Pj4g
T24gMDguMDUuMTkgYXQgMTU6MjQsIDxwYXVsLmR1cnJhbnRAY2l0cml4LmNvbT4gd3JvdGU6Cj4+
ID4gQ3VycmVudGx5IHg4NiBhbmQgQVJNIGRpZmZlciBpbiB0aGVpciBpbXBsZW1lbnRhdGlvbiBm
b3Igbm8gZ29vZCByZWFzb24uCj4+ID4gVGhpcyBwYXRjaCBtb3ZlcyB0aGUgQVJNIHZhcmlhbnQg
b2YgaW9tbXVfZ2V0L3NldF9vcHMoKSBoZWxwZXJzIGludG8KPj4gPiBjb21tb24gY29kZSBhbmQg
bW9kaWZpZXMgdGhlbSBzbyB0aGV5IGRlYWwgd2l0aCB0aGUgX19pbml0Y29uc3RyZWwKPj4gPiBv
cHMgc3RydWN0dXJlcyB1c2VkIGJ5IHRoZSB4ODYgSU9NTVUgdmVuZG9yIGltcGxlbWVudGF0aW9u
cyAoYWRkaW5nCj4+ID4gX19pbml0Y29uc3RyZWwgdG8gdGhlIFNNTVUgY29kZSB0byBicmluZyBp
dCBpbiBsaW5lKS4gQ29uc2VxdWVudGx5LCBhIGxhY2sKPj4gPiBvZiBpbml0KCkgbWV0aG9kIGlz
IG5vdyB0YWtlbiB0byBtZWFuIHVuaW5pdGlhbGl6ZWQgaW9tbXVfb3BzLiBBbHNvLCB0aGUKPj4g
PiBwcmludGsgd2FybmluZyBpbiBpb21tdV9zZXRfb3BzKCkgbm93IGJlY29tZXMgYW4gQVNTRVJU
Lgo+PiAKPj4gV2hlbiBoYXZpbmcgc3VibWl0dGVkIHRoZSBpbmRpcmVjdCBjYWxsIG92ZXJoZWFk
IHJlZHVjdGlvbiBzZXJpZXMKPj4gaW5jbHVkaW5nIElPTU1VIGNoYW5nZXMgZm9yIHRoZSBmaXJz
dCB0aW1lLCBJIHdhcyB0b2xkIHRoYXQgdGhlIEFybQo+PiBmb2xrcyB3b3VsZCBsaWtlIHRvIHJl
dGFpbiB0aGUgYWJpbGl0eSB0byBldmVudHVhbGx5IHN1cHBvcnQKPj4gaGV0ZXJvZ2VuZW91cyBJ
T01NVXMgKGFuZCBoZW5jZSBJIHNob3VsZG4ndCBwcm92aWRlIHBhdGNoaW5nCj4+IGluZnJhc3Ry
dWN0dXJlIHRoZXJlKS4gQSBzaW5nbGUgZ2xvYmFsIGlvbW11X1tnc11ldF9vcHMoKSBpcyBzb3J0
IG9mCj4+IGdldHRpbmcgaW4gdGhlIHdheSBvZiB0aGlzIGFzIHdlbGwsIEkgdGhpbmssIGFuZCBo
ZW5jZSBJJ20gbm90IHN1cmUgaXQKPj4gaXMgYSBkZXNpcmFibGUgc3RlcCB0byBtYWtlIHRoaXMg
c28gZmFyIEFybS1zcGVjaWZpYyBhcnJhbmdlbWVudAo+PiB0aGUgZ2VuZXJhbCBtb2RlbC4gQXQg
bGVhc3QgaXQgd291bGQgZnVydGhlciBjb21wbGljYXRlIEFybSBzaWRlCj4+IGNoYW5nZXMgdG93
YXJkcyB0aGF0IChtaWQgLyBsb25nIHRlcm0/KSBnb2FsLgo+Pgo+IAo+IE9rLiBEbyB5b3UgaGF2
ZSBhbnkgbW9yZSBpbmZvcm1hdGlvbiBvbiB3aGF0IHN1Y2ggYW4gYXJjaGl0ZWN0dXJlIHdvdWxk
IGxvb2sgCj4gbGlrZT8gSSBndWVzcyBpdCBpcyBhbHNvIGNvbmNlaXZhYmxlIHRoYXQgYW4geDg2
IGFyY2hpdGVjdHVyZSBtaWdodCBoYXZlIAo+IHNsaWdodGx5IGRpZmZlcmVudCBJT01NVSBpbXBs
ZW1lbnRhdGlvbnMgKG9yIGF0IGxlYXN0IHF1aXJrcykgZm9yIGRpZmZlcmVudCAKPiBQQ0kgc2Vn
bWVudHMuIFNvIHBlcmhhcHMgYSBnbG9iYWwgb3BzIHN0cnVjdHVyZSBpcyBub3QgYSBnb29kIGlk
ZWEgaW4gdGhlIAo+IGxvbmcgcnVuLgoKRGlmZmVyZW50IHF1aXJrcyBjb3VsZCBsaWtlbHkgYmUg
aGFuZGxlZCB3aXRoIGEgZ2xvYmFsIG9wcyBpbnN0YW5jZS4KVGhlIGluZGlyZWN0IGNhbGwgb3Zl
cmhlYWQgZWxpbWluYXRpb24gYWxvbmUgd2lsbCBpbW8gbWFrZSBpdAp1bmRlc2lyYWJsZSB0byBz
d2l0Y2ggdG8gYSBub24tZ2xvYmFsLW9wcyBtb2RlbCBvbiB4ODYsIHVubGVzcwp0aGVyZSdzIGEg
c3Ryb25nIHJlYXNvbiAobGlrZSB0cnVseSBkaWZmZXJlbnQgSU9NTVVzIGluIGEgc2luZ2xlCnN5
c3RlbSkuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
