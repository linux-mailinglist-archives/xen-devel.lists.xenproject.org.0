Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81080173D79
	for <lists+xen-devel@lfdr.de>; Fri, 28 Feb 2020 17:49:18 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j7inA-0000M6-Gn; Fri, 28 Feb 2020 16:47:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=M3yQ=4Q=gmail.com=malus.brandywine@srs-us1.protection.inumbo.net>)
 id 1j7in9-0000M1-4u
 for xen-devel@lists.xenproject.org; Fri, 28 Feb 2020 16:47:11 +0000
X-Inumbo-ID: f6bbeba4-5a49-11ea-b472-bc764e2007e4
Received: from mail-qv1-xf41.google.com (unknown [2607:f8b0:4864:20::f41])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f6bbeba4-5a49-11ea-b472-bc764e2007e4;
 Fri, 28 Feb 2020 16:47:10 +0000 (UTC)
Received: by mail-qv1-xf41.google.com with SMTP id u10so1639757qvi.2
 for <xen-devel@lists.xenproject.org>; Fri, 28 Feb 2020 08:47:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=Ztvrya6bNFV0Urb7uJbXROEu1vVN7v9D8tb3ubUhwD0=;
 b=JzbsG3uNgyK01937fuhSr4wjEkdvsbU/plA8+Vu22YU5ARpTVGDWHTnPAS7gdr/3c/
 oxAiDGqC1Gh6E+CFwycfeAsSLx5pRxCkhbcAoMyzXrGGv4luwG6N19vx+4thaf3HsOCq
 SYRnSGHmXsvK7BvX+qYKZ4TjtT6FkrSkqyQAhK5LuLZTm0QLOQvP7ioyjcnhBp1WVgPS
 8AMWkqGKHsXboQ6yFgJ51etVtfz/TwhPmFnn0TbwrI8Qj6h9yIsEI9Zj3hIn0DBB620H
 bvgJgsEnvpFJnNcaGzIZe9thC8j6OWpKo1UYmb3DV8KE9auE5TkuIusiUnp5fLO2nO3o
 xamA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=Ztvrya6bNFV0Urb7uJbXROEu1vVN7v9D8tb3ubUhwD0=;
 b=td2Kslk8cJlquNPumzKN8AcDvGKV2wKYNJfigeZZfCniDBvpgwqHTxmLsvytJv5d8S
 V+3knNVsa3iwiJpgQgRwJDXUojdiwToQHp0pBte1/gadp3aQ9J5PHBQeP2LSI9yAd6sr
 cexhLGYCZC4XoZu+A7V46YglYV7sFkoV39mLXVh/zSXmMNkK2IiPpfht3IjPFkBCqMN1
 EInDCy/JqzKTxyxSDqujTK3dKe0m1nVIyJtc5OW0ZwNdM6SGn0Wrk1emigHdDzxI/0J6
 zWmZW6TGC+huO7i1nMUK1iAIOezZC6hSfUk7I4UFGw+MgziSjxxoAf/9N56vd68lPyuP
 WKhQ==
X-Gm-Message-State: APjAAAXa5SswMWqwAlCZdupWfrUeSkubRr+hsP7iQLVMQQJRVRaipdjF
 7So0B3ALv+poDcvVURGsddv5PYaX
X-Google-Smtp-Source: APXvYqx/fQqS5wdwkhv7F2JRAcoAiweKXo8phJxvmN5lh4cOVYTyvAgYIE7p97IaT2HG3xo9qHtmMg==
X-Received: by 2002:ad4:5888:: with SMTP id dz8mr4659418qvb.204.1582908430079; 
 Fri, 28 Feb 2020 08:47:10 -0800 (PST)
Received: from Lubuntu1804nataliya.tkf.ru
 (kntaon1614w-grc-09-74-15-93-240.dsl.bell.ca. [74.15.93.240])
 by smtp.gmail.com with ESMTPSA id m200sm5477487qke.135.2020.02.28.08.47.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Feb 2020 08:47:09 -0800 (PST)
From: Nataliya Korovkina <malus.brandywine@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Fri, 28 Feb 2020 11:46:56 -0500
Message-Id: <20200228164656.23774-1-malus.brandywine@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [Xen-devel] [xev-devel][PATCH][linux-4.19] swiotlb-xen.c: Fixed
 cache invalidation fault
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
Cc: jgross@suse.com, Nataliya Korovkina <malus.brandywine@gmail.com>,
 konrad.wilk@oracle.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UHJvYmxlbTogeGVuX3N3aW90bGJfbWFwX3NnX2F0dHJzKCkgbWFwcyBhIHNldCBvZiBidWZmZXJz
