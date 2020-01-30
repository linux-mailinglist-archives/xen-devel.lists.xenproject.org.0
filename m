Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91B1314DFEA
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jan 2020 18:31:55 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ixDcc-0005AV-Jg; Thu, 30 Jan 2020 17:28:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=m3I1=3T=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1ixDcb-0005AQ-F0
 for xen-devel@lists.xenproject.org; Thu, 30 Jan 2020 17:28:53 +0000
X-Inumbo-ID: fb9e7afe-4385-11ea-8aca-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fb9e7afe-4385-11ea-8aca-12813bfff9fa;
 Thu, 30 Jan 2020 17:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580405333;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=1CdDc7VpoE5oI/Y2TS9AEX13CYxEbTRi5MqYf7zAhfY=;
 b=YDyH0N+mmdU5su91aV9YycJ9FXr5MZJ/pbsqUzw7rU+Enj3kxaOLyM9z
 +8DL7gHUrJ0lW3YqnfFpRSS3SFvIZaxe2fNpl8Wyd1sVI0CKGcUShTjyw
 CVhgrgmLVE+0cxHmu82Je+DPpqXpVWQruhBXfJvOshYWu4z0AoqIgwrA3 U=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
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
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: TeNVmTcZ2s9bxJwC0J63WPOy4hkmZ9NAr2CwCzGJ3POvF5wawqhFYY03wAIwG6kGx3zMsO6ytT
 Or2nrjg26r9/ozQo3aGJ2l8I8rHJ65br//2sdGDNFtOTOu4ggf5QvtKpDOZtQHZmFT+dLL12q8
 USW8jsQRTqS8tzIM+3oXJqCi3LGzKY6dSOARTx1SASvsyt+8Hsqm4OHT5wzbiMyE1Ur7Bc6oX6
 Tju8SsDj/5L/ceIEblSlbJhHIsxgWLZfpw1v79LTR9ZQGeYHaeOE5VQmyNZIJppaG1JO8WVSMM
 3aY=
X-SBRS: 2.7
X-MesageID: 11869414
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,382,1574139600"; d="scan'208";a="11869414"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24115.4689.88393.840303@mariner.uk.xensource.com>
Date: Thu, 30 Jan 2020 17:28:49 +0000
To: Paul Durrant <pdurrant@amazon.com>
In-Reply-To: <20200122144446.919-8-pdurrant@amazon.com>
References: <20200122144446.919-1-pdurrant@amazon.com>
 <20200122144446.919-8-pdurrant@amazon.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH v4 7/7] xl: allow domid to be preserved on
 save/restore or migrate
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
Cc: Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UGF1bCBEdXJyYW50IHdyaXRlcyAoIltQQVRDSCB2NCA3LzddIHhsOiBhbGxvdyBkb21pZCB0byBi
ZSBwcmVzZXJ2ZWQgb24gc2F2ZS9yZXN0b3JlIG9yIG1pZ3JhdGUiKToKPiBUaGlzIHBhdGNoIGFk
ZHMgYSAnLUQnIGNvbW1hbmQgbGluZSBvcHRpb24gdG8gc2F2ZSBhbmQgbWlncmF0ZSB0byBhbGxv
dwo+IHRoZSBkb21haW4gaWQgdG8gYmUgaW5jb3Jwb3JhdGVkIGludG8gdGhlIHNhdmVkIGRvbWFp
biBjb25maWd1cmF0aW9uIGFuZAo+IGhlbmNlIGJlIHByZXNlcnZlZC4KClRoYW5rcy4KCkluIHJl
c3BvbnNlIHRvIHYzIDYvNiBJIHdyb3RlOgoKICBJIHdvbmRlciBpZiB0aGlzIHNob3VsZCBiZSBk
b25lIG1vcmUgaW4gbGlieGwuICBTaG91bGQgdGhpcyBiZSBhCiAgZG9tYWluIHByb3BlcnR5ID8g
IFdlaSwgQW50aG9ueSA/CgpUaGlzIHF1ZXN0aW9uIHJlbWFpbnMgdW5hbnN3ZXJlZC4gIEknbSBz
b3JyeSB0aGF0IG5laXRoZXIgV2VpIG5vcgpBbnRob255IGhhZCBhIGNoYW5jZSB0byBhbnN3ZXIg
eWV0Li4uCgpQYXVsLCBkbyB5b3UgaGF2ZSBhIHJlYXNvbiBmb3IgZG9pbmcgaXQgdGhpcyB3YXkg
PyAgTXkgaW5jbGluYXRpb24gaXMKdGhhdCB0aGluayBkb2luZyBpdCBhdCB0aGUgbGlieGwgbGF5
ZXIgd291bGQgbWFrZSBtb3JlIHNlbnNlLiAgRG8geW91CnRoaW5rIHRoYXQgd291bGQgYmUgcG9z
c2libGUgPwoKSWFuLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
