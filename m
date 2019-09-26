Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EDBFBEC66
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 09:14:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDNv6-0005Y6-5G; Thu, 26 Sep 2019 07:10:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1cs6=XV=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iDNv4-0005Xx-Ez
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 07:10:30 +0000
X-Inumbo-ID: b8a17fba-e02c-11e9-b588-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by localhost (Halon) with ESMTPS
 id b8a17fba-e02c-11e9-b588-bc764e2007e4;
 Thu, 26 Sep 2019 07:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569481829;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=fl6Z7O8t9VMELr9RSL7I6uuci6ktsqEyEAE+9PMdZQM=;
 b=HerpX0SUgWmhLAEd2c1Pi9iPQV2AMYBXf8gW+lQQOHT07VTJ+v5+AuG7
 sulL3a2a1Y+KuTrIgblcVTjNz0zUIshaDkEZ2F1fUUjNo3WBxvrU+Y1DW
 bK3P7p0G0R+2+0r9mjv9zQZomKC+MBv/cMNXimROn7gwevXeKo3+RMYgM 4=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Q9Y3q+sTKqbMYSL9QH0T3n9axmCb0EQWrDEkp1t4nQXGsoSSCbi5Xeye0+GlindzSTGNtf2/wh
 TVQlq5muqosVXFuhiHWZpyGye3O5rfrjY+Qk/AY1161/KQ3A0hForr73az6C8MsyYMA4GbJkKH
 /RRTgpOw5zB+3nE508IF1RRX7xcmjxqK1WFq+Q5+yqPP66IziY8VWWB3zFHMn5fjlDf+tMR9/z
 5Wb3LjHeUusNrITZFkBgG48+0kzywAy5U0DqWc8H1kcW/ut4kRS72379/lL6i1mCPMDDZuQdLF
 /rI=
X-SBRS: 2.7
X-MesageID: 6323148
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,551,1559534400"; 
   d="scan'208";a="6323148"
Date: Thu, 26 Sep 2019 09:10:17 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Message-ID: <20190926071017.yztb44ho7tyt5aqz@Air-de-Roger>
References: <cover.e819a32509fb1a6bdcbdcefb2de053ccf2361d59.1569379186.git-series.marmarek@invisiblethingslab.com>
 <7d011094eed3f5c3cf6971cc8760874fd56ca443.1569379186.git-series.marmarek@invisiblethingslab.com>
 <20190925094150.qibuqwj6nynjo6vi@Air-de-Roger>
 <20190925122941.GP8065@mail-itl>
 <20190925132617.73qdovaeddl45f2o@Air-de-Roger>
 <20190926041606.GR8065@mail-itl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190926041606.GR8065@mail-itl>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v7 4/4] xen/x86: Allow stubdom access to irq
 created for msi.
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
 Stefano Stabellini <sstabellini@kernel.org>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Tim Deegan <tim@xen.org>, Simon Gaiser <simon@invisiblethingslab.com>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org, Brian Woods <brian.woods@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBTZXAgMjYsIDIwMTkgYXQgMDY6MTY6MDZBTSArMDIwMCwgTWFyZWsgTWFyY3p5a293
