Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B53BB3C33
	for <lists+xen-devel@lfdr.de>; Mon, 16 Sep 2019 16:09:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i9rdb-0005Qz-DZ; Mon, 16 Sep 2019 14:05:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=m0mn=XL=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1i9rda-0005Qu-3o
 for xen-devel@lists.xenproject.org; Mon, 16 Sep 2019 14:05:54 +0000
X-Inumbo-ID: 18135b3e-d88b-11e9-95e7-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 18135b3e-d88b-11e9-95e7-12813bfff9fa;
 Mon, 16 Sep 2019 14:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568642754;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=XV1/OuJASfc8Eq9OyZ1339W9BmCNEFAvYXOTjtSx/QQ=;
 b=b0W6PRXBXOMzXNaoMWRNeYBelg7LRTEeFTHHgA2Fx5Ftb18kFvOibZCb
 iruJWDBbEuyaoYJdClZvh8Jj6p1yehV2PVgOr4Uw7iRrE2SRGReWs6qEH
 VFBN+HuyHJf1DAZw1aNfzE274TidZ7fV4Pd27es9HEMlzsWZNIZVRn5hv M=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: bZW+Pz7fyncR3/knTt1GFJ6wuk3Y1NpsWR+mHpg5HfNQVJtiqG98KbjsyviiW/mMtuSOgR/Edb
 nc+NuAOp7Jfg2vyjLxIP3FDkvCpiIOgPtVmKjxTwQPGMekzgbd+SkKEGMY4oAWgEtkdg+R669Z
 jPlmAl9zuiYpQx7mE0iB5Mad2tHfnSHYGDUBl5wxgrEWCsurRwGYf85aw5xYayOjVI6FPXL01D
 +pbCJugTVhnPyVZpBGzHPcUwz7Y/oHPbQXY+7b2/fcLQhN0/SZ6DgpSjtGoD2qGiqrdtpruDJd
 Yms=
X-SBRS: 2.7
X-MesageID: 5672463
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,512,1559534400"; 
   d="scan'208";a="5672463"
Date: Mon, 16 Sep 2019 15:05:49 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Paul Durrant <paul.durrant@citrix.com>
Message-ID: <20190916140549.GH1308@perard.uk.xensource.com>
References: <20190916092708.2624-1-paul.durrant@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190916092708.2624-1-paul.durrant@citrix.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Subject: Re: [Xen-devel] [PATCH v12 6/6] introduce a 'passthrough'
 configuration option to xl.cfg...
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
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim
 Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>,
 Christian Lindig <christian.lindig@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, David Scott <dave@recoil.org>,
 xen-devel@lists.xenproject.org, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBTZXAgMTYsIDIwMTkgYXQgMTA6Mjc6MDhBTSArMDEwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+IGRpZmYgLS1naXQgYS90b29scy9saWJ4bC9saWJ4bF9jcmVhdGUuYyBiL3Rvb2xzL2xp
