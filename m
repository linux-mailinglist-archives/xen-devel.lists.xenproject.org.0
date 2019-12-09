Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97C14116AF5
	for <lists+xen-devel@lfdr.de>; Mon,  9 Dec 2019 11:27:25 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ieGE8-0008O4-2Q; Mon, 09 Dec 2019 10:25:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pdib=Z7=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ieGE5-0008Nx-QN
 for xen-devel@lists.xenproject.org; Mon, 09 Dec 2019 10:25:13 +0000
X-Inumbo-ID: 2f1c33f8-1a6e-11ea-88e7-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2f1c33f8-1a6e-11ea-88e7-bc764e2007e4;
 Mon, 09 Dec 2019 10:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1575887113;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=QqsvCvXWwsuyvro4Oe/HDB6iVb95L3JCBMCUSPuWLo4=;
 b=EBOwDno18Uk+3qcuoy2r1MxSjm5nJ5M4lpKBP1XHhtzDHQ7HcvuqkvBP
 7FGh2Vomndij+/PpYfBhnJTtzbosj2p2In9XwTMFDcAwf8dVuJRorxQ0U
 fBB6VDXdMRB5lE/LdPmlM/X5tN5rZ+ZGsIiec6ZBYf4aklDw3X2/K8nqg 8=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: dAvvkBFRG6yGprrgSFHE+UKDRhpggdVlWE4myWamI6xdhLOHHqRM3leYjdC1AM1M0vPueowfk0
 4At5ifZAA78F4SW7tYTBsVCY4sv8KWC0chgOGJshj9/82nd5yo/tIj3d5snhlLmyt36vnNer/4
 lfQ2vyaVdkw+gJldYkGDaIdt+LVkFVv/0H3cvv8+MzoTHxUYbqrjKnZUaHeKl8WtMbvDyJ0AXG
 TOeYAsfPucliABRI8fuDX8sXdPGlDAlgVKQHx0CZxURAquiCb3njeOCXnJ1MABH53xWH8VGhSW
 3RY=
X-SBRS: 2.7
X-MesageID: 9739118
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,294,1571716800"; 
   d="scan'208";a="9739118"
Date: Mon, 9 Dec 2019 11:25:02 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20191209102502.GO980@Air-de-Roger>
References: <20191204162025.37510-1-roger.pau@citrix.com>
 <20191204162025.37510-3-roger.pau@citrix.com>
 <b4f32391-894b-a781-ad54-39d53d3bf728@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b4f32391-894b-a781-ad54-39d53d3bf728@suse.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL03.citrite.net (10.69.22.127)
Subject: Re: [Xen-devel] [PATCH v3 2/4] x86/apic: force phys mode if
 interrupt remapping is disabled
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

