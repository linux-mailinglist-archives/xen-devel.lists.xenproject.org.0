Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16C0C13460D
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2020 16:24:03 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipD9H-0003rt-4R; Wed, 08 Jan 2020 15:21:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cZrZ=25=citrix.com=sergey.dyasli@srs-us1.protection.inumbo.net>)
 id 1ipD9F-0003qx-8o
 for xen-devel@lists.xen.org; Wed, 08 Jan 2020 15:21:29 +0000
X-Inumbo-ID: 83491eae-322a-11ea-b82c-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 83491eae-322a-11ea-b82c-12813bfff9fa;
 Wed, 08 Jan 2020 15:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1578496876;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=Ao9HMdTBC+XACEJ1rqPy+5n52e0DdI0N2KnnuQhp+To=;
 b=Wbed+Rur2lz782WmyCWa89fvV5xes7WIwgv5botYkzl1YaAHjq8t7/wf
 CZDq6DTbUXyfxa8AktLcUIaTEpZwF0k+7Fp4y8Dkhhnes8kQhEIlWvSHM
 RZkBAe6y70JPfKBZ/TpuDoMdwRNjqt8YSFoFf5JD6AgVR8zR+7F5pdQoM E=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=sergey.dyasli@citrix.com;
 spf=Pass smtp.mailfrom=sergey.dyasli@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 sergey.dyasli@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="sergey.dyasli@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 sergey.dyasli@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="sergey.dyasli@citrix.com";
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
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: aV70Ec38LNGJHPyjmtz3ubeiTnr6mtH+1TOCC+rUdQpsyHfc0ycOuyMkNd8LI/THZ/TU7JqOOv
 J2EMt9YDA3dz5/DokVaJH6CTl/S0dcoWuwQeuBL5EH1lDvJUBxJqjLZyyVNAI0xRXUYaVc5/zQ
 J7xZ4F3n5EcB47TJwb3p9tdkRo8vRuUyZJfApAh7tNh38bQRzOPlTFDSL0Yg3gR6ny8iCS01/a
 4leaynRNcoOnKITm0n+jg6lZkAlEuZPd30A4iqTn7Uns0uulDWrjpKs47Vvht/MLdLQUgcxrLU
 Eaw=
X-SBRS: 2.7
X-MesageID: 11004140
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,410,1571716800"; d="scan'208";a="11004140"
From: Sergey Dyasli <sergey.dyasli@citrix.com>
To: <xen-devel@lists.xen.org>, <kasan-dev@googlegroups.com>,
 <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>
Date: Wed, 8 Jan 2020 15:20:56 +0000
Message-ID: <20200108152100.7630-1-sergey.dyasli@citrix.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v1 0/4] basic KASAN support for Xen PV domains
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
OiB0ZWFjaCBLQVNBTiBhYm91dCBncmFudCB0YWJsZXMKICB4ZW4vbmV0YmFjazogRml4IGdyYW50
IGNvcHkgYWNyb3NzIHBhZ2UgYm91bmRhcnkgd2l0aCBLQVNBTgoKIGFyY2gveDg2L21tL2thc2Fu
X2luaXRfNjQuYyAgICAgICB8IDEyICsrKysrKysKIGFyY2gveDg2L3hlbi9NYWtlZmlsZSAgICAg
ICAgICAgICB8ICA3ICsrKysKIGFyY2gveDg2L3hlbi9lbmxpZ2h0ZW5fcHYuYyAgICAgICB8ICAz
ICsrCiBhcmNoL3g4Ni94ZW4vbW11X3B2LmMgICAgICAgICAgICAgfCAzOSArKysrKysrKysrKysr
KysrKysrKwogZHJpdmVycy9uZXQveGVuLW5ldGJhY2svY29tbW9uLmggIHwgIDIgKy0KIGRyaXZl
cnMvbmV0L3hlbi1uZXRiYWNrL25ldGJhY2suYyB8IDU5ICsrKysrKysrKysrKysrKysrKysrKysr
KystLS0tLS0KIGRyaXZlcnMveGVuL01ha2VmaWxlICAgICAgICAgICAgICB8ICAyICsrCiBkcml2
ZXJzL3hlbi9ncmFudC10YWJsZS5jICAgICAgICAgfCAgNSArKy0KIGluY2x1ZGUveGVuL3hlbi1v
cHMuaCAgICAgICAgICAgICB8ICA0ICsrKwoga2VybmVsL01ha2VmaWxlICAgICAgICAgICAgICAg
ICAgIHwgIDIgKysKIGxpYi9LY29uZmlnLmthc2FuICAgICAgICAgICAgICAgICB8ICAzICstCiBt
bS9rYXNhbi9pbml0LmMgICAgICAgICAgICAgICAgICAgfCAyNSArKysrKysrKy0tLS0tCiAxMiBm
aWxlcyBjaGFuZ2VkLCAxNDEgaW5zZXJ0aW9ucygrKSwgMjIgZGVsZXRpb25zKC0pCgotLSAKMi4x
Ny4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