YnhsL2xpYnhsX2NyZWF0ZS5jCj4gaW5kZXggNTlkYmNiNTBhMC4uN2FmYWU4MTQzMiAxMDA2NDQK
PiAtLS0gYS90b29scy9saWJ4bC9saWJ4bF9jcmVhdGUuYwo+ICsrKyBiL3Rvb2xzL2xpYnhsL2xp
YnhsX2NyZWF0ZS5jCj4gQEAgLTMwLDYgKzMwLDEyIEBACj4gIGludCBsaWJ4bF9fZG9tYWluX2Ny
ZWF0ZV9pbmZvX3NldGRlZmF1bHQobGlieGxfX2djICpnYywKPiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBsaWJ4bF9kb21haW5fY3JlYXRlX2luZm8gKmNfaW5mbykK
PiAgewo+ICsgICAgbGlieGxfcGh5c2luZm8gaW5mbzsKPiArICAgIGludCByYyA9IGxpYnhsX2dl
dF9waHlzaW5mbyhDVFgsICZpbmZvKTsKPiArCj4gKyAgICBpZiAocmMpCj4gKyAgICAgICAgICAg
IHJldHVybiByYzsKPiArCgpJIHRoaW5rIHRoaXMgaHVuayB3b3VsZCBiZSBtb3JlIHJlYWRhYmxl
IGlmIGl0IHdhcyB3cml0dGVuOgogICAgaW50IHJjOwoKICAgIHJjID0gbGlieGxfZ2V0X3BoeXNp
bmZvKENUWCwgJmluZm8pOwogICAgaWYgKHJjKQogICAgICAgIHJldHVybiByYzsKCk90aGVyd2lz
ZSwgdGhlIGNoZWNrIGZvciBlcnJvciBpcyBhbG9uZSB3aGljaCBtaWdodCBtZWFuICJ3ZSBhcmUg
aW4gYQpjYWxsYmFjayBmdW5jdGlvbiBhbmQgY2hlY2sgZm9yIHJjIHBhc3NlZCBieSBwYXJhbWV0
ZXIiIG9yIHRoYXQgaXQncyBhCnN0cmF5IGNoZWNrLgoKPiBAQCAtNjIsNiArNjIsMTIgQEAgaW50
IGxpYnhsX19kb21haW5fY3JlYXRlX2luZm9fc2V0ZGVmYXVsdChsaWJ4bF9fZ2MgKmdjLAo+ICAg
ICAgaWYgKCFjX2luZm8tPnNzaWRyZWYpCj4gICAgICAgICAgY19pbmZvLT5zc2lkcmVmID0gU0VD
SU5JVFNJRF9ET01VOwo+ICAKPiArICAgIGlmIChpbmZvLmNhcF9odm1fZGlyZWN0aW8pIHsKPiAr
ICAgICAgICBjX2luZm8tPnBhc3N0aHJvdWdoID0gKChjX2luZm8tPnR5cGUgPT0gTElCWExfRE9N
QUlOX1RZUEVfUFYpIHx8Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAhaW5mby5j
YXBfaW9tbXVfaGFwX3B0X3NoYXJlKSA/Cj4gKyAgICAgICAgICAgIExJQlhMX1BBU1NUSFJPVUdI
X1NZTkNfUFQgOiBMSUJYTF9QQVNTVEhST1VHSF9TSEFSRV9QVDsKPiArICAgIH0KCkkgZG9uJ3Qg
dGhpbmsgeW91IGNhbiBkbyB0aGF0LiBUaGlzIHdpbGwgb3ZlcndyaXRlIHRoZSB2YWx1ZSB0aGF0
IHdhcyBpbgpjX2luZm8gYmVmb3JlICh0aGF0IGEgdXNlciBhcyBzZXQpLiBUaGUgX3NldGRlZmF1
bHQoKSBmdW5jdGlvbiBpcyBvbmx5CmNhbGxlZCBhZnRlciBjX2luZm8gaGF2ZSBiZWVuIGZpbGxl
ZCBieSB1c2VycyBvZiB0aGUgbGlieGwsIGl0IG9ubHkgaGFzCnRvIGNoYW5nZSB0aGUgdmFsdWUg
aWYgaXQgd2FzIHRoZSBkZWZhdWx0LiBjX2luZm8tPnBhc3N0aHJvdWdoIGhhcyBubwpkZWZhdWx0
IHZhbHVlLCBzbyBpdCdzIG5vdCBwb3NzaWJsZSB0byBrbm93IHdoYXQgYSB1c2VyIHdhbnRzLgoK
V2hhdCBhYm91dCBhZGRpbmcgImRlZmF1bHQiPT0wIGluIGxpYnhsX3Bhc3N0aHJvdWdoIGVudW0/
Cgo+ICAgICAgcmV0dXJuIDA7Cj4gIH0KPiAgCj4gZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnhsL2xp
YnhsX3R5cGVzLmlkbCBiL3Rvb2xzL2xpYnhsL2xpYnhsX3R5cGVzLmlkbAo+IGluZGV4IGQ1MmM2
M2I2YjAuLjIyZjA1NzExZTMgMTAwNjQ0Cj4gLS0tIGEvdG9vbHMvbGlieGwvbGlieGxfdHlwZXMu
aWRsCj4gKysrIGIvdG9vbHMvbGlieGwvbGlieGxfdHlwZXMuaWRsCj4gQEAgLTI2Myw2ICsyNjMs
MTIgQEAgbGlieGxfdmtiX2JhY2tlbmQgPSBFbnVtZXJhdGlvbigidmtiX2JhY2tlbmQiLCBbCj4g
ICAgICAoMiwgIkxJTlVYIikKPiAgICAgIF0pCj4gIAo+ICtsaWJ4bF9wYXNzdGhyb3VnaCA9IEVu
dW1lcmF0aW9uKCJwYXNzdGhyb3VnaCIsIFsKPiArICAgICgwLCAiZGlzYWJsZWQiKSwKPiArICAg
ICgxLCAic3luY19wdCIpLAo+ICsgICAgKDIsICJzaGFyZV9wdCIpLAo+ICsgICAgXSkKPiArCj4g
ICMKPiAgIyBDb21wbGV4IGxpYnhsIHR5cGVzCj4gICMKPiBkaWZmIC0tZ2l0IGEvdG9vbHMveGwv
eGxfcGFyc2UuYyBiL3Rvb2xzL3hsL3hsX3BhcnNlLmMKPiBpbmRleCAyOTNmNWY3MzBlLi40YjJi
YWEwNDAzIDEwMDY0NAo+IC0tLSBhL3Rvb2xzL3hsL3hsX3BhcnNlLmMKPiArKysgYi90b29scy94
bC94bF9wYXJzZS5jCj4gQEAgLTE0NjEsNiArMTQ2MSwxMDcgQEAgdm9pZCBwYXJzZV9jb25maWdf
ZGF0YShjb25zdCBjaGFyICpjb25maWdfc291cmNlLAo+ICsgICAgaWYgKHhsdV9jZmdfZ2V0X3N0
cmluZyhjb25maWcsICJwYXNzdGhyb3VnaCIsICZidWYsIDApKSB7Cj4gKyAgICAgICAgYnVmID0g
KGRfY29uZmlnLT5udW1fcGNpZGV2cyB8fCBkX2NvbmZpZy0+bnVtX2R0ZGV2cykKPiArICAgICAg
ICAgICAgPyAiZW5hYmxlZCIgOiAiZGlzYWJsZWQiOwo+ICsgICAgfQo+ICsKPiArICAgIGlmICgh
c3RybmNtcChidWYsICJlbmFibGVkIiwgc3RybGVuKGJ1ZikpKSB7CgpEbyB5b3UgaW50ZW5kIHRv
IGhhdmUgInBhc3N0aHJvdWdoPScnIiBiZWVuIHRoZSBlcXVpdmFsZW50IG9mCiJwYXNzdGhyb3Vn
aD0nZW5hYmxlZCciIGluIHRoZSBjb25maWcgZmlsZSA/CihzYW1lIHdpdGggImUiLCAiZW4iLCAi
ZW5hIiwgLi4uKQoKPiArICAgICAgICAvKiBDaG9vc2UgYSBzdWl0YWJsZSBkZWZhdWx0ICovCj4g
KyAgICAgICAgY19pbmZvLT5wYXNzdGhyb3VnaCA9Cj4gKyAgICAgICAgICAgIChjX2luZm8tPnR5
cGUgPT0gTElCWExfRE9NQUlOX1RZUEVfUFYpIHx8ICFpb21tdV9oYXBfcHRfc2hhcmUKPiArICAg
ICAgICAgICAgPyBMSUJYTF9QQVNTVEhST1VHSF9TWU5DX1BUIDogTElCWExfUEFTU1RIUk9VR0hf
U0hBUkVfUFQ7CgpUaGFua3MsCgotLSAKQW50aG9ueSBQRVJBUkQKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
