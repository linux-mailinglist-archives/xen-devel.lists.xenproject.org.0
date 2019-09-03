Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48BF1A6912
	for <lists+xen-devel@lfdr.de>; Tue,  3 Sep 2019 14:55:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i58I6-00083w-GY; Tue, 03 Sep 2019 12:52:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4NVN=W6=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1i58I5-00083g-HS
 for xen-devel@lists.xenproject.org; Tue, 03 Sep 2019 12:52:09 +0000
X-Inumbo-ID: a250c8ac-ce49-11e9-ab94-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a250c8ac-ce49-11e9-ab94-12813bfff9fa;
 Tue, 03 Sep 2019 12:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1567515127;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Nzzlcz5+fHe/FbHgON6gDkjsekzFeyG93wcfp9TfHlc=;
 b=C9QhM/lhgxhKE5lb80oaCQOyei+RU7352nzjVZtwWHgKlG5nV9WRrm8e
 aDpr8d8TIjrBpT2MzCQMFKtnoP/QSd4Scg79wOC+oeTNnfJcPWWIxvR3Z
 J2ZBGBKuHZavGU/Hdrim9/fW9ZTaMHdyw1MnkB0Ew3h8VBa3RdjEtuClc Q=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: wO2b1IT+3SjAxfvOrZBcrrI03c2epGaGKKBoexUp0x/y3O2KeH/aYyuK+61CnVqd/V3v2Rsc5W
 PDJLL6s2TVcrR31DK+yZxHp4Y/iL2caH1JBI/JoJFSSZHFq0H9ExK6f/Q8Oh304GjccrVUoiFT
 IJ73PTzJOt/tziAEsn1vJp+BTrYsaIhDzS/kvTdtTfOSx9zP+7O2n/lQ+sBnSbR4Vy+1G51J/J
 RnVfBKzOGt3wmcGs2ysX3CazpEALfw3gbORIIVPjVBoa8rGQoJmOXXvVJI7Urj0TqhM4aJ2Xza
 mys=
X-SBRS: 2.7
X-MesageID: 5064965
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,463,1559534400"; 
   d="scan'208";a="5064965"
Date: Tue, 3 Sep 2019 14:51:59 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20190903125159.3kdnhkjrx3isnhao@Air-de-Roger>
References: <20190903101428.3543-1-roger.pau@citrix.com>
 <275b3560-2191-364a-96d8-214d6bdcac0d@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <275b3560-2191-364a-96d8-214d6bdcac0d@suse.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v3] vpci: honor read-only devices
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

