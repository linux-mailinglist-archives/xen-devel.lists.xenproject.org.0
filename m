Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B2845B757
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jul 2019 10:58:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hhs6w-00055n-2t; Mon, 01 Jul 2019 08:56:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=USDK=U6=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hhs6u-00055a-B5
 for xen-devel@lists.xenproject.org; Mon, 01 Jul 2019 08:56:28 +0000
X-Inumbo-ID: 19acf91c-9bde-11e9-aa65-53544454231f
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 19acf91c-9bde-11e9-aa65-53544454231f;
 Mon, 01 Jul 2019 08:56:23 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 1XXyDOSA4Di7BlyL53TJS1F4HTduTtHx9Cdg+lUiULw5dBfvAwpByS8b9ffIOnpb9ceZySbXLB
 7r5adllq/6Vj6kkG/Vt6PWj8ZXHFCUzu3sDB/pYvVkTzHvpxcS3WLLTs3w85+kmWX0Wv6THr5i
 zrCAq4TUmzPMfX55NgEMEBmXXvvW4JhKCJZWpZTPKfFImbxS/M+I/ebhecIMiWrOazLEOeaLAV
 dNcGeMAWQzPpltfcB7RUbr3+im7iBNzrsyoodPUpEEzENAknzmY2/YdmWDeJ2zaFlJKiT696hP
 lxs=
X-SBRS: 2.7
X-MesageID: 2450367
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,438,1557201600"; 
   d="scan'208";a="2450367"
To: Petre Ovidiu PIRCALABU <ppircalabu@bitdefender.com>, Paul Durrant
 <Paul.Durrant@citrix.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <19d3bbfa82ffe542367c676d83db65e37d013544.camel@bitdefender.com>
 <e277e40ad1c54b209a6f6107cbfaf5a0@AMSPEX02CL03.citrite.net>
 <527abac0d7a9a25bb69c7af30afa8ab209c90737.camel@bitdefender.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <f753b819-d5eb-f627-3520-38c36e6d48d2@citrix.com>
Date: Mon, 1 Jul 2019 09:56:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <527abac0d7a9a25bb69c7af30afa8ab209c90737.camel@bitdefender.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] vfree crash
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
Cc: Alexandru Stefan ISAILA <aisaila@bitdefender.com>,
 "rcojocaru@bitdefender.com" <rcojocaru@bitdefender.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDEvMDcvMjAxOSAwOTo0NSwgUGV0cmUgT3ZpZGl1IFBJUkNBTEFCVSB3cm90ZToKPiBPbiBN
