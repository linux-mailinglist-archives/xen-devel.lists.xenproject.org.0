Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 747B3155987
	for <lists+xen-devel@lfdr.de>; Fri,  7 Feb 2020 15:29:15 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j04b9-0001hb-FY; Fri, 07 Feb 2020 14:27:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=025r=33=citrix.com=sergey.dyasli@srs-us1.protection.inumbo.net>)
 id 1j04b8-0001h1-3A
 for xen-devel@lists.xen.org; Fri, 07 Feb 2020 14:27:10 +0000
X-Inumbo-ID: eb99af4e-49b5-11ea-b183-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id eb99af4e-49b5-11ea-b183-12813bfff9fa;
 Fri, 07 Feb 2020 14:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1581085628;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=VeOKgsLHbFVyDx7PMdA5REjoA1i7oADMZ0tHH54ICDk=;
 b=GQkJS9PRJ7DGwJYQOsle7B0Ej+vb46h4taFvk3wZH3I/EKD17qZenwQd
 GK46ZYSj+vM6+XSCwvMxbuQKmS5zVEQK7hCXJRxUdIAmc/u8mLhzGfta+
 lO18BhlNgPRN6roQNHUyWxr8JBc/zge4O3c4CVoFUVheAubysW29sQgeE 8=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=sergey.dyasli@citrix.com;
 spf=Pass smtp.mailfrom=sergey.dyasli@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 sergey.dyasli@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="sergey.dyasli@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 sergey.dyasli@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="sergey.dyasli@citrix.com";
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
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: cA4RYOaIu0S9s9ta9/oYmLKI0oPWh8qI67vWbWeID51CDJsqQPd92KqbQrXTSHxA52oIpyOEin
 mjHe3Ta8qJaLx6bWxbhkPfPX//GfH+LroBSmBFGi0coygnCqe3s209HCh5UBZXXmyCzAXVuB4O
 PGUH9uKK98jiE79sIwKNB4nDDtzDQBnEmUwfWuGxwwWQ35uDItVmyc/u6tx2xPf8HNSoFkXGUx
 LpxcLAHAu0+2zobEKKVhvS7bVrz3xR0/Fu2/Jn5GwUKtqlfFilhnqbj3ZzAl+TvbJrHpp+Ujfc
 aFo=
X-SBRS: 2.7
X-MesageID: 12106635
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,413,1574139600"; d="scan'208";a="12106635"
From: Sergey Dyasli <sergey.dyasli@citrix.com>
To: <xen-devel@lists.xen.org>, <kasan-dev@googlegroups.com>,
 <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>
Date: Fri, 7 Feb 2020 14:26:48 +0000
Message-ID: <20200207142652.670-1-sergey.dyasli@citrix.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 0/4] basic KASAN support for Xen PV domains
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
ICAgICAgfCAxMCArKysrKy0KIGFyY2gveDg2L3hlbi9NYWtlZmlsZSAgICAgICAgICAgICB8ICA3
ICsrKysKIGFyY2gveDg2L3hlbi9lbmxpZ2h0ZW5fcHYuYyAgICAgICB8ICAzICsrCiBhcmNoL3g4
Ni94ZW4vbW11X3B2LmMgICAgICAgICAgICAgfCA0MyArKysrKysrKysrKysrKysrKysrKysrCiBk
cml2ZXJzL25ldC94ZW4tbmV0YmFjay9jb21tb24uaCAgfCAgMiArLQogZHJpdmVycy9uZXQveGVu
LW5ldGJhY2svbmV0YmFjay5jIHwgNjAgKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLQog
ZHJpdmVycy94ZW4vTWFrZWZpbGUgICAgICAgICAgICAgIHwgIDIgKysKIGRyaXZlcnMveGVuL2dy
YW50LXRhYmxlLmMgICAgICAgICB8ICA1ICsrLQogaW5jbHVkZS9saW51eC9rYXNhbi5oICAgICAg
ICAgICAgIHwgIDIgKysKIGluY2x1ZGUveGVuL3hlbi1vcHMuaCAgICAgICAgICAgICB8IDEwICsr
KysrKwogbGliL0tjb25maWcua2FzYW4gICAgICAgICAgICAgICAgIHwgIDMgKy0KIG1tL2thc2Fu
L2luaXQuYyAgICAgICAgICAgICAgICAgICB8IDMyICsrKysrKysrKysrKy0tLS0tCiAxMiBmaWxl
cyBjaGFuZ2VkLCAxNTYgaW5zZXJ0aW9ucygrKSwgMjMgZGVsZXRpb25zKC0pCgotLSAKMi4xNy4x
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
