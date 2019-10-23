Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BB08E19C4
	for <lists+xen-devel@lfdr.de>; Wed, 23 Oct 2019 14:16:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNFUw-0001cM-0g; Wed, 23 Oct 2019 12:12:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Og4R=YQ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iNFUu-0001cH-Al
 for xen-devel@lists.xenproject.org; Wed, 23 Oct 2019 12:12:16 +0000
X-Inumbo-ID: 58b700b2-f58e-11e9-947c-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 58b700b2-f58e-11e9-947c-12813bfff9fa;
 Wed, 23 Oct 2019 12:12:13 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D70DCB33E;
 Wed, 23 Oct 2019 12:12:12 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Wed, 23 Oct 2019 14:12:09 +0200
Message-Id: <20191023121209.4814-1-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
Subject: [Xen-devel] [PATCH] xen/pvhsim: fix cpu onlining
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
Cc: Juergen Gross <jgross@suse.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

U2luY2UgY29tbWl0IDhkM2MzMjZmNjc1NmQxICgieGVuOiBsZXQgdmNwdV9jcmVhdGUoKSBzZWxl
Y3QgcHJvY2Vzc29yIikKdGhlIGluaXRpYWwgcHJvY2Vzc29yIGZvciBhbGwgcHYtc2hpbSB2Y3B1
cyB3aWxsIGJlIDAsIGFzIG5vIG90aGVyIGNwdXMKYXJlIG9ubGluZSB3aGVuIHRoZSB2Y3B1cyBh
cmUgY3JlYXRlZC4gQmVmb3JlIHRoYXQgY29tbWl0IHRoZSB2Y3B1cwp3b3VsZCBoYXZlIHByb2Nl
c3NvcnMgc2V0IG5vdCBiZWluZyBvbmxpbmUgeWV0LCB3aGljaCB3b3JrZWQganVzdCBieQpjaGFu
Y2UuCgpXaGVuIHRoZSBwdi1zaGltIHZjcHUgYmVjb21lcyBhY3RpdmUgaXQgd2lsbCBoYXZlIGEg
aGFyZCBhZmZpbml0eQpub3QgbWF0Y2hpbmcgaXRzIGluaXRpYWwgcHJvY2Vzc29yIGFzc2lnbm1l
bnQgbGVhZGluZyB0byBmYWlsaW5nCkFTU0VSVCgpcyBvciBvdGhlciBwcm9ibGVtcyBkZXBlbmRp
bmcgb24gdGhlIHNlbGVjdGVkIHNjaGVkdWxlci4KCkZpeCB0aGF0IGJ5IGRvaW5nIHRoZSBhZmZp
bml0eSBzZXR0aW5nIGFmdGVyIG9ubGluaW5nIHRoZSBjcHUgYnV0CmJlZm9yZSB0YWtpbmcgdGhl
IHZjcHUgdXAuIEZvciB2Y3B1IDAgdGhpcyBpcyBzdGlsbCBpbgpzY2hlZF9zZXR1cF9kb20wX3Zj
cHVzKCksIGZvciB0aGUgb3RoZXIgdmNwdXMgc2V0dGluZyB0aGUgYWZmaW5pdHkKdGhlcmUgY2Fu
IGJlIGRyb3BwZWQuCgpGaXhlczogOGQzYzMyNmY2NzU2ZDEgKCJ4ZW46IGxldCB2Y3B1X2NyZWF0
ZSgpIHNlbGVjdCBwcm9jZXNzb3IiKQpSZXBvcnRlZC1ieTogU2VyZ2V5IER5YXNsaSA8c2VyZ2V5
LmR5YXNsaUBjaXRyaXguY29tPgpUZXN0ZWQtYnk6IFNlcmdleSBEeWFzbGkgPHNlcmdleS5keWFz
bGlAY2l0cml4LmNvbT4KU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2Uu
Y29tPgotLS0KIHhlbi9hcmNoL3g4Ni9wdi9zaGltLmMgfCAgMiArKwogeGVuL2NvbW1vbi9zY2hl
ZHVsZS5jICB8IDExICsrKysrLS0tLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygr
KSwgNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvcHYvc2hpbS5jIGIv
eGVuL2FyY2gveDg2L3B2L3NoaW0uYwppbmRleCA1ZWRiY2Q5YWM1Li40MzI5ZWFhZWZlIDEwMDY0
NAotLS0gYS94ZW4vYXJjaC94ODYvcHYvc2hpbS5jCisrKyBiL3hlbi9hcmNoL3g4Ni9wdi9zaGlt
LmMKQEAgLTgzNyw2ICs4MzcsOCBAQCBsb25nIHB2X3NoaW1fY3B1X3VwKHZvaWQgKmRhdGEpCiAg
ICAgICAgICAgICAgICAgICAgIHYtPnZjcHVfaWQsIHJjKTsKICAgICAgICAgICAgIHJldHVybiBy
YzsKICAgICAgICAgfQorCisgICAgICAgIHZjcHVfc2V0X2hhcmRfYWZmaW5pdHkodiwgY3B1bWFz
a19vZih2LT52Y3B1X2lkKSk7CiAgICAgfQogCiAgICAgd2FrZSA9IHRlc3RfYW5kX2NsZWFyX2Jp
dChfVlBGX2Rvd24sICZ2LT5wYXVzZV9mbGFncyk7CmRpZmYgLS1naXQgYS94ZW4vY29tbW9uL3Nj
aGVkdWxlLmMgYi94ZW4vY29tbW9uL3NjaGVkdWxlLmMKaW5kZXggYzMyN2M0MGI5Mi4uMzI2ZjRk
MzYwMSAxMDA2NDQKLS0tIGEveGVuL2NvbW1vbi9zY2hlZHVsZS5jCisrKyBiL3hlbi9jb21tb24v
c2NoZWR1bGUuYwpAQCAtMzEwMiwxMyArMzEwMiwxMiBAQCB2b2lkIF9faW5pdCBzY2hlZF9zZXR1
cF9kb20wX3ZjcHVzKHN0cnVjdCBkb21haW4gKmQpCiAgICAgZm9yICggaSA9IDE7IGkgPCBkLT5t
YXhfdmNwdXM7IGkrKyApCiAgICAgICAgIHZjcHVfY3JlYXRlKGQsIGkpOwogCi0gICAgZm9yX2Vh
Y2hfc2NoZWRfdW5pdCAoIGQsIHVuaXQgKQorICAgIGlmICggcHZfc2hpbSApCisgICAgICAgIHNj
aGVkX3NldF9hZmZpbml0eShkLT52Y3B1WzBdLT5zY2hlZF91bml0LAorICAgICAgICAgICAgICAg
ICAgICAgICAgICAgY3B1bWFza19vZigwKSwgY3B1bWFza19vZigwKSk7CisgICAgZWxzZQogICAg
IHsKLSAgICAgICAgdW5zaWduZWQgaW50IGlkID0gdW5pdC0+dW5pdF9pZDsKLQotICAgICAgICBp
ZiAoIHB2X3NoaW0gKQotICAgICAgICAgICAgc2NoZWRfc2V0X2FmZmluaXR5KHVuaXQsIGNwdW1h
c2tfb2YoaWQpLCBjcHVtYXNrX29mKGlkKSk7Ci0gICAgICAgIGVsc2UKKyAgICAgICAgZm9yX2Vh
Y2hfc2NoZWRfdW5pdCAoIGQsIHVuaXQgKQogICAgICAgICB7CiAgICAgICAgICAgICBpZiAoICFv
cHRfZG9tMF92Y3B1c19waW4gJiYgIWRvbTBfYWZmaW5pdHlfcmVsYXhlZCApCiAgICAgICAgICAg
ICAgICAgc2NoZWRfc2V0X2FmZmluaXR5KHVuaXQsICZkb20wX2NwdXMsIE5VTEwpOwotLSAKMi4x
Ni40CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
