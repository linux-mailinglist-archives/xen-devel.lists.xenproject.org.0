Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D843612651D
	for <lists+xen-devel@lfdr.de>; Thu, 19 Dec 2019 15:46:19 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihx0S-0007Ta-Ch; Thu, 19 Dec 2019 14:42:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ynai=2J=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1ihx0Q-0007SU-6k
 for xen-devel@lists.xenproject.org; Thu, 19 Dec 2019 14:42:22 +0000
X-Inumbo-ID: c20cf9a3-226d-11ea-91cf-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c20cf9a3-226d-11ea-91cf-12813bfff9fa;
 Thu, 19 Dec 2019 14:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1576766541;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Uui/nwZ4fXEdC1zRjXflYGdpVouHGshC1/0sKbliXe8=;
 b=TIRHk8Ghq67mNZ7C0UY57ndQ34kzcIPZkPY7+iHIvwXJgspN4UKdwM7K
 PMAE1qqWKile40MvyIJCnlDJEPDEESJsjJdeWCGpHHRGmrVnj050p78cp
 rZDXNczaaCiA/f9B8PSKXAc+zf1EH83OBRnbjW3UzSg1xcR4Vq1g2tfd+ g=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
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
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 4yiDb61R8GwJD2mtk3658HVipEioUJYP+W7IvOtNUbLSJNK9vKB8AcwjRBZucPxM8lSGrSjSnU
 mlOF9Dsu2iSlz5ULI4KwwXnKlvVH6rnxNe//pCPEp8f8roYcyG8speLHWFqQMZCiQXi2Qsmz21
 nixyCtMI3QrYNA0273iTZL/rK28Qws/g6NpdRh/XFu+JM4cH+uVjGYQySQkiHy3iFONYZ0oGFP
 vDNRAzRUjkR4hu+8ZACYNySbzHSb92G9WFTJ5ezB63e+gJymn2xcpWDrB9S/ry/8k+/Qnzl/ys
 vIA=
X-SBRS: 2.7
X-MesageID: 9949392
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,332,1571716800"; 
   d="scan'208";a="9949392"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 19 Dec 2019 14:42:15 +0000
Message-ID: <20191219144217.305851-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Subject: [Xen-devel] [XEN PATCH 0/2] Start using GitLab caching capability
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
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Doug Goldstein <cardoe@cardoe.com>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UGF0Y2ggc2VyaWVzIGF2YWlsYWJsZSBpbiB0aGlzIGdpdCBicmFuY2g6Cmh0dHBzOi8veGVuYml0
cy54ZW4ub3JnL2dpdC1odHRwL3Blb3BsZS9hcGVyYXJkL3hlbi11bnN0YWJsZS5naXQgYnIuY2kt
Y2FjaGluZy12MQoKVGhpcyBpcyBvbmx5IGEgc21hbGwgaW1wcm92ZW1lbnQgdG8gdGhlIEdpdExh
YiBDSS4gSXQgb25seSBjYWNoZXMgZ2l0IGNsb25lCnRoYXQgWGVuJ3MgbWFrZWZpbGUgY3JlYXRl
cyBhbmQgbm90IHN1Ym1vZHVsZXMgbmVlZGVkIGJ5IHRob3NlIGNsb25lcy4KCkl0IGRvZXNuJ3Qg
Y2FjaGUgdGhlIGRpZmZlcmVudCB0YXJiYWxscyB0aGF0IHRoZSBtYWtlZmlsZXMgZG93bmxvYWRz
LCB0aGF0CmNvdWxkIGJlIGFub3RoZXIgaW1wcm92ZW1lbnQuCgpDaGVlcnMsCgpBbnRob255IFBF
UkFSRCAoMik6CiAgdG9vbHM6IEFsbG93IHRvIG1ha2UgKi1kaXItZm9yY2UtdXBkYXRlIHdpdGhv
dXQgLi9jb25maWd1cmUKICBhdXRvbWF0aW9uOiBDYWNoZSBzdWItcHJvamVjdCBnaXQgdHJlZSBp
biBidWlsZCBqb2JzCgogYXV0b21hdGlvbi9naXRsYWItY2kvYnVpbGQueWFtbCAgICAgfCAgOCAr
KysrKwogYXV0b21hdGlvbi9zY3JpcHRzL3ByZXBhcmUtY2FjaGUuc2ggfCA1MiArKysrKysrKysr
KysrKysrKysrKysrKysrKysrKwogdG9vbHMvUnVsZXMubWsgICAgICAgICAgICAgICAgICAgICAg
fCAgMyArLQogMyBmaWxlcyBjaGFuZ2VkLCA2MiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0p
CiBjcmVhdGUgbW9kZSAxMDA3NTUgYXV0b21hdGlvbi9zY3JpcHRzL3ByZXBhcmUtY2FjaGUuc2gK
Ci0tIApBbnRob255IFBFUkFSRAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
