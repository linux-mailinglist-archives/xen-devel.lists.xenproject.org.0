Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D236EB1B96
	for <lists+xen-devel@lfdr.de>; Fri, 13 Sep 2019 12:36:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8itg-0007fi-AW; Fri, 13 Sep 2019 10:33:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8xMu=XI=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1i8ite-0007fd-U6
 for xen-devel@lists.xenproject.org; Fri, 13 Sep 2019 10:33:46 +0000
X-Inumbo-ID: f6b5199e-d611-11e9-95aa-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f6b5199e-d611-11e9-95aa-12813bfff9fa;
 Fri, 13 Sep 2019 10:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568370826;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=R7OQqUKEYhPH9LpQtaY1Q5MVtXRNjHpplPFlMBXTKX8=;
 b=cylwyDZaH2vyrT+nv9H0wMkK6zqHkHwv9EpXnCtSFYmcplQVpvgacN+R
 ZvU0uJF1koUyKt1Z8zmyvIbUiu0L4REhwBTMZsuakuYao1B7GliwhCKYG
 HAGLGBorJIeybDjsS/vVTy1E4OMIGyxWF9BsI30Aw7LxHvxOsv0hrbtCU Q=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: DmcAN4k2GC548qc4PVmDAWEB29tr8eAb1dxvb5/nQtGFgsjq+K2PLtxLIUU0GrHoN83NLA6txY
 bw9lfP3mE+iCzAnXW0IPRpRKGPpYFs10Q8RYjbRq72gwCkNF4TcfVKlkwsHgMfi443sKdp/Pkt
 FoxaUC1Vyx0qNrvHiTZ14vqNyn3pbYaP1Xy4VSS9ICV1G1B0/nPA5cCSmDkwSTt2il3sR7Zh/i
 J+4LxLvYLFCT+hfpPBMFoeT3Ess9I7z2mTxg6w67WaqB0WykzoftlVKJybBZk0idA/ROVvtl8J
 Iag=
X-SBRS: 2.7
X-MesageID: 5582438
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,500,1559534400"; 
   d="scan'208";a="5582438"
Date: Fri, 13 Sep 2019 12:33:35 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Joe Jin <joe.jin@oracle.com>
Message-ID: <20190913103335.ijzx6tuy4iwb5dt5@Air-de-Roger>
References: <70457d4e-068f-0160-532b-e00dd295b3b1@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <70457d4e-068f-0160-532b-e00dd295b3b1@oracle.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH RFC] pass-through: sync pir to irr after
 msix vector been updated
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
Cc: xen-devel@lists.xenproject.org, Boris
 Ostrovsky <boris.ostrovsky@oracle.com>,
 Joao Martins <joao.m.martins@oracle.com>, Jan Beulich <jbeulich@suse.com>,
 "DONGLI.ZHANG" <dongli.zhang@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBTZXAgMTIsIDIwMTkgYXQgMTE6MDM6MTRBTSAtMDcwMCwgSm9lIEppbiB3cm90ZToK
