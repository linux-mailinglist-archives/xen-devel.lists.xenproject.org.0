Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB806182DF3
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2020 11:41:43 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jCLEH-0001B0-KZ; Thu, 12 Mar 2020 10:38:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=abR8=45=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jCLEG-0001Av-C3
 for xen-devel@lists.xenproject.org; Thu, 12 Mar 2020 10:38:16 +0000
X-Inumbo-ID: 93ad37a8-644d-11ea-b143-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 93ad37a8-644d-11ea-b143-12813bfff9fa;
 Thu, 12 Mar 2020 10:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1584009495;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=IC372Bcbt8ktAUS7RVvcTdbfRKigPARiiEcsbsgJSFs=;
 b=c8HIfUBMg2RIyyEYzvG5hJO10LDbgZgaLHPcBMIYGCYLIBw2/vWjT0bT
 RjxIckvBI0r9Zglg40GGVl+SK1iqTb9extHHeTOFKmoHrGmF35XFJh7NB
 3iTDrdZxM5hA8J2t48PBq0eKwUS0lMZHeotikrw0XTITHTnxjCIbO/Q83 I=;
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
IronPort-SDR: XajVEN/Xq1DvHi3fULOoHGJMnlKc67f79UMRDe5QxaRLH8ePwulj6GPTg5YidWUES1V2kdPIyr
 62cbG1mcEfsDmpAqcUkjNsSx/6X0pu03YO2P0c/o/d/ag3kbOgZj2r4k/jTMRc5KCR7FWAqGmH
 l8WuSX2IjqgSJ70IpZ+0UUZcE+BMBNdg3I3g1+zc4eidlbzoHnxG48gljMXXYf4TGLr/c599lJ
 s36iQhG28JusSUeFsBd5aBnJmhrI7580Vb4Naosg8zLTP3pofzw4koLEzUpp8FghkyNXhWoNxN
 wzA=
