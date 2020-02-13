Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF4CA15BC5D
	for <lists+xen-devel@lfdr.de>; Thu, 13 Feb 2020 11:07:43 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j2BLr-0006Wh-8C; Thu, 13 Feb 2020 10:04:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=XmNm=4B=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j2BLq-0006Wb-DC
 for xen-devel@lists.xenproject.org; Thu, 13 Feb 2020 10:04:06 +0000
X-Inumbo-ID: 2adc017a-4e48-11ea-bc8e-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2adc017a-4e48-11ea-bc8e-bc764e2007e4;
 Thu, 13 Feb 2020 10:04:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1581588245;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=lz3gaWtgpn9EHTtBS+taMoFro5LTt6j60BvENVu/SbQ=;
 b=gcrcNfnbjV30Dc4PYp/HPUliZbYnk3UdmOfQm3ZDK6326yfdgEWywxvC
 lr1FqsyAbgNCiGnSWF+WBtRakwZC+/cBN1QYdxKjJuIaWZGdVnvA5n6ds
 Ixa/ng55gVBW6FbXecW2Ej3s0POOuE7FAYTWwr86qf/ltexA8uO4HUrOw U=;
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
IronPort-SDR: /L+X9UvreXOMkJ2jQtEQFo65zE03wh1iiTUnMGs20Wqvbv6VWn+Ew3npwUfQWCR6FoaIacPt5P
 skEhuQ69CpVa1QlrjdcJeDyDOyY4pcgQ+5B3pWv2EAK7EUlp06CrgCUW+pdktgMviQGjO9ctJq
 QP+6pUjyAdOyMCoYbjNL7064Jb/22SDSOsKilDk7iTckRn+vYdeSYLTR6OVJ0EnTqUwowPfBiT
 wamzXy+gWLIDIFIaeGFQhMn4C9VbtoHAuTKtYFblm38zrjCLCBt6RmjsRv1lfxnxgjMiW8g9pg
 zjI=
X-SBRS: 2.7
X-MesageID: 12757514
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,436,1574139600"; d="scan'208";a="12757514"
Date: Thu, 13 Feb 2020 11:03:55 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200213100355.GV4679@Air-de-Roger>
References: <20200212164949.56434-1-roger.pau@citrix.com>
 <20200212164949.56434-3-roger.pau@citrix.com>
 <4849c6bc-e77b-d02f-7d0d-598cbcb3f145@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4849c6bc-e77b-d02f-7d0d-598cbcb3f145@suse.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH 2/3] x86/smp: use a dedicated scratch
 cpumask in send_IPI_mask
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
Cc: xen-devel@lists.xenproject.org, Sander Eikelenboom <linux@eikelenboom.it>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBGZWIgMTMsIDIwMjAgYXQgMTA6NTk6MjlBTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMTIuMDIuMjAyMCAxNzo0OSwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+ID4gVXNp
bmcgc2NyYXRjaF9jcHVtYXNrIGluIHNlbmRfSVBJX21hayBpcyBub3Qgc2FmZSBiZWNhdXNlIGl0
IGNhbiBiZQo+ID4gY2FsbGVkIGZyb20gaW50ZXJydXB0IGNvbnRleHQsIGFuZCBoZW5jZSBYZW4g
d291bGQgaGF2ZSB0byBtYWtlIHN1cmUKPiA+IGFsbCB0aGUgdXNlcnMgb2YgdGhlIHNjcmF0Y2gg
Y3B1bWFzayBkaXNhYmxlIGludGVycnVwdHMgd2hpbGUgdXNpbmcKPiA+IGl0Lgo+ID4gCj4gPiBJ
bnN0ZWFkIGludHJvZHVjZSBhIG5ldyBjcHVtYXNrIHRvIGJlIHVzZWQgYnkgc2VuZF9JUElfbWFz
aywgYW5kCj4gPiBkaXNhYmxlIGludGVycnVwdHMgd2hpbGUgdXNpbmcuCj4gCj4gTXkgZmlyc3Qg
dGhvdWdodCBoZXJlIHdhczogV2hhdCBhYm91dCBOTUkgb3IgI01DIGNvbnRleHQ/IEV2ZW4gaWYK
PiBub3QgdXNpbmcgdGhlIGZ1bmN0aW9uIHRvZGF5ICh3aGljaCBJIGRpZG4ndCBjaGVjayksIHRo
ZXJlIHNob3VsZG4ndAo+IGJlIGEgbGF0ZW50IGlzc3VlIGludHJvZHVjZWQgaGVyZSBwcmV2ZW50
aW5nIHRoZW0gZnJvbSBkb2luZyBzbyBpbgo+IHRoZSBmdXR1cmUuIEluc3RlYWQgSSB0aGluayB5
b3Ugd2FudCB0byBhbGxvY2F0ZSB0aGUgc2NyYXRjaCBtYXNrCj4gZHluYW1pY2FsbHkgKGF0IGxl
YXN0IGlmIGNhbGxlciBjb250ZXh0IGRvZXNuJ3QgYWxsb3cgdXNlIG9mIHRoZQo+IGdlbmVyaWMg
b25lKSwgYW5kIHNpbXBseSByZWZyYWluIGZyb20gY29hbGVzY2luZyBJUElzIGlmIHRoaXMKPiBh
bGxvY2F0aW9ucyBmYWlscy4KCkhtLCBpc24ndCB0aGlzIGdvaW5nIHRvIGJlIHF1aXRlIGV4cGVu
c2l2ZSwgYW5kIGhlbmNlIHJlbmRlciB0aGUKYmVuZWZpdCBvZiB1c2luZyB0aGUgc2hvcnRoYW5k
IG1vb3Q/CgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
