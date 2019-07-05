Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C08260664
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jul 2019 15:14:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hjNzw-00038u-9o; Fri, 05 Jul 2019 13:11:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8qSs=VC=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hjNzu-00038p-JW
 for xen-devel@lists.xenproject.org; Fri, 05 Jul 2019 13:11:30 +0000
X-Inumbo-ID: 668463ba-9f26-11e9-879c-9f42171911cb
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 668463ba-9f26-11e9-879c-9f42171911cb;
 Fri, 05 Jul 2019 13:11:29 +0000 (UTC)
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Fo6CgeTwtDZ6jq2v6nsmbyevDz/GtGmgMDBT8V75JeZFMsGnkrkKVtA40ctvGy1Vm2pptPNIlC
 wxobX4Q+ZW3qgGN1HJca7VyspW5mMuCx2ZzjLZOSELb4JFi8wOBRyKSXCb0Bxqivv8agnLeOzq
 JkQvv93uQ6Tx+Pq9/M3LN1JklX1VP0D7f0Qy339YYGu4EbmJYWmb115BJrWfvS/4Yi7pKLmecT
 435ld2g1IEb05Shg5DsYMFTYCEX7r+03f+pS++Xf6vlnWSNxqa6axljhrP7oz9Lc5SQBlvAd1l
 buk=
X-SBRS: 2.7
X-MesageID: 2652753
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,455,1557201600"; 
   d="scan'208";a="2652753"
To: Paul Durrant <Paul.Durrant@citrix.com>, 'Juergen Gross' <jgross@suse.com>, 
 Jan Beulich <JBeulich@suse.com>, Anthony Perard <anthony.perard@citrix.com>
References: <20190704151522.32639-1-anthony.perard@citrix.com>
 <11258d51-03b7-05ad-e94c-e7dde56d39ee@suse.com>
 <c2a91602902b4c9294a12c4994a3663a@AMSPEX02CL03.citrite.net>
 <5c3268fd-bd69-f490-ef12-01a8c9cd4369@suse.com>
 <75a7ebcf-5265-5ad5-b8c3-107caf4a1f91@suse.com>
 <3eabb798d11e4bc086e9c4f231f79d32@AMSPEX02CL03.citrite.net>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <abf345ac-6518-7ce5-b7b9-4cdb81158b96@citrix.com>
Date: Fri, 5 Jul 2019 14:11:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <3eabb798d11e4bc086e9c4f231f79d32@AMSPEX02CL03.citrite.net>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH] include/public/io/ring.h: Remove xen_mb,
 xen_rmb, xen_wmb macros
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
 KonradRzeszutek Wilk <konrad.wilk@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDUvMDcvMjAxOSAxMzoxMywgUGF1bCBEdXJyYW50IHdyb3RlOgo+PiAtLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQo+IFtzbmlwXQo+PiBJJ20gY29tcGxldGVseSBvbiBKYW4ncyBzaWRlIGhl
