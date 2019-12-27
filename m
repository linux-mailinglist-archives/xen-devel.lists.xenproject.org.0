Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F5C212B5E1
	for <lists+xen-devel@lfdr.de>; Fri, 27 Dec 2019 17:35:35 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iksXh-0001ZT-W5; Fri, 27 Dec 2019 16:32:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=CFv7=2R=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1iksXh-0001ZA-2t
 for xen-devel@lists.xenproject.org; Fri, 27 Dec 2019 16:32:49 +0000
X-Inumbo-ID: 7c626770-28c6-11ea-9c5f-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7c626770-28c6-11ea-9c5f-12813bfff9fa;
 Fri, 27 Dec 2019 16:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1577464355;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=d0ZRc2Gh+5cHHLFgYbcoEi7+559DscdSg7RCLEHbsbI=;
 b=APrc4I1CSqfw1/qkBTZqgLsayLWEVI2h3nkjtR8U2T23pb7pXDgCew+0
 fRHKjesz7QOKiR+OUG5uRi8QqBE0R0VQGA6QG5Cu8QKt431t7FcqX8DsM
 KFI2EyW13xr5/otyqLa0MJ0KncnlFob4X01eSyhah72Fk+ficrc6QqaEX U=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=george.dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 george.dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="george.dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
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
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: NOrYm6dHLDNUooZs4DMZGl+2tEflhqKMomBjOly/399JKxSDBkfis1rrWGf32dCSMTMCBBOpCN
 xyN3R+tTO97bYwNsoqKJ6lKlwWBGVq/QSk3M5hcuiThfJNtK8XR3zOZXValUBy8+epXLPz18TV
 06ggJKwBdFXP8YLnUbJWD21r3IQEsC/ik7GkYwCuU0pn6AfwURz8whYVOxV7uoXLJvA1RrbBU5
 llw334gtHao1H7t1u8j/+YnxsGCTYtI9h/DhRqXrbOfk5KLuAVXG7+9pFn84QD0BlH0O6ZPTba
 rug=
X-SBRS: 2.7
X-MesageID: 10186051
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,363,1571716800"; d="scan'208";a="10186051"
From: George Dunlap <george.dunlap@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 27 Dec 2019 16:32:17 +0000
Message-ID: <20191227163224.4113837-2-george.dunlap@citrix.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191227163224.4113837-1-george.dunlap@citrix.com>
References: <20191227163224.4113837-1-george.dunlap@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 2/9] golang/xenlight: Do proper nil / NULL
 conversions for builtin Bitmap type
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
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>,
 George Dunlap <george.dunlap@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

