Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11C77189A0D
	for <lists+xen-devel@lfdr.de>; Wed, 18 Mar 2020 11:57:31 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jEWMH-0003zX-9E; Wed, 18 Mar 2020 10:55:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=lnqk=5D=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1jEWMF-0003zQ-SM
 for xen-devel@lists.xenproject.org; Wed, 18 Mar 2020 10:55:31 +0000
X-Inumbo-ID: fbbf9c7e-6906-11ea-bac1-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fbbf9c7e-6906-11ea-bac1-12813bfff9fa;
 Wed, 18 Mar 2020 10:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1584528931;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=wnR5guG+akKlbSmkWZQkXXHCYor1CbsAeCIefXhoIBw=;
 b=Vr/EFxPHrdPFLpzlwt6n+/KgkpEUWfgnCnpnuGr38ilt439g0x7ysgNF
 4k69zfVBjp0TjcXRGeTrLB0AYQ6XU1R4JlTwWmQDCmEPQHqu1Oorce/16
 tBtwqLNE3PPwQCVsO8YC6lbvWrs4kJhE+tJWphCWmQv2I+srHJ1nt2sTA Q=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: R5HzDDjdSJjCDFUiEJzFmgrBae6as9NzOE4FlRZbZk+G/1joYsadYpBkNI40gYlcV4ll5zexWb
 2T/pMJ1TJkcwVep68DNRz22shGoCTa9dygEZ5Bl4Vu3yPIrMpV3tXfYg7Ud+lV+pN4TeOPZMYB
 5J/4tyaiGrAxO/bFJCdLtwSSaStIYB5AnFx2YCpdOxbh0C0fcNJmbki3KnvmvQCRUFsmiCmhQ9
 PE7Xdfs0cdZ3jKNYRFPEseBwKwPdCFHDReviqeKPNToiIN7myMaSaJrwdhxPNCwlG2cSmVqlgy
 QKM=
X-SBRS: 2.7
X-MesageID: 14190922
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,566,1574139600"; d="scan'208";a="14190922"
Date: Wed, 18 Mar 2020 10:55:25 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200318105525.GE4088@perard.uk.xensource.com>
References: <20200226113355.2532224-1-anthony.perard@citrix.com>
 <20200226113355.2532224-19-anthony.perard@citrix.com>
 <8c7e8650-a898-fce2-7e3f-067a6de71062@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8c7e8650-a898-fce2-7e3f-067a6de71062@suse.com>
Subject: Re: [Xen-devel] [XEN PATCH v3 18/23] xen/build: use if_changed on
 built_in.o
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBNYXIgMDQsIDIwMjAgYXQgMDU6MDM6NDBQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMjYuMDIuMjAyMCAxMjozMywgQW50aG9ueSBQRVJBUkQgd3JvdGU6Cj4gPiAtLS0g
YS94ZW4vUnVsZXMubWsKPiA+ICsrKyBiL3hlbi9SdWxlcy5tawo+ID4gQEAgLTEyNiwxNCArMTI2
LDIxIEBAIGluY2x1ZGUgJChCQVNFRElSKS9hcmNoLyQoVEFSR0VUX0FSQ0gpL1J1bGVzLm1rCj4g
PiAgY19mbGFncyArPSAkKENGTEFHUy15KQo+ID4gIGFfZmxhZ3MgKz0gJChDRkxBR1MteSkgJChB
RkxBR1MteSkKPiA+ICAKPiA+IC1idWlsdF9pbi5vOiAkKG9iai15KSAkKGV4dHJhLXkpCj4gPiAr
cXVpZXRfY21kX2xkX2J1aWx0aW4gPSBMRCAgICAgICRACj4gPiArY21kX2xkX2J1aWx0aW4gPSBc
Cj4gPiArICAgICQoTEQpICQoWEVOX0xERkxBR1MpIC1yIC1vICRAICQoZmlsdGVyLW91dCAkKGV4
dHJhLXkpLCQocmVhbC1wcmVyZXFzKSkKPiA+ICtxdWlldF9jbWRfY2NfYnVpbHRpbiA9IExEICAg
ICAgJEAKPiA+ICtjbWRfY2NfYnVpbHRpbiA9IFwKPiA+ICsgICAgJChDQykgJChYRU5fQ0ZMQUdT
KSAtYyAteCBjIC9kZXYvbnVsbCAtbyAkQAo+ID4gKwo+ID4gK2J1aWx0X2luLm86ICQob2JqLXkp
ICQoZXh0cmEteSkgRk9SQ0UKPiA+ICBpZmVxICgkKG9iai15KSwpCj4gPiAtCSQoQ0MpICQoY19m
bGFncykgLWMgLXggYyAvZGV2L251bGwgLW8gJEAKPiA+ICsJJChjYWxsIGlmX2NoYW5nZWQsY2Nf
YnVpbHRpbikKPiA+ICBlbHNlCj4gPiAgaWZlcSAoJChDT05GSUdfTFRPKSx5KQo+ID4gIAkkKExE
X0xUTykgLXIgLW8gJEAgJChmaWx0ZXItb3V0ICQoZXh0cmEteSksJF4pCj4gCj4gV2hhdCBhYm91
dCB0aGlzPyBDb3VsZG4ndCB5b3Ugc2ltcGx5IHZhcnkgd2hhdCBjbWRfbGRfYnVpbHRpbgo+IGV4
cGFuZHMgdG8sIGFuZCBkcm9wIHRoaXMgaW5uZXIgaWZlcSgpPwoKWWVzLCB0aGF0IHNob3VsZCBi
ZSBwb3NzaWJsZS4gSSB3YXMgdHJ5aW5nIHRvIGxlYXZlIENPTkZJR19MVE8gb3V0LCBidXQKaXQn
cyBwcm9iYWJseSBqdXN0IG1ha2UgcmVhZGFiaWxpdHkgd29yc2UuCgpUaGFua3MsCgotLSAKQW50
aG9ueSBQRVJBUkQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