X-SBRS: 2.7
X-MesageID: 13808867
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,544,1574139600"; d="scan'208";a="13808867"
Date: Thu, 12 Mar 2020 11:38:06 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200312103806.GF24458@Air-de-Roger.citrite.net>
References: <20200228120753.38036-1-roger.pau@citrix.com>
 <20200228120753.38036-3-roger.pau@citrix.com>
 <6a031b3f-5807-572d-682b-9a0b05f0703d@suse.com>
 <20200311153437.GC24458@Air-de-Roger.citrite.net>
 <cd51c415-dfd4-42c4-caf9-2a19ddeb8b3f@suse.com>
 <20200311155118.GD24458@Air-de-Roger.citrite.net>
 <31a2da09-c82d-157f-3ca2-bbea45d9bcd0@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <31a2da09-c82d-157f-3ca2-bbea45d9bcd0@suse.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v5 2/2] x86: add accessors for scratch cpu
 mask
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
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBNYXIgMTEsIDIwMjAgYXQgMDU6MjA6MjNQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMTEuMDMuMjAyMCAxNjo1MSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiA+IE9u
IFdlZCwgTWFyIDExLCAyMDIwIGF0IDA0OjM3OjUwUE0gKzAxMDAsIEphbiBCZXVsaWNoIHdyb3Rl
Ogo+ID4+IE9uIDExLjAzLjIwMjAgMTY6MzQsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4gPj4+
IE9uIEZyaSwgRmViIDI4LCAyMDIwIGF0IDAxOjQyOjU4UE0gKzAxMDAsIEphbiBCZXVsaWNoIHdy
b3RlOgo+ID4+Pj4gT24gMjguMDIuMjAyMCAxMzowNywgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+
ID4+Pj4+IEN1cnJlbnQgdXNhZ2Ugb2YgdGhlIHBlci1DUFUgc2NyYXRjaCBjcHVtYXNrIGlzIGRh
bmdlcm91cyBzaW5jZQo+ID4+Pj4+IHRoZXJlJ3Mgbm8gd2F5IHRvIGZpZ3VyZSBvdXQgaWYgdGhl
IG1hc2sgaXMgYWxyZWFkeSBiZWluZyB1c2VkIGV4Y2VwdAo+ID4+Pj4+IGZvciBtYW51YWwgY29k
ZSBpbnNwZWN0aW9uIG9mIGFsbCB0aGUgY2FsbGVycyBhbmQgcG9zc2libGUgY2FsbCBwYXRocy4K
PiA+Pj4+Pgo+ID4+Pj4+IFRoaXMgaXMgdW5zYWZlIGFuZCBub3QgcmVsaWFibGUsIHNvIGludHJv
ZHVjZSBhIG1pbmltYWwgZ2V0L3B1dAo+ID4+Pj4+IGluZnJhc3RydWN0dXJlIHRvIHByZXZlbnQg
bmVzdGVkIHVzYWdlIG9mIHRoZSBzY3JhdGNoIG1hc2sgYW5kIHVzYWdlCj4gPj4+Pj4gaW4gaW50
ZXJydXB0IGNvbnRleHQuCj4gPj4+Pj4KPiA+Pj4+PiBNb3ZlIHRoZSBkZWNsYXJhdGlvbiBvZiBz
Y3JhdGNoX2NwdW1hc2sgdG8gc21wLmMgaW4gb3JkZXIgdG8gcGxhY2UgdGhlCj4gPj4+Pj4gZGVj
bGFyYXRpb24gYW5kIHRoZSBhY2Nlc3NvcnMgYXMgY2xvc2UgYXMgcG9zc2libGUuCj4gPj4+Pj4K
PiA+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4
LmNvbT4KPiA+Pj4+Cj4gPj4+PiBSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1
c2UuY29tPgo+ID4+Pgo+ID4+PiBQaW5nPyBUaGlzIHNlZW1zIHRvIGhhdmUgdGhlIHJlcXVpcmVk
IFJCLCBidXQgaGFzbid0IGJlZW4gY29tbWl0dGVkLgo+ID4+Cj4gPj4gV2hpbGUgYXMgcGVyIHRo
ZSBSLWIgdGhpcyB0ZWNobmljYWxseSBpcyBmaW5lLCBJIGNvbnRpbnVlIHRvIGJlCj4gPj4gdW5j
ZXJ0YWluIHdoZXRoZXIgd2UgYWN0dWFsbHkgd2FudCB0byBnbyB0aGlzIGZhci4KPiA+IAo+ID4g
SWYgdGhpcyBoYWQgYmVlbiBpbiBwbGFjZSA1NTAwZDI2NWEyYThmYTYgKCd4ODYvc21wOiB1c2Ug
QVBJQyBBTExCVVQKPiA+IGRlc3RpbmF0aW9uIHNob3J0aGFuZCB3aGVuIHBvc3NpYmxlJykgd291
bGRuJ3QgaGF2ZSBpbnRyb2R1Y2VkIGEKPiA+IGJvZ3VzIHVzYWdlIG9mIHRoZSBzY3JhdGNoIHBl
ciBjcHUgbWFzaywgYXMgdGhlIGNoZWNrIHdvdWxkIGhhdmUKPiA+IHRyaWdnZXJlZC4KPiA+IAo+
ID4gQWZ0ZXIgZmluZGluZyB0aGF0IG9uZSBvZiBteSBjb21taXRzIGludHJvZHVjZWQgYSBidWcg
SSB1c3VhbGx5IGRvIHRoZQo+ID4gZXhlcmNpc2Ugb2YgdHJ5aW5nIHRvIGZpZ3VyZSBvdXQgd2hp
Y2ggY2hlY2tzIG9yIHNhZmVndWFyZHMgd291bGQgaGF2ZQo+ID4gcHJldmVudGVkIGl0LCBhbmQg
aGVuY2UgY2FtZSB1cCB3aXRoIHRoaXMgcGF0Y2guCj4gPiAKPiA+IEkgd291bGQgYWxzbyBsaWtl
IHRvIG5vdGUgdGhhdCB0aGlzIGFkZHMgMCBvdmVyaGVhZCB0byBub24tZGVidWcKPiA+IGJ1aWxk
cy4KPiA+IAo+ID4+IEFuZHJldywgYXMKPiA+PiBwZXIgYSBkaXNjdXNzaW9uIHdlIGhhZCB3aGVu
IEkgd2FzIHBvbmRlcmluZyB3aGV0aGVyIHRvIGNvbW1pdAo+ID4+IHRoaXMsIGFsc28gbG9va3Mg
dG8gaGF2ZSBzaW1pbGFyIGNvbmNlcm5zICh3aGljaCBpaXJjIGhlIHNhaWQgaGUKPiA+PiBoYWQg
dm9pY2VkIG9uIGlyYykuCj4gPiAKPiA+IElzIHRoZSBjb25jZXJuIG9ubHkgcmVsYXRlZCB0byB0
aGUgZmFjdCB0aGF0IHlvdSBoYXZlIHRvIHVzZSB0aGUKPiA+IGdldC9wdXQgYWNjZXNzb3JzIGFu
ZCB0aHVzIG1vcmUgbGluZXMgb2YgY29kZSBhcmUgYWRkZWQsIG9yIGlzIHRoZXJlCj4gPiBzb21l
dGhpbmcgZWxzZT8KPiAKPiBBZmFpYyAtIGxhcmdlbHkgdGhpcywgYWxvbmcgd2l0aCBpdCBtYWtp
bmcgaXQgbW9yZSBsaWtlbHkgdGhhdAo+IGVycm9yIHBhdGhzIHdpbGwgYmUgbm9uLXRyaXZpYWwg
KGFuZCBoZW5jZSBwb3NzaWJseSBnZXQgY29udmVydGVkCj4gdG8gdXNlIGdvdG8tcykuIEkgY2Fu
J3Qgc3BlYWsgZm9yIEFuZHJldywgb2YgY291cnNlLgoKRlRSIEkgdGhpbmsgYmVpbmcgYWJsZSB0
byBwcm9ncmFtbWF0aWNhbGx5IHNwb3QgbWlzdXNlcyBvZiB0aGUgc2NyYXRjaApjcHVtYXNrIGlz
IG1vcmUgaW1wb3J0YW50IHRoYW4gaGF2aW5nIGNsZWFyZXIgZXJyb3IgcGF0aHMuIEkgYWxzbwp0
aGluayB0aGUgY2hhbmdlcyByZXF1aXJlZCB0byBlbmZvcmNlIHRoaXMgYXJlIG5vdCB0aGF0IGlu
dHJ1c2l2ZSwgYXMKSSBzd2l0Y2hlZCBhbGwgY3VycmVudCB1c2VycyBvZiB0aGUgc2NyYXRjaCBj
cHVtYXNrIGFuZCBkaWRuJ3QgaGF2ZSB0bwphZGQgYW55IGxhYmVscyBhdCBhbGwgdG8gaGFuZGxl
IGVycm9ycy4KClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
