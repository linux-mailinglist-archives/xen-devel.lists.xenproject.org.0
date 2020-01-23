Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC452146423
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jan 2020 10:06:07 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iuYOn-0003qh-Fi; Thu, 23 Jan 2020 09:03:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=gKtY=3M=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iuYOl-0003qc-PD
 for xen-devel@lists.xenproject.org; Thu, 23 Jan 2020 09:03:35 +0000
X-Inumbo-ID: 36fd1af0-3dbf-11ea-8e9a-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 36fd1af0-3dbf-11ea-8e9a-bc764e2007e4;
 Thu, 23 Jan 2020 09:03:26 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 80EB6ADEB;
 Thu, 23 Jan 2020 09:03:25 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Thu, 23 Jan 2020 10:03:23 +0100
Message-Id: <20200123090323.16272-1-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
Subject: [Xen-devel] [PATCH] xen/sched: avoid cpumasks on stack in
 sched/core.c
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

VGhlcmUgYXJlIHN0aWxsIHNldmVyYWwgaW5zdGFuY2VzIG9mIGNwdW1hc2tfdCBvbiB0aGUgc3Rh
Y2sgaW4Kc2NoZWR1bGluZyBjb2RlLiBBdm9pZCB0aGVtIGFzIGZhciBhcyBwb3NzaWJsZS4KClNp
Z25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KLS0tCiB4ZW4vY29t
bW9uL3NjaGVkL2NvcmUuYyB8IDE0ICsrKysrLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNSBp
bnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vc2No
ZWQvY29yZS5jIGIveGVuL2NvbW1vbi9zY2hlZC9jb3JlLmMKaW5kZXggOTQ0MTY0ZDc4YS4uNzM3
OTljMjUwOCAxMDA2NDQKLS0tIGEveGVuL2NvbW1vbi9zY2hlZC9jb3JlLmMKKysrIGIveGVuL2Nv
bW1vbi9zY2hlZC9jb3JlLmMKQEAgLTExNzgsNyArMTE3OCw2IEBAIGludCBjcHVfZGlzYWJsZV9z
Y2hlZHVsZXIodW5zaWduZWQgaW50IGNwdSkKIHsKICAgICBzdHJ1Y3QgZG9tYWluICpkOwogICAg
IGNvbnN0IHN0cnVjdCBjcHVwb29sICpjOwotICAgIGNwdW1hc2tfdCBvbmxpbmVfYWZmaW5pdHk7
CiAgICAgaW50IHJldCA9IDA7CiAKICAgICByY3VfcmVhZF9sb2NrKCZzY2hlZF9yZXNfcmN1bG9j
ayk7CkBAIC0xMTk2LDggKzExOTUsNyBAQCBpbnQgY3B1X2Rpc2FibGVfc2NoZWR1bGVyKHVuc2ln
bmVkIGludCBjcHUpCiAgICAgICAgICAgICB1bnNpZ25lZCBsb25nIGZsYWdzOwogICAgICAgICAg
ICAgc3BpbmxvY2tfdCAqbG9jayA9IHVuaXRfc2NoZWR1bGVfbG9ja19pcnFzYXZlKHVuaXQsICZm
bGFncyk7CiAKLSAgICAgICAgICAgIGNwdW1hc2tfYW5kKCZvbmxpbmVfYWZmaW5pdHksIHVuaXQt
PmNwdV9oYXJkX2FmZmluaXR5LCBjLT5jcHVfdmFsaWQpOwotICAgICAgICAgICAgaWYgKCBjcHVt
YXNrX2VtcHR5KCZvbmxpbmVfYWZmaW5pdHkpICYmCisgICAgICAgICAgICBpZiAoICFjcHVtYXNr
X2ludGVyc2VjdHModW5pdC0+Y3B1X2hhcmRfYWZmaW5pdHksIGMtPmNwdV92YWxpZCkgJiYKICAg
ICAgICAgICAgICAgICAgY3B1bWFza190ZXN0X2NwdShjcHUsIHVuaXQtPmNwdV9oYXJkX2FmZmlu
aXR5KSApCiAgICAgICAgICAgICB7CiAgICAgICAgICAgICAgICAgaWYgKCBzY2hlZF9jaGVja19h
ZmZpbml0eV9icm9rZW4odW5pdCkgKQpAQCAtMTMzNiwxMiArMTMzNCwxMCBAQCBzdGF0aWMgaW50
IHZjcHVfc2V0X2FmZmluaXR5KAogCiBpbnQgdmNwdV9zZXRfaGFyZF9hZmZpbml0eShzdHJ1Y3Qg
dmNwdSAqdiwgY29uc3QgY3B1bWFza190ICphZmZpbml0eSkKIHsKLSAgICBjcHVtYXNrX3Qgb25s
aW5lX2FmZmluaXR5OwogICAgIGNwdW1hc2tfdCAqb25saW5lOwogCiAgICAgb25saW5lID0gVkNQ
VTJPTkxJTkUodik7Ci0gICAgY3B1bWFza19hbmQoJm9ubGluZV9hZmZpbml0eSwgYWZmaW5pdHks
IG9ubGluZSk7Ci0gICAgaWYgKCBjcHVtYXNrX2VtcHR5KCZvbmxpbmVfYWZmaW5pdHkpICkKKyAg
ICBpZiAoICFjcHVtYXNrX2ludGVyc2VjdHMob25saW5lLCBhZmZpbml0eSkgKQogICAgICAgICBy
ZXR1cm4gLUVJTlZBTDsKIAogICAgIHJldHVybiB2Y3B1X3NldF9hZmZpbml0eSh2LCBhZmZpbml0
eSwgdi0+c2NoZWRfdW5pdC0+Y3B1X2hhcmRfYWZmaW5pdHkpOwpAQCAtMjU4NiwxMSArMjU4Miwx
MSBAQCBzdGF0aWMgdm9pZCBzY2hlZHVsZSh2b2lkKQogCiAgICAgaWYgKCBncmFuID4gMSApCiAg
ICAgewotICAgICAgICBjcHVtYXNrX3QgbWFzazsKKyAgICAgICAgY3B1bWFza190ICptYXNrID0g
Y3B1bWFza19zY3JhdGNoX2NwdShjcHUpOwogCiAgICAgICAgIHByZXYtPnJlbmRlenZvdXNfaW5f
Y250ID0gZ3JhbjsKLSAgICAgICAgY3B1bWFza19hbmRub3QoJm1hc2ssIHNyLT5jcHVzLCBjcHVt
YXNrX29mKGNwdSkpOwotICAgICAgICBjcHVtYXNrX3JhaXNlX3NvZnRpcnEoJm1hc2ssIFNDSEVE
X1NMQVZFX1NPRlRJUlEpOworICAgICAgICBjcHVtYXNrX2FuZG5vdChtYXNrLCBzci0+Y3B1cywg
Y3B1bWFza19vZihjcHUpKTsKKyAgICAgICAgY3B1bWFza19yYWlzZV9zb2Z0aXJxKG1hc2ssIFND
SEVEX1NMQVZFX1NPRlRJUlEpOwogICAgICAgICBuZXh0ID0gc2NoZWRfd2FpdF9yZW5kZXp2b3Vz
X2luKHByZXYsICZsb2NrLCBjcHUsIG5vdyk7CiAgICAgICAgIGlmICggIW5leHQgKQogICAgICAg
ICAgICAgcmV0dXJuOwotLSAKMi4xNi40CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
