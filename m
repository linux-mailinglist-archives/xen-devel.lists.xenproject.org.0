Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7556F15BE96
	for <lists+xen-devel@lfdr.de>; Thu, 13 Feb 2020 13:42:11 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j2Dlx-0003wC-9F; Thu, 13 Feb 2020 12:39:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=91ql=4B=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1j2Dlv-0003w7-Ed
 for xen-devel@lists.xenproject.org; Thu, 13 Feb 2020 12:39:11 +0000
X-Inumbo-ID: d540788e-4e5d-11ea-b0fd-bc764e2007e4
Received: from mail-wm1-f67.google.com (unknown [209.85.128.67])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d540788e-4e5d-11ea-b0fd-bc764e2007e4;
 Thu, 13 Feb 2020 12:39:10 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id s144so7014909wme.1
 for <xen-devel@lists.xenproject.org>; Thu, 13 Feb 2020 04:39:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=pxuifacQb8A8llKuV1dHybaKqQ0cuFkZRmIkMGLGiIs=;
 b=kePMmF2hC7FcM5v2Pka86XFpMnyMupDrlruABGYJEG3rF01WhHiDnkZlIsvaPD9sqY
 3zl/VpkN8M3p5RqWzsgUGfk/5R7RGKisgNX0Y2VjKoZm1XD7e4SAvAftfukJuvCgbVIR
 cHioeM3O3evKGNhYo9GDFFsaoFFFDp96VjarHLqU2ELvQPeaTbA47Jd9ZarA5O0GXjRr
 jKrdaxt6HR64GM52eL4wDIo8c9CCcNTsE2UV1+YbgUfxbfLyKAXfByyuHADcX0j2P9Q9
 vreCn1QFMFawVZFi0xcgplX0TWwoUpj4jlq2e9BV/2E6kbtGoXatcL/twboJ9x0EQuYO
 EHyQ==
X-Gm-Message-State: APjAAAW6fFQl4uhCTcI4sgD9d6nuaNqNpafeS1pNmobXnWhCbRwJ0Ohw
 YG5Bdgnc27u8oqlMzOUo/B4bMWMBvQXLiQ==
X-Google-Smtp-Source: APXvYqyUVRQQj4yvnnxXhC1Hw0xIDKQY64yBDJB2Qhrr4uPCsmqPEI+sse49+bCXMQA0nnVR+X8Dog==
X-Received: by 2002:a1c:5448:: with SMTP id p8mr5921835wmi.159.1581597549924; 
 Thu, 13 Feb 2020 04:39:09 -0800 (PST)
Received: from ufe34d9ed68d054.ant.amazon.com (54-240-197-235.amazon.com.
 [54.240.197.235])
 by smtp.gmail.com with ESMTPSA id y7sm13445465wmd.1.2020.02.13.04.39.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Feb 2020 04:39:09 -0800 (PST)
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Date: Thu, 13 Feb 2020 12:39:06 +0000
Message-Id: <20200213123906.10376-1-julien@xen.org>
X-Mailer: git-send-email 2.17.1
Subject: [Xen-devel] [PATCH] xen/arm: Use asm/ rather than asm-arm/ when
 including header
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
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QWxsIHRoZSBhcmNoIGhlYWRlcnMgKGkuZSB1bmRlciBhc20tYXJtKSBhcmUgaW5jbHVkZWQgdXNp
bmcgImFzbS8qLmgiLgoKVG8gc3RheSBjb25zaXN0ZW50LCByZW1vdmUgdGhlIG9ubHkgaW5zdGFu
Y2Ugd2hlcmUgImFzbS1hcm0vKi5oIiBpcwp1c2VkLgoKVGFrZSB0aGUgb3Bwb3J0dW5pdHkgdG8g
bW92ZSB0aGUgaW5jbHVzaW9uIHdpdGggdGhlIHJlc3Qgb2YgdGhlIGFzbS8KaW5jbHVkZS4KClNp
Z25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+Ci0tLQogeGVuL2luY2x1
ZGUvYXNtLWFybS9kb21haW4uaCB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL2FzbS1hcm0vZG9tYWlu
LmggYi94ZW4vaW5jbHVkZS9hc20tYXJtL2RvbWFpbi5oCmluZGV4IDg1YTZmMTdkNGQuLmQyMTQy
YzY3MDcgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL2FzbS1hcm0vZG9tYWluLmgKKysrIGIveGVu
L2luY2x1ZGUvYXNtLWFybS9kb21haW4uaApAQCAtOSwxMCArOSwxMCBAQAogI2luY2x1ZGUgPGFz
bS9tbWlvLmg+CiAjaW5jbHVkZSA8YXNtL2dpYy5oPgogI2luY2x1ZGUgPGFzbS92Z2ljLmg+Cisj
aW5jbHVkZSA8YXNtL3ZwbDAxMS5oPgogI2luY2x1ZGUgPHB1YmxpYy9odm0vcGFyYW1zLmg+CiAj
aW5jbHVkZSA8eGVuL3NlcmlhbC5oPgogI2luY2x1ZGUgPHhlbi9yYnRyZWUuaD4KLSNpbmNsdWRl
IDxhc20tYXJtL3ZwbDAxMS5oPgogCiBzdHJ1Y3QgaHZtX2RvbWFpbgogewotLSAKMi4xNy4xCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
