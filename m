Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF74B159667
	for <lists+xen-devel@lfdr.de>; Tue, 11 Feb 2020 18:43:05 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j1ZWN-00032g-II; Tue, 11 Feb 2020 17:40:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=bPZQ=37=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1j1ZWM-00032b-9k
 for xen-devel@lists.xenproject.org; Tue, 11 Feb 2020 17:40:26 +0000
X-Inumbo-ID: 94ed2b56-4cf5-11ea-8876-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 94ed2b56-4cf5-11ea-8876-bc764e2007e4;
 Tue, 11 Feb 2020 17:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1581442824;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=dFu5jZeT2NGrpQ8THwP1OuS67UjIjEC0VA8kKKNjiuU=;
 b=g1Zz+HiE74G58E+WITcjnBeUkosuRq0pO8t2bvAbzpDA66o9nbapLdXk
 BSsyq2R77G6JJZI6vk0tmzdaDSrIylpO3fqR5ECEE9W2D1QrVTChBO345
 cF1vUTF/lMOt932/omWoFrSdjlk6pvLUVSr6AuAJiNNjG4RKte5BCrJKZ g=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
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
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: PBZnluMOrUvh0jIW5Nvs5kl8Sfojo7I3LotZ8lUJZJTaPnYXly9faW09OrvOMn84Oqf61AAJhT
 VVJzLto03w6qo+MaIK6+6vSL05NtZdmLqhzzhTWSTM0L4ZDMbgsN3DnD2YDVBsFIxsD0IaSGxH
 k1ziVx/YYOfPg++uT3yXBDJjWtzR/0r9xdPKyy9Eyh7ER4LtU+BJZUUV/32cw/Nu7C12V5ZuQN
 JQpdgTtEd+BTVhIIio9wLcGlVpO/wHC/QXKNqH9YcE+j6BkPUa1V30AA/LTy0hLX6/ZPYIEIbC
 Z7Q=
X-SBRS: 2.7
X-MesageID: 12905570
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,428,1574139600"; d="scan'208";a="12905570"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24130.59140.693734.996659@mariner.uk.xensource.com>
Date: Tue, 11 Feb 2020 17:40:20 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20200205165056.11734-2-andrew.cooper3@citrix.com>
References: <20200205165056.11734-1-andrew.cooper3@citrix.com>
 <20200205165056.11734-2-andrew.cooper3@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH 1/6] tools/libxl: Remove libxl_cpuid_{set,
 apply_policy}() from the API
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

QW5kcmV3IENvb3BlciB3cml0ZXMgKCJbUEFUQ0ggMS82XSB0b29scy9saWJ4bDogUmVtb3ZlIGxp
YnhsX2NwdWlkX3tzZXQsYXBwbHlfcG9saWN5fSgpIGZyb20gdGhlIEFQSSIpOgo+IFRoZXNlIGZ1
bmN0aW9ucyBzaG91bGQgbmV2ZXIgaGF2ZSBiZWVuIGV4cG9zZWQuICBUaGV5IGRvbid0IGhhdmUg
ZXh0ZXJuYWwKPiB1c2VycywgYW5kIGNhbid0IHVzZWZ1bGx5IGJlIHVzZWQgZm9yIHNldmVyYWwg
cmVhc29ucy4KCkFja2VkLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNv
bT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
