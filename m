Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EFC44BBE3
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jun 2019 16:42:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hdblG-0006X5-RM; Wed, 19 Jun 2019 14:40:30 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=XeE9=US=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hdblF-0006Wz-TS
 for xen-devel@lists.xenproject.org; Wed, 19 Jun 2019 14:40:29 +0000
X-Inumbo-ID: 2e58db05-92a0-11e9-8980-bc764e045a96
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 2e58db05-92a0-11e9-8980-bc764e045a96;
 Wed, 19 Jun 2019 14:40:28 +0000 (UTC)
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Yd2jccaywLzRUe9SwB+R0D3/6yugpu02r3/yCFjr+EMVd6C03loFV655KPQtMrBsozUmCra5uH
 l249P1OHGTGrBNEXQyBJZIJMCqbWcmieUsDc4TaahQaTwryUipItAB+86dcpWZ94VDeylp+Il4
 bInPcLoGJBaLKERTchf8EQd1Lmo+4kKi7tYl/QTcHUa2qoce89Y0YgTRXeMk5s5RTa9Z0Gj+wk
 KJI9BS+nWUi9TMC3M5swlPZmEtTtG0jfbFIC/egrtXDNDtnYhj25a65ouD77aSmHf9n7P8j2DH
 6ZA=
X-SBRS: 2.7
X-MesageID: 1947918
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,392,1557201600"; 
   d="scan'208";a="1947918"
Date: Wed, 19 Jun 2019 16:40:20 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <JBeulich@suse.com>
Message-ID: <20190619144020.z6ibrkicmtoo3nl3@MacBook-Air-de-Roger.local>
References: <20190619110250.18881-1-roger.pau@citrix.com>
 <20190619110250.18881-5-roger.pau@citrix.com>
 <5D0A33E40200007800239AE3@prv1-mh.provo.novell.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5D0A33E40200007800239AE3@prv1-mh.provo.novell.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH 4/4] x86: check for multiboot{1,
 2} header presence
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, WeiLiu <wl@xen.org>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBKdW4gMTksIDIwMTkgYXQgMDc6MDg6NTJBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDE5LjA2LjE5IGF0IDEzOjAyLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdy
b3RlOgo+ID4gQWZ0ZXIgYnVpbGRpbmcgdGhlIGh5cGVydmlzb3IgYmluYXJ5LiBOb3RlIHRoYXQg
dGhlIGNoZWNrIGlzIHBlcmZvcm1lZAo+ID4gYnkgc2VhcmNoaW5nIGZvciB0aGUgbWFnaWMgaGVh
ZGVyIHZhbHVlIGF0IHRoZSBzdGFydCBvZiB0aGUgYmluYXJ5Lgo+ID4gCj4gPiBTaWduZWQtb2Zm
LWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KPiA+IC0tLQo+ID4g
Q2M6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiA+IENjOiBBbmRyZXcgQ29vcGVy
IDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgo+ID4gQ2M6IFdlaSBMaXUgPHdsQHhlbi5vcmc+
Cj4gPiAtLS0KPiA+ICB4ZW4vYXJjaC94ODYvTWFrZWZpbGUgfCAzICsrKwo+ID4gIDEgZmlsZSBj
aGFuZ2VkLCAzIGluc2VydGlvbnMoKykKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4
Ni9NYWtlZmlsZSBiL3hlbi9hcmNoL3g4Ni9NYWtlZmlsZQo+ID4gaW5kZXggOGE4ZDhmMDYwZi4u
OWJiM2JmNmU2YyAxMDA2NDQKPiA+IC0tLSBhL3hlbi9hcmNoL3g4Ni9NYWtlZmlsZQo+ID4gKysr
IGIveGVuL2FyY2gveDg2L01ha2VmaWxlCj4gPiBAQCAtMTAyLDYgKzEwMiw5IEBAIAo+ID4gc3lt
cy13YXJuLWR1cC0kKENPTkZJR19TVVBQUkVTU19EVVBMSUNBVEVfU1lNQk9MX1dBUk5JTkdTKSA6
PQo+ID4gICQoVEFSR0VUKTogJChUQVJHRVQpLXN5bXMgJChlZmkteSkgYm9vdC9ta2VsZjMyCj4g
PiAgCS4vYm9vdC9ta2VsZjMyICQobm90ZXNfcGhkcnMpICQoVEFSR0VUKS1zeW1zICQoVEFSR0VU
KSAkKFhFTl9JTUdfT0ZGU0VUKSBcCj4gPiAgCSAgICAgICAgICAgICAgIGAkKE5NKSAkKFRBUkdF
VCktc3ltcyB8IHNlZCAtbmUgJ3MvXlwoW14gXSpcKSAuIF9fMk1fcndkYXRhX2VuZCQkLzB4XDEv
cCdgCj4gPiArCSMgQ2hlY2sgZm9yIG11bHRpYm9vdHsxLDJ9IGhlYWRlcnMKPiA+ICsJb2QgLXQg
eDQgLU4gODE5MiAkKFRBUkdFVCkgfCBncmVwIDFiYWRiMDAyID4gL2Rldi9udWxsCj4gPiArCW9k
IC10IHg0IC1OIDMyNzY4ICQoVEFSR0VUKSB8IGdyZXAgZTg1MjUwZDYgPiAvZGV2L251bGwKPiAK
PiBXaGF0J3MgdGhlIGJlaGF2aW9yIHdoZW4gYSBzaWduYXR1cmUgaXMgX25vdCBfIGZvdW5kPyBX
aWxsCj4gJChUQVJHRVQpIGdldCBkZWxldGVkIChieSBtYWtlKT8gSSBkb24ndCB0aGluayBpdCB3
b3VsZCAoYXMgd2UKPiBkb24ndCBzcGVjaWZpYyAuREVMRVRFX09OX0VSUk9SIGFueXdoZXJlKSwg
c28gYSBzdWJzZXF1ZW50Cj4gcmVidWlsZCBtYXkgbm90IGV2ZW4gZXhlY3V0ZSB0aGlzIHJ1bGUs
IGFuZCBoZW5jZSBtYXkgbG9vayB0byBiZQo+IHN1Y2Nlc3NmdWwgZGVzcGl0ZSBpdCBub3QgYWN0
dWFsbHkgaGF2aW5nIGJlZW4uCgpPaCwgcmlnaHQuIEl0IHNob3VsZCBiZToKCm9kIC10IHg0IC1O
IDgxOTIgJChUQVJHRVQpIHwgZ3JlcCAxYmFkYjAwMiA+IC9kZXYvbnVsbCB8fCAocm0gLXJmICQo
VEFSR0VUKTsgZXhpdCAxKQpvZCAtdCB4NCAtTiAzMjc2OCAkKFRBUkdFVCkgfCBncmVwIGU4NTI1
MGQ2ID4gL2Rldi9udWxsIHx8IChybSAtcmYgJChUQVJHRVQpOyBleGl0IDEpCgpXb3VsZCB5b3Ug
YmUgT0sgd2l0aCB0aGUgYWJvdmUgcnVuZXM/CgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
