Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36ED6A9F2B
	for <lists+xen-devel@lfdr.de>; Thu,  5 Sep 2019 12:03:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5oWV-0008FC-Eb; Thu, 05 Sep 2019 09:57:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=lv1E=XA=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1i5oWU-0008F4-42
 for xen-devel@lists.xenproject.org; Thu, 05 Sep 2019 09:57:50 +0000
X-Inumbo-ID: 9e06a172-cfc3-11e9-978d-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9e06a172-cfc3-11e9-978d-bc764e2007e4;
 Thu, 05 Sep 2019 09:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1567677469;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=c85pq4LuAKmtRaArZ/biB/wdWo4VXHadEbKV/NFYq4s=;
 b=d/oiYabi28klFs1vvV00qmXdzut8Fh3HvtcfZzuqwnQjr8fuwB6f6QYE
 dgAh0U1PL03wzrFYHXaTsIKTDyl2S1kaZwnQGuaQQBaHefep4wNoC8fzl
 rqoSD0dBboIoeYvscYZFoX5dXDC+nAA/WBNu0G3wMgIzQDcOMX5VT/YLZ g=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: RwMB7pBsbOB4tN7rnbRCMmMOAwJrZMJftjuuA/mx2x2WGokBZ4n9+isjPq2m+0ETVye6ElQpeF
 ZwHPr/3Ano0jOWyS/ZjdsMaDh8X/frdpzeCS1361pntEIL/Bg5x+5JtqMEM+QnuCF56Hoz6Fhb
 zAC2jYxIDtoI4WKI06Qj71bdZdl5lPXHgBLulN3nBue8OM7l6/d/S5/7CvSNHqjv6rnUcadd3U
 OruEta7hYJkacCjlqkR4FXVsPZ1DP3+pkxLyLXe4GtIx8WHR6wY189GgMGB2Dw8SdXMkb+nH9f
 cfY=
X-SBRS: 2.7
X-MesageID: 5173247
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,470,1559534400"; 
   d="scan'208";a="5173247"
Date: Thu, 5 Sep 2019 11:57:39 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Paul Durrant <Paul.Durrant@citrix.com>
Message-ID: <20190905095739.56lcx5b2twcpdbay@Air-de-Roger>
References: <20190905093416.2955-1-roger.pau@citrix.com>
 <6ecdb5d809b04ad195e644c49a559f55@AMSPEX02CL03.citrite.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6ecdb5d809b04ad195e644c49a559f55@AMSPEX02CL03.citrite.net>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH] x86/libxl: choose a sane default for HAP
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim
 \(Xen.org\)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, Ian
 Jackson <Ian.Jackson@citrix.com>, Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBTZXAgMDUsIDIwMTkgYXQgMTE6NDA6MTlBTSArMDIwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPiBbc25pcF0KPiA+IC12b2lkIGxp
YnhsX19hcmNoX2RvbWFpbl9jcmVhdGVfaW5mb19zZXRkZWZhdWx0KGxpYnhsX19nYyAqZ2MsCj4g
PiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBsaWJ4bF9k
b21haW5fY3JlYXRlX2luZm8gKmNfaW5mbykKPiA+ICtpbnQgbGlieGxfX2FyY2hfZG9tYWluX2Ny
ZWF0ZV9pbmZvX3NldGRlZmF1bHQobGlieGxfX2djICpnYywKPiA+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbGlieGxfZG9tYWluX2NyZWF0ZV9pbmZvICpj
X2luZm8pCj4gPiAgewo+ID4gKyAgICBsaWJ4bF9waHlzaW5mbyBwaTsKPiA+ICsgICAgaW50IHJj
ID0gbGlieGxfZ2V0X3BoeXNpbmZvKENUWCwgJnBpKTsKPiA+ICsKPiA+ICsgICAgaWYgKHJjKSB7
Cj4gPiArICAgICAgICBMT0coRVJST1IsICJ1bmFibGUgdG8gZ2V0IHBoeXNpbmZvIik7Cj4gPiAr
ICAgICAgICByZXR1cm4gcmM7Cj4gPiArICAgIH0KPiA+ICsKPiA+ICsgICAgbGlieGxfZGVmYm9v
bF9zZXRkZWZhdWx0KCZjX2luZm8tPmhhcCwgcGkuY2FwX2hhcCk7Cj4gCj4gSXMgdGhpcyBnb2lu
ZyB0byB3b3JrIG9uIEFSTSAod2hlcmUgQ0RGX2hhcCBpcyByZXF1aXJlZCk/IEJlY2F1c2UuLi4K
Ckl0IHNob3VsZCwgbGlieGxfX2FyY2hfZG9tYWluX2NyZWF0ZV9pbmZvX3NldGRlZmF1bHQgZm9y
IEFSTSBzZXRzIGhhcAp0byB0cnVlIHVuY29uZGl0aW9uYWxseS4KCj4gPiArCj4gPiArICAgIHJl
dHVybiAwOwo+ID4gIH0KPiA+IAo+ID4gIHZvaWQgbGlieGxfX2FyY2hfZG9tYWluX2J1aWxkX2lu
Zm9fc2V0ZGVmYXVsdChsaWJ4bF9fZ2MgKmdjLAo+ID4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4
Ni9zeXNjdGwuYyBiL3hlbi9hcmNoL3g4Ni9zeXNjdGwuYwo+ID4gaW5kZXggYzUwZDkxMGExYy4u
NzRlYTE4NDA4NyAxMDA2NDQKPiA+IC0tLSBhL3hlbi9hcmNoL3g4Ni9zeXNjdGwuYwo+ID4gKysr
IGIveGVuL2FyY2gveDg2L3N5c2N0bC5jCj4gPiBAQCAtMTY1LDYgKzE2NSw4IEBAIHZvaWQgYXJj
aF9kb19waHlzaW5mbyhzdHJ1Y3QgeGVuX3N5c2N0bF9waHlzaW5mbyAqcGkpCj4gPiAgICAgICAg
ICBwaS0+Y2FwYWJpbGl0aWVzIHw9IFhFTl9TWVNDVExfUEhZU0NBUF9wdjsKPiA+ICAgICAgaWYg
KCBpb21tdV9lbmFibGVkICkKPiA+ICAgICAgICAgIHBpLT5jYXBhYmlsaXRpZXMgfD0gWEVOX1NZ
U0NUTF9QSFlTQ0FQX2RpcmVjdGlvOwo+ID4gKyAgICBpZiAoIGh2bV9oYXBfc3VwcG9ydGVkKCkg
KQo+ID4gKyAgICAgICAgcGktPmNhcGFiaWxpdGllcyB8PSBYRU5fU1lTQ1RMX1BIWVNDQVBfaGFw
Owo+IAo+IC4uLnRoaXMgaXMgeDg2LW9ubHkgY29kZSwgYW5kIEkgZG9uJ3Qgc2VlIGFuIGVxdWl2
YWxlbnQgaHVuayBmb3IgQVJNLgoKWWVzLCB0aGF0IGZsYWcgaXMgeDg2IG9ubHkgQVRNIChsaWtl
IGFsbCBvdGhlciBjYXBhYmlsaXR5IGZsYWdzKS4KClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
