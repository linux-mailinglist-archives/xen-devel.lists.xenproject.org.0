Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19F4EC1CF9
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2019 10:20:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iEqs8-0002L4-J5; Mon, 30 Sep 2019 08:17:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=znM2=XZ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iEqs7-0002Kx-MW
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2019 08:17:31 +0000
X-Inumbo-ID: bee8ae30-e35a-11e9-bf31-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by localhost (Halon) with ESMTPS
 id bee8ae30-e35a-11e9-bf31-bc764e2007e4;
 Mon, 30 Sep 2019 08:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569831451;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Ark+G4RXRPvDFXN8CTdRcF+StQ+i33/fzgX+Vohp8/M=;
 b=IeQt92x5L/XhuvybhPZ6yOlUCPH7tCMLVLccp01/gYKmxX3NtLcFtFCy
 ebP0YoWwqZE7FAIHw6K4appGIaB1MweBfKBAAMk6B9pLU9B780QUFXdkX
 gvnrGtYPpo8ZXszQCtxkzJpFloi+cOeU+Mac6tIvsLRgs+Ai3PhTY8hSz g=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 1aDKSqmlnPCkfx0Nz5/oJAT81pOtaHMWAa1hQKGtXQOZKmbAazt9/EothO2QeBIiqUSRH53kaK
 mozGKSqh00mA22CZtiww+UFBCvUj59kHzWRvHeUYCCJdpHl8SsO5xYBm7fucb5IBCHOL10oKPX
 hQMve+27tr+paJh/5YDTJrr5dfTkkJrJY8FvHdASRTWg5hC2hIDdDdBvOKoGDyobos0pIsbORo
 bkoyWNFo9dACvoWqwYEbwFHoSCrRnH4E/IdMTemj85/DSdTfLY8tJCq1rDoh4ewWQ6PDOuZUxs
 F64=
X-SBRS: 2.7
X-MesageID: 6238591
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,565,1559534400"; 
   d="scan'208";a="6238591"
Date: Mon, 30 Sep 2019 10:17:18 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Message-ID: <20190930081718.bij2lrh7fvavwtws@Air-de-Roger>
References: <cover.e819a32509fb1a6bdcbdcefb2de053ccf2361d59.1569379186.git-series.marmarek@invisiblethingslab.com>
 <7d011094eed3f5c3cf6971cc8760874fd56ca443.1569379186.git-series.marmarek@invisiblethingslab.com>
 <20190925094150.qibuqwj6nynjo6vi@Air-de-Roger>
 <20190925122941.GP8065@mail-itl>
 <20190925132617.73qdovaeddl45f2o@Air-de-Roger>
 <20190926041606.GR8065@mail-itl>
 <20190926071017.yztb44ho7tyt5aqz@Air-de-Roger>
 <20190929013554.GA24160@mail-itl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190929013554.GA24160@mail-itl>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
 Stefano Stabellini <sstabellini@kernel.org>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Simon Gaiser <simon@invisiblethingslab.com>,
 Julien Grall <julien.grall@arm.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 xen-devel@lists.xenproject.org, Brian Woods <brian.woods@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gU3VuLCBTZXAgMjksIDIwMTkgYXQgMDM6MzU6NTRBTSArMDIwMCwgTWFyZWsgTWFyY3p5a293
