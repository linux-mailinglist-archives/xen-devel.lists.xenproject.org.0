Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB8FC159670
	for <lists+xen-devel@lfdr.de>; Tue, 11 Feb 2020 18:45:09 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j1ZYx-0003FM-AG; Tue, 11 Feb 2020 17:43:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=bPZQ=37=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1j1ZYw-0003FF-4U
 for xen-devel@lists.xenproject.org; Tue, 11 Feb 2020 17:43:06 +0000
X-Inumbo-ID: f42d2ed7-4cf5-11ea-b5f9-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f42d2ed7-4cf5-11ea-b5f9-12813bfff9fa;
 Tue, 11 Feb 2020 17:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1581442985;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=nK2tTynnmf5EVcm56lvseiHsVL9kejCXLF/SjXlnAZ4=;
 b=WPy8FPiZKw7rnxDWeHBBsFV5uMe8fMTYlGwWsAlO8M1aE5WyuqkC07En
 vtUV1/9pI2yz4Feg+YFmpcSFMqwr19+nZNJAMzE3Nho8lhw7gS5uq4Hf6
 XukFdjUBcwIrp46NAXSTaFCC/n+n23dCipnjtbS2BDfCYYC+B2Pf6m1Km k=;
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
IronPort-SDR: ZoPvhOOMxArgYT15MQ+LDwjrwsABO/aJSbEDjZKKzcOyQzpQLG6ZkKjHTzKS62fpXcm4tXVLXS
 MeZF2Unu06Itk9PqnRXPM7nFi4mz9xpSQ1V/M7QwxEpBo8onAfs0Uq3cI3PzMVEBAz3sa1uB9X
 2VwBjVwtmxrey8qtanuD4aEXbnHM5HDOmlSKet3+JtNpKXjgPjBdcG3yZbYwoQwHRFF1CLE6oB
 t3OZ6efpmrhtGqvcNq5qzkgg4P+FBDWEvDTirWkS9Uk/kn4DD045LPfhwM2XwYzp3MgjLL560H
 fUs=
X-SBRS: 2.7
X-MesageID: 12655816
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,428,1574139600"; d="scan'208";a="12655816"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24130.59302.14046.860827@mariner.uk.xensource.com>
Date: Tue, 11 Feb 2020 17:43:02 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20200205165056.11734-5-andrew.cooper3@citrix.com>
References: <20200205165056.11734-1-andrew.cooper3@citrix.com>
 <20200205165056.11734-5-andrew.cooper3@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH 4/6] tools/libxl: Combine legacy CPUID
 handling logic
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

QW5kcmV3IENvb3BlciB3cml0ZXMgKCJbUEFUQ0ggNC82XSB0b29scy9saWJ4bDogQ29tYmluZSBs
ZWdhY3kgQ1BVSUQgaGFuZGxpbmcgbG9naWMiKToKPiBXaGlsZSB3ZSBhcmUgaW4gdGhlIHByb2Nl
c3Mgb2Ygb3ZlcmhhdWxpbmcgYm9vdCB0aW1lIENQVUlEL01TUiBoYW5kbGluZywgdGhlCj4gZXhp
c3RpbmcgbG9naWMgaXMgZ29pbmcgdG8gaGF2ZSB0byByZW1haW4gaW4gcm91Z2hseSB0aGlzIGZv
cm0gZm9yIGJhY2t3YXJkcwo+IGNvbXBhdGliaWxpdHkuCj4gCj4gRm9sZCBsaWJ4bF9fY3B1aWRf
YXBwbHlfcG9saWN5KCkgYW5kIGxpYnhsX19jcHVpZF9zZXQoKSB0b2dldGhlciBpbnRvIGEgc2lu
Z2xlCj4gbGlieGxfX2NwdWlkX2xlZ2FjeSgpIHRvIHJlZHVjZSB0aGUgY29tcGxleGl0eSBmb3Ig
Y2FsbGVycy4KCkFja2VkLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNv
bT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
