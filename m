Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79FAC164379
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2020 12:34:48 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4Nag-0002vI-0J; Wed, 19 Feb 2020 11:32:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jH6y=4H=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j4Nae-0002vD-Cf
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2020 11:32:28 +0000
X-Inumbo-ID: 815c07bc-530b-11ea-8333-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 815c07bc-530b-11ea-8333-12813bfff9fa;
 Wed, 19 Feb 2020 11:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582111947;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=V3Z7jo3YObNWZmspFoF8rRw+arfAZ12M8EAL/by3zpY=;
 b=cHR6Acr5sTdtEXdpbz09Z2i7dKTAJHwTaNWgMRCpWt/lR1TNEbClsdzT
 KpY4YQGS1/b7CAG3m5NXIp8NUnl2a3uObUgZwvBfbXVmLAVt53jwgTmTy
 IzBkVJ699KsajIz9l6IOlw+OwMFcWEfM3N50CsFHPkcjappRTNA1zxWLN M=;
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
IronPort-SDR: t555AI2JJub8vHpi48dH0dpHeF2DyQn/TBQZSmiahpO/GD9gQf6IxcvzWeSAMJHgFxHTeWh/iF
 lFv0+/R90vqvlo+oO/NTssKjppvQttPTavtPZhddfLw+Ce11TyJK+vAKIQANx28RcDxlRGbPup
 xTyRBgugeOaChiPlKjd/ucp0RuqI5GU7cnV+WhXJ1jk9F95Jnj407izzPRIbKwZ13aeCmwQb2O
 8hi/miwyMtcBxNGb+5oPt6yJ7M4nRzL20xgv2QdMj30ndf4B+m1SWxBsqNCvwkxrX3EkXcV7M+
 KYU=
X-SBRS: 2.7
X-MesageID: 13041027
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,459,1574139600"; d="scan'208";a="13041027"
Date: Wed, 19 Feb 2020 12:32:16 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20200219113216.GY4679@Air-de-Roger>
References: <20200219111904.82092-1-roger.pau@citrix.com>
 <02015cac-7bce-7247-9861-f0da21f86a3d@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <02015cac-7bce-7247-9861-f0da21f86a3d@citrix.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH] amd/iommu: add missing unlock in
 iommu_read_log
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
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBGZWIgMTksIDIwMjAgYXQgMTE6MjM6NDBBTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBPbiAxOS8wMi8yMDIwIDExOjE5LCBSb2dlciBQYXUgTW9ubmUgd3JvdGU6Cj4gPiBS
ZXBvcnRlZC1ieTogQ292ZXJpdHkKPiA+IENJRDogMTQ1ODYzMgo+IAo+IFdlIHRlbmQgdG8gdXNl
IGp1c3QgQ292ZXJpdHktSUQ6IDE0NTg2MzIKCk9oLCBJIGdvdCBjb25mdXNlZCB3aXRoIEZyZWVC
U0QgdXNhZ2Ugb2YgQ0lELgoKPiAKPiA+IEZpeGVzOiA3MDlkM2RkZWEyZDVlICgnQU1EL0lPTU1V
OiBDb21tb24gdGhlICM3MzIvIzczMyBlcnJhdGEgaGFuZGxpbmcgaW4gaW9tbXVfcmVhZF9sb2co
KScpCj4gPiBTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4
LmNvbT4KPiA+IC0tLQo+ID4gIHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FtZC9pb21tdV9pbml0
LmMgfCAxICsKPiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPiA+Cj4gPiBkaWZm
IC0tZ2l0IGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1kL2lvbW11X2luaXQuYyBiL3hlbi9k
cml2ZXJzL3Bhc3N0aHJvdWdoL2FtZC9pb21tdV9pbml0LmMKPiA+IGluZGV4IDRjODY4NDhjNTIu
LmU5M2EwOTA4MzAgMTAwNjQ0Cj4gPiAtLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hbWQv
aW9tbXVfaW5pdC5jCj4gPiArKysgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hbWQvaW9tbXVf
aW5pdC5jCj4gPiBAQCAtMzM4LDYgKzMzOCw3IEBAIHN0YXRpYyBpbnQgaW9tbXVfcmVhZF9sb2co
c3RydWN0IGFtZF9pb21tdSAqaW9tbXUsCj4gPiAgICAgICAgICAgICAgewo+ID4gICAgICAgICAg
ICAgICAgICBBTURfSU9NTVVfREVCVUcoIkFNRC1WaTogTm8gZW50cnkgd3JpdHRlbiB0byAlcyBM
b2dcbiIsCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBsb2cgPT0gJmlvbW11
LT5ldmVudF9sb2cgPyAiRXZlbnQiIDogIlBQUiIpOwo+ID4gKyAgICAgICAgICAgICAgICBzcGlu
X3VubG9jaygmbG9nLT5sb2NrKTsKPiAKPiBBIGdvdG8gb3V0IHdvdWxkIGJlIGNsZWFuZXIuwqAg
Q2FuIGZpeCB1cCBvbiBjb21taXQgaWYgeW91J3JlIGhhcHB5PwoKVGhhdCdzIGZpbmUsIEkgZG9u
J3QgaGF2ZSBhIHByZWZlcmVuY2UuIEluIHN1Y2ggY2FzZXMgd2hlcmUgYSBzaW1wbGUKdW5sb2Nr
IGlzIHJlcXVpcmVkIEkgdGVuZCB0byBhdm9pZCB0aGUgbGFiZWwgYXMgSSBrbm93IEphbiBwcmVm
ZXJzCmF2b2lkaW5nIHRoZW0uCgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
