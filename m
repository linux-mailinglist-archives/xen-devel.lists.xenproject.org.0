Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE635E4B05
	for <lists+xen-devel@lfdr.de>; Fri, 25 Oct 2019 14:29:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNygY-0006S8-70; Fri, 25 Oct 2019 12:27:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=YObL=YS=citrix.com=ross.lagerwall@srs-us1.protection.inumbo.net>)
 id 1iNygW-0006S1-Es
 for xen-devel@lists.xenproject.org; Fri, 25 Oct 2019 12:27:16 +0000
X-Inumbo-ID: c66ba7ee-f722-11e9-94c7-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c66ba7ee-f722-11e9-94c7-12813bfff9fa;
 Fri, 25 Oct 2019 12:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1572006435;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=+g1I/9xjUFryzXv3PzVXjQSwy80gXVT4XLzYVmQsKK8=;
 b=FF5Ch8z4aSuYezY7Bf5e1Detd7+2zc2klG02bTEvaxQggHn4cIhJUtse
 UvfCJyFrLJ/Pl94K8Utcsyqpnsk0N+vV6cCZYB2gaSpujpV1abyvFMALT
 1vV2d9Cx+tsqBvIatt9JUZrR4MSCi7UrvkPM6Dr/1IFWneROVNm3CLoqQ g=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ross.lagerwall@citrix.com;
 spf=Pass smtp.mailfrom=ross.lagerwall@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ross.lagerwall@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="ross.lagerwall@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 ross.lagerwall@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="ross.lagerwall@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: EYUDq+C1821kbcFEocTESYJcUjxL1eWlS6JtX2VaCfsUjeJGkEr/FNnRetjQgiiIL5btnR2Td3
 LuTeVrw2gdrEZOdYGfuSZWkY3Z+hDDSEXktAbWOfsZYFquJ6pmEPx/xJLfd0Y9r4e4swR5mloc
 GXZTFkPYkiR8qqqcGFyWLB3UZGZTBtFLaEglrxz5meFcVjIhQLTtp1TO2R/Ib9YtvgV4AfySiY
 rpE6ZuBBmR5FALxXbKtvmREZN9RZZc49YppeMcEd4ZmPJ2k/MAByqm8G4Dvg6Hgkh+KlosI481
 lsI=
X-SBRS: 2.7
X-MesageID: 7524244
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,228,1569297600"; 
   d="scan'208";a="7524244"
To: Lars Kurth <lars.kurth@citrix.com>, xen-devel
 <xen-devel@lists.xenproject.org>
References: <F6091989-2145-435A-8CE8-66BF7172C0C2@citrix.com>
From: Ross Lagerwall <ross.lagerwall@citrix.com>
Message-ID: <f249ef17-359b-1aa4-3704-0f22968b78e0@citrix.com>
Date: Fri, 25 Oct 2019 13:27:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <F6091989-2145-435A-8CE8-66BF7172C0C2@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] Tagging livepatch-build-tools.git with Xen releases
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
Cc: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Ian Jackson <Ian.Jackson@citrix.com>, 'Jan Beulich' <JBeulich@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTAvMjUvMTkgMTI6MDUgUE0sIExhcnMgS3VydGggd3JvdGU6Cj4gSGkgYWxsLAo+IAo+IEkg
YW0gd29uZGVyaW5nIHdoZXRoZXIgd2Ugc2hvdWxkIHRhZyBsaXZlcGF0Y2gtYnVpbGQtdG9vbHMu
Z2l0IHdpdGggWGVuIAo+IHJlbGVhc2VzCj4gCgpJIHRob3VnaHQgdGhpcyBoYWQgYmVlbiBkaXNj
dXNzZWQgYmVmb3JlIGJ1dCBJIGNhbid0IGZpbmQgYW55dGhpbmcgaW4gbXkgCmFyY2hpdmVzLgoK
SU1PIGxpdmVwYXRjaC1idWlsZC10b29scyBpcyBhIHNlcGFyYXRlIHRvb2wgdGhhdCBkb2Vzbid0
IG5lZWQgdG8gbW92ZSAKaW4gbG9ja3N0ZXAgd2l0aCBYZW4uIEkgd291bGQgYWx3YXlzIHJlY29t
bWVuZCB1c2luZyB0aGUgdGlwIGNvbW1pdCAKc2luY2UgYnVncyBvZnRlbiBnZXQgZml4ZWQgYXJv
dW5kIHRoZSB0aW1lIHRoYXQgcGF0Y2hpbmcgaXMgbmVlZGVkLiAKVGhlcmVmb3JlIEkgZG9uJ3Qg
c2VlIGFueSB2YWx1ZSBpbiB0YWdnaW5nIGl0IGZvciB0aGUgdGltZSBiZWluZy4KClRoYW5rcywK
LS0gClJvc3MgTGFnZXJ3YWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
