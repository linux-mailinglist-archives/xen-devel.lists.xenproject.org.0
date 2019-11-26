Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 037D4109BA5
	for <lists+xen-devel@lfdr.de>; Tue, 26 Nov 2019 11:00:16 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZXbB-0005yb-Rr; Tue, 26 Nov 2019 09:57:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=up47=ZS=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iZXbA-0005yS-AF
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2019 09:57:32 +0000
X-Inumbo-ID: 2600dd4c-1033-11ea-a39d-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2600dd4c-1033-11ea-a39d-12813bfff9fa;
 Tue, 26 Nov 2019 09:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1574762247;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Q8O0Wdyns+iclyn20EZTODa4AZM62U9VX9mW5w7YiVY=;
 b=WFKWG9Nm8g2qQjoVHTCybI0IlyI/Cs2D/Xx6X0bwZFUz4uMBHC5FQLMY
 IRWEPySvnhDNjWIWPRqlXdtgT96i2bsm4vETBH1hxnYYW7z3JKykO7hIO
 uLhgz8NowCaq3++V6y6xRR3HIN66Ejul8kPi/ANYzvYuro3ZdJvUznmul s=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
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
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: LlIZq2qXdcFXZNJTCi5E3KP4Ov8aQujt4LULXkbYJhx2lSbKLqp3jyz59PReGWhgHg5jUmw3lG
 WOHVed5zpEv/LU8cvIQ5qN7riPmWt72dJ6HQXWpi5HJr8j1LGuLycRvvQHw1baD4CA9hJO4rtY
 yq9krnItdd/Ob1IzdfneCJ0ZvEMghplAnuQ7ObkDQjFGe6zpX9BnZNLbdZYoA96Yxq1ob4P/C6
 eOADd59TDo9W4s98N/GHo+A48u6raAi5P07YKUn4w0y35SPAK1OnlH3nrYgc1cQ/BvL9Wrv39d
 WxQ=
X-SBRS: 2.7
X-MesageID: 9249911
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,245,1571716800"; 
   d="scan'208";a="9249911"
Date: Tue, 26 Nov 2019 10:57:19 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20191126095719.GE980@Air-de-Roger>
References: <59a11ca9-d0df-f24d-b1df-8b1e02e73e3f@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <59a11ca9-d0df-f24d-b1df-8b1e02e73e3f@suse.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH] EFI: fix "efi=attr=" handling
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBOb3YgMjYsIDIwMTkgYXQgMDk6MjU6MjdBTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gQ29tbWl0IDYzM2E0MDk0NzMyMSAoImRvY3M6IEltcHJvdmUgZG9jdW1lbnRhdGlvbiBh
bmQgcGFyc2luZyBmb3IgZWZpPSIpCj4gZmFpbGVkIHRvIGhvbm9yIHRoZSBzdHJjbXAoKS1saWtl
IHJldHVybiB2YWx1ZSBjb252ZW50aW9uIG9mCj4gY21kbGluZV9zdHJjbXAoKS4KPiAKPiBSZXBv
cnRlZC1ieTogUm9tYW4gU2hhcG9zaG5payA8cm9tYW5AemVkZWRhLmNvbT4KPiBTaWduZWQtb2Zm
LWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpSZXZpZXdlZC1ieTogUm9nZXIg
UGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+CgpUaGFua3MsIFJvZ2VyLgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
