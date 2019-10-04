Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74211CBF53
	for <lists+xen-devel@lfdr.de>; Fri,  4 Oct 2019 17:36:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iGPZv-0003fJ-JG; Fri, 04 Oct 2019 15:33:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=UhcM=X5=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1iGPZt-0003fE-Mn
 for xen-devel@lists.xenproject.org; Fri, 04 Oct 2019 15:33:09 +0000
X-Inumbo-ID: 445af334-e6bc-11e9-8c93-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 445af334-e6bc-11e9-8c93-bc764e2007e4;
 Fri, 04 Oct 2019 15:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1570203189;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=OBUfdzm9FVUc409JDvhMKd1YEMYRk+WtSNYZ2vj76/Q=;
 b=XC63RW64MBx5P817/A8nYqLvjJzikjksbErVbVXAFr/FBrun8k7OpON8
 yfahUzp3ajs6GfkwOzTmygdyzj8pNVbVahsk3x5wxrEK0Z9qlx74J/Nsy
 VJxiE+vubHqZNHGtYC0+TD5TmpO8ZDIdYDyJXA2HJd8MndsIKFdU4+ksB o=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Of/cOR8++gfm5miJ/oJAe47Djzb4g5E/OICrq0Pn2lOKAvMO260NNiYy2uuNVptckrf8BhcO49
 V8/JG5n+6ZU6mqaJYpi9xWNulvIn/CJOaHopxRZlRW17M1fau1cJxNFOxoIVeR5niR/xIKca0C
 QSldXuhW7LUHTV1OnsC6SQpymXbF6GgfdpCtnL6wU8u5J7Z6th5sf8mBQpA2NkXF6GL/nE40Rd
 BRDyCy+53u+x5dDdpLxoUpwjrzZ2on9zWdGHql2V5NOX5SzMZ/CskocgoJvT7HFRY4x3p2hyP/
 6X0=
X-SBRS: 2.7
X-MesageID: 6847800
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,256,1566878400"; 
   d="scan'208";a="6847800"
Date: Fri, 4 Oct 2019 16:33:06 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Ian Jackson <ian.jackson@eu.citrix.com>
Message-ID: <20191004153306.GL1163@perard.uk.xensource.com>
References: <20191004151707.24844-1-ian.jackson@eu.citrix.com>
 <20191004151707.24844-2-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191004151707.24844-2-ian.jackson@eu.citrix.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Subject: Re: [Xen-devel] [XEN PATCH for-4.13 1/6] libxl: Offer API versions
 0x040700 and 0x040800
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
Cc: =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>,
 xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBPY3QgMDQsIDIwMTkgYXQgMDQ6MTc6MDJQTSArMDEwMCwgSWFuIEphY2tzb24gd3Jv
dGU6Cj4gQWNjb3JkaW5nIHRvIGdpdCBsb2cgLUc6Cj4gCj4gMHgwNDA3MDAgd2FzIGludHJvZHVj
ZWQgaW4gMzA0NDAwNDU5ZWYwIChha2EgNC43LjAtcmMxfjQ4MSkKPiAgICJ0b29scy9saWJ4bDog
cmVuYW1lIHJlbXVzIGRldmljZSB0byBjaGVja3BvaW50IGRldmljZSIKPiAKPiAweDA0MDgwMCB3
YXMgaW50cm9kdWNlZCBpbiA1N2Y4YjEzYzcyNDAgKGFrYSA0LjguMC1yYzF+NDM3KQo+ICAgImxp
YnhsOiBtZW1vcnkgc2l6ZSBpbiBrYiByZXF1aXJlcyA2NCBiaXQgdmFyaWFibGUiCj4gCj4gSXQg
aXMgc3VycHJpc2luZyB0aGF0IG5vLW9uZSBub3RpY2VkIHRoaXMuICBJIHdvbmRlciBpZiBhbnlv
bmUgaXMKPiB1c2luZyBvdXIgTElCWExfQVBJX1ZFUlNJT04gZmFjaWxpdHkuICBJZiBub3QgbWF5
YmUgd2Ugc2hvdWxkIHRha2UgYQo+IGRpZmZlcmVudCBhcHByb2FjaC4KCkxpYnZpcnQgZG9lcyB1
c2UgaXQuIEkgdGhpbmsgaXQncyBjdXJyZW50bHkgc2V0IHRvIDQuNS4KCj4gQW55d2F5LCBpbiB0
aGUgbWVhbnRpbWUsIHdlIHNob3VsZCBmaXggdGhpcy4gIEJhY2twb3J0aW5nIHRoaXMgaXMKPiBw
cm9iYWJseSBhIGdvb2QgaWRlYTogaXQgd29uJ3QgY2hhbmdlIHRoZSBiZWhhdmlvdXIgZm9yIGV4
aXN0aW5nCj4gY2FsbGVycyBidXQgaXQgd2lsbCBhdm9pZCBlcnJvcnMgZm9yIHNvbWUgb2xkZXIg
Y29ycmVjdCB1c2VzLgo+IAo+IFNpZ25lZC1vZmYtYnk6IElhbiBKYWNrc29uIDxpYW4uamFja3Nv
bkBldS5jaXRyaXguY29tPgoKQWNrZWQtYnk6IEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFy
ZEBjaXRyaXguY29tPgoKPiAtLS0KPiAgdG9vbHMvbGlieGwvbGlieGwuaCB8IDEgKwo+ICAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPiAKPiBkaWZmIC0tZ2l0IGEvdG9vbHMvbGlieGwv
bGlieGwuaCBiL3Rvb2xzL2xpYnhsL2xpYnhsLmgKPiBpbmRleCAyNTU1ZTljZDNiLi41MThmYzll
NDdmIDEwMDY0NAo+IC0tLSBhL3Rvb2xzL2xpYnhsL2xpYnhsLmgKPiArKysgYi90b29scy9saWJ4
bC9saWJ4bC5oCj4gQEAgLTY1NSw2ICs2NTUsNyBAQCB0eXBlZGVmIHN0cnVjdCBsaWJ4bF9fY3R4
IGxpYnhsX2N0eDsKPiAgI2lmZGVmIExJQlhMX0FQSV9WRVJTSU9OCj4gICNpZiBMSUJYTF9BUElf
VkVSU0lPTiAhPSAweDA0MDIwMCAmJiBMSUJYTF9BUElfVkVSU0lPTiAhPSAweDA0MDMwMCAmJiBc
Cj4gICAgICBMSUJYTF9BUElfVkVSU0lPTiAhPSAweDA0MDQwMCAmJiBMSUJYTF9BUElfVkVSU0lP
TiAhPSAweDA0MDUwMCAmJiBcCj4gKyAgICBMSUJYTF9BUElfVkVSU0lPTiAhPSAweDA0MDcwMCAm
JiBMSUJYTF9BUElfVkVSU0lPTiAhPSAweDA0MDgwMCAmJiBcCj4gICAgICBMSUJYTF9BUElfVkVS
U0lPTiAhPSAweDA0MTMwMAo+ICAjZXJyb3IgVW5rbm93biBMSUJYTF9BUElfVkVSU0lPTgo+ICAj
ZW5kaWYKCi0tIApBbnRob255IFBFUkFSRAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
