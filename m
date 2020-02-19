Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 778E8164544
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2020 14:25:14 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4PJ6-0006Fy-KB; Wed, 19 Feb 2020 13:22:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jH6y=4H=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j4PJ4-0006Ft-Cr
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2020 13:22:26 +0000
X-Inumbo-ID: de14192c-531a-11ea-8362-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id de14192c-531a-11ea-8362-12813bfff9fa;
 Wed, 19 Feb 2020 13:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582118546;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=eX/8CcQLBtAl1Egqbst7U/TR2m0XA0xHh0uVxSiVyW8=;
 b=TZJk8NsG+Ni6sIOKMZZWNa+Z20rPiNR4BUdBhZYkeOI0socV3DjqGf12
 agLBmXYiPPeBCuFSq99RAEACqxeStzsme7DfcJNK2m/oZI3aLxyPWBsVi
 2xKQdQhzckMGWAwPsp/VADIomFMkC9foVPcTS97BQpb2gO2LKeqsbVxkn o=;
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
IronPort-SDR: mvCQdyUzIMFoQozn3lLQYsOx3XlURZioFXGWIBhXa9wFkWmgBnm9iXFLTgTDbKsMI3vTSG33oZ
 dScZZZSw8AX57P2TywOVvoGyc5nVeoHzsFPvJGn++qkpGudp67stYj6HM++WLuF3Un3cKkaxiS
 /gB86Tm6cxJhABaSXB+86n5rrdsGQvn7S7C7qZzA/F/YcFjyEpIhL0mn17F/OvPqgf2lU1EDcg
 wlOlhIJVSF1DAw5Tij6Z18o7KdDMbDA2ZQAo7R1NkHodSqo4l+CUulrEAndfzzA/5rPEyye8hY
 ejI=
X-SBRS: 2.7
X-MesageID: 12863396
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,459,1574139600"; d="scan'208";a="12863396"
Date: Wed, 19 Feb 2020 14:22:17 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200219132217.GB4679@Air-de-Roger>
References: <20200213113237.58795-1-roger.pau@citrix.com>
 <20200213113237.58795-3-roger.pau@citrix.com>
 <1b278189-c96a-796a-1733-a3584809227f@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1b278189-c96a-796a-1733-a3584809227f@suse.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH 2/2] smp: convert cpu_hotplug_begin into a
 blocking lock acquisition
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

T24gV2VkLCBGZWIgMTksIDIwMjAgYXQgMDE6NTk6NTFQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMTMuMDIuMjAyMCAxMjozMiwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+ID4gRG9u
J3QgYWxsb3cgY3B1X2hvdHBsdWdfYmVnaW4gdG8gZmFpbCBieSBjb252ZXJ0aW5nIHRoZSB0cnls
b2NrIGludG8gYQo+ID4gYmxvY2tpbmcgbG9jayBhY3F1aXNpdGlvbi4gV3JpdGUgdXNlcnMgb2Yg
dGhlIGNwdV9hZGRfcmVtb3ZlX2xvY2sgYXJlCj4gPiBsaW1pdGVkIHRvIENQVSBwbHVnL3VucGx1
ZyBvcGVyYXRpb25zLCBhbmQgY2Fubm90IGRlYWRsb2NrIGJldHdlZW4KPiA+IHRoZW1zZWx2ZXMg
b3Igb3RoZXIgdXNlcnMgdGFraW5nIHRoZSBsb2NrIGluIHJlYWQgbW9kZSBhcwo+ID4gY3B1X2Fk
ZF9yZW1vdmVfbG9jayBpcyBhbHdheXMgbG9ja2VkIHdpdGggaW50ZXJydXB0cyBlbmFibGVkLiBU
aGVyZQo+ID4gYXJlIGFsc28gbm8gb3RoZXIgbG9ja3MgdGFrZW4gZHVyaW5nIHRoZSBwbHVnL3Vu
cGx1ZyBvcGVyYXRpb25zLgo+IAo+IEkgZG9uJ3QgdGhpbmsgdGhlIGdvYWwgd2FzIGRlYWRsb2Nr
IGF2b2lkYW5jZSwgYnV0IHJhdGhlciBsaW1pdGluZwo+IG9mIHRoZSB0aW1lIHNwZW50IHNwaW5u
aW5nIHdoaWxlIHRyeWluZyB0byBhY3F1aXJlIHRoZSBsb2NrLCBpbgo+IGZhdm9yIG9mIGhhdmlu
ZyB0aGUgY2FsbGVyIHJldHJ5LgoKTm93IHRoYXQgdGhlIGNvbnRlbnRpb24gYmV0d2VlbiByZWFk
LW9ubHkgdXNlcnMgaXMgcmVkdWNlZCBhcyB0aG9zZQpjYW4gdGFrZSB0aGUgbG9jayBpbiBwYXJh
bGxlbCBJIHRoaW5rIGl0J3Mgc2FmZSB0byBzd2l0Y2ggd3JpdGVycyB0bwpibG9ja2luZyBtb2Rl
LgoKVGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
