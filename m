Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D08B0164767
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2020 15:48:27 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4Qbu-0006eF-Bp; Wed, 19 Feb 2020 14:45:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jH6y=4H=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j4Qbt-0006eA-6H
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2020 14:45:57 +0000
X-Inumbo-ID: 88bb4b60-5326-11ea-bc8e-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 88bb4b60-5326-11ea-bc8e-bc764e2007e4;
 Wed, 19 Feb 2020 14:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582123557;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=8GUx5XAFkT5948FktNONLz1NdHSaqTbJWL0O63WUT6w=;
 b=YsL/oGBybpErWdPgMgPXaCnQWNQ6dhCeq4HaMDCe7qD5Vo24ZEgaSfY8
 WnYITJGQIsr0HXsayS9JWxbODzMhhAoqIXbQJF5WKJ7Rtn1NVdztlQsR+
 iMTOnfiCJcFGuT1vtmTmmjjkecwZymN7AwVxNLjhKrl6hlWqfTZq4L8dW A=;
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
IronPort-SDR: 1UyRQ+zQUzlVg+3kOR6wVB4xn2t+eMmIy+6mZbyMZOEVOoLiPfykWQrhZVZtfxLD1SraMRmgxu
 8zT96w3lWQWnPEH2TV1halwbJBjaWmf/o2FoBE7f0HlQe8vBKw/SC8OzhjK3/L0rY0L8MpNF9s
 EkYpHDGxanvUwhOA1jIYwEPTUUAMGAScTrTggVUzwAMb+I2I1aY0qMuF/y0FnKIn110vkJuaZZ
 eaZTtXsthpD4BHbH0ZHYhZbc4I0IiTPND+VCrB8roQfDcqtTUmq1OvD35acGSyFdGAkaZ0pmcd
 Aos=
X-SBRS: 2.7
X-MesageID: 12868975
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,459,1574139600"; d="scan'208";a="12868975"
Date: Wed, 19 Feb 2020 15:45:49 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200219144549.GD4679@Air-de-Roger>
References: <20200213113237.58795-1-roger.pau@citrix.com>
 <20200213113237.58795-3-roger.pau@citrix.com>
 <1b278189-c96a-796a-1733-a3584809227f@suse.com>
 <20200219132217.GB4679@Air-de-Roger>
 <960b4da8-4522-082a-42b9-ab870698a5ec@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <960b4da8-4522-082a-42b9-ab870698a5ec@suse.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
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

T24gV2VkLCBGZWIgMTksIDIwMjAgYXQgMDI6NDQ6MTJQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMTkuMDIuMjAyMCAxNDoyMiwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiA+IE9u
IFdlZCwgRmViIDE5LCAyMDIwIGF0IDAxOjU5OjUxUE0gKzAxMDAsIEphbiBCZXVsaWNoIHdyb3Rl
Ogo+ID4+IE9uIDEzLjAyLjIwMjAgMTI6MzIsIFJvZ2VyIFBhdSBNb25uZSB3cm90ZToKPiA+Pj4g
RG9uJ3QgYWxsb3cgY3B1X2hvdHBsdWdfYmVnaW4gdG8gZmFpbCBieSBjb252ZXJ0aW5nIHRoZSB0
cnlsb2NrIGludG8gYQo+ID4+PiBibG9ja2luZyBsb2NrIGFjcXVpc2l0aW9uLiBXcml0ZSB1c2Vy
cyBvZiB0aGUgY3B1X2FkZF9yZW1vdmVfbG9jayBhcmUKPiA+Pj4gbGltaXRlZCB0byBDUFUgcGx1
Zy91bnBsdWcgb3BlcmF0aW9ucywgYW5kIGNhbm5vdCBkZWFkbG9jayBiZXR3ZWVuCj4gPj4+IHRo
ZW1zZWx2ZXMgb3Igb3RoZXIgdXNlcnMgdGFraW5nIHRoZSBsb2NrIGluIHJlYWQgbW9kZSBhcwo+
ID4+PiBjcHVfYWRkX3JlbW92ZV9sb2NrIGlzIGFsd2F5cyBsb2NrZWQgd2l0aCBpbnRlcnJ1cHRz
IGVuYWJsZWQuIFRoZXJlCj4gPj4+IGFyZSBhbHNvIG5vIG90aGVyIGxvY2tzIHRha2VuIGR1cmlu
ZyB0aGUgcGx1Zy91bnBsdWcgb3BlcmF0aW9ucy4KPiA+Pgo+ID4+IEkgZG9uJ3QgdGhpbmsgdGhl
IGdvYWwgd2FzIGRlYWRsb2NrIGF2b2lkYW5jZSwgYnV0IHJhdGhlciBsaW1pdGluZwo+ID4+IG9m
IHRoZSB0aW1lIHNwZW50IHNwaW5uaW5nIHdoaWxlIHRyeWluZyB0byBhY3F1aXJlIHRoZSBsb2Nr
LCBpbgo+ID4+IGZhdm9yIG9mIGhhdmluZyB0aGUgY2FsbGVyIHJldHJ5Lgo+ID4gCj4gPiBOb3cg
dGhhdCB0aGUgY29udGVudGlvbiBiZXR3ZWVuIHJlYWQtb25seSB1c2VycyBpcyByZWR1Y2VkIGFz
IHRob3NlCj4gPiBjYW4gdGFrZSB0aGUgbG9jayBpbiBwYXJhbGxlbCBJIHRoaW5rIGl0J3Mgc2Fm
ZSB0byBzd2l0Y2ggd3JpdGVycyB0bwo+ID4gYmxvY2tpbmcgbW9kZS4KPiAKPiBJJ2QgYWdyZWUg
aWYgd3JpdGVycyBjb3VsZG4ndCBiZSBzdGFydmVkIGJ5IChtYW55KSByZWFkZXJzLgoKQUZBSUNU
IGZyb20gdGhlIHJ3IGxvY2sgaW1wbGVtZW50YXRpb24gcmVhZGVycyB3b24ndCBiZSBhYmxlIHRv
IHBpY2sKdGhlIGxvY2sgYXMgc29vbiBhcyB0aGVyZSdzIGEgd3JpdGVyIHdhaXRpbmcsIHdoaWNo
IHNob3VsZCBhdm9pZCB0aGlzCnN0YXJ2YXRpb24/CgpZb3Ugc3RpbGwgbmVlZCB0byB3YWl0IGZv
ciBjdXJyZW50IHJlYWRlcnMgdG8gZHJvcCB0aGUgbG9jaywgYnV0IG5vCm5ldyByZWFkZXJzIHdv
dWxkIGJlIGFibGUgdG8gbG9jayBpdCwgd2hpY2ggSSB0aGluayBzaG91bGQgZ2l2YmUgdXMKZW5v
dWdoIGZhaXJuZXNzLiBPVE9IIHdoZW4gdXNpbmcgX3RyeWxvY2sgbmV3IHJlYWRlcnMgY2FuIHN0
aWxsIHBpY2sKdGhlIGxvY2sgaW4gcmVhZCBtb2RlLCBhbmQgaGVuY2UgSSB0aGluayB1c2luZyBi
bG9ja2luZyBtb2RlIGZvcgp3cml0ZXJzIGlzIGFjdHVhbGx5IGJldHRlciwgYXMgeW91IGNhbiBh
c3N1cmUgdGhhdCByZWFkZXJzIHdvbid0IGJlCmFibGUgdG8gc3RhcnZlIHdyaXRlcnMuCgpUaGFu
a3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
