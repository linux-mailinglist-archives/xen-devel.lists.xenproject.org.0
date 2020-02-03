Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D96EA150619
	for <lists+xen-devel@lfdr.de>; Mon,  3 Feb 2020 13:25:31 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iyalF-0000ff-VE; Mon, 03 Feb 2020 12:23:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=MGDo=3X=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iyalE-0000fY-Fg
 for xen-devel@lists.xenproject.org; Mon, 03 Feb 2020 12:23:28 +0000
X-Inumbo-ID: fab42484-467f-11ea-b211-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fab42484-467f-11ea-b211-bc764e2007e4;
 Mon, 03 Feb 2020 12:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580732607;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ORVeDNLTuNgeSL8Tns9fm5iTFaYwVXNnZLEOa8SG5QQ=;
 b=OgAOvsoa/2HG3QNhr3DEz+MlaAxZIIpXB4KtbcYIwwQ1q9GdlaIXUFIU
 cgTFc9y5/GiwvwSXGG+lNuqvc+JRIvsAN1GpG7YbIDCnrVL5O0BewplAN
 N4kHGe3YYYakffb5gezLSDCdq7oIU+FTl/K6rOOpFjxYaiIsBabBY0+pQ I=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
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
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: kIoKvtBbRPzKtnh5jU92y/HVtudYPuqKG0KJOs/ZxWqdMZFUsgs3Kd/lRvaqKLMC2ZwMThM0Gh
 UrxICByE2st/Vs6F1Mpdd95iesJiJ0D7pkvW97KSDkS7CCiBJmCPTQC9JrKRurZQtiCemMciM7
 OafUUD0rDlXH5uO7uhlV53cUAIsQxGGeagJCIWy2E3kFUSLuvzmN5EmCpygaoNaIgMFoTnOB9T
 KTN/tqojquAJjIE11/1DPf9a6RJGwZof+1WJm98Z3zGIpFQTV9smM9XtmoIBAiPflwHFwohm0Q
 i2Q=
X-SBRS: 2.7
X-MesageID: 12457365
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,397,1574139600"; d="scan'208";a="12457365"
Date: Mon, 3 Feb 2020 13:23:19 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Sander Eikelenboom <linux@eikelenboom.it>
Message-ID: <20200203122319.GU4679@Air-de-Roger>
References: <ebd9cf75-36cd-c064-661d-88a49445ecce@eikelenboom.it>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ebd9cf75-36cd-c064-661d-88a49445ecce@eikelenboom.it>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] Xen-unstable: pci-passthrough regression bisected
 to: x86/smp: use APIC ALLBUT destination shorthand when possible
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBGZWIgMDMsIDIwMjAgYXQgMDk6MzM6NTFBTSArMDEwMCwgU2FuZGVyIEVpa2VsZW5i
b29tIHdyb3RlOgo+IEhpIFJvZ2VyLAo+IAo+IExhc3Qgd2VlayBJIGVuY291bnRlcmVkIGFuIGlz
c3VlIHdpdGggdGhlIFBDSS1wYXNzdGhyb3VnaCBvZiBhIFVTQiBjb250cm9sbGVyLiAKPiBJbiB0
aGUgZ3Vlc3QgSSBnZXQ6Cj4gICAgIFsgMTE0My4zMTM3NTZdIHhoY2lfaGNkIDAwMDA6MDA6MDUu
MDogeEhDSSBob3N0IG5vdCByZXNwb25kaW5nIHRvIHN0b3AgZW5kcG9pbnQgY29tbWFuZC4KPiAg
ICAgWyAxMTQzLjMzNDgyNV0geGhjaV9oY2QgMDAwMDowMDowNS4wOiB4SENJIGhvc3QgY29udHJv
bGxlciBub3QgcmVzcG9uZGluZywgYXNzdW1lIGRlYWQKPiAgICAgWyAxMTQzLjM0NzM2NF0geGhj
aV9oY2QgMDAwMDowMDowNS4wOiBIQyBkaWVkOyBjbGVhbmluZyB1cAo+ICAgICBbIDExNDMuMzU2
NDA3XSB1c2IgMS0yOiBVU0IgZGlzY29ubmVjdCwgZGV2aWNlIG51bWJlciAyCj4gCj4gQmlzZWN0
aW9uIHR1cm5lZCB1cCBhcyB0aGUgY3VscHJpdDogCj4gICAgY29tbWl0IDU1MDBkMjY1YTJhOGZh
NjNkNjBjMDhiZWI1NDlkZThlYzgyZmY3YTUKPiAgICB4ODYvc21wOiB1c2UgQVBJQyBBTExCVVQg
ZGVzdGluYXRpb24gc2hvcnRoYW5kIHdoZW4gcG9zc2libGUKClNvcnJ5IHRvIGhlYXIgdGhhdCwg
bGV0IHNlZSBpZiB3ZSBjYW4gZmlndXJlIG91dCB3aGF0J3Mgd3JvbmcuCgo+IEkgdmVyaWZpZWQg
YnkgcmV2ZXJ0aW5nIHRoYXQgY29tbWl0IGFuZCBub3cgaXQgd29ya3MgZmluZSBhZ2Fpbi4KCkRv
ZXMgdGhlIHNhbWUgY29udHJvbGxlciB3b3JrIGZpbmUgd2hlbiB1c2VkIGluIGRvbTA/CgpUaGFu
a3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
