Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC8D71505B8
	for <lists+xen-devel@lfdr.de>; Mon,  3 Feb 2020 12:58:48 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iyaKj-0005le-Hd; Mon, 03 Feb 2020 11:56:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=MGDo=3X=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iyaKi-0005lU-8h
 for xen-devel@lists.xenproject.org; Mon, 03 Feb 2020 11:56:04 +0000
X-Inumbo-ID: 25b0b584-467c-11ea-8e51-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 25b0b584-467c-11ea-8e51-12813bfff9fa;
 Mon, 03 Feb 2020 11:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580730962;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=T993VnBc8dJT1c9l7QVylaH0qrRkEMQv2bZXCRcSAWU=;
 b=eiAByj/szNEZSPuQusRV9sa5fSTMuZNxKGVGvyXrqpV1NlhIFBd81S/H
 5hhYKizMLe8Jm4WxozDsml4TCKOwXfZmX+w58t5BLeXrVuOMh1h1Hf/xr
 BHZd6ZYeWQqmblGzQz3L1kaTN/42rXLFFyJ1KEObLkzotH10Nca1JSf4b k=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: CZEvDbKl5j89uxJJujTwaHdR6jyxkmEmAfwKorasANtYykCTnGwRMZ+5klcsKXHw5M+xh2rGlm
 Y4KI6rVZJ38vQXP1wMj1bwGTsXeMPUXKCoESEyU04Okdjth8OAgQYM2aGbgtjg2OOMhr0hyeJW
 F+3/wBARjmD+uySou5PPBWPNxm1nBr42HKJcZ6/Ue2AmQB40zJRKRudbwQWb5Zwgy0zRmrnbFn
 glRLguwER7X4zV9k9cXD6mCdTi/HnTEeiW7vXq9oE6xmdvYsGYtl01hwooh/9Egg+ObhyiQ76b
 ZC8=
