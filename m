Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA882132D3
	for <lists+xen-devel@lfdr.de>; Fri,  3 May 2019 19:04:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hMbZz-0000lm-Oa; Fri, 03 May 2019 17:02:35 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zhHS=TD=gmail.com=amittomer25@srs-us1.protection.inumbo.net>)
 id 1hMbZx-0000lV-US
 for xen-devel@lists.xenproject.org; Fri, 03 May 2019 17:02:33 +0000
X-Inumbo-ID: 3d8d2474-6dc5-11e9-843c-bc764e045a96
Received: from mail-pg1-x541.google.com (unknown [2607:f8b0:4864:20::541])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 3d8d2474-6dc5-11e9-843c-bc764e045a96;
 Fri, 03 May 2019 17:02:32 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id n2so2981880pgg.13
 for <xen-devel@lists.xenproject.org>; Fri, 03 May 2019 10:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=RNjvDy45R8xFdfT0/6bHlm7oz8dWDlSdcBUUHuM6+EM=;
 b=JUvAh3ptC6uOFuYerA85BVoyKUG4drQRpTL47DOi16j0bTd3s2BREQT/h8bj17FP63
 ZnbsRWpzuiXYXUt0O4ongDBx6qPsQMx0JQG3xcjTn522H4/Zy8lz/1BBkgW/S6t+r+61
 pxwZBDspK/bV3CVPCDZFInpkuAnTX6v46YOrNXaLw23UN/jeIyE8u2m9o9QG8GXExYGt
 Jo384+NE+1mIMpA/1nAg1ZWLtg4GOUoHG2ATi9p+MvG8dK6FGsDbz3uoC+VmJxY6bMiE
 WkE/D3/D3lFnJNWKHAxu0awpx90wi5ZJMqFYSmIw9c2bIaZI3Xu2yncv6Qz5s6RdmpK8
 VANQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=RNjvDy45R8xFdfT0/6bHlm7oz8dWDlSdcBUUHuM6+EM=;
 b=cAJHG8SaxnOaBVhtG0NTt6IBnYu15d08goLyT2xhYoZX/TqG3iuClnmlhathKfEAEH
 R52K+a/VuwStxymKGPOhhKJV8QWS2egUTlI2h4SLJmTG8+43eRMNd+/XkCz9ZwCCTcDS
 A9EQxIqtiYEXLQnfCcbqWYTi3mlEKJ8gGnsLybuyLF8Vz8YC5/KNqQqSulosYByW9zFC
 B1cDr4+3Ctp6IOkXLhHvUBKGFCBjMAaxG7KagXznYLab4mko6rDOgPMDKEq8j1GiOtTk
 tjFDDut4AA/qx/bKYjdqOrKjdPbXzfofeRv13hVkQhqC36msqjdNtUVkd3Bc6MBrTWNk
 GivA==
X-Gm-Message-State: APjAAAXneG/CtwLNt6y9oKw/fXLf2Wi/YD9Di4k/2gsxEiNKS/WN9jpN
 G+/ltKgkrmOIpPdQkeDze+4YT0Z1
X-Google-Smtp-Source: APXvYqxx7I+cD2b7QFgUtTzzbo96MyGj7d7SdeHV18TjufbugJcq0K+J155CGb1wG/f2u37XvyC8qQ==
X-Received: by 2002:a63:87c6:: with SMTP id
 i189mr11266345pge.367.1556902951309; 
 Fri, 03 May 2019 10:02:31 -0700 (PDT)
Received: from localhost.localdomain ([223.179.133.72])
 by smtp.gmail.com with ESMTPSA id j2sm3297667pff.77.2019.05.03.10.02.28
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 03 May 2019 10:02:30 -0700 (PDT)
From: Amit Singh Tomar <amittomer25@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Fri,  3 May 2019 22:32:07 +0530
Message-Id: <1556902928-18682-1-git-send-email-amittomer25@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [Xen-devel] [PATCH] xen/arm: Black list everything with a PPI
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
Cc: andre.przywara@arm.com, julien.grall@arm.com, sstabellini@kernel.org,
 Amit Singh Tomar <amittomer25@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