IGRlc2NyaWJlZCBpbiBzY2F0dGVybGlzdC4KSXQgY2FsbHMgeGVuX2RtYV9tYXBfcGFnZSgpIGFu
ZCBzZXRzIHNnbGlzdC5kbWFfYWRkcmVzcyB0byB0aGUgYWRkcmVzcyBjYWxjdWxhdGVkIGJ5Cnhl
bl9waHlzX3RvX2J1cygpLiBMZXQncyBjYWxsIGl0IGRtYV9hZGRyZXNzXzEuCgp4ZW5fZG1hX21h
cF9wYWdlKCkgbWFwcyB0aGUgYXJlYSBhbmQgZ2V0cyBkbWEgYWRkcmVzcyBkaWZmZXJlbnQgZnJv
bSBkbWFfYWRkcmVzc18xLApsZXQncyBjYWxsIGl0IGRtYV9hZGRyZXNzXzIuIFRoZW4gZnVuY3Rp
b24gX19zd2lvdGxiX21hcF9wYWdlKCkgbWFrZXMgY29udmVyc2lvbjoKZG1hX2FkZHIgLT4gcGh5
c19hZGRyIC0+IHZpcnRfYWRkciAgIHVzaW5nIGRtYV9hZGRyZXNzXzIgYW5kIHBhc3NlcyAidmly
dF9hZGRyIgp0byBfX2RtYV9tYXBfYXJlYSgpLCB0aGUgbGF0dGVyIHN1Y2Nlc3NmdWxseSBpbnZh
bGlkYXRlcyBjYWNoZS4KCldoZW4geGVuX3N3aW90bGJfdW5tYXBfc2dfYXR0cnMoKSB1bm1hcHMg
dGhlIGFyZWEgaXQgcGFzc2VzIGRtYV9hZGRyZXNzXzEKdG8gX19zd2lvdGxiX3VubWFwX3BhZ2Uo
KS4gICBfX3N3aW90bGJfdW5tYXBfcGFnZSgpIG1ha2VzIHRoZSBzYW1lIGNvbnZlcnRpb246CmRt
YV9hZGRyIC0+IHBoeXNfYWRkciAtPiB2aXJ0X2FkZHIgdXNpbmcgZG1hX2FkZHJlc3NfMSBhbmQg
cGFzc2VzICJ2aXJ0X2FkZHIiCnRvIF9fZG1hX21hcF9hcmVhKCksIHRoZSBsYXR0ZXIgZ2V0cyBE
YXRhIEFib3J0IGluIGF0dGVtcHQgdG8gaW52YWxpZGF0ZSBjYWNoZS4KClRoZSBwcm9ibGVtIG1h
bmZlc3RzIG9uIGRldmljZXMgdGhhdCBoYXZlIGRtYV9wZm5fb2Zmc2V0ICE9IDAuClNwZWNpZmlj
YWxseSwgd2hpbGUgbG9hZGluZyBicmNtZm1hYyBtb2R1bGUgKEJDTTQzNDUgV2lGaSBjaGlwKSBp
biBEb20wLgoKV2hhdCB3YXMgZG9uZTogc2dsaXN0LmRtYV9hZGRyZXNzIGlzIHNldCB0byBwaHlz
X3RvX2RtYSgicGh5cyIpLgoKU2lnbmVkLW9mZi1ieTogTmF0YWxpeWEgS29yb3ZraW5hIDxtYWx1
cy5icmFuZHl3aW5lQGdtYWlsLmNvbT4KLS0tCiBkcml2ZXJzL3hlbi9zd2lvdGxiLXhlbi5jIHwg
NCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMveGVuL3N3aW90bGIteGVuLmMgYi9kcml2ZXJzL3hlbi9zd2lv
dGxiLXhlbi5jCmluZGV4IGE2ZjliYTg1ZGM0Yi4uOTM2M2E1MmU0NzU2IDEwMDY0NAotLS0gYS9k
cml2ZXJzL3hlbi9zd2lvdGxiLXhlbi5jCisrKyBiL2RyaXZlcnMveGVuL3N3aW90bGIteGVuLmMK
QEAgLTU4Myw3ICs1ODMsNyBAQCB4ZW5fc3dpb3RsYl9tYXBfc2dfYXR0cnMoc3RydWN0IGRldmlj
ZSAqaHdkZXYsIHN0cnVjdCBzY2F0dGVybGlzdCAqc2dsLAogCQkJCQkJc2ctPmxlbmd0aCwKIAkJ
CQkJCWRpciwKIAkJCQkJCWF0dHJzKTsKLQkJCXNnLT5kbWFfYWRkcmVzcyA9IGRldl9hZGRyOwor
CQkJc2ctPmRtYV9hZGRyZXNzID0gcGh5c190b19kbWEoaHdkZXYsIGRldl9hZGRyKTsKIAkJfSBl
bHNlIHsKIAkJCS8qIHdlIGFyZSBub3QgaW50ZXJlc3RlZCBpbiB0aGUgZG1hX2FkZHIgcmV0dXJu
ZWQgYnkKIAkJCSAqIHhlbl9kbWFfbWFwX3BhZ2UsIG9ubHkgaW4gdGhlIHBvdGVudGlhbCBjYWNo
ZSBmbHVzaGVzIGV4ZWN1dGVkCkBAIC01OTQsNyArNTk0LDcgQEAgeGVuX3N3aW90bGJfbWFwX3Nn
X2F0dHJzKHN0cnVjdCBkZXZpY2UgKmh3ZGV2LCBzdHJ1Y3Qgc2NhdHRlcmxpc3QgKnNnbCwKIAkJ
CQkJCXNnLT5sZW5ndGgsCiAJCQkJCQlkaXIsCiAJCQkJCQlhdHRycyk7Ci0JCQlzZy0+ZG1hX2Fk
ZHJlc3MgPSBkZXZfYWRkcjsKKwkJCXNnLT5kbWFfYWRkcmVzcyA9IHBoeXNfdG9fZG1hKGh3ZGV2
LCBkZXZfYWRkcik7CiAJCX0KIAkJc2dfZG1hX2xlbihzZykgPSBzZy0+bGVuZ3RoOwogCX0KLS0g
CjIuMTcuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
