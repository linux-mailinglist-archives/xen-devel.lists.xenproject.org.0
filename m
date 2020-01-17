Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2027E140A62
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jan 2020 14:02:45 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1isRDR-0000am-Jy; Fri, 17 Jan 2020 12:59:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DzQF=3G=citrix.com=sergey.dyasli@srs-us1.protection.inumbo.net>)
 id 1isRDP-0000ab-Ls
 for xen-devel@lists.xen.org; Fri, 17 Jan 2020 12:59:07 +0000
X-Inumbo-ID: 1ad72947-3929-11ea-b50e-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1ad72947-3929-11ea-b50e-12813bfff9fa;
 Fri, 17 Jan 2020 12:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579265930;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=eUFpfewzCDJA8AIMqKbJFmmJ3o8RPdk06EsWQKEdESU=;
 b=SqV3Jw+Tp2NiAYvfTW5kieGxZtUF353yfeU3m1oq4oVSlZlvHmaPKbiu
 Hxas1Uz/NzSPuzZEh86B4uDxW/p/OJnP4k9py9iYMTWP+K2MMHhRsCF2w
 J8E11gVSZ1gHE+WV4Rbn2ylKvXetXtJUC3XVsm1uDVxVG6FTYILcDadm0 I=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=sergey.dyasli@citrix.com;
 spf=Pass smtp.mailfrom=sergey.dyasli@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 sergey.dyasli@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="sergey.dyasli@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 sergey.dyasli@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="sergey.dyasli@citrix.com";
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
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: cYJtGt6LdwnYC5653CHAMVVeanmloFH0E67hIHUgcoEZSsvCeioxQxxsBrqjj+K978/MaI/e/l
 0J6GlKAajUQftwzwGGBHrSj8NAWktiZYEAKXYGHyNfwtpBwT5jmqun2bgFtRIAG3cIlaw1nC8V
 r2bjF0mqnViaII8Tb7HRhu6yPIUvp3LYgE1ttmVwMSDjpx9mjnJXhYYSSp7bKeEIzOMtm0VtNR
 7zLfUwPEeCg7d0EhuOqk5VYtlpn6j2y/MicWZ524RsZvrLyKCqewKNMeWmyAYCzU+qFLZQ85A1
 5XU=
X-SBRS: 2.7
X-MesageID: 11502054
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,330,1574139600"; d="scan'208";a="11502054"
From: Sergey Dyasli <sergey.dyasli@citrix.com>
To: <xen-devel@lists.xen.org>, <kasan-dev@googlegroups.com>,
 <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>
Date: Fri, 17 Jan 2020 12:58:30 +0000
Message-ID: <20200117125834.14552-1-sergey.dyasli@citrix.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 0/4] basic KASAN support for Xen PV domains
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
Cc: Juergen Gross <jgross@suse.com>, Sergey Dyasli <sergey.dyasli@citrix.com>,
 Stefano
 Stabellini <sstabellini@kernel.org>, George Dunlap <george.dunlap@citrix.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Alexander Potapenko <glider@google.com>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>, Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBzZXJpZXMgYWxsb3dzIHRvIGJvb3QgYW5kIHJ1biBYZW4gUFYga2VybmVscyAoRG9tMCBh
bmQgRG9tVSkgd2l0aApDT05GSUdfS0FTQU49eS4gSXQgaGFzIGJlZW4gdXNlZCBpbnRlcm5hbGx5
IGZvciBzb21lIHRpbWUgbm93IHdpdGggZ29vZApyZXN1bHRzIGZvciBmaW5kaW5nIG1lbW9yeSBj
b3JydXB0aW9uIGlzc3VlcyBpbiBEb20wIGtlcm5lbC4KCk9ubHkgT3V0bGluZSBpbnN0cnVtZW50
YXRpb24gaXMgc3VwcG9ydGVkIGF0IHRoZSBtb21lbnQuCgpTZXJnZXkgRHlhc2xpICgyKToKICBr
YXNhbjogaW50cm9kdWNlIHNldF9wbWRfZWFybHlfc2hhZG93KCkKICB4ODYveGVuOiBhZGQgYmFz
aWMgS0FTQU4gc3VwcG9ydCBmb3IgUFYga2VybmVsCgpSb3NzIExhZ2Vyd2FsbCAoMik6CiAgeGVu
OiB0ZWFjaCBLQVNBTiBhYm91dCBncmFudCB0YWJsZXMKICB4ZW4vbmV0YmFjazogZml4IGdyYW50
IGNvcHkgYWNyb3NzIHBhZ2UgYm91bmRhcnkKCiBhcmNoL3g4Ni9tbS9rYXNhbl9pbml0XzY0LmMg
ICAgICAgfCAxMiArKysrKysrCiBhcmNoL3g4Ni94ZW4vTWFrZWZpbGUgICAgICAgICAgICAgfCAg
NyArKysrCiBhcmNoL3g4Ni94ZW4vZW5saWdodGVuX3B2LmMgICAgICAgfCAgMyArKwogYXJjaC94
ODYveGVuL21tdV9wdi5jICAgICAgICAgICAgIHwgMzggKysrKysrKysrKysrKysrKysrKysKIGRy
aXZlcnMvbmV0L3hlbi1uZXRiYWNrL2NvbW1vbi5oICB8ICAyICstCiBkcml2ZXJzL25ldC94ZW4t
bmV0YmFjay9uZXRiYWNrLmMgfCA2MCArKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tCiBk
cml2ZXJzL3hlbi9NYWtlZmlsZSAgICAgICAgICAgICAgfCAgMiArKwogZHJpdmVycy94ZW4vZ3Jh
bnQtdGFibGUuYyAgICAgICAgIHwgIDUgKystCiBpbmNsdWRlL3hlbi94ZW4tb3BzLmggICAgICAg
ICAgICAgfCAxMCArKysrKysKIGtlcm5lbC9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICB8ICAy
ICsrCiBsaWIvS2NvbmZpZy5rYXNhbiAgICAgICAgICAgICAgICAgfCAgMyArLQogbW0va2FzYW4v
aW5pdC5jICAgICAgICAgICAgICAgICAgIHwgMzIgKysrKysrKysrKysrLS0tLS0KIDEyIGZpbGVz
IGNoYW5nZWQsIDE1NCBpbnNlcnRpb25zKCspLCAyMiBkZWxldGlvbnMoLSkKCi0tIAoyLjE3LjEK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
