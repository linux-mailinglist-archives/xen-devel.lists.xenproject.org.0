Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC1FA15BDF3
	for <lists+xen-devel@lfdr.de>; Thu, 13 Feb 2020 12:46:03 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j2Csd-0007a3-CF; Thu, 13 Feb 2020 11:42:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=XmNm=4B=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j2Csc-0007Zy-HZ
 for xen-devel@lists.xenproject.org; Thu, 13 Feb 2020 11:42:02 +0000
X-Inumbo-ID: d91c12f4-4e55-11ea-b888-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d91c12f4-4e55-11ea-b888-12813bfff9fa;
 Thu, 13 Feb 2020 11:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1581594121;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=JRNyAVR3QqvZqywk5CmmfvoYmiuHoNmYC5fBs7f4UzQ=;
 b=XfY6Lb7McVPrm6Mj28FaH883diRLDNe1WDXUX2UbBo3kY4ZlDFWE7eQU
 rF/IpxD+EMU/FAJlGd91WlN0eMHKRzf0fkHKsiC09/nYicdH27EkXQdwS
 BildqxNmGcNKLaMc7TOfYGVxDBnMwwL0lXsmel2HSX7dod2gePqoSQ01T k=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: ctpea0dbgS6YpnvZOcPMDQ318UdyFjQkbVxcZFaRFJ6YiMhwW/bO3Fqttd35e4XL4Wc3rQfjbf
 uQdepY76RjeawF7CDpoP/jpz8HNje9SvGY/xIbQxkwAfC76cK9QPnXXDQyydpscY/UaHxQoYD2
 tSHs3q3C7j++qbPMRYP12OveydeyGQ26OPfKnKj03H9r047acUUdui0l9nm8uyQ8mncW9Zs6z8
 3EkCBp4Zw4F80J30wk3LSQgpRv7I5KzAMhf7o8v0Zy0ISZdYMu0eQkeaqLQOw9BKEL1o7SAmlX
 eLI=
X-SBRS: 2.7
X-MesageID: 12824235
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,436,1574139600"; d="scan'208";a="12824235"
Date: Thu, 13 Feb 2020 12:41:54 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200213114154.GX4679@Air-de-Roger>
References: <20200212164949.56434-1-roger.pau@citrix.com>
 <20200212164949.56434-3-roger.pau@citrix.com>
 <4849c6bc-e77b-d02f-7d0d-598cbcb3f145@suse.com>
 <20200213100355.GV4679@Air-de-Roger>
 <a839cdc7-bc52-92cf-8020-74cfad568358@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a839cdc7-bc52-92cf-8020-74cfad568358@suse.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
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

