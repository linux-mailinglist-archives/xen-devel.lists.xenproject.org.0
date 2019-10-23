Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AF68E1F96
	for <lists+xen-devel@lfdr.de>; Wed, 23 Oct 2019 17:42:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNIk9-0000Sm-SW; Wed, 23 Oct 2019 15:40:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TICx=YQ=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1iNIk8-0000Sg-8w
 for xen-devel@lists.xenproject.org; Wed, 23 Oct 2019 15:40:12 +0000
X-Inumbo-ID: 65fce7ec-f5ab-11e9-beca-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 65fce7ec-f5ab-11e9-beca-bc764e2007e4;
 Wed, 23 Oct 2019 15:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1571845211;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=4mcEp0LQXRS0KYWgJ90V3WSfb5ADPR5wxxizik2m0ww=;
 b=KafdBADp8gMc+WhIDPKW1WWCm3WuxNHLlJsJ8S0VtZQmBVpRsMa6RSat
 jszvPpRkeJPKxySPJTBmQf/tDo6WlWKxFuTDETGOvY2Osx/rlp/Ife8v2
 0iiLo3SxRKc/xRC/EuxRKa2Exg51T3LZVfHPhpyx7Sp4SZP6TsiKA4xKP I=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
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
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: gtMi2XbIxsN3hUfBqGKFgy+OfEioD8LIDmxC5SZdVHyPVw4ri6XZP/gCA1+XEUYnYRptXYlnE7
 eTz0m4tL/IbNniFFemp3VDTEsQuNdRpYRaDpvKqZzFG4IcmNkVs0h28lfjtmf5jfAh29tcaiw6
 1slYldggn33OVz7mHnv3FKiSBt2hs7TFD4/0595j13tYGqwgzk7ZSjAEU7P3VjH2P7rmVfJrx1
 JSwViySD98n8cnnZJ7+ihNu/F7XpqmvoK3DxFTVqduFU37gzE2t1TkKUv00QjdiKegECdZhwsy
 RP4=
X-SBRS: 2.7
X-MesageID: 7635895
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,221,1569297600"; 
   d="scan'208";a="7635895"
Date: Wed, 23 Oct 2019 16:40:08 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Ian Jackson <ian.jackson@eu.citrix.com>
Message-ID: <20191023154008.GL1138@perard.uk.xensource.com>
References: <20191023130013.32382-1-ian.jackson@eu.citrix.com>
 <20191023130013.32382-12-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191023130013.32382-12-ian.jackson@eu.citrix.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Subject: Re: [Xen-devel] [XEN PATCH for-4.13 v7 11/11] libxl: On ARM,
 reject future new passthrough modes too
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
 xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBPY3QgMjMsIDIwMTkgYXQgMDI6MDA6MTNQTSArMDEwMCwgSWFuIEphY2tzb24gd3Jv
dGU6Cj4gVGhpcyBpcyBtb3N0IHBsZWFzYW50bHkgZG9uZSBieSBhbHNvIGNoYW5naW5nIHRoZSBp
ZiB0byBhIHN3aXRjaC4KPiAKPiBTdWdnZXN0ZWQtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuQHhl
bi5vcmc+Cj4gQ0M6IEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+Cj4gQ0M6IFN0ZWZhbm8g
U3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KPiBTaWduZWQtb2ZmLWJ5OiBJYW4g
SmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KPiAKPiAtLS0KPiB2NzogTmV3IHBh
dGNoIGluIHRoaXMgdmVyc2lvbiBvZiB0aGUgc2VyaWVzLgo+IC0tLQo+ICB0b29scy9saWJ4bC9s
aWJ4bF9hcm0uYyB8IDEwICsrKysrKysrLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9u
cygrKSwgMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvdG9vbHMvbGlieGwvbGlieGxf
YXJtLmMgYi90b29scy9saWJ4bC9saWJ4bF9hcm0uYwo+IGluZGV4IDJmMWNhNjk0MzEuLjBiMzAy
NWE5ZWQgMTAwNjQ0Cj4gLS0tIGEvdG9vbHMvbGlieGwvbGlieGxfYXJtLmMKPiArKysgYi90b29s
cy9saWJ4bC9saWJ4bF9hcm0uYwo+IEBAIC0xMjAzLDkgKzEyMDMsMTUgQEAgaW50IGxpYnhsX19h
cmNoX3Bhc3N0aHJvdWdoX21vZGVfc2V0ZGVmYXVsdChsaWJ4bF9fZ2MgKmdjLAo+ICAgICAgICAg
IGNfaW5mby0+cGFzc3Rocm91Z2ggPSBMSUJYTF9QQVNTVEhST1VHSF9TSEFSRV9QVDsKPiAgICAg
IH0KPiAgCj4gLSAgICBpZiAoY19pbmZvLT5wYXNzdGhyb3VnaCA9PSBMSUJYTF9QQVNTVEhST1VH
SF9TWU5DX1BUKSB7Cj4gKyAgICBzd2l0Y2ggKGNfaW5mby0+cGFzc3Rocm91Z2gpIHsKPiArICAg
IGNhc2UgTElCWExfUEFTU1RIUk9VR0hfRElTQUJMRUQ7CgpUaGF0IGxvb2tzIHN0cmFuZ2UsIHRo
ZXJlIGEgc2VtaWNvbG9uIF4gaGVyZSBpbnN0ZWFkIG9mIGEgY29sb24gJzonLgoKPiArICAgIGNh
c2UgTElCWExfUEFTU1RIUk9VR0hfU0hBUkVfUFQ6Cj4gKyAgICAgICAgYnJlYWs7Cj4gKwo+ICsg
ICAgZGVmYXVsdDoKPiAgICAgICAgICBMT0dEKEVSUk9SLCBkb21pZCwKPiAtICAgICAgICAgICAg
ICJwYXNzdGhyb3VnaD1cInN5bmNfcHRcIiBub3Qgc3VwcG9ydGVkIG9uIEFSTVxuIik7Cj4gKyAg
ICAgICAgICAgICAicGFzc3Rocm91Z2g9XCIlc1wiIG5vdCBzdXBwb3J0ZWQgb24gQVJNXG4iLAo+
ICsgICAgICAgICAgICAgbGlieGxfX3Bhc3N0aHJvdWdoX21vZGVfdG9fc3RyaW5nKGNfaW5mby0+
cGFzc3Rocm91Z2gpOwoKSSBjYW4ndCBmaW5kIHdoZXJlIHRoaXMgZnVuY3Rpb24gaXMgZGVmaW5l
ZC4gRG9lcyBpdCBleGlzdD8KWW91IHByb2JhYmx5IHdhbnQgbGlieGxfcGFzc3Rocm91Z2hfdG9f
c3RyaW5nKCkuCkFsc28gdGhlcmUncyBhIG1pc3NpbmcgKSB0byB0ZXJtaW5hdGUgTE9HRCBsaXN0
IG9mIGFyZ3MuCgpJIHRoaW5rIHRoYXQncyBpdC4gV2l0aCB0aG9zZSAzIHRoaW5ncyBmaXhlZDoK
QWNrZWQtYnk6IEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPgoKQ2hl
ZXJzLAoKLS0gCkFudGhvbnkgUEVSQVJECgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
