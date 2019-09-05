Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F9B7AA1FB
	for <lists+xen-devel@lfdr.de>; Thu,  5 Sep 2019 13:48:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5qBv-0003Cq-Gc; Thu, 05 Sep 2019 11:44:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=I3J7=XA=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1i5qBu-0003Bw-3X
 for xen-devel@lists.xenproject.org; Thu, 05 Sep 2019 11:44:42 +0000
X-Inumbo-ID: 8ba77d4e-cfd2-11e9-b299-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8ba77d4e-cfd2-11e9-b299-bc764e2007e4;
 Thu, 05 Sep 2019 11:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1567683881;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=hZfrNS8UI0JSOigizgzkGeaWGI63k5uyBHqyPRlku14=;
 b=fMkh/kQOOh55icOIZ1J5eIPGK4cLxC1/v3KgsZi6YdoTuUG8FjOLF903
 7gbaqWTdLlVSQCHdubGX0JkBBj4QgGJqZTpcA/5p34S8K1U/hz0fRBZqh
 0DvD+x9OQSXQp6ehiRFDm4AuqP9zkKa70gmdjnguQuiXPccFM4L7299Y+ Y=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=george.dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 george.dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="george.dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: ktX0KpD50y0wDP264yU4I0fU0DtPCFDwIRxXPxQs6TKMwGOpyClXbyMYKLm/n7uJzOrqvYCwJK
 QDvK8PtBCxz8AeYZYuOwnjN+aZw2E4piHWuNrTIr3H2KveuewhfTd6D4zlc4Qh2XRmDcsDAq76
 L899NqXCx17dHfTPCRjKV8/Iyj9KYNXFzaMBgzmejGUbKJp6Wyb0KqM2BIJ+uMrlU7TXzIylNr
 lkKr7VvBtsrkfT5KIUhXKJA6a3CrvCBT+A7O4XrsWDQGaHrx9UHH/ztYyDpkpeLHc9XWDifXZA
 iTg=
X-SBRS: 2.7
X-MesageID: 5224594
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,470,1559534400"; 
   d="scan'208";a="5224594"
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20190905093416.2955-1-roger.pau@citrix.com>
 <a7464a0e-c730-d506-d8f6-76804953e2a1@suse.com>
 <20190905100111.tjayxo44f2enaz7t@Air-de-Roger>
 <C7E10C34-ABBE-4F86-8D5E-E112FDB52072@citrix.com>
 <20190905110127.t3y2lqxzvlhjgfhl@Air-de-Roger>
From: George Dunlap <george.dunlap@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=george.dunlap@citrix.com; prefer-encrypt=mutual; keydata=
 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
 rIFfe2Dk+lD9A9BVd2rfoHA=
Message-ID: <f198f4e9-4c67-73ad-1279-2b2b01f3d456@citrix.com>
Date: Thu, 5 Sep 2019 12:44:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190905110127.t3y2lqxzvlhjgfhl@Air-de-Roger>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86/libxl: choose a sane default for HAP
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim \(Xen.org\)" <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Paul Durrant <Paul.Durrant@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Ian
 Jackson <Ian.Jackson@citrix.com>, Anthony Perard <anthony.perard@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gOS81LzE5IDEyOjAxIFBNLCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOgo+IE9uIFRodSwgU2Vw
