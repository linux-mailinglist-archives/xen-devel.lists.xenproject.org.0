Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B386E974DD
	for <lists+xen-devel@lfdr.de>; Wed, 21 Aug 2019 10:24:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i0Ltd-0003p0-6e; Wed, 21 Aug 2019 08:23:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5qki=WR=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1i0Ltb-0003mz-04
 for xen-devel@lists.xenproject.org; Wed, 21 Aug 2019 08:23:07 +0000
X-Inumbo-ID: e603e40e-c3ec-11e9-8980-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e603e40e-c3ec-11e9-8980-bc764e2007e4;
 Wed, 21 Aug 2019 08:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1566375786;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=cDsTbg+gYXCSha21QNGtKKOhqh33I3xRlKP80Cy+ANg=;
 b=DRKzd/zR1dAB5zG2mn6ttrAllHsWHI7sNw5i5udgWfwBXRM1vDbwWDKB
 emLBKFqU0JgYhZvzkonxnRSCI7xP2MlLJRE3CqRGwPY0dKkzNdUHBngLy
 RE7DSyslobTV+b5aS4lskDWTvU4o0DFQjd1USib4sD4F+CvBnhwLPMlfN k=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=paul.durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 paul.durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="paul.durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: KLkfprOzVJjGwWkMXdCV6hNOk01tB8a0K74x/t5Moo4AUxwYiHZDRZhZTvOL8GSxjKgfGc5nrH
 ZPyVcwAE/Ba9yydcmuTndxonGiks6GMZ8I4TU6+8EW9MenRRULkGUtTIfA01ZruS5E2xo8V2jk
 3j8Xs2qRc28wXWHlCcO7MBoRjz7eiHcUSKqrUUbv00yrlSyEN//FKx6K9AK/C4izK4bpnzOH1q
 IuxK/Zlz6mB9XtiNJCCGopcdgDxfqEiizl+CdM7ETM5ezlnwVlXvIrbtoc6XpCKC7ZVqJfjU1s
 Rbw=
X-SBRS: 2.7
X-MesageID: 4515699
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,412,1559534400"; 
   d="scan'208";a="4515699"
