Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA2C1642E8
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2020 12:05:12 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4N6q-0008WP-6T; Wed, 19 Feb 2020 11:01:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=bYhU=4H=linutronix.de=tglx@srs-us1.protection.inumbo.net>)
 id 1j4N6n-0008Vf-SG
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2020 11:01:37 +0000
X-Inumbo-ID: 31f49152-5307-11ea-bc8e-bc764e2007e4
Received: from Galois.linutronix.de (unknown [2a0a:51c0:0:12e:550::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 31f49152-5307-11ea-bc8e-bc764e2007e4;
 Wed, 19 Feb 2020 11:01:36 +0000 (UTC)
Received: from [5.158.153.52] (helo=nanos.tec.linutronix.de)
 by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
 (Exim 4.80) (envelope-from <tglx@linutronix.de>)
 id 1j4N6k-0002oa-27; Wed, 19 Feb 2020 12:01:34 +0100
Received: by nanos.tec.linutronix.de (Postfix, from userid 1000)
 id BB84F103A05; Wed, 19 Feb 2020 12:01:33 +0100 (CET)
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Date: Wed, 19 Feb 2020 12:01:33 +0100
Message-ID: <87tv3mq1rm.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] xen: Enable interrupts when calling
 _cond_resched()
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
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, x86@kernel.org,
 Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

eGVuX21heWJlX3ByZWVtcHRfaGNhbGwoKSBpcyBjYWxsZWQgZnJvbSB0aGUgZXhjZXB0aW9uIGVu
dHJ5IHBvaW50Cnhlbl9kb19oeXBlcnZpc29yX2NhbGxiYWNrIHdpdGggaW50ZXJydXB0cyBkaXNh
YmxlZC4KCl9jb25kX3Jlc2NoZWQoKSBldmFkZXMgdGhlIG1pZ2h0X3NsZWVwKCkgY2hlY2sgaW4g
Y29uZF9yZXNjaGVkKCkgd2hpY2gKd291bGQgaGF2ZSBjYXVnaHQgdGhhdCBhbmQgc2NoZWR1bGVf
ZGVidWcoKSB1bmZvcnR1bmF0ZWx5IGxhY2tzIGEgY2hlY2sKZm9yIGlycXNfZGlzYWJsZWQoKS4K
CkVuYWJsZSBpbnRlcnJ1cHRzIGFyb3VuZCB0aGUgY2FsbCBhbmQgdXNlIGNvbmRfcmVzY2hlZCgp
IHRvIGNhdGNoIGZ1dHVyZQppc3N1ZXMuCgpGaXhlczogZmRmZDgxMWRkZGUzICgieDg2L3hlbjog
YWxsb3cgcHJpdmNtZCBoeXBlcmNhbGxzIHRvIGJlIHByZWVtcHRlZCIpClNpZ25lZC1vZmYtYnk6
IFRob21hcyBHbGVpeG5lciA8dGdseEBsaW51dHJvbml4LmRlPgotLS0KIGRyaXZlcnMveGVuL3By
ZWVtcHQuYyB8ICAgIDQgKysrLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBk
ZWxldGlvbigtKQoKLS0tIGEvZHJpdmVycy94ZW4vcHJlZW1wdC5jCisrKyBiL2RyaXZlcnMveGVu
L3ByZWVtcHQuYwpAQCAtMzMsOCArMzMsMTAgQEAgYXNtbGlua2FnZSBfX3Zpc2libGUgdm9pZCB4
ZW5fbWF5YmVfcHJlZQogCQkgKiBjcHUuCiAJCSAqLwogCQlfX3RoaXNfY3B1X3dyaXRlKHhlbl9p
bl9wcmVlbXB0aWJsZV9oY2FsbCwgZmFsc2UpOwotCQlfY29uZF9yZXNjaGVkKCk7CisJCWxvY2Fs
X2lycV9lbmFibGUoKTsKKwkJY29uZF9yZXNjaGVkKCk7CiAJCV9fdGhpc19jcHVfd3JpdGUoeGVu
X2luX3ByZWVtcHRpYmxlX2hjYWxsLCB0cnVlKTsKKwkJbG9jYWxfaXJxX2Rpc2FibGUoKTsKIAl9
CiB9CiAjZW5kaWYgLyogQ09ORklHX1BSRUVNUFRJT04gKi8KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
