Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E231BEA1BC
	for <lists+xen-devel@lfdr.de>; Wed, 30 Oct 2019 17:27:45 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iPqlx-0003KC-Qt; Wed, 30 Oct 2019 16:24:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BWtK=YX=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iPqlw-0003K7-3u
 for xen-devel@lists.xenproject.org; Wed, 30 Oct 2019 16:24:36 +0000
X-Inumbo-ID: bf8faad4-fb31-11e9-952d-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bf8faad4-fb31-11e9-952d-12813bfff9fa;
 Wed, 30 Oct 2019 16:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1572452671;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=zUr7l+IKdgnKMlTW4LGZfbQMG15JhccW1fuMk3Ky1NQ=;
 b=Vlq+Eu0PdcaOjt/GcKaC13huYJpvLbp30CAkcJggHfgaEtMW81fMraCk
 d7sHKAP1umEGj/IT6mEMu3c+67WVY5rfE+6Z0wike44s46hZMHxC2EYjQ
 wk129uWo+KWL+H0NWrY6Q06sRzTyNBXEd2UyNkllSgKfSGaAMVQUi/jpx c=;
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
IronPort-SDR: 1q4IdUVthfNBJTgbTZx5tuTjthA9b13PynVO/sZJETdVKp4TvkqhCu31hHpMDDS/ItJqjwcu6t
 MCwqwjHqPwCDrknunkVA1AqUzOu4dvkD4AmwfVz7kJ7bDsH1cekDBtTZC9fwKQeFk03ETMzQda
 fguN18zMCkW4pcyamDizWc2Lnd56x7+bx5q4ceTBsqecm9JBmsTGmEY9riB2/cNer2W+Jb381t
 dIsXf8Lzvtj8lTPpqvTkr8O9+067D2M30CY1Ei/fe3ZgY3ZDGjSdzW+9ecN37cy8vP8HWKS+nc
 1yo=
X-SBRS: 2.7
X-MesageID: 7631223
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,248,1569297600"; 
   d="scan'208";a="7631223"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23993.47418.413147.652579@mariner.uk.xensource.com>
Date: Wed, 30 Oct 2019 16:24:26 +0000
To: Stefano Stabellini <sstabellini@kernel.org>
In-Reply-To: <alpine.DEB.2.21.1910241105580.3633@sstabellini-ThinkPad-T480s>
References: <osstest-143061-mainreport@xen.org>
 <45b32f7a-4dcd-c576-4d3f-387cec4d91e2@suse.com>
 <e0864a74-876d-73ab-f6f1-de4b41d35bf4@arm.com>
 <alpine.DEB.2.21.1910241105580.3633@sstabellini-ThinkPad-T480s>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: [Xen-devel] rochester boot loader serial output issue (was Re:
 [xen-unstable test] 143061: regressions - trouble: broken/fail/pass)
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
Cc: =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Julien Grall <julien.grall@arm.com>,
 osstest service owner <osstest-admin@xenproject.org>,
 "brian.woods@xilinx.com" <brian.woods@xilinx.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

U3RlZmFubyBTdGFiZWxsaW5pIHdyaXRlcyAoIlJlOiBbWGVuLWRldmVsXSBbeGVuLXVuc3RhYmxl
IHRlc3RdIDE0MzA2MTogcmVncmVzc2lvbnMgLSB0cm91YmxlOiBicm9rZW4vZmFpbC9wYXNzIik6
Cj4gQW5kIEkgZG8gaGF2ZSBhIHN1Z2dlc3Rpb24gZm9yIHNvbWVib2R5IGVsc2UgdG8gcGljayB0
aGlzIHVwOiBCcmlhbgo+IChDQydlZCkgaGFzIGpvaW5lZCBYaWxpbnggcmVjZW50bHkgYW5kIG1p
Z2h0IGJlIHdpbGxpbmcgdG8gaGVscCBvbiB0aGlzLgo+IEhvd2V2ZXIsIHdlIHdvdWxkIG5lZWQg
dG8gZ2l2ZSBoaW0gYWNjZXNzIHRvIHRoZSBjb2xvIGZvciBoaW0gdG8gYmUgYWJsZQo+IHRvIG1h
a2UgYW55IHByb2dyZXNzLgoKSGkuICBPZmZsaW5lIHdlIGV4Y2hhbmdlZCBkZXRhaWxzIGFuZCBC
cmlhbiBub3cgaGFzIGFjY2VzcyB0byB0aGUKY29sby4gIEknbGwgc2VuZCBhIGJyaWVmaW5nIGJ5
IHByaXZhdGUgZW1haWwuCgpCcmlhbiwgYXJlIHlvdSBhdmFpbGFibGUgdG8gd29yayBvbiB0aGlz
IG5vdyA/ICBJZiBzbyBJIHdpbGwgc2V0IHVwIGEKYW4gYXV0b21hdGljIHJlcHJvIG9mIHRoZSBw
cm9ibGVtIG9uIG9uZSBvZiBvdXIgdHdvIGFmZmVjdGVkIGJveGVzLgpUaGlzIHdpbGwgYm9vayBv
dXQgdGhlIGJveCBmb3IgeW91IHRvIHBsYXkgd2l0aC4KCkl0J3MgcHJvYmFibHkgYmVzdCBpZiB3
ZSBuZWdvdGlhdGUgaW4gZGV0YWlsIG9uICN4ZW5kZXZlbCwgc28sIEJyaWFuLApwbGVhc2UgcmVw
bHkgdGhlcmUuICBJbiBwYXJ0aWN1bGFyIEkgYW0gb2Z0ZW4gb24gSVJDIG91dCBvZiBteSB1c3Vh
bAp3b3JraW5nIGhvdXJzLCB3aGVuIEkgbWF5IG5vdCBiZSByZWFkaW5nIG15IGVtYWlsLgoKSWFu
LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
