Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DB60127C4B
	for <lists+xen-devel@lfdr.de>; Fri, 20 Dec 2019 15:09:21 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iiIv9-0002cZ-Ex; Fri, 20 Dec 2019 14:06:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=fFWP=2K=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iiIv8-0002cU-24
 for xen-devel@lists.xenproject.org; Fri, 20 Dec 2019 14:06:22 +0000
X-Inumbo-ID: e631ac46-2331-11ea-9364-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e631ac46-2331-11ea-9364-12813bfff9fa;
 Fri, 20 Dec 2019 14:06:21 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 93BC0B156;
 Fri, 20 Dec 2019 14:06:20 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <47cf43bb-9643-011f-45c2-7cb63c422c3f@suse.com>
Date: Fri, 20 Dec 2019 15:06:49 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
Content-Language: en-US
Subject: [Xen-devel] [PATCH v2] x86/PV: remove unnecessary toggle_guest_pt()
 overhead
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
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2hpbGUgdGhlIG1lcmUgdXBkYXRpbmcgb2YgLT5wdl9jcjMgYW5kIC0+cm9vdF9wZ3RfY2hhbmdl
ZCBhcmVuJ3Qgb3Zlcmx5CmV4cGVuc2l2ZSAoYnV0IHN0aWxsIG5lZWRlZCBvbmx5IGZvciB0aGUg
dG9nZ2xlX2d1ZXN0X21vZGUoKSBwYXRoKSwgdGhlCmVmZmVjdCBvZiB0aGUgbGF0dGVyIG9uIHRo
ZSBleGl0LXRvLWd1ZXN0IHBhdGggaXMgbm90IGluc2lnbmlmaWNhbnQuCk1vdmUgdGhlIGxvZ2lj
IGludG8gdG9nZ2xlX2d1ZXN0X21vZGUoKSwgb24gdGhlIGJhc2lzIHRoYXQKdG9nZ2xlX2d1ZXN0
X3B0KCkgd2lsbCBhbHdheXMgYmUgaW52b2tlZCBpbiBwYWlycywgeWV0IHdlIGNhbid0IHNhZmVs
eQp1bmRvIHRoZSBzZXR0aW5nIG9mIHJvb3RfcGd0X2NoYW5nZWQgZHVyaW5nIHRoZSBzZWNvbmQg
b2YgdGhlc2UKaW52b2NhdGlvbnMuCgpTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+Ci0tLQp2MjogRXh0ZW5kIGRlc2NyaXB0aW9uLgoKLS0tIGEveGVuL2FyY2gv
eDg2L3B2L2RvbWFpbi5jCisrKyBiL3hlbi9hcmNoL3g4Ni9wdi9kb21haW4uYwpAQCAtMzY1LDE4
ICszNjUsMTAgQEAgYm9vbCBfX2luaXQgeHB0aV9wY2lkX2VuYWJsZWQodm9pZCkKIAogc3RhdGlj
IHZvaWQgX3RvZ2dsZV9ndWVzdF9wdChzdHJ1Y3QgdmNwdSAqdikKIHsKLSAgICBjb25zdCBzdHJ1
Y3QgZG9tYWluICpkID0gdi0+ZG9tYWluOwotICAgIHN0cnVjdCBjcHVfaW5mbyAqY3B1X2luZm8g
PSBnZXRfY3B1X2luZm8oKTsKICAgICB1bnNpZ25lZCBsb25nIGNyMzsKIAogICAgIHYtPmFyY2gu
ZmxhZ3MgXj0gVEZfa2VybmVsX21vZGU7CiAgICAgdXBkYXRlX2NyMyh2KTsKLSAgICBpZiAoIGQt
PmFyY2gucHYueHB0aSApCi0gICAgewotICAgICAgICBjcHVfaW5mby0+cm9vdF9wZ3RfY2hhbmdl
ZCA9IHRydWU7Ci0gICAgICAgIGNwdV9pbmZvLT5wdl9jcjMgPSBfX3BhKHRoaXNfY3B1KHJvb3Rf
cGd0KSkgfAotICAgICAgICAgICAgICAgICAgICAgICAgICAgKGQtPmFyY2gucHYucGNpZCA/IGdl
dF9wY2lkX2JpdHModiwgdHJ1ZSkgOiAwKTsKLSAgICB9CiAKICAgICAvKgogICAgICAqIERvbid0
IGZsdXNoIHVzZXIgZ2xvYmFsIG1hcHBpbmdzIGZyb20gdGhlIFRMQi4gRG9uJ3QgdGljayBUTEIg
Y2xvY2suCkBAIC0zODQsMTUgKzM3NiwxMSBAQCBzdGF0aWMgdm9pZCBfdG9nZ2xlX2d1ZXN0X3B0
KHN0cnVjdCB2Y3B1CiAgICAgICogSW4gc2hhZG93IG1vZGUsIHRob3VnaCwgdXBkYXRlX2NyMygp
IG1heSBuZWVkIHRvIGJlIGFjY29tcGFuaWVkIGJ5IGEKICAgICAgKiBUTEIgZmx1c2ggKGZvciBq
dXN0IHRoZSBpbmNvbWluZyBQQ0lEKSwgYXMgdGhlIHRvcCBsZXZlbCBwYWdlIHRhYmxlIG1heQog
ICAgICAqIGhhdmUgY2hhbmdlZCBiZWhpbmQgb3VyIGJhY2tzLiBUbyBiZSBvbiB0aGUgc2FmZSBz
aWRlLCBzdXBwcmVzcyB0aGUKLSAgICAgKiBuby1mbHVzaCB1bmNvbmRpdGlvbmFsbHkgaW4gdGhp
cyBjYXNlLiBUaGUgWFBUSSBDUjMgd3JpdGUsIGlmIGVuYWJsZWQsCi0gICAgICogd2lsbCB0aGVu
IG5lZWQgdG8gYmUgYSBmbHVzaGluZyBvbmUgdG9vLgorICAgICAqIG5vLWZsdXNoIHVuY29uZGl0
aW9uYWxseSBpbiB0aGlzIGNhc2UuCiAgICAgICovCiAgICAgY3IzID0gdi0+YXJjaC5jcjM7Ci0g
ICAgaWYgKCBzaGFkb3dfbW9kZV9lbmFibGVkKGQpICkKLSAgICB7CisgICAgaWYgKCBzaGFkb3df
bW9kZV9lbmFibGVkKHYtPmRvbWFpbikgKQogICAgICAgICBjcjMgJj0gflg4Nl9DUjNfTk9GTFVT
SDsKLSAgICAgICAgY3B1X2luZm8tPnB2X2NyMyAmPSB+WDg2X0NSM19OT0ZMVVNIOwotICAgIH0K
ICAgICB3cml0ZV9jcjMoY3IzKTsKIAogICAgIGlmICggISh2LT5hcmNoLmZsYWdzICYgVEZfa2Vy
bmVsX21vZGUpICkKQEAgLTQwOCw2ICszOTYsOCBAQCBzdGF0aWMgdm9pZCBfdG9nZ2xlX2d1ZXN0
X3B0KHN0cnVjdCB2Y3B1CiAKIHZvaWQgdG9nZ2xlX2d1ZXN0X21vZGUoc3RydWN0IHZjcHUgKnYp
CiB7CisgICAgY29uc3Qgc3RydWN0IGRvbWFpbiAqZCA9IHYtPmRvbWFpbjsKKwogICAgIEFTU0VS
VCghaXNfcHZfMzJiaXRfdmNwdSh2KSk7CiAKICAgICAvKiAlZnMvJWdzIGJhc2VzIGNhbiBvbmx5
IGJlIHN0YWxlIGlmIFdSe0ZTLEdTfUJBU0UgYXJlIHVzYWJsZS4gKi8KQEAgLTQyMSw2ICs0MTEs
MjEgQEAgdm9pZCB0b2dnbGVfZ3Vlc3RfbW9kZShzdHJ1Y3QgdmNwdSAqdikKICAgICBhc20gdm9s
YXRpbGUgKCAic3dhcGdzIiApOwogCiAgICAgX3RvZ2dsZV9ndWVzdF9wdCh2KTsKKworICAgIGlm
ICggZC0+YXJjaC5wdi54cHRpICkKKyAgICB7CisgICAgICAgIHN0cnVjdCBjcHVfaW5mbyAqY3B1
X2luZm8gPSBnZXRfY3B1X2luZm8oKTsKKworICAgICAgICBjcHVfaW5mby0+cm9vdF9wZ3RfY2hh
bmdlZCA9IHRydWU7CisgICAgICAgIGNwdV9pbmZvLT5wdl9jcjMgPSBfX3BhKHRoaXNfY3B1KHJv
b3RfcGd0KSkgfAorICAgICAgICAgICAgICAgICAgICAgICAgICAgKGQtPmFyY2gucHYucGNpZCA/
IGdldF9wY2lkX2JpdHModiwgdHJ1ZSkgOiAwKTsKKyAgICAgICAgLyoKKyAgICAgICAgICogQXMg
aW4gX3RvZ2dsZV9ndWVzdF9wdCgpIHRoZSBYUFRJIENSMyB3cml0ZSBuZWVkcyB0byBiZSBhIFRM
Qi0KKyAgICAgICAgICogZmx1c2hpbmcgb25lIHRvbyBmb3Igc2hhZG93IG1vZGUgZ3Vlc3RzLgor
ICAgICAgICAgKi8KKyAgICAgICAgaWYgKCBzaGFkb3dfbW9kZV9lbmFibGVkKGQpICkKKyAgICAg
ICAgICAgIGNwdV9pbmZvLT5wdl9jcjMgJj0gflg4Nl9DUjNfTk9GTFVTSDsKKyAgICB9CiB9CiAK
IHZvaWQgdG9nZ2xlX2d1ZXN0X3B0KHN0cnVjdCB2Y3B1ICp2KQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
