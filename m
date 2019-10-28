Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15730E7040
	for <lists+xen-devel@lfdr.de>; Mon, 28 Oct 2019 12:21:06 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iP32S-0003zJ-1e; Mon, 28 Oct 2019 11:18:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=qotU=YV=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iP32R-0003zE-6M
 for xen-devel@lists.xenproject.org; Mon, 28 Oct 2019 11:18:19 +0000
X-Inumbo-ID: a4348085-f974-11e9-94f3-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a4348085-f974-11e9-94f3-12813bfff9fa;
 Mon, 28 Oct 2019 11:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1572261498;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=65n3RdifuN0kWX0a4Al4foyRgZDa6T5vf6bYTVhchPk=;
 b=WMBfL+pS5fgeojQ4EdEvDqAE3ZA3GMQCl+n198wubbGEaOn6hmT65n2p
 5gpKzv8fdyylYFEo2c68rIJN3ffMbOfyMOuO/Wv6KkFZEEvChRn5OVqnD
 vkLRQpIthGZjB34NFh0dVWlgO7jP+jMFXE26nTsvCUCPcMptOyWCqIjqy o=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: eKLi80ZYJrUOESIXZC3Pw5qG5GAlDqIK9UtO4JCB5AYIV4RIk2tHDBPRSA5PK2KjcUB2jD6J24
 qJKTmnn1xlAWkyj14FjiTdNFChURXGlvIyzsD46k+Lu9nsYZFBcWA6XRWfp/02RQdqPiF0DUgg
 hk3tR/ndG5KAtX8Ne7iNs2sDoyf1G4HmHBaVF5bfwNrv449Jp44ghlD2YNbgCPbbVg+6VW050G
 PCXl0JMgNjMqxBhp/+4luTb2W6YNMb5yHxkXf0yqQzsKzrYR0hUmJ/x2KPpewTel1K8x+wBIIR
 7lg=
X-SBRS: 2.7
X-MesageID: 7812026
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,239,1569297600"; 
   d="scan'208";a="7812026"
To: Jan Beulich <jbeulich@suse.com>
References: <1571918276.2606.0@crc.id.au>
 <f5bb6057-7d01-92ad-9ab5-45f4b5bf57a5@citrix.com>
 <7333496f-48e7-c659-5314-54feffde0273@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <15969ed4-55ab-0a18-3b63-30cc3c266a47@citrix.com>
Date: Mon, 28 Oct 2019 11:18:13 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <7333496f-48e7-c659-5314-54feffde0273@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] Debugging Windows HVM crashes on Ryzen 3xxx series
 CPUs.
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
Cc: Juergen Gross <JGross@suse.com>, Wei Liu <wei.liu2@citrix.com>,
 Lars Kurth <lars.kurth@citrix.com>, Steven Haigh <netwiz@crc.id.au>,
 Paul Durrant <paul@xen.org>, xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjgvMTAvMjAxOSAwOToyMSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMjUuMTAuMjAxOSAx
OTowMSwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gT24gMjQvMTAvMjAxOSAxMjo1NywgU3RldmVu
IEhhaWdoIHdyb3RlOgo+Pj4gSGkgYWxsLAo+Pj4KPj4+IEkndmUgbWFuYWdlZCB0byBnZXQgdGhl
IGdpdCBtYXN0ZXIgdmVyc2lvbiBvZiBYZW4gb24gdGhpcyBhZmZlY3RlZAo+Pj4gc3lzdGVtIGFu
ZCB0cmllcyB0byBib290IGEgV2luZG93cyBTZXJ2ZXIgMjAxNiBzeXN0ZW0uIEl0IGNyYXNoZXMg
YXMKPj4+IHBlciBub3JtYWwuCj4+Pgo+Pj4gSSBtYW5hZ2VkIHRvIGdldCB0aGVzZSBsb2dzLCBi
dXQgSSdtIG5vdCBxdWl0ZSBzdXJlIHdoYXQgZWxzZSB0byBkbyB0bwo+Pj4gZGVidWcgdGhpcyBp
c3N1ZSBmdXJ0aGVyLgo+PiBBZnRlciBhIGNvbGxhYm9yYXRpdmUgZGVidWdnaW5nIHNlc3Npb24g
b24gSVJDLCB3ZSd2ZSBpZGVudGlmaWVkIHRoZQo+PiBwcm9ibGVtLsKgIEhlcmUgaXMgYSBzdW1t
YXJ5Lgo+Pgo+PiBodHRwczovL3d3dy5yZWRkaXQuY29tL3IvQW1kL2NvbW1lbnRzL2NrcjVmNC9h
bWRfcnl6ZW5fMzAwMF9zZXJpZXNfbGludXhfc3VwcG9ydF9hbmQvCj4+IGlzIGNvbmNlcm5pbmcg
S1ZNLCBidXQgaXQgaWRlbnRpZmllZCB0aGF0IHRoZSBUT1BPRVhUIGZlYXR1cmUgd2FzCj4+IGlt
cG9ydGFudCB0byBnZXR0aW5nIHdpbmRvd3MgdG8gYm9vdC4KPj4KPj4gWGVuIGRvZXNuJ3QgY3Vy
cmVudGx5IG9mZmVyIFRPUE9FWFQgdG8gZ3Vlc3RzIGF0IGFsbC7CoCBGaXhpbmcgdGhpcyBpcyBv
bgo+PiB0aGUgVE9ETyBsaXN0IGFsb25nIHdpdGggdGhlIHJlc3Qgb2YgdGhlIHRvcG9sb2d5IHJl
cHJlc2VudGF0aW9uIHN3YW1wLgo+Pgo+PiBPbiBhIGh1bmNoLCBJIG9mZmVyZWQgdXAgYSBYZW5T
ZXJ2ZXIgcGF0Y2ggd2hpY2ggd2UgYXJlIHN0aWxsIHVzaW5nLCBpbgo+PiBsaWV1IG9mIGZpeGlu
ZyB0b3BvbG9neSBwcm9wZXJseS7CoCBJdCBpcyBsb2dpY2FsbHkgYSByZXZlcnQgb2YKPj4gY2Ey
ZWVlOTJkZjQ0IGFzIHRoYXQgY2hhbmdlIHdhc24ndCBtaWdyYXRpb24gc2FmZS4KPiBXb3VsZCB5
b3UgbWluZCBoZWxwaW5nIG1lIHVuZGVyc3RhbmQgaG93IHRoaXMgcmV2ZXJ0IG1hdGNoZXMgdXAg
d2l0aAo+IHlvdSBzYXlpbmcgYWJvdmUgdGhhdCBUT1BPRVhUIGlzIG5lZWRlZCBmb3IgV2luZG93
cyB0byBib290IGhlcmU/IEkKPiBkb24ndCB0aGluayBJIGNhbiBjb25jbHVkZSBhbnl0aGluZyBp
biB0aGlzIGRpcmVjdGlvbiBmcm9tIHRoZSBhcnRpY2xlCj4geW91J3ZlIHByb3ZpZGVkIHRoZSBs
aW5rIG9mLgoKVE9QT0VYVCBnYXZlIGEgY2xlYXIgaGludCB0aGF0IGl0IHdhcyB0b3BvbG9neSBi
YXNlZCwgYnV0IGJleW9uZCB0aGF0LAppdHMgbm90IG5vIHNwZWNpZmljIGNvbm5lY3RlZC4KClRo
ZSByZXZlcnQgY2xlYXJzIEhUVCB3aGljaCBpcyBhIGtleSBmYWN0b3IgaW4gQU1EJ3MgYWxnb3Jp
dGhtIG9mICJob3cKdG8gY2FsY3VsYXRlIHRvcG9sb2d5Ii4KCj4KPj4gV2l0aCB0aGlzIHBhdGNo
IGluIHBsYWNlLCB3aW5kb3dzIHdvcmtzIGZpbmUuwqAgSG93ZXZlciwgSSBkb24ndCB0aGluawo+
PiB0aGUgcGF0Y2ggaXMgYXBwcm9wcmlhdGUgdG8gdGFrZSBpbnRvIDQuMTMuCj4+Cj4+IEZ1cnRo
ZXJtb3JlLCB0aGVyZSBpcyBubyBjaGFuY2Ugb2YgZ2V0dGluZyB0aGUgdG9wb2xvZ3kgd29yayBz
b3J0ZWQgaW4KPj4gdGhlIHJlbWFpbmluZyA0LjEzIHRpbWVmcmFtZS4KPj4KPj4gSSdtIGF0IGEg
bG9zcyBmb3IgaWRlYXMsIG90aGVyIHRoYW4gcmVsZWFzZSBub3RlIGl0IGFzIGJyb2tlbiBhbmQg
bWFrZQo+PiBmaXhpbmcgaXQgYSBibG9ja2VyIGZvciA0LjE0Lgo+IFdvdWxkIG1ha2luZyBjb25k
aXRpb25hbCB0aGUgY3VycmVudGx5IHVuY29uZGl0aW9uYWwgc2V0dGluZyBvZiBIVCBpbgo+IHRo
ZSBndWVzdCBDUFVJRCB2aWV3IHRvZ2V0aGVyIHdpdGggdGhlIGRvdWJsaW5nIG9mIGNlcnRhaW4g
b3RoZXIgZmllbGRzJwo+IHZhbHVlcyBwZXJoYXBzIHNpbWlsYXJseSBoZWxwPwoKTWFraW5nIHRo
YXQgZW50aXJlIGJsb2NrIGJlIGNvbmRpdGlvbmFsIGlzIHByb2JhYmx5IG9rLCBidXQgSSBjYW4n
dAp0aGluayBvZiBhIHdheSBvZiBkb2luZyBzYWZlbHkgZG9pbmcgdGhpcy7CoCBXZSBkZWZpbml0
ZWx5IGRvbid0IHdhbnQgdG8KcHV0IHNvbWV0aGluZyBsaWtlIHRoaXMgaW50byB0aGUgbGlieGwg
YXBpLCBzZWVpbmcgYXMgaXQgaXMgZXhwZWN0ZWQgdG8KYmUgb2Jzb2xldGVkIGluIHRoZSBuZWFy
IGZ1dHVyZS4KCk9uZSBvcHRpb24gd2hpY2ggd2FzIGV4cGVyaW1lbnRlZCB3aXRoIHdhcyBjbGVh
cmluZyBIVFQgdXNpbmcgdGhlIGNwdWlkPQpjb250cm9sLCBidXQgdGhhdCBkaWRuJ3Qgd29yay7C
oCBJIHRoaW5rIGEgdXNlciBIVFQgc2V0dGluZyBnZXRzCmNsb2JiZXJlZCBieSB0aGUgbGF0ZXIg
Q1BVSUQgbG9naWMuwqAgUGVyaGFwcyB0aGF0IGlzIHNvbWV0aGluZyB3ZSBjb3VsZApib2RnZSBp
biBhIGxlc3MgYmFkIHdheS4KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
