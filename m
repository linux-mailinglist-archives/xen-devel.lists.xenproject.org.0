Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F9B13270
	for <lists+xen-devel@lfdr.de>; Fri,  3 May 2019 18:46:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hMbHd-0005tN-3g; Fri, 03 May 2019 16:43:37 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zhHS=TD=gmail.com=amittomer25@srs-us1.protection.inumbo.net>)
 id 1hMbHc-0005tI-0M
 for xen-devel@lists.xenproject.org; Fri, 03 May 2019 16:43:36 +0000
X-Inumbo-ID: 976644e3-6dc2-11e9-843c-bc764e045a96
Received: from mail-pg1-x542.google.com (unknown [2607:f8b0:4864:20::542])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 976644e3-6dc2-11e9-843c-bc764e045a96;
 Fri, 03 May 2019 16:43:34 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id j26so2981777pgl.5
 for <xen-devel@lists.xenproject.org>; Fri, 03 May 2019 09:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=Ke4/hXD3EQgdo5LIQMPk12sJRbvDmSJQ3IPvwmmcegw=;
 b=FK/Ru+8DU723IFP0S8sCqUElEjqvzitVhhUCDLEeRswvH5RYeYIVqXXTqw8Okc7tOw
 WuINGO6a5YRcds56Rl+UKemyDUXF2Bk80S5Dc2QAC2P2jwNM7fsrSGOxmA9K9AhgcxJ5
 VEPKHi7tTOUupfWN++zYuul/A/3GVLNUfKrc+Yma6cUyw40me7xAOeZ/7U/Nb6k3xUbi
 Q3tQ1QBFViwg0qu8p0np/gw4NpxcuZ48h11fJiy57X1K6NyT5fFm6Pg90HV80IUY7pHd
 Xf18+dp3I67NDpJa2b0KVnN6NBhTwm0/AY46SaMbQaXia/2wczkCMDhMMQ23CjVlfUOs
 9jXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=Ke4/hXD3EQgdo5LIQMPk12sJRbvDmSJQ3IPvwmmcegw=;
 b=k4/6KxUXlKwA1uBfsWrdCsac99ek/yIUZsfx6TZwDR2tBrnF57XVuWTczyYIO3B4n4
 5KGJwjgB+MGorNAURUabRRMiAmhUGeEiv1QNVQmXEGTphcjdCTq4C8FVmT8mivd6MfH7
 409zX27sT4QI4Uz202L+sItRHYZv/NlrrcHSapE0IbzoB+c9ySFYExGBmFcvWpoU20wO
 1JtnJqpQjygH4BDrsmhYLv7dd9jpgDUB9HuabwspiA3ix+dBXiSkw17626rcUWSu7feJ
 SJdS8sjbR4s/IcPLrMGA79XRMFMaoOTmL7nCfa1LlODuAuaVDFRe0MTeG0Prsa1/4mHn
 gdxA==
X-Gm-Message-State: APjAAAUrAVZyaW07pTlRKlMpTUDY8ihfJ8mWYk2841+KiaxKzANJTqcH
 uBJ6ive1TD7B0PqioKTAr+7TMdd3
X-Google-Smtp-Source: APXvYqyH70PfYzU8ZD/RGA+/IIUoyyvyK/sZlxvF0dwUtOWo88BgaMgkOr1sAwdYsTD9RKoBUR+ibg==
X-Received: by 2002:a62:4607:: with SMTP id t7mr12409391pfa.138.1556901813275; 
 Fri, 03 May 2019 09:43:33 -0700 (PDT)