c2tpLUfDs3JlY2tpIHdyb3RlOgo+IE9uIFdlZCwgU2VwIDI1LCAyMDE5IGF0IDAzOjI2OjE3UE0g
KzAyMDAsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4gPiBPbiBXZWQsIFNlcCAyNSwgMjAxOSBh
dCAwMjoyOTo0MVBNICswMjAwLCBNYXJlayBNYXJjenlrb3dza2ktR8OzcmVja2kgd3JvdGU6Cj4g
PiA+IE9uIFdlZCwgU2VwIDI1LCAyMDE5IGF0IDExOjQxOjUwQU0gKzAyMDAsIFJvZ2VyIFBhdSBN
b25uw6kgd3JvdGU6Cj4gPiA+ID4gSXQgd291bGQgc3RpbGwgYmUgbmljZSB0byBnZXQgdGhlIG1p
c3NpbmcgYml0cyAoaW50ZXJydXB0IGVuYWJsaW5nKSwKPiA+ID4gPiBvciBlbHNlIHRoaXMgcGF0
Y2ggaXMga2luZCBvZiBwb2ludGxlc3MsIHNpbmNlIGl0IHN0aWxsIGRvZXNuJ3QgYWxsb3cKPiA+
ID4gPiBzdHViZG9tYWlucyB0byB3b3JrIGNvcnJlY3RseSB3aXRoIHBhc3NlZCB0aHJvdWdoIGRl
dmljZXMuCj4gPiA+IAo+ID4gPiBXZWxsLCB0aGF0IHBhcnQsIGFzIGRpc2N1c3NlZCwgZG9lc24n
dCBuZWVkIHRvIGJlIGluIFhlbi4gRm9yIGV4YW1wbGUKPiA+ID4gdGhlIHNvbHV0aW9uIGRlcGxv
eWVkIGluIGN1cnJlbnQgUXViZXMgc3RhYmxlIHZlcnNpb24gaXMgYmFzZWQgb24KPiA+ID4gcGNp
YmFjayBmb3IgdGhpcyBwdXJwb3NlLgo+ID4gCj4gPiBBY2suIERvIHlvdSB0aGluayBpdCB3b3Vs
ZCBtYWtlIHNlbnNlIHRvIHN1Ym1pdCB0aGF0IHBhcnQgdG8gTGludXgKPiA+IHRoZW4/Cj4gCj4g
SG93IHdvdWxkIGFuIGludGVyZmFjZSB3aXRoIHRvb2xzdGFjayAod2hlbiB0byBhbGxvdyBlbmFi
bGluZyBNU0kpCj4gc2hvdWxkIGxvb2sgbGlrZT8gUmlnaHQgbm93IEkgaGF2ZSBpdCBhcyBleHRy
YSBhdHRyaWJ1dGUgaW4gc3lzZnMgb2YKPiBwY2liYWNrIGFuZCBsaWJ4bCB3cml0ZXMgdG8gaXQu
IE9yIHJhdGhlciBzaG91bGQgaXQgYmUgaW4geGVuc3RvcmU/CgpJIHRoaW5rIHhlbnN0b3JlIHdv
dWxkIGJlIG1vcmUgc3VpdGFibGUgZm9yIHRoaXMuIFRoZXJlIGFyZSBhbHJlYWR5CnNvbWUgZmxh
Z3MgcGFzc2VkIHRvIHBjaWJhY2sgdGhlcmU6IG1zaXRyYW5zbGF0ZSwgcG93ZXJfbWdtdCBhbmQK
cGVybWlzc2l2ZSAoc2VlIGxpYnhsX3BjaS5jOjYzKS4KCj4gT3IgbWF5YmUgcGNpYmFjayBzaG91
bGQgc29tZWhvdyBkZXRlY3QgaXRzZWxmIGlmIGl0J3MgdGFsa2luZyB0bwo+IHN0dWJkb21haW4g
d2hpbGUgdGhlIGRldmljZSBpcyBhc3NpZ25lZCB0byBhIEhWTSBkb21haW4sIG9yIHRvIGEgdGFy
Z2V0Cj4gUFYgZG9tYWluIGl0c2VsZj8KCkkgdGhpbmsgZG9pbmcgaXQgaW4gdGhlIHRvb2xzdGFj
ayBhbmQganVzdCBwYXNzaW5nIGFuIG9wdGlvbiB0bwpwY2liYWNrIGlzIGxpa2VseSBlYXNpZXIg
dGhhbiBhZGRpbmcgbW9yZSBsb2dpYyB0byBwY2liYWNrLgoKVGhhbmtzLCBSb2dlci4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
