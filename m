Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38CC5139BB1
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jan 2020 22:35:53 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ir7LQ-0006a0-Ec; Mon, 13 Jan 2020 21:33:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1Ofl=3C=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1ir7LO-0006ZY-TU
 for xen-devel@lists.xenproject.org; Mon, 13 Jan 2020 21:33:54 +0000
X-Inumbo-ID: 60d7462c-364c-11ea-ac27-bc764e2007e4
Received: from mail-wr1-f67.google.com (unknown [209.85.221.67])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 60d7462c-364c-11ea-ac27-bc764e2007e4;
 Mon, 13 Jan 2020 21:33:46 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id g17so10178848wro.2
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jan 2020 13:33:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BEvy5SiKySdPVqg9uzv89ZXtUsytA/kxiaYtktkUk5o=;
 b=cxdZweU3Y4XCuAQjvU1OSUWVSARi5H6+UGWwMcWcDeErXYXlfp8KFjiu+2ye4jx3LD
 R2dEi3pw1dxpLH9sK/JsNozNs2UZQvG5Ct9H6RWUX8A9PRieYpgw9xAR2RMrp3z13rkD
 ExO8eI2sK5EPa14cm5IzDpUN8iP26e8aUYNJ2mZ+1bBXMoqdZp4s9RDUuxobeYozOs0F
 89QRB9zJ0jysmDSUeZ8SMb0R+U9kKHVPBldkkWbplGfcVrDaKjGJ5KaICzE6kzQ1lYkj
 OWh3eWYGOhb30UKU79tpYKCYH/458ybZHJLhkIbIccd8m3N9Aw1LpeZg661DHxb+yjHr
 5jDQ==
X-Gm-Message-State: APjAAAUZChpwjfFWWxiigSriq8OFLLa0cNLOHZ/hfAy842eYDFkTbqI5
 kCIhsSZolAerWH12nHxPHMM/e/BhgslP9g==
X-Google-Smtp-Source: APXvYqwUHy3l21uvF1MX1emuj8QeQZDNHNSspEg9BvPk6H1ZEzsdl1Qmyo8tkyj95yu68p2fxZMuHg==
X-Received: by 2002:a5d:65c5:: with SMTP id e5mr20891835wrw.311.1578951225376; 
 Mon, 13 Jan 2020 13:33:45 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-230.amazon.com.
 [54.240.197.230])
 by smtp.gmail.com with ESMTPSA id i10sm16938652wru.16.2020.01.13.13.33.44
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 13 Jan 2020 13:33:44 -0800 (PST)
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Date: Mon, 13 Jan 2020 21:33:38 +0000
Message-Id: <20200113213342.8206-1-julien@xen.org>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 0/4] xen/x86: Rework inclusion between struct
 pirq and
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgYWxsLAoKVGhlIG1haW4gZ29hbCBvZiB0aGlzIHNlcmllcyBpcyB0byBtYWtlIGVhc2llciB0
byB1bmRlcnN0YW5kIGFuZCB1c2UKc3RydWN0IHBpcnEuIFBhdGNoICMxIGFuZCAjMyBhcmUgY2xl
YW51cHMuCgpDaGVlcnMsCgpKdWxpZW4gR3JhbGwgKDQpOgogIHhlbi94ODY6IFJlbW92ZSB1bnVz
ZWQgZm9yd2FyZCBkZWNsYXJhdGlvbiBpbiBhc20teDg2L2lycS5oCiAgeGVuL2NoYXI6IGVoY2k6
IERpcmVjdGx5IGluY2x1ZGUgeGVuL3RpbWVyLmggcmF0aGVyIHJlbHkgb24gZGVwZW5kZW5jeQog
IHhlbi9kb21haW46IFJlbW92ZSAjaWZuZGVmIHN1cnJvdW5kaW5nIGFsbG9jX3BpcnFfc3RydWN0
KCkKICB4ZW4veDg2OiBSZXdvcmsgaW5jbHVzaW9uIGJldHdlZW4gc3RydWN0IHBpcnEgYW5kIHN0
cnVjdCBodm1fcGlycV9kcGNpCgogeGVuL2FyY2gvYXJtL2lycS5jICAgICAgICAgICAgfCAgNSAr
KysrKwogeGVuL2FyY2gveDg2L2h2bS9pcnEuYyAgICAgICAgfCAgNyArKysrLS0tCiB4ZW4vYXJj
aC94ODYvaXJxLmMgICAgICAgICAgICB8IDM5ICsrKysrKysrKysrKysrKysrKysrKysrKy0tLS0t
LS0tLS0tCiB4ZW4vY29tbW9uL2RvbWFpbi5jICAgICAgICAgICB8ICA3ICstLS0tLS0KIHhlbi9k
cml2ZXJzL2NoYXIvZWhjaS1kYmdwLmMgIHwgIDEgKwogeGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gv
aW8uYyAgfCAgMSArCiB4ZW4vaW5jbHVkZS9hc20teDg2L2h2bS9pcnEuaCB8IDE5ICsrKysrKysr
KysrKysrKysrCiB4ZW4vaW5jbHVkZS9hc20teDg2L2lycS5oICAgICB8IDIwICsrKy0tLS0tLS0t
LS0tLS0tLQogeGVuL2luY2x1ZGUveGVuL2RvbWFpbi5oICAgICAgfCAgNSArKystLQogOSBmaWxl
cyBjaGFuZ2VkLCA2NCBpbnNlcnRpb25zKCspLCA0MCBkZWxldGlvbnMoLSkKCi0tIAoyLjI0LjAK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
