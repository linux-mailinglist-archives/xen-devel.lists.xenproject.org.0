Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E019017F728
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2020 13:11:55 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jBdgI-0003ze-OQ; Tue, 10 Mar 2020 12:08:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ti7X=43=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jBdgG-0003zU-FC
 for xen-devel@lists.xenproject.org; Tue, 10 Mar 2020 12:08:16 +0000
X-Inumbo-ID: cfaef054-62c7-11ea-ad86-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cfaef054-62c7-11ea-ad86-12813bfff9fa;
 Tue, 10 Mar 2020 12:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1583842092;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=s4cosYYd7dpGbisYwOKtKcTFajUMv3Qhop6B5bOkW1w=;
 b=ZIhboQ60xpwLUJ/Eb63kFdukT8d/+WGtUUuT5ZIb4GK1sWX9ji5UkPTI
 YPK2SZWkLGQRxYHCLuCKe+5vZvOvKXTouI9g9bkUi2J1Hj50uaBq4ciI0
 Ay9ecWS7SWAD+HdY8IXRQQNhat5awly3kQPpEgVKzT4LEYG8bZ3DAB/ex s=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@eu.citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@eu.citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@eu.citrix.com";
 x-conformance=sidf_compatible
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
IronPort-SDR: totUof96t4HjrL3mMXnar3IG3d7KiHmx0uBECm6VXw/J3OUaA+wbo+U03ymcKuno8A83M/CbmU
 Y3HrPjFJOG0x5SXB5qJaV2lByHp1lJ0H7Cdwlgmq+mWVdiwMGq86bx3RV21J7Yut8oGwO9JLx/
 bkMlNYIueuvLie0Rq5CvcmmfCG7eIOKew8jjTtobZcuhsauAM2jcpm+1RBxPPRxD9YTkM30IKn
 SYxW9T9+iAVBNJt+E46x1YF3h4pgWHDFJdSt6uQCFq7xVxVHCTKWdzO47vSKwWJpZrfouR/Nep
 r8g=
X-SBRS: 2.7
X-MesageID: 13697159
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,536,1574139600"; d="scan'208";a="13697159"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 10 Mar 2020 12:08:00 +0000
Message-ID: <20200310120802.31625-1-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH 1/3] ts-memdisk-try-append: Add missing
 -I
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
Cc: =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <royger@FreeBSD.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBvbmx5IHdvcmtlZCBpbiBwcm9kdWN0aW9uIGJ5IGFjY2lkZW50IChtb3N0IG9mIHRoZSBw
cm9kdWN0aW9uCnN0dWZmIGVkaXRzIFBFUkxMSUIgZWFybGllciBpbiB0aGUgaW52b2NhdGlvbiBz
ZXF1ZW5jZSkuCgpDQzogUm9nZXIgUGF1IE1vbm7DqSA8cm95Z2VyQEZyZWVCU0Qub3JnPgpTaWdu
ZWQtb2ZmLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KLS0tCiB0
cy1tZW1kaXNrLXRyeS1hcHBlbmQgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS90cy1tZW1kaXNrLXRyeS1hcHBlbmQgYi90
cy1tZW1kaXNrLXRyeS1hcHBlbmQKaW5kZXggY2UzOWQ1YTcuLmNmYzE3NTU5IDEwMDc1NQotLS0g
YS90cy1tZW1kaXNrLXRyeS1hcHBlbmQKKysrIGIvdHMtbWVtZGlzay10cnktYXBwZW5kCkBAIC0x
OCw3ICsxOCw3IEBACiAKIHNldCAteGUgLW8gcG9zaXgKIAotYXJjaD1gcGVybCAtZSAnCithcmNo
PWBwZXJsIC1JLiAtZSAnCiAgICAgICAgICAgICAgICAgdXNlIE9zc3Rlc3Q7CiAgICAgICAgICAg
ICAgICAgdXNlIE9zc3Rlc3Q6OlRlc3RTdXBwb3J0OwogCi0tIAoyLjExLjAKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
