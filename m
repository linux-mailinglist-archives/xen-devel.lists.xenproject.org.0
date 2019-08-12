Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D9418B033
	for <lists+xen-devel@lfdr.de>; Tue, 13 Aug 2019 08:54:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxQfb-0001hC-KW; Tue, 13 Aug 2019 06:52:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=lz5Z=WJ=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hxQfa-0001gu-Mo
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2019 06:52:34 +0000
X-Inumbo-ID: a33e2b50-bd13-11e9-aa6a-dfa17c36db29
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a33e2b50-bd13-11e9-aa6a-dfa17c36db29;
 Mon, 12 Aug 2019 15:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1565622765;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Q8EuwPBYlbDV3XIo2IRpvl/bh1/FZfO5tWdBHjQZxwM=;
 b=Z3iYoW3pFrJatmhUFDKqgQ0KRE998L8Me4oQfJHQOuYWYZ/tPD2EHcsh
 JPbhvwMOqUcxgPH9h5cpLyXjwSD2vwzDWy86gSgTSNeAcExWAnwJBTolp
 R97uRJhx5cq3j/g+BCCBSv4wmptnSf4c/VmqM+NIVXkL3H1VEMIaTZiej 0=;
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
IronPort-SDR: 4to+7nvQe4HyUPtmzzGCoBMa4W0uSJNeJsAJyKEHB/ei3+5fFmPV4g3PvATrUj2Tyd3G//p23F
 8dqzxr4bkAd2ZdxDkrTRyJkFgtkrTeHNEICy9aGWUKxQnoUqF/eeKYzNuvX0jy8Q0gRjLoZXYb
 YhdT3K6px9fpid7GPDBofKCtkbUDmeUzF44WG0RzkaQfbB3YCO5I+j/oVYDK0tWdqm3idYRJ/g
 PswcJ0pJ3MtOmU3u5KlSiOG68ZiMcE+z+6vSyjTXzm85TwCq8INB7UsZjEffNz1cQRasdw4ABC
 vW0=
X-SBRS: 2.7
X-MesageID: 4361461
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,377,1559534400"; 
   d="scan'208";a="4361461"
Date: Mon, 12 Aug 2019 16:12:37 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Laszlo Ersek <lersek@redhat.com>
Message-ID: <20190812151237.GB1289@perard.uk.xensource.com>
References: <20190729153944.24239-1-anthony.perard@citrix.com>
 <1ba55a93-e880-6fe3-abfc-a840d956bf3c@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1ba55a93-e880-6fe3-abfc-a840d956bf3c@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Subject: Re: [Xen-devel] [edk2-devel] [PATCH v4 00/35] Specific platform to
 run OVMF in Xen PVH and HVM guests
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
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Jordan Justen <jordan.l.justen@intel.com>, devel@edk2.groups.io,
 Julien Grall <julien.grall@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org,
 Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBKdWwgMzAsIDIwMTkgYXQgMDM6MTA6MTNQTSArMDIwMCwgTGFzemxvIEVyc2VrIHdy
b3RlOgo+IEhpIEFudGhvbnksCj4gCj4gT24gMDcvMjkvMTkgMTc6MzksIEFudGhvbnkgUEVSQVJE
IHdyb3RlOgo+ID4gUGF0Y2ggc2VyaWVzIGF2YWlsYWJsZSBpbiB0aGlzIGdpdCBicmFuY2g6Cj4g
PiBodHRwczovL3hlbmJpdHMueGVuLm9yZy9naXQtaHR0cC9wZW9wbGUvYXBlcmFyZC9vdm1mLmdp
dCBici5wbGF0Zm9ybS14ZW4tcHZoLXY0Cj4gPiAKPiA+IENoYW5nZXMgaW4gdjQ6Cj4gPiAtIHBh
dGNoICJPdm1mUGtnL1hlblBsYXRmb3JtUGVpOiBSZXNlcnZlIGh2bWxvYWRlcidzIG1lbW9yeSBv
bmx5IHdoZW4gaXQgaGFzCj4gPiAgIHJ1biIgd2FzIHJlbW92ZWQsIGFuZCBpbnN0ZWFkIGEgZGlm
ZmVyZW50IGNoYW5nZSBpcyBkb25lIGluCj4gPiAgICJPdm1mUGtnL1hlblBsYXRmb3JtUGVpOiBS
ZXdvcmsgbWVtb3J5IGRldGVjdGlvbiIKPiA+IC0gb3RoZXIgY2hhbmdlcyBkZXRhaWxlZCBpbiB0
aGUgbm90ZXMgb2YgZWFjaCBwYXRjaAo+IAo+IEkndmUgZ29uZSB0aHJvdWdoIHRoZSB2NCBzZXJp
ZXMuIElmIHJldmlld2VycyBvbiB0aGUgeGVuLWRldmVsIGxpc3QKPiB0aGluayB2NCBpcyBva2F5
IHRvIG1lcmdlLCBJIGNhbiBkbyB0aGF0ICh3aXRoIHRoZSBzbWFsbCBmaXh1cHMgSQo+IG9mZmVy
ZWQgaGVyZSBhbmQgdGhlcmUpLiBJIHN1Z2dlc3QgdGhhdCB3ZSB3YWl0IGEgZmV3IGRheXMgLS0g
cGxlYXNlCj4gcGluZyBtZSB3aGVuIHlvdSBiZWxpZXZlIHRoZSByZXZpZXcgb24geGVuLWRldmVs
IGhhcyBjb25jbHVkZWQuCj4gCj4gSWYgeW91IHByZWZlciB0byBwb3N0IHY1LCB0aGF0IHdvcmtz
IGFzIHdlbGwgb2YgY291cnNlLgoKVGhlcmUncyBhIGZldyBtb3JlIHNtYWxsIGZpeHVwIHByb3Bv
c2VkIGJ5IFJvZ2VyLCBzaG91bGQgSSBwb3N0IGEgdjUgZm9yCnRoZW0/IChhbmQgbWF5YmUgb25s
eSBDQyB5b3UgYW5kIHRoZSBsaXN0cy4pCgpPdGhlcndpc2UsIEkndmUgcHVzaGVkIHRoZSBicmFu
Y2ggYnIucGxhdGZvcm0teGVuLXB2aC12NC4xIHRvIG15IHJlcG8gWzFdCndoZXJlIEkgYmVsaWV2
ZSBJJ3ZlIGNvbGxlY3RlZCBhbGwgdGhlIHNtYWxsIGZpeHVwcy4KWzFdIGh0dHBzOi8veGVuYml0
cy54ZW4ub3JnL2dpdC1odHRwL3Blb3BsZS9hcGVyYXJkL292bWYuZ2l0ICBici5wbGF0Zm9ybS14
ZW4tcHZoLXY0LjEKClRoYW5rcywKCi0tIApBbnRob255IFBFUkFSRAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
