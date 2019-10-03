Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 853ECCA12E
	for <lists+xen-devel@lfdr.de>; Thu,  3 Oct 2019 17:36:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iG35K-00049N-C6; Thu, 03 Oct 2019 15:32:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fiRV=X4=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1iG35I-00049I-UB
 for xen-devel@lists.xenproject.org; Thu, 03 Oct 2019 15:32:04 +0000
X-Inumbo-ID: f305df68-e5f2-11e9-80e3-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f305df68-e5f2-11e9-80e3-bc764e2007e4;
 Thu, 03 Oct 2019 15:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1570116724;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=2g1bGp4y/oceY2OkrWcsfWh2eKBiPFxkmT0DBu92EWM=;
 b=SGDGKnBuTyN5qsJJj4A/jEt8T0G6EWcGs9/kO4+FFfQjCFSG83H5VLFT
 AETAG5rCRissndbq+uprRm2jKqvNJKymeD3J68NkmURPwAgr5ycAKebJy
 +tybaW08NI1cMw836gQ3LKXi2nXCwUwPdidMpjHqu9Bkly+uxnmNgGlc7 s=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: mkkpBpqsS8QIy7Zy2PcmX4Y/7Bs55eZ/Li9BlmgBRI8MCTzLp6q0ht+EvdWKJbtH+db3ZjNpxH
 DfTce163nFCsFqqaXNjcBtGGOA+3AA+ahyF2kyNyoPN4yXbZPdeZBwyFoEUP8EMhwaDea/6JUe
 bqX8FkKOn6Dq0aHFOE+NDVo428akstdlKAcen8zjutTAgvSXvFDYmaRyILjXDS6q6LZVWC+ZCQ
 8/KGgXUlfXj3B8IGBntNAiRT+UJu36kkYLD/jPNg7anRTWcKHlZkg6VuNs3Vj8a93Ymidp6Dwu
 6lY=
X-SBRS: 2.7
X-MesageID: 6426260
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,252,1566878400"; 
   d="scan'208";a="6426260"
Date: Thu, 3 Oct 2019 16:31:38 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Ian Jackson <ian.jackson@citrix.com>
Message-ID: <20191003153138.GK1163@perard.uk.xensource.com>
References: <20191001145714.556-1-paul.durrant@citrix.com>
 <23956.51705.860315.343098@mariner.uk.xensource.com>
 <CACCGGhDXHhuF7z-ezZUWyGGLY8T9a+JDC4_yw-TrCY3HuPyKPQ@mail.gmail.com>
 <23957.63479.327739.875395@mariner.uk.xensource.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <23957.63479.327739.875395@mariner.uk.xensource.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Subject: Re: [Xen-devel] [PATCH-for-4.13 v2 0/2] libxl: fix assertion failure
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
Cc: Juergen Gross <jgross@suse.com>, Paul Durrant <pdurrant@gmail.com>,
 Paul Durrant <Paul.Durrant@citrix.com>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBPY3QgMDMsIDIwMTkgYXQgMDI6MzA6MzFQTSArMDEwMCwgSWFuIEphY2tzb24gd3Jv
