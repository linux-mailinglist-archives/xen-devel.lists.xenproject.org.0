Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A22384B6FC
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jun 2019 13:23:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hdYeO-0005C0-D8; Wed, 19 Jun 2019 11:21:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=XeE9=US=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hdYeN-0005Bq-6v
 for xen-devel@lists.xenproject.org; Wed, 19 Jun 2019 11:21:11 +0000
X-Inumbo-ID: 55fec200-9284-11e9-a85e-8f9c0830d88a
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 55fec200-9284-11e9-a85e-8f9c0830d88a;
 Wed, 19 Jun 2019 11:21:09 +0000 (UTC)
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 9/Hf83g5IH1mYbNE/4IlY/T6WPVNNv533UL7lVSU4hHfb2JUC8NA+/bQGvX6Zxj6lixbuvie33
 WT9yiuPSEepYiXuM4qNKnFGyC2TxhFk6x++3z6YAv+onhBrusUoCq9ZYKiE9zdphk437NPyih7
 ajb6D84fRzzNWIt77uhbUogKv3JLUnaYUUN9jNvDg0jovlM0JQ3AjJQKzsWysDtUTdj+0vYvnv
 b2CtuP8Je5Ru6gTu1iwcHd44EAxVWzJ8g1MDM+iumNpxoEixxHXG95mw6yncsZ+2LwG+qbm8IU
 d68=
X-SBRS: 2.7
X-MesageID: 1927472
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,392,1557201600"; 
   d="scan'208";a="1927472"
Date: Wed, 19 Jun 2019 13:20:59 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20190619112059.ty5wllqxfrsqmg57@MacBook-Air-de-Roger.local>
References: <20190619110250.18881-1-roger.pau@citrix.com>
 <20190619110250.18881-5-roger.pau@citrix.com>
 <3dfa28cb-c644-2b22-ce87-96cc159e4acf@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3dfa28cb-c644-2b22-ce87-96cc159e4acf@citrix.com>
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
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBKdW4gMTksIDIwMTkgYXQgMTI6MTE6NDNQTSArMDEwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBPbiAxOS8wNi8yMDE5IDEyOjAyLCBSb2dlciBQYXUgTW9ubmUgd3JvdGU6Cj4gPiBB
ZnRlciBidWlsZGluZyB0aGUgaHlwZXJ2aXNvciBiaW5hcnkuIE5vdGUgdGhhdCB0aGUgY2hlY2sg
aXMgcGVyZm9ybWVkCj4gPiBieSBzZWFyY2hpbmcgZm9yIHRoZSBtYWdpYyBoZWFkZXIgdmFsdWUg
YXQgdGhlIHN0YXJ0IG9mIHRoZSBiaW5hcnkuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogUm9nZXIg
UGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4gPiAtLS0KPiA+IENjOiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4gPiBDYzogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNv
b3BlcjNAY2l0cml4LmNvbT4KPiA+IENjOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgo+ID4gLS0tCj4g
PiAgeGVuL2FyY2gveDg2L01ha2VmaWxlIHwgMyArKysKPiA+ICAxIGZpbGUgY2hhbmdlZCwgMyBp
bnNlcnRpb25zKCspCj4gPgo+ID4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9NYWtlZmlsZSBi
L3hlbi9hcmNoL3g4Ni9NYWtlZmlsZQo+ID4gaW5kZXggOGE4ZDhmMDYwZi4uOWJiM2JmNmU2YyAx
MDA2NDQKPiA+IC0tLSBhL3hlbi9hcmNoL3g4Ni9NYWtlZmlsZQo+ID4gKysrIGIveGVuL2FyY2gv
eDg2L01ha2VmaWxlCj4gPiBAQCAtMTAyLDYgKzEwMiw5IEBAIHN5bXMtd2Fybi1kdXAtJChDT05G
SUdfU1VQUFJFU1NfRFVQTElDQVRFX1NZTUJPTF9XQVJOSU5HUykgOj0KPiA+ICAkKFRBUkdFVCk6
ICQoVEFSR0VUKS1zeW1zICQoZWZpLXkpIGJvb3QvbWtlbGYzMgo+ID4gIAkuL2Jvb3QvbWtlbGYz
MiAkKG5vdGVzX3BoZHJzKSAkKFRBUkdFVCktc3ltcyAkKFRBUkdFVCkgJChYRU5fSU1HX09GRlNF
VCkgXAo+ID4gIAkgICAgICAgICAgICAgICBgJChOTSkgJChUQVJHRVQpLXN5bXMgfCBzZWQgLW5l
ICdzL15cKFteIF0qXCkgLiBfXzJNX3J3ZGF0YV9lbmQkJC8weFwxL3AnYAo+ID4gKwkjIENoZWNr
IGZvciBtdWx0aWJvb3R7MSwyfSBoZWFkZXJzCj4gPiArCW9kIC10IHg0IC1OIDgxOTIgJChUQVJH
RVQpIHwgZ3JlcCAxYmFkYjAwMiA+IC9kZXYvbnVsbAo+ID4gKwlvZCAtdCB4NCAtTiAzMjc2OCAk
KFRBUkdFVCkgfCBncmVwIGU4NTI1MGQ2ID4gL2Rldi9udWxsCj4gCj4gTmVhdCBzb2x1dGlvbi7C
oCBJcyBgZ3JlcCAtcWAgcG9ydGFibGUgPwoKSXQgaXMsIGJ1dCBncmVwIC1xIGNsb3NlcyB0aGUg
cGlwZSBvbiB0aGUgZmlyc3QgbWF0Y2gsIGFuZCB0aGVuIG9kCndpbGwgcmV0dXJuIGFuIGVycm9y
LiBOb3RlIHN1cmUgd2hldGhlciB0aGVyZSdzIGEgd2F5IHRvIHdvcmthcm91bmQKdGhpcyBpc3N1
ZSwgYnV0IEkgdGhpbmsgdGhlIGFib3ZlIGlzIHNpbXBsZSBlbm91Z2guCgpUaGFua3MsIFJvZ2Vy
LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