From: Paul Durrant <paul.durrant@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 21 Aug 2019 09:22:58 +0100
Message-ID: <20190821082258.36549-1-paul.durrant@citrix.com>
X-Mailer: git-send-email 2.20.1.2.gb21ebb671
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] viridian: make viridian_time_domain_freeze()
 safe to call...
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <paul.durrant@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Li4ub24gYSBwYXJ0aWFsbHkgZGVzdHJveWVkIGRvbWFpbi4KCnZpcmlkaWFuX3RpbWVfZG9tYWlu
X2ZyZWV6ZSgpIGFuZCB2aXJpZGlhbl90aW1lX3ZjcHVfZnJlZXplKCkgcmVseQoocmVzcGVjdGl2
ZWx5KSBvbiB0aGUgZHluYW1pY2FsbHkgYWxsb2NhdGVkIHBlci1kb21haW4gYW5kIHBlci12Y3B1
IHZpcmlkaWFuCmFyZWFzIFsxXSwgd2hpY2ggYXJlIGZyZWVkIGR1cmluZyBkb21haW5fcmVsaW5x
dWlzaF9yZXNvdXJjZXMoKS4KQmVjYXVzZSBhcmNoX2RvbWFpbl9wYXVzZSgpIGNhbiBjYWxsIHZp
cmlkaWFuX2RvbWFpbl90aW1lX2ZyZWV6ZSgpIHRoaXMKY2FuIGxlYWQgdG8gaG9zdCBjcmFzaGVz
IGlmIGUuZy4gYSBYRU5fRE9NQ1RMX3BhdXNlZG9tYWluIGlzIGlzc3VlZCBhZnRlcgpkb21haW5f
cmVsaW5xdWlzaF9yZXNvdXJjZXMoKSBoYXMgcnVuLgoKVG8gcHJldmVudCBzdWNoIGNyYXNoZXMs
IHRoaXMgcGF0Y2ggYWRkcyBhIGNoZWNrIG9mIGlzX2R5aW5nIGludG8KdmlyaWRpYW5fdGltZV9k
b21haW5fZnJlZXplKCksIGFuZCB2aXJpZGlhbl90aW1lX2RvbWFpbl90aGF3KCkgd2hpY2ggaXMK
c2ltaWxhcmx5IHZ1bG5lcmFibGUgdG8gaW5kaXJlY3Rpb24gaW50byBmcmVlZCBtZW1vcnkuCgpO
T1RFOiBUaGUgcGF0Y2ggYWxzbyBtYWtlcyB2aXJpZGlhbl90aW1lX3ZjcHVfZnJlZXplL3RoYXco
KSBzdGF0aWMsIHNpbmNlCiAgICAgIHRoZXkgaGF2ZSBubyBjYWxsZXJzIG91dHNpZGUgb2YgdGhl
IHNhbWUgc291cmNlIG1vZHVsZS4KClsxXSBTZWUgY29tbWl0IGU3YTliNWU3MmYyNiAidmlyaWRp
YW46IHNlcGFyYXRlbHkgYWxsb2NhdGUgZG9tYWluIGFuZCB2Y3B1CiAgICBzdHJ1Y3R1cmVzIi4K
ClNpZ25lZC1vZmYtYnk6IFBhdWwgRHVycmFudCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+Ci0t
LQpDYzogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpDYzogQW5kcmV3IENvb3BlciA8
YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KQ2M6IFdlaSBMaXUgPHdsQHhlbi5vcmc+CkNjOiAi
Um9nZXIgUGF1IE1vbm7DqSIgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgotLS0KIHhlbi9hcmNoL3g4
Ni9odm0vdmlyaWRpYW4vdGltZS5jIHwgOCArKysrLS0tLQogMSBmaWxlIGNoYW5nZWQsIDQgaW5z
ZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvaHZt
L3ZpcmlkaWFuL3RpbWUuYyBiL3hlbi9hcmNoL3g4Ni9odm0vdmlyaWRpYW4vdGltZS5jCmluZGV4
IGFjMDg3MzgzYzguLmU4MDMzMGE2YWUgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9odm0vdmly
aWRpYW4vdGltZS5jCisrKyBiL3hlbi9hcmNoL3g4Ni9odm0vdmlyaWRpYW4vdGltZS5jCkBAIC0y
OTYsNyArMjk2LDcgQEAgdm9pZCB2aXJpZGlhbl90aW1lX3BvbGxfdGltZXJzKHN0cnVjdCB2Y3B1
ICp2KQogICAgICAgICBwb2xsX3N0aW1lcih2LCBpKTsKIH0KIAotdm9pZCB2aXJpZGlhbl90aW1l
X3ZjcHVfZnJlZXplKHN0cnVjdCB2Y3B1ICp2KQorc3RhdGljIHZvaWQgdmlyaWRpYW5fdGltZV92
Y3B1X2ZyZWV6ZShzdHJ1Y3QgdmNwdSAqdikKIHsKICAgICBzdHJ1Y3QgdmlyaWRpYW5fdmNwdSAq
dnYgPSB2LT5hcmNoLmh2bS52aXJpZGlhbjsKICAgICB1bnNpZ25lZCBpbnQgaTsKQEAgLTMxNCw3
ICszMTQsNyBAQCB2b2lkIHZpcmlkaWFuX3RpbWVfdmNwdV9mcmVlemUoc3RydWN0IHZjcHUgKnYp
CiAgICAgfQogfQogCi12b2lkIHZpcmlkaWFuX3RpbWVfdmNwdV90aGF3KHN0cnVjdCB2Y3B1ICp2
KQorc3RhdGljIHZvaWQgdmlyaWRpYW5fdGltZV92Y3B1X3RoYXcoc3RydWN0IHZjcHUgKnYpCiB7
CiAgICAgc3RydWN0IHZpcmlkaWFuX3ZjcHUgKnZ2ID0gdi0+YXJjaC5odm0udmlyaWRpYW47CiAg
ICAgdW5zaWduZWQgaW50IGk7CkBAIC0zMzYsNyArMzM2LDcgQEAgdm9pZCB2aXJpZGlhbl90aW1l
X2RvbWFpbl9mcmVlemUoY29uc3Qgc3RydWN0IGRvbWFpbiAqZCkKIHsKICAgICBzdHJ1Y3QgdmNw
dSAqdjsKIAotICAgIGlmICggIWlzX3ZpcmlkaWFuX2RvbWFpbihkKSApCisgICAgaWYgKCBkLT5p
c19keWluZyB8fCAhaXNfdmlyaWRpYW5fZG9tYWluKGQpICkKICAgICAgICAgcmV0dXJuOwogCiAg
ICAgZm9yX2VhY2hfdmNwdSAoIGQsIHYgKQpAQCAtMzQ5LDcgKzM0OSw3IEBAIHZvaWQgdmlyaWRp
YW5fdGltZV9kb21haW5fdGhhdyhjb25zdCBzdHJ1Y3QgZG9tYWluICpkKQogewogICAgIHN0cnVj
dCB2Y3B1ICp2OwogCi0gICAgaWYgKCAhaXNfdmlyaWRpYW5fZG9tYWluKGQpICkKKyAgICBpZiAo
IGQtPmlzX2R5aW5nIHx8ICFpc192aXJpZGlhbl9kb21haW4oZCkgKQogICAgICAgICByZXR1cm47
CiAKICAgICB0aW1lX3JlZl9jb3VudF90aGF3KGQpOwotLSAKMi4yMC4xLjIuZ2IyMWViYjY3MQoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
