Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16BE717ADE4
	for <lists+xen-devel@lfdr.de>; Thu,  5 Mar 2020 19:11:11 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j9uup-000688-ME; Thu, 05 Mar 2020 18:08:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=KIN4=4W=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j9uun-000683-Jv
 for xen-devel@lists.xenproject.org; Thu, 05 Mar 2020 18:08:09 +0000
X-Inumbo-ID: 44a11170-5f0c-11ea-a64b-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 44a11170-5f0c-11ea-a64b-12813bfff9fa;
 Thu, 05 Mar 2020 18:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1583431688;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=0U/65f10R+flww82gS29OH1omttrzrs7fz89utw0oAg=;
 b=B5RgpOrpq6g5kdysRciwya0uRkhn/XxfW+8GeSfg2YV7LDBMIqzophEx
 8LGbijcg5gmvGVfbsR0Guwh6t/VNOiN3mC7EcbUMqo/pWjHmZdhxsAQBe
 2zVT79xBPHbq4iDwZWaCNGIu/pQYbz+XEVgu5HgjJe8aQEGp850vOA2Xn Y=;
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
IronPort-SDR: UOvcEd8rlts5GWgYAANeKl4F/oPCyzC4A8QNIrPHsdoWsrX9uMzPEt92hEa+sK7iDnncM1WHHI
 VH9AvhAcV/LXuZQSwVh9dUuG4NBStyP4qTGFNhu9B0LKJhHySlxGt6iz4QSZcZ5sENgnrF+vWu
 nDo7iv2lO99gRZQz3b3wCPTjIND/1FGz79uZTsezSYsuqX9t9dqAqbTP1yt7BNZtOamySlMF9U
 rQwZ6bSqMlYS+0KWyQR8FnNBvJLGgcf616RHjmAETzUTOm9NSv18flXtB3cKGOT+4AXiXFz4TK
 C88=
X-SBRS: 2.7
X-MesageID: 14109880
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,518,1574139600"; d="scan'208";a="14109880"
Date: Thu, 5 Mar 2020 19:08:01 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20200305180252.GX24458@Air-de-Roger.citrite.net>
References: <20200305180009.11365-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200305180009.11365-1-andrew.cooper3@citrix.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH] x86/dom0: Fix build with clang
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBNYXIgMDUsIDIwMjAgYXQgMDY6MDA6MDlQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBmaW5kX21lbW9yeSgpIGlzbid0IG1hcmtlZCBhcyBfX2luaXQsIHNvIGlmIGl0IGlz
bid0IGZ1bGx5IGlubGluZWQsIGl0IGVuZHMgdXAKPiB0cmlwcGluZzoKPiAKPiAgIEVycm9yOiBz
aXplIG9mIGRvbTBfYnVpbGQubzoudGV4dCBpcyAweDBjMQo+IAo+IEZpeGVzOiA3M2I0N2VlYTIx
ICJ4ODYvZG9tMDogaW1wcm92ZSBQVkggaW5pdHJkIGFuZCBtZXRhZGF0YSBwbGFjZW1lbnQiCj4g
U2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4K
ClRoYW5rcyEKClJldmlld2VkLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4
LmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
