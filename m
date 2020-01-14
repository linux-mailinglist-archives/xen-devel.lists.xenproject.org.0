Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20A0713B1D7
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jan 2020 19:16:12 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1irQgY-0005yI-FF; Tue, 14 Jan 2020 18:13:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=QqHR=3D=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1irQgW-0005yD-Lm
 for xen-devel@lists.xenproject.org; Tue, 14 Jan 2020 18:13:00 +0000
X-Inumbo-ID: 7cbbadc7-36f9-11ea-841f-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7cbbadc7-36f9-11ea-841f-12813bfff9fa;
 Tue, 14 Jan 2020 18:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579025576;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=Zfl5BQDymQtr77fOLBHjtS84jU9yS620wo07e1F/O7A=;
 b=Wq8Uxp+K+OQ4UdBqWznHrBNtkVkRhTmc9OubSSrBkRgo5XhdgUh2FoIg
 11b2m9R/EaiPuMI1TYwYDz3u2HCEQLwBGaLaVvVNFzJRXn0Gh/hyUzbqF
 FeVOuqSuaH0qMSMKakg78CvSll4ymQr76dLl6qJ1X34n6ybD5N+rqZqtO s=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: ulK0k3Pbqx9GFLZVcr8J8kU4R+ML2274tYcmxCnowqYxvive72nvXTkJVrAXWgBAev/t8KCHOr
 Gn1FdU5yfqFTSv91SBnGGtivVq2A6a4KaxqGgLlXcFtk1wLe0IrMu5I9ur33bUqWJWT7esc22y
 KpUkPkdX91ZMay2TGIL1zeWZ5rhrHQjxlyDwgAyFzY64LGAYfVJj43lwQ3uf49lEeuIqfKwd/i
 o8YvY1d9CkbbT6kAqq3/uV2e8CjvQ+OYdvB3znBA8/CnRB22lgLBncGoHVhWdfSEUwjGjdso23
 do4=
X-SBRS: 2.7
X-MesageID: 11335708
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,319,1574139600"; d="scan'208";a="11335708"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24094.1189.347091.823311@mariner.uk.xensource.com>
Date: Tue, 14 Jan 2020 18:12:53 +0000
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
In-Reply-To: <bab3479b-4a58-0b9c-ad88-1973adae2e62@citrix.com>
References: <20200103130616.13724-1-andrew.cooper3@citrix.com>
 <20200103130616.13724-6-andrew.cooper3@citrix.com>
 <24093.64337.28541.363727@mariner.uk.xensource.com>
 <bab3479b-4a58-0b9c-ad88-1973adae2e62@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH 19/20] tools/libxl: Re-position CPUID
 handling during domain construction
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

QW5kcmV3IENvb3BlciB3cml0ZXMgKCJSZTogW1BBVENIIDE5LzIwXSB0b29scy9saWJ4bDogUmUt
cG9zaXRpb24gQ1BVSUQgaGFuZGxpbmcgZHVyaW5nIGRvbWFpbiBjb25zdHJ1Y3Rpb24iKToKPiBP
biAxNC8wMS8yMDIwIDE3OjMzLCBJYW4gSmFja3NvbiB3cm90ZToKPiA+IElzIGl0IHBvc3NpYmxl
IHRvIHNwbGl0IG91dCB0aGUgY2hhbmdlIHRvIHRoZSBzZXF1ZW5jaW5nLCBmcm9tIHRoZSBuZXcK
PiA+IGZ1bmN0aW9uYWxpdHkgPwo+IAo+IE5vdCBlYXNpbHksIG5vLgoKVGhhbmtzIGZvciB0aGUg
ZXhwbGFuYXRpb24uICBJIHJlYWQgaXQgYWdhaW4gd2l0aCB0aGF0IGluIG1pbmQuCgpBY2tlZC1i
eTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
