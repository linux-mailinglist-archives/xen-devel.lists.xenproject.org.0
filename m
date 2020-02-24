Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 758C216ADEA
	for <lists+xen-devel@lfdr.de>; Mon, 24 Feb 2020 18:44:01 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6Hhn-00036D-Pp; Mon, 24 Feb 2020 17:39:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gH7p=4M=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1j6Hhm-000368-Dl
 for xen-devel@lists.xenproject.org; Mon, 24 Feb 2020 17:39:42 +0000
X-Inumbo-ID: a2c40f10-572c-11ea-aba8-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a2c40f10-572c-11ea-aba8-bc764e2007e4;
 Mon, 24 Feb 2020 17:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582565982;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=3c/2q0w6wf4HUKHatcfA/aMgFkTrYb9IOqI8HL/W1VA=;
 b=D1bYISQwLxlMi9ohAZmI7yiObma5wpSlw/6t8ySUwhAQCzX37O3c6mKr
 RuAbIbhNWl2+XPD25npTNmVg7fl6wGIjjC2JYy2WP09wzz0EtJ43sZowD
 2IvgpOHbJ3lobETxFUCqiy7YwqQ2066YvHG2mbsqcNmLXDwHp21Tc5mLg k=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
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
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 8/+MCAdcbsfNNmYOL1Ue2+nAp8LX0ST6LeifwiT+/LyyVkX4oXbu0yWSlR/mOT4xTjibrIcquw
 zSd4m4+jySR6F4pyAfDrJ9qrCS+BIhlvoGVjsiZuG2bTjDClBImU5DlkMUOHZUvFQ2HiBYGRGX
 W/A3tTbX9AqumG9ZgRkunr+hdGVnAWzV5+NIK2+7iqyN21cnRfcd3C5CZpuoFsJ3UYeA9omPiJ
 3TJXi3DOWUthepYTYgFN3WwZMNrlVBfj6tuP9YQv6nr7zGnipc/rFRzPHV/prj6qZjYJglPnr7
 i0Y=
X-SBRS: 2.7
X-MesageID: 12927329
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,480,1574139600"; d="scan'208";a="12927329"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24148.2649.756710.728091@mariner.uk.xensource.com>
Date: Mon, 24 Feb 2020 17:39:37 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20200127143444.25538-11-andrew.cooper3@citrix.com>
References: <20200127143444.25538-1-andrew.cooper3@citrix.com>
 <20200127143444.25538-11-andrew.cooper3@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH v2 10/17] tools/libxl: Plumb a restore
 boolean down into libxl__build_pre()
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
Cc: Anthony
 Perard <anthony.perard@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QW5kcmV3IENvb3BlciB3cml0ZXMgKCJbUEFUQ0ggdjIgMTAvMTddIHRvb2xzL2xpYnhsOiBQbHVt
YiBhIHJlc3RvcmUgYm9vbGVhbiBkb3duIGludG8gbGlieGxfX2J1aWxkX3ByZSgpIik6Cj4gVG8g
Zml4IENQVUlEIGhhbmRsaW5nLCBsaWJ4bF9fYnVpbGRfcHJlKCkgaXMgZ29pbmcgdG8gaGF2ZSB0
byBkaXN0aW5ndWlzaAo+IGJldHdlZW4gYSBicmFuZCBuZXcgVk0gdnMgb25lIHdoaWNoIGlzIGJl
aW5nIG1pZ3JhdGVkLWluL3Jlc3VtZWQuCgpUaGUgZGlzdGluY3Rpb24gYmV0d2VlbiBsaWJ4bF9f
YnVpbGRfcHJlIGFuZCB0aGVzZSBvdGhlciBmdW5jdGlvbnMgaXMKbm90IHBhcnRpY3VsYXJseSBw
cmluY2lwbGVkLiAgSXQgaXMgYSBsZWdhY3kgZnJvbSBhbiBvbGQgQVBJIChwcmlvciB0bwp0aGUg
ZXhpc3RpbmNlIG9mICpjcmVhdGUpIHdoZXJlIGxpYnhsIGNhbGxlcnMgd2VyZSBleHBlY3RlZCB0
byAiYnVpbGQiCmEgZG9tYWluIGZpcnN0IGFuZCB0aGVuIGRvIG90aGVyIHRoaW5ncyB0byBpdC4K
Ck1heWJlIGl0IHdvdWxkIGJlIGJldHRlciB0byBwYXNzIHRoaXMgdmlhIGxpYnhsX19kb21haW5f
YnVpbGRfc3RhdGUKcmF0aGVyIHRoYW4gYXMgYW4gYWRkaXRpb25hbCBwYXJhbWV0ZXIgPwoKSWFu
LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
