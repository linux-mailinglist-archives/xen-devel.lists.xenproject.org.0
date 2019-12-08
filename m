Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF7F61162C4
	for <lists+xen-devel@lfdr.de>; Sun,  8 Dec 2019 16:03:34 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1idy1C-0005x7-Jf; Sun, 08 Dec 2019 14:58:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zLAJ=Z6=linutronix.de=tip-bot2@srs-us1.protection.inumbo.net>)
 id 1idy1A-0005x2-V7
 for xen-devel@lists.xenproject.org; Sun, 08 Dec 2019 14:58:40 +0000
X-Inumbo-ID: 378f1968-19cb-11ea-b6f1-bc764e2007e4
Received: from Galois.linutronix.de (unknown [2a0a:51c0:0:12e:550::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 378f1968-19cb-11ea-b6f1-bc764e2007e4;
 Sun, 08 Dec 2019 14:58:39 +0000 (UTC)
Received: from [5.158.153.53] (helo=tip-bot2.lab.linutronix.de)
 by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
 (Exim 4.80) (envelope-from <tip-bot2@linutronix.de>)
 id 1idy11-0000Rw-Gb; Sun, 08 Dec 2019 15:58:31 +0100
Received: from [127.0.1.1] (localhost [IPv6:::1])
 by tip-bot2.lab.linutronix.de (Postfix) with ESMTP id 34AC71C2885;
 Sun,  8 Dec 2019 15:58:31 +0100 (CET)
Date: Sun, 08 Dec 2019 14:58:31 -0000
From: "tip-bot2 for Thomas Gleixner" <tip-bot2@linutronix.de>
To: linux-tip-commits@vger.kernel.org
In-Reply-To: <20191015191821.11479-23-bigeasy@linutronix.de>
References: <20191015191821.11479-23-bigeasy@linutronix.de>
MIME-Version: 1.0
Message-ID: <157581711109.21853.12142170301517881405.tip-bot2@tip-bot2>
X-Mailer: tip-git-log-daemon
Robot-ID: <tip-bot2.linutronix.de>
Robot-Unsubscribe: Contact <mailto:tglx@linutronix.de> to get blacklisted from
 these emails
Precedence: bulk
X-Linutronix-Spam-Score: -1.0
X-Linutronix-Spam-Level: -
X-Linutronix-Spam-Status: No , -1.0 points, 5.0 required, ALL_TRUSTED=-1,
 SHORTCIRCUIT=-0.0001
Subject: [Xen-devel] [tip: sched/urgent] sched/rt, xen: Use CONFIG_PREEMPTION
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Reply-To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, x86 <x86@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@kernel.org>,
 xen-devel@lists.xenproject.org, Thomas Gleixner <tglx@linutronix.de>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIGZvbGxvd2luZyBjb21taXQgaGFzIGJlZW4gbWVyZ2VkIGludG8gdGhlIHNjaGVkL3VyZ2Vu
dCBicmFuY2ggb2YgdGlwOgoKQ29tbWl0LUlEOiAgICAgZDRhM2RjYmM0NzI3OTY2YTY0YTY0ZDU3
ZTJiNTEwNmExMzhkNDI2ZApHaXR3ZWI6ICAgICAgICBodHRwczovL2dpdC5rZXJuZWwub3JnL3Rp
cC9kNGEzZGNiYzQ3Mjc5NjZhNjRhNjRkNTdlMmI1MTA2YTEzOGQ0MjZkCkF1dGhvcjogICAgICAg
IFRob21hcyBHbGVpeG5lciA8dGdseEBsaW51dHJvbml4LmRlPgpBdXRob3JEYXRlOiAgICBUdWUs
IDE1IE9jdCAyMDE5IDIxOjE4OjA5ICswMjowMApDb21taXR0ZXI6ICAgICBJbmdvIE1vbG5hciA8
bWluZ29Aa2VybmVsLm9yZz4KQ29tbWl0dGVyRGF0ZTogU3VuLCAwOCBEZWMgMjAxOSAxNDozNzoz
NiArMDE6MDAKCnNjaGVkL3J0LCB4ZW46IFVzZSBDT05GSUdfUFJFRU1QVElPTgoKQ09ORklHX1BS
RUVNUFRJT04gaXMgc2VsZWN0ZWQgYnkgQ09ORklHX1BSRUVNUFQgYW5kIGJ5IENPTkZJR19QUkVF
TVBUX1JULgpCb3RoIFBSRUVNUFQgYW5kIFBSRUVNUFRfUlQgcmVxdWlyZSB0aGUgc2FtZSBmdW5j
dGlvbmFsaXR5IHdoaWNoIHRvZGF5CmRlcGVuZHMgb24gQ09ORklHX1BSRUVNUFQuCgpTd2l0Y2gg
dGhlIHByZWVtcHQgYW5hbmQgeGVuLW9wcyBjb2RlIG92ZXIgdG8gdXNlIENPTkZJR19QUkVFTVBU
SU9OLgoKU2lnbmVkLW9mZi1ieTogVGhvbWFzIEdsZWl4bmVyIDx0Z2x4QGxpbnV0cm9uaXguZGU+
ClNpZ25lZC1vZmYtYnk6IFNlYmFzdGlhbiBBbmRyemVqIFNpZXdpb3IgPGJpZ2Vhc3lAbGludXRy
b25peC5kZT4KU2lnbmVkLW9mZi1ieTogVGhvbWFzIEdsZWl4bmVyIDx0Z2x4QGxpbnV0cm9uaXgu
ZGU+ClJldmlld2VkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+CkNjOiBCb3Jp
cyBPc3Ryb3Zza3kgPGJvcmlzLm9zdHJvdnNreUBvcmFjbGUuY29tPgpDYzogTGludXMgVG9ydmFs
ZHMgPHRvcnZhbGRzQGxpbnV4LWZvdW5kYXRpb24ub3JnPgpDYzogUGV0ZXIgWmlqbHN0cmEgPHBl
dGVyekBpbmZyYWRlYWQub3JnPgpDYzogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBr
ZXJuZWwub3JnPgpDYzogeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCkxpbms6IGh0dHBz
Oi8vbG9yZS5rZXJuZWwub3JnL3IvMjAxOTEwMTUxOTE4MjEuMTE0NzktMjMtYmlnZWFzeUBsaW51
dHJvbml4LmRlClNpZ25lZC1vZmYtYnk6IEluZ28gTW9sbmFyIDxtaW5nb0BrZXJuZWwub3JnPgot
LS0KIGRyaXZlcnMveGVuL3ByZWVtcHQuYyB8IDQgKystLQogaW5jbHVkZS94ZW4veGVuLW9wcy5o
IHwgNCArKy0tCiAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3hlbi9wcmVlbXB0LmMgYi9kcml2ZXJzL3hlbi9wcmVl
bXB0LmMKaW5kZXggOGI5OTE5Yy4uNzA2NTBiMiAxMDA2NDQKLS0tIGEvZHJpdmVycy94ZW4vcHJl
ZW1wdC5jCisrKyBiL2RyaXZlcnMveGVuL3ByZWVtcHQuYwpAQCAtOCw3ICs4LDcgQEAKICNpbmNs
dWRlIDxsaW51eC9zY2hlZC5oPgogI2luY2x1ZGUgPHhlbi94ZW4tb3BzLmg+CiAKLSNpZm5kZWYg
Q09ORklHX1BSRUVNUFQKKyNpZm5kZWYgQ09ORklHX1BSRUVNUFRJT04KIAogLyoKICAqIFNvbWUg
aHlwZXJjYWxscyBpc3N1ZWQgYnkgdGhlIHRvb2xzdGFjayBjYW4gdGFrZSBtYW55IDEwcyBvZgpA
QCAtMzcsNCArMzcsNCBAQCBhc21saW5rYWdlIF9fdmlzaWJsZSB2b2lkIHhlbl9tYXliZV9wcmVl
bXB0X2hjYWxsKHZvaWQpCiAJCV9fdGhpc19jcHVfd3JpdGUoeGVuX2luX3ByZWVtcHRpYmxlX2hj
YWxsLCB0cnVlKTsKIAl9CiB9Ci0jZW5kaWYgLyogQ09ORklHX1BSRUVNUFQgKi8KKyNlbmRpZiAv
KiBDT05GSUdfUFJFRU1QVElPTiAqLwpkaWZmIC0tZ2l0IGEvaW5jbHVkZS94ZW4veGVuLW9wcy5o
IGIvaW5jbHVkZS94ZW4veGVuLW9wcy5oCmluZGV4IGQ4OTk2OWEuLjA5NWJlMWQgMTAwNjQ0Ci0t
LSBhL2luY2x1ZGUveGVuL3hlbi1vcHMuaAorKysgYi9pbmNsdWRlL3hlbi94ZW4tb3BzLmgKQEAg
LTIxNSw3ICsyMTUsNyBAQCBib29sIHhlbl9ydW5uaW5nX29uX3ZlcnNpb25fb3JfbGF0ZXIodW5z
aWduZWQgaW50IG1ham9yLCB1bnNpZ25lZCBpbnQgbWlub3IpOwogdm9pZCB4ZW5fZWZpX3J1bnRp
bWVfc2V0dXAodm9pZCk7CiAKIAotI2lmZGVmIENPTkZJR19QUkVFTVBUCisjaWZkZWYgQ09ORklH
X1BSRUVNUFRJT04KIAogc3RhdGljIGlubGluZSB2b2lkIHhlbl9wcmVlbXB0aWJsZV9oY2FsbF9i
ZWdpbih2b2lkKQogewpAQCAtMjM5LDYgKzIzOSw2IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCB4ZW5f
cHJlZW1wdGlibGVfaGNhbGxfZW5kKHZvaWQpCiAJX190aGlzX2NwdV93cml0ZSh4ZW5faW5fcHJl
ZW1wdGlibGVfaGNhbGwsIGZhbHNlKTsKIH0KIAotI2VuZGlmIC8qIENPTkZJR19QUkVFTVBUICov
CisjZW5kaWYgLyogQ09ORklHX1BSRUVNUFRJT04gKi8KIAogI2VuZGlmIC8qIElOQ0xVREVfWEVO
X09QU19IICovCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
