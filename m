Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE46100937
	for <lists+xen-devel@lfdr.de>; Mon, 18 Nov 2019 17:29:55 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iWjqc-0001VF-Ov; Mon, 18 Nov 2019 16:25:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2o9Z=ZK=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1iWjqb-0001VA-48
 for xen-devel@lists.xenproject.org; Mon, 18 Nov 2019 16:25:53 +0000
X-Inumbo-ID: 16082a92-0a20-11ea-b678-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 16082a92-0a20-11ea-b678-bc764e2007e4;
 Mon, 18 Nov 2019 16:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1574094351;
 h=subject:to:references:from:message-id:date:mime-version:
 in-reply-to:content-transfer-encoding;
 bh=bqN+jSl1/h9m2JERCI3ivTQPYDNujs0YaOcYjHXbYgk=;
 b=YeSEXXUnfMLSHqX9JEpWnvvkV3DWVHAGQfMrwPeRIvco0bAPzmaJrx37
 fn2c/aJBdynnX1Zwv9529Mo8WPZxWEJA6NUarw1C0NmfFN+/7VcqfWk5p
 AMRxneEMfK2/dnTkJgeVi95UN78cGuW3Kr5LOizSfck3RpNOlSHT07n1A 0=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=george.dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 george.dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="george.dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
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
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 6wFhKQu3pWzZp6Mp3SxZpfWAkiT+SdZ10+SDjpGh/X1upa57PP/Xrc8NhzH83efoL3XXHmRWT8
 rRc3yd6UlNB8aMNypBaDmU9xvFc5H8d3DLkM/hUcw+dEn+8Yw8IrA4R49k0MHFY2fYMC4NaSjG
 jnhMrhm669Xi+DNvV4Q3iBGyZ5NMQk+nq73irPhjcE1j8I1mNiyuZLM1iikwiWJfOSPc2oe5r5
 FW/h6Fxg8JCoP2e4JCZKdngGsYxUaywWEpKIyAXJIN7c7HqK3OVb7YiSkT6uwiPVz1cJmKeIRO
 1vU=
X-SBRS: 2.7
X-MesageID: 8886095
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,320,1569297600"; 
   d="scan'208";a="8886095"
To: Andreas Kinzler <hfp@posteo.de>, xen-devel
 <xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Steven Haigh <netwiz@crc.id.au>
References: <0e47b56a-4e5d-e815-2e74-eab5da11f3d0@posteo.de>
 <4f9cb404-995a-1479-160a-1cf96815cb9d@citrix.com>
 <be40e4d0-f03f-a855-a93a-031abed36c81@posteo.de>
From: George Dunlap <george.dunlap@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=george.dunlap@citrix.com; prefer-encrypt=mutual; keydata=
 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
 rIFfe2Dk+lD9A9BVd2rfoHA=
