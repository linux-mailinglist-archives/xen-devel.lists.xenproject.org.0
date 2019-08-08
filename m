Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DBA38606C
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2019 12:55:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvg35-0004kU-Nj; Thu, 08 Aug 2019 10:53:35 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=u8RY=WE=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1hvg34-0004kP-7q
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2019 10:53:34 +0000
X-Inumbo-ID: c33b47e5-b9ca-11e9-8980-bc764e045a96
Received: from mail-lf1-x144.google.com (unknown [2a00:1450:4864:20::144])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id c33b47e5-b9ca-11e9-8980-bc764e045a96;
 Thu, 08 Aug 2019 10:53:33 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id b17so66497315lff.7
 for <xen-devel@lists.xenproject.org>; Thu, 08 Aug 2019 03:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=uvOnSc3Xt5y6r2YY3KMXL1DgVa0dZrUp/NOg5YZRDIY=;
 b=BeJ8eS7HF26NWaXJMuNJI0ltnipA5/9wAf1NOyMAmqwF/wevnNkIe5kxX8hg3wO+4O
 gutVjQ6T62axg1eAcEs4bBm9Yu3XYD1gTMywoLGbsTcPSDbWs+p2Xq6dFumFiZvNYGls
 OLkL3x2kCyiO6kvr+jG1Km4XXbudCh3pPxH9GkzRlaDY2YGPSB75zbUvj2LTJdeXmG0A
 /tOiPvJASzs6sI7DZ9MZ6uIbWcL97SQZv+8AOpdyOw8gmzDt0qc7uo3tPecvsu29Kfi0
 yFzTlirq/dImGNk1E1a9JEpInbiKM847a0n0TDrpi/23sxookHXywPFleBnW+Cs2ny/K
 5jkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=uvOnSc3Xt5y6r2YY3KMXL1DgVa0dZrUp/NOg5YZRDIY=;
 b=cegtXkCRtYfidXNP6usEVBQp+WntF4pREKXkCN57pAAiHlmLxJfOe9b6ybhnuD+Wp9
 Y0+uQ8WYs7k0wwrm8+bPX3fm2oRiW2x8ZA/+KtQWexrszYEWL2dXNWUZw5vMhiwtwU1A
 BCMqbIDT063kAK0dtKUOhgN0MuAqPRrm78WPkHx/6x/qEhWjTOLl1h5jE+Nsea88rP82
 lkIetLxWAE/ezaemhmURquDoCjAEGLjLdpQB7hxTyQylhpY3iQo61AK5ec7ytA133lt3
 zDdqLhRjaCqVOJALhKpAILshj9KmjkdCs4WPWHJCFqswjecqNeU2BV5DFe2shBR4T3w+
 2A/Q==
X-Gm-Message-State: APjAAAURsp09jPbyAc9E7G1fysVxWyrsDBPOZI1j96jMC/ZvwXqYNIn+
 JpPAr3CFk9b/64Guw+awmYBM0fayOC4=
X-Google-Smtp-Source: APXvYqwfx7Ky9kleMP+qFT4llxMthzmKBM3pt9K0658ye/SDfidOpgJ0NK/Z5VttCzVHPpFFLY2wiw==
X-Received: by 2002:ac2:44ac:: with SMTP id c12mr205631lfm.33.1565261611568;
 Thu, 08 Aug 2019 03:53:31 -0700 (PDT)
Received: from otyshchenko.kyiv.epam.com (ll-22.209.223.85.sovam.net.ua.
 [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id k27sm18476194lfm.90.2019.08.08.03.53.30
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 08 Aug 2019 03:53:31 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Thu,  8 Aug 2019 13:53:23 +0300
Message-Id: <1565261603-9632-1-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [Xen-devel] [PATCH] xen/arm: Let the IOMMU be accessible by Dom0 if
 forcibly disabled in Xen
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
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, julien.grall@arm.com,
 sstabellini@kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogT2xla3NhbmRyIFR5c2hjaGVua28gPG9sZWtzYW5kcl90eXNoY2hlbmtvQGVwYW0uY29t
PgoKRG9uJ3Qgc2tpcCBJT01NVSBub2RlcyB3aGVuIGNyZWF0aW5nIERUIGZvciBEb20wIGlmIElP
TU1VIGhhcyBiZWVuCmZvcmNpYmx5IGRpc2FibGVkIGluIGJvb3RhcmdzIChlLmcuICJpb21tdT0w
IikgaW4gb3JkZXIgdG8gbGV0CnRoZSBJT01NVSBiZSBhY2Nlc3NpYmxlIGJ5IERPTTAuCgpTaWdu
ZWQtb2ZmLWJ5OiBPbGVrc2FuZHIgVHlzaGNoZW5rbyA8b2xla3NhbmRyX3R5c2hjaGVua29AZXBh
bS5jb20+Ci0tLQpJIGhhdmUgaGVhcmQgdGhlcmUgaXMgYSAicG9zc2libGUiIGNhc2Ugd2hlbiB0
aGUgSU9NTVUgY291bGQgYmUgYWNjZXNzaWJsZSBieSBET00wLgpTbywgSSB0aGluaywgZm9yIHRo
aXMgdG8gd29yayB3ZSBuZWVkIHRvIGNyZWF0ZSBjb3JyZXNwb25kaW5nIERUIG5vZGVzIGluIHRo
ZSBEVAphdCBsZWFzdC4KLS0tCiB4ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMgfCA2ICsrKyst
LQogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMgYi94ZW4vYXJjaC9hcm0vZG9tYWlu
X2J1aWxkLmMKaW5kZXggZDY3ZjdkNC4uZmY4ODA5OSAxMDA2NDQKLS0tIGEveGVuL2FyY2gvYXJt
L2RvbWFpbl9idWlsZC5jCisrKyBiL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYwpAQCAtMTQw
Myw5ICsxNDAzLDExIEBAIHN0YXRpYyBpbnQgX19pbml0IGhhbmRsZV9ub2RlKHN0cnVjdCBkb21h
aW4gKmQsIHN0cnVjdCBrZXJuZWxfaW5mbyAqa2luZm8sCiAKICAgICAvKgogICAgICAqIEV2ZW4g
aWYgdGhlIElPTU1VIGRldmljZSBpcyBub3QgdXNlZCBieSBYZW4sIGl0IHNob3VsZCBub3QgYmUK
LSAgICAgKiBwYXNzdGhyb3VnaCB0byBET00wCisgICAgICogcGFzc3Rocm91Z2ggdG8gRE9NMC4g
VGhlIGV4Y2VwdGlvbiBoZXJlIGlzIHRoZSBmYWN0IHRoYXQgSU9NTVUKKyAgICAgKiBoYXMgYmVl
biBmb3JjaWJseSBkaXNhYmxlZCBpbiBib290YXJncyAiaW9tbXU9MCIgaW4gb3JkZXIgdG8gbGV0
CisgICAgICogdGhlIElPTU1VIGJlIGFjY2Vzc2libGUgYnkgRE9NMC4KICAgICAgKi8KLSAgICBp
ZiAoIGRldmljZV9nZXRfY2xhc3Mobm9kZSkgPT0gREVWSUNFX0lPTU1VICkKKyAgICBpZiAoIGRl
dmljZV9nZXRfY2xhc3Mobm9kZSkgPT0gREVWSUNFX0lPTU1VICYmIGlvbW11X2VuYWJsZSApCiAg
ICAgewogICAgICAgICBkdF9kcHJpbnRrKCIgSU9NTVUsIHNraXAgaXRcbiIpOwogICAgICAgICBy
ZXR1cm4gMDsKLS0gCjIuNy40CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
