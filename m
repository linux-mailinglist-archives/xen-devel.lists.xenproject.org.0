Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA457BD8B9
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2019 09:08:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iD1ML-00080q-Vk; Wed, 25 Sep 2019 07:05:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=jAfE=XU=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iD1MK-00080f-5t
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2019 07:05:08 +0000
X-Inumbo-ID: cdd82066-df62-11e9-bf31-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id cdd82066-df62-11e9-bf31-bc764e2007e4;
 Wed, 25 Sep 2019 07:05:07 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 3B5A6AF10;
 Wed, 25 Sep 2019 07:05:06 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Wed, 25 Sep 2019 09:05:03 +0200
Message-Id: <20190925070503.13850-3-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20190925070503.13850-1-jgross@suse.com>
References: <20190925070503.13850-1-jgross@suse.com>
Subject: [Xen-devel] [PATCH 2/2] xen/sched: fix freeing per-vcpu data in
 sched_move_domain()
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
Cc: Juergen Gross <jgross@suse.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SW4gY2FzZSBvZiBhbiBhbGxvY2F0aW9uIGVycm9yIG9mIHBlci12Y3B1IGRhdGEgaW4gc2NoZWRf
bW92ZV9kb21haW4oKQp0aGUgYWxyZWFkeSBhbGxvY2F0ZWQgZGF0YSBpcyBmcmVlZCBqdXN0IHVz
aW5nIHhmcmVlKCkuIFRoaXMgaXMgd3JvbmcKYXMgc29tZSBzY2hlZHVsZXJzIG5lZWQgdG8gZG8g
YWRkaXRpb25hbCBvcGVyYXRpb25zIChlLmcuIHRoZSBhcmluYzY1MwpzY2hlZHVsZXIgbmVlZHMg
dG8gcmVtb3ZlIHRoZSB2Y3B1LWRhdGEgZnJvbSBhIGxpc3QpLgoKU28gaW5zdGVhZCB4ZnJlZSgp
IG1ha2UgdXNlIG9mIHRoZSBzY2hlZF9mcmVlX3ZkYXRhKCkgaG9vay4KClNpZ25lZC1vZmYtYnk6
IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KLS0tCiB4ZW4vY29tbW9uL3NjaGVkdWxl
LmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkK
CmRpZmYgLS1naXQgYS94ZW4vY29tbW9uL3NjaGVkdWxlLmMgYi94ZW4vY29tbW9uL3NjaGVkdWxl
LmMKaW5kZXggMTNiNWZmYzdjZi4uMTNjMTdmZTk0NCAxMDA2NDQKLS0tIGEveGVuL2NvbW1vbi9z
Y2hlZHVsZS5jCisrKyBiL3hlbi9jb21tb24vc2NoZWR1bGUuYwpAQCAtMzg2LDcgKzM4Niw3IEBA
IGludCBzY2hlZF9tb3ZlX2RvbWFpbihzdHJ1Y3QgZG9tYWluICpkLCBzdHJ1Y3QgY3B1cG9vbCAq
YykKICAgICAgICAgaWYgKCB2Y3B1X3ByaXZbdi0+dmNwdV9pZF0gPT0gTlVMTCApCiAgICAgICAg
IHsKICAgICAgICAgICAgIGZvcl9lYWNoX3ZjcHUgKCBkLCB2ICkKLSAgICAgICAgICAgICAgICB4
ZnJlZSh2Y3B1X3ByaXZbdi0+dmNwdV9pZF0pOworICAgICAgICAgICAgICAgIHNjaGVkX2ZyZWVf
dmRhdGEoYy0+c2NoZWQsIHZjcHVfcHJpdlt2LT52Y3B1X2lkXSk7CiAgICAgICAgICAgICB4ZnJl
ZSh2Y3B1X3ByaXYpOwogICAgICAgICAgICAgc2NoZWRfZnJlZV9kb21kYXRhKGMtPnNjaGVkLCBk
b21kYXRhKTsKICAgICAgICAgICAgIHJldHVybiAtRU5PTUVNOwotLSAKMi4xNi40CgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
