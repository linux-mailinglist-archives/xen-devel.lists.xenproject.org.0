Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B95562C46D
	for <lists+xen-devel@lfdr.de>; Tue, 28 May 2019 12:36:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hVZR1-0006Ye-Qh; Tue, 28 May 2019 10:34:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=31/0=T4=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hVZQF-0004vF-HN
 for xen-devel@lists.xenproject.org; Tue, 28 May 2019 10:33:35 +0000
X-Inumbo-ID: 08188bae-8134-11e9-a561-2b85f6796d62
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 08188bae-8134-11e9-a561-2b85f6796d62;
 Tue, 28 May 2019 10:33:29 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 567DCB06B;
 Tue, 28 May 2019 10:33:28 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Tue, 28 May 2019 12:32:59 +0200
Message-Id: <20190528103313.1343-47-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20190528103313.1343-1-jgross@suse.com>
References: <20190528103313.1343-1-jgross@suse.com>
Subject: [Xen-devel] [PATCH 46/60] xen/sched: carve out freeing sched_unit
 memory into dedicated function
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

V2UnbGwgbmVlZCBhIHdheSB0byBmcmVlIGEgc2NoZWRfdW5pdCBzdHJ1Y3R1cmUgd2l0aG91dCBz
aWRlIGVmZmVjdHMKaW4gYSBsYXRlciBwYXRjaC4KClNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jv
c3MgPGpncm9zc0BzdXNlLmNvbT4KLS0tClJGQyBWMjogbmV3IHBhdGNoLCBjYXJ2ZWQgb3V0IGZy
b20gUkZDIFYxIHBhdGNoIDQ5Ci0tLQogeGVuL2NvbW1vbi9zY2hlZHVsZS5jIHwgMzggKysrKysr
KysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAyMSBpbnNl
cnRpb25zKCspLCAxNyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vY29tbW9uL3NjaGVk
dWxlLmMgYi94ZW4vY29tbW9uL3NjaGVkdWxlLmMKaW5kZXggZTE4OWNjN2MyYi4uOWJmZjRkYzE4
MyAxMDA2NDQKLS0tIGEveGVuL2NvbW1vbi9zY2hlZHVsZS5jCisrKyBiL3hlbi9jb21tb24vc2No
ZWR1bGUuYwpAQCAtMjg4LDI2ICsyODgsMTAgQEAgc3RhdGljIHZvaWQgc2NoZWRfc3Bpbl91bmxv
Y2tfZG91YmxlKHNwaW5sb2NrX3QgKmxvY2sxLCBzcGlubG9ja190ICpsb2NrMiwKICAgICBzcGlu
X3VubG9ja19pcnFyZXN0b3JlKGxvY2sxLCBmbGFncyk7CiB9CiAKLXN0YXRpYyB2b2lkIHNjaGVk
X2ZyZWVfdW5pdChzdHJ1Y3Qgc2NoZWRfdW5pdCAqdW5pdCwgc3RydWN0IHZjcHUgKnYpCitzdGF0
aWMgdm9pZCBzY2hlZF9mcmVlX3VuaXRfbWVtKHN0cnVjdCBzY2hlZF91bml0ICp1bml0KQogewog
ICAgIHN0cnVjdCBzY2hlZF91bml0ICpwcmV2X3VuaXQ7CiAgICAgc3RydWN0IGRvbWFpbiAqZCA9
IHVuaXQtPmRvbWFpbjsKLSAgICBzdHJ1Y3QgdmNwdSAqdnVuaXQ7Ci0gICAgdW5zaWduZWQgaW50
IGNudCA9IDA7Ci0KLSAgICAvKiBEb24ndCBjb3VudCB0byBiZSByZWxlYXNlZCB2Y3B1LCBtaWdo
dCBiZSBub3QgaW4gdmNwdSBsaXN0IHlldC4gKi8KLSAgICBmb3JfZWFjaF9zY2hlZF91bml0X3Zj
cHUgKCB1bml0LCB2dW5pdCApCi0gICAgICAgIGlmICggdnVuaXQgIT0gdiApCi0gICAgICAgICAg
ICBjbnQrKzsKLQotICAgIHYtPnNjaGVkX3VuaXQgPSBOVUxMOwotICAgIHVuaXQtPnJ1bnN0YXRl
X2NudFt2LT5ydW5zdGF0ZS5zdGF0ZV0tLTsKLQotICAgIGlmICggY250ICkKLSAgICAgICAgcmV0
dXJuOwotCi0gICAgaWYgKCB1bml0LT52Y3B1ID09IHYgKQotICAgICAgICB1bml0LT52Y3B1ID0g
di0+bmV4dF9pbl9saXN0OwogCiAgICAgaWYgKCBkLT5zY2hlZF91bml0X2xpc3QgPT0gdW5pdCAp
CiAgICAgICAgIGQtPnNjaGVkX3VuaXRfbGlzdCA9IHVuaXQtPm5leHRfaW5fbGlzdDsKQEAgLTMz
MSw2ICszMTUsMjYgQEAgc3RhdGljIHZvaWQgc2NoZWRfZnJlZV91bml0KHN0cnVjdCBzY2hlZF91
bml0ICp1bml0LCBzdHJ1Y3QgdmNwdSAqdikKICAgICB4ZnJlZSh1bml0KTsKIH0KIAorc3RhdGlj
IHZvaWQgc2NoZWRfZnJlZV91bml0KHN0cnVjdCBzY2hlZF91bml0ICp1bml0LCBzdHJ1Y3QgdmNw
dSAqdikKK3sKKyAgICBzdHJ1Y3QgdmNwdSAqdnVuaXQ7CisgICAgdW5zaWduZWQgaW50IGNudCA9
IDA7CisKKyAgICAvKiBEb24ndCBjb3VudCB0byBiZSByZWxlYXNlZCB2Y3B1LCBtaWdodCBiZSBu
b3QgaW4gdmNwdSBsaXN0IHlldC4gKi8KKyAgICBmb3JfZWFjaF9zY2hlZF91bml0X3ZjcHUgKCB1
bml0LCB2dW5pdCApCisgICAgICAgIGlmICggdnVuaXQgIT0gdiApCisgICAgICAgICAgICBjbnQr
KzsKKworICAgIHYtPnNjaGVkX3VuaXQgPSBOVUxMOworICAgIHVuaXQtPnJ1bnN0YXRlX2NudFt2
LT5ydW5zdGF0ZS5zdGF0ZV0tLTsKKworICAgIGlmICggdW5pdC0+dmNwdSA9PSB2ICkKKyAgICAg
ICAgdW5pdC0+dmNwdSA9IHYtPm5leHRfaW5fbGlzdDsKKworICAgIGlmICggIWNudCApCisgICAg
ICAgIHNjaGVkX2ZyZWVfdW5pdF9tZW0odW5pdCk7Cit9CisKIHN0YXRpYyB2b2lkIHNjaGVkX3Vu
aXRfYWRkX3ZjcHUoc3RydWN0IHNjaGVkX3VuaXQgKnVuaXQsIHN0cnVjdCB2Y3B1ICp2KQogewog
ICAgIHYtPnNjaGVkX3VuaXQgPSB1bml0OwotLSAKMi4xNi40CgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
