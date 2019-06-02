Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86A3B32485
	for <lists+xen-devel@lfdr.de>; Sun,  2 Jun 2019 20:08:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hXUqM-0005pU-PI; Sun, 02 Jun 2019 18:04:30 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=h+bp=UB=gmail.com=amittomer25@srs-us1.protection.inumbo.net>)
 id 1hXUqL-0005pP-OR
 for xen-devel@lists.xenproject.org; Sun, 02 Jun 2019 18:04:29 +0000
X-Inumbo-ID: dc6cc871-8560-11e9-8980-bc764e045a96
Received: from mail-pg1-x542.google.com (unknown [2607:f8b0:4864:20::542])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id dc6cc871-8560-11e9-8980-bc764e045a96;
 Sun, 02 Jun 2019 18:04:27 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id h17so6925709pgv.0
 for <xen-devel@lists.xenproject.org>; Sun, 02 Jun 2019 11:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=/I46+FskpLfnTJYdeg5+UEVFBu8SHGtnpAGw4wkETqU=;
 b=rGyaENeBQfxEpoYBcuF9Gcn8xTnQVR7I6gp3i6mFe6wfyEEBpyxFLLh3IRxlLA5lMx
 h8mm+SgEwk3SMNM0hIMe27iJ2x92JfIknXDssDBK61RgERahdSdsOmDg4YUoNel2ZuiA
 3++wZoIfbkAMO/8sZiPHq6vJfQeu650jF6kUtCae6VUX+uHc8skFxOSlLV4CQXIuy+lv
 wyk5Sky/MGqwOMVMhz+mPMXcTIuk1PNZbjsscauTbB3lcz1l2bbQ0Q7tTOsKhUPMJKS9
 XdBd7qCoD97T3B/zp8Bjhm8lGwGbR8pYgQ+/G1AvmGIbqWNirJ3UF4nZsbPszNv72odj
 yC3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=/I46+FskpLfnTJYdeg5+UEVFBu8SHGtnpAGw4wkETqU=;
 b=rFsSjKJINZhf11ysZqMryurFmzj30X3oanUfpiZDiEV0iMnV1KGkU6a9SLlNIZ0vP1
 182iX1bvxFEwgTNHhiTyUNf6WB+v5nd/brTRH68xayjpJROkl+pWRJSEfb2MRzGWIJF1
 ur48s4gmmp3s/QNIN1gbHyWHiOSMPXG5J3IFR3EeM47twKt69W2Lg7+5sjt3gdn/RQCF
 lCd7eDE3RAmIrhvDUVx3pJfwV1G1YAQTV3foE2PQZUGUC9UNlnMChW3HS7sEUYMZFHOo
 IzezLCQg8udof/IHhYmcrt6IqF6GkWtV2I1eYEEd6tuzwzuGv7Vu2KdYuPVlom+cKf2I
 Lagw==
X-Gm-Message-State: APjAAAVLLNd7qy2l14GEvIzsRtQ41D7ZsmxsfJrXCPxcIAMaqHfqQKw1
 iTrurebqjG7zIGhpOvns/mAfcR/6
X-Google-Smtp-Source: APXvYqz1O2IfYtdKbBRc0dvDRhxL4DXpHz+J8odVOQuU+QxYmwsVlQ8zcKBHoFfrHNb57UawBLQ/KA==
X-Received: by 2002:a63:f54c:: with SMTP id e12mr23643695pgk.62.1559498666274; 
 Sun, 02 Jun 2019 11:04:26 -0700 (PDT)
Received: from localhost.localdomain ([223.190.23.120])
 by smtp.gmail.com with ESMTPSA id v9sm11732122pfm.34.2019.06.02.11.04.23
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Sun, 02 Jun 2019 11:04:25 -0700 (PDT)
From: Amit Singh Tomar <amittomer25@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Sun,  2 Jun 2019 23:34:11 +0530
Message-Id: <1559498651-25602-1-git-send-email-amittomer25@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [Xen-devel] [PATCH v2] xen/arm: Black list everything with a PPI
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
Ynk6IEFtaXQgU2luZ2ggVG9tYXIgPGFtaXR0b21lcjI1QGdtYWlsLmNvbT4KLS0tCkNoYW5nZXMg
c2luY2UgdjE6CiAgICAqIEFkZGVkIGNvbW1lbnQgZm9yIFBQSXMgcmFuZ2UuCi0tLQogeGVuL2Fy
Y2gvYXJtL2RvbWFpbl9idWlsZC5jIHwgMTcgKysrKysrKysrKysrKysrKy0KIDEgZmlsZSBjaGFu
Z2VkLCAxNiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2Fy
Y2gvYXJtL2RvbWFpbl9idWlsZC5jIGIveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jCmluZGV4
IGQ5ODM2NzcuLjUwMzU3NTggMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQu
YworKysgYi94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMKQEAgLTEzNTMsNyArMTM1Myw3IEBA
IHN0YXRpYyBpbnQgX19pbml0IGhhbmRsZV9ub2RlKHN0cnVjdCBkb21haW4gKmQsIHN0cnVjdCBr
ZXJuZWxfaW5mbyAqa2luZm8sCiAgICAgICAgIHsgLyogc2VudGluZWwgKi8gfSwKICAgICB9Owog
ICAgIHN0cnVjdCBkdF9kZXZpY2Vfbm9kZSAqY2hpbGQ7Ci0gICAgaW50IHJlczsKKyAgICBpbnQg
cmVzLCBpLCBuaXJxLCBpcnFfaWQ7CiAgICAgY29uc3QgY2hhciAqbmFtZTsKICAgICBjb25zdCBj
aGFyICpwYXRoOwogCkBAIC0xMzk5LDYgKzEzOTksMjEgQEAgc3RhdGljIGludCBfX2luaXQgaGFu
ZGxlX25vZGUoc3RydWN0IGRvbWFpbiAqZCwgc3RydWN0IGtlcm5lbF9pbmZvICpraW5mbywKICAg
ICAgICAgcmV0dXJuIDA7CiAgICAgfQogCisgICAgLyogU2tpcCB0aGUgbm9kZSwgdXNpbmcgUFBJ
IHNvdXJjZSAqLworICAgIG5pcnEgPSBkdF9udW1iZXJfb2ZfaXJxKG5vZGUpOworCisgICAgZm9y
ICggaSA9IDAgOyBpIDwgbmlycSA7IGkrKyApCisgICAgeworICAgICAgICBpcnFfaWQgPSBwbGF0
Zm9ybV9nZXRfaXJxKG5vZGUsIGkpOworCisgICAgICAgIC8qIFBQSXMgcmFuZ2VzIGZyb20gSUQg
MTYgdG8gMzEgKi8KKyAgICAgICAgaWYgKCBpcnFfaWQgPj0gMTYgJiYgaXJxX2lkIDwgMzIgKQor
ICAgICAgICB7CisgICAgICAgICAgICBkdF9kcHJpbnRrKCIgU2tpcCBub2RlIHdpdGggKFBQSSBz
b3VyY2UpXG4iKTsKKyAgICAgICAgICAgIHJldHVybiAwOworICAgICAgICB9CisgICAgfQorCiAg
ICAgLyoKICAgICAgKiBYZW4gaXMgdXNpbmcgc29tZSBwYXRoIGZvciBpdHMgb3duIHB1cnBvc2Uu
IFdhcm4gaWYgYSBub2RlCiAgICAgICogYWxyZWFkeSBleGlzdHMgd2l0aCB0aGUgc2FtZSBwYXRo
LgotLSAKMi43LjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
