Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F16171427F1
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jan 2020 11:13:08 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1itU0J-0005DS-NR; Mon, 20 Jan 2020 10:09:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=YHbP=3J=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1itU0I-0005DN-0Y
 for xen-devel@lists.xenproject.org; Mon, 20 Jan 2020 10:09:54 +0000
X-Inumbo-ID: fd23f5c8-3b6c-11ea-b93e-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fd23f5c8-3b6c-11ea-b93e-12813bfff9fa;
 Mon, 20 Jan 2020 10:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579514988;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=SjL6sqqcTz5EOLYfn3lBv4XEvSOhnqKarHYLqsaFLQQ=;
 b=cbpeVgm2LpUyqQEu3NFLKGKtPqRuVF4kSjT8Negxez3DVTBqc6a6F/R+
 Rh75ZMbXz8fObCWw9hQJmGiUZaHFhtiT4q0P5xoeT2uG89/rgIMfQg7Ml
 iq7c9r5kqS1HJXzyPEGWukxg/HQQEUNXp1szleNVx9xbZOObq1mkAmheN I=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
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
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: lX/H0Ivz2DzSsa1nKRABQ+k6l3xzT2PICztbt8ygfp6PN+5LVlMDxteyDF8JGPRj0rO/2qsFsJ
 cubd6q0j9a8NoVegsFpNvZOfgJciRBIeSUfYLKXMvQfCzwU7SWpd5/NXjP0y6NqZ6wynQKUPqP
 4iwXsp3QTt9GtYkxOMOPRc7Uj5hywhv0j/2R7Zvi6hbj/uei9SD8I1ShjLUUdBb4uiTE0fnHJn
 epF2o/IV0ImkurVdxK4zjSRNmfjxh8vxFHf6HH+k2gvbTlM/M3evC+5mQ6rV5yRV32pkXw14Tu
 2rM=
X-SBRS: 2.7
X-MesageID: 11583902
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,341,1574139600"; d="scan'208";a="11583902"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 20 Jan 2020 10:09:35 +0000
Message-ID: <20200120100935.1003223-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH] ts-xen-build-prep: Install python3-dev
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
 Ian Jackson <Ian.Jackson@eu.citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QWxsb3cgdG8gYnVpbGQgWGVuIHdpdGggcHl0aG9uMy4KCkFsc28sIFFFTVUgdXBzdHJlYW0gKHRv
IGJlIDQuMykgbm93IHJlcXVpcmVzIHB5dGhvbiA+PSAzLjUsIGJ1dCB0aGF0CmFmZmVjdCBvbmx5
IHhlbi11bnN0YWJsZS4KClNpZ25lZC1vZmYtYnk6IEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBl
cmFyZEBjaXRyaXguY29tPgotLS0KIHRzLXhlbi1idWlsZC1wcmVwIHwgMiArLQogMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvdHMteGVu
LWJ1aWxkLXByZXAgYi90cy14ZW4tYnVpbGQtcHJlcAppbmRleCA1ZDJmNTBiYWJhNGQuLmU5Mjk4
ZDU0YTI0MCAxMDA3NTUKLS0tIGEvdHMteGVuLWJ1aWxkLXByZXAKKysrIGIvdHMteGVuLWJ1aWxk
LXByZXAKQEAgLTIwOCw3ICsyMDgsNyBAQCBzdWIgcHJlcCAoKSB7CiAgICAgICAgICAgICAgICAg
ICAgICAgbGlieG1sMi11dGlscyBsaWJ4bWwyLWRldgogICAgICAgICAgICAgICAgICAgICAgIGxp
YmRldm1hcHBlci1kZXYgbGlieG1sLXhwYXRoLXBlcmwgbGliZWxmLWRldgogICAgICAgICAgICAg
ICAgICAgICAgIGNjYWNoZSBuYXNtIGNoZWNrcG9saWN5IGVidGFibGVzCi0JCSAgICAgIHB5dGhv
bjMtZG9jdXRpbHMKKwkJICAgICAgcHl0aG9uMy1kb2N1dGlscyBweXRob24zLWRldgogICAgICAg
ICAgICAgICAgICAgICAgIGxpYmdudXRsczI4LWRldik7CiAKICAgICBpZiAoJGhvLT57U3VpdGV9
ID1+IG0vc3F1ZWV6ZXx3aGVlenl8amVzc2llLykgewotLSAKQW50aG9ueSBQRVJBUkQKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
