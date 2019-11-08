Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6567F4515
	for <lists+xen-devel@lfdr.de>; Fri,  8 Nov 2019 11:56:05 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iT1t3-00070P-Ia; Fri, 08 Nov 2019 10:53:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5eKS=ZA=citrix.com=ross.lagerwall@srs-us1.protection.inumbo.net>)
 id 1iT1t1-00070K-Oq
 for xen-devel@lists.xenproject.org; Fri, 08 Nov 2019 10:53:03 +0000
X-Inumbo-ID: ef953cc2-0215-11ea-9631-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ef953cc2-0215-11ea-9631-bc764e2007e4;
 Fri, 08 Nov 2019 10:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1573210383;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=Eehi9inlwYuOZGF5XXteVkc2bjavzrdWa/l91Bcdor0=;
 b=RM05UMfRTro4WTHP8v6ZXPPx4pkPJympLD/EpWcPnMev4uiSprSk0J3I
 j5o9ylsArDvpQX72/VQHyUeAx2KjZmyALcLsTdIv5svioovNa7CLYbPt1
 NmdTS5dVTPhs/SI45UCNyfxdVZ+V0zOmoyJ3hLtch3Iwidp19E97LVd+e A=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ross.lagerwall@citrix.com;
 spf=Pass smtp.mailfrom=ross.lagerwall@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ross.lagerwall@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="ross.lagerwall@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 ross.lagerwall@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="ross.lagerwall@citrix.com";
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
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: XSyhDXcP2bFzogB6b1WuelL4RBAjZOmLH0exAcMGAMQa8EwFwk2OV5VJhCdqTM6CjOurboPYdu
 igrrojMhSkujENtxPo/jShV2iYLCE0S1uizJG95Hr+iTxJSXK4xHX1ryI8GlUNNKm39+c3Njlr
 RRlxwfRa0sRuZFvwIQyg5L9dgjftIluQWDu5uJchWlaqyEYxLXgDhqyDGN5pdFGqR2q5qw27Z+
 zeBHap2nvIC44yZyO3jdzR/z1H+RrcRn2o14wy6Sh1uAPJRAZQwXWaOnBfkcsQM0rmoClAwJEo
 eLE=
X-SBRS: 2.7
X-MesageID: 8458095
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,281,1569297600"; 
   d="scan'208";a="8458095"
To: Pawel Wieczorkiewicz <wipawel@amazon.de>, <xen-devel@lists.xenproject.org>
References: <20190928151305.127380-1-wipawel@amazon.de>
 <20190928151305.127380-8-wipawel@amazon.de>
From: Ross Lagerwall <ross.lagerwall@citrix.com>
Message-ID: <ff21c1a9-5fa9-09a9-c3fb-ccd78ec1695f@citrix.com>
Date: Fri, 8 Nov 2019 10:52:59 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190928151305.127380-8-wipawel@amazon.de>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4 07/12] livepatch: Add per-function
 applied/reverted state tracking marker
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
Cc: wipawel@amazon.com, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, mpohlack@amazon.com,
 Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gOS8yOC8xOSA0OjEzIFBNLCBQYXdlbCBXaWVjem9ya2lld2ljeiB3cm90ZToKPiBMaXZlcGF0
Y2ggb25seSB0cmFja3MgYW4gZW50aXJlIHBheWxvYWQgYXBwbGllZC9yZXZlcnRlZCBzdGF0ZS4g
QnV0LAo+IHdpdGggYW4gb3B0aW9uIHRvIHN1cHBseSB0aGUgYXBwbHlfcGF5bG9hZCgpIGFuZC9v
ciByZXZlcnRfcGF5bG9hZCgpCj4gZnVuY3Rpb25zIGFzIG9wdGlvbmFsIGhvb2tzLCBpdCBiZWNv
bWVzIHBvc3NpYmxlIHRvIGludGVybWl4IHRoZQo+IGV4ZWN1dGlvbiBvZiB0aGUgb3JpZ2luYWwg
YXBwbHlfcGF5bG9hZCgpL3JldmVydF9wYXlsb2FkKCkgZnVuY3Rpb25zCj4gd2l0aCB0aGVpciBk
eW5hbWljYWxseSBzdXBwbGllZCBjb3VudGVycGFydHMuCj4gSXQgaXMgaW1wb3J0YW50IHRoZW4g
dG8gdHJhY2sgdGhlIGN1cnJlbnQgc3RhdGUgb2YgZXZlcnkgZnVuY3Rpb24KPiBiZWluZyBwYXRj
aGVkIGFuZCBwcmV2ZW50IHNpdHVhdGlvbnMgb2YgdW5pbnRlbnRpb25hbCBkb3VibGUtYXBwbHkK
PiBvciB1bmFwcGxpZWQgcmV2ZXJ0Lgo+IAo+IFRvIHN1cHBvcnQgdGhhdCwgaXQgaXMgbmVjZXNz
YXJ5IHRvIGV4dGVuZCBwdWJsaWMgaW50ZXJmYWNlIG9mIHRoZQo+IGxpdmVwYXRjaC4gVGhlIHN0
cnVjdCBsaXZlcGF0Y2hfZnVuYyBnZXRzIGFkZGl0aW9uYWwgZmllbGQgaG9sZGluZwo+IHRoZSBh
cHBsaWVkL3JldmVydGVkIHN0YXRlIG1hcmtlci4KPiAKPiBUbyByZWZsZWN0IHRoZSBsaXZlcGF0
Y2ggcGF5bG9hZCBBQkkgY2hhbmdlLCBidW1wIHRoZSB2ZXJzaW9uIGZsYWcKPiBMSVZFUEFUQ0hf
UEFZTE9BRF9WRVJTSU9OIHVwIHRvIDIuCj4gCj4gW0FuZCBhbHNvIHVwZGF0ZSB0aGUgdG9wIG9m
IHRoZSBkZXNpZ24gZG9jdW1lbnRdCj4gCj4gU2lnbmVkLW9mZi1ieTogUGF3ZWwgV2llY3pvcmtp
ZXdpY3ogPHdpcGF3ZWxAYW1hem9uLmRlPgo+IFJldmlld2VkLWJ5OiBBbmRyYS1JcmluYSBQYXJh
c2NoaXYgPGFuZHJhcHJzQGFtYXpvbi5jb20+Cj4gUmV2aWV3ZWQtYnk6IEJqb2VybiBEb2ViZWwg
PGRvZWJlbEBhbWF6b24uZGU+Cj4gUmV2aWV3ZWQtYnk6IE1hcnRpbiBQb2hsYWNrIDxtcG9obGFj
a0BhbWF6b24uZGU+Cj4gU2lnbmVkLW9mZi1ieTogS29ucmFkIFJ6ZXN6dXRlayBXaWxrIDxrb25y
YWQud2lsa0BvcmFjbGUuY29tPgo+IEFja2VkLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFs
bEBhcm0uY29tPgpSZXZpZXdlZC1ieTogUm9zcyBMYWdlcndhbGwgPHJvc3MubGFnZXJ3YWxsQGNp
dHJpeC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
