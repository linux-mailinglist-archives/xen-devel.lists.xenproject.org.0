Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09FE86C188
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jul 2019 21:36:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hnpgZ-0000HF-UB; Wed, 17 Jul 2019 19:33:55 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=K8rP=VO=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1hnpgY-0000HA-G4
 for xen-devel@lists.xenproject.org; Wed, 17 Jul 2019 19:33:54 +0000
X-Inumbo-ID: cf2ac699-a8c9-11e9-8980-bc764e045a96
Received: from mail-io1-f65.google.com (unknown [209.85.166.65])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id cf2ac699-a8c9-11e9-8980-bc764e045a96;
 Wed, 17 Jul 2019 19:33:53 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id h6so47595072iom.7
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jul 2019 12:33:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dxEk0mar3gB6TPwI/s5SG4wooFUT3eoEszYbANfY1oc=;
 b=bKrVtqKKorTHtBnHN15/lol85TfHi4Y9sICxv3wJUn0CBpXV+gQVUEiu+TKAIHzSql
 ClwnWqSdZWgTa0LBskIqdvbMM0JtXUOi0qRLOmS88mmrJQatOo+2cjp9ixE6yD6OZUuq
 PL+Y/QtjeUS2VD4Vo+0Nh90LyzucflNUqYGSnYb+F2ID5VlkqM5wvD8gvZZVixtOk6zg
 IDOI1LEBggJjct7edUssR3ad9F1lU2a2WwtgILKZ6TT1l2qzzdPthA35tx8MIOymwjfr
 dJ5I5mNMoErdIASy1c2NX6YUnXUyNyQ/W6gVU7Mx0lW0bdYEdS6KT4qq1UtcJyUmtY2P
 hoEg==
X-Gm-Message-State: APjAAAVsYzxCtrbGJ6DCNucE0yMkMFHok9VgSQzDPM2cGmKiF9PYw6RO
 Q+O3zU5Z+uqrekuEUwyq1Rpmchwk
X-Google-Smtp-Source: APXvYqwAR68Lju9JlmoQ7FOS/CvPVVIGnrTSQucvgrp8xIkHG1K9SBh5ZBuD7GR1ewK/CJffHW4bTA==
X-Received: by 2002:a6b:4107:: with SMTP id n7mr34993597ioa.12.1563392032353; 
 Wed, 17 Jul 2019 12:33:52 -0700 (PDT)
