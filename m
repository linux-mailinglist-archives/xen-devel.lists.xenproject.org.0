Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D0CE9256C
	for <lists+xen-devel@lfdr.de>; Mon, 19 Aug 2019 15:46:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hzhvR-0003AA-QT; Mon, 19 Aug 2019 13:42:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ecZk=WP=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hzhvP-00039u-V4
 for xen-devel@lists.xenproject.org; Mon, 19 Aug 2019 13:42:19 +0000
X-Inumbo-ID: 29858da2-c287-11e9-8bec-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 29858da2-c287-11e9-8bec-12813bfff9fa;
 Mon, 19 Aug 2019 13:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1566222139;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yfWRkhDyGXfdkAnMnsIJwCE9Pk3nvcWfx+V+LFcI9+s=;
 b=S+RYKqAgfdGhjcjBQlHZpKtSxdNwYpONFD8MZmQea2NUYKn62g4MON1r
 Z+9NTVL9BIlDc1LMPRZEXzRhAFmDtu9BsAgesmlFlXK554HONd/r0asDR
 HWgjvnu56jDsW4Jq3rOxaol/WWpFJMkDEgeSSWGgx6TRdapViLhfU8+Bf w=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: FfhpFYRtLMePUtP0TscbUxuHsNavc6neOCFjIAbuMlYc6ZQ+3suue0fWy2hYoMZg6F0LTdOthU
 2AfVZMoAtAIqJ0oj+GobgdPhAYMFjuDufe+mq2MOMhcHse+IOpXmYxGLv26EBbr12dNfmpO2Jf
 obVkrboYFU34z+bIe90lTPbXMaSbpS0XaxXHBJepzZAm0k22Ra+5XeijXrqrklrpn21/om9D7f
 obZEQiBLbDEi4CBBAxLjeh3P9kOoXqS+PI1vDSWv7A1Vj6oa/Z2BBnMiJt8xUQa+mLeGS0FeOg
 kXY=
X-SBRS: 2.7
X-MesageID: 4422947
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,405,1559534400"; 
   d="scan'208";a="4422947"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Mon, 19 Aug 2019 14:42:12 +0100
