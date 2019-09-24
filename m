Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 974EDBC9E8
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2019 16:12:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iClW0-0005wD-Au; Tue, 24 Sep 2019 14:10:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Wx4c=XT=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iClVz-0005rR-37
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2019 14:10:03 +0000
X-Inumbo-ID: ffa44127-ded4-11e9-961e-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by localhost (Halon) with ESMTPS
 id ffa44127-ded4-11e9-961e-12813bfff9fa;
 Tue, 24 Sep 2019 14:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569334202;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=a92vHl1uwVHbp88SffZJ1pwSgWFJn1ADqRxYQp0shuI=;
 b=POPYRry00CM7hkJBSwDCWOo5dLS2sy0OoumvIIngO4AjrqLo9X6hCaYY
 s0f4GG0GuE2xAoS752p3Th0Ur0tp699KSD9pKa3cRo5nc0I/WwDGY5jyt
 fBf+otlU844C6wGcMbZbasfSib8p7rynONYUMWu2JBV5n+jvNU0oYgUze g=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: ckGxt9JHD7Q9ntEqamEDsUeXLZ+Q+m6ejozqWdLXkYQaG0L6eiFAkhfkQvtZ6Vo2SDzC4NPINi
 wP5XAtDsFW46QuET/zpeyhSCos6lB6ZL4CMxpd0/NfJQdNLLswCBG648KtkdCHgHlkGAyMc/j0
 N70kn4nJzY9tyD/WtanBsa+5/zRQmhVzoGadiTNp5bLZlvjMzH+R1g5ZEmppPd+3ddLc1ETX6D
 JeFEg22W3jOleUrnnkwQIdl2sV3hg8wi7yI8RpM/EktKVKFTOgeu514thjPo8AVLjIhPJnOrr5
 ABc=
X-SBRS: 2.7
X-MesageID: 5994884
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,544,1559534400"; 
   d="scan'208";a="5994884"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23946.9142.652599.628334@mariner.uk.xensource.com>
Date: Tue, 24 Sep 2019 15:09:58 +0100
To: Olaf Hering <olaf@aepfle.de>
In-Reply-To: <20190924140319.11303-3-olaf@aepfle.de>
References: <20190924140319.11303-1-olaf@aepfle.de>
 <20190924140319.11303-3-olaf@aepfle.de>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH RESEND v1 2/8] tools: move scripts from etc
 to libexec
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Wei
 Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T2xhZiBIZXJpbmcgd3JpdGVzICgiW1BBVENIIFJFU0VORCB2MSAyLzhdIHRvb2xzOiBtb3ZlIHNj
cmlwdHMgZnJvbSBldGMgdG8gbGliZXhlYyIpOgo+IEluIHRoZSBuZWFyIGZ1dHVyZSBhbGwgZnJl
c2ggaW5zdGFsbGF0aW9ucyB3aWxsIGhhdmUgYW4gZW1wdHkgL2V0Yy4KCkVyciwgbm8gPwoKSWFu
LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
