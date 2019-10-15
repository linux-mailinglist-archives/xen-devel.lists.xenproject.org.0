Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BD05D8018
	for <lists+xen-devel@lfdr.de>; Tue, 15 Oct 2019 21:23:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iKSLP-0003rr-Mi; Tue, 15 Oct 2019 19:18:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tf5r=YI=linutronix.de=bigeasy@srs-us1.protection.inumbo.net>)
 id 1iKSLO-0003rm-EG
 for xen-devel@lists.xenproject.org; Tue, 15 Oct 2019 19:18:54 +0000
X-Inumbo-ID: 9fb8f51a-ef80-11e9-beca-bc764e2007e4
Received: from Galois.linutronix.de (unknown [2a0a:51c0:0:12e:550::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9fb8f51a-ef80-11e9-beca-bc764e2007e4;
 Tue, 15 Oct 2019 19:18:53 +0000 (UTC)
Received: from localhost ([127.0.0.1] helo=localhost.localdomain)
 by Galois.linutronix.de with esmtp (Exim 4.80)
 (envelope-from <bigeasy@linutronix.de>)
 id 1iKSLA-00067i-FD; Tue, 15 Oct 2019 21:18:40 +0200
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: linux-kernel@vger.kernel.org
Date: Tue, 15 Oct 2019 21:18:09 +0200
Message-Id: <20191015191821.11479-23-bigeasy@linutronix.de>
In-Reply-To: <20191015191821.11479-1-bigeasy@linutronix.de>
References: <20191015191821.11479-1-bigeasy@linutronix.de>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 22/34] xen: Use CONFIG_PREEMPTION
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
 Stefano Stabellini <sstabellini@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 xen-devel@lists.xenproject.org, tglx@linutronix.de,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogVGhvbWFzIEdsZWl4bmVyIDx0Z2x4QGxpbnV0cm9uaXguZGU+CgpDT05GSUdfUFJFRU1Q
VElPTiBpcyBzZWxlY3RlZCBieSBDT05GSUdfUFJFRU1QVCBhbmQgYnkgQ09ORklHX1BSRUVNUFRf
UlQuCkJvdGggUFJFRU1QVCBhbmQgUFJFRU1QVF9SVCByZXF1aXJlIHRoZSBzYW1lIGZ1bmN0aW9u
YWxpdHkgd2hpY2ggdG9kYXkKZGVwZW5kcyBvbiBDT05GSUdfUFJFRU1QVC4KClN3aXRjaCB0aGUg
cHJlZW1wdCBhbmFuZCB4ZW4tb3BzIGNvZGUgb3ZlciB0byB1c2UgQ09ORklHX1BSRUVNUFRJT04u
CgpDYzogQm9yaXMgT3N0cm92c2t5IDxib3Jpcy5vc3Ryb3Zza3lAb3JhY2xlLmNvbT4KQ2M6IEp1
ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KQ2M6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0
YWJlbGxpbmlAa2VybmVsLm9yZz4KQ2M6IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpT
aWduZWQtb2ZmLWJ5OiBUaG9tYXMgR2xlaXhuZXIgPHRnbHhAbGludXRyb25peC5kZT4KU2lnbmVk
LW9mZi1ieTogU2ViYXN0aWFuIEFuZHJ6ZWogU2lld2lvciA8YmlnZWFzeUBsaW51dHJvbml4LmRl
PgotLS0KIGRyaXZlcnMveGVuL3ByZWVtcHQuYyB8IDQgKystLQogaW5jbHVkZS94ZW4veGVuLW9w
cy5oIHwgNCArKy0tCiAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3hlbi9wcmVlbXB0LmMgYi9kcml2ZXJzL3hlbi9w
cmVlbXB0LmMKaW5kZXggOGI5OTE5YzI2MDk1ZC4uNzA2NTBiMjQ4ZGU1ZCAxMDA2NDQKLS0tIGEv
ZHJpdmVycy94ZW4vcHJlZW1wdC5jCisrKyBiL2RyaXZlcnMveGVuL3ByZWVtcHQuYwpAQCAtOCw3
ICs4LDcgQEAKICNpbmNsdWRlIDxsaW51eC9zY2hlZC5oPgogI2luY2x1ZGUgPHhlbi94ZW4tb3Bz
Lmg+CiAKLSNpZm5kZWYgQ09ORklHX1BSRUVNUFQKKyNpZm5kZWYgQ09ORklHX1BSRUVNUFRJT04K
IAogLyoKICAqIFNvbWUgaHlwZXJjYWxscyBpc3N1ZWQgYnkgdGhlIHRvb2xzdGFjayBjYW4gdGFr
ZSBtYW55IDEwcyBvZgpAQCAtMzcsNCArMzcsNCBAQCBhc21saW5rYWdlIF9fdmlzaWJsZSB2b2lk
IHhlbl9tYXliZV9wcmVlbXB0X2hjYWxsKHZvaWQpCiAJCV9fdGhpc19jcHVfd3JpdGUoeGVuX2lu
X3ByZWVtcHRpYmxlX2hjYWxsLCB0cnVlKTsKIAl9CiB9Ci0jZW5kaWYgLyogQ09ORklHX1BSRUVN
UFQgKi8KKyNlbmRpZiAvKiBDT05GSUdfUFJFRU1QVElPTiAqLwpkaWZmIC0tZ2l0IGEvaW5jbHVk
ZS94ZW4veGVuLW9wcy5oIGIvaW5jbHVkZS94ZW4veGVuLW9wcy5oCmluZGV4IGQ4OTk2OWFhOTk0
MmMuLjA5NWJlMWQ2NmYzMWMgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUveGVuL3hlbi1vcHMuaAorKysg
Yi9pbmNsdWRlL3hlbi94ZW4tb3BzLmgKQEAgLTIxNSw3ICsyMTUsNyBAQCBib29sIHhlbl9ydW5u
aW5nX29uX3ZlcnNpb25fb3JfbGF0ZXIodW5zaWduZWQgaW50IG1ham9yLCB1bnNpZ25lZCBpbnQg
bWlub3IpOwogdm9pZCB4ZW5fZWZpX3J1bnRpbWVfc2V0dXAodm9pZCk7CiAKIAotI2lmZGVmIENP
TkZJR19QUkVFTVBUCisjaWZkZWYgQ09ORklHX1BSRUVNUFRJT04KIAogc3RhdGljIGlubGluZSB2
b2lkIHhlbl9wcmVlbXB0aWJsZV9oY2FsbF9iZWdpbih2b2lkKQogewpAQCAtMjM5LDYgKzIzOSw2
IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCB4ZW5fcHJlZW1wdGlibGVfaGNhbGxfZW5kKHZvaWQpCiAJ
X190aGlzX2NwdV93cml0ZSh4ZW5faW5fcHJlZW1wdGlibGVfaGNhbGwsIGZhbHNlKTsKIH0KIAot
I2VuZGlmIC8qIENPTkZJR19QUkVFTVBUICovCisjZW5kaWYgLyogQ09ORklHX1BSRUVNUFRJT04g
Ki8KIAogI2VuZGlmIC8qIElOQ0xVREVfWEVOX09QU19IICovCi0tIAoyLjIzLjAKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
