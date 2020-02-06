Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D86315461C
	for <lists+xen-devel@lfdr.de>; Thu,  6 Feb 2020 15:28:24 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1izi6S-0000Hg-Uu; Thu, 06 Feb 2020 14:26:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8S1f=32=citrix.com=christian.lindig@srs-us1.protection.inumbo.net>)
 id 1izi6S-0000Hb-08
 for xen-devel@lists.xenproject.org; Thu, 06 Feb 2020 14:26:00 +0000
X-Inumbo-ID: 97c5748a-48ec-11ea-afb7-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 97c5748a-48ec-11ea-afb7-12813bfff9fa;
 Thu, 06 Feb 2020 14:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580999158;
 h=subject:to:references:from:message-id:date:mime-version:
 in-reply-to:content-transfer-encoding;
 bh=XIYFpgPiDQ3WWc/DiwJaQjxY5UwD8kj4NWqv1hMoxaU=;
 b=MPC2JMUaErSmYss0f49cZxuMcLmavwi1IfPmq62gjl0q5KTYJwi/Mzjb
 T3LrVxON9h9+O/nts3bx/04ROvzDNj2bUUBHxACtRsh+s2qqbSciTeO/V
 DTOU/vwqI6+fEnYkhsHdZcOJrDYNaJ+MGVHg1Nf8/UIz2D9mrdiEFCQph M=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=christian.lindig@citrix.com;
 spf=Pass smtp.mailfrom=christian.lindig@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 christian.lindig@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="christian.lindig@citrix.com";
 x-sender="christian.lindig@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 christian.lindig@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="christian.lindig@citrix.com";
 x-sender="christian.lindig@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="christian.lindig@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: hNUZFZYyv5orprxCUaYgJUNAocJchbK0++ld89Q9ENPaLkKna7yAeSvYzvUsQf5k+9rRwrAe1h
 w5a+8uTX5PJEwPpeuNHNMhoeLsamAcuNhBZsm5Q4+CZkU+m0RkyoFq67B3MgYhZwbpCBHw5pMc
 tZwSba924hFaHvc1SrFu6ZBsRQ8HTp1b2mzDZ83g1jDmv8CyUjL+hoF1lXX4sO5d8xiWmcGXJT
 835OF/XsdbdYZ3LcN5Ow4TTJoitTjWylofJxaLdpqpW7dmhF9QxmQFKRQshFz3Sb6cJ/urSiKB
 Rws=
X-SBRS: 2.7
X-MesageID: 12668451
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,409,1574139600"; d="scan'208";a="12668451"
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
 <xen-devel@lists.xenproject.org>
References: <20200205165056.11734-1-andrew.cooper3@citrix.com>
 <20200205165056.11734-3-andrew.cooper3@citrix.com>
From: Christian Lindig <christian.lindig@citrix.com>
Message-ID: <e65726f6-9a7f-a396-6db5-2a08133c92d1@citrix.com>
Date: Thu, 6 Feb 2020 14:25:56 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200205165056.11734-3-andrew.cooper3@citrix.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH 2/6] tools/ocaml: Drop cpuid helpers
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAwNS8wMi8yMDIwIDE2OjUwLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+IFRoZXNlIGhhdmUg
bm8gY2FsbGVycywgYW5kIHRoZSB1bmRlcmx5aW5nIGluZnJhc3RydWN0dXJlIGlzIGFib3V0IHRv
IGJlCj4gcmV3cml0dGVuIGNvbXBsZXRlbHkuCj4gCj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IENv
b3BlcjxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgo+IC0tLQo+IENDOiBDaHJpc3RpYW4gTGlu
ZGlnPGNocmlzdGlhbi5saW5kaWdAY2l0cml4LmNvbT4KPiAtLS0KPiAgIHRvb2xzL29jYW1sL2xp
YnMveGMveGVuY3RybC5tbCAgICAgIHwgIDcgLS0tLS0KPiAgIHRvb2xzL29jYW1sL2xpYnMveGMv
eGVuY3RybC5tbGkgICAgIHwgIDcgLS0tLS0KPiAgIHRvb2xzL29jYW1sL2xpYnMveGMveGVuY3Ry
bF9zdHVicy5jIHwgNjIgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ICAg
MyBmaWxlcyBjaGFuZ2VkLCA3NiBkZWxldGlvbnMoLSkKCkFja2VkLWJ5OiBDaHJpc3RpYW4gTGlu
ZGlnIDxjaHJpc3RpYW4ubGluZGlnQGNpdHJpeC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
