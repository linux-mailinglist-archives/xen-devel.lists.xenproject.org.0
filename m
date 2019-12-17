Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 574D3122E2F
	for <lists+xen-devel@lfdr.de>; Tue, 17 Dec 2019 15:10:56 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihDWj-0000bz-Nc; Tue, 17 Dec 2019 14:08:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6FKB=2H=citrix.com=sergey.dyasli@srs-us1.protection.inumbo.net>)
 id 1ihDWi-0000bk-DS
 for xen-devel@lists.xen.org; Tue, 17 Dec 2019 14:08:40 +0000
X-Inumbo-ID: b4939800-20d6-11ea-88e7-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b4939800-20d6-11ea-88e7-bc764e2007e4;
 Tue, 17 Dec 2019 14:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1576591712;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=6sVUlp5NLpAAtn28yCdoOs3OAGb5AYegKQzCNbECZMs=;
 b=N1stjRVoxnc/J57Lka0XXSeC7iNE/w6bMSHd4ekTHvM/oE/A6PnTUbiK
 sCEoafyLAj7v2wyRhzM7CtUm521L6Bhtp86k340S2Sqrlxsvtngdmyi93
 FuzQWHxCtnyZg4+iHh6HlujMK+Ld4iVY3b+PU/Kn2t6DjvgURcJEYc+UG I=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=sergey.dyasli@citrix.com;
 spf=Pass smtp.mailfrom=sergey.dyasli@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 sergey.dyasli@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="sergey.dyasli@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 sergey.dyasli@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="sergey.dyasli@citrix.com";
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
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Qz+c6mG1vz35ZJwUvyQJelqy2kgveD6KCcxwLp9FNQnAHJ1QazmJmY/dh1yXGSem3ftegBTm4h
 Cnoa+vMuS7jASwz1gwns4+0Ooh/Q4BdRskCgKFwt+mke0Kfk536ajFrYOAQ3wrQ/+TMZYB+swF
 m51kFtVRpixwwoen2tlLImLf8fjkYvCZuV9i+PAXJHKIlqbQZrssD8XfDLDXAuytnAwHcs/pK0
 f7ZgAKFYGsHtJvelXFOx4cqa2Q32g7tKRsSAxDY+Bi13vI1wQjAtg90OkDjradGyUnpdYPXrR+
 DZ8=
X-SBRS: 2.7
X-MesageID: 9817027
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,325,1571716800"; 
   d="scan'208";a="9817027"
From: Sergey Dyasli <sergey.dyasli@citrix.com>
To: <xen-devel@lists.xen.org>, <kasan-dev@googlegroups.com>,
 <linux-kernel@vger.kernel.org>
Date: Tue, 17 Dec 2019 14:08:01 +0000
Message-ID: <20191217140804.27364-1-sergey.dyasli@citrix.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [Xen-devel] [RFC PATCH 0/3] basic KASAN support for Xen PV domains
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
 Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBzZXJpZXMgYWxsb3dzIHRvIGJvb3QgYW5kIHJ1biBYZW4gUFYga2VybmVscyAoRG9tMCBh
bmQgRG9tVSkgd2l0aApDT05GSUdfS0FTQU49eS4gSXQgaGFzIGJlZW4gdXNlZCBpbnRlcm5hbGx5
IGZvciBzb21lIHRpbWUgbm93IHdpdGggZ29vZApyZXN1bHRzIGZvciBmaW5kaW5nIG1lbW9yeSBj
b3JydXB0aW9uIGlzc3VlcyBpbiBEb20wIGtlcm5lbC4KCk9ubHkgT3V0bGluZSBpbnN0cnVtZW50
YXRpb24gaXMgc3VwcG9ydGVkIGF0IHRoZSBtb21lbnQuCgpQYXRjaCAxIGlzIG9mIFJGQyBxdWFs
aXR5ClBhdGNoZXMgMi0zIGFyZSBpbmRlcGVuZGVudCBhbmQgcXVpdGUgc2VsZi1jb250YWluZWQu
CgpTZXJnZXkgRHlhc2xpICgxKToKICB4ODYveGVuOiBhZGQgYmFzaWMgS0FTQU4gc3VwcG9ydCBm
b3IgUFYga2VybmVsCgpSb3NzIExhZ2Vyd2FsbCAoMik6CiAgeGVuOiB0ZWFjaCBLQVNBTiBhYm91
dCBncmFudCB0YWJsZXMKICB4ZW4vbmV0YmFjazogRml4IGdyYW50IGNvcHkgYWNyb3NzIHBhZ2Ug
Ym91bmRhcnkgd2l0aCBLQVNBTgoKIGFyY2gveDg2L21tL2luaXQuYyAgICAgICAgICAgICAgICB8
IDE0ICsrKysrKysrCiBhcmNoL3g4Ni9tbS9rYXNhbl9pbml0XzY0LmMgICAgICAgfCAyOCArKysr
KysrKysrKysrKysrCiBhcmNoL3g4Ni94ZW4vTWFrZWZpbGUgICAgICAgICAgICAgfCAgNyArKysr
CiBhcmNoL3g4Ni94ZW4vZW5saWdodGVuX3B2LmMgICAgICAgfCAgMyArKwogYXJjaC94ODYveGVu
L21tdV9wdi5jICAgICAgICAgICAgIHwgMTMgKysrKysrLS0KIGFyY2gveDg2L3hlbi9tdWx0aWNh
bGxzLmMgICAgICAgICB8IDEwICsrKysrKwogZHJpdmVycy9uZXQveGVuLW5ldGJhY2svY29tbW9u
LmggIHwgIDIgKy0KIGRyaXZlcnMvbmV0L3hlbi1uZXRiYWNrL25ldGJhY2suYyB8IDU1ICsrKysr
KysrKysrKysrKysrKysrKysrKy0tLS0tLS0KIGRyaXZlcnMveGVuL01ha2VmaWxlICAgICAgICAg
ICAgICB8ICAyICsrCiBkcml2ZXJzL3hlbi9ncmFudC10YWJsZS5jICAgICAgICAgfCAgNSArKy0K
IGtlcm5lbC9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICB8ICAyICsrCiBsaWIvS2NvbmZpZy5r
YXNhbiAgICAgICAgICAgICAgICAgfCAgMyArLQogMTIgZmlsZXMgY2hhbmdlZCwgMTI4IGluc2Vy
dGlvbnMoKyksIDE2IGRlbGV0aW9ucygtKQoKLS0gCjIuMTcuMQoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