T24gVHVlLCBTZXAgMDMsIDIwMTkgYXQgMDI6MTY6NTJQTSArMDIwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMDMuMDkuMjAxOSAxMjoxNCwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+ID4gRG9u
J3QgYWxsb3cgdGhlIGhhcmR3YXJlIGRvbWFpbiB3cml0ZSBhY2Nlc3MgdGhlIFBDSSBjb25maWcg
c3BhY2Ugb2YKPiA+IGRldmljZXMgbWFya2VkIGFzIHJlYWQtb25seS4KPiA+IAo+ID4gU2lnbmVk
LW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4gPiAtLS0K
PiA+IENoYW5nZXMgc2luY2UgdjI6Cj4gPiAgLSBGaXggdGVzdCBoYXJuZXNzLgo+ID4gIC0gRG8g
dGhlIFJPIGNoZWNrIGJlZm9yZSB0aGUgb3duZXJzaGlwIG9uZS4KPiA+IAo+ID4gQ2hhbmdlcyBz
aW5jZSB2MToKPiA+ICAtIENoYW5nZSB0aGUgYXBwcm9hY2ggYW5kIGFsbG93IGZ1bGwgcmVhZCBh
Y2Nlc3MsIHdoaWxlIGxpbWl0aW5nCj4gPiAgICB3cml0ZSBhY2Nlc3MgdG8gZGV2aWNlcyBtYXJr
ZWQgUk8uCj4gPiAtLS0KPiA+ICB0b29scy90ZXN0cy92cGNpL2VtdWwuaCB8IDMgKysrCj4gPiAg
eGVuL2RyaXZlcnMvdnBjaS92cGNpLmMgfCA1ICsrKysrCj4gPiAgMiBmaWxlcyBjaGFuZ2VkLCA4
IGluc2VydGlvbnMoKykKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL3Rvb2xzL3Rlc3RzL3ZwY2kvZW11
bC5oIGIvdG9vbHMvdGVzdHMvdnBjaS9lbXVsLmgKPiA+IGluZGV4IDVkNDc1NDRiZjcuLjJlMWQz
MDU3YzkgMTAwNjQ0Cj4gPiAtLS0gYS90b29scy90ZXN0cy92cGNpL2VtdWwuaAo+ID4gKysrIGIv
dG9vbHMvdGVzdHMvdnBjaS9lbXVsLmgKPiA+IEBAIC05Miw2ICs5Miw5IEBAIHR5cGVkZWYgdW5p
b24gewo+ID4gICNkZWZpbmUgeGZyZWUocCkgZnJlZShwKQo+ID4gIAo+ID4gICNkZWZpbmUgcGNp
X2dldF9wZGV2X2J5X2RvbWFpbiguLi4pICZ0ZXN0X3BkZXYKPiA+ICsjZGVmaW5lIHBjaV9nZXRf
cm9fbWFwKC4uLikgTlVMTAo+ID4gKwo+ID4gKyNkZWZpbmUgdGVzdF9iaXQoLi4uKSBmYWxzZQo+
IAo+IFRoZSBsYXR0ZXIgc2VlbXMgcmF0aGVyIGRhbmdlcm91cyB0byBtZSwgYXMgYSBmdXJ0aGVy
IGFkZGl0aW9uIG9mCj4gdGVzdF9iaXQoKSB3b3VsZCBzaWxlbnRseSBidWlsZCBmaW5lLCBidXQg
cG9zc2libHkgcHJvZHVjZSBhIG5vbi0KPiB3b3JraW5nIGJpbmFyeS4gQnV0IHlvdSdyZSB0aGUg
ZGVmYWN0byBtYWludGFpbmVyIG9mIHRoaXMKPiBoYXJuZXNzLCBzbyBpZiB5b3UgYmVsaWV2ZSBp
dCdzIGZpbmUgc28gYmUgaXQuIChJZiBldmVuCj4geGVucGFnaW5nIGlzIGNvbnNpZGVyZWQgImZp
bmUiIHRvIGluY2x1ZGUgeGNfYml0b3BzLmgsIEkgd29uZGVyCj4gaWYgdGhpcyBoYXJuZXNzIGNv
dWxkbid0IGRvIHNvIHRvby4gQW5kIHRoZW4gdGhlcmUgYXJlIHRocmVlCj4gdGVzdF9iaXQoKSBk
ZWZpbml0aW9ucyBvdmVyYWxsIHVuZGVyIHRvb2xzLyAtIEkgd29uZGVyIGlmIHRob3NlCj4gY291
bGRuJ3QgYmUgY29uc29saWRhdGVkIGludG8gYSBzaW5nbGUsIHVuaXZlcnNhbGx5IHVzYWJsZSBv
bmUuKQoKT25lIG9wdGlvbiB3b3VsZCBiZSB0byB0dXJuIHRlc3RfYml0IGludG8gYXNzZXJ0KDAp
IHdoaWNoIHNob3VsZCB3b3JrCmZvciB0aGUgY3VycmVudCB1c2FnZSwgc2luY2UgdGVzdF9iaXQg
c2hvdWxkbid0IGJlIGNhbGxlZCBnaXZlbiB0aGUKY3VycmVudCBjb2RlIGFuZCB3aWxsIHRyaWdn
ZXIgaWYgaXQgYWN0dWFsbHkgZ2V0cyB1c2VkLiBXb3VsZCB5b3UgYmUKZmluZSB3aXRoIG1lcmdp
bmcgdGhlIGNodW5rIGJlbG93IGludG8gdGhlIGN1cnJlbnQgcGF0Y2g/CgpJIHdvdWxkIGxpa2Ug
dG8gYXZvaWQgaW5jbHVkaW5nIHhjX2JpdG9wcy5oLCBzaW5jZSB0aGUgeGVucGFnaW5nCk1ha2Vm
aWxlIGFscmVhZHkgY29udGFpbnMgYSBjb21tZW50IHJlZ2FyZGluZyB0aGUgd3JvbmcgdXNhZ2Ug
b2YgbGlieGMKaW50ZXJuYWxzLgoKPiA+IC0tLSBhL3hlbi9kcml2ZXJzL3ZwY2kvdnBjaS5jCj4g
PiArKysgYi94ZW4vZHJpdmVycy92cGNpL3ZwY2kuYwo+ID4gQEAgLTQxMSw2ICs0MTEsNyBAQCB2
b2lkIHZwY2lfd3JpdGUocGNpX3NiZGZfdCBzYmRmLCB1bnNpZ25lZCBpbnQgcmVnLCB1bnNpZ25l
ZCBpbnQgc2l6ZSwKPiA+ICAgICAgY29uc3Qgc3RydWN0IHBjaV9kZXYgKnBkZXY7Cj4gPiAgICAg
IGNvbnN0IHN0cnVjdCB2cGNpX3JlZ2lzdGVyICpyOwo+ID4gICAgICB1bnNpZ25lZCBpbnQgZGF0
YV9vZmZzZXQgPSAwOwo+ID4gKyAgICBjb25zdCB1bnNpZ25lZCBsb25nICpyb19tYXAgPSBwY2lf
Z2V0X3JvX21hcChzYmRmLnNlZyk7Cj4gPiAgCj4gPiAgICAgIGlmICggIXNpemUgKQo+ID4gICAg
ICB7Cj4gPiBAQCAtNDE4LDYgKzQxOSwxMCBAQCB2b2lkIHZwY2lfd3JpdGUocGNpX3NiZGZfdCBz
YmRmLCB1bnNpZ25lZCBpbnQgcmVnLCB1bnNpZ25lZCBpbnQgc2l6ZSwKPiA+ICAgICAgICAgIHJl
dHVybjsKPiA+ICAgICAgfQo+ID4gIAo+ID4gKyAgICBpZiAoIHJvX21hcCAmJiB0ZXN0X2JpdChz
YmRmLmJkZiwgcm9fbWFwKSApCj4gPiArICAgICAgICAvKiBJZ25vcmUgd3JpdGVzIHRvIHJlYWQt
b25seSBkZXZpY2VzLiAqLwo+ID4gKyAgICAgICAgcmV0dXJuOwo+ID4gKwo+ID4gICAgICAvKgo+
ID4gICAgICAgKiBGaW5kIHRoZSBQQ0kgZGV2IG1hdGNoaW5nIHRoZSBhZGRyZXNzLgo+ID4gICAg
ICAgKiBQYXNzdGhyb3VnaCBldmVyeXRoaW5nIHRoYXQncyBub3QgdHJhcHBlZC4KPiA+IAo+IAo+
IFRoaXMgcGFydAo+IFJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+
CgpUaGFua3MuCgotLS04PC0tLQpkaWZmIC0tZ2l0IGEvdG9vbHMvdGVzdHMvdnBjaS9lbXVsLmgg
Yi90b29scy90ZXN0cy92cGNpL2VtdWwuaAppbmRleCAyZTFkMzA1N2M5Li43OTY3OTdmZGMyIDEw
MDY0NAotLS0gYS90b29scy90ZXN0cy92cGNpL2VtdWwuaAorKysgYi90b29scy90ZXN0cy92cGNp
L2VtdWwuaApAQCAtOTQsNyArOTQsNyBAQCB0eXBlZGVmIHVuaW9uIHsKICNkZWZpbmUgcGNpX2dl
dF9wZGV2X2J5X2RvbWFpbiguLi4pICZ0ZXN0X3BkZXYKICNkZWZpbmUgcGNpX2dldF9yb19tYXAo
Li4uKSBOVUxMCiAKLSNkZWZpbmUgdGVzdF9iaXQoLi4uKSBmYWxzZQorI2RlZmluZSB0ZXN0X2Jp
dCguLi4pICh7IGFzc2VydCgwKTsgZmFsc2U7IH0pCiAKIC8qIER1bW15IG5hdGl2ZSBoZWxwZXJz
LiBXcml0ZXMgYXJlIGlnbm9yZWQsIHJlYWRzIHJldHVybiAxJ3MuICovCiAjZGVmaW5lIHBjaV9j
b25mX3JlYWQ4KC4uLikgICAgIDB4ZmYKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