T24gVGh1LCBEZWMgMDUsIDIwMTkgYXQgMTA6MzI6MzRBTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMDQuMTIuMjAxOSAxNzoyMCwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+ID4gQ2x1
c3RlciBtb2RlIGNhbiBvbmx5IGJlIHVzZWQgd2l0aCBpbnRlcnJ1cHQgcmVtYXBwaW5nIHN1cHBv
cnQsIHNpbmNlCj4gPiB0aGUgdG9wIDE2Yml0cyBvZiB0aGUgQVBJQyBJRCBhcmUgZmlsbGVkIHdp
dGggdGhlIGNsdXN0ZXIgSUQsIGFuZAo+ID4gaGVuY2Ugb24gc3lzdGVtcyB3aGVyZSB0aGUgcGh5
c2ljYWwgSUQgaXMgc3RpbGwgc21hbGxlciB0aGFuIDI1NSB0aGUKPiA+IGNsdXN0ZXIgSUQgaXMg
bm90LiBGb3JjZSB4MkFQSUMgdG8gdXNlIHBoeXNpY2FsIG1vZGUgaWYgdGhlcmUncyBubwo+ID4g
aW50ZXJydXB0IHJlbWFwcGluZyBzdXBwb3J0Lgo+ID4gCj4gPiBOb3RlIHRoYXQgdGhpcyByZXF1
aXJlcyBhIGZ1cnRoZXIgcGF0Y2ggaW4gb3JkZXIgdG8gZW5hYmxlIHgyQVBJQwo+ID4gd2l0aG91
dCBpbnRlcnJ1cHQgcmVtYXBwaW5nIHN1cHBvcnQuCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IFJv
Z2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgo+IAo+IFJldmlld2VkLWJ5OiBK
YW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4gYWxiZWl0IC4uLgo+IAo+ID4gLS0tIGEv
eGVuL2FyY2gveDg2L2dlbmFwaWMveDJhcGljLmMKPiA+ICsrKyBiL3hlbi9hcmNoL3g4Ni9nZW5h
cGljL3gyYXBpYy5jCj4gPiBAQCAtMjI2LDcgKzIyNiwyMyBAQCBib29sZWFuX3BhcmFtKCJ4MmFw
aWNfcGh5cyIsIHgyYXBpY19waHlzKTsKPiA+ICBjb25zdCBzdHJ1Y3QgZ2VuYXBpYyAqX19pbml0
IGFwaWNfeDJhcGljX3Byb2JlKHZvaWQpCj4gPiAgewo+ID4gICAgICBpZiAoIHgyYXBpY19waHlz
IDwgMCApCj4gPiAtICAgICAgICB4MmFwaWNfcGh5cyA9ICEhKGFjcGlfZ2JsX0ZBRFQuZmxhZ3Mg
JiBBQ1BJX0ZBRFRfQVBJQ19QSFlTSUNBTCk7Cj4gPiArICAgIHsKPiA+ICsgICAgICAgIGlmICgg
IWlvbW11X2ludHJlbWFwICkKPiA+ICsgICAgICAgICAgICAvKgo+ID4gKyAgICAgICAgICAgICAq
IEZvcmNlIHBoeXNpY2FsIG1vZGUgaWYgdGhlcmUncyBubyBpbnRlcnJ1cHQgcmVtYXBwaW5nIHN1
cHBvcnQ6Cj4gPiArICAgICAgICAgICAgICogdGhlIElEIGluIGNsdXN0ZXJlZCBtb2RlIHJlcXVp
cmVzIGEgMzIgYml0IGRlc3RpbmF0aW9uIGZpZWxkIGR1ZQo+ID4gKyAgICAgICAgICAgICAqIHRv
IHRoZSB1c2FnZSBvZiB0aGUgaGlnaCAxNiBiaXRzIHRvIHN0b3JlIHRoZSBjbHVzdGVyIElELgo+
ID4gKyAgICAgICAgICAgICAqLwo+ID4gKyAgICAgICAgICAgIHgyYXBpY19waHlzID0gdHJ1ZTsK
PiA+ICsgICAgICAgIGVsc2UKPiA+ICsgICAgICAgICAgICB4MmFwaWNfcGh5cyA9ICEhKGFjcGlf
Z2JsX0ZBRFQuZmxhZ3MgJiBBQ1BJX0ZBRFRfQVBJQ19QSFlTSUNBTCk7Cj4gCj4gLi4uIEkgd29u
ZGVyIHdoeSB5b3UgZGlkbid0IG1ha2UgdGhpcwo+IAo+ICAgICAgICAgeDJhcGljX3BoeXMgPSAh
aW9tbXVfaW50cmVtYXAgfHwgKGFjcGlfZ2JsX0ZBRFQuZmxhZ3MgJiBBQ1BJX0ZBRFRfQVBJQ19Q
SFlTSUNBTCk7Cj4gCj4gKG5vdCB0aGUgbGVhc3QgYmVjYXVzZSBvZiBhbGxvd2luZyB0byBkcm9w
IHRoZSBzb21ld2hhdCB1Z2x5ICEhKS4KCkZlZWwgZnJlZSB0byBkbyBpdCBhdCBjb21taXQgKGFu
ZCByZWluZGVudCB0aGUgY29tbWVudCksIG9yIGVsc2UgSSBjYW4KcmVzZW5kIGEgbmV3IHZlcnNp
b24gaWYgdGhhdCdzIHRvbyBpbnRydXNpdmUuCgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
