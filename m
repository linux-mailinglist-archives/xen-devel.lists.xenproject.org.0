Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B9CE4EDDD
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jun 2019 19:32:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1heNMz-0008Vn-GQ; Fri, 21 Jun 2019 17:30:37 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=GdIo=UU=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1heNMx-0008Vi-4Y
 for xen-devel@lists.xenproject.org; Fri, 21 Jun 2019 17:30:35 +0000
X-Inumbo-ID: 45f5d54e-944a-11e9-8980-bc764e045a96
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 45f5d54e-944a-11e9-8980-bc764e045a96;
 Fri, 21 Jun 2019 17:30:33 +0000 (UTC)
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
IronPort-SDR: 3VliU+2DB7V6Vpc47tYTCblr0ci/ISvcLHA3uIcJy7tb1CX4DN3UM+RuvIpgZjmi50dnyGI/23
 cPzI20hctij7g5JEEiANnNCy1QBRdmbdTOrHWiTm9etKOkGJNucv1v1hb1TyDR3hvkbpyw/uHI
 5Uy9A9nyJbz9iohvOLPeCaQCf3ns8u9Xez6/nIiFpxGJB+2YI6T5OD4Owj85VS3MuwdVqqWjBi
 Dgg+lxoLkUmAqIenHzivsXltPKOUmT36V8lLQ4eFNMVnCrbaZdSIcfMbVmcMVxc/0DQRG1ums0
 lZA=
X-SBRS: 2.7
X-MesageID: 2063071
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,401,1557201600"; 
   d="scan'208";a="2063071"
