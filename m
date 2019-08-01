Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AB797D91C
	for <lists+xen-devel@lfdr.de>; Thu,  1 Aug 2019 12:16:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ht85c-00014N-TG; Thu, 01 Aug 2019 10:13:40 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=6jP+=V5=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1ht85b-00013s-D6
 for xen-devel@lists.xenproject.org; Thu, 01 Aug 2019 10:13:39 +0000
X-Inumbo-ID: 06ac6d27-b445-11e9-8980-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 06ac6d27-b445-11e9-8980-bc764e045a96;
 Thu, 01 Aug 2019 10:13:37 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 9185AB602;
 Thu,  1 Aug 2019 10:13:36 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Thu,  1 Aug 2019 12:13:30 +0200
Message-Id: <20190801101333.9821-2-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20190801101333.9821-1-jgross@suse.com>
References: <20190801101333.9821-1-jgross@suse.com>
Subject: [Xen-devel] [PATCH v2 1/4] xen: use common output function in
 debugtrace
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
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VG9kYXkgZHVtcGluZyB0aGUgZGVidWd0cmFjZSBidWZmZXJzIGlzIGRvbmUgdmlhIHNlcmNvbl9w
dXRzKCksIHdoaWxlCmRpcmVjdCBwcmludGluZyBvZiB0cmFjZSBlbnRyaWVzIChhZnRlciB0b2dn
bGluZyBvdXRwdXQgdG8gdGhlIGNvbnNvbGUpCmlzIHVzaW5nIHNlcmlhbF9wdXRzKCkuCgpVc2Ug
c2VyY29uX3B1dHMoKSBpbiBib3RoIGNhc2VzLCBhcyB0aGUgZGlmZmVyZW5jZSBiZXR3ZWVuIGJv
dGggaXMgbm90CnJlYWxseSBtYWtpbmcgc2Vuc2UuCgpJbiBvcmRlciB0byBwcmVwYXJlIG1vdmlu
ZyBkZWJ1Z3RyYWNlIGZ1bmN0aW9uYWxpdHkgdG8gYW4gb3duIHNvdXJjZQpmaWxlIHJlbmFtZSBz
ZXJjb25fcHV0cygpIHRvIGNvbnNvbGVfc2VyaWFsX3B1dHMoKSBhbmQgbWFrZSBpdCBnbG9iYWxs
eQp2aXNpYmxlLgoKU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29t
PgotLS0KIHhlbi9kcml2ZXJzL2NoYXIvY29uc29sZS5jIHwgMTYgKysrKysrKystLS0tLS0tLQog
eGVuL2luY2x1ZGUveGVuL2NvbnNvbGUuaCAgfCAgMyArKysKIDIgZmlsZXMgY2hhbmdlZCwgMTEg
aW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vZHJpdmVycy9j
aGFyL2NvbnNvbGUuYyBiL3hlbi9kcml2ZXJzL2NoYXIvY29uc29sZS5jCmluZGV4IGQ3MjhlNzM3
ZDEuLjQ5ZmJiZWQyMWEgMTAwNjQ0Ci0tLSBhL3hlbi9kcml2ZXJzL2NoYXIvY29uc29sZS5jCisr
KyBiL3hlbi9kcml2ZXJzL2NoYXIvY29uc29sZS5jCkBAIC0zNDYsNyArMzQ2LDcgQEAgdm9pZCBj
b25zb2xlX2dpdmViYWNrKGludCBpZCkKICAgICAgICAgc2VyaWFsX3N0ZWFsX2ZuID0gTlVMTDsK
IH0KIAotc3RhdGljIHZvaWQgc2VyY29uX3B1dHMoY29uc3QgY2hhciAqcykKK3ZvaWQgY29uc29s
ZV9zZXJpYWxfcHV0cyhjb25zdCBjaGFyICpzKQogewogICAgIGlmICggc2VyaWFsX3N0ZWFsX2Zu
ICE9IE5VTEwgKQogICAgICAgICAoKnNlcmlhbF9zdGVhbF9mbikocyk7CkBAIC0zODksNyArMzg5
LDcgQEAgc3RhdGljIHZvaWQgZHVtcF9jb25zb2xlX3Jpbmdfa2V5KHVuc2lnbmVkIGNoYXIga2V5
KQogICAgIH0KICAgICBidWZbc29mYXJdID0gJ1wwJzsKIAotICAgIHNlcmNvbl9wdXRzKGJ1Zik7
CisgICAgY29uc29sZV9zZXJpYWxfcHV0cyhidWYpOwogICAgIHZpZGVvX3B1dHMoYnVmKTsKIAog
ICAgIGZyZWVfeGVuaGVhcF9wYWdlcyhidWYsIG9yZGVyKTsKQEAgLTU0OCw3ICs1NDgsNyBAQCBz
dGF0aWMgbG9uZyBndWVzdF9jb25zb2xlX3dyaXRlKFhFTl9HVUVTVF9IQU5ETEVfUEFSQU0oY2hh
cikgYnVmZmVyLCBpbnQgY291bnQpCiAgICAgICAgICAgICAvKiBVc2UgZGlyZWN0IGNvbnNvbGUg
b3V0cHV0IGFzIGl0IGNvdWxkIGJlIGludGVyYWN0aXZlICovCiAgICAgICAgICAgICBzcGluX2xv
Y2tfaXJxKCZjb25zb2xlX2xvY2spOwogCi0gICAgICAgICAgICBzZXJjb25fcHV0cyhrYnVmKTsK
KyAgICAgICAgICAgIGNvbnNvbGVfc2VyaWFsX3B1dHMoa2J1Zik7CiAgICAgICAgICAgICB2aWRl
b19wdXRzKGtidWYpOwogCiAjaWZkZWYgQ09ORklHX1g4NgpAQCAtNjY5LDcgKzY2OSw3IEBAIHN0
YXRpYyB2b2lkIF9fcHV0c3RyKGNvbnN0IGNoYXIgKnN0cikKIHsKICAgICBBU1NFUlQoc3Bpbl9p
c19sb2NrZWQoJmNvbnNvbGVfbG9jaykpOwogCi0gICAgc2VyY29uX3B1dHMoc3RyKTsKKyAgICBj
b25zb2xlX3NlcmlhbF9wdXRzKHN0cik7CiAgICAgdmlkZW9fcHV0cyhzdHIpOwogCiAjaWZkZWYg
Q09ORklHX1g4NgpAQCAtMTE4MiwxMSArMTE4MiwxMSBAQCBzdGF0aWMgdm9pZCBkZWJ1Z3RyYWNl
X2R1bXBfd29ya2VyKHZvaWQpCiAKICAgICAvKiBQcmludCBvbGRlc3QgcG9ydGlvbiBvZiB0aGUg
cmluZy4gKi8KICAgICBBU1NFUlQoZGVidWd0cmFjZV9idWZbZGVidWd0cmFjZV9ieXRlcyAtIDFd
ID09IDApOwotICAgIHNlcmNvbl9wdXRzKCZkZWJ1Z3RyYWNlX2J1ZltkZWJ1Z3RyYWNlX3ByZF0p
OworICAgIGNvbnNvbGVfc2VyaWFsX3B1dHMoJmRlYnVndHJhY2VfYnVmW2RlYnVndHJhY2VfcHJk
XSk7CiAKICAgICAvKiBQcmludCB5b3VuZ2VzdCBwb3J0aW9uIG9mIHRoZSByaW5nLiAqLwogICAg
IGRlYnVndHJhY2VfYnVmW2RlYnVndHJhY2VfcHJkXSA9ICdcMCc7Ci0gICAgc2VyY29uX3B1dHMo
JmRlYnVndHJhY2VfYnVmWzBdKTsKKyAgICBjb25zb2xlX3NlcmlhbF9wdXRzKCZkZWJ1Z3RyYWNl
X2J1ZlswXSk7CiAKICAgICBtZW1zZXQoZGVidWd0cmFjZV9idWYsICdcMCcsIGRlYnVndHJhY2Vf
Ynl0ZXMpOwogCkBAIC0xMjY3LDggKzEyNjcsOCBAQCB2b2lkIGRlYnVndHJhY2VfcHJpbnRrKGNv
bnN0IGNoYXIgKmZtdCwgLi4uKQogICAgIGlmICggZGVidWd0cmFjZV9zZW5kX3RvX2NvbnNvbGUg
KQogICAgIHsKICAgICAgICAgc25wcmludGYoY250YnVmLCBzaXplb2YoY250YnVmKSwgIiV1ICIs
ICsrY291bnQpOwotICAgICAgICBzZXJpYWxfcHV0cyhzZXJjb25faGFuZGxlLCBjbnRidWYpOwot
ICAgICAgICBzZXJpYWxfcHV0cyhzZXJjb25faGFuZGxlLCBidWYpOworICAgICAgICBjb25zb2xl
X3NlcmlhbF9wdXRzKGNudGJ1Zik7CisgICAgICAgIGNvbnNvbGVfc2VyaWFsX3B1dHMoYnVmKTsK
ICAgICB9CiAgICAgZWxzZQogICAgIHsKZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL3hlbi9jb25z
b2xlLmggYi94ZW4vaW5jbHVkZS94ZW4vY29uc29sZS5oCmluZGV4IGI0Zjk0NjM5MzYuLjA0MTUy
MjY5MmYgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL3hlbi9jb25zb2xlLmgKKysrIGIveGVuL2lu
Y2x1ZGUveGVuL2NvbnNvbGUuaApAQCAtNDYsNiArNDYsOSBAQCB2b2lkIGNvbnNvbGVfZ2l2ZWJh
Y2soaW50IGlkKTsKIGludCBjb25zb2xlX3N1c3BlbmQodm9pZCk7CiBpbnQgY29uc29sZV9yZXN1
bWUodm9pZCk7CiAKKy8qIEVtaXQgYSBzdHJpbmcgdmlhIHRoZSBzZXJpYWwgY29uc29sZS4gKi8K
K3ZvaWQgY29uc29sZV9zZXJpYWxfcHV0cyhjb25zdCBjaGFyICpzKTsKKwogZXh0ZXJuIGludDhf
dCBvcHRfY29uc29sZV94ZW47CiAKICNlbmRpZiAvKiBfX0NPTlNPTEVfSF9fICovCi0tIAoyLjE2
LjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
