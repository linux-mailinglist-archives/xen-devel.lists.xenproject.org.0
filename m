Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AA9C1D166
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2019 23:39:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQf6L-0002W4-Je; Tue, 14 May 2019 21:36:45 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zxYt=TO=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hQf6J-0002Vy-Nt
 for xen-devel@lists.xenproject.org; Tue, 14 May 2019 21:36:43 +0000
X-Inumbo-ID: 5d50588d-7690-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 5d50588d-7690-11e9-8980-bc764e045a96;
 Tue, 14 May 2019 21:36:42 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 26AF9374;
 Tue, 14 May 2019 14:36:42 -0700 (PDT)
Received: from [10.37.12.96] (unknown [10.37.12.96])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C59CB3F703;
 Tue, 14 May 2019 14:36:39 -0700 (PDT)
To: Paul Durrant <Paul.Durrant@citrix.com>, 'Jan Beulich' <JBeulich@suse.com>
References: <20190508132403.1454-1-paul.durrant@citrix.com>
 <20190508132403.1454-4-paul.durrant@citrix.com>
 <5CD99729020000780022E4B1@prv1-mh.provo.novell.com>
 <246a87e654194e5082852b63853415d6@AMSPEX02CL03.citrite.net>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <2da785c2-04cd-2c26-bae5-f45437d87282@arm.com>
