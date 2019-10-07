Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1953CDEA0
	for <lists+xen-devel@lfdr.de>; Mon,  7 Oct 2019 12:04:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iHPpy-0004LI-TK; Mon, 07 Oct 2019 10:01:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=RuAa=YA=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iHPpy-0004LD-4c
 for xen-devel@lists.xenproject.org; Mon, 07 Oct 2019 10:01:54 +0000
X-Inumbo-ID: 7c3bc538-e8e9-11e9-97aa-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7c3bc538-e8e9-11e9-97aa-12813bfff9fa;
 Mon, 07 Oct 2019 10:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1570442512;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=f6Ff+1yOILbkyEi0zR3WY263F2306C5ugfs51qSB02M=;
 b=cNBf/rD+qXG1295ZjZacfCquJrU7tiuKDBbBXRh7e2+dCKyTpV95SOoR
 ClViRGJ7dVUAzTma0uSI2/AxeHfzjF21G0efhbEZtSHYyPUEZL/DWtObo
 EMMIX/2cgwTwVzwpZPgvA9wwmJ+JUPfGH8JuB1dPdHndhUQTqe0dLItBy 4=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: SG420NOkKiJbpddISSEiPe1L8zx13/WgwL8NouOJjxyjc9bl+GQfix5BUqRelmYpK7BlpEjbCO
 Mb0Tht7rCkHO8G8d8wXTPa28/0PYetzJS+JWvUbmY9q+cYayBLM7RfcEktsL2OfEoCx/khG/r8
 RszTghTdsOPJLJ54hktyNUHWxqI1P39gh56urO97nCoSLZkfcmt3ui53fkI+6ZJojP83zOf+qJ
 65TmhfzEITPe2C19aotAA3kegPOTLxYhLaVav58vWazNIc5rpXY+YSDQDauo5PSPo/OcxOl2XE
 piI=
X-SBRS: 2.7
X-MesageID: 6912876
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,267,1566878400"; 
   d="scan'208";a="6912876"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23963.3341.764085.220401@mariner.uk.xensource.com>
Date: Mon, 7 Oct 2019 11:01:49 +0100
To: "YOUNG, MICHAEL A." <m.a.young@durham.ac.uk>
In-Reply-To: <alpine.LFD.2.21.1910062127110.2837@austen3.home>
References: <alpine.LFD.2.21.1908150030150.2807@austen3.home>
 <alpine.LFD.2.21.1908150055060.2807@austen3.home>
 <18fb961102e8da16d1ad9576742bccf2@crc.id.au>
 <alpine.LFD.2.21.1908151959060.2715@austen3.home>
 <114550b6cd3e7936e055a63ebbb2c7a6@crc.id.au>
 <0b7f33b8fd6fbbae86451b5bbdb1f6ac@crc.id.au>	<1566956155.3344.0@crc.id.au>
 <23929.6485.711561.46507@mariner.uk.xensource.com>
 <alpine.LFD.2.21.1910062127110.2837@austen3.home>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH] read grubenv and set default from
 saved_entry or next_entry [and 1 more messages]
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
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>, Steven Haigh <netwiz@crc.id.au>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkuICBUaGFua3MgZm9yIHRoZSBtZXNzYWdlLgoKSnVzdCBvbmUgdGhpbmcgSSB3YW50ZWQgdG8g
cmVwbHkgdG8gaW4geW91ciBtYWlsOgoKWU9VTkcsIE1JQ0hBRUwgQS4gd3JpdGVzICgiUmU6IFtY
ZW4tZGV2ZWxdIFtQQVRDSF0gcmVhZCBncnViZW52IGFuZCBzZXQgZGVmYXVsdCBmcm9tIHNhdmVk
X2VudHJ5IG9yIG5leHRfZW50cnkgW2FuZCAxIG1vcmUgbWVzc2FnZXNdIik6Cj4gT24gV2VkLCAx
MSBTZXAgMjAxOSwgSWFuIEphY2tzb24gd3JvdGU6Cj4gPiBJIGZpbmQgdGhpcyBmaWxlbmFtZSBo
YWNrZXJ5IHJhdGhlciB1bnByaW5jaXBsZWQuICBJJ20gbm90IGVudGlyZWx5Cj4gPiBzdXJlIEkg
Y2FuIHNlZSBhIGJldHRlciB3YXksIGdpdmVuIHRoZSB3YXkgY2ZnX2xpc3QgaXMgY29uc3RydWN0
ZWQuCj4gPiBDYW4geW91IHRoaW5rIG9mIGEgbGVzcyBoYWNreSBhcHByb2FjaCA/Ci4uLgo+IE9u
ZSBvcHRpb24gd291bGQgYmUgdG8gZG8gYSBmcmVzaCBzZWFyY2ggZm9yIGdydWJlbnYgaW4gdGhl
IHNhbWUgcGxhY2VzCj4gd2UgbG9va2VkIGZvciBncnViLmNmZy4KPiAKPiBBbHRlcm5hdGl2ZWx5
LCBpdCBzaG91bGQgYmUgcG9zc2libGUgdG8gZG8gYSBtb3JlIHByZWNpc2UgZWRpdCB1c2luZwo+
IGYucnBhcnRpdGlvbigiLyIpLgoKSSBkb24ndCBmZWVsIEkgZnVsbHkgdW5kZXJzdGFuZCB0aGUg
aW1wbGljYXRpb25zLCBidXQgZWl0aGVyIG9mIHRoZXNlCnNlZW1zIGxpa2UgdGhleSBtaWdodCBi
ZSBnb29kIHN0cmF0ZWdpZXMgdG8gbWUuICBJIGd1ZXNzIHRoZSBmb3JtZXIKcmlza3MgZmluZGlu
ZyBhbiB1bnJlbGF0ZWQgbGVmdG92ZXIgZ3J1YmVudiBzb21ld2hlcmUgd2hpY2ggaXMKcHJvYmFi
bHkgbm90IGRlc2lyYWJsZS4KCkFueXdheSwgSSB3aWxsIGxlYXZlIHRoaXMgdG8geW91ciBqdWRn
ZW1lbnQuCgpUaGFua3MgZm9yIHRoZSByZXN0IG9mIHlvdXIgY29tbWVudHMuICBJJ2xsIGxvb2sg
Zm9yd2FyZCB0byBhIHJldmlzZWQKc2V0IG9mIHBhdGNoZXMgLSB0aGFua3MuCgpSZWdhcmRzLApJ
YW4uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
