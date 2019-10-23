Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 540F9E20FE
	for <lists+xen-devel@lfdr.de>; Wed, 23 Oct 2019 18:51:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNJoW-0007OL-VJ; Wed, 23 Oct 2019 16:48:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TICx=YQ=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1iNJoV-0007OC-FL
 for xen-devel@lists.xenproject.org; Wed, 23 Oct 2019 16:48:47 +0000
X-Inumbo-ID: f8262972-f5b4-11e9-beca-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f8262972-f5b4-11e9-beca-bc764e2007e4;
 Wed, 23 Oct 2019 16:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1571849322;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jtXtAC2JzvQtQkNrbbAgn69NPPK0O23isaUX6kj9pmI=;
 b=YyG5d4TNYa4+Je+y0C4rXa3jnPciYchj6lsv4Q5FIa/scSiGI1gH/7Ft
 mw/3xH68scCfzUYD9Iw9wh9MfyEN22jwtIxG8jKBprfTcGXmPQ4ql7eLG
 BjhcZyeQ3zDhGFTCnmOYQwyXuAGhBLMirDVLLzZyNtSQ99EwZkGLIuZjV Y=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: uhgN+IsIj0DNv9WjgAIvyenoYBmeQvn47XmMSMt+GTovarMynXO+Z+BHE/uJEPxnJYQwxEbP8s
 3H7Lw04HuuR+Z/e+5c4Gg0Y7HVMu0CTRFwQAs8cKXK1lsV04pgruul0kRnghMbxypFfosl1Ecr
 +V+rQhTYQNlDc6TA6uyMwghuQ1dxUJbIwiMqHeT38RebWHQGE1BQ56Gh5tdY5p5MRyiRksoFtQ
 +iq1ezNnnCC5oyJXJgmJqg5O+M1cAJKXsfAcyGjW5wQ54pmhVZuMQGBjSuT+y2CD/hMsNSze4l
 ymA=
X-SBRS: 2.7
X-MesageID: 7778030
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,221,1569297600"; 
   d="scan'208";a="7778030"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 23 Oct 2019 17:48:20 +0100
Message-ID: <20191023164837.2700240-7-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191023164837.2700240-1-anthony.perard@citrix.com>
References: <20191023164837.2700240-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [RFC XEN PATCH 06/23] xen, Kbuild: filter-out -Wa,
 % from CFLAGS for %.i:%.c rules
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
Cc: Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QXMgaXQgaXMgZG9uZSBjdXJyZW50bHkgaW4gUnVsZXMubWsuCgpTaWduZWQtb2ZmLWJ5OiBBbnRo
b255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4KLS0tCiB4ZW4vc2NyaXB0cy9N
YWtlZmlsZS5idWlsZCB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBk
ZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3hlbi9zY3JpcHRzL01ha2VmaWxlLmJ1aWxkIGIveGVu
L3NjcmlwdHMvTWFrZWZpbGUuYnVpbGQKaW5kZXggMmY2NmVkMzg4ZDFjLi5kZDk3MmQ1YjVlZGIg
MTAwNjQ0Ci0tLSBhL3hlbi9zY3JpcHRzL01ha2VmaWxlLmJ1aWxkCisrKyBiL3hlbi9zY3JpcHRz
L01ha2VmaWxlLmJ1aWxkCkBAIC0xMTQsNyArMTE0LDcgQEAgJChvYmopLyUuczogJChzcmMpLyUu
YyBGT1JDRQogCSQoY2FsbCBpZl9jaGFuZ2VkX2RlcCxjY19zX2MpCiAKIHF1aWV0X2NtZF9jcHBf
aV9jID0gQ1BQICQocXVpZXRfbW9kdGFnKSAkQAotY21kX2NwcF9pX2MgICAgICAgPSAkKENQUCkg
JChjX2ZsYWdzKSAtbyAkQCAkPAorY21kX2NwcF9pX2MgICAgICAgPSAkKENQUCkgJChmaWx0ZXIt
b3V0IC1XYSQoY29tbWEpJSwkKGNfZmxhZ3MpKSAtbyAkQCAkPAogCiAkKG9iaikvJS5pOiAkKHNy
YykvJS5jIEZPUkNFCiAJJChjYWxsIGlmX2NoYW5nZWRfZGVwLGNwcF9pX2MpCi0tIApBbnRob255
IFBFUkFSRAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
