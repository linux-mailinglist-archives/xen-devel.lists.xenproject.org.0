Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85D782C472
	for <lists+xen-devel@lfdr.de>; Tue, 28 May 2019 12:36:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hVZR5-0006ik-Fh; Tue, 28 May 2019 10:34:27 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=31/0=T4=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hVZQG-0004x0-8s
 for xen-devel@lists.xenproject.org; Tue, 28 May 2019 10:33:36 +0000
X-Inumbo-ID: 090716df-8134-11e9-8980-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 090716df-8134-11e9-8980-bc764e045a96;
 Tue, 28 May 2019 10:33:30 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D0A37B08C
 for <xen-devel@lists.xenproject.org>; Tue, 28 May 2019 10:33:29 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Tue, 28 May 2019 12:33:05 +0200
Message-Id: <20190528103313.1343-53-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20190528103313.1343-1-jgross@suse.com>
References: <20190528103313.1343-1-jgross@suse.com>
Subject: [Xen-devel] [PATCH 52/60] xen/sched: populate cpupool0 only after
 all cpus are up
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
Cc: Juergen Gross <jgross@suse.com>, Dario Faggioli <dfaggioli@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2l0aCBjb3JlIG9yIHNvY2tldCBzY2hlZHVsaW5nIHdlIG5lZWQgdG8ga25vdyB0aGUgbnVtYmVy
IG9mIHNpYmxpbmdzCnBlciBzY2hlZHVsaW5nIHVuaXQgYmVmb3JlIHdlIGNhbiBzZXR1cCB0aGUg
c2NoZWR1bGVyIHByb3Blcmx5LiBJbgpvcmRlciB0byBwcmVwYXJlIHRoYXQgZG8gY3B1cG9vbDAg
cG9wdWxhdGlvbiBvbmx5IGFmdGVyIGFsbCBjcHVzIGFyZQp1cC4KCldpdGggdGhhdCBpbiBwbGFj
ZSB0aGVyZSBpcyBubyBuZWVkIHRvIGNyZWF0ZSBjcHVwb29sMCBlYXJsaWVyLCBzbwpkbyB0aGF0
IGp1c3QgYmVmb3JlIGFzc2lnbmluZyB0aGUgY3B1cy4gSW5pdGlhbGl6ZSBmcmVlIGNwdXMgd2l0
aCBhbGwKb25saW5lIGNwdXMgYXQgdGhhdCB0aW1lIGluIG9yZGVyIHRvIGJlIGFibGUgdG8gYWRk
IHRoZSBjcHUgbm90aWZpZXIKbGF0ZSwgdG9vLgoKU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9z
cyA8amdyb3NzQHN1c2UuY29tPgotLS0KVjE6IG5ldyBwYXRjaAotLS0KIHhlbi9jb21tb24vY3B1
cG9vbC5jIHwgMTggKysrKysrKysrKysrKystLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTQgaW5zZXJ0
aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vY29tbW9uL2NwdXBvb2wu
YyBiL3hlbi9jb21tb24vY3B1cG9vbC5jCmluZGV4IDQwMzAzNmMwOTIuLjJhM2UxNDQ3MDAgMTAw
NjQ0Ci0tLSBhL3hlbi9jb21tb24vY3B1cG9vbC5jCisrKyBiL3hlbi9jb21tb24vY3B1cG9vbC5j
CkBAIC03NzUsMTggKzc3NSwyOCBAQCBzdGF0aWMgc3RydWN0IG5vdGlmaWVyX2Jsb2NrIGNwdV9u
ZmIgPSB7CiAgICAgLm5vdGlmaWVyX2NhbGwgPSBjcHVfY2FsbGJhY2sKIH07CiAKLXN0YXRpYyBp
bnQgX19pbml0IGNwdXBvb2xfcHJlc21wX2luaXQodm9pZCkKK3N0YXRpYyBpbnQgX19pbml0IGNw
dXBvb2xfaW5pdCh2b2lkKQogeworICAgIHVuc2lnbmVkIGludCBjcHU7CiAgICAgaW50IGVycjsK
LSAgICB2b2lkICpjcHUgPSAodm9pZCAqKShsb25nKXNtcF9wcm9jZXNzb3JfaWQoKTsKKwogICAg
IGNwdXBvb2wwID0gY3B1cG9vbF9jcmVhdGUoMCwgMCwgJmVycik7CiAgICAgQlVHX09OKGNwdXBv
b2wwID09IE5VTEwpOwogICAgIGNwdXBvb2xfcHV0KGNwdXBvb2wwKTsKLSAgICBjcHVfY2FsbGJh
Y2soJmNwdV9uZmIsIENQVV9PTkxJTkUsIGNwdSk7CiAgICAgcmVnaXN0ZXJfY3B1X25vdGlmaWVy
KCZjcHVfbmZiKTsKKworICAgIHNwaW5fbG9jaygmY3B1cG9vbF9sb2NrKTsKKworICAgIGNwdW1h
c2tfY29weSgmY3B1cG9vbF9mcmVlX2NwdXMsICZjcHVfb25saW5lX21hcCk7CisKKyAgICBmb3Jf
ZWFjaF9jcHUgKCBjcHUsICZjcHVwb29sX2ZyZWVfY3B1cyApCisgICAgICAgIGNwdXBvb2xfYXNz
aWduX2NwdV9sb2NrZWQoY3B1cG9vbDAsIGNwdSk7CisKKyAgICBzcGluX3VubG9jaygmY3B1cG9v
bF9sb2NrKTsKKwogICAgIHJldHVybiAwOwogfQotcHJlc21wX2luaXRjYWxsKGNwdXBvb2xfcHJl
c21wX2luaXQpOworX19pbml0Y2FsbChjcHVwb29sX2luaXQpOwogCiAvKgogICogTG9jYWwgdmFy
aWFibGVzOgotLSAKMi4xNi40CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
