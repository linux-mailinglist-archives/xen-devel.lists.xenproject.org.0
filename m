Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B45AD17F10E
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2020 08:33:23 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jBZK7-0001Z5-U8; Tue, 10 Mar 2020 07:29:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=WGVw=43=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jBZK5-0001Yk-W9
 for xen-devel@lists.xenproject.org; Tue, 10 Mar 2020 07:29:06 +0000
X-Inumbo-ID: cec9a1f4-62a0-11ea-8f6d-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cec9a1f4-62a0-11ea-8f6d-bc764e2007e4;
 Tue, 10 Mar 2020 07:28:59 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 7CB11AC91;
 Tue, 10 Mar 2020 07:28:58 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Tue, 10 Mar 2020 08:28:48 +0100
Message-Id: <20200310072853.27567-2-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200310072853.27567-1-jgross@suse.com>
References: <20200310072853.27567-1-jgross@suse.com>
Subject: [Xen-devel] [PATCH v4 1/6] xen/rcu: use rcu softirq for forcing
 quiescent state
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
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QXMgcmN1IGNhbGxiYWNrcyBhcmUgcHJvY2Vzc2VkIGluIF9fZG9fc29mdGlycSgpIHRoZXJlIGlz
IG5vIG5lZWQgdG8KdXNlIHRoZSBzY2hlZHVsaW5nIHNvZnRpcnEgZm9yIGZvcmNpbmcgcXVpZXNj
ZW50IHN0YXRlLiBBbnkgb3RoZXIKc29mdGlycSB3b3VsZCBkbyB0aGUgam9iIGFuZCB0aGUgc2No
ZWR1bGluZyBvbmUgaXMgdGhlIG1vc3QgZXhwZW5zaXZlLgoKU28gdXNlIHRoZSBhbHJlYWR5IGV4
aXN0aW5nIHJjdSBzb2Z0aXJxIGZvciB0aGF0IHB1cnBvc2UuIEZvciB0ZWxsaW5nCmFwYXJ0IHdo
eSB0aGUgcmN1IHNvZnRpcnEgd2FzIHJhaXNlZCBhZGQgYSBmbGFnIGZvciB0aGUgY3VycmVudCB1
c2FnZS4KClNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KQWNr
ZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Ci0tLQogeGVu
L2NvbW1vbi9yY3VwZGF0ZS5jIHwgMjAgKysrKysrKysrKysrKysrKystLS0KIDEgZmlsZSBjaGFu
Z2VkLCAxNyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9j
b21tb24vcmN1cGRhdGUuYyBiL3hlbi9jb21tb24vcmN1cGRhdGUuYwppbmRleCBkNzZiOTkxNjI3
Li4wM2Q4NDc2NGQyIDEwMDY0NAotLS0gYS94ZW4vY29tbW9uL3JjdXBkYXRlLmMKKysrIGIveGVu
L2NvbW1vbi9yY3VwZGF0ZS5jCkBAIC04OSw2ICs4OSw4IEBAIHN0cnVjdCByY3VfZGF0YSB7CiAg
ICAgLyogMykgaWRsZSBDUFVzIGhhbmRsaW5nICovCiAgICAgc3RydWN0IHRpbWVyIGlkbGVfdGlt
ZXI7CiAgICAgYm9vbCBpZGxlX3RpbWVyX2FjdGl2ZTsKKworICAgIGJvb2wgICAgICAgICAgICBw
cm9jZXNzX2NhbGxiYWNrczsKIH07CiAKIC8qCkBAIC0xOTgsNyArMjAwLDcgQEAgc3RhdGljIHZv
aWQgZm9yY2VfcXVpZXNjZW50X3N0YXRlKHN0cnVjdCByY3VfZGF0YSAqcmRwLAogICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCByY3VfY3RybGJsayAqcmNwKQogewogICAg
IGNwdW1hc2tfdCBjcHVtYXNrOwotICAgIHJhaXNlX3NvZnRpcnEoU0NIRURVTEVfU09GVElSUSk7
CisgICAgcmFpc2Vfc29mdGlycShSQ1VfU09GVElSUSk7CiAgICAgaWYgKHVubGlrZWx5KHJkcC0+
cWxlbiAtIHJkcC0+bGFzdF9yc19xbGVuID4gcnNpbnRlcnZhbCkpIHsKICAgICAgICAgcmRwLT5s
YXN0X3JzX3FsZW4gPSByZHAtPnFsZW47CiAgICAgICAgIC8qCkBAIC0yMDYsNyArMjA4LDcgQEAg
c3RhdGljIHZvaWQgZm9yY2VfcXVpZXNjZW50X3N0YXRlKHN0cnVjdCByY3VfZGF0YSAqcmRwLAog
ICAgICAgICAgKiByZHAtPmNwdSBpcyB0aGUgY3VycmVudCBjcHUuCiAgICAgICAgICAqLwogICAg
ICAgICBjcHVtYXNrX2FuZG5vdCgmY3B1bWFzaywgJnJjcC0+Y3B1bWFzaywgY3B1bWFza19vZihy
ZHAtPmNwdSkpOwotICAgICAgICBjcHVtYXNrX3JhaXNlX3NvZnRpcnEoJmNwdW1hc2ssIFNDSEVE
VUxFX1NPRlRJUlEpOworICAgICAgICBjcHVtYXNrX3JhaXNlX3NvZnRpcnEoJmNwdW1hc2ssIFJD
VV9TT0ZUSVJRKTsKICAgICB9CiB9CiAKQEAgLTI2Myw3ICsyNjUsMTAgQEAgc3RhdGljIHZvaWQg
cmN1X2RvX2JhdGNoKHN0cnVjdCByY3VfZGF0YSAqcmRwKQogICAgIGlmICghcmRwLT5kb25lbGlz
dCkKICAgICAgICAgcmRwLT5kb25ldGFpbCA9ICZyZHAtPmRvbmVsaXN0OwogICAgIGVsc2UKKyAg
ICB7CisgICAgICAgIHJkcC0+cHJvY2Vzc19jYWxsYmFja3MgPSB0cnVlOwogICAgICAgICByYWlz
ZV9zb2Z0aXJxKFJDVV9TT0ZUSVJRKTsKKyAgICB9CiB9CiAKIC8qCkBAIC00MTQsNyArNDE5LDEz
IEBAIHN0YXRpYyB2b2lkIF9fcmN1X3Byb2Nlc3NfY2FsbGJhY2tzKHN0cnVjdCByY3VfY3RybGJs
ayAqcmNwLAogCiBzdGF0aWMgdm9pZCByY3VfcHJvY2Vzc19jYWxsYmFja3Modm9pZCkKIHsKLSAg
ICBfX3JjdV9wcm9jZXNzX2NhbGxiYWNrcygmcmN1X2N0cmxibGssICZ0aGlzX2NwdShyY3VfZGF0
YSkpOworICAgIHN0cnVjdCByY3VfZGF0YSAqcmRwID0gJnRoaXNfY3B1KHJjdV9kYXRhKTsKKwor
ICAgIGlmICggcmRwLT5wcm9jZXNzX2NhbGxiYWNrcyApCisgICAgeworICAgICAgICByZHAtPnBy
b2Nlc3NfY2FsbGJhY2tzID0gZmFsc2U7CisgICAgICAgIF9fcmN1X3Byb2Nlc3NfY2FsbGJhY2tz
KCZyY3VfY3RybGJsaywgcmRwKTsKKyAgICB9CiB9CiAKIHN0YXRpYyBpbnQgX19yY3VfcGVuZGlu
ZyhzdHJ1Y3QgcmN1X2N0cmxibGsgKnJjcCwgc3RydWN0IHJjdV9kYXRhICpyZHApCkBAIC01MjIs
NiArNTMzLDkgQEAgc3RhdGljIHZvaWQgcmN1X2lkbGVfdGltZXJfaGFuZGxlcih2b2lkKiBkYXRh
KQogCiB2b2lkIHJjdV9jaGVja19jYWxsYmFja3MoaW50IGNwdSkKIHsKKyAgICBzdHJ1Y3QgcmN1
X2RhdGEgKnJkcCA9ICZ0aGlzX2NwdShyY3VfZGF0YSk7CisKKyAgICByZHAtPnByb2Nlc3NfY2Fs
bGJhY2tzID0gdHJ1ZTsKICAgICByYWlzZV9zb2Z0aXJxKFJDVV9TT0ZUSVJRKTsKIH0KIAotLSAK
Mi4xNi40CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
