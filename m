Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3BA71140D0
	for <lists+xen-devel@lfdr.de>; Thu,  5 Dec 2019 13:29:06 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1icqDj-0007XM-NX; Thu, 05 Dec 2019 12:26:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=MeZc=Z3=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1icqDi-0007XH-DS
 for xen-devel@lists.xenproject.org; Thu, 05 Dec 2019 12:26:58 +0000
X-Inumbo-ID: 86bc5082-175a-11ea-8223-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 86bc5082-175a-11ea-8223-12813bfff9fa;
 Thu, 05 Dec 2019 12:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1575548816;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=/i3Zn8TloUDvx8LMKCuJ8/raFxByMKbqz5xBm/tHOHE=;
 b=KYJBrf+NwrUj0yTw40TqXORBhcoropHJ6Ee417EOzoI4dZtbjZbaY+5r
 0WDdzWDEQ9Hd/FW4rsgTvzKIXOqo2tIqFpxrFaLNmaiBgSd/2TjYXUNq+
 tSTj34f8zow9Xp2pQsShhtlxyw+s3vWvUmu134+pYq3Mb6TqQV67wdDU/ 4=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=igor.druzhinin@citrix.com;
 spf=Pass smtp.mailfrom=igor.druzhinin@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 igor.druzhinin@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 igor.druzhinin@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
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
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: bi94sRUCHMxBpICbjdq1ZtTIq2Dnpaa5ispYNEEhPATjnVA4HjT2r8K8bkk+F0fSL8KgiIorB4
 u6WnRsUpXkVsMcxWmPrN7mENHDJI1TVvbrlPfdOzSOgjL+F2seFe9F/WunF7/B9s6jVn2GQJ2W
 g4aL31+pxW8ddC55wEfw70LYpJfbCPMCop5xWliWudBASJRRXqbdJ/QjlI9JhHbkz4A0PxkSmX
 1McF1uPYsjuFIofE4G4IH6F99lMtTrcr4n+r4yeRBSXKSRdoyLSF5Wy8RIIwVWtuWJdizj7fiq
 kMc=
X-SBRS: 2.7
X-MesageID: 9652350
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,281,1571716800"; 
   d="scan'208";a="9652350"
To: "Durrant, Paul" <pdurrant@amazon.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <1575548022-14213-1-git-send-email-igor.druzhinin@citrix.com>
 <79c733c0762347e7b18b148de8ec83b8@EX13D32EUC003.ant.amazon.com>
From: Igor Druzhinin <igor.druzhinin@citrix.com>
Message-ID: <0eebdc22-175e-0760-4058-b4b0dd2ae94a@citrix.com>
Date: Thu, 5 Dec 2019 12:26:53 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <79c733c0762347e7b18b148de8ec83b8@EX13D32EUC003.ant.amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] passthrough: drop break statement
 following c/s cd7dedad820
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
Cc: "linux@eikelenboom.it" <linux@eikelenboom.it>,
 "jbeulich@suse.com" <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDUvMTIvMjAxOSAxMjoyMCwgRHVycmFudCwgUGF1bCB3cm90ZToKPj4gLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0KPj4gRnJvbTogSWdvciBEcnV6aGluaW4gPGlnb3IuZHJ1emhpbmluQGNp
dHJpeC5jb20+Cj4+IFNlbnQ6IDA1IERlY2VtYmVyIDIwMTkgMTI6MTQKPj4gVG86IHhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwo+PiBDYzogamJldWxpY2hAc3VzZS5jb207IGxpbnV4QGVp
a2VsZW5ib29tLml0OyBEdXJyYW50LCBQYXVsCj4+IDxwZHVycmFudEBhbWF6b24uY29tPjsgSWdv
ciBEcnV6aGluaW4gPGlnb3IuZHJ1emhpbmluQGNpdHJpeC5jb20+Cj4+IFN1YmplY3Q6IFtQQVRD
SCB2Ml0gcGFzc3Rocm91Z2g6IGRyb3AgYnJlYWsgc3RhdGVtZW50IGZvbGxvd2luZyBjL3MKPj4g
Y2Q3ZGVkYWQ4MjAKPj4KPj4gVGhlIGxvY2tpbmcgcmVzcG9uc2liaWxpdGllcyBoYXZlIGNoYW5n
ZWQgYW5kIGEgcHJlbWF0dXJlIGJyZWFrIGluCj4+IHRoaXMgc2VjdGlvbiBub3cgY2F1c2VzIHRo
ZSBmb2xsb3dpbmcgYXNzZXJ0aW9uOgo+Pgo+PiBBc3NlcnRpb24gJyFwcmVlbXB0X2NvdW50KCkn
IGZhaWxlZCBhdCBwcmVlbXB0LmM6MzYKPj4KPj4gU3VnZ2VzdGVkLWJ5OiBQYXVsIER1cnJhbnQg
PHBkdXJyYW50QGFtYXpvbi5jb20+Cj4gCj4gQWN0dWFsbHksIGl0IHdhcyBzdWdnZXN0ZWQgYnkg
SmFuLCBidXQgeW91IGNhbiBwdXQgbXkgUi1iIG9uIHRoZSBwYXRjaC4KPiAKCk9oLCBpbmRlZWQg
OikgUGxlYXNlIGZpeCB1cCB3aGlsZSBjb21taXR0aW5nIGFzIHlvdSB3aXNoLgoKSWdvcgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
