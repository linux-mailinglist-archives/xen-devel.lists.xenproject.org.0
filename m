Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF8D513CEFF
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2020 22:31:24 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1irqB6-0006BY-S6; Wed, 15 Jan 2020 21:26:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5wAN=3E=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1irqB4-0006BT-OO
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2020 21:26:14 +0000
X-Inumbo-ID: a5ce51b6-37dd-11ea-862b-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a5ce51b6-37dd-11ea-862b-12813bfff9fa;
 Wed, 15 Jan 2020 21:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579123570;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=98bCfgpYSTzTwR1IBy63Pdf4ku+BtiTNKXhT1pbPvyU=;
 b=PIg3EeOuqmGm6o2nQoohAKsg1H1aUW0G4Xww4RLWj7fyQl38U8feS+4d
 yT3boWR/lh2k8O/oddqRqdN6xBxT67fAZGCMS1ucFXP/TVfwrwM90J6Sv
 t2jFzD/UvRtbehIMBnFN5UXu+q+afrFNr7CLcnPAEKrwJtNCfAmTEQqbk Y=;
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
IronPort-SDR: eQRA2wPyiJXSSodKK1d5iZ2tNxpFitWb8EWyMEvZt51DtSetF4fYN8dJFBDnveVawLu6LfcmZU
 VNpewRW1t3FHrw/kjPd9JB+1BGI2TTDZ793uniCGlefFZl/mh+RPxeOox1N947YciobGAsvaot
 8lSas4CBzNQULIIZiD6q7QLXfeuafjS94Af7tr/qo2qfFYV+HqypxoJvunoZPD6kzhZhzM/3IO
 Nd1xQzFlBK1lo3qUb9lgs/Jsb4FW6Wcb0MgZFK6sW8cQ034PNTjvhsdxmQBCMq0UsobSzMrd5u
 U3I=
X-SBRS: 2.7
X-MesageID: 10967815
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,323,1574139600"; d="scan'208";a="10967815"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24095.33646.912059.569413@mariner.uk.xensource.com>
Date: Wed, 15 Jan 2020 21:26:06 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20200115185347.26079-1-andrew.cooper3@citrix.com>
References: <20191224151932.6304-1-andrew.cooper3@citrix.com>
 <20200115185347.26079-1-andrew.cooper3@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH 0.5/12] tools/migration: Formatting and
 style cleanup
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QW5kcmV3IENvb3BlciB3cml0ZXMgKCJbUEFUQ0ggMC41LzEyXSB0b29scy9taWdyYXRpb246IEZv
cm1hdHRpbmcgYW5kIHN0eWxlIGNsZWFudXAiKToKPiBUaGUgY29kZSBoYXMgZGV2YXRpbmcgZnJv
bSB0aGUgcHJldmFpbGluZyBzdHlsZSBpbiBtYW55IHdheXMuICBBZGp1c3Qgc3BhY2luZywKPiBp
bmRlbnRhdGlvbiwgcG9zaXRpb24gb2Ygb3BlcmF0b3JzLCBsYXlvdXQgb2YgbXVsdGlsaW5lIGNv
bW1lbnRzLCByZW1vdmFsIG9mCj4gc3VwZXJmbHVvdXMgY29tbWVudHMsIGNvbnN0bmVzcywgdHJh
aWxpbmcgY29tbWFzLCBhbmQgdXNlIG9mIHVucXVhbGlmaWVkCj4gJ3Vuc2lnbmVkJy4KPiAKPiBO
byBmdW5jdGlvbmFsIGNoYW5nZS4KCkFja2VkLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25A
ZXUuY2l0cml4LmNvbT4KClRoYW5rcywKSWFuLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