Received: from localhost.localdomain ([223.179.133.72])
 by smtp.gmail.com with ESMTPSA id g128sm3716658pfb.131.2019.05.03.09.43.30
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 03 May 2019 09:43:32 -0700 (PDT)
From: Amit Singh Tomar <amittomer25@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Fri,  3 May 2019 22:12:03 +0530
Message-Id: <1556901723-11740-1-git-send-email-amittomer25@gmail.com>
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
IDE3ICsrKysrKysrKysrKysrKystCiAxIGZpbGUgY2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygrKSwg
MSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYyBi
L3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYwppbmRleCBkOTgzNjc3Li4wYWU1NGRiIDEwMDY0
NAotLS0gYS94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMKKysrIGIveGVuL2FyY2gvYXJtL2Rv
bWFpbl9idWlsZC5jCkBAIC0xMzM0LDYgKzEzMzQsNyBAQCBzdGF0aWMgaW50IF9faW5pdCBoYW5k
bGVfbm9kZShzdHJ1Y3QgZG9tYWluICpkLCBzdHJ1Y3Qga2VybmVsX2luZm8gKmtpbmZvLAogICAg
ICAgICBEVF9NQVRDSF9DT01QQVRJQkxFKCJhcm0sY29ydGV4LWExNS1wbXUiKSwKICAgICAgICAg
RFRfTUFUQ0hfQ09NUEFUSUJMRSgiYXJtLGNvcnRleC1hNTMtZWRhYyIpLAogICAgICAgICBEVF9N
QVRDSF9DT01QQVRJQkxFKCJhcm0sYXJtdjgtcG11djMiKSwKKyAgICAgICAgRFRfTUFUQ0hfQ09N
UEFUSUJMRSgiYXJtLGNvcnRleC1hNTMtcG11IiksCiAgICAgICAgIERUX01BVENIX1BBVEgoIi9j
cHVzIiksCiAgICAgICAgIERUX01BVENIX1RZUEUoIm1lbW9yeSIpLAogICAgICAgICAvKiBUaGUg
bWVtb3J5IG1hcHBlZCB0aW1lciBpcyBub3Qgc3VwcG9ydGVkIGJ5IFhlbi4gKi8KQEAgLTEzNTMs
NyArMTM1NCw3IEBAIHN0YXRpYyBpbnQgX19pbml0IGhhbmRsZV9ub2RlKHN0cnVjdCBkb21haW4g
KmQsIHN0cnVjdCBrZXJuZWxfaW5mbyAqa2luZm8sCiAgICAgICAgIHsgLyogc2VudGluZWwgKi8g
fSwKICAgICB9OwogICAgIHN0cnVjdCBkdF9kZXZpY2Vfbm9kZSAqY2hpbGQ7Ci0gICAgaW50IHJl
czsKKyAgICBpbnQgcmVzLCBpLCBuaXJxLCBpcnFfaWQ7CiAgICAgY29uc3QgY2hhciAqbmFtZTsK
ICAgICBjb25zdCBjaGFyICpwYXRoOwogCkBAIC0xMzk5LDYgKzE0MDAsMjAgQEAgc3RhdGljIGlu
dCBfX2luaXQgaGFuZGxlX25vZGUoc3RydWN0IGRvbWFpbiAqZCwgc3RydWN0IGtlcm5lbF9pbmZv
ICpraW5mbywKICAgICAgICAgcmV0dXJuIDA7CiAgICAgfQogCisgICAgLyogU2tpcCB0aGUgbm9k
ZSwgdXNpbmcgUFBJIHNvdXJjZSAqLworICAgIG5pcnEgPSBkdF9udW1iZXJfb2ZfaXJxKG5vZGUp
OworCisgICAgZm9yICggaSA9IDAgOyBpIDwgbmlycSA7IGkrKyApCisgICAgeworICAgICAgICBp
cnFfaWQgPSBwbGF0Zm9ybV9nZXRfaXJxKG5vZGUsIGkpOworCisgICAgICAgIGlmICggaXJxX2lk
ID49IDE2ICYmIGlycV9pZCA8IDMyICkKKyAgICAgICAgeworICAgICAgICAgICAgZHRfZHByaW50
aygiIFNraXAgbm9kZSB3aXRoIChQUEkgc291cmNlKVxuIik7CisgICAgICAgICAgICByZXR1cm4g
MDsKKyAgICAgICAgfQorICAgIH0KKwogICAgIC8qCiAgICAgICogWGVuIGlzIHVzaW5nIHNvbWUg
cGF0aCBmb3IgaXRzIG93biBwdXJwb3NlLiBXYXJuIGlmIGEgbm9kZQogICAgICAqIGFscmVhZHkg
ZXhpc3RzIHdpdGggdGhlIHNhbWUgcGF0aC4KLS0gCjIuNy40CgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
