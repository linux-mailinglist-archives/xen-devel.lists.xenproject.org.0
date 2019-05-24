Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01667298BB
	for <lists+xen-devel@lfdr.de>; Fri, 24 May 2019 15:18:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hUA2i-0006Wl-NO; Fri, 24 May 2019 13:15:28 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=vjOl=TY=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hUA2h-0006Wg-H5
 for xen-devel@lists.xenproject.org; Fri, 24 May 2019 13:15:27 +0000
X-Inumbo-ID: fe4064ca-7e25-11e9-8980-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id fe4064ca-7e25-11e9-8980-bc764e045a96;
 Fri, 24 May 2019 13:15:26 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 0304FAD76;
 Fri, 24 May 2019 13:15:24 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Fri, 24 May 2019 15:15:22 +0200
Message-Id: <20190524131522.29170-1-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
Subject: [Xen-devel] [PATCH] xen/vm_event: fix rc check for uninitialized
 ring
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
Cc: Juergen Gross <jgross@suse.com>, Tamas K Lengyel <tamas@tklengyel.com>,
 Wei Liu <wei.liu2@citrix.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

dm1fZXZlbnRfY2xhaW1fc2xvdCgpIHJldHVybnMgLUVPUE5PVFNVUFAgZm9yIGFuIHVuaW5pdGlh
bGl6ZWQgcmluZwpzaW5jZSBjb21taXQgMTVlNGRkNWU4NjZiNDNiYmMgKCJjb21tb24vdm1fZXZl
bnQ6IEluaXRpYWxpemUgdm1fZXZlbnQKbGlzdHMgb24gZG9tYWluIGNyZWF0aW9uIiksIGJ1dCB0
aGUgY2FsbGVycyB0ZXN0IGZvciAtRU5PU1lTLgoKQ29ycmVjdCB0aGUgY2FsbGVycy4KClNpZ25l
ZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KLS0tCiB4ZW4vYXJjaC94
ODYvbW0vcDJtLmMgfCAyICstCiB4ZW4vY29tbW9uL21vbml0b3IuYyAgfCAyICstCiB4ZW4vY29t
bW9uL3ZtX2V2ZW50LmMgfCAyICstCiAzIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwg
MyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvbW0vcDJtLmMgYi94ZW4v
YXJjaC94ODYvbW0vcDJtLmMKaW5kZXggNTdjNWVlZGE5MS4uOGE5YTExNTNhOCAxMDA2NDQKLS0t
IGEveGVuL2FyY2gveDg2L21tL3AybS5jCisrKyBiL3hlbi9hcmNoL3g4Ni9tbS9wMm0uYwpAQCAt
MTcwNSw3ICsxNzA1LDcgQEAgdm9pZCBwMm1fbWVtX3BhZ2luZ19wb3B1bGF0ZShzdHJ1Y3QgZG9t
YWluICpkLCB1bnNpZ25lZCBsb25nIGdmbl9sKQogCiAgICAgLyogV2UncmUgcGFnaW5nLiBUaGVy
ZSBzaG91bGQgYmUgYSByaW5nICovCiAgICAgaW50IHJjID0gdm1fZXZlbnRfY2xhaW1fc2xvdChk
LCBkLT52bV9ldmVudF9wYWdpbmcpOwotICAgIGlmICggcmMgPT0gLUVOT1NZUyApCisgICAgaWYg
KCByYyA9PSAtRU9QTk9UU1VQUCApCiAgICAgewogICAgICAgICBnZHByaW50ayhYRU5MT0dfRVJS
LCAiRG9tYWluICVodSBwYWdpbmcgZ2ZuICVseCB5ZXQgbm8gcmluZyAiCiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICJpbiBwbGFjZVxuIiwgZC0+ZG9tYWluX2lkLCBnZm5fbCk7CmRpZmYg
LS1naXQgYS94ZW4vY29tbW9uL21vbml0b3IuYyBiL3hlbi9jb21tb24vbW9uaXRvci5jCmluZGV4
IGNiNWYzN2ZkYjIuLmQ1YzlmZjFjYmYgMTAwNjQ0Ci0tLSBhL3hlbi9jb21tb24vbW9uaXRvci5j
CisrKyBiL3hlbi9jb21tb24vbW9uaXRvci5jCkBAIC05OCw3ICs5OCw3IEBAIGludCBtb25pdG9y
X3RyYXBzKHN0cnVjdCB2Y3B1ICp2LCBib29sIHN5bmMsIHZtX2V2ZW50X3JlcXVlc3RfdCAqcmVx
KQogICAgIHsKICAgICBjYXNlIDA6CiAgICAgICAgIGJyZWFrOwotICAgIGNhc2UgLUVOT1NZUzoK
KyAgICBjYXNlIC1FT1BOT1RTVVBQOgogICAgICAgICAvKgogICAgICAgICAgKiBJZiB0aGVyZSB3
YXMgbm8gcmluZyB0byBoYW5kbGUgdGhlIGV2ZW50LCB0aGVuCiAgICAgICAgICAqIHNpbXBseSBj
b250aW51ZSBleGVjdXRpbmcgbm9ybWFsbHkuCmRpZmYgLS1naXQgYS94ZW4vY29tbW9uL3ZtX2V2
ZW50LmMgYi94ZW4vY29tbW9uL3ZtX2V2ZW50LmMKaW5kZXggNmU2OGJlNDdiYy4uN2I0ZWJjZWQx
NiAxMDA2NDQKLS0tIGEveGVuL2NvbW1vbi92bV9ldmVudC5jCisrKyBiL3hlbi9jb21tb24vdm1f
ZXZlbnQuYwpAQCAtNTEzLDcgKzUxMyw3IEBAIGJvb2wgdm1fZXZlbnRfY2hlY2tfcmluZyhzdHJ1
Y3Qgdm1fZXZlbnRfZG9tYWluICp2ZWQpCiAgKiB0aGlzIGZ1bmN0aW9uIHdpbGwgYWx3YXlzIHJl
dHVybiAwIGZvciBhIGd1ZXN0LiAgRm9yIGEgbm9uLWd1ZXN0LCB3ZSBjaGVjawogICogZm9yIHNw
YWNlIGFuZCByZXR1cm4gLUVCVVNZIGlmIHRoZSByaW5nIGlzIG5vdCBhdmFpbGFibGUuCiAgKgot
ICogUmV0dXJuIGNvZGVzOiAtRU5PU1lTOiB0aGUgcmluZyBpcyBub3QgeWV0IGNvbmZpZ3VyZWQK
KyAqIFJldHVybiBjb2RlczogLUVPUE5PVFNVUFA6IHRoZSByaW5nIGlzIG5vdCB5ZXQgY29uZmln
dXJlZAogICogICAgICAgICAgICAgICAtRUJVU1k6IHRoZSByaW5nIGlzIGJ1c3kKICAqICAgICAg
ICAgICAgICAgMDogYSBzcG90IGhhcyBiZWVuIHJlc2VydmVkCiAgKgotLSAKMi4xNi40CgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
