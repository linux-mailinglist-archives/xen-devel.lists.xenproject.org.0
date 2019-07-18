Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 262FC6CC6B
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jul 2019 11:58:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ho37H-0000Hx-3V; Thu, 18 Jul 2019 09:54:23 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=nWwS=VP=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1ho37F-0000Hs-6I
 for xen-devel@lists.xenproject.org; Thu, 18 Jul 2019 09:54:21 +0000
X-Inumbo-ID: 026d5d3b-a942-11e9-8980-bc764e045a96
Received: from mail-lj1-x244.google.com (unknown [2a00:1450:4864:20::244])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 026d5d3b-a942-11e9-8980-bc764e045a96;
 Thu, 18 Jul 2019 09:54:19 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id v24so26715223ljg.13
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jul 2019 02:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=+4o2+eFFhgbwp5ihS5Vdct+p+xXhdL8cUpHmebzUVZM=;
 b=RNWemrYyp5z18795E7UqFT9QFpmXZ3dSimkb2NXCCROjl36Px8IxBhiojjezGFmtIr
 C5eL8am7S3AwdvQGPql9tmIj7AEC3BQ9CiLzh8m4Yapd6Xl9/2E6+Ou+HZKEAyj7if4n
 0BuOBKY2o7xL9yM/zVkEtXQH55K9jD9sWSbWN3XJXmU1mLQnuWHaCQOcOiXFrm2uQs6k
 E2EnurKacuFDQgTa79+utnX3Y3OYBTMN4lCojWlApN9+uKecwaJMPFfDvKBYNssBY7/a
 L+U+pYKP2m+FAVXWdkR44IjPe9EQcDcXDNV0ch5AQDG3nNE/3RqCiMjT2/VnpnE01JJO
 ULEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=+4o2+eFFhgbwp5ihS5Vdct+p+xXhdL8cUpHmebzUVZM=;
 b=GzI/vEnXBqFyt1yCMOLdqE77aC4VKQgFtADsXSVUeKrPGHRLaDI7Y/k/r2MSkNsgaA
 RTHU+aO+8nPlf6Gfusyz8vYnF4mjJyFHweR4u43W0Joz3QZ/ZZmGJTj5SgQ8tEh+LMxg
 DzdazzuyekyqlO7P3AX6ZibgpJ9/mKykEEEG1QEIh7W1scEYYZcSdIVe58Ud6wg1gAPY
 CgER3iwdZFDAtdHdw3M8XfRmqBNU1mWj8af6Aq8anNadc4PlUuVfGCqxVC3VnApwehNz
 q9GYViEuMU6jiZHPGV7iLXBiMpZBxusYY7jhXEIjSKjY+AN6sbIbFMA5AKEB2pwcgjiy
 s33A==
X-Gm-Message-State: APjAAAXyCFk/0KstIwLVyir6oiRHwd1Tmlqk/gffj77/5b+lG6NwuNV1
 ItEe+34tblxdMGkDDE0StG3M5BGd
X-Google-Smtp-Source: APXvYqxB/18ntNyzFl74fAFKNmX1OUXuOPHJbNcPN/3bmh44Oci2zQIavzoBqZ8B8bkRd4K344l5Ug==
X-Received: by 2002:a2e:9685:: with SMTP id q5mr9960252lji.227.1563443657504; 
 Thu, 18 Jul 2019 02:54:17 -0700 (PDT)
Received: from aanisov-work.kyiv.epam.com (ll-22.209.223.85.sovam.net.ua.
 [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id k27sm4308280lfm.90.2019.07.18.02.54.16
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 18 Jul 2019 02:54:16 -0700 (PDT)
From: Andrii Anisov <andrii.anisov@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Thu, 18 Jul 2019 12:54:15 +0300
Message-Id: <1563443655-15802-1-git-send-email-andrii.anisov@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [Xen-devel] [PATCH] schedule: mask out XEN_RUNSTATE_UPDATE from
 state entry time
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
Cc: George Dunlap <george.dunlap@eu.citrix.com>,
 Andrii Anisov <andrii_anisov@epam.com>, Dario Faggioli <dfaggioli@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogQW5kcmlpIEFuaXNvdiA8YW5kcmlpX2FuaXNvdkBlcGFtLmNvbT4KClVzaW5nIFhFTl9S
VU5TVEFURV9VUERBVEUgbWFzayBkdXJpbmcgdGhlIHByb2Nlc3Mgb2YgY29weWluZyBydW5zdGF0
ZQp2YWx1ZXMgdG8gZ3Vlc3QgY2F1c2VzIHJ1bnN0YXRlIGVudHJ5IHRpbWUgdG8gYmUgZXZlbnR1
YWxseSBjb25zaWRlcmVkCm5lZ2F0aXZlIG9uIGEgY2FsY3VsYXRpb24gb2YgdGhlIHRpbWUgZGVs
dGEuIFNvIHRoZSBYRU5fUlVOU1RBVEVfVVBEQVRFCnNob3VsZCBiZSBtYXNrZWQgb3V0IGR1cmlu
ZyB0aGUgY2FsY3VsYXRpb24gb2YgdGhlIHRpbWUgc3BlbnQgaW4gdGhlCnBhcnRpY3VsYXIgcnVu
c3RhdGUuCgpTaWduZWQtb2ZmLWJ5OiBBbmRyaWkgQW5pc292IDxhbmRyaWlfYW5pc292QGVwYW0u
Y29tPgotLS0KIHhlbi9jb21tb24vc2NoZWR1bGUuYyB8IDQgKysrLQogMSBmaWxlIGNoYW5nZWQs
IDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3hlbi9jb21tb24v
c2NoZWR1bGUuYyBiL3hlbi9jb21tb24vc2NoZWR1bGUuYwppbmRleCAyNWY2YWIzLi5mNGYxYTgx
IDEwMDY0NAotLS0gYS94ZW4vY29tbW9uL3NjaGVkdWxlLmMKKysrIGIveGVuL2NvbW1vbi9zY2hl
ZHVsZS5jCkBAIC0xODIsNyArMTgyLDkgQEAgc3RhdGljIGlubGluZSB2b2lkIHZjcHVfcnVuc3Rh
dGVfY2hhbmdlKAogCiAgICAgdHJhY2VfcnVuc3RhdGVfY2hhbmdlKHYsIG5ld19zdGF0ZSk7CiAK
LSAgICBkZWx0YSA9IG5ld19lbnRyeV90aW1lIC0gdi0+cnVuc3RhdGUuc3RhdGVfZW50cnlfdGlt
ZTsKKyAgICBkZWx0YSA9IG5ld19lbnRyeV90aW1lIC0KKyAgICAgICAgICAgICh2LT5ydW5zdGF0
ZS5zdGF0ZV9lbnRyeV90aW1lICYgflhFTl9SVU5TVEFURV9VUERBVEUpOworCiAgICAgaWYgKCBk
ZWx0YSA+IDAgKQogICAgIHsKICAgICAgICAgdi0+cnVuc3RhdGUudGltZVt2LT5ydW5zdGF0ZS5z
dGF0ZV0gKz0gZGVsdGE7Ci0tIAoyLjcuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
