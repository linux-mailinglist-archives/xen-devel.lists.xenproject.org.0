Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D738132BE
	for <lists+xen-devel@lfdr.de>; Fri,  3 May 2019 19:02:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hMbXi-000858-Jz; Fri, 03 May 2019 17:00:14 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=lZ0l=TD=citrix.com=prvs=019b86d19=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hMbXh-00084T-Aa
 for xen-devel@lists.xenproject.org; Fri, 03 May 2019 17:00:13 +0000
X-Inumbo-ID: e9f68e9c-6dc4-11e9-843c-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id e9f68e9c-6dc4-11e9-843c-bc764e045a96;
 Fri, 03 May 2019 17:00:11 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,426,1549929600"; d="scan'208";a="85085350"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 3 May 2019 17:59:57 +0100
Message-ID: <20190503165957.5960-12-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190503165957.5960-1-ian.jackson@eu.citrix.com>
References: <20190503165957.5960-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH 11/11] mg-allocate: Don't try allocating
 the same resource for two specs
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
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBpcyBvYnZpb3VzbHkgd3JvbmcuICBJbiBmYWN0IGl0IGRvZXMgbm90IHdvcmsgKHdlIGJv
bWIgb3V0IGluIHRoZQphbGxvY2F0aW9uKS4KClNpZ25lZC1vZmYtYnk6IElhbiBKYWNrc29uIDxp
YW4uamFja3NvbkBldS5jaXRyaXguY29tPgotLS0KdjI6IE5ldyBwYXRjaAotLS0KIG1nLWFsbG9j
YXRlIHwgMTAgKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKykKCmRp
ZmYgLS1naXQgYS9tZy1hbGxvY2F0ZSBiL21nLWFsbG9jYXRlCmluZGV4IDA4N2IxNGIwLi5iNWRj
MTg1ZSAxMDA3NTUKLS0tIGEvbWctYWxsb2NhdGUKKysrIGIvbWctYWxsb2NhdGUKQEAgLTQzNyw2
ICs0MzcsMTYgQEAgc3ViIHBsYW4gKCkgewogCQltYXAgeyBbIEAkcG9zc3JlcXMsICRfIF0gfSBA
cmVxbGlzdDsKIAkgICAgfSBAcG9zc21hdHJpeDsKICAgICAgICAgfQorICAgICAgICBAcG9zc21h
dHJpeCA9IGdyZXAgeworICAgICAgICAgICAgbXkgJHBvc3NyZXFzID0gJF87CisgICAgICAgICAg
ICBteSAlZ290OworICAgICAgICAgICAgbXkgJG9rPTE7CisgICAgICAgICAgICBmb3JlYWNoIChA
JHBvc3NyZXFzKSB7CisgICAgICAgICAgICAgICAgbmV4dCBpZiAhJGdvdHskXy0+e1Jlc299fSsr
OworICAgICAgICAgICAgICAgICRvaz0wOyBsYXN0OworICAgICAgICAgICAgfQorICAgICAgICAg
ICAgJG9rOworICAgICAgICB9IEBwb3NzbWF0cml4OwogCiAJbXkgJHBsYW5uZWQ7CiAJbXkgQHJl
cWxpc3Q7Ci0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