PiBXaXRoIGJlbG93IHRlc3RjYXNlLCBndWVzdCBrZXJuZWwgcmVwb3J0ZWQgIk5vIGlycSBoYW5k
bGVyIGZvciB2ZWN0b3IiOgo+ICAgMSkuIFBhc3N0aHJvdWdoIG1seCBpYiBWRiB0byAyIHB2aHZt
IGd1ZXN0cy4KPiAgIDIpLiBTdGFydCByZHMtc3RyZXNzIGJldHdlZW4gMiBndWVzdHMuCj4gICAz
KS4gU2NhbGUgZG93biAyIGd1ZXN0cyB2Y3B1IGZyb20gMzIgdG8gNiBhdCB0aGUgc2FtZSB0aW1l
Lgo+IAo+IFJlcGVhdCBhYm92ZSB0ZXN0IHNldmVyYWwgaXRlcmF0aW9uLCBndWVzdCBrZXJuZWwg
cmVwb3J0ZWQgIk5vIGlycSBoYW5kbGVyCj4gZm9yIHZlY3RvciIsIGFuZCBJQiB0cmFmZmljIGRv
d25lZCB0byB6ZXJvIHdoaWNoIGNhdXNlZCBieSBpbnRlcnJ1cHQgbG9zdC4KPiAKPiBXaGVuIHZj
cHUgb2ZmbGluZSwga2VybmVsIGRpc2FibGVkIGxvY2FsIElSUSwgbWlncmF0ZSBJUlEgdG8gb3Ro
ZXIgY3B1LAo+IHVwZGF0ZSBNU0ktWCB0YWJsZSwgZW5hYmxlIElSUS4gSWYgYW55IG5ldyBpbnRl
cnJ1cHQgYXJyaXZlZCBhZnRlcgo+IGxvY2FsIElSUSBkaXNhYmxlZCBhbHNvIGJlZm9yZSBNU0kt
WCB0YWJsZSBiZWVuIHVwZGF0ZWQsIGludGVycnVwdCBzdGlsbCAKPiB1c2VkIG9sZCB2ZWN0b3Ig
YW5kIGRlc3QgY3B1IGluZm8sIGFuZCB3aGVuIGxvY2FsIElSUSBlbmFibGVkIGFnYWluLCAKPiBp
bnRlcnJ1cHQgYmVlbiBzZW50IHRvIHdyb25nIGNwdSBhbmQgdmVjdG9yLgoKWWVzLCBidXQgdGhh
dCdzIHNvbWV0aGluZyBMaW51eCBzaG91bGtkIGJlIGFibGUgdG8gaGFuZGxlLCBhY2NvcmRpbmcK
dG8geW91ciBkZXNjcmlwdGlvbiB0aGVyZSdzIGEgd2luZG93IHdoZXJlIGludGVycnVwdHMgY2Fu
IGJlIGRlbGl2ZXJlZAp0byB0aGUgb2xkIENQVSwgYnV0IHRoYXQncyBzb21ldGhpbmcgZXhwZWN0
ZWQuCgo+IAo+IExvb2tzIHN5bmMgUElSIHRvIElSUiBhZnRlciBNU0ktWCBiZWVuIHVwZGF0ZWQg
aXMgaGVscCBmb3IgdGhpcyBpc3N1ZS4KCkFGQUlDVCB0aGUgc3luYyB0aGF0IHlvdSBkbyBpcyBz
dGlsbCB1c2luZyB0aGUgb2xkIHZjcHUgaWQsIGFzCnBpcnFfZHBjaS0+Z21zaS5kZXN0X3ZjcHVf
aWQgZ2V0cyB1cGRhdGVkIGEgbGl0dGxlIGJpdCBiZWxvdy4gSSdtCnVuc3VyZSBhYm91dCB3aHkg
ZG9lcyB0aGlzIGhlbHAsIEkgd291bGQgZXhwZWN0IHRoZSBzeW5jIGJldHdlZW4gcGlyCmFuZCBp
cnIgdG8gaGFwcGVuIGFueXdheSwgYW5kIGhlbmNlIEknbSBub3Qgc3VyZSB3aHkgaXMgdGhpcyBo
ZWxwaW5nLgoKTWF5YmUgeW91IG5lZWQgdG8gZm9yY2Ugc3VjaCBzeW5jaW5nIHNvIHRoYXQgbm8g
c3RhbGUgcGlyIHZlY3RvciBnZXRzCmluamVjdGVkIGxhdGVyIG9uIHdoZW4gdGhlIGd1ZXN0IGFz
c3VtZXMgdGhlIG5ldyBNU0kgYWRkcmVzcyBoYXMgYmVlbgpzdWNjZXNzZnVsbHkgd3JpdHRlbiwg
YW5kIG5vIG1vcmUgaW50ZXJydXB0cyBzaG91bGQgYXBwZWFyIG9uIHRoZQpwcmV2aW91cyB2Q1BV
PwoKUElSIHRvIElSUiBzeW5jIGhhcHBlbnMgb24gdm1lbnRyeSwgc28gaWYgdGhlIG9sZCB2Q1BV
IGRvZXNuJ3QgdGFrZSBhCnZtZW50cnkgYW5kIGRyYWlucyBhbnkgcGVuZGluZyBwaXIgdmVjdG9y
cyBtb3JlIG9yIGxlc3MgYXQgdGhlIHNhbWUKdGltZSBhcyB0aGUgbmV3IE1TSSBhZGRyZXNzIGdl
dHMgd3JpdHRlbiBpdCdzIHBvc3NpYmxlIHRoYXQgc3VjaCBwaXIKdmVjdG9ycyBnZXQgaW5qZWN0
ZWQgd2F5IHBhc3QgdGhlIHVwZGF0ZSBvZiB0aGUgTVNJIGZpZWxkcy4KCj4gQlRXLCBJIGNvdWxk
IG5vdCByZXByb2R1Y2VkIHRoaXMgaXNzdWUgaWYgSSBkaXNhYmxlZCBhcGljdi4KCklJUkMgTGlu
dXggd29uJ3Qgcm91dGUgaW50ZXJydXB0cyBmcm9tIG5vbi1wdiBkZXZpY2VzIG92ZXIgZXZlbnQK
Y2hhbm5lbHMgd2hlbiBhcGljdiBpcyBpbiB1c2UuCgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
