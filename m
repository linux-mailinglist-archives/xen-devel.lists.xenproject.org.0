Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E67C987D8F
	for <lists+xen-devel@lfdr.de>; Fri,  9 Aug 2019 17:03:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hw6M8-0006mK-D9; Fri, 09 Aug 2019 14:59:00 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=yG4W=WF=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hw6M0-0006YU-Hh
 for xen-devel@lists.xenproject.org; Fri, 09 Aug 2019 14:58:52 +0000
X-Inumbo-ID: 32e650c0-bab6-11e9-8980-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 32e650c0-bab6-11e9-8980-bc764e045a96;
 Fri, 09 Aug 2019 14:58:51 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id EB27FB04C;
 Fri,  9 Aug 2019 14:58:50 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Fri,  9 Aug 2019 16:58:22 +0200
Message-Id: <20190809145833.1020-38-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20190809145833.1020-1-jgross@suse.com>
References: <20190809145833.1020-1-jgross@suse.com>
Subject: [Xen-devel] [PATCH v2 37/48] xen/sched: carve out freeing
 sched_unit memory into dedicated function
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
dWxlLmMgYi94ZW4vY29tbW9uL3NjaGVkdWxlLmMKaW5kZXggZmU3YWIxYjRkZS4uYmU1ZjAzYjYy
NiAxMDA2NDQKLS0tIGEveGVuL2NvbW1vbi9zY2hlZHVsZS5jCisrKyBiL3hlbi9jb21tb24vc2No
ZWR1bGUuYwpAQCAtMzQ4LDI2ICszNDgsMTAgQEAgc3RhdGljIHZvaWQgc2NoZWRfc3Bpbl91bmxv
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
dXJuOwotCi0gICAgaWYgKCB1bml0LT52Y3B1X2xpc3QgPT0gdiApCi0gICAgICAgIHVuaXQtPnZj
cHVfbGlzdCA9IHYtPm5leHRfaW5fbGlzdDsKIAogICAgIGlmICggZC0+c2NoZWRfdW5pdF9saXN0
ID09IHVuaXQgKQogICAgICAgICBkLT5zY2hlZF91bml0X2xpc3QgPSB1bml0LT5uZXh0X2luX2xp
c3Q7CkBAIC0zOTAsNiArMzc0LDI2IEBAIHN0YXRpYyB2b2lkIHNjaGVkX2ZyZWVfdW5pdChzdHJ1
Y3Qgc2NoZWRfdW5pdCAqdW5pdCwgc3RydWN0IHZjcHUgKnYpCiAgICAgeGZyZWUodW5pdCk7CiB9
CiAKK3N0YXRpYyB2b2lkIHNjaGVkX2ZyZWVfdW5pdChzdHJ1Y3Qgc2NoZWRfdW5pdCAqdW5pdCwg
c3RydWN0IHZjcHUgKnYpCit7CisgICAgc3RydWN0IHZjcHUgKnZ1bml0OworICAgIHVuc2lnbmVk
IGludCBjbnQgPSAwOworCisgICAgLyogRG9uJ3QgY291bnQgdG8gYmUgcmVsZWFzZWQgdmNwdSwg
bWlnaHQgYmUgbm90IGluIHZjcHUgbGlzdCB5ZXQuICovCisgICAgZm9yX2VhY2hfc2NoZWRfdW5p
dF92Y3B1ICggdW5pdCwgdnVuaXQgKQorICAgICAgICBpZiAoIHZ1bml0ICE9IHYgKQorICAgICAg
ICAgICAgY250Kys7CisKKyAgICB2LT5zY2hlZF91bml0ID0gTlVMTDsKKyAgICB1bml0LT5ydW5z
dGF0ZV9jbnRbdi0+cnVuc3RhdGUuc3RhdGVdLS07CisKKyAgICBpZiAoIHVuaXQtPnZjcHVfbGlz
dCA9PSB2ICkKKyAgICAgICAgdW5pdC0+dmNwdV9saXN0ID0gdi0+bmV4dF9pbl9saXN0OworCisg
ICAgaWYgKCAhY250ICkKKyAgICAgICAgc2NoZWRfZnJlZV91bml0X21lbSh1bml0KTsKK30KKwog
c3RhdGljIHZvaWQgc2NoZWRfdW5pdF9hZGRfdmNwdShzdHJ1Y3Qgc2NoZWRfdW5pdCAqdW5pdCwg
c3RydWN0IHZjcHUgKnYpCiB7CiAgICAgdi0+c2NoZWRfdW5pdCA9IHVuaXQ7Ci0tIAoyLjE2LjQK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