cmUuCj4+Cj4+IFdoYXQgd291bGQgYmUgcG9zc2libGUgcGVyaGFwcyBpcyB0byBzcGxpdCByaW5n
LmggaW50byB0d28gaGVhZGVyczogYQo+PiBuZXcgb25lIHdpdGggdGhlIHB1cmUgcmluZyBkZWZp
bml0aW9ucyBhbmQgcmluZy5oICNpbmNsdWRlLWluZwo+PiB4ZW4tY29tcGF0LmggYW5kIHRoZSBu
ZXcgaGVhZGVyIGFuZCAjZGVmaW5lLWluZyB0aGUgeGVuKm1iKCkgbWFjcm9zLgo+Pgo+PiBOb3Qg
c3VyZSB0aGlzIHdvdWxkIGJlIHdvcnRoIGl0LCB0aG91Z2guCj4+Cj4gT2suIFByb2JhYmx5IG5v
dCB3b3J0aCBpdCwgYXMgeW91IHNheS4gSWYgd2UgZG9uJ3QgZmVlbCBjb21mb3J0YWJsZSByZW1v
dmUgb2xkIGNydWZ0IGxpa2UgdGhlc2UgdGhlbiBwcm9qZWN0cyBpbXBvcnRpbmcgdGhlIGhlYWRl
cnMgd2lsbCBqdXN0IGhhdmUgdG8gaGFjayBpdCBvciBsaXZlIHdpdGggaW1wb3J0aW5nIHhlbi1j
b21wYXQgdG9vLiBBbnRob255IGFscmVhZHkgc3VibWl0dGVkIGEgcGF0Y2ggZG9pbmcgdGhlIGZv
cm1lciBmb3IgUUVNVS4KCkxvb2suCgpFaXRoZXIgd2UgZXhwZWN0IHBlb3BsZSB0byBjb3B5IHRo
ZSBoZWFkZXJzLCBvciB3ZSBleHBlY3QgdG8gaGF2ZSBhCnNpbmdsZSBjYW5vbmljYWwgY29weSB3
aGljaCBpcyB1cCB0byBkYXRlIGFuZCBhbHdheXMgYmFja3dhcmRzIGNvbXBhdGlibGUuCgpBbGwg
ZG9jdW1lbnRhdGlvbiBzYXlzICJ0YWtlIGEgY29weSBvZiB0aGUgaGVhZGVycyIsIGFuZCBJIGhh
dmUgbmV2ZXIKc2VlbiBhbnl0aGluZywgZXhjZXB0IHRoZSByYXRoZXIgd2VpcmQgMi42LjE4IGRy
aXZlciBwb3J0IGluIHRyZWUsIHVzZQp0aGUgaGVhZGVycyB2ZXJiYXRpbS4KClRoZXNlIGhlYWRl
cnMgZGVzY3JpYmUgYW4gQUJJLCBub3QgYW4gQVBJLsKgIFN1cmUgLSB0aGUgQVBJIGlzIGJ5CmNv
bnZlbnRpb24gYnV0IGJ5IHRoZSB0aW1lIHBlb3BsZSBoYXZlIHRha2VuIGEgY29weSwgdGhleSBy
ZWFsbHkgYXJlCmZyZWUgdG8gbWFrZSBtb2RpZmljYXRpb25zIGFzIHRoZXkgc2VlIGZpdCwgYXMg
bG9uZyBhcyB0aGV5IGRvbid0IGNoYW5nZQp0aGUgQUJJLgoKSW5zaXN0aW5nIHRoYXQgZXZlcnlv
bmUgdGFrZSBhIGNvcHksICphbmQqIG1haW50YWluaW5nIEFQSSBjb21wYXRpYmlsaXR5CmZvciBv
YnNvbGV0ZSBjcnVmdCBpcyBhbiBleGVyY2lzZSBpbiBzZWxmLWZsYWdpbGF0aW9uLgoKR2l2ZW4g
dGhlcmUgYXJlIHplcm8gY3VycmVudCBjb25zdW1lcnMgdGhhdCB3ZSBrbm93IG9mIHVzaW5nIHRo
ZSBoZWFkZXJzCmluIGEgdmVyYmF0aW0gd2F5LCBhbmQgYWxsIHdlJ3JlIHRhbGtpbmcgYWJvdXQg
aXMgc29tZSBwaWVjZXMgd2hpY2jCoApyZWFsbHkgc2hvdWxkIG5ldmVyIGhhdmUgYmVlbiBwcmVz
ZW50IGluIHRoZSBmaXJzdCBwbGFjZSwgSSB0aGluayBpdHMKZW50aXJlbHkgcmVhc29uYWJsZSB0
byBtYWtlIHNvbWUgY2hhbmdlcyBhbmQgcmVsZWFzZSBub3RlIHRoZW0uCgpYZW4gNC4xMyByZWxl
YXNlOgrCoC4uLgrCoCogU29tZSBvYnNvbGV0ZSB3YXJ0cyBpbiB0aGUgcHVibGljIGhlYWRlcnMg
aGF2ZSBiZWVuIGRyb3BwZWQuwqAgUGVvcGxlCnN5bmNpbmcgdG8gdGhpcyB2ZXJzaW9uIHNob3Vs
ZCBiZSBhd2FyZSBvZjoKwqDCoCAxKSAuLi4KwqDCoCAyKSAuLi4KCk5vdGhpbmcgaGVyZSBpcyBy
b2NrZXQgc2NpZW5jZSwgaXMgaXQ/Cgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
