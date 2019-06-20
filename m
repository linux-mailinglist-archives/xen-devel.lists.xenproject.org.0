Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 237834DD9A
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jun 2019 01:05:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1he63m-0007wR-VK; Thu, 20 Jun 2019 23:01:38 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=AtfB=UT=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1he63l-0007wM-RD
 for xen-devel@lists.xenproject.org; Thu, 20 Jun 2019 23:01:37 +0000
X-Inumbo-ID: 5aadd8b3-93af-11e9-8980-bc764e045a96
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 5aadd8b3-93af-11e9-8980-bc764e045a96;
 Thu, 20 Jun 2019 23:01:36 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: C3viVJe8N6VAN/hl38vdHr4xZATIyiKRuTuYNuWu32jGD1i/Wcdrk+oS2PWTe5MHMhSxvSV3XN
 0umT1e2yCMiMYIIhd9T3S2EFEqg8GllIxPUGofe+BWMDBwLRGf3u+jdwWrAQFv70/euqMnKc1E
 CqEZpiHUNmV2wFvQdvTMM5FMCC7MbuYhz9Y/Ef0FilbJ1k1/X2DbLdvP9qfdoSQ3K+3Q+IcOPg
 dI1IWGXHJRbubO4SpbDZZUhH6zJHZ6xBRW4kdoq0wL/4J4ag2PPRyZG3bMY9nXdZyCBtzUX6Ud
 NSY=
X-SBRS: 2.7
X-MesageID: 2033225
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,398,1557201600"; 
   d="scan'208";a="2033225"
To: "Johnson, Ethan" <ejohns48@cs.rochester.edu>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <9b1a4ece-91fa-c3ad-c0f1-f749cf61f5f9@cs.rochester.edu>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <1c7b7a7a-0645-5710-14fe-af90ee6383ef@citrix.com>
Date: Fri, 21 Jun 2019 00:01:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <9b1a4ece-91fa-c3ad-c0f1-f749cf61f5f9@cs.rochester.edu>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] How to compile Xen 4.12 with Clang on Linux?
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

T24gMjAvMDYvMjAxOSAyMzozNywgSm9obnNvbiwgRXRoYW4gd3JvdGU6Cj4gSGkgYWxsLAo+Cj4g
SSdtIHRyeWluZyB0byBjb21waWxlIFhlbiA0LjEyIHdpdGggQ2xhbmcgKHY3LjAuMCkgZm9yIGEg
cmVzZWFyY2ggCj4gcHJvamVjdC4gSSBzZWUgaW4gdGhlIFJFQURNRSBkaXN0cmlidXRlZCB3aXRo
IHRoZSBYZW4gNC4xMiBzb3VyY2UgY29kZSAKPiB0aGF0IENsYW5nL0xMVk0gMy41IGFuZCBuZXdl
ciBhcmUgc3VwcG9ydGVkIGFzIHRoZSBjb21waWxlciBmb3IgYnVpbGRpbmcgCj4gWGVuLiBIb3dl
dmVyLCB3aGVuIEkgYWN0dWFsbHkgdHJ5IGl0LCBpdCBkb2Vzbid0IHdvcmsgLSB0aGUgY29uZmln
dXJlIAo+IHNjcmlwdCBzZWVtcyB0byByZWNvZ25pemUgdGhhdCBJJ3ZlIGluZGljYXRlZCBjbGFu
ZyBhcyB0aGUgcHJlZmVycmVkIAo+IGNvbXBpbGVyLCBidXQgdGhlIGFjdHVhbCAibWFrZSIgc3Rl
cCBzZWVtcyB0byBpZ25vcmUgaXQgYW5kIGlzc3VlIGdjYyAKPiBjb21tYW5kcyBhbnl3YXkuCj4K
PiBJIHRyaWVkIGEgZmV3IGRpZmZlcmVudCBjb21tYW5kIGxpbmUgaW52b2NhdGlvbnMsIGFsbCB3
aXRoIHRoZSBzYW1lIAo+IHJlc3VsdCAobm90ZTogbXkgY2xhbmcgaXMgaW5zdGFsbGVkIGZyb20g
dGhlIFVidW50dSAxOC4wNCByZXBvc2l0b3JpZXMgCj4gYXMgImNsYW5nLTciIGFuZCAiY2xhbmcr
Ky03IiByZXNwZWN0aXZlbHkpOgo+Cj4gW0F0dGVtcHQgIzE6XQo+IENDPWNsYW5nLTcgQ1hYPWNs
YW5nKystNyAuL2NvbmZpZ3VyZSAtLWVuYWJsZS1zeXN0ZW1kCj4gbWFrZSAtajI0IHdvcmxkCj4K
PiBbQXR0ZW1wdCAjMjpdCj4gLi9jb25maWd1cmUgLS1lbmFibGUtc3lzdGVtZCBDQz1jbGFuZy03
IENYWD1jbGFuZysrLTcKPiBtYWtlIC1qMjQgd29ybGQKPgo+IFtBdHRlbXB0ICMzOl0KPiBleHBv
cnQgQ0M9Y2xhbmctNwo+IGV4cG9ydCBDWFg9Y2xhbmcrKy03Cj4gbWFrZSAtajI0IHdvcmxkCgpY
ZW4gaXRzZWxmIGRvZXNuJ3QgdXNlIGF1dG9jb25mLCBhbmQgbmVlZHMgYSBiaXQgb2YgZXh0cmEg
aGVscCBnZXR0aW5nCml0cyBvcHRpb25zIGluIG9yZGVyLsKgIFRoZXJlIGlzIGFuIGV4dHJhIGNs
YW5nPXkgdmFyaWFibGUgd2hpY2ggeW91IG5lZWQKdG8gcGFzcy4KCnhlbi5naXQkIG1ha2UgLUMg
eGVuLyBDQz1jbGFuZy03IGNsYW5nPXkKCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
