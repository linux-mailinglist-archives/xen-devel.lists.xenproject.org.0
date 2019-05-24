Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A82529AF7
	for <lists+xen-devel@lfdr.de>; Fri, 24 May 2019 17:26:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hUC2Z-0000kA-GT; Fri, 24 May 2019 15:23:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=vjOl=TY=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hUC2X-0000k5-95
 for xen-devel@lists.xenproject.org; Fri, 24 May 2019 15:23:25 +0000
X-Inumbo-ID: dd65df6e-7e37-11e9-b26c-6b9b4f3bcd6b
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dd65df6e-7e37-11e9-b26c-6b9b4f3bcd6b;
 Fri, 24 May 2019 15:23:21 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 03AD7AF52;
 Fri, 24 May 2019 15:23:21 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Fri, 24 May 2019 17:23:18 +0200
Message-Id: <20190524152318.19735-1-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
Subject: [Xen-devel] [PATCH v2] xen/vm_event: fix rc check for uninitialized
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
ZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KLS0tClYyOiBhZGQgYmxh
bmsgbGluZSAoSmFuIEJldWxpY2gpCiAgICByZXBsYWNlIHR3byBmdXJ0aGVyIEVOT1NZUyByZXR1
cm5zIHdpdGggRU9QTk9UU1VQUCAoUmF6dmFuIENvam9jYXJ1KQotLS0KIHhlbi9hcmNoL3g4Ni9t
bS9wMm0uYyB8IDMgKystCiB4ZW4vY29tbW9uL21vbml0b3IuYyAgfCAyICstCiB4ZW4vY29tbW9u
L3ZtX2V2ZW50LmMgfCA2ICsrKy0tLQogMyBmaWxlcyBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyks
IDUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L21tL3AybS5jIGIveGVu
L2FyY2gveDg2L21tL3AybS5jCmluZGV4IDU3YzVlZWRhOTEuLjhmZDNjOWQ5OTYgMTAwNjQ0Ci0t
LSBhL3hlbi9hcmNoL3g4Ni9tbS9wMm0uYworKysgYi94ZW4vYXJjaC94ODYvbW0vcDJtLmMKQEAg
LTE3MDUsNyArMTcwNSw4IEBAIHZvaWQgcDJtX21lbV9wYWdpbmdfcG9wdWxhdGUoc3RydWN0IGRv
bWFpbiAqZCwgdW5zaWduZWQgbG9uZyBnZm5fbCkKIAogICAgIC8qIFdlJ3JlIHBhZ2luZy4gVGhl
cmUgc2hvdWxkIGJlIGEgcmluZyAqLwogICAgIGludCByYyA9IHZtX2V2ZW50X2NsYWltX3Nsb3Qo
ZCwgZC0+dm1fZXZlbnRfcGFnaW5nKTsKLSAgICBpZiAoIHJjID09IC1FTk9TWVMgKQorCisgICAg
aWYgKCByYyA9PSAtRU9QTk9UU1VQUCApCiAgICAgewogICAgICAgICBnZHByaW50ayhYRU5MT0df
RVJSLCAiRG9tYWluICVodSBwYWdpbmcgZ2ZuICVseCB5ZXQgbm8gcmluZyAiCiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICJpbiBwbGFjZVxuIiwgZC0+ZG9tYWluX2lkLCBnZm5fbCk7CmRp
ZmYgLS1naXQgYS94ZW4vY29tbW9uL21vbml0b3IuYyBiL3hlbi9jb21tb24vbW9uaXRvci5jCmlu
ZGV4IGNiNWYzN2ZkYjIuLmQ1YzlmZjFjYmYgMTAwNjQ0Ci0tLSBhL3hlbi9jb21tb24vbW9uaXRv
ci5jCisrKyBiL3hlbi9jb21tb24vbW9uaXRvci5jCkBAIC05OCw3ICs5OCw3IEBAIGludCBtb25p
dG9yX3RyYXBzKHN0cnVjdCB2Y3B1ICp2LCBib29sIHN5bmMsIHZtX2V2ZW50X3JlcXVlc3RfdCAq
cmVxKQogICAgIHsKICAgICBjYXNlIDA6CiAgICAgICAgIGJyZWFrOwotICAgIGNhc2UgLUVOT1NZ
UzoKKyAgICBjYXNlIC1FT1BOT1RTVVBQOgogICAgICAgICAvKgogICAgICAgICAgKiBJZiB0aGVy
ZSB3YXMgbm8gcmluZyB0byBoYW5kbGUgdGhlIGV2ZW50LCB0aGVuCiAgICAgICAgICAqIHNpbXBs
eSBjb250aW51ZSBleGVjdXRpbmcgbm9ybWFsbHkuCmRpZmYgLS1naXQgYS94ZW4vY29tbW9uL3Zt
X2V2ZW50LmMgYi94ZW4vY29tbW9uL3ZtX2V2ZW50LmMKaW5kZXggNmU2OGJlNDdiYy4uNjgzM2My
MTU0NCAxMDA2NDQKLS0tIGEveGVuL2NvbW1vbi92bV9ldmVudC5jCisrKyBiL3hlbi9jb21tb24v
dm1fZXZlbnQuYwpAQCAtNjQsNyArNjQsNyBAQCBzdGF0aWMgaW50IHZtX2V2ZW50X2VuYWJsZSgK
ICAgICAvKiBUaGUgcGFyYW1ldGVyIGRlZmF1bHRzIHRvIHplcm8sIGFuZCBpdCBzaG91bGQgYmUK
ICAgICAgKiBzZXQgdG8gc29tZXRoaW5nICovCiAgICAgaWYgKCByaW5nX2dmbiA9PSAwICkKLSAg
ICAgICAgcmV0dXJuIC1FTk9TWVM7CisgICAgICAgIHJldHVybiAtRU9QTk9UU1VQUDsKIAogICAg
IHZtX2V2ZW50X3JpbmdfbG9ja19pbml0KCp2ZWQpOwogICAgIHZtX2V2ZW50X3JpbmdfbG9jaygq
dmVkKTsKQEAgLTQ2NSw3ICs0NjUsNyBAQCBzdGF0aWMgaW50IHZtX2V2ZW50X2dyYWJfc2xvdChz
dHJ1Y3Qgdm1fZXZlbnRfZG9tYWluICp2ZWQsIGludCBmb3JlaWduKQogICAgIHVuc2lnbmVkIGlu
dCBhdmFpbF9yZXE7CiAKICAgICBpZiAoICF2ZWQtPnJpbmdfcGFnZSApCi0gICAgICAgIHJldHVy
biAtRU5PU1lTOworICAgICAgICByZXR1cm4gLUVPUE5PVFNVUFA7CiAKICAgICB2bV9ldmVudF9y
aW5nX2xvY2sodmVkKTsKIApAQCAtNTEzLDcgKzUxMyw3IEBAIGJvb2wgdm1fZXZlbnRfY2hlY2tf
cmluZyhzdHJ1Y3Qgdm1fZXZlbnRfZG9tYWluICp2ZWQpCiAgKiB0aGlzIGZ1bmN0aW9uIHdpbGwg
YWx3YXlzIHJldHVybiAwIGZvciBhIGd1ZXN0LiAgRm9yIGEgbm9uLWd1ZXN0LCB3ZSBjaGVjawog
ICogZm9yIHNwYWNlIGFuZCByZXR1cm4gLUVCVVNZIGlmIHRoZSByaW5nIGlzIG5vdCBhdmFpbGFi
bGUuCiAgKgotICogUmV0dXJuIGNvZGVzOiAtRU5PU1lTOiB0aGUgcmluZyBpcyBub3QgeWV0IGNv
bmZpZ3VyZWQKKyAqIFJldHVybiBjb2RlczogLUVPUE5PVFNVUFA6IHRoZSByaW5nIGlzIG5vdCB5
ZXQgY29uZmlndXJlZAogICogICAgICAgICAgICAgICAtRUJVU1k6IHRoZSByaW5nIGlzIGJ1c3kK
ICAqICAgICAgICAgICAgICAgMDogYSBzcG90IGhhcyBiZWVuIHJlc2VydmVkCiAgKgotLSAKMi4x
Ni40CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
