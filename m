Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6DEB17A478
	for <lists+xen-devel@lfdr.de>; Thu,  5 Mar 2020 12:42:34 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j9orT-0002sK-Mp; Thu, 05 Mar 2020 11:40:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=KIN4=4W=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j9orS-0002sF-2q
 for xen-devel@lists.xenproject.org; Thu, 05 Mar 2020 11:40:18 +0000
X-Inumbo-ID: 1598f0d6-5ed6-11ea-b52f-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1598f0d6-5ed6-11ea-b52f-bc764e2007e4;
 Thu, 05 Mar 2020 11:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1583408416;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=rWfFlcPyjHJXPAlfpsMYZNMKC3g+tqMBgYd0nwObWMs=;
 b=d9zKSr3nr7qt5+8NdOfQpeIv7eocLEiHe9+mt8ugTUt7wbneemwc1Inl
 +wiy/mFm4j8U7e9bVvYonNAYpQOT70+9jnKUMtXw1jv1spplneVSmoq5U
 EujuM1CPJTQ/zVNTZPHMpme63U5iXwxmpQ/6Fw8i4DMNp+av9AZn7ntLZ o=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: IvvKxSg4dbeFbcCMb8mQg2hmNKN1dHBlv+hvJ5k3KFzLFrCUo54nSohVm1Nj9rwnVth2BJNI2x
 JPI6ajaUbFkFZkjmq5ELJNIuDQnJREtod5GEE0DAVNLzS2QjoYqf39Aqrjh5n4i0ckGXafk57+
 2o2KJs1bj6VUCj/ZnsetHXwDt6gEzKRo39oFksYnKVKsFne/J+GIhh9stUxLlPpJcGbu7AM9YR
 1f8O2R+xmwDcisfR2+SyZ8jIV2Hect5f8YyO0WH5ivNcnTuhJnwG5NSsUkSOn7qV4JsNMBVpAT
 mXA=