Date: Tue, 14 May 2019 22:36:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <246a87e654194e5082852b63853415d6@AMSPEX02CL03.citrite.net>
Content-Language: en-US
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
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 xen-devel <xen-devel@lists.xenproject.org>, Brian Woods <brian.woods@amd.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiA1LzE0LzE5IDU6MTkgUE0sIFBhdWwgRHVycmFudCB3cm90ZToKPj4gLS0tLS1Pcmln
aW5hbCBNZXNzYWdlLS0tLS0KPj4gRnJvbTogSmFuIEJldWxpY2ggW21haWx0bzpKQmV1bGljaEBz
dXNlLmNvbV0KPj4gU2VudDogMTMgTWF5IDIwMTkgMDk6MTEKPj4gVG86IFBhdWwgRHVycmFudCA8
UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+Cj4+IENjOiBCcmlhbiBXb29kcyA8YnJpYW4ud29vZHNA
YW1kLmNvbT47IFN1cmF2ZWUgU3V0aGlrdWxwYW5pdCA8c3VyYXZlZS5zdXRoaWt1bHBhbml0QGFt
ZC5jb20+OyBKdWxpZW4KPj4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPjsgQW5kcmV3IENv
b3BlciA8QW5kcmV3LkNvb3BlcjNAY2l0cml4LmNvbT47IFJvZ2VyIFBhdSBNb25uZQo+PiA8cm9n
ZXIucGF1QGNpdHJpeC5jb20+OyBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPjsgS2V2aW4g
VGlhbiA8a2V2aW4udGlhbkBpbnRlbC5jb20+OyBTdGVmYW5vCj4+IFN0YWJlbGxpbmkgPHNzdGFi
ZWxsaW5pQGtlcm5lbC5vcmc+OyB4ZW4tZGV2ZWwgPHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZz4KPj4gU3ViamVjdDogUmU6IFtQQVRDSCAzLzVdIGlvbW11OiBtb3ZlIGlvbW11X2dldF9v
cHMoKSBpbnRvIGNvbW1vbiBjb2RlCj4+Cj4+Pj4+IE9uIDA4LjA1LjE5IGF0IDE1OjI0LCA8cGF1
bC5kdXJyYW50QGNpdHJpeC5jb20+IHdyb3RlOgo+Pj4gQ3VycmVudGx5IHg4NiBhbmQgQVJNIGRp
ZmZlciBpbiB0aGVpciBpbXBsZW1lbnRhdGlvbiBmb3Igbm8gZ29vZCByZWFzb24uCj4+PiBUaGlz
IHBhdGNoIG1vdmVzIHRoZSBBUk0gdmFyaWFudCBvZiBpb21tdV9nZXQvc2V0X29wcygpIGhlbHBl
cnMgaW50bwo+Pj4gY29tbW9uIGNvZGUgYW5kIG1vZGlmaWVzIHRoZW0gc28gdGhleSBkZWFsIHdp
dGggdGhlIF9faW5pdGNvbnN0cmVsCj4+PiBvcHMgc3RydWN0dXJlcyB1c2VkIGJ5IHRoZSB4ODYg
SU9NTVUgdmVuZG9yIGltcGxlbWVudGF0aW9ucyAoYWRkaW5nCj4+PiBfX2luaXRjb25zdHJlbCB0
byB0aGUgU01NVSBjb2RlIHRvIGJyaW5nIGl0IGluIGxpbmUpLiBDb25zZXF1ZW50bHksIGEgbGFj
awo+Pj4gb2YgaW5pdCgpIG1ldGhvZCBpcyBub3cgdGFrZW4gdG8gbWVhbiB1bmluaXRpYWxpemVk
IGlvbW11X29wcy4gQWxzbywgdGhlCj4+PiBwcmludGsgd2FybmluZyBpbiBpb21tdV9zZXRfb3Bz
KCkgbm93IGJlY29tZXMgYW4gQVNTRVJULgo+Pgo+PiBXaGVuIGhhdmluZyBzdWJtaXR0ZWQgdGhl
IGluZGlyZWN0IGNhbGwgb3ZlcmhlYWQgcmVkdWN0aW9uIHNlcmllcwo+PiBpbmNsdWRpbmcgSU9N
TVUgY2hhbmdlcyBmb3IgdGhlIGZpcnN0IHRpbWUsIEkgd2FzIHRvbGQgdGhhdCB0aGUgQXJtCj4+
IGZvbGtzIHdvdWxkIGxpa2UgdG8gcmV0YWluIHRoZSBhYmlsaXR5IHRvIGV2ZW50dWFsbHkgc3Vw
cG9ydAo+PiBoZXRlcm9nZW5lb3VzIElPTU1VcyAoYW5kIGhlbmNlIEkgc2hvdWxkbid0IHByb3Zp
ZGUgcGF0Y2hpbmcKPj4gaW5mcmFzdHJ1Y3R1cmUgdGhlcmUpLiBBIHNpbmdsZSBnbG9iYWwgaW9t
bXVfW2dzXWV0X29wcygpIGlzIHNvcnQgb2YKPj4gZ2V0dGluZyBpbiB0aGUgd2F5IG9mIHRoaXMg
YXMgd2VsbCwgSSB0aGluaywgYW5kIGhlbmNlIEknbSBub3Qgc3VyZSBpdAo+PiBpcyBhIGRlc2ly
YWJsZSBzdGVwIHRvIG1ha2UgdGhpcyBzbyBmYXIgQXJtLXNwZWNpZmljIGFycmFuZ2VtZW50Cj4+
IHRoZSBnZW5lcmFsIG1vZGVsLiBBdCBsZWFzdCBpdCB3b3VsZCBmdXJ0aGVyIGNvbXBsaWNhdGUg
QXJtIHNpZGUKPj4gY2hhbmdlcyB0b3dhcmRzIHRoYXQgKG1pZCAvIGxvbmcgdGVybT8pIGdvYWwu
CgpUaGF0J3MgY29ycmVjdCwgaXQgaXMgYSBtaWQgLyBsb25nIHRlcm0gcGxhbi4KCj4+Cj4gCj4g
T2suIERvIHlvdSBoYXZlIGFueSBtb3JlIGluZm9ybWF0aW9uIG9uIHdoYXQgc3VjaCBhbiBhcmNo
aXRlY3R1cmUgd291bGQgbG9vayBsaWtlPyBJIGd1ZXNzIGl0IGlzIGFsc28gY29uY2VpdmFibGUg
dGhhdCBhbiB4ODYgYXJjaGl0ZWN0dXJlIG1pZ2h0IGhhdmUgc2xpZ2h0bHkgZGlmZmVyZW50IElP
TU1VIGltcGxlbWVudGF0aW9ucyAob3IgYXQgbGVhc3QgcXVpcmtzKSBmb3IgZGlmZmVyZW50IFBD
SSBzZWdtZW50cy4gU28gcGVyaGFwcyBhIGdsb2JhbCBvcHMgc3RydWN0dXJlIGlzIG5vdCBhIGdv
b2QgaWRlYSBpbiB0aGUgbG9uZyBydW4uCkkgY2FuIHNlZSB0d28gdXNlcyBjYXNlczoKICAgICAx
KSBGaW5kaW5nIHRoZSBJT01NVSBhc3NvY2lhdGVkIHRvIGEgZGV2aWNlCiAgICAgMikgQXBwbHlp
bmcgYW4gb3BlcmF0aW9uIChpLmUgZG9tYWluIGNyZWF0aW9uL2Rlc3RydWN0aW9uLCAKbWFwL3Vu
bWFwKSBvbiBhbGwgdGhlIElPTU1VCgpBY3R1YWxseSwgd2UgYWxyZWFkeSBoYXZlIHNpbWlsYXIg
Y29uY2VwdCB3aXRoaW4gdGhlIFNNTVUgZHJpdmVyIGJlY2F1c2UgCmEgcGxhdGZvcm0gbWF5IGNv
bnRhaW4gbXVsdGlwbGUgU01NVXMuCgpBbnkgZ2VuZXJpYyBpbnRlcmZhY2Ugd291bGQgYWN0dWFs
bHkgYmUgcXVpdGUgYmVuZWZpY2lhbCBhcyB3ZSBjb3VsZCAKc2ltcGxpZnkgYSBsb3QgdGhlIGRy
aXZlciBhbmQgYXZvaWQgZHVwbGljYXRpbmcgdGhlIGxvZ2ljIGluIGFsbCB0aGUgbmV3IApBcm0g
ZHJpdmVycy4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
