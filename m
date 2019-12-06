Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E7CB1156FE
	for <lists+xen-devel@lfdr.de>; Fri,  6 Dec 2019 19:11:03 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1idI22-0002pw-Pg; Fri, 06 Dec 2019 18:08:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=7dmx=Z4=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1idI21-0002pr-8T
 for xen-devel@lists.xen.org; Fri, 06 Dec 2019 18:08:45 +0000
X-Inumbo-ID: 707ddce2-1853-11ea-a1e1-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 707ddce2-1853-11ea-a1e1-bc764e2007e4;
 Fri, 06 Dec 2019 18:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1575655724;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=zi0rKKOUdpMhO1hs1XQkuyTFeFp6z1FPS+h6fqf7NtY=;
 b=Sq4KUPcuC5FqkWa/xMkNsQ52bP4YsECiYiEyisF0xD6Xezc8s0pnCanA
 EaUkybmMGZXGTIBxGPX/5qhzL5ZN1G7/p+rkmcAyJaUy8xzLVJ7xmB9tr
 um6a8191kb1y8ZDGMuWooL9SjVS/Co14whBWa0RYpGNOxj+Nsf3AkvpBV U=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: DGKZGLbCR5Hf0PPk1pGCW04GVjjIfQx0KVTLeKOYLu+nikNCXoQBW1TL3IVIZo6tX08vY5Jl5H
 XnorRS1gvRGaBgjFkIaaO49kpxMjLEdO3lxcCNYoLxkFAkKZfsqXDgym4+1LX1UEapjDCsKn6/
 HE3mJJZGsfREQi+1ebQyA68qmksistmbr8zmWXXO070JZDEBGnQdma5MCFDPccziIrTVnxKdjP
 Wd2EsFZBXULg1C8GKd5vQzThAxUCrS2PVN9/PreboW9ebXfvs0XymsKnSe0HGy1X84VKM+Ba7V
 cA4=
X-SBRS: 2.7
X-MesageID: 9322951
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,285,1571716800"; 
   d="scan'208";a="9322951"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24042.39208.563484.2274@mariner.uk.xensource.com>
Date: Fri, 6 Dec 2019 18:08:40 +0000
To: Julien Grall <julien@xen.org>
In-Reply-To: <b199414b-dbe6-2d0d-bd97-e5bafb402c47@xen.org>
References: <24042.34323.159917.173963@mariner.uk.xensource.com>
 <b199414b-dbe6-2d0d-bd97-e5bafb402c47@xen.org>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] Problem booting Debian buster on arndale
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SnVsaWVuIEdyYWxsIHdyaXRlcyAoIlJlOiBQcm9ibGVtIGJvb3RpbmcgRGViaWFuIGJ1c3RlciBv
biBhcm5kYWxlIik6Cj4gT24gMDYvMTIvMjAxOSAxNjo0NywgSWFuIEphY2tzb24gd3JvdGU6Cj4g
PiBJdCBzZWVtcyB0byBoYXZlIGh1bmcgZHVyaW5nIGJvb3QuICBOQiB0aGF0IEkgZG9uJ3Qga25v
dyB3aGV0aGVyIHRoaXMKPiA+IGlzIGEgb25lLW9mZi4KPiAKPiBMb29raW5nIGF0IFsxXSwgbW9z
dCBvZiB0aGUgcmVjZW50IGZsaWdodCBoYXZlIG1hbmFnZWQgdG8gYm9vdCBYZW4gb24gCj4gdGhl
IGFybmRhbGUuIEhvd2V2ZXIsIEkgc29tZWhvdyBjYW4ndCBmaW5kIHRoZSBmbGlnaHQgMTQ0MzEy
IGluIHRoYXQgCj4gbGlzdC4gRG8geW91IGhhdmUgYW55IGlkZWEgd2h5PwoKVGhlIGZsaWdodCBp
biBxdWVzdGlvbiB3YXMgbm90IG9uIHRoZSB4ZW4tdW5zdGFibGUgImJyYW5jaCIsIGFuZCBub3QK
b2ZmaWNpYWxseSBibGVzc2VkLCBiZWNhdXNlIGl0J3MgcGFydCBvZiBteSBidXN0ZXIgd29yay4K
CkkgZm91bmQgYSBzZWNvbmQgaW5zdGFuY2UgaW4gdGhlIHNhbWUgZmxpZ2h0OgogIGh0dHA6Ly9s
b2dzLnRlc3QtbGFiLnhlbnByb2plY3Qub3JnL29zc3Rlc3QvbG9ncy8xNDQzMTIvdGVzdC1hcm1o
Zi1hcm1oZi1leGFtaW5lL2luZm8uaHRtbAoKSSB0aGluayBpdCBtdXN0IGJlIHNwZWNpZmljIHRv
IGJ1c3RlciwgYnV0IHRoYXQgaXMgcmF0aGVyIG15c3RlcmlvdXMuCkFmdGVyIGFsbCBpdCBpcyBz
dXBwb3NlZCB0byBiZSB0aGUgc2FtZSBrZXJuZWwgYW5kIFhlbiBhcyB0aGUgY3VycmVudApvc3N0
ZXN0IG1haW5saW5lIGlzIHVzaW5nLiAgTWF5YmUgdGhlIG5ldyBjb21waWxlciBpcyBkb2luZyBz
b21ldGhpbmcKdW5leHBlY3RlZC4KCklhbi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
