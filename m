Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCECC17B9FD
	for <lists+xen-devel@lfdr.de>; Fri,  6 Mar 2020 11:14:47 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jA9xs-0008Qq-1D; Fri, 06 Mar 2020 10:12:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SoCs=4X=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1jA9xq-0008Ql-Ar
 for xen-devel@lists.xenproject.org; Fri, 06 Mar 2020 10:12:18 +0000
X-Inumbo-ID: f4f68967-5f92-11ea-a787-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f4f68967-5f92-11ea-a787-12813bfff9fa;
 Fri, 06 Mar 2020 10:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1583489537;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=7w/VO7dzC6/2Y+QAP+uBlC/nZrzMlHy7bu+4lNMWWKo=;
 b=gjp2gSf6b1aPW/BPP8KOuwRpKsIWcXACGxFURlMZmBSEhXNcwc7c+LE4
 xwCynVvvDwvPHY5QaVyWjnCfhbbNSlBil+9VqGvsELaOk7APn0IGYB36E
 P1tERhhFnNHUq1ufC0wKzsG1KCnRgLZuyCOfh3We0/vQrdEADzQ/mZodN g=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: L7ffF7dETp87ZWuXU3bbEFnov/U9y5NgYdDTQkB2gKevActa5HMiK3XBw2FyFhUrSq8pu1DsBF
 Wrv+Gvg4mC6gWI6LR/H0bIHtKokk4mwYffmnOg7iHMeyLbgkpubzJR0YVD5ELcaw9BGQZjgWKE
 8AN+Pr4II4Hu8gA4B/rQcm276cWJDXA4f1IAvMa6BU6sE2iliGRQInAGXv9H4kko+grCX2Oa0F
 zzRdjtCT5hY7OG6+wrRLHFTX7bvxdyNlMtIA0/m2lV9puksBrzQejhMclY79snO0XLDrzR21s5
 E9g=
X-SBRS: 2.7
X-MesageID: 14143513
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,521,1574139600"; d="scan'208";a="14143513"
Date: Fri, 6 Mar 2020 10:12:01 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>
Message-ID: <20200306101201.GA2152@perard.uk.xensource.com>
References: <20200226113355.2532224-1-anthony.perard@citrix.com>
 <b97e6b2f9c5b4b019a6b1d5d774d21dc@dornerworks.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b97e6b2f9c5b4b019a6b1d5d774d21dc@dornerworks.com>
Subject: Re: [Xen-devel] [XEN PATCH v3 00/23] xen: Build system improvements
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
Cc: Kevin
 Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim
 Deegan <tim@xen.org>, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Daniel De
 Graaf <dgdegra@tycho.nsa.gov>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBGZWIgMjcsIDIwMjAgYXQgMDk6MTc6NTFQTSArMDAwMCwgU3Rld2FydCBIaWxkZWJy
YW5kIHdyb3RlOgo+IFRoYW5rcyBmb3IgeW91ciBlZmZvcnRzIHdpdGggdGhpcy4gV2l0aCB5b3Vy
IGJyLmJ1aWxkLXN5c3RlbS14ZW4tdjMKPiBicmFuY2gsIEknbSBoYXZpbmcgdHJvdWJsZSBkb2lu
ZyBhbiBhYXJjaDY0IGJ1aWxkIHdpdGggZWFybHkgcHJpbnRrCj4gZW5hYmxlZC4gSSBzdXNwZWN0
IHRoZSBmb2xsb3dpbmcgdW5tZXJnZWQgcGF0Y2ggdGhhdCBKdWxpZW4gYXV0aG9yZWQKPiBsYXN0
IFNlcHRlbWJlciBtYXkgaGF2ZSBzb21lIGhlbHBmdWwgaW5mb3JtYXRpb246Cj4gaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9hcmNoaXZlcy9odG1sL3hlbi1kZXZlbC8yMDE5LTA5L21zZzAx
MjA3Lmh0bWwKClRoYW5rIHlvdSBTdGV3YXJ0IGZvciB0ZXN0aW5nISBBbmQgdGhhbmtzIGZvciBw
b2ludGluZyBvdXQgSnVsaWVuJ3MKcGF0Y2gsIHRoYXQgbG9va3MgbGlrZSB0aGUgYmVzdCB3YXkg
dG8gZml4IHRoZSBwcm9ibGVtLiBJJ2xsIGZpeCB0aGUKaXNzdWUuCgpUaGUgaXNzdWUgaXMgaW4g
cGF0Y2gKICAgIFtYRU4gUEFUQ0ggdjMgMTUvMjNdIHhlbi9idWlsZDogaGF2ZSB0aGUgcm9vdCBN
YWtlZmlsZSBnZW5lcmF0ZXMgdGhlIENGTEFHUwp3aGVyZSBFQVJMWV9QUklOVEsgaXNuJ3Qgc2V0
IHdoZW4gbmVlZGVkIGFueW1vcmUuCgo+IEkgdHJpZWQgdGhlIGZvbGxvd2luZy4uLgo+IAo+IGVj
aG8gIkNPTkZJR19ERUJVRz15IiA+IHhlbi9hcmNoL2FybS9jb25maWdzL2FybTY0X2RlZmNvbmZp
Zwo+IG1ha2UgLUMgeGVuIFhFTl9UQVJHRVRfQVJDSD1hcm02NCBDUk9TU19DT01QSUxFPWFhcmNo
NjQtbGludXgtZ251LSBDT05GSUdfRUFSTFlfUFJJTlRLPXp5bnFtcCBkZWZjb25maWcKPiBtYWtl
IFhFTl9UQVJHRVRfQVJDSD1hcm02NCBDUk9TU19DT01QSUxFPWFhcmNoNjQtbGludXgtZ251LSBD
T05GSUdfRUFSTFlfUFJJTlRLPXp5bnFtcCBkaXN0LXhlbgo+IAo+IC4uLiBidXQgSSB3YXMgbWV0
IHdpdGg6Cj4gcHJlbGluay5vOiguZGF0YSsweDU3OCk6IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8g
YGVhcmx5X3B1dHMnCj4gYWFyY2g2NC1saW51eC1nbnUtbGQ6IC9ob21lL3N0ZXcvcnBpL3hlbi94
ZW4vLnhlbi1zeW1zLjA6IGhpZGRlbiBzeW1ib2wgYGVhcmx5X3B1dHMnIGlzbid0IGRlZmluZWQK
CkNoZWVycywKCi0tIApBbnRob255IFBFUkFSRAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