Message-ID: <20190819134213.1628-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190819134213.1628-1-andrew.cooper3@citrix.com>
References: <20190819134213.1628-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] x86/boot: Reposition trampoline data
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Li4uIHRvIHNlcGFyYXRlIGNvZGUgZnJvbSBkYXRhLiAgSW4gcGFydGljdWxhciwgdHJhbXBvbGlu
ZV9yZWFsbW9kZV9lbnRyeSdzCndyaXRlIHRvIHRyYW1wb2xpbmVfY3B1X3N0YXJ0ZWQgY2xvYmJl
cnMgdGhlIEktY2FjaGUgbGluZSBjb250YWluaW5nCnRyYW1wb2xpbmVfcHJvdG1vZGVfZW50cnks
IHdoaWNoIHdvbid0IGJlIGdyZWF0IGZvciBBUCBzdGFydHVwLgoKUmVmb3JtYXQgdGhlIGNvbW1l
bnRzIGZvciB0cmFtcG9saW5lX2dkdCB0byByZWR1Y2UgdGhlaXIgdm9sdW1lLgoKTm8gZnVuY3Rp
b25hbCBjaGFuZ2UuCgpTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVy
M0BjaXRyaXguY29tPgotLS0KQ0M6IEphbiBCZXVsaWNoIDxKQmV1bGljaEBzdXNlLmNvbT4KQ0M6
IFdlaSBMaXUgPHdsQHhlbi5vcmc+CkNDOiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0
cml4LmNvbT4KLS0tCiB4ZW4vYXJjaC94ODYvYm9vdC90cmFtcG9saW5lLlMgfCA2NyArKysrKysr
KysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAyOCBp
bnNlcnRpb25zKCspLCAzOSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYv
Ym9vdC90cmFtcG9saW5lLlMgYi94ZW4vYXJjaC94ODYvYm9vdC90cmFtcG9saW5lLlMKaW5kZXgg
MTc2MWZjMTIxMy4uMWIxMWI0NzU3YSAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L2Jvb3QvdHJh
bXBvbGluZS5TCisrKyBiL3hlbi9hcmNoL3g4Ni9ib290L3RyYW1wb2xpbmUuUwpAQCAtNTksNDUg
KzU5LDYgQEAgR0xPQkFMKHRyYW1wb2xpbmVfcmVhbG1vZGVfZW50cnkpCiAgICAgICAgIGxtc3cg
ICAgJWF4ICAgICAgICAgICAgICAgICAgICAgICAjIENSMC5QRSA9IDEgKGVudGVyIHByb3RlY3Rl
ZCBtb2RlKQogICAgICAgICBsam1wbCAgICRCT09UX0NTMzIsJGJvb3RzeW1fcmVsKHRyYW1wb2xp
bmVfcHJvdG1vZGVfZW50cnksNikKIAotdHJhbXBvbGluZV9nZHQ6Ci0gICAgICAgIC8qIDB4MDAw
MDogdW51c2VkICovCi0gICAgICAgIC5xdWFkICAgMHgwMDAwMDAwMDAwMDAwMDAwCi0gICAgICAg
IC8qIDB4MDAwODogcmluZyAwIGNvZGUsIDMyLWJpdCBtb2RlICovCi0gICAgICAgIC5xdWFkICAg
MHgwMGNmOWIwMDAwMDBmZmZmCi0gICAgICAgIC8qIDB4MDAxMDogcmluZyAwIGNvZGUsIDY0LWJp
dCBtb2RlICovCi0gICAgICAgIC5xdWFkICAgMHgwMGFmOWIwMDAwMDBmZmZmCi0gICAgICAgIC8q
IDB4MDAxODogcmluZyAwIGRhdGEgKi8KLSAgICAgICAgLnF1YWQgICAweDAwY2Y5MzAwMDAwMGZm
ZmYKLSAgICAgICAgLyogMHgwMDIwOiByZWFsLW1vZGUgY29kZSBAIEJPT1RfVFJBTVBPTElORSAq
LwotICAgICAgICAubG9uZyAgIDB4MDAwMGZmZmYKLSAgICAgICAgLmxvbmcgICAweDAwMDA5YjAw
Ci0gICAgICAgIC8qIDB4MDAyODogcmVhbC1tb2RlIGRhdGEgQCBCT09UX1RSQU1QT0xJTkUgKi8K
LSAgICAgICAgLmxvbmcgICAweDAwMDBmZmZmCi0gICAgICAgIC5sb25nICAgMHgwMDAwOTMwMAot
ICAgICAgICAvKgotICAgICAgICAgKiAweDAwMzA6IHJpbmcgMCBYZW4gZGF0YSwgMTYgTWlCIHNp
emUsIGJhc2UKLSAgICAgICAgICogYWRkcmVzcyBpcyBjb21wdXRlZCBhdCBydW50aW1lLgotICAg
ICAgICAgKi8KLSAgICAgICAgLnF1YWQgICAweDAwYzA5MzAwMDAwMDBmZmYKLS5MdHJhbW9wbGlu
ZV9nZHRfZW5kOgotCi0gICAgICAgIC5wdXNoc2VjdGlvbiAudHJhbXBvbGluZV9yZWwsICJhIgot
ICAgICAgICAubG9uZyAgIHRyYW1wb2xpbmVfZ2R0ICsgQk9PVF9QU0VVRE9STV9DUyArIDIgLSAu
Ci0gICAgICAgIC5sb25nICAgdHJhbXBvbGluZV9nZHQgKyBCT09UX1BTRVVET1JNX0RTICsgMiAt
IC4KLSAgICAgICAgLnBvcHNlY3Rpb24KLQotR0xPQkFMKHRyYW1wb2xpbmVfbWlzY19lbmFibGVf
b2ZmKQotICAgICAgICAucXVhZCAgIDAKLQotR0xPQkFMKGNwdWlkX2V4dF9mZWF0dXJlcykKLSAg
ICAgICAgLmxvbmcgICAwCi0KLUdMT0JBTCh0cmFtcG9saW5lX3hlbl9waHlzX3N0YXJ0KQotICAg
ICAgICAubG9uZyAgIDAKLQotR0xPQkFMKHRyYW1wb2xpbmVfY3B1X3N0YXJ0ZWQpCi0gICAgICAg
IC5ieXRlICAgMAotCiAgICAgICAgIC5jb2RlMzIKIHRyYW1wb2xpbmVfcHJvdG1vZGVfZW50cnk6
CiAgICAgICAgIC8qIFNldCB1cCBhIGZldyBkZXNjcmlwdG9yczogb24gZW50cnkgb25seSBDUyBp
cyBndWFyYW50ZWVkIGdvb2QuICovCkBAIC0xODYsNiArMTQ3LDM0IEBAIGlkdF80ODogLndvcmQg
ICAwLCAwLCAwICMgYmFzZSA9IGxpbWl0ID0gMAogZ2R0XzQ4OiAud29yZCAgIC5MdHJhbW9wbGlu
ZV9nZHRfZW5kIC0gdHJhbXBvbGluZV9nZHQgLSAxCiAgICAgICAgIC5sb25nICAgYm9vdHN5bV9y
ZWwodHJhbXBvbGluZV9nZHQsNCkKIAordHJhbXBvbGluZV9nZHQ6CisgICAgICAgIC5xdWFkICAg
MHgwMDAwMDAwMDAwMDAwMDAwIC8qIDB4MDAwMDogdW51c2VkICovCisgICAgICAgIC5xdWFkICAg
MHgwMGNmOWIwMDAwMDBmZmZmIC8qIDB4MDAwODogcmluZyAwIGNvZGUsIDMyLWJpdCBtb2RlICov
CisgICAgICAgIC5xdWFkICAgMHgwMGFmOWIwMDAwMDBmZmZmIC8qIDB4MDAxMDogcmluZyAwIGNv
ZGUsIDY0LWJpdCBtb2RlICovCisgICAgICAgIC5xdWFkICAgMHgwMGNmOTMwMDAwMDBmZmZmIC8q
IDB4MDAxODogcmluZyAwIGRhdGEgKi8KKyAgICAgICAgLnF1YWQgICAweDAwMDA5YjAwMDAwMGZm
ZmYgLyogMHgwMDIwOiByZWFsLW1vZGUgY29kZSBAIEJPT1RfVFJBTVBPTElORSAqLworICAgICAg
ICAucXVhZCAgIDB4MDAwMDkzMDAwMDAwZmZmZiAvKiAweDAwMjg6IHJlYWwtbW9kZSBkYXRhIEAg
Qk9PVF9UUkFNUE9MSU5FICovCisgICAgICAgIC5xdWFkICAgMHgwMGMwOTMwMDAwMDAwZmZmIC8q
IDB4MDAzMDogcmluZyAwIFhlbiBkYXRhLCAxNk0gQCBYRU4gKi8KKy5MdHJhbW9wbGluZV9nZHRf
ZW5kOgorCisgICAgICAgIC8qIFJlbG9jYXRpb25zIGZvciB0cmFtcG9saW5lIFJlYWwgTW9kZSBz
ZWdtZW50cy4gKi8KKyAgICAgICAgLnB1c2hzZWN0aW9uIC50cmFtcG9saW5lX3JlbCwgImEiCisg
ICAgICAgIC5sb25nICAgdHJhbXBvbGluZV9nZHQgKyBCT09UX1BTRVVET1JNX0NTICsgMiAtIC4K
KyAgICAgICAgLmxvbmcgICB0cmFtcG9saW5lX2dkdCArIEJPT1RfUFNFVURPUk1fRFMgKyAyIC0g
LgorICAgICAgICAucG9wc2VjdGlvbgorCitHTE9CQUwodHJhbXBvbGluZV9taXNjX2VuYWJsZV9v
ZmYpCisgICAgICAgIC5xdWFkICAgMAorCitHTE9CQUwoY3B1aWRfZXh0X2ZlYXR1cmVzKQorICAg
ICAgICAubG9uZyAgIDAKKworR0xPQkFMKHRyYW1wb2xpbmVfeGVuX3BoeXNfc3RhcnQpCisgICAg
ICAgIC5sb25nICAgMAorCitHTE9CQUwodHJhbXBvbGluZV9jcHVfc3RhcnRlZCkKKyAgICAgICAg
LmJ5dGUgICAwCisKIC8qIFRoZSBmaXJzdCBwYWdlIG9mIHRyYW1wb2xpbmUgaXMgcGVybWFuZW50
LCB0aGUgcmVzdCBib290LXRpbWUgb25seS4gKi8KIC8qIFJldXNlIHRoZSBib290IHRyYW1wb2xp
bmUgb24gdGhlIDFzdCB0cmFtcG9saW5lIHBhZ2UgYXMgc3RhY2sgZm9yIHdha2V1cC4gKi8KICAg
ICAgICAgLmVxdSAgICB3YWtldXBfc3RhY2ssIHRyYW1wb2xpbmVfc3RhcnQgKyBQQUdFX1NJWkUK
LS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