U2ltaWxhciB0byB0aGUgYXV0b2dlbmVyYXRlZCB0eXBlcywgYnV0IGZvciBgYnVpbHRpbmAgQml0
bWFwIHR5cGUuCgpTaWduZWQtb2ZmLWJ5OiBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGNp
dHJpeC5jb20+Ci0tLQpDQzogTmljayBSb3Nicm9vayA8cm9zYnJvb2tuQGFpbmZvc2VjLmNvbT4K
LS0tCiB0b29scy9nb2xhbmcveGVubGlnaHQveGVubGlnaHQuZ28gfCAyNCArKysrKysrKysrKysr
Ky0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspLCAxMCBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS90b29scy9nb2xhbmcveGVubGlnaHQveGVubGlnaHQuZ28gYi90
b29scy9nb2xhbmcveGVubGlnaHQveGVubGlnaHQuZ28KaW5kZXggMjM3ZjI2YmNlOS4uZTE4ZjBm
MzVmOCAxMDA2NDQKLS0tIGEvdG9vbHMvZ29sYW5nL3hlbmxpZ2h0L3hlbmxpZ2h0LmdvCisrKyBi
L3Rvb2xzL2dvbGFuZy94ZW5saWdodC94ZW5saWdodC5nbwpAQCAtNDA4LDE1ICs0MDgsMTcgQEAg
dHlwZSBCaXRtYXAgc3RydWN0IHsKIH0KIAogZnVuYyAoYm0gKkJpdG1hcCkgZnJvbUMoY2JtICpD
LmxpYnhsX2JpdG1hcCkgZXJyb3IgewotCS8vIEFsbG9jIGEgR28gc2xpY2UgZm9yIHRoZSBieXRl
cwotCXNpemUgOj0gaW50KGNibS5zaXplKQotCWJtLmJpdG1hcCA9IG1ha2UoW11DLnVpbnQ4X3Qs
IHNpemUpCisJYm0uYml0bWFwID0gbmlsCisJaWYgc2l6ZSA6PSBpbnQoY2JtLnNpemUpOyBzaXpl
ID4gMCB7CisJCS8vIEFsbG9jIGEgR28gc2xpY2UgZm9yIHRoZSBieXRlcworCQlibS5iaXRtYXAg
PSBtYWtlKFtdQy51aW50OF90LCBzaXplKQogCi0JLy8gTWFrZSBhIHNsaWNlIHBvaW50aW5nIHRv
IHRoZSBDIGFycmF5Ci0JY3MgOj0gKCpbMSA8PCAzMF1DLnVpbnQ4X3QpKHVuc2FmZS5Qb2ludGVy
KGNibS5fbWFwKSlbOnNpemU6c2l6ZV0KKwkJLy8gTWFrZSBhIHNsaWNlIHBvaW50aW5nIHRvIHRo
ZSBDIGFycmF5CisJCWNzIDo9ICgqWzEgPDwgMzBdQy51aW50OF90KSh1bnNhZmUuUG9pbnRlcihj
Ym0uX21hcCkpWzpzaXplOnNpemVdCiAKLQkvLyBBbmQgY29weSB0aGUgQyBhcnJheSBpbnRvIHRo
ZSBHbyBhcnJheQotCWNvcHkoYm0uYml0bWFwLCBjcykKKwkJLy8gQW5kIGNvcHkgdGhlIEMgYXJy
YXkgaW50byB0aGUgR28gYXJyYXkKKwkJY29weShibS5iaXRtYXAsIGNzKQorCX0KIAogCXJldHVy
biBuaWwKIH0KQEAgLTQyNiwxMCArNDI4LDEyIEBAIGZ1bmMgKGJtICpCaXRtYXApIHRvQygpIChD
LmxpYnhsX2JpdG1hcCwgZXJyb3IpIHsKIAogCXNpemUgOj0gbGVuKGJtLmJpdG1hcCkKIAljYm0u
c2l6ZSA9IEMudWludDMyX3Qoc2l6ZSkKLQljYm0uX21hcCA9ICgqQy51aW50OF90KShDLm1hbGxv
YyhDLnVsb25nKGNibS5zaXplKSAqIEMuc2l6ZW9mX3VpbnQ4X3QpKQotCWNzIDo9ICgqWzEgPDwg
MzFdQy51aW50OF90KSh1bnNhZmUuUG9pbnRlcihjYm0uX21hcCkpWzpzaXplOnNpemVdCisJaWYg
Y2JtLnNpemUgPiAwIHsKKwkJY2JtLl9tYXAgPSAoKkMudWludDhfdCkoQy5tYWxsb2MoQy51bG9u
ZyhjYm0uc2l6ZSkgKiBDLnNpemVvZl91aW50OF90KSkKKwkJY3MgOj0gKCpbMSA8PCAzMV1DLnVp
bnQ4X3QpKHVuc2FmZS5Qb2ludGVyKGNibS5fbWFwKSlbOnNpemU6c2l6ZV0KIAotCWNvcHkoY3Ms
IGJtLmJpdG1hcCkKKwkJY29weShjcywgYm0uYml0bWFwKQorCX0KIAogCXJldHVybiBjYm0sIG5p
bAogfQotLSAKMi4yNC4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