dGU6Cj4gUGF1bCBEdXJyYW50IHdyaXRlcyAoIlJlOiBbWGVuLWRldmVsXSBbUEFUQ0gtZm9yLTQu
MTMgdjIgMC8yXSBsaWJ4bDogZml4IGFzc2VydGlvbiBmYWlsdXJlIik6Cj4gPiBPbiBXZWQsIDIg
T2N0IDIwMTkgYXQgMTc6MDQsIElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBjaXRyaXguY29tPiB3
cm90ZToKPiA+ID4gSSBhbSBjb250aW51aW5nIHRvIGxvb2sgYXQgdGhlIGRlZmF1bHRpbmcgYW5k
IGNvbmZpZyBtYW5hZ2VtZW50IGhlcmUKPiA+ID4gd2l0aCBhIHZpZXcgdG8gZ2V0dGluZyByaWQg
b2Ygc29tZSBvZiB0aGUgZHVwbGljYXRlZCBjb2RlIGFuZCBtb3ZpbmcKPiA+ID4gaXQgYWxsIGlu
dG8gbGlieGwuCj4gPiAKPiA+IFRoYXQgd291bGQgaW5kZWVkIGJlIGJlbmVmaWNpYWwgZm9yIHRo
ZSBsaWtlcyBvZiBsaWJ2aXJ0Lgo+IAo+IEkgcHJvcG9zZSB0aGUgZm9sbG93aW5nIHBsYW4gZm9y
IDQuMTM6Cj4gCj4gICogTW92ZSB0aGUgZGVmYXVsdCBjYWxjdWxhdGlvbnMgb2YgYl9pbmZvLT5z
aGFkb3dfbWVta2IgYW5kCj4gICAgYl9pbmZvLT5pb21tdV9tZW1rYiBmcm9tIHhsX3ZtY29udHJv
bC5jIGludG8gbGlieGwsIGluIGEgbmV3Cj4gICAgZnVuY3Rpb24gbGlieGxfX25lZWRfbWVtb3J5
X3NldGRlZmF1bHQsIGNhbGxlZCBmcm9tCj4gICAgaW5pdGlhdGVfZG9tYWluX2NyZWF0ZS4gIFRo
YXQgaGFzIGFjY2VzcyB0byB0aGUgd2hvbGUgb2YgY19pbmZvIGFuZAo+ICAgIGJfaW5mby4KPiAK
PiAgKiBDaGFuZ2UgdGhlIEFQSS9BQkkgZm9yIGxpYnhsX2RvbWFpbl9uZWVkX21lbW9yeSB0byB0
YWtlIGEKPiAgICBsaWJ4bF9kb21haW5fY29uZmlnLiAgSW50ZXJuYWxseSwgdGhpcyB3aWxsIGNh
bGwgYW4gaW1wbGVtZW50YXRpb24KPiAgICBmdW5jdGlvbiBsaWJ4bF9fZG9tYWluX25lZWRfbWVt
b3J5IHdoaWNoIHRha2VzIHRoZSBiX2luZm8gYW5kCj4gICAgY19pbmZvIHNlcGFyYXRlbHksIGFu
ZCB3aGljaCBjYWxscyBsaWJ4bF9fbmVlZF9tZW1vcnlfc2V0ZGVmYXVsdC4KPiAgICAoVGhpcyBp
cyB0aGUgb25seSBvdGhlciBjYWxsIHNpdGUgZm9yCj4gICAgbGlieGxfX2RvbWFpbl9idWlsZF9p
bmZvX3NldGRlZmF1bHQuKQo+IAo+ICAqIFRoZXJlIHdpbGwgYmUgdGhlIHVzdWFsIGJhY2t3YXJk
IGNvbXBhdGlibGUgYXJyYW5nZW1lbnQ6IGhlcmUsIGEKPiAgICBmdW5jdGlvbiBsaWJ4bF9kb21h
aW5fbmVlZF9tZW1vcnlfMHgwNDBjMDAsIHdoaWNoIHdpbGwgcGFzcyBOVUxMCj4gICAgZm9yIGNf
aW5mby4gIFRoZSBjb2RlIGluIGxpYnhsX19uZWVkX21lbW9yeV9zZXRkZWZhdWx0IHdpbGwgdXNl
IDAKPiAgICBmb3IgdGhlIHR3byBhZGRpdGlvbmFsIG1lbW9yeSBhbW91bnRzIHdoZW4gY19pbmZv
IGlzIE5VTEwuCj4gCj4gICogVGhlIG92ZXJhbGwgZWZmZWN0IGlzIHRoYXQgb2xkIGNhbGxlcnMg
d2lsbCBnZXQgdGhlIG9sZCBiZWhhdmlvdXIuCj4gICAgTmV3IGNhbGxlcnMgZ2V0IHRoZSBuZXcg
cmlnaHQgYmVoYXZpb3VyLiAgVGhpcyBpcyB0aGUgc2FtZSBhcyB0aGUKPiAgICBwcmVzZW50IGxp
YnhsIDQuMTMgY29kZS4gIE5vdGUgdGhhdCBsaWJ4bF9kb21haW5fbmVlZF9tZW1vcnkKPiAgICBh
bHJlYWR5IGhhcyBhbiBBUEkgc3RhYmlsaXR5IGNhdmVhdC4KPiAKPiAgKiBDb25zZXF1ZW50bHks
IHRoZSBuZWVkIGZvciBsaWJ4bF9nZXRfcmVxdWlyZWRfc2hhZG93X21lbW9yeSBhbmQKPiAgICBs
aWJ4bF9nZXRfcmVxdWlyZWRfaW9tbXVfbWVtb3J5IGdvZXMgYXdheS4gIERlbGV0ZSB0aGVtICh0
aGV5IGhhdmUKPiAgICBub3QgYmVlbiBpbiBhbnkgcmVsZWFzZSBzbyB3ZSBjYW4ganVzdCBkbyB0
aGlzKS4KCmxpYnhsX2dldF9yZXF1aXJlZF9zaGFkb3dfbWVtb3J5IGlzIG9sZCwgYW5kIGxpYnZp
cnQgaXMgdXNpbmcuCk9ubHkgbGlieGxfZ2V0X3JlcXVpcmVkX2lvbW11X21lbW9yeSBpcyBuZXcu
Cgo+ICAqIEludmVudCBhIG5ldyB2YWx1ZSBmb3IgY19pbmZvLT5wYXNzdGhyb3VnaCAiZW5hYmxl
ZCIuICBEZWZhdWx0aW5nCj4gICAgd2lsbCBiZSAxLiB0dXJuICJ1bmtub3duIiBpbnRvICJkaXNh
YmxlZCIgb3IgImVuYWJsZWQiIGFjY29yZGluZyB0bwo+ICAgIHRoZSBjdXJyZW50IGxvZ2ljIGJh
c2VkIG9uIHBjaWRldnMvZHRkZWZzOyAyLiB0dXJuICJlbmFibGVkIiBpbnRvCj4gICAgc29tZXRo
aW5nIHNwZWNpZmljIGFjY29yZGluZyB0byB0aGUgY3VycmVudCBsb2dpYyBiYXNlZCBvbiB0eXBl
LAo+ICAgIGhhcF9wdF9zaGFyZSwgZXRjLiAgTWFrZSBzdXJlIHRoaXMgaXMgYWxsIGNvcnJlY3Qg
aW5zaWRlIGxpYnhsLgo+IAo+ICAqIERlbGV0ZSB0aGUgZGVmYXVsdGluZyBjb2RlIGluIHhsLiAg
eGwgY2FuIGp1c3QgbGVhdmUgc2V0dGluZ3Mgbm90Cj4gICAgc3BlY2lmaWVkIGJ5IHRoZSB1c2Vy
IGFzIGJsYW5rLCBhbmQgbGlieGwgd2lsbCBEVFJUIHdpdGggdGhlbS4KPiAKPiBXaGF0IGRvIHBl
b3BsZSB0aGluayA/ICBJIHJlYWxseSB3YW50IHRvIGZpeCB0aGlzIGZvciA0LjEzIGJlY2F1c2Ug
dGhlCj4gY3VycmVudCA0LjEzIEFQSSBpcyBub3Qgb25lIEkgd2FudCB0byBzdXBwb3J0LgoKVGhh
dCBwbGFuIHNvdW5kIGZpbmUgdG8gbWUuCgotLSAKQW50aG9ueSBQRVJBUkQKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
