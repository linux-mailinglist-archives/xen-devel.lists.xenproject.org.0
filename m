Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA44412E956
	for <lists+xen-devel@lfdr.de>; Thu,  2 Jan 2020 18:25:02 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1in4BJ-0006kK-M4; Thu, 02 Jan 2020 17:22:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=h/dY=2X=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1in4BI-0006k6-3x
 for xen-devel@lists.xenproject.org; Thu, 02 Jan 2020 17:22:44 +0000
X-Inumbo-ID: 7b2f35c8-2d84-11ea-a3a1-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7b2f35c8-2d84-11ea-a3a1-12813bfff9fa;
 Thu, 02 Jan 2020 17:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1577985761;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=UuPNuEkWJtP9Ho/6Gg3BhnNo7gVm2nUBrero2FAGmiI=;
 b=RZgLrRwhIINY3FInPP+u0WABSFG26Gl7Ipo4o+b6O5f1phD463paybR4
 P08Hc3eZPV2ZW+3UfAImmKAa3GU4YGCK2S+7R12keBf85avli9z4I2rUH
 4mIGKxo83C+LbZjgyHqH90ANxqo2epPlJUJI0891dSMfD+Pck/5VIkYqC g=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: aC3IfUr1VJiG54igMxR+4aOweb60wxzxL1kdfHkwdw3Bw9ZMIK+yJuSAYBKcl1r83wpR2wk+yn
 CKbilC923nZIqw0Z1jemZoHODynu+gE8zlzwiExZtBqKme0DrukRK9LnN6WAPtda8VIiDrBCuL
 rzNS9yCt/5V3frVv/BByNOi92U3u/LIx7KOqI46R5lSOtlKtdXzBOfoAEh2XErtgfuAywUyX9o
 scme5Uvpwt7VCOmgYIJmoo4jNDSyVCw5K/k1lk7NbuiOOef/3RkGCYsU8UHgalMeqqSNOl5Dyl
 Hgo=
X-SBRS: 2.7
X-MesageID: 10750584
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,387,1571716800"; d="scan'208";a="10750584"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24078.9950.355600.563921@mariner.uk.xensource.com>
Date: Thu, 2 Jan 2020 17:22:38 +0000
To: Paul Durrant <pdurrant@amazon.com>
In-Reply-To: <20191224130416.3570-4-pdurrant@amazon.com>
References: <20191224130416.3570-1-pdurrant@amazon.com>
 <20191224130416.3570-4-pdurrant@amazon.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH 3/6] domctl: return EEXIST from
 XEN_DOMCTL_createdomain...
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
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Andrew
 Cooper <Andrew.Cooper3@citrix.com>, George Dunlap <George.Dunlap@citrix.com>,
 Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UGF1bCBEdXJyYW50IHdyaXRlcyAoIltQQVRDSCAzLzZdIGRvbWN0bDogcmV0dXJuIEVFWElTVCBm
cm9tIFhFTl9ET01DVExfY3JlYXRlZG9tYWluLi4uIik6Cj4gLi4uaWYgYSBzcGVjaWZpZWQgZG9t
aWQgaXMgYWxyZWFkeSBpbiB1c2UuCj4gCj4gWEVOX0RPTUNUTF9jcmVhdGVkb21haW4gYWxsb3dz
IGEgZG9taWQgdG8gYmUgc3BlY2lmaWVkIGJ5IGl0cyBjYWxsZXIgYW5kCj4gd2lsbCBjb3JyZWN0
bHkgZmFpbCBpZiB0aGF0IGRvbWlkIGlzIGFscmVhZHkgaW4gdXNlLiBIb3dldmVyIHRoZSBlcnJu
bwo+IHJldHVybmVkIGluIHRoaXMgY2FzZSB3aWxsIGJlIEVJTlZBTCwgbWFraW5nIGl0IGluZGlz
dGluZ3Vpc2hhYmxlIGZyb20KPiBzZXZlcmFsIG90aGVyIGZhaWx1cmVzLiBBbHNvIGEgdmFsdWUg
b2YgRUlOVkFMIGRvZXMgbm90IHNlZW0gYXBwcm9wcmlhdGUKPiBhcyB0aGUgc3BlY2lmaWVkIGRv
bWlkIGlzIHZhbGlkIFsxXSBidXQganVzdCBub3QgKHRyYW5zaWVudGx5KSBhdmFpbGFibGUuCj4g
Cj4gWzFdIGFueSBpbnZhbGlkIHZhbHVlIHBhc3NlZCBpbiBpcyBpZ25vcmVkIGFuZCBjYXVzZXMg
WGVuIHRvIGNob29zZSBhbgo+ICAgICB1bnVzZWQgYW5kIHZhbGlkIHZhbHVlLgoKQWNrZWQtYnk6
IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
