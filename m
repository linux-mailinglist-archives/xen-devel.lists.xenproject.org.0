Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3ED017F2CD
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2020 10:11:08 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jBare-0003aT-P1; Tue, 10 Mar 2020 09:07:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=WGVw=43=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jBarc-0003aO-LK
 for xen-devel@lists.xenproject.org; Tue, 10 Mar 2020 09:07:48 +0000
X-Inumbo-ID: 9c2e20ea-62ae-11ea-8490-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9c2e20ea-62ae-11ea-8490-bc764e2007e4;
 Tue, 10 Mar 2020 09:07:47 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id CF369AD46;
 Tue, 10 Mar 2020 09:07:46 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Tue, 10 Mar 2020 10:06:42 +0100
Message-Id: <20200310090642.8476-1-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
Subject: [Xen-devel] [PATCH v2] xen/sched: fix onlining cpu with core
 scheduling active
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
Cc: Juergen Gross <jgross@suse.com>, George Dunlap <george.dunlap@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2hlbiBvbmxpbmluZyBhIGNwdSBjcHVwb29sX2NwdV9hZGQoKSBjaGVja3Mgd2hldGhlciBhbGwg
c2libGluZ3Mgb2YKdGhlIG5ldyBjcHUgYXJlIGZyZWUgaW4gb3JkZXIgdG8gZGVjaWRlIHdoZXRo
ZXIgdG8gYWRkIGl0IHRvIGNwdXBvb2wwLgpJbiBjYXNlIHRoZSBhZGRlZCBjcHUgaXMgbm90IHRo
ZSBsYXN0IHNpYmxpbmcgdG8gYmUgb25saW5lZCB0aGlzIHRlc3QKaXMgd3JvbmcgYXMgaXQgb25s
eSBjaGVja3MgZm9yIGFsbCBvbmxpbmUgc2libGluZ3MgdG8gYmUgZnJlZS4gVGhlCnRlc3Qgc2hv
dWxkIGluY2x1ZGUgdGhlIGNoZWNrIGZvciB0aGUgbnVtYmVyIG9mIHNpYmxpbmdzIGhhdmluZwpy
ZWFjaGVkIHRoZSBzY2hlZHVsaW5nIGdyYW51bGFyaXR5IG9mIGNwdXBvb2wwLCB0b28uCgpTaWdu
ZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+Ci0tLQpWMjoKLSBtb2Rp
ZnkgY29uZGl0aW9uIGZvcm0gPj0gdG8gPT0gKEphbiBCZXVsaWNoKQotLS0KIHhlbi9jb21tb24v
c2NoZWQvY3B1cG9vbC5jIHwgMyArKy0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyks
IDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS94ZW4vY29tbW9uL3NjaGVkL2NwdXBvb2wuYyBi
L3hlbi9jb21tb24vc2NoZWQvY3B1cG9vbC5jCmluZGV4IDlmNzBjN2VjMTcuLmQ0MDM0NWI1ODUg
MTAwNjQ0Ci0tLSBhL3hlbi9jb21tb24vc2NoZWQvY3B1cG9vbC5jCisrKyBiL3hlbi9jb21tb24v
c2NoZWQvY3B1cG9vbC5jCkBAIC02MTYsNyArNjE2LDggQEAgc3RhdGljIGludCBjcHVwb29sX2Nw
dV9hZGQodW5zaWduZWQgaW50IGNwdSkKICAgICBnZXRfc2NoZWRfcmVzKGNwdSktPmNwdXBvb2wg
PSBOVUxMOwogCiAgICAgY3B1cyA9IHNjaGVkX2dldF9vcHRfY3B1bWFzayhjcHVwb29sMC0+Z3Jh
biwgY3B1KTsKLSAgICBpZiAoIGNwdW1hc2tfc3Vic2V0KGNwdXMsICZjcHVwb29sX2ZyZWVfY3B1
cykgKQorICAgIGlmICggY3B1bWFza19zdWJzZXQoY3B1cywgJmNwdXBvb2xfZnJlZV9jcHVzKSAm
JgorICAgICAgICAgY3B1bWFza193ZWlnaHQoY3B1cykgPT0gY3B1cG9vbF9nZXRfZ3JhbnVsYXJp
dHkoY3B1cG9vbDApICkKICAgICAgICAgcmV0ID0gY3B1cG9vbF9hc3NpZ25fY3B1X2xvY2tlZChj
cHVwb29sMCwgY3B1KTsKIAogICAgIHJjdV9yZWFkX3VubG9jaygmc2NoZWRfcmVzX3JjdWxvY2sp
OwotLSAKMi4xNi40CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