Received: from l1.lan (c-71-205-12-124.hsd1.co.comcast.net. [71.205.12.124])
 by smtp.gmail.com with ESMTPSA id v13sm21743421ioq.13.2019.07.17.12.33.51
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 17 Jul 2019 12:33:51 -0700 (PDT)
From: Tamas K Lengyel <tamas@tklengyel.com>
To: xen-devel@lists.xenproject.org
Date: Wed, 17 Jul 2019 13:33:30 -0600
Message-Id: <20190717193335.11991-1-tamas@tklengyel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v6 0/5] x86/mem_sharing: assorted fixes
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
Cc: Tamas K Lengyel <tamas@tklengyel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBpcyBhbiBhc3NvcnRlZCBzZXJpZXMgb2YgZml4ZXMgdG8gdGhlIG1lbW9yeSBzaGFyaW5n
IHN1YnN5c3RlbS4KClBhdGNoIDEtMjogZml4IGdlbmVyYWwgYnJva2VuZXNzIG9mIHRoZSBzeXN0
ZW0KUGF0Y2ggMy01OiBuaWNlLXRvLWhhdmVzICYgY2xlYW51cHMsIGNvdWxkIGJlIGFwcGxpZWQg
aW5kZXBlbmRlbnRseSBmcm9tIHRoZQogICAgICAgICAgIHJlc3Qgb2YgdGhlIHBhdGNoZXMgaW4g
dGhlIHNlcmllcwoKVGFtYXMgSyBMZW5neWVsICg1KToKICB4ODYvbWVtX3NoYXJpbmc6IHJlb3Jk
ZXIgd2hlbiBwYWdlcyBhcmUgdW5sb2NrZWQgYW5kIHJlbGVhc2VkCiAgeDg2L21lbV9zaGFyaW5n
OiBjb3B5IGEgcGFnZV9sb2NrIHZlcnNpb24gdG8gYmUgaW50ZXJuYWwgdG8gbWVtc2hyCiAgeDg2
L21lbV9zaGFyaW5nOiBlbmFibGUgbWVtX3NoYXJlIGF1ZGl0IG1vZGUgb25seSBpbiBkZWJ1ZyBi
dWlsZHMKICB4ODYvbWVtX3NoYXJpbmc6IGNvbXBpbGUgbWVtX3NoYXJpbmcgc3Vic3lzdGVtIG9u
bHkgd2hlbiBrY29uZmlnIGlzCiAgICBlbmFibGVkCiAgeDg2L21lbV9zaGFyaW5nOiBzdHlsZSBj
bGVhbnVwCgogeGVuL2FyY2gveDg2L0tjb25maWcgICAgICAgICAgICAgIHwgICA2ICstCiB4ZW4v
YXJjaC94ODYvZG9tYWluLmMgICAgICAgICAgICAgfCAgIDIgKwogeGVuL2FyY2gveDg2L2RvbWN0
bC5jICAgICAgICAgICAgIHwgICAyICsKIHhlbi9hcmNoL3g4Ni9tbS9NYWtlZmlsZSAgICAgICAg
ICB8ICAgMiArLQogeGVuL2FyY2gveDg2L21tL21lbV9zaGFyaW5nLmMgICAgIHwgMzU1ICsrKysr
KysrKysrKysrKysrLS0tLS0tLS0tLS0tLQogeGVuL2FyY2gveDg2L3g4Nl82NC9jb21wYXQvbW0u
YyAgIHwgICAyICsKIHhlbi9hcmNoL3g4Ni94ODZfNjQvbW0uYyAgICAgICAgICB8ICAgMiArCiB4
ZW4vY29tbW9uL0tjb25maWcgICAgICAgICAgICAgICAgfCAgIDMgLQogeGVuL2NvbW1vbi9kb21h
aW4uYyAgICAgICAgICAgICAgIHwgICA2ICstCiB4ZW4vY29tbW9uL2dyYW50X3RhYmxlLmMgICAg
ICAgICAgfCAgIDIgKy0KIHhlbi9jb21tb24vbWVtb3J5LmMgICAgICAgICAgICAgICB8ICAgMiAr
LQogeGVuL2NvbW1vbi92bV9ldmVudC5jICAgICAgICAgICAgIHwgICA2ICstCiB4ZW4vaW5jbHVk
ZS9hc20teDg2L21lbV9zaGFyaW5nLmggfCAgMzIgKysrCiB4ZW4vaW5jbHVkZS9hc20teDg2L21t
LmggICAgICAgICAgfCAgMTggKy0KIHhlbi9pbmNsdWRlL3hlbi9tbS5oICAgICAgICAgICAgICB8
ICAgMiArLQogeGVuL2luY2x1ZGUveGVuL3NjaGVkLmggICAgICAgICAgIHwgICAyICstCiB4ZW4v
aW5jbHVkZS94c20vZHVtbXkuaCAgICAgICAgICAgfCAgIDIgKy0KIHhlbi9pbmNsdWRlL3hzbS94
c20uaCAgICAgICAgICAgICB8ICAgNCArLQogeGVuL3hzbS9kdW1teS5jICAgICAgICAgICAgICAg
ICAgIHwgICAyICstCiB4ZW4veHNtL2ZsYXNrL2hvb2tzLmMgICAgICAgICAgICAgfCAgIDQgKy0K
IDIwIGZpbGVzIGNoYW5nZWQsIDI2NiBpbnNlcnRpb25zKCspLCAxOTAgZGVsZXRpb25zKC0pCgot
LSAKMi4yMC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