IDA1LCAyMDE5IGF0IDEyOjM0OjExUE0gKzAyMDAsIEdlb3JnZSBEdW5sYXAgd3JvdGU6Cj4+Cj4+
Cj4+PiBPbiBTZXAgNSwgMjAxOSwgYXQgMTE6MDEgQU0sIFJvZ2VyIFBhdSBNb25uZSA8cm9nZXIu
cGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+Pj4KPj4+IE9uIFRodSwgU2VwIDA1LCAyMDE5IGF0IDEx
OjUyOjU5QU0gKzAyMDAsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDA1LjA5LjIwMTkgMTE6
MzQsIFJvZ2VyIFBhdSBNb25uZSB3cm90ZToKPj4+Pj4gQ3VycmVudCBsaWJ4bCBjb2RlIHdpbGwg
YWx3YXlzIGVuYWJsZSBIYXJkd2FyZSBBc3Npc3RlZCBQYWdpbmcgKEhBUCksCj4+Pj4+IGV4cGVj
dGluZyB0aGF0IHRoZSBoeXBlcnZpc29yIHdpbGwgZmFsbGJhY2sgdG8gc2hhZG93IGlmIEhBUCBp
cyBub3QKPj4+Pj4gYXZhaWxhYmxlLiBXaXRoIHRoZSBjaGFuZ2VzIHRvIHRoZSBkb21haW4gYnVp
bGRlciB0aGF0J3Mgbm90IHRoZSBjYXNlCj4+Pj4+IGFueSBsb25nZXIsIGFuZCB0aGUgaHlwZXJ2
aXNvciB3aWxsIHJhaXNlIGFuIGVycm9yIGlmIEhBUCBpcyBub3QKPj4+Pj4gYXZhaWxhYmxlIGlu
c3RlYWQgb2Ygc2lsZW50bHkgZmFsbGluZyBiYWNrIHRvIHNoYWRvdy4KPj4+Pgo+Pj4+IFdvdWxk
IGl0IHJlYWxseSBiZSBtdWNoIG1vcmUgaW52b2x2ZWQgdGhhbiB0aGUgY2hhbmdlIGhlcmUgdG8g
cmVzdG9yZQo+Pj4+IHNpbGVudCBkZWZhdWx0aW5nIHRvIHNoYWRvdz8KPj4+Cj4+PiBCdXQgdGhh
dCB3b3VsZCBtZWFuIHRoYXQgYSB1c2VyIGhhdmluZyBzZWxlY3RlZCBoYXA9MSBvbiB0aGUgY29u
ZmlnCj4+PiBmaWxlIHdvdWxkIGdldCBzaWxlbnRseSBkZWZhdWx0ZWQgdG8gc2hhZG93LCB3aGlj
aCBpcyB3cm9uZyBJTU8uCj4+Cj4+IEF0IHRoZSBsaWJ4bCBsYXllciwgYXJlbuKAmXQgdGhlIG9w
dGlvbnMgdHJpc3RhdGU/ICBJLmUuLCB0aGlzIHdvdWxkIGJlIOKAnGhhcOKAnSwg4oCcc2hhZG93
4oCdLCBvciDigJxub3Qgc3BlY2lmaWVk4oCdPwo+Pgo+PiBUaGUgdXNlciBuZWVkcyB0byBiZSBh
YmxlIHRvIHNwZWNpZnkg4oCcYWx3YXlzIHVzZSBzaGFkb3figJ0sIOKAnGFsd2F5cyB1c2UgSEFQ
4oCdLCBvciDigJx1c2UgSEFQIGlmIGF2YWlsYWJsZSwgb3RoZXJ3aXNlIHVzZSBzaGFkb3figJ0u
Cj4gCj4gVGhlICJ1c2UgSEFQIGlmIGF2YWlsYWJsZSwgb3RoZXJ3aXNlIHVzZSBzaGFkb3ciIGlz
IGN1cnJlbnRseSBvbmx5Cj4gcG9zc2libHkgZXhwcmVzc2VkIGJ5IG5vdCBzZXR0aW5nIHRoZSBo
YXAgb3B0aW9uIGluIHRoZSBjb25maWcgZmlsZS4KPiAKPj4gQXQgdGhlIG1vbWVudCwgbGVhdmlu
ZyBpdCBlbXB0eSBzaG91bGQgYmUg4oCcdXNlIEhBUCBpZiBhdmFpbGFibGUsIG90aGVyd2lzZSB1
c2Ugc2hhZG934oCdOyBzbyDigJxoYXAgPSAx4oCdIHNob3VsZCBmYWlsIGlmIEhBUCBpcyBub3Qg
YXZhaWxhYmxlLgo+IAo+IFJpZ2h0LCB0aGlzIGlzIHdoYXQgdGhpcyBwYXRjaCBpcyB0cnlpbmcg
dG8gYWNjb21wbGlzaC4KClJpZ2h0OyBJIHdhc24ndCB0cnlpbmcgdG8gY29udHJhZGljdCB5b3Ug
c28gbXVjaCBhcyAid2VpZ2ggaW4iIChhbmQKYmFzaWNhbGx5IGFncmVlIHdpdGggeW91KS4KCiAt
R2VvcmdlCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