X-SBRS: 2.7
X-MesageID: 13798198
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,517,1574139600"; d="scan'208";a="13798198"
Date: Thu, 5 Mar 2020 12:40:10 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <20200305114010.GV24458@Air-de-Roger.citrite.net>
References: <20200305100331.16790-1-jgross@suse.com>
 <20200305104935.GU24458@Air-de-Roger.citrite.net>
 <20915d12-665e-bd23-2685-d2ec7e015679@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20915d12-665e-bd23-2685-d2ec7e015679@suse.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH] xen/blkfront: fix ring info addressing
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
Cc: Jens Axboe <axboe@kernel.dk>, Stefano Stabellini <sstabellini@kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBNYXIgMDUsIDIwMjAgYXQgMTI6MDQ6MjdQTSArMDEwMCwgSsO8cmdlbiBHcm/DnyB3
cm90ZToKPiBPbiAwNS4wMy4yMCAxMTo0OSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiA+IE9u
IFRodSwgTWFyIDA1LCAyMDIwIGF0IDExOjAzOjMxQU0gKzAxMDAsIEp1ZXJnZW4gR3Jvc3Mgd3Jv
dGU6Cj4gPiA+IENvbW1pdCAwMjY1ZDZlOGRkYjg5MCAoInhlbi9ibGtmcm9udDogbGltaXQgYWxs
b2NhdGVkIG1lbW9yeSBzaXplIHRvCj4gPiA+IGFjdHVhbCB1c2UgY2FzZSIpIG1hZGUgc3RydWN0
IGJsa2Zyb250X3JpbmdfaW5mbyBzaXplIGR5bmFtaWMuIFRoaXMgaXMKPiA+ID4gZmluZSB3aGVu
IHJ1bm5pbmcgd2l0aCBvbmx5IG9uZSBxdWV1ZSwgYnV0IHdpdGggbXVsdGlwbGUgcXVldWVzIHRo
ZQo+ID4gPiBhZGRyZXNzaW5nIG9mIHRoZSBzaW5nbGUgcXVldWVzIGhhcyB0byBiZSBhZGFwdGVk
IGFzIHRoZSBzdHJ1Y3RzIGFyZQo+ID4gPiBhbGxvY2F0ZWQgaW4gYW4gYXJyYXkuCj4gPiAKPiA+
IFRoYW5rcywgYW5kIHNvcnJ5IGZvciBub3QgY2F0Y2hpbmcgdGhpcyBkdXJpbmcgcmV2aWV3Lgo+
ID4gCj4gPiA+IAo+ID4gPiBGaXhlczogMDI2NWQ2ZThkZGI4OTAgKCJ4ZW4vYmxrZnJvbnQ6IGxp
bWl0IGFsbG9jYXRlZCBtZW1vcnkgc2l6ZSB0byBhY3R1YWwgdXNlIGNhc2UiKQo+ID4gPiBTaWdu
ZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+Cj4gPiA+IC0tLQo+ID4g
PiAgIGRyaXZlcnMvYmxvY2sveGVuLWJsa2Zyb250LmMgfCA4MiArKysrKysrKysrKysrKysrKysr
KysrKystLS0tLS0tLS0tLS0tLS0tLS0tLQo+ID4gPiAgIDEgZmlsZSBjaGFuZ2VkLCA0NSBpbnNl
cnRpb25zKCspLCAzNyBkZWxldGlvbnMoLSkKPiA+ID4gCj4gPiA+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2Jsb2NrL3hlbi1ibGtmcm9udC5jIGIvZHJpdmVycy9ibG9jay94ZW4tYmxrZnJvbnQuYwo+
ID4gPiBpbmRleCBlMmFkNmJiYTIyODEuLmE4ZDRhMzgzOGU1ZCAxMDA2NDQKPiA+ID4gLS0tIGEv
ZHJpdmVycy9ibG9jay94ZW4tYmxrZnJvbnQuYwo+ID4gPiArKysgYi9kcml2ZXJzL2Jsb2NrL3hl
bi1ibGtmcm9udC5jCj4gPiA+IEBAIC0yMTMsNiArMjEzLDcgQEAgc3RydWN0IGJsa2Zyb250X2lu
Zm8KPiA+ID4gICAJc3RydWN0IGJsa19tcV90YWdfc2V0IHRhZ19zZXQ7Cj4gPiA+ICAgCXN0cnVj
dCBibGtmcm9udF9yaW5nX2luZm8gKnJpbmZvOwo+ID4gPiAgIAl1bnNpZ25lZCBpbnQgbnJfcmlu
Z3M7Cj4gPiA+ICsJdW5zaWduZWQgaW50IHJpbmZvX3NpemU7Cj4gPiA+ICAgCS8qIFNhdmUgdW5j
b21wbGV0ZSByZXFzIGFuZCBiaW9zIGZvciBtaWdyYXRpb24uICovCj4gPiA+ICAgCXN0cnVjdCBs
aXN0X2hlYWQgcmVxdWVzdHM7Cj4gPiA+ICAgCXN0cnVjdCBiaW9fbGlzdCBiaW9fbGlzdDsKPiA+
ID4gQEAgLTI1OSw2ICsyNjAsMjEgQEAgc3RhdGljIGludCBibGtmcm9udF9zZXR1cF9pbmRpcmVj
dChzdHJ1Y3QgYmxrZnJvbnRfcmluZ19pbmZvICpyaW5mbyk7Cj4gPiA+ICAgc3RhdGljIHZvaWQg
YmxrZnJvbnRfZ2F0aGVyX2JhY2tlbmRfZmVhdHVyZXMoc3RydWN0IGJsa2Zyb250X2luZm8gKmlu
Zm8pOwo+ID4gPiAgIHN0YXRpYyBpbnQgbmVnb3RpYXRlX21xKHN0cnVjdCBibGtmcm9udF9pbmZv
ICppbmZvKTsKPiA+ID4gKyNkZWZpbmUgcmluZm9fcHRyKHJpbmZvLCBvZmYpIFwKPiA+ID4gKwko
c3RydWN0IGJsa2Zyb250X3JpbmdfaW5mbyAqKSgodW5zaWduZWQgbG9uZykocmluZm8pICsgKG9m
ZikpCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBeIHZvaWQgKiB3
b3VsZCBzZWVtIG1vcmUgbmF0dXJhbCBJTU8uCj4gPiAKPiA+IEFsc28gaWYgeW91IHVzZSB2b2lk
ICogeW91IGRvbid0IG5lZWQgdGhlIGV4dHJhIChzdHJ1Y3QKPiA+IGJsa2Zyb250X3JpbmdfaW5m
byAqKSBjYXN0IEkgdGhpbms/Cj4gCj4gWWVzLCBjYW4gY2hhbmdlIHRoYXQuCj4gCj4gPiBJIGhv
d2V2ZXIgdGhpbmsgdGhpcyBtYWNybyBpcyBraW5kIG9mIHdlaXJkLCBzaW5jZSBpdCdzIGp1c3Qg
ZG9pbmcgYW4KPiA+IGFkZGl0aW9uLiBJIHdvdWxkIHJhdGhlciBoYXZlIHRoYXQgY2FsY3VsYXRp
b24gaW4gZ2V0X3JpbmZvIGFuZCBjb2RlCj4gPiBmb3JfZWFjaF9yaW5mbyBvbiB0b3Agb2YgdGhh
dC4KPiAKPiBJIHdhbnRlZCB0byBhdm9pZCB0aGUgbXVsdGlwbGljYXRpb24gaW4gdGhlIHJhdGhl
ciBjb21tb24KPiBmb3JfZWFjaF9yaW5mbygpIHVzYWdlLgoKQ2FuIHlvdSB1bmRlZiBpdCBhZnRl
cndhcmRzIHRoZW4/IEkgZG9uJ3QgdGhpbmsgaXQncyBzdXBwb3NlZCB0byBiZQp1c2VkIGJ5IHRo
ZSByZXN0IG9mIHRoZSBmaWxlLgoKPiAKPiA+IAo+ID4gSSBhZ3JlZSB0aGlzIG1pZ2h0IGJlIGEg
cXVlc3Rpb24gb2YgdGFzdGUsIHNvIEknbSBub3QgZ29pbmcgdG8gaW5zaXN0Cj4gPiBidXQgdGhh
dCB3b3VsZCByZWR1Y2UgdGhlIG51bWJlciBvZiBoZWxwZXJzIGZyb20gMyB0byAyLgo+ID4gCj4g
PiA+ICsKPiA+ID4gKyNkZWZpbmUgZm9yX2VhY2hfcmluZm8oaW5mbywgcmluZm8sIGlkeCkJCQkJ
XAo+ID4gPiArCWZvciAocmluZm8gPSBpbmZvLT5yaW5mbywgaWR4ID0gMDsJCQkJXAo+ID4gPiAr
CSAgICAgaWR4IDwgaW5mby0+bnJfcmluZ3M7CQkJCQlcCj4gPiA+ICsJICAgICBpZHgrKywgcmlu
Zm8gPSByaW5mb19wdHIocmluZm8sIGluZm8tPnJpbmZvX3NpemUpKQo+ID4gCj4gPiBJIHRoaW5r
IHRoZSBhYm92ZSBpcyBtaXNzaW5nIHByb3BlciBwYXJlbnRoZXNlcyBhcm91bmQgbWFjcm8KPiA+
IHBhcmFtZXRlcnMuCj4gCj4gcmluZm8gYW5kIGlkeCBhcmUgc2ltcGxlIHZhcmlhYmxlcywgc28g
SSBkb24ndCB0aGluayB0aGV5IG5lZWQKPiBwYXJlbnRoZXNlcy4gaW5mbyBtYXliZS4gQnV0IGp1
c3Qgc2VlaW5nIGl0IG5vdzogbmFtaW5nIHRoZQo+IHBhcmFtZXRlciAicmluZm8iIGFuZCB0cnlp
bmcgdG8gYWNjZXNzIGluZm8tPnJpbmZvIGlzbid0IGEgZ29vZAo+IGlkZWEuIEl0IGlzIHdvcmtp
bmcgb25seSBhcyBJIGFsd2F5cyB1c2UgInJpbmZvIiBhcyB0aGUgcG9pbnRlci4KCkRlcmVmZXJl
bmNlcyBvZiBpbmZvIGFuZCB0aGUgaW5jcmVhc2Ugb2YgaWR4IHNob3VsZCBoYXZlIHBhcmVudGhl
c2VzCklNTy4KCllvdSBjb3VsZCByZW5hbWUgdGhlIHJpbmZvIHBhcmFtZXRlciB0byBlbnRyeSBv
ciBzb21lIHN1Y2guCgo+ID4gCj4gPiA+ICsKPiA+ID4gK3N0YXRpYyBzdHJ1Y3QgYmxrZnJvbnRf
cmluZ19pbmZvICpnZXRfcmluZm8oc3RydWN0IGJsa2Zyb250X2luZm8gKmluZm8sCj4gPiA+ICsJ
CQkJCSAgICB1bnNpZ25lZCBpbnQgaSkKPiA+IAo+ID4gaW5saW5lIGF0dHJpYnV0ZSBtaWdodCBi
ZSBhcHByb3ByaWF0ZSBoZXJlLgo+IAo+IFNlZSAidGhlIGlubGluZSBkaXNlYXNlIiBpbiB0aGUg
a2VybmVsJ3MgY29kaW5nIHN0eWxlLgoKVGhpcyBmdW5jdGlvbiBoYXMgdHdvIGxpbmVzLCBzbyBJ
IHRoaW5rIGl0J3Mgc3VpdGFibGUgdG8gYmUgaW5saW5lZDoKIkEgcmVhc29uYWJsZSBydWxlIG9m
IHRodW1iIGlzIHRvIG5vdCBwdXQgaW5saW5lIGF0IGZ1bmN0aW9ucyB0aGF0CmhhdmUgbW9yZSB0
aGFuIDMgbGluZXMgb2YgY29kZSBpbiB0aGVtIgoKSSBiZXQgdGhlIGNvbXBpbGVyIHdvdWxkIGRv
IHRoaXMgYWxyZWFkeSwgYnV0IEkgdGhpbmsgYWRkaW5nIGlubGluZQpoZXJlIGlzIGZpbmUgYWNj
b3JkaW5nIHRvIGNvZGluZyBzdHlsZS4KClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
