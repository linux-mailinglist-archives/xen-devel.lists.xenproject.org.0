Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 436CA168099
	for <lists+xen-devel@lfdr.de>; Fri, 21 Feb 2020 15:45:00 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j59W7-0003Kd-JY; Fri, 21 Feb 2020 14:42:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hh41=4J=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1j59W6-0003KS-31
 for xen-devel@lists.xenproject.org; Fri, 21 Feb 2020 14:42:58 +0000
X-Inumbo-ID: 716da460-54b8-11ea-ade5-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 716da460-54b8-11ea-ade5-bc764e2007e4;
 Fri, 21 Feb 2020 14:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582296175;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=8PJJH/vevOXtgt5xoTJCvxWZ00CW/F/nSxhhPJW+Kb4=;
 b=GQtmezGmHkBktv5MLbv644akf90gUmYIip52WrESmq5tfysXPqhXrGcK
 92ZsfcgLqX3Eya/zcxpnpKp52SXXOQbw+ZpWsFT8NPLYcp6lfnUPyKUCg
 PUES5CVoJ6IGZCwEEOdW2pA6sp0Q2U/KgkiGMW+KNWrMgqOurv6uZohCo Q=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: FQfMHQEm5YFS2euA3r9AJcSAlRZHqLev01lGoFobwJDchSbf6thnw1oDqhxv+cQ7ByE7Z6bC1d
 lbV0QoLp/rVAOk21+a+zJeBF1kCTm49yP77nNeEQVyitZYdRNlYzbP9UxsooloAz2qRyjgY0bH
 WtG3z1Qn5vskuYZbZK6fH5hOADiOeAi6gKnBzNsb0V7JnuUemGkru8Lpdc/E5ai7ZUCI/8aJok
 mY1OZDFPfKZ69fJMiZB5zP6PBcNHHjUGKInRS5YwCKYsBHgTeZIRcfV+iiQJ512LpV6yfEnJeK
 2rM=
X-SBRS: 2.7
X-MesageID: 12825376
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,468,1574139600"; d="scan'208";a="12825376"
To: Tamas K Lengyel <tamas.lengyel@intel.com>, <xen-devel@lists.xenproject.org>
References: <cover.1581362050.git.tamas.lengyel@intel.com>
 <0f7d636910c45e9ca32fda4ef864a9b7d6e32745.1581362050.git.tamas.lengyel@intel.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <fa70f8c7-a822-b9de-0af6-c9fb2835c664@citrix.com>
Date: Fri, 21 Feb 2020 14:42:48 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <0f7d636910c45e9ca32fda4ef864a9b7d6e32745.1581362050.git.tamas.lengyel@intel.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v8 3/5] xen/mem_sharing: VM forking
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tamas
 K Lengyel <tamas@tklengyel.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTAvMDIvMjAyMCAxOToyMSwgVGFtYXMgSyBMZW5neWVsIHdyb3RlOgo+ICtzdGF0aWMgaW50
IG1lbV9zaGFyaW5nX2Zvcmsoc3RydWN0IGRvbWFpbiAqZCwgc3RydWN0IGRvbWFpbiAqY2QpCj4g
K3sKPiArICAgIGludCByYyA9IC1FSU5WQUw7Cj4gKwo+ICsgICAgaWYgKCAhY2QtPmNvbnRyb2xs
ZXJfcGF1c2VfY291bnQgKQo+ICsgICAgICAgIHJldHVybiByYzsKPiArCj4gKyAgICAvKgo+ICsg
ICAgICogV2Ugb25seSB3YW50IHRvIGdldCBhbmQgcGF1c2UgdGhlIHBhcmVudCBvbmNlLCBub3Qg
ZWFjaCB0aW1lIHRoaXMKPiArICAgICAqIG9wZXJhdGlvbiBpcyByZXN0YXJ0ZWQgZHVlIHRvIHBy
ZWVtcHRpb24uCj4gKyAgICAgKi8KPiArICAgIGlmICggIWNkLT5wYXJlbnRfcGF1c2VkICkKPiAr
ICAgIHsKPiArICAgICAgICBBU1NFUlQoZ2V0X2RvbWFpbihkKSk7Cj4gKyAgICAgICAgZG9tYWlu
X3BhdXNlKGQpOwo+ICsKPiArICAgICAgICBjZC0+cGFyZW50X3BhdXNlZCA9IHRydWU7Cj4gKyAg
ICAgICAgY2QtPm1heF9wYWdlcyA9IGQtPm1heF9wYWdlczsKPiArICAgICAgICBjZC0+bWF4X3Zj
cHVzID0gZC0+bWF4X3ZjcHVzOwoKU29ycnksIEkgc3Bva2UgdG9vIHNvb24uwqAgWW91IGNhbid0
IG1vZGlmeSBtYXhfdmNwdXMgaGVyZSwgYmVjYXVzZSBpdAp2aW9sYXRlcyB0aGUgaW52YXJpYW50
IHRoYXQgZG9tYWluX3ZjcHUoKSBkZXBlbmRzIHVwb24gZm9yIHNhZmV0eS4KCklmIHRoZSB0b29s
c3RhY2sgZ2V0cyB0aGluZ3Mgd3JvbmcsIFhlbiB3aWxsIGVpdGhlciBsZWFrIHN0cnVjdCB2Y3B1
J3MKb24gY2QncyB0ZWFyZG93biwgb3IgY29ycnVwdCBtZW1vcnkgYmV5b25kIHRoZSBlbmQgb2Yg
dGhlIGNkLT52Y3B1W10gYXJyYXkuCgpMb29raW5nIGF0IHRoZSBoeXBlcmNhbGwgc2VtYW50aWNz
LCB1c2Vyc3BhY2UgY3JlYXRlcyBhIG5ldyBkb21haW4KKHdoaWNoIHNwZWNpZmllcyBtYXhfY3B1
cyksIHRoZW4gY2FsbHMgbWVtX3NoYXJpbmdfZm9yayhwYXJlbnRfZG9tLApuZXdfZG9tKTvCoCBG
b3JraW5nIHNob3VsZCBiZSByZWplY3RlZCBpZiB0b29sc3RhY2sgaGFzbid0IGNob3NlbiB0aGUK
c2FtZSBudW1iZXIgb2YgdmNwdXMgZm9yIHRoZSBuZXcgZG9tYWluLgoKVGhpcyByYWlzZXMgdGhl
IHF1ZXN0aW9uIG9mIHdoZXRoZXIgdGhlIHNhbWUgc2hvdWxkIGJlIHRydWUgZm9yCm1heF9wYWdl
cyBhcyB3ZWxsLgoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