T24gVGh1LCBGZWIgMTMsIDIwMjAgYXQgMTE6MTk6MDJBTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMTMuMDIuMjAyMCAxMTowMywgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiA+IE9u
IFRodSwgRmViIDEzLCAyMDIwIGF0IDEwOjU5OjI5QU0gKzAxMDAsIEphbiBCZXVsaWNoIHdyb3Rl
Ogo+ID4+IE9uIDEyLjAyLjIwMjAgMTc6NDksIFJvZ2VyIFBhdSBNb25uZSB3cm90ZToKPiA+Pj4g
VXNpbmcgc2NyYXRjaF9jcHVtYXNrIGluIHNlbmRfSVBJX21hayBpcyBub3Qgc2FmZSBiZWNhdXNl
IGl0IGNhbiBiZQo+ID4+PiBjYWxsZWQgZnJvbSBpbnRlcnJ1cHQgY29udGV4dCwgYW5kIGhlbmNl
IFhlbiB3b3VsZCBoYXZlIHRvIG1ha2Ugc3VyZQo+ID4+PiBhbGwgdGhlIHVzZXJzIG9mIHRoZSBz
Y3JhdGNoIGNwdW1hc2sgZGlzYWJsZSBpbnRlcnJ1cHRzIHdoaWxlIHVzaW5nCj4gPj4+IGl0Lgo+
ID4+Pgo+ID4+PiBJbnN0ZWFkIGludHJvZHVjZSBhIG5ldyBjcHVtYXNrIHRvIGJlIHVzZWQgYnkg
c2VuZF9JUElfbWFzaywgYW5kCj4gPj4+IGRpc2FibGUgaW50ZXJydXB0cyB3aGlsZSB1c2luZy4K
PiA+Pgo+ID4+IE15IGZpcnN0IHRob3VnaHQgaGVyZSB3YXM6IFdoYXQgYWJvdXQgTk1JIG9yICNN
QyBjb250ZXh0PyBFdmVuIGlmCj4gPj4gbm90IHVzaW5nIHRoZSBmdW5jdGlvbiB0b2RheSAod2hp
Y2ggSSBkaWRuJ3QgY2hlY2spLCB0aGVyZSBzaG91bGRuJ3QKPiA+PiBiZSBhIGxhdGVudCBpc3N1
ZSBpbnRyb2R1Y2VkIGhlcmUgcHJldmVudGluZyB0aGVtIGZyb20gZG9pbmcgc28gaW4KPiA+PiB0
aGUgZnV0dXJlLiBJbnN0ZWFkIEkgdGhpbmsgeW91IHdhbnQgdG8gYWxsb2NhdGUgdGhlIHNjcmF0
Y2ggbWFzawo+ID4+IGR5bmFtaWNhbGx5IChhdCBsZWFzdCBpZiBjYWxsZXIgY29udGV4dCBkb2Vz
bid0IGFsbG93IHVzZSBvZiB0aGUKPiA+PiBnZW5lcmljIG9uZSksIGFuZCBzaW1wbHkgcmVmcmFp
biBmcm9tIGNvYWxlc2NpbmcgSVBJcyBpZiB0aGlzCj4gPj4gYWxsb2NhdGlvbnMgZmFpbHMuCj4g
PiAKPiA+IEhtLCBpc24ndCB0aGlzIGdvaW5nIHRvIGJlIHF1aXRlIGV4cGVuc2l2ZSwgYW5kIGhl
bmNlIHJlbmRlciB0aGUKPiA+IGJlbmVmaXQgb2YgdXNpbmcgdGhlIHNob3J0aGFuZCBtb290Pwo+
IAo+IERlcGVuZHMgb24gaG93IG1hbnkgQ1BVcyB0aGVyZSBhcmUsIGkuZS4gaG93IGxvbmcgdGhl
IGxvb3Agb3RoZXJ3aXNlCj4gd291bGQgYmUuIFdoZW4geG1hbGxvYygpIGRvZXNuJ3QgbmVlZCB0
byB0dXJuIHRvIHRoZSBwYWdlIGFsbG9jYXRvciwKPiBJIHRoaW5rIGl0IHdvbid0IGJlIG92ZXJs
eSBzbG93LiBBbm90aGVyIG9wdGlvbiB3b3VsZCBiZSB0byBhdm9pZAo+IGNvYWxlc2NpbmcgaW4g
YSBzbGlnaHRseSBkaWZmZXJlbnQgd2F5ICh3aXRob3V0IGhhdmluZyB0byBmaWRkbGUKPiB3aXRo
IHRoZSBzY3JhdGNoIG1hc2spIHdoZW4gY2FsbGVkIGluIGludGVycnVwdCBjb250ZXh0LgoKV2hh
dCBhYm91dCBwcmV2ZW50aW5nIHRoZSBtYXNrIHVzYWdlIHdoZW4gaW4gbm1pIGNvbnRleHQ/CgpJ
IGNvdWxkIGludHJvZHVjZSBzb21ldGhpbmcgbGlrZSBpbl9ubWkgYW5kIGp1c3QgYXZvaWQgdGhl
IHNjcmF0Y2gKbWFzayB1c2FnZSBpbiB0aGF0IGNhc2UgKGFuZCB0aGUgc2hvcnRoYW5kKS4KClRo
YW5rcywgUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