c2tpLUfDs3JlY2tpIHdyb3RlOgo+IE9uIFRodSwgU2VwIDI2LCAyMDE5IGF0IDA5OjEwOjE3QU0g
KzAyMDAsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4gPiBPbiBUaHUsIFNlcCAyNiwgMjAxOSBh
dCAwNjoxNjowNkFNICswMjAwLCBNYXJlayBNYXJjenlrb3dza2ktR8OzcmVja2kgd3JvdGU6Cj4g
PiA+IE9uIFdlZCwgU2VwIDI1LCAyMDE5IGF0IDAzOjI2OjE3UE0gKzAyMDAsIFJvZ2VyIFBhdSBN
b25uw6kgd3JvdGU6Cj4gPiA+ID4gT24gV2VkLCBTZXAgMjUsIDIwMTkgYXQgMDI6Mjk6NDFQTSAr
MDIwMCwgTWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tpIHdyb3RlOgo+ID4gPiA+ID4gT24gV2Vk
LCBTZXAgMjUsIDIwMTkgYXQgMTE6NDE6NTBBTSArMDIwMCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90
ZToKPiA+ID4gPiA+ID4gSXQgd291bGQgc3RpbGwgYmUgbmljZSB0byBnZXQgdGhlIG1pc3Npbmcg
Yml0cyAoaW50ZXJydXB0IGVuYWJsaW5nKSwKPiA+ID4gPiA+ID4gb3IgZWxzZSB0aGlzIHBhdGNo
IGlzIGtpbmQgb2YgcG9pbnRsZXNzLCBzaW5jZSBpdCBzdGlsbCBkb2Vzbid0IGFsbG93Cj4gPiA+
ID4gPiA+IHN0dWJkb21haW5zIHRvIHdvcmsgY29ycmVjdGx5IHdpdGggcGFzc2VkIHRocm91Z2gg
ZGV2aWNlcy4KPiA+ID4gPiA+IAo+ID4gPiA+ID4gV2VsbCwgdGhhdCBwYXJ0LCBhcyBkaXNjdXNz
ZWQsIGRvZXNuJ3QgbmVlZCB0byBiZSBpbiBYZW4uIEZvciBleGFtcGxlCj4gPiA+ID4gPiB0aGUg
c29sdXRpb24gZGVwbG95ZWQgaW4gY3VycmVudCBRdWJlcyBzdGFibGUgdmVyc2lvbiBpcyBiYXNl
ZCBvbgo+ID4gPiA+ID4gcGNpYmFjayBmb3IgdGhpcyBwdXJwb3NlLgo+ID4gPiA+IAo+ID4gPiA+
IEFjay4gRG8geW91IHRoaW5rIGl0IHdvdWxkIG1ha2Ugc2Vuc2UgdG8gc3VibWl0IHRoYXQgcGFy
dCB0byBMaW51eAo+ID4gPiA+IHRoZW4/Cj4gPiA+IAo+ID4gPiBIb3cgd291bGQgYW4gaW50ZXJm
YWNlIHdpdGggdG9vbHN0YWNrICh3aGVuIHRvIGFsbG93IGVuYWJsaW5nIE1TSSkKPiA+ID4gc2hv
dWxkIGxvb2sgbGlrZT8gUmlnaHQgbm93IEkgaGF2ZSBpdCBhcyBleHRyYSBhdHRyaWJ1dGUgaW4g
c3lzZnMgb2YKPiA+ID4gcGNpYmFjayBhbmQgbGlieGwgd3JpdGVzIHRvIGl0LiBPciByYXRoZXIg
c2hvdWxkIGl0IGJlIGluIHhlbnN0b3JlPwo+ID4gCj4gPiBJIHRoaW5rIHhlbnN0b3JlIHdvdWxk
IGJlIG1vcmUgc3VpdGFibGUgZm9yIHRoaXMuIFRoZXJlIGFyZSBhbHJlYWR5Cj4gPiBzb21lIGZs
YWdzIHBhc3NlZCB0byBwY2liYWNrIHRoZXJlOiBtc2l0cmFuc2xhdGUsIHBvd2VyX21nbXQgYW5k
Cj4gPiBwZXJtaXNzaXZlIChzZWUgbGlieGxfcGNpLmM6NjMpLgo+IAo+IEhtbSwgSSBzZWUgcGVy
bWlzc2l2ZSBpcyBhbHNvIHNldCBpbiBzeXNmcwo+IChsaWJ4bF9wY2kuYzpwY2lfYWRkX2RtX2Rv
bmUpLiBBbmQgSSB0aGluayB0aGF0IGlzIHVzZWQgYnkgcGNpYmFjaywKPiBiYXNlZCBvbiBpbnNw
ZWN0aW9uIG9mIGl0cyBzb3VyY2UgY29kZS4KPiBJbiBmYWN0LCBJIGRvbid0IHNlZSBhbnl0aGlu
ZyBpbiBwY2liYWNrIHBhcnNpbmcgb3B0cy0lZCB4ZW5zdG9yZSBlbnRyeQo+IGF0IGFsbC4gSXQg
bG9va3MgbGlrZSBpdCdzIG9ubHkgdXNlZCBieSB0aGUgdG9vbHN0YWNrIHRvIHJlY29uc3RydWN0
Cj4gbGlieGxfZGV2aWNlX3BjaSBzdHJ1Y3QgZnJvbSB4ZW5zdG9yZS4KClRoZW4gcGxlYXNlIHVz
ZSBzeXNmcywgdXNpbmcgd2hhdGV2ZXIgbWVjaGFuaXNtIGlzIHVzZWQgYnkgb3RoZXIKb3B0aW9u
cyBzZWVtcyBmaW5lIHRvIG1lLgoKVGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
