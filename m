Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77979173DA7
	for <lists+xen-devel@lfdr.de>; Fri, 28 Feb 2020 17:54:42 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j7isa-0001H9-Fc; Fri, 28 Feb 2020 16:52:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=HvEU=4Q=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j7isZ-0001Gp-5T
 for xen-devel@lists.xenproject.org; Fri, 28 Feb 2020 16:52:47 +0000
X-Inumbo-ID: be39c2dc-5a4a-11ea-99b0-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id be39c2dc-5a4a-11ea-99b0-12813bfff9fa;
 Fri, 28 Feb 2020 16:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582908766;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=x9xU/5b5FtvdoO6DxE2V83PyKSHnas0PEewjDmhlllc=;
 b=U4lne/z+LTIenoO5x6O3T/8fdCq4dAZxr6aUkGreB0jtiFEpID8ro93z
 xt2JlnyDsx5I992SHFt0oUGDYtG3DCSRmxhtZ4tAM9M+k2R54dc/RstXM
 NI8hfy6A87wvJhrFjn0YaJK5o09h73fBuGVCpF8eWPTRQuycMtBLp9CaL I=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: w4HIQe9I2UO7m2Jnh/01n8hooP/mjCRWSyDGSqpkpnIoJkVIusMcbX7eKHj9IL5+syyqmPj64v
 unBG2rGjDlG4vTUIxzbTZOXbEal8Uo7Y7u3mmxLU+5AUYTrC3Zlw+UkoWzcfxn0rjRNnioqccB
 TAXKIEV/Zyn/KdP9YOOPWAbrVRdNsvVDGmdvc/fHUv4Iw8lQXsqY9gZ6NxQhB2lCC9eivmo/S+
 Re3t/7M7SgAjEobBeDAH9tB8RKQZSyHPKs8KtMHdgWCktGipRVsMfnn63g7VijgUV9iKyE7cbn
 psI=
X-SBRS: 2.7
X-MesageID: 13362551
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,496,1574139600"; d="scan'208";a="13362551"
Date: Fri, 28 Feb 2020 17:52:38 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200228165238.GF24458@Air-de-Roger.citrite.net>
References: <20200219174354.84726-1-roger.pau@citrix.com>
 <20200219174354.84726-7-roger.pau@citrix.com>
 <616f1cd4-e660-97a5-b326-12ca001bfb7d@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <616f1cd4-e660-97a5-b326-12ca001bfb7d@suse.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v5 6/7] xen/guest: prepare hypervisor ops to
 use alternative calls
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
Cc: xen-devel@lists.xenproject.org, Paul Durrant <pdurrant@amazon.com>, Wei
 Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBGZWIgMjgsIDIwMjAgYXQgMDU6Mjk6MzJQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMTkuMDIuMjAyMCAxODo0MywgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+ID4gLS0t
IGEveGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydi9oeXBlcnYuYwo+ID4gKysrIGIveGVuL2FyY2gv
eDg2L2d1ZXN0L2h5cGVydi9oeXBlcnYuYwo+ID4gQEAgLTE5OSw3ICsxOTksNyBAQCBzdGF0aWMg
dm9pZCBfX2luaXQgZTgyMF9maXh1cChzdHJ1Y3QgZTgyMG1hcCAqZTgyMCkKPiA+ICAgICAgICAg
IHBhbmljKCJVbmFibGUgdG8gcmVzZXJ2ZSBIeXBlci1WIGh5cGVyY2FsbCByYW5nZVxuIik7Cj4g
PiAgfQo+ID4gIAo+ID4gLXN0YXRpYyBjb25zdCBzdHJ1Y3QgaHlwZXJ2aXNvcl9vcHMgb3BzID0g
ewo+ID4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgaHlwZXJ2aXNvcl9vcHMgX19pbml0ZGF0YSBvcHMg
PSB7Cj4gCj4gVGhpcyBuZWVkcyB0byBiZSBfX2luaXRjb25zdHJlbCBpbiBvcmRlciB0byBhdm9p
ZCB0cmlnZ2VyaW5nCj4gKHBvc3NpYmx5IG9ubHkgaW4gdGhlIGZ1dHVyZSkgc2VjdGlvbiBtaXNt
YXRjaCB3YXJuaW5ncyB3aXRoCj4gYXQgbGVhc3Qgc29tZSBnY2MgdmVyc2lvbnMuIFdpdGggdGhp
cyBhbmQgdGhlIG90aGVyIGluc3RhbmNlCj4gYWRqdXN0ZWQKCkkgY2FuIGRvIHRoYXQgd2hlbiBw
b3N0aW5nIGEgbmV3IHZlcnNpb24sIHVubGVzcyB5b3Ugd2FudCB0byBwaWNrIHRoaXMKZWFybGll
ciBhbmQgYWRqdXN0IG9uIGNvbW1pdC4KCj4gUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1
bGljaEBzdXNlLmNvbT4KClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
