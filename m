Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D5881C85D
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2019 14:17:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQWL4-0007FF-JR; Tue, 14 May 2019 12:15:22 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9bz0=TO=citrix.com=prvs=030a53c6a=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hQWL3-0007F1-4G
 for xen-devel@lists.xenproject.org; Tue, 14 May 2019 12:15:21 +0000
X-Inumbo-ID: efc55400-7641-11e9-8980-bc764e045a96
Received: from SMTP.EU.CITRIX.COM (unknown [185.25.65.24])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id efc55400-7641-11e9-8980-bc764e045a96;
 Tue, 14 May 2019 12:15:18 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,468,1549929600"; d="scan'208";a="89715900"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: 'Jan Beulich' <JBeulich@suse.com>, xen-devel
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH] IOMMU: avoid NULL deref in iommu_lookup_page()
Thread-Index: AQHVCk0Zf5RSpoPIZk+nxiumZSpmp6ZqiKHg
Date: Tue, 14 May 2019 12:15:17 +0000
Message-ID: <dbb7298962984533ace67bdc1d358745@AMSPEX02CL03.citrite.net>
References: <5CDAAE9E020000780022E944@prv1-mh.provo.novell.com>
In-Reply-To: <5CDAAE9E020000780022E944@prv1-mh.provo.novell.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] IOMMU: avoid NULL deref in
 iommu_lookup_page()
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim \(Xen.org\)" <tim@xen.org>,
 George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien.grall@arm.com>,
 Ian Jackson <Ian.Jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IEphbiBCZXVsaWNoIFttYWlsdG86
SkJldWxpY2hAc3VzZS5jb21dCj4gU2VudDogMTQgTWF5IDIwMTkgMDU6MDQKPiBUbzogeGVuLWRl
dmVsIDx4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc+Cj4gQ2M6IEp1bGllbiBHcmFsbCA8
anVsaWVuLmdyYWxsQGFybS5jb20+OyBBbmRyZXcgQ29vcGVyIDxBbmRyZXcuQ29vcGVyM0BjaXRy
aXguY29tPjsgUGF1bCBEdXJyYW50Cj4gPFBhdWwuRHVycmFudEBjaXRyaXguY29tPjsgV2VpIExp
dSA8d2VpLmxpdTJAY2l0cml4LmNvbT47IEdlb3JnZSBEdW5sYXAgPEdlb3JnZS5EdW5sYXBAY2l0
cml4LmNvbT47Cj4gSWFuIEphY2tzb24gPElhbi5KYWNrc29uQGNpdHJpeC5jb20+OyBTdGVmYW5v
IFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+OyBLb25yYWQgUnplc3p1dGVrCj4g
V2lsayA8a29ucmFkLndpbGtAb3JhY2xlLmNvbT47IFRpbSAoWGVuLm9yZykgPHRpbUB4ZW4ub3Jn
Pgo+IFN1YmplY3Q6IFtQQVRDSF0gSU9NTVU6IGF2b2lkIE5VTEwgZGVyZWYgaW4gaW9tbXVfbG9v
a3VwX3BhZ2UoKQo+IAo+IEx1Y2tpbHkgdGhlIGZ1bmN0aW9uIGN1cnJlbnRseSBoYXMgbm8gY2Fs
bGVycyAtIGl0IHdvdWxkIGhhdmUgY2FsbGVkCj4gdGhyb3VnaCBOVUxMIGZvciBib3RoIEFybSBh
bmQgeDg2L0FNRC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+CgpSZXZpZXdlZC1ieTogUGF1bCBEdXJyYW50IDxwYXVsLmR1cnJhbnRAY2l0cml4LmNv
bT4KCj4gCj4gLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvaW9tbXUuYwo+ICsrKyBiL3hl
bi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2lvbW11LmMKPiBAQCAtNDA5LDcgKzQwOSw3IEBAIGludCBp
b21tdV9sb29rdXBfcGFnZShzdHJ1Y3QgZG9tYWluICpkLAo+ICB7Cj4gICAgICBjb25zdCBzdHJ1
Y3QgZG9tYWluX2lvbW11ICpoZCA9IGRvbV9pb21tdShkKTsKPiAKPiAtICAgIGlmICggIWlvbW11
X2VuYWJsZWQgfHwgIWhkLT5wbGF0Zm9ybV9vcHMgKQo+ICsgICAgaWYgKCAhaW9tbXVfZW5hYmxl
ZCB8fCAhaGQtPnBsYXRmb3JtX29wcyB8fCAhaGQtPnBsYXRmb3JtX29wcy0+bG9va3VwX3BhZ2Ug
KQo+ICAgICAgICAgIHJldHVybiAtRU9QTk9UU1VQUDsKPiAKPiAgICAgIHJldHVybiBoZC0+cGxh
dGZvcm1fb3BzLT5sb29rdXBfcGFnZShkLCBkZm4sIG1mbiwgZmxhZ3MpOwo+IAoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