b24sIDIwMTktMDctMDEgYXQgMDg6MjkgKzAwMDAsIFBhdWwgRHVycmFudCB3cm90ZToKPj4+IC0t
LS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4+PiBGcm9tOiBYZW4tZGV2ZWwgPHhlbi1kZXZlbC1i
b3VuY2VzQGxpc3RzLnhlbnByb2plY3Qub3JnPiBPbiBCZWhhbGYKPj4+IE9mIFBldHJlIE92aWRp
dSBQSVJDQUxBQlUKPj4+IFNlbnQ6IDI4IEp1bmUgMjAxOSAxOTowMAo+Pj4gVG86IHhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZzsgQW5kcmV3IENvb3BlciA8Cj4+PiBBbmRyZXcuQ29vcGVy
M0BjaXRyaXguY29tPgo+Pj4gQ2M6IEFsZXhhbmRydSBTdGVmYW4gSVNBSUxBIDxhaXNhaWxhQGJp
dGRlZmVuZGVyLmNvbT47IAo+Pj4gcmNvam9jYXJ1QGJpdGRlZmVuZGVyLmNvbQo+Pj4gU3ViamVj
dDogW1hlbi1kZXZlbF0gdmZyZWUgY3Jhc2gKPj4+Cj4+PiBIZWxsbywKPj4+Cj4+PiBJIG5lZWQg
eW91ciBoZWxwIHRvIHBpbnBvaW50IHRoZSByb290IGNhdXNlIG9mIGEgcHJvYmxlbS4gVG8gbXkK
Pj4+IHVuZGVyc3RhbmRpbmcgdmZyZWUgc2hvdWxkIGJlIHVzZWQgd2hlbiBhbGxvY2F0aW5nIG1l
bW9yeSB3aXRoCj4+PiB2bWFsbG9jLgo+Pj4KPj4+IEJ1dCwgSSBoYXZlIHRoZSBmb2xsb3dpbmcg
c2NlbmFyaW8gd2hpY2ggcmVzdWx0cyBpbiBhIFhFTiBjcmFzaDoKPj4+IC0gYWxsb2NhdGUgYSBu
dW1iZXIgb2YgZnJhbWVzIHVzaW5nIHZtYWxsb2MgKHZ6YWxsb2MpIChlLmcuIHVzaW5nIGEKPj4+
IGRvbWN0bCkgYW5kIGFzc2lnbiB0aGVtIHRvIHRoZSBjYWxsaW5nIGRvbWFpbgo+Pj4gLSBtYXAg
dGhlIGZyYW1lcyB1c2luZyB4ZW5mb3JlaWdubWVtb3J5X21hcF9yZXNvdXJjZQo+PiBEbyB5b3Ug
cmVhbGx5IG1lYW4geGVuZm9yZWlnbm1lbW9yeV9tYXBfcmVzb3VyY2UoKT8gSWYgdGhlIG1lbW9y
eSBpcwo+PiBhc3NpZ25lZCB0byB0aGUgY2FsbGluZyBkb21haW4gdGhlbiB0aGlzIGlzIHF1aXRl
IGxpa2VseSBub3QgdG8gd29yay4KPj4gVGhlcmUgd2VyZSByZWZlcmVuY2UgY291bnRpbmcgcHJv
YmxlbXMgd2l0aCB0aGF0IGNvZGUsIHdoaWNoIGlzIHdoeQo+PiBjYWxsZXIgYXNzaWduZWQgcmVz
b3VyY2VzIHdlcmUgZHJvcHBlZC4KPj4KPj4gICBQYXVsCj4+Cj4gVGhlIHByb2JsZW0gbGllcyB3
aXRoIHZmcmVlIGJlY2F1c2UgaXQgY3JlYXRlcyBhIG5ldyBsaXN0IHdpdGggdGhlCj4gcGFnZXMs
IHVubWFwcyB0aGUgdmEgcG9pbnRlciBhbmQgdGhlbiBmcmVlcyB0aGUgcGFnZXMuIElmIEkgZG8g
dGhlc2UKPiBzdGVwcyBtYW51YWxseSAod2l0aG91dCBhZGRpbmcgdGhlbSB0byBhIG5ldyBsaXN0
KSBpdCB3b3Jrcy4KClRoZSBwcm9ibGVtIGhlcmUgaXMgdGhhdCBzdHJ1Y3QgcGFnZV9pbmZvIG9u
bHkgaGFzIGEgc2luZ2xlIGxpbmtlZCBsaXN0CnBvaW50ZXIsIGFuZCB2ZnJlZSgpIGJsaW5kbHkg
YXNzdW1lcyBpdCBpcyBhdmFpbGFibGUgZm9yIHVzZSwgd2hpY2gKaXNuJ3QgdHJ1ZSBvbmNlIHlv
dSd2ZSBjYWxsZWQgYXNzaWduX3BhZ2VzKCkgb24gdGhlIHZtYXAgYXJlYS4KCkF0IHRoZSBtb21l
bnQsIGl0IGRvZXNuJ3QgbG9vayBsaWtlIGl0IGlzIHBvc3NpYmxlIHRvIHNldCB2KmFsbG9jKCkn
ZApwYWdlcyB1cCBzdWl0YWJseSB0byBiZSBtYXBwZWQgYnkgYSBndWVzdC7CoCAoU2ltaWxhciBj
b3JydXB0aW9uIHdpbGwKb2NjdXIgdmlhIHNoYXJlX3hlbl9wYWdlX3dpdGhfZ3Vlc3QoKSBhbmQg
dGhlIHhlbmhlYXAgbGlzdCkuCgpUaGlzIGlzIG9idmlvdXNseSBzb21ldGhpbmcgd2hpY2ggd2Fu
dHMgZml4aW5nLCBidXQgaXRzIG5vdCBpbW1lZGlhdGVseQpvYnZpb3VzIGhvdy4KCn5BbmRyZXcK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