Date: Fri, 21 Jun 2019 19:30:25 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20190621173025.oaimpqd7yzx4sraw@MacBook-Air-de-Roger.local>
References: <20190621163802.29808-1-roger.pau@citrix.com>
 <20190621163802.29808-3-roger.pau@citrix.com>
 <bcd1e204-89ab-6337-e432-6ecd8bb5e53c@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bcd1e204-89ab-6337-e432-6ecd8bb5e53c@citrix.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v2 2/3] x86: check for multiboot{1,
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
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBKdW4gMjEsIDIwMTkgYXQgMDY6MjA6NTRQTSArMDEwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBPbiAyMS8wNi8yMDE5IDE3OjM4LCBSb2dlciBQYXUgTW9ubmUgd3JvdGU6Cj4gPiBB
ZnRlciBidWlsZGluZyB0aGUgaHlwZXJ2aXNvciBiaW5hcnkuIE5vdGUgdGhhdCB0aGUgY2hlY2sg
aXMgcGVyZm9ybWVkCj4gPiBieSBzZWFyY2hpbmcgZm9yIHRoZSBtYWdpYyBoZWFkZXIgdmFsdWUg
YXQgdGhlIHN0YXJ0IG9mIHRoZSBiaW5hcnkuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogUm9nZXIg
UGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4gPiAtLS0KPiA+IENjOiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4gPiBDYzogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNv
b3BlcjNAY2l0cml4LmNvbT4KPiA+IENjOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgo+IAo+IFdoaWxl
IHRoZSBjaGFuZ2UgaXMgb2ssIHdvbid0IHRoaXMgYnJlYWsgdGhlIGdpdGxhYiBDSSB3aGljaCBp
cwo+IGN1cnJlbnRseSB1c2luZyB0aGUgbGx2bS04IHRvb2xjaGFpbj8KClllcywgdGhhdCdzIHJp
Z2h0LiBJdCdzIGFsc28gZ29pbmcgdG8gYnJlYWsgdGhlIEZyZWVCU0QgWGVuIGJ1aWxkIG9uCm9z
c3Rlc3QgKHRoaXMgaXMgbm90IHBhcnQgb2YgdGhlIHhlbi0gZmxpZ2h0cyBob3dldmVyKS4KCkFU
TSB0aGUgZ2l0bGFiIGxsdm0tOCBidWlsZHMgZG9uJ3Qgc2VlbSB0byBjb3JyZWN0bHkgcGljayB1
cCB0aGUgTEQKZW52IHZhcmlhYmxlLCBzbyB0aGV5IHN0aWxsIHBhc3Mgd2l0aCB0aGlzIGNoYW5n
ZSBhcHBsaWVkLgoKPiA+IC0tLQo+ID4gQ2hhbmdlcyBzaW5jZSB2MToKPiA+ICAtIFVzZSBhbiBp
bnRlcm1lZGlhdGUgZmlsZSB0byBwZXJmb3JtIHRoZSBoZWFkZXIgY2hlY2tzLgo+ID4gLS0tCj4g
PiAgeGVuL2FyY2gveDg2L01ha2VmaWxlIHwgNiArKysrKy0KPiA+ICAxIGZpbGUgY2hhbmdlZCwg
NSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL3hlbi9h
cmNoL3g4Ni9NYWtlZmlsZSBiL3hlbi9hcmNoL3g4Ni9NYWtlZmlsZQo+ID4gaW5kZXggOGE4ZDhm
MDYwZi4uNWM5MDhjNDllMyAxMDA2NDQKPiA+IC0tLSBhL3hlbi9hcmNoL3g4Ni9NYWtlZmlsZQo+
ID4gKysrIGIveGVuL2FyY2gveDg2L01ha2VmaWxlCj4gPiBAQCAtMTAwLDggKzEwMCwxMiBAQCBz
eW1zLXdhcm4tZHVwLXkgOj0gLS13YXJuLWR1cAo+ID4gIHN5bXMtd2Fybi1kdXAtJChDT05GSUdf
U1VQUFJFU1NfRFVQTElDQVRFX1NZTUJPTF9XQVJOSU5HUykgOj0KPiA+ICAKPiA+ICAkKFRBUkdF
VCk6ICQoVEFSR0VUKS1zeW1zICQoZWZpLXkpIGJvb3QvbWtlbGYzMgo+ID4gLQkuL2Jvb3QvbWtl
bGYzMiAkKG5vdGVzX3BoZHJzKSAkKFRBUkdFVCktc3ltcyAkKFRBUkdFVCkgJChYRU5fSU1HX09G
RlNFVCkgXAo+ID4gKwkuL2Jvb3QvbWtlbGYzMiAkKG5vdGVzX3BoZHJzKSAkKFRBUkdFVCktc3lt
cyAkKEBEKS8uJChARikgJChYRU5fSU1HX09GRlNFVCkgXAo+ID4gIAkgICAgICAgICAgICAgICBg
JChOTSkgJChUQVJHRVQpLXN5bXMgfCBzZWQgLW5lICdzL15cKFteIF0qXCkgLiBfXzJNX3J3ZGF0
YV9lbmQkJC8weFwxL3AnYAo+ID4gKwkjIENoZWNrIGZvciBtdWx0aWJvb3R7MSwyfSBoZWFkZXJz
Cj4gPiArCW9kIC10IHg0IC1OIDgxOTIgJChARCkvLiQoQEYpIHwgZ3JlcCAxYmFkYjAwMiA+IC9k
ZXYvbnVsbAo+ID4gKwlvZCAtdCB4NCAtTiAzMjc2OCAkKEBEKS8uJChARikgfCBncmVwIGU4NTI1
MGQ2ID4gL2Rldi9udWxsCj4gPiArCW12ICQoQEQpLy4kKEBGKSAkKFRBUkdFVCkKPiAKPiBUaGlz
IG1pZ2h0IGJlIGEgYml0IGNsZWFuZXIgdG8gcmVhZCBhcwo+IAo+ICQoVEFSR0VUKTogdG1wPSQo
QEQpLy4kKEBGKQo+ICQoVEFSR0VUKTogJChUQVJHRVQpLXN5bXMgJChlZmkteSkgYm9vdC9ta2Vs
ZjMyCj4gCj4gcmF0aGVyIHRoYW4gaGF2aW5nICQoQEQpLy4kKEBGKSBzcHJlYWQgdGhyb3VnaG91
dCB0aGUgcnVsZS4KCkFjaywgVGhhbmtzIQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
