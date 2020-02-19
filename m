Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6FA8164BF7
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2020 18:33:21 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4TB8-0000hK-MF; Wed, 19 Feb 2020 17:30:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=bYhU=4H=linutronix.de=tglx@srs-us1.protection.inumbo.net>)
 id 1j4TB7-0000hE-Bv
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2020 17:30:29 +0000
X-Inumbo-ID: 853b8f10-533d-11ea-aa99-bc764e2007e4
Received: from Galois.linutronix.de (unknown [2a0a:51c0:0:12e:550::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 853b8f10-533d-11ea-aa99-bc764e2007e4;
 Wed, 19 Feb 2020 17:30:28 +0000 (UTC)
Received: from p5de0bf0b.dip0.t-ipconnect.de ([93.224.191.11]
 helo=nanos.tec.linutronix.de)
 by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
 (Exim 4.80) (envelope-from <tglx@linutronix.de>)
 id 1j4TB4-0000t5-Lz; Wed, 19 Feb 2020 18:30:26 +0100
Received: by nanos.tec.linutronix.de (Postfix, from userid 1000)
 id 28025103A01; Wed, 19 Feb 2020 18:30:26 +0100 (CET)
From: Thomas Gleixner <tglx@linutronix.de>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>, LKML
 <linux-kernel@vger.kernel.org>
In-Reply-To: <87h7zmpr1k.fsf@nanos.tec.linutronix.de>
References: <87tv3mq1rm.fsf@nanos.tec.linutronix.de>
 <8808612b-11c2-f7b8-f027-7ff92e992c50@suse.com>
 <87h7zmpr1k.fsf@nanos.tec.linutronix.de>
Date: Wed, 19 Feb 2020 18:30:26 +0100
Message-ID: <878skypjrh.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
X-Linutronix-Spam-Score: -1.0
X-Linutronix-Spam-Level: -
X-Linutronix-Spam-Status: No , -1.0 points, 5.0 required, ALL_TRUSTED=-1,
 SHORTCIRCUIT=-0.0001
Subject: [Xen-devel] [PATCH V2] xen: Enable interrupts when calling
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
Cc: xen-devel@lists.xenproject.org,
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
IFRob21hcyBHbGVpeG5lciA8dGdseEBsaW51dHJvbml4LmRlPgotLS0KVjI6IFB1dCBsb2NhbF9p
cnFfZGlzYWJsZSgpIHdoZXJlIGl0IGJlbG9uZ3MuCi0tLQogZHJpdmVycy94ZW4vcHJlZW1wdC5j
IHwgICAgNCArKystCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9u
KC0pCgotLS0gYS9kcml2ZXJzL3hlbi9wcmVlbXB0LmMKKysrIGIvZHJpdmVycy94ZW4vcHJlZW1w
dC5jCkBAIC0zMyw3ICszMyw5IEBAIGFzbWxpbmthZ2UgX192aXNpYmxlIHZvaWQgeGVuX21heWJl
X3ByZWUKIAkJICogY3B1LgogCQkgKi8KIAkJX190aGlzX2NwdV93cml0ZSh4ZW5faW5fcHJlZW1w
dGlibGVfaGNhbGwsIGZhbHNlKTsKLQkJX2NvbmRfcmVzY2hlZCgpOworCQlsb2NhbF9pcnFfZW5h
YmxlKCk7CisJCWNvbmRfcmVzY2hlZCgpOworCQlsb2NhbF9pcnFfZGlzYWJsZSgpOwogCQlfX3Ro
aXNfY3B1X3dyaXRlKHhlbl9pbl9wcmVlbXB0aWJsZV9oY2FsbCwgdHJ1ZSk7CiAJfQogfQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