WEVOIHNob3VsZCBub3QgZm9yd2FyZCBQUElzIHRvIERvbTAgYXMgaXQgb25seSBzdXBwb3J0IFNQ
SXMuCk9uZSBvZiBzb2x1dGlvbiB0byB0aGlzIHByb2JsZW0gaXMgdG8gc2tpcCBhbnkgZGV2aWNl
IHRoYXQKdXNlcyBQUEkgc291cmNlIGNvbXBsZXRlbHkgd2hpbGUgYnVpbGRpbmcgZG9tYWluIGl0
c2VsZi4KClRoaXMgcGF0Y2ggZ29lcyB0aHJvdWdoIGFsbCB0aGUgaW50ZXJydXB0IHNvdXJjZXMg
b2YgZGV2aWNlIGFuZCBza2lwIGl0CmlmIG9uZSBvZiBpbnRlcnJ1cHQgc291cmNlIGlzIFBQSS4g
SXQgZml4ZXMgWEVOIGJvb3Qgb24gaS5NWDhNUSBieQpza2lwcGluZyBQTVUgbm9kZS4KClN1Z2dl
c3RlZC1ieTogIEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+ClNpZ25lZC1vZmYt
Ynk6IEFtaXQgU2luZ2ggVG9tYXIgPGFtaXR0b21lcjI1QGdtYWlsLmNvbT4KLS0tCiAgICAqIFRo
aXMgcmVwbGFjZXMgZm9sbG93aW5nIHBhdGNoLgogICAgICBodHRwczovL3BhdGNod29yay5rZXJu
ZWwub3JnL3BhdGNoLzEwODk5ODgxLwotLS0KIHhlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYyB8
IDE2ICsrKysrKysrKysrKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspLCAx
IGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jIGIv
eGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jCmluZGV4IGQ5ODM2NzcuLjhmNTQ0NzIgMTAwNjQ0
Ci0tLSBhL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYworKysgYi94ZW4vYXJjaC9hcm0vZG9t
YWluX2J1aWxkLmMKQEAgLTEzNTMsNyArMTM1Myw3IEBAIHN0YXRpYyBpbnQgX19pbml0IGhhbmRs
ZV9ub2RlKHN0cnVjdCBkb21haW4gKmQsIHN0cnVjdCBrZXJuZWxfaW5mbyAqa2luZm8sCiAgICAg
ICAgIHsgLyogc2VudGluZWwgKi8gfSwKICAgICB9OwogICAgIHN0cnVjdCBkdF9kZXZpY2Vfbm9k
ZSAqY2hpbGQ7Ci0gICAgaW50IHJlczsKKyAgICBpbnQgcmVzLCBpLCBuaXJxLCBpcnFfaWQ7CiAg
ICAgY29uc3QgY2hhciAqbmFtZTsKICAgICBjb25zdCBjaGFyICpwYXRoOwogCkBAIC0xMzk5LDYg
KzEzOTksMjAgQEAgc3RhdGljIGludCBfX2luaXQgaGFuZGxlX25vZGUoc3RydWN0IGRvbWFpbiAq
ZCwgc3RydWN0IGtlcm5lbF9pbmZvICpraW5mbywKICAgICAgICAgcmV0dXJuIDA7CiAgICAgfQog
CisgICAgLyogU2tpcCB0aGUgbm9kZSwgdXNpbmcgUFBJIHNvdXJjZSAqLworICAgIG5pcnEgPSBk
dF9udW1iZXJfb2ZfaXJxKG5vZGUpOworCisgICAgZm9yICggaSA9IDAgOyBpIDwgbmlycSA7IGkr
KyApCisgICAgeworICAgICAgICBpcnFfaWQgPSBwbGF0Zm9ybV9nZXRfaXJxKG5vZGUsIGkpOwor
CisgICAgICAgIGlmICggaXJxX2lkID49IDE2ICYmIGlycV9pZCA8IDMyICkKKyAgICAgICAgewor
ICAgICAgICAgICAgZHRfZHByaW50aygiIFNraXAgbm9kZSB3aXRoIChQUEkgc291cmNlKVxuIik7
CisgICAgICAgICAgICByZXR1cm4gMDsKKyAgICAgICAgfQorICAgIH0KKwogICAgIC8qCiAgICAg
ICogWGVuIGlzIHVzaW5nIHNvbWUgcGF0aCBmb3IgaXRzIG93biBwdXJwb3NlLiBXYXJuIGlmIGEg
bm9kZQogICAgICAqIGFscmVhZHkgZXhpc3RzIHdpdGggdGhlIHNhbWUgcGF0aC4KLS0gCjIuNy40
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
