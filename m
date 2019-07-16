Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D6706A4B9
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jul 2019 11:17:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hnJW3-0001dV-HQ; Tue, 16 Jul 2019 09:12:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DxGA=VN=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hnJW1-0001dQ-9k
 for xen-devel@lists.xenproject.org; Tue, 16 Jul 2019 09:12:53 +0000
X-Inumbo-ID: e181a2ae-a7a9-11e9-bea4-3bf89891ed25
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e181a2ae-a7a9-11e9-bea4-3bf89891ed25;
 Tue, 16 Jul 2019 09:12:49 +0000 (UTC)
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
IronPort-SDR: 0jD5ExqviAlZqC69Be+YrdxL1o54xrNS0MY69y+VwSJGn5FOR8VKretiiKK9jiw8AInUByGkjG
 defOmUsO5zDsPKrpO4hgAcSjvBMF2Eiwj/p66H5TmnWr7dyZ85/QQLllvpk48TCpjbFQt0XpI8
 df+C4nPzCAUIgJtUUXuV6sNCROTVopDLKnoYBeLcmhkB8Zy4syjaJUkNqYvIt6y/N5PsSlXljD
 NoxpxtiGOqezQtR8NjFDA7Njj16NfL0mpivI/vfKTwvJKe5hhBz46rYyF/0LD3hS78R2L90iCM
 aiw=
X-SBRS: 2.7
X-MesageID: 3025757
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,497,1557201600"; 
   d="scan'208";a="3025757"
Date: Tue, 16 Jul 2019 11:12:37 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <JBeulich@suse.com>
Message-ID: <20190716091237.fjjhhppndquy3cvx@Air-de-Roger.citrite.net>
References: <5cda711a-b417-76e9-d113-ea838463f225@suse.com>
 <923083ba-66f9-a88b-8909-a2f5e2808a69@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <923083ba-66f9-a88b-8909-a2f5e2808a69@suse.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v4 06/13] x86/IOMMU: don't restrict IRQ
 affinities to online CPUs
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
Cc: "kevin.tian@intel.com" <kevin.tian@intel.com>, Wei Liu <wl@xen.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Brian Woods <brian.woods@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBKdWwgMTYsIDIwMTkgYXQgMDc6NDA6NTdBTSArMDAwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gSW4gbGluZSB3aXRoICJ4ODYvSVJROiBkZXNjLT5hZmZpbml0eSBzaG91bGQgc3RyaWN0
bHkgcmVwcmVzZW50IHRoZQo+IHJlcXVlc3RlZCB2YWx1ZSIgdGhlIGludGVybmFsbHkgdXNlZCBJ
UlEocykgYWxzbyBzaG91bGRuJ3QgYmUgcmVzdHJpY3RlZAo+IHRvIG9ubGluZSBvbmVzLiBNYWtl
IHNldF9kZXNjX2FmZmluaXR5KCkgKHNldF9tc2lfYWZmaW5pdHkoKSB0aGVuIGRvZXMKPiBieSBp
bXBsaWNhdGlvbikgY29wZSB3aXRoIGEgTlVMTCBtYXNrIGJlaW5nIHBhc3NlZCAoanVzdCBsaWtl
Cj4gYXNzaWduX2lycV92ZWN0b3IoKSBkb2VzKSwgYW5kIGhhdmUgSU9NTVUgY29kZSBwYXNzIE5V
TEwgaW5zdGVhZCBvZgo+ICZjcHVfb25saW5lX21hcCAod2hlbiwgZm9yIFZULWQsIHRoZXJlJ3Mg
bm8gTlVNQSBub2RlIGluZm9ybWF0aW9uCj4gYXZhaWxhYmxlKS4KPiAKPiBTaWduZWQtb2ZmLWJ5
OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpMR1RNLCBqdXN0IG9uZSBwYXRjaCBz
dHlsZSBjb21tZW50IGFuZCBvbmUgY29kZSBjb21tZW50OgoKUmV2aWV3ZWQtYnk6IFJvZ2VyIFBh
dSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgoKPiAtLS0KPiB2NDogTmV3Lgo+IAo+IC0t
LSBhL3hlbi9hcmNoL3g4Ni9pcnEuYwo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9pcnEuYwo+IEBAIC03
OTYsMTggKzc5NiwyNiBAQCB1bnNpZ25lZCBpbnQgc2V0X2Rlc2NfYWZmaW5pdHkoc3RydWN0IGly
Cj4gICAgICAgdW5zaWduZWQgbG9uZyBmbGFnczsKPiAgICAgICBjcHVtYXNrX3QgZGVzdF9tYXNr
Owo+ICAgCj4gLSAgICBpZiAoIWNwdW1hc2tfaW50ZXJzZWN0cyhtYXNrLCAmY3B1X29ubGluZV9t
YXApKQo+ICsgICAgaWYgKCBtYXNrICYmICFjcHVtYXNrX2ludGVyc2VjdHMobWFzaywgJmNwdV9v
bmxpbmVfbWFwKSApCj4gICAgICAgICAgIHJldHVybiBCQURfQVBJQ0lEOwo+ICAgCj4gICAgICAg
c3Bpbl9sb2NrX2lycXNhdmUoJnZlY3Rvcl9sb2NrLCBmbGFncyk7Cj4gLSAgICByZXQgPSBfYXNz
aWduX2lycV92ZWN0b3IoZGVzYywgbWFzayk7Cj4gKyAgICByZXQgPSBfYXNzaWduX2lycV92ZWN0
b3IoZGVzYywgbWFzayA/OiBUQVJHRVRfQ1BVUyk7Cj4gICAgICAgc3Bpbl91bmxvY2tfaXJxcmVz
dG9yZSgmdmVjdG9yX2xvY2ssIGZsYWdzKTsKCkkgdGhpbmsgdGhlIHBhdGNoIGlzIHNvbWVob3cg
bWFuZ2xlZCBhdCBsZWFzdCBvbiBteSBlbmQsIHRoZXJlJ3Mgb25lCnByZXBlbmRlZCBleHRyYSBz
cGFjZSBpbiB0aGUgbm9uLW1vZGlmaWVkIGxpbmVzIEFGQUlDVC4KCj4gICAKPiAtICAgIGlmIChy
ZXQgPCAwKQo+ICsgICAgaWYgKCByZXQgPCAwICkKPiAgICAgICAgICAgcmV0dXJuIEJBRF9BUElD
SUQ7Cj4gICAKPiAtICAgIGNwdW1hc2tfY29weShkZXNjLT5hZmZpbml0eSwgbWFzayk7CgpBRkFJ
Q1QgeW91IGNvdWxkIGFsc28gYXZvaWQgdGhlIGlmIGFuZCBqdXN0IGRvIHRoZSBzYW1lIGFzIGlu
IHRoZQphc3NpZ25faXJxX3ZlY3RvciBjYWxsIGFib3ZlIGFuZCBwYXNzIFRBUkdFVF9DUFVTIGlm
IG1hc2sgaXMgTlVMTD8KClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
