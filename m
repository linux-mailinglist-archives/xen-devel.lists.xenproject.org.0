Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD64A58B2
	for <lists+xen-devel@lfdr.de>; Mon,  2 Sep 2019 16:02:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i4mqk-0000z3-1N; Mon, 02 Sep 2019 13:58:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2SMQ=W5=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1i4mqi-0000yw-Sh
 for xen-devel@lists.xenproject.org; Mon, 02 Sep 2019 13:58:28 +0000
X-Inumbo-ID: bceab330-cd89-11e9-8980-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bceab330-cd89-11e9-8980-bc764e2007e4;
 Mon, 02 Sep 2019 13:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1567432708;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=pwiLpSbnU7U4kWRLchiZwX5+LSwNYZddky8ydZX2/Js=;
 b=XwfkFziR/fq6QQHXVCmOj+tq5sX1sUb3ngUZwgDBN315khP6063kzM0h
 l1Nn3Cwhtw4fJ3cSpO24i3AXIN36Sh86AsC7BSRPEvx7rfPn6B9ryamdA
 sTpPMXOvmkNGsPY2Ta7gJ9jKn+0p3jyLPX0UeGVtDiTZeFd7RLsTA3crn w=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: YiaQpQCocAbcXXBo9hO7ZRH0nkKtPFNMwzN55PQomEx1kWszfnlVjrkA/1pYiSHE+29YF5hdWc
 PWSaQep86O+OuSPGuRKns5dreV1+DF1FMluJrObl6p3s+APuSu+z4wHwrm+H0ibxEjckvi0P0g
 z2LMc79LAmAktE+m3hMjNl9xMJVz6pmLMQ+ZSN5OXoaqC1zhLRBofE1ux0LxriHtZZU7hEG94P
 WaQ1F9io8EC3uJcclCnriFZenNjIINHWFsp9Yy+c5+YE6EmQaIpkQ4/0Jy24bScwv//SvvE6gi
 yvQ=
X-SBRS: 2.7
X-MesageID: 5067706
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,459,1559534400"; 
   d="scan'208";a="5067706"
Date: Mon, 2 Sep 2019 15:58:13 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20190902135813.tz64qcg5rxujis6j@Air-de-Roger>
References: <20190902113034.97934-1-roger.pau@citrix.com>
 <e4afc421-17ef-32a7-21f4-3ecb65ebb44a@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e4afc421-17ef-32a7-21f4-3ecb65ebb44a@suse.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH] vpci: don't allow access to devices not
 assigned to the domain
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, TimDeegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBTZXAgMDIsIDIwMTkgYXQgMDE6NTg6MDdQTSArMDIwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMDIuMDkuMjAxOSAxMzozMCwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+ID4gRG9u
J3QgYWxsb3cgdGhlIGhhcmR3YXJlIGRvbWFpbiB0byBhY2Nlc3MgdGhlIFBDSSBjb25maWcgc3Bh
Y2Ugb2YKPiA+IGRldmljZXMgbm90IGFzc2lnbmVkIHRvIGl0LiBJZTogdGhlIGNvbmZpZyBzcGFj
ZSBvZiBpb21tdSBkZXZpY2VzCj4gPiBpbiB1c2UgYnkgWGVuIHNob3VsZCBub3QgYmUgYWNjZXNz
aWJsZSB0byB0aGUgaGFyZHdhcmUgZG9tYWluLgo+IAo+IFdlbGwsIEkgYWdyZWUgd2l0aCB3aGF0
IHlvdSBzYXkgYWJvdmUsIGJ1dCB0aGUgY29kZSBjaGFuZ2UgZGlzYWxsb3dzCj4gbXVjaCBtb3Jl
IHRoYW4gdGhpcy4gSW4gcGFydGljdWxhciBEb20wIChhbmQgbWF5YmUgc3R1YiBkb21haW5zIHRv
bykKPiBuZWVkIHRvIGJlIGFibGUgdG8gYWNjZXNzIHRoZSBjb25maWcgc3BhY2Ugb2YgZGV2aWNl
cyBhc3NpZ25lZCB0bwo+IGd1ZXN0cywgZS5nLiBmb3IgcWVtdSB0byBjb250cm9sIE1TSSBhbmQv
b3IgTVNJLVguCgpSaWdodCwgSSB3YXMgb3Zlcmxvb2tpbmcgdGhlIGZhY3QgdGhhdCBhIGRvbWFp
biB1c2luZyB2UENJIGl0c2VsZgpzaG91bGQgYmUgYWJsZSB0byBoYW5kbGUgcGFzc3Rocm91Z2gg
YmFja2VuZHMgZm9yIG90aGVyIGRvbWFpbnMuCgpJIHRoaW5rIHRoZSBjb25kaXRpb24gc2hvdWxk
IGluc3RlYWQgY2hlY2sgaWYgdGhlIGRldmljZSBpcyBhc3NpZ25lZAp0byBkb21feGVuLCBhbmQg
ZG9uJ3QgYWxsb3cgZG9tYWlucyBhY2Nlc3MgdG8gZGV2aWNlcyBhc3NpZ25lZCB0bwpkb21feGVu
LgoKVGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
