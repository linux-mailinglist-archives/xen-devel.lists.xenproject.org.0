Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06F00721B6
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jul 2019 23:39:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hq2S9-0001x2-5a; Tue, 23 Jul 2019 21:36:09 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wlUe=VU=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hq2S6-0001vj-DQ
 for xen-devel@lists.xenproject.org; Tue, 23 Jul 2019 21:36:06 +0000
X-Inumbo-ID: e0536cd1-ad91-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id e0536cd1-ad91-11e9-8980-bc764e045a96;
 Tue, 23 Jul 2019 21:36:05 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9A9DB1596;
 Tue, 23 Jul 2019 14:36:05 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E84FA3F71F;
 Tue, 23 Jul 2019 14:36:04 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Tue, 23 Jul 2019 22:35:52 +0100
Message-Id: <20190723213553.22300-7-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190723213553.22300-1-julien.grall@arm.com>
References: <20190723213553.22300-1-julien.grall@arm.com>
Subject: [Xen-devel] [PATCH 6/7] xen/arm: vsmc: The function identifier is
 always 32-bit
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
Cc: Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gQXJtNjQsIHRoZSBTTUNDQyBmdW5jdGlvbiBpZGVudGlmaWVyIGlzIGFsd2F5cyBzdG9yZWQg
aW4gdGhlIGZpcnN0IDMyLWJpdApvZiB4MCByZWdpc3Rlci4gVGhlIHJlc3Qgb2YgdGhlIGJpdHMg
YXJlIG5vdCBkZWZpbmVkIGFuZCBzaG91bGQgYmUKaWdub3JlZC4KClRoaXMgbWVhbnMgdGhlIHZh
cmlhYmxlIGZ1bmNpZCBzaG91bGQgYmUgYW4gdWludDMyX3QgcmF0aGVyIHRoYW4KcmVnaXN0ZXJf
dC4KClNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+Ci0t
LQogeGVuL2FyY2gvYXJtL3ZzbWMuYyB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0
aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vdnNtYy5j
IGIveGVuL2FyY2gvYXJtL3ZzbWMuYwppbmRleCBmOGUzNTAzMTFkLi5hMzZkYjE1ZmZmIDEwMDY0
NAotLS0gYS94ZW4vYXJjaC9hcm0vdnNtYy5jCisrKyBiL3hlbi9hcmNoL2FybS92c21jLmMKQEAg
LTIyMCw3ICsyMjAsNyBAQCBzdGF0aWMgYm9vbCB2c21jY2NfaGFuZGxlX2NhbGwoc3RydWN0IGNw
dV91c2VyX3JlZ3MgKnJlZ3MpCiB7CiAgICAgYm9vbCBoYW5kbGVkID0gZmFsc2U7CiAgICAgY29u
c3QgdW5pb24gaHNyIGhzciA9IHsgLmJpdHMgPSByZWdzLT5oc3IgfTsKLSAgICByZWdpc3Rlcl90
IGZ1bmNpZCA9IGdldF91c2VyX3JlZyhyZWdzLCAwKTsKKyAgICB1aW50MzJfdCBmdW5jaWQgPSBn
ZXRfdXNlcl9yZWcocmVncywgMCk7CiAKICAgICAvKgogICAgICAqIENoZWNrIGltbWVkaWF0ZSB2
YWx1ZSBmb3IgSFZDMzIsIEhWQzY0IGFuZCBTTUM2NC4KQEAgLTI4Niw3ICsyODYsNyBAQCBzdGF0
aWMgYm9vbCB2c21jY2NfaGFuZGxlX2NhbGwoc3RydWN0IGNwdV91c2VyX3JlZ3MgKnJlZ3MpCiAK
ICAgICBpZiAoICFoYW5kbGVkICkKICAgICB7Ci0gICAgICAgIGdwcmludGsoWEVOTE9HX0lORk8s
ICJVbmhhbmRsZWQgU01DL0hWQzogJTA4IlBSSXJlZ2lzdGVyIlxuIiwgZnVuY2lkKTsKKyAgICAg
ICAgZ3ByaW50ayhYRU5MT0dfSU5GTywgIlVuaGFuZGxlZCBTTUMvSFZDOiAlI3hcbiIsIGZ1bmNp
ZCk7CiAKICAgICAgICAgLyogSW5mb3JtIGNhbGxlciB0aGF0IGZ1bmN0aW9uIGlzIG5vdCBzdXBw
b3J0ZWQuICovCiAgICAgICAgIHNldF91c2VyX3JlZyhyZWdzLCAwLCBBUk1fU01DQ0NfRVJSX1VO
S05PV05fRlVOQ1RJT04pOwotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
