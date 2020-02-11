Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B81E415966F
	for <lists+xen-devel@lfdr.de>; Tue, 11 Feb 2020 18:44:44 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j1ZXk-00038O-U6; Tue, 11 Feb 2020 17:41:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=bPZQ=37=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1j1ZXi-00038E-SP
 for xen-devel@lists.xenproject.org; Tue, 11 Feb 2020 17:41:50 +0000
X-Inumbo-ID: c7f2607a-4cf5-11ea-b5f9-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c7f2607a-4cf5-11ea-b5f9-12813bfff9fa;
 Tue, 11 Feb 2020 17:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1581442910;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=33NzzmMb0kvfWWicapaIKwuf1+JZgTN2Az8r7IorhYU=;
 b=b5yC3cq/m4HyZBROZzR42LZVEfJwFz9urwSXtHtKCitLVHEbx/R+3WMt
 MjattsGx7vJtW4KzzUal9OhXHqw8ZsVlv2K2u7njwHzAwtvPFo0awLQyy
 qubXONtxDbhp+49ofEnV/5qmkPTt7j+1qDM8/x7Bqafe52ZGyoM2dPes5 M=;
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
IronPort-SDR: HaJhoGfN+N+qE3dBjIVG85lBF9TZWlWoSgqmViThwC7yOh8feNelcsBr0g/1BJt70J6NB/R9xz
 UYfiBl2dT1i5EZYJ7RqWvVUuOJmeszBznRtwKaqFwXcakdLkospbhGonVxNqvXOKOKshJhsXa2
 OHR6XdpiRJsprWUkX81D49JXcguj+zpe6EAzyOMQfJPZl5F0gRJLACBpSgrxlDaSxhpa1aPg8v
 czeHyVm6XGWeCztR3DKjT5XEcNzpUNhWREyqDE6atc0Fstdx4jO/cZGhGhNeYmAQ/NB0FoyNkj
 Wik=
X-SBRS: 2.7
X-MesageID: 12281545
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,428,1574139600"; d="scan'208";a="12281545"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24130.59226.229775.172752@mariner.uk.xensource.com>
Date: Tue, 11 Feb 2020 17:41:46 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20200205165056.11734-4-andrew.cooper3@citrix.com>
References: <20200205165056.11734-1-andrew.cooper3@citrix.com>
 <20200205165056.11734-4-andrew.cooper3@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH 3/6] tools/python: Drop cpuid helpers
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?=
 <marmarek@invisiblethingslab.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QW5kcmV3IENvb3BlciB3cml0ZXMgKCJbUEFUQ0ggMy82XSB0b29scy9weXRob246IERyb3AgY3B1
aWQgaGVscGVycyIpOgo+IFRoZXNlIGFyZSBiZWxpZXZlZC11bnVzZWQsIGFuZCB0aGUgdW5kZXJs
eWluZyBpbmZyYXN0cnVjdHVyZSBpcyBhYm91dCB0byBiZQo+IHJld3JpdHRlbiBjb21wbGV0ZWx5
LgoKQWNrZWQtYnk6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