X-SBRS: 2.7
X-MesageID: 11837618
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,397,1574139600"; d="scan'208";a="11837618"
Date: Mon, 3 Feb 2020 12:55:49 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: "Tian, Kevin" <kevin.tian@intel.com>
Message-ID: <20200203115549.GT4679@Air-de-Roger>
References: <20200108103857.77236-1-roger.pau@citrix.com>
 <20200108103857.77236-2-roger.pau@citrix.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D739C38@SHSMSX104.ccr.corp.intel.com>
 <20200120101906.GW11756@Air-de-Roger>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D73E81C@SHSMSX104.ccr.corp.intel.com>
 <20200123123154.GC57924@desktop-tdan49n.eng.citrite.net>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D75F802@SHSMSX104.ccr.corp.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <AADFC41AFE54684AB9EE6CBC0274A5D19D75F802@SHSMSX104.ccr.corp.intel.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH 1/2] nvmx: fix handling of interrupts
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, "Nakajima, Jun" <jun.nakajima@intel.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBGZWIgMDMsIDIwMjAgYXQgMDc6MjQ6MDRBTSArMDAwMCwgVGlhbiwgS2V2aW4gd3Jv
dGU6Cj4gPiBGcm9tOiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KPiA+
IFNlbnQ6IFRodXJzZGF5LCBKYW51YXJ5IDIzLCAyMDIwIDg6MzIgUE0KPiA+IAo+ID4gT24gVHVl
LCBKYW4gMjEsIDIwMjAgYXQgMDM6MzQ6MTNBTSArMDAwMCwgVGlhbiwgS2V2aW4gd3JvdGU6Cj4g
PiA+ID4gRnJvbTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4gPiA+
ID4gU2VudDogTW9uZGF5LCBKYW51YXJ5IDIwLCAyMDIwIDY6MTkgUE0KPiA+ID4gPgo+ID4gPiA+
IE9uIFN1biwgSmFuIDE5LCAyMDIwIGF0IDA0OjE1OjA0QU0gKzAwMDAsIFRpYW4sIEtldmluIHdy
b3RlOgo+ID4gPiA+ID4gPiBGcm9tOiBSb2dlciBQYXUgTW9ubmUgPHJvZ2VyLnBhdUBjaXRyaXgu
Y29tPgo+ID4gPiA+ID4gPiBTZW50OiBXZWRuZXNkYXksIEphbnVhcnkgOCwgMjAyMCA2OjM5IFBN
Cj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IFdoZW4gZG9pbmcgYSB2aXJ0dWFsIHZtZXhpdCAoaWU6
IGEgdm1leGl0IGhhbmRsZWQgYnkgdGhlIEwxIFZNTSkKPiA+ID4gPiA+ID4gaW50ZXJydXB0cyBz
aG91bGRuJ3QgYmUgaW5qZWN0ZWQgdXNpbmcgdGhlIHZpcnR1YWwgaW50ZXJydXB0IGRlbGl2ZXJ5
Cj4gPiA+ID4gPiA+IG1lY2hhbmlzbSwgYW5kIGluc3RlYWQgc2hvdWxkIGJlIHNpZ25hbGVkIGlu
IHRoZSB2bWNzIHVzaW5nIHRoZSBleGl0Cj4gPiA+ID4gPiA+IHJlYXNvbiBhbmQgdGhlIGludGVy
cnVwdGlvbi1pbmZvcm1hdGlvbiBmaWVsZCBpZiB0aGUgIkFja25vd2xlZGdlCj4gPiA+ID4gPiA+
IGludGVycnVwdCBvbiBleGl0IiB2bWV4aXQgY29udHJvbCBpcyBzZXQuCj4gPiA+ID4gPiA+Cj4g
PiA+ID4gPiA+IFJlbW92ZSB0aGUgbnZteF91cGRhdGVfYXBpY3YgaGVscGVyOiBpdCdzIGJvZ3Vz
IHRvIGF0dGVtcHQgdG8gaW5qZWN0Cj4gPiA+ID4gPiA+IGludGVycnVwdHMgb24gdmlydHVhbCB2
bWV4aXQgdXNpbmcgdGhlIHZpcnR1YWwgaW50ZXJydXB0IGRlbGl2ZXJ5Cj4gPiA+ID4gPiA+IGFz
c2lzdGFuY2UsIGFuZCBpdCdzIGFsc28gYm9ndXMgdG8gYWNrIGludGVycnVwdHMgd2l0aG91dCBj
aGVja2luZyBpZgo+ID4gPiA+ID4gPiB0aGUgdm1leGl0ICJBY2tub3dsZWRnZSBpbnRlcnJ1cHQg
b24gZXhpdCIgdm1leGl0IGNvbnRyb2wgaXMgc2V0Lgo+ID4gPiA+ID4gPiBudm14X2ludHJfaW50
ZXJjZXB0IGFscmVhZHkgaGFuZGxlcyBpbnRlcnJ1cHRzIGNvcnJlY3RseSBvbiB2aXJ0dWFsCj4g
PiA+ID4gPiA+IHZtZXhpdC4KPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gTm90ZSB0aGF0IHRoaXMg
Zml4ZXMgdGhlIHVzYWdlIG9mIHgyQVBJQyBieSB0aGUgTDEgVk1NLCBhdCBsZWFzdCB3aGVuCj4g
PiA+ID4gPiA+IHRoZSBMMSBWTU0gaXMgWGVuLgo+ID4gPiA+ID4KPiA+ID4gPiA+IHdoaWxlIHRo
aXMgZml4IG1ha2VzIHNlbnNlIHRvIG1lLCBjYW4geW91IGFsc28gdGVzdCBvdGhlciBMMSBWTU1z
LAo+ID4gPiA+ID4gc28gd2UgZG9uJ3Qgb3Zlcmxvb2sgc29tZSBvdGhlciBpbnRlbnRpb25zIGNv
dmVyZWQgb3IgaGlkZGVuIGJ5Cj4gPiA+ID4gPiByZW1vdmVkIGxvZ2ljPwo+ID4gPiA+Cj4gPiA+
ID4gSSBjb3VsZCB0ZXN0IG90aGVyIGh5cGVydmlzb3JzLCBidXQgZG8gd2UgcmVhbGx5IGV4cGVj
dCBhbnl0aGluZwo+ID4gPiA+IHRoYXQncyBub3QgWGVuIG9uIFhlbiB0byB3b3JrPwo+ID4gPiA+
Cj4gPiA+ID4gSSdtIGFza2luZyBiZWNhdXNlIHRoYXQncyB0aGUgb25seSBjb21iaW5hdGlvbiB0
aGF0J3MgYWN0dWFsbHkgdGVzdGVkCj4gPiA+ID4gYnkgb3NzdGVzdC4KPiA+ID4gPgo+ID4gPiA+
IFRoYW5rcywgUm9nZXIuCj4gPiA+Cj4gPiA+IElmIG90aGVycyBhcmUgT0sgd2l0aCB5b3VyIGFz
c3VtcHRpb24sIHRoZW4gaXQncyBmaW5lLiBJIGRpZG4ndCB0aWdodGx5Cj4gPiA+IGZvbGxvdyB0
aGUgbmVzdGVkIHZpcnR1YWxpemF0aW9uIHJlcXVpcmVtZW50cyBpbiBYZW4uCj4gPiA+Cj4gPiA+
IE9uIHRoZSBvdGhlciBoYW5kLCBJIHRoaW5rIHRoaXMgcGF0Y2ggbmVlZHMgYSByZXZpc2lvbi4g
SXQgaXMgbm90IGJvZ3VzCj4gPiA+IHRvIHVzZSB2aXJ0dWFsIGludGVycnVwdCBkZWxpdmVyeSBv
biB2aXJ0dWFsIFZNZXhpdCwgaWYgIkFjayBpbnRlcnJ1cHQKPiA+ID4gb24gZXhpdCIgaXMgb2Zm
LiBJbiBzdWNoIGNhc2UsIHRoZSBkZWxpdmVyeSBkb2Vzbid0IGhhcHBlbiB1bnRpbCBMMQo+ID4g
PiBoeXBlcnZpc29yIGVuYWJsZXMgaW50ZXJydXB0IHRvIGNsZWFyIGludGVycnVwdCB3aW5kb3cu
IFRoZW4gaXQgZG9lcwo+ID4gPiBzYXZlIG9uZSBleGl0LiBUaGUgb25seSBib2d1cyBwb2ludCBp
cyB0aGF0IG52bXhfdWRwYXRlX2FwaWN2IGRvZXNuJ3QKPiA+ID4gY2hlY2sgIkFjayBpbnRlcnJ1
cHQgb24gZXhpdCIuIFNvIEkgcHJlZmVyIHRvIGFkZCBzdWNoIGNoZWNrIHRoZXJlCj4gPiA+IGlu
c3RlYWQgb2YgY29tcGxldGVseSByZW1vdmluZyB0aGlzIG9wdGltaXphdGlvbi4KPiA+IAo+ID4g
SSB3ZW50IGJhY2sgb3ZlciB0aGlzLCBhbmQgSSdtIHN0aWxsIG5vdCBzdXJlIGNhbGxpbmcKPiA+
IG52bXhfdXBkYXRlX2FwaWN2IGlzIGFjdHVhbGx5IHJlcXVpcmVkOiBBRkFJQ1Qgdm14X2ludHJf
YXNzaXN0IHdpbGwKPiA+IGFscmVhZHkgaW5qZWN0IHRoZSBpbnRlcnJ1cHQgY29ycmVjdGx5IHVz
aW5nIHZpcnR1YWwgaW50ZXJydXB0Cj4gPiBkZWxpdmVyeSBpZiBsZWZ0IHBlbmRpbmcgb24gdGhl
IHZsYXBpYy4gSSBndWVzcyB0aGUgY29kZSBpbgo+ID4gbnZteF91cGRhdGVfYXBpY3YgZG9lc24n
dCBodXJ0IGFzIGxvbmcgYXMgaXQncyBnYXRlZCBvbiAiQWNrIG9uIGV4aXQiCj4gPiBub3QgYmVp
bmcgZW5hYmxlZCwgYnV0IGl0J3MgbGlrZWx5IHJlZHVuZGFudC4KPiAKPiBJdCdzIG5vdCByZWR1
bmRhbnQuIElmIHlvdSBsb29rIGF0IHRoZSBjb2RlIHNlcXVlbmNlLCB2bXhfaW50cl9hc3Npc3QK
PiBpcyBpbnZva2VkIGJlZm9yZSBudm14X3N3aXRjaF9ndWVzdC4gQXQgdGhhdCB0aW1lLCB0aGUg
TDEgdkNQVSBpcyBzdGlsbAo+IGluIG5lc3RlZCBndWVzdCBtb2RlLCB0aGVyZWJ5IG52bXhfaW50
cl9pbnRlcmNlcHQgdGFrZXMgZWZmZWN0IHdoaWNoCj4gaW5qZWN0cyB0aGUgcGVuZGluZyB2ZWN0
b3IgaW50byB2bWNzMDIgYW5kIGJ5cGFzc2VzIHRoZSByZW1haW5pbmcKPiB2aXJ0dWFsIGludGVy
cnVwdCBkZWxpdmVyeSBsb2dpYyBmb3Igdm1jczAxLiBUaGF0IGlzIHRoZSBtYWluIHJlYXNvbiwg
aW1vLAo+IHdoeSBudm14X3VwZGF0ZV9hcGljdiBpcyBpbnRyb2R1Y2VkLgo+IAo+IGlpdWMsIG52
bXhfaW50cl9pbnRlcmNlcHQgYW5kIG52bXhfdXBkYXRlX2FwaWN2IHdvcmsgdG9nZXRoZXIgdG8K
PiBjb21wbGV0ZSBuZXN0ZWQgaW50ZXJydXB0IGluamVjdGlvbjoKPiAKPiAoMSkgSWYgIkFjayBp
bnRlcnJ1cHQgb24gZXhpdCIgaXMgb24sIHRoZSBwZW5kaW5nIHZlY3RvciBpcyBhY2tlZCBieSAK
PiB0aGUgZm9ybWVyIGFuZCBkZWxpdmVyZWQgaW4gdnZtZXhpdCBpbmZvcm1hdGlvbiBmaWVsZC4K
PiAoMikgSWYgIkFjayBpbnRlcnJ1cHQgb24gZXhpdCIgaXMgb2ZmIGFuZCBubyB2aXJ0dWFsIGlu
dGVycnVwdCBkZWxpdmVyeSwgCj4gbm8gYWNrIGFuZCBpbnRlcnJ1cHQgd2luZG93IGlzIGVuYWJs
ZWQgYnkgdGhlIGZvcm1lci4KPiAoMykgT3RoZXJ3aXNlLCB0aGUgdmVjdG9yIGlzIGFja2VkIGJ5
IHRoZSBsYXR0ZXIgYW5kIGRlbGl2ZXJlZCB0aHJvdWdoCj4gdmlydHVhbCBpbnRlcnJ1cHQgZGVs
aXZlcnkgKHdoZXJlIHZtY3MwMSBoYXMgYmVlbiBzd2l0Y2hlZCBpbikuIAo+IAo+IEhvd2V2ZXIs
IHRoZXJlIGFyZSB0d28gaXNzdWVzIGluIGN1cnJlbnQgY29kZS4gT25lIGlzIGFib3V0ICgzKSwg
aS5lLiwKPiBhcyB5b3UgaWRlbnRpZmllZCBudm14X3VwZGF0ZV9hcGljdiBzaG91bGRuJ3QgYmxp
bmRseSBlbmFibGUgdGhlCj4gb3B0aW1pemF0aW9uIHdpdGhvdXQgY2hlY2tpbmcgdGhlIEFjayBz
ZXR0aW5nLiB0aGUgb3RoZXIgaXMgbmV3IAo+IGFib3V0ICgyKSAtIGN1cnJlbnRseSBudm14X2lu
dHJfaW50ZXJydXB0IGFsd2F5cyBlbmFibGVzIGludGVycnVwdCAKPiB3aW5kb3cgd2hlbiB0aGUg
QWNrIHNldHRpbmcgaXMgb2ZmLCB3aGljaCBhY3R1YWxseSBuZWdhdGVzIHRoZSAKPiBvcHRpbWl6
YXRpb24gb2YgbnZteF91cGRhdGVfYXBpY3YuIEJvdGggc2hvdWxkIGJlIGZpeGVkLgoKT0ssIEkg
dGhpbmsgSSBnb3QgaXQuIEl0J3MgbGlrZWx5IGhvd2V2ZXIgdGhhdCB2bXhfaW50cl9hc3Npc3Qg
aXMgYWxzbwpjYWxsZWQgd2l0aCB0aGUgdm1jcyBhbHJlYWR5IHN3aXRjaGVkIHRvIHZtY3MwMSAo
aWYgdGhlcmUncyBhIHBlbmRpbmcKc29mdGlycSBmb3IgZXhhbXBsZSksIEkgZ3Vlc3Mgdm14X2lu
dHJfYXNzaXN0IGFsc28gY29wZXMgY29ycmVjdGx5CndoZW4gY2FsbGVkIHdpdGggdGhlIHZtY3Mg
YWxyZWFkeSBzd2l0Y2hlZD8KClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