Message-ID: <91ad90a1-c265-506d-fd68-3bc1deb708c4@citrix.com>
Date: Mon, 18 Nov 2019 16:25:48 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <be40e4d0-f03f-a855-a93a-031abed36c81@posteo.de>
Content-Language: en-US
Subject: Re: [Xen-devel] Ryzen 3xxx works with Windows
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTEvMTgvMTkgNDoxMSBQTSwgQW5kcmVhcyBLaW56bGVyIHdyb3RlOgo+IE9uIDE1LjExLjIw
MTkgMTg6MTMsIEdlb3JnZSBEdW5sYXAgd3JvdGU6Cj4+IE9uIDExLzE1LzE5IDU6MDYgUE0sIEFu
ZHJlYXMgS2luemxlciB3cm90ZToKPj4+IEhlbGxvIEFsbCwKPj4+Cj4+PiBJIGNvbXBhcmVkIHRo
ZSBDUFVJRCBsaXN0aW5ncyBmcm9tIFJ5emVuIDI3MDBYIChhdHRhY2hlZCBhcyB0YXIueHopIHRv
Cj4+PiAzNzAwWCBhbmQgZm91bmQgb25seSB2ZXJ5IGZldyBkaWZmZXJlbmNlcy4gSSBhZGRlZAo+
Pj4KPj4+IGNwdWlkID0gWyAiMHg4MDAwMDAwODplY3g9eHh4eHh4eHh4eHh4eHh4eDAxMDB4eHh4
eHh4eHh4eHgiIF0KPj4+Cj4+PiB0byB4bC5jZmcgYW5kIHRoZW4gV2luZG93cyBydW5zIGdyZWF0
IHdpdGggMTYgdkNQVXMuIENpbmViZW5jaCBSMTUgc2NvcmUKPj4+IGlzID4yMDUwIHdoaWNoIGlz
IG1vcmUgb3IgbGVzcyB0aGUgYmFyZSBtZXRhbCB2YWx1ZS4KPj4gQXdlc29tZS7CoCBBbnkgaWRl
YSB3aGF0IHRob3NlIGJpdHMgZG8/Cj4gCj4gRnJvbSB0aGUgQU1EIEFQTSAoaHR0cHM6Ly93d3cu
YW1kLmNvbS9zeXN0ZW0vZmlsZXMvVGVjaERvY3MvMjQ1OTQucGRmKToKPiAKPiBBUElDIElEIHNp
emUuIFRoZSBudW1iZXIgb2YgYml0cyBpbiB0aGUgaW5pdGlhbCBBUElDMjBbQXBpY0lkXSB2YWx1
ZQo+IHRoYXQgaW5kaWNhdGUgY29yZSBJRCB3aXRoaW4gYSBwcm9jZXNzb3IuIEEgemVybyB2YWx1
ZSBpbmRpY2F0ZXMgdGhhdAo+IGxlZ2FjeSBtZXRob2RzIG11c3QgYmUgdXNlZCB0byBkZXJpdmUg
dGhlIG1heGltdW0gbnVtYmVyIG9mIGNvcmVzLiBUaGUKPiBzaXplIG9mIHRoaXMgZmllbGQgZGV0
ZXJtaW5lcyB0aGUgbWF4aW11bSBudW1iZXIgb2YgY29yZXMgKE1OQykgdGhhdCB0aGUKPiBwcm9j
ZXNzb3IgY291bGQgdGhlb3JldGljYWxseSBzdXBwb3J0LCBub3QgdGhlIGFjdHVhbCBudW1iZXIg
b2YgY29yZXMKPiB0aGF0IGFyZSBhY3R1YWxseSBpbXBsZW1lbnRlZCBvciBlbmFibGVkIG9uIHRo
ZSBwcm9jZXNzb3IsIGFzIGluZGljYXRlZAo+IGJ5IENQVUlEIEZuODAwMF8wMDA4X0VDWFtOQ10u
Cj4gaWYgKEFwaWNJZENvcmVJZFNpemVbMzowXSA9PSAwKXsKPiDCoCAvLyBVc2VkIGJ5IGxlZ2Fj
eSBkdWFsLWNvcmUvc2luZ2xlLWNvcmUgcHJvY2Vzc29ycwo+IMKgIE1OQyA9IENQVUlEIEZuODAw
MF8wMDA4X0VDWFtOQ10gKyAxOwo+IH0gZWxzZSB7Cj4gwqAgLy8gdXNlIEFwaWNJZENvcmVJZFNp
emVbMzowXSBmaWVsZAo+IMKgIE1OQyA9ICgyIF4gQXBpY0lkQ29yZUlkU2l6ZVszOjBdKTsKPiB9
Cj4gCj4gVGhlIHZhbHVlIHByb2dyYW1tZWQgaW4gMjcwMFggaXMgNCwgb24gMzcwMFggaXQgaXMg
Ny4gU2VlIG15IGR1bXAgaW4KPiBodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL2FyY2hpdmVz
L2h0bWwveGVuLWRldmVsLzIwMTktMDkvbXNnMDIxODkuaHRtbAoKV2hlcmUgd2VyZSB0aGVzZSB2
YWx1ZXMgY29sbGVjdGVkIC0tIG9uIGEgUFYgZG9tMD8gIE9yIGZyb20gd2l0aGluIHRoZQpndWVz
dD8KCkFzIEphbiBwb2ludGVkIG91dCwgd2hhdCBhY3R1YWxseSBoYXBwZW5zIGhlcmUgaXMgdGhh
dCB0aGUgZG9tYWluCmJ1aWxkZXIgYWN0dWFsbHkgYnVtcHMgdGhpcyBudW1iZXIgYnkgMSBmb3Ig
SFZNIGd1ZXN0cyBieSBkZWZhdWx0LiAgU28KaWYgdGhlIHJlYWwgdmFsdWUgaXMgNCwgdGhlbiB0
aGUgZ3Vlc3Qgd2lsbCBzZWUgNTsgaWYgdGhlIHJlYWwgdmFsdWUgaXMKNywgdGhlIGd1ZXN0IHdp
bGwgc2VlIDguCgpBbmR5IHNheXMgdGhhdCB0aGUgbW9kaWZpY2F0aW9ucyBmcm9tIHRoZSBtYW51
YWwgY3B1aWQgc2V0dGluZ3MgaGFwcGVuCiphZnRlciogdGhpcyBhZGp1c3RtZW50OyBzbyB0aGF0
IGJ5IHNldHRpbmcgaXQgdG8gMDEwMCwgeW91IGNoYW5nZSBpdCB0byA0LgoKQ291bGQgeW91IHRy
eSB0aGlzIHdpdGggYDAxMTFgIGluc3RlYWQ/ICBUaGF0IHNob3VsZCBzZXQgaXQgdG8gaXRzCmFj
dHVhbCBoYXJkd2FyZSB2YWx1ZSAoYWx0aG91Z2ggdGhlIG90aGVyICJhZGp1c3RtZW50cyIgd29u
J3QgYmUgbW9kaWZpZWQpLgoKR2l2ZW4gdGhlIGN1cnJlbnQgcHJhY3RpY2FsIGxpbWl0YXRpb25z
IHdpdGggbnVtYmVycyBvZiB2Y3B1cywgSSdkIGJlCnRlbXB0ZWQgdG8gc2F5IHdlIGNvdWxkIGFs
d2F5cyBqdXN0IGxpbWl0IHRoaXMgdmFsdWUgdG8gNy4gIElmIGFmdGVyIGEKbWlncmF0aW9uLCBh
IExpbnV4IGd1ZXN0IHNlZXMgdGhpcyBtb3ZlIGZyb20gOCB0byA3LCBJIHN1c3BlY3QgaXQgd2ls
bApjb3BlIGp1c3QgZmluZS4KCiAtR2VvcmdlCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
