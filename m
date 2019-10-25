Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E73D8E507D
	for <lists+xen-devel@lfdr.de>; Fri, 25 Oct 2019 17:51:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iO1pM-0000Y7-6x; Fri, 25 Oct 2019 15:48:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6Phy=YS=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iO1pK-0000XR-Cj
 for xen-devel@lists.xenproject.org; Fri, 25 Oct 2019 15:48:34 +0000
X-Inumbo-ID: e2aeb2b8-f73e-11e9-94ca-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e2aeb2b8-f73e-11e9-94ca-12813bfff9fa;
 Fri, 25 Oct 2019 15:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1572018508;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=3jpWvldN9Gz4s0JYWq1bxHIZJzz2CKo7Scr7Y8j2j4U=;
 b=V17NqsOu3gdHjzJqAN50VUVU7D2hbDdvsa34A6JPNr4427Aqm3tKC76f
 DB4itpbgv2Mhji29sZxQnCHeabHCz3UbQuM9ribw/7lBC0UqNRZJ7/i0s
 OnHE8oug9DebLllQSYOH/mI20T7K5PQOmqY0Hu9mS2/BY/gleHxmelJJR s=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@eu.citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@eu.citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@eu.citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
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
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 8c9ARHpfYTi1btdot0xtDi5EtE4U63nUXs2XzfEPIVxyz6PavI6kNiHr/Ea82Ln+XGibI5eI/E
 CaqpnY3yB4Mxc2rLIkXA5Q96ahu3WuTs5ZtAOV5a8q55ahAS7Oz6r6I7aSqGrnS9L5nNmeIMRO
 n2F4Fjo79WKQDL4MhNgK1KBBPK7RobQeeiz6O5j0iCneVXi7fY81sHkowx2rd1+6X/h873AfO/
 slbA79C+RXYPjsbYwM+FvBg1RUhradvSB3d+IR1XvLTQQBOkjJcQiVBTPAZSqa3FyEY5ZSnckG
 cPI=
X-SBRS: 2.7
X-MesageID: 7797900
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,229,1569297600"; 
   d="scan'208";a="7797900"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 25 Oct 2019 16:48:16 +0100
Message-ID: <20191025154819.26593-2-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20191025154819.26593-1-ian.jackson@eu.citrix.com>
References: <20191025154819.26593-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH 2/5] make-flight: Drop arm64 with Linux
 before 4.10
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
Cc: =?UTF-8?q?J=C3=BCrgen=20Gro=C3=9F?= <jgross@suse.com>,
 Julien Grall <julien.grall@arm.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIGRyaXZlciBmb3IgdGhlIGxheHRvbnMnIG5ldHdvcmsgY2FyZHMgaXMgbm90IGluIDQuNCAo
YW5kIHRoYXQncwpxdWl0ZSBvbGQpLiAgT3VyIFRodW5kZXJYJ3MgbWF5IGV2ZW4gcmVxdWlyZSBz
b21ldGhpbmcgbW9yZSByZWNlbnQgYnV0CndlIHdpbGwgY3Jvc3MgdGhhdCBicmlkZ2Ugd2hlbiB3
ZSBzZWUgaXQuCgpFZmZlY3QgaXMgdG8gZHJvcCB0aGUgZm9sbG93aW5nIGpvYnM6CiAgbGludXgt
NC4xICAqYXJtNjQqCiAgbGludXgtNC40ICAqYXJtNjQqCiAgbGludXgtNC45ICAqYXJtNjQqCihD
aGVja2VkIGJ5IGV5ZWJhbGxpbmcgc3RhbmRhbG9uZS1nZW5lcmF0ZS1kdW1wLWZsaWdodC1ydW52
YXJzIGRpZmYuKQoKQ0M6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+CkNDOiBT
dGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+ClNpZ25lZC1vZmYtYnk6
IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgpBY2tlZC1ieTogSnVsaWVu
IEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KLS0tCiBtYWtlLWZsaWdodCB8IDggKysrKysr
Ky0KIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYg
LS1naXQgYS9tYWtlLWZsaWdodCBiL21ha2UtZmxpZ2h0CmluZGV4IGY5MGZlNzdjLi5iZTYyMGM2
ZCAxMDA3NTUKLS0tIGEvbWFrZS1mbGlnaHQKKysrIGIvbWFrZS1mbGlnaHQKQEAgLTE4Myw3ICsx
ODMsNyBAQCBqb2JfY3JlYXRlX3Rlc3RfZmlsdGVyX2NhbGxiYWNrICgpIHsKIGFyY2hfYnJhbmNo
X2ZpbHRlcl9jYWxsYmFjayAoKSB7CiAgIGxvY2FsIGFyY2g9JDEKICAgY2FzZSAiJGFyY2giIGlu
Ci0gIGFybSopCisgIGFybWhmKQogICAgICAgICBjYXNlICIkYnJhbmNoIiBpbgogICAgICAgICBs
aW51eC0zLjApIHJldHVybiAxOzsKICAgICAgICAgbGludXgtMy40KSByZXR1cm4gMTs7CkBAIC0x
OTEsNiArMTkxLDEyIEBAIGFyY2hfYnJhbmNoX2ZpbHRlcl9jYWxsYmFjayAoKSB7CiAgICAgICAg
IGxpbnV4LTMuMTQpIHJldHVybiAxOzsKICAgICAgICAgZXNhYwogICAgICAgICA7OworICBhcm02
NCkKKyAgICAgICAgY2FzZSAiJGJyYW5jaCIgaW4KKyAgICAgICAgbGludXgtMy4qKSByZXR1cm4g
MTs7CisgICAgICAgIGxpbnV4LTQuPykgcmV0dXJuIDE7OworICAgICAgICBlc2FjCisgICAgICAg
IDs7CiAgIGVzYWMKICAgY2FzZSAiJGFyY2giIGluCiAgIGFybSopCi0tIAoyLjExLjAKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
