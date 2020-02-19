Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 108AB1648B7
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2020 16:35:45 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4RLV-0003eh-Pt; Wed, 19 Feb 2020 15:33:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=gyox=4H=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1j4RLU-0003ec-Bu
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2020 15:33:04 +0000
X-Inumbo-ID: 1def40d2-532d-11ea-ade5-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1def40d2-532d-11ea-ade5-bc764e2007e4;
 Wed, 19 Feb 2020 15:33:03 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 85045B415;
 Wed, 19 Feb 2020 15:33:02 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Wed, 19 Feb 2020 16:33:00 +0100
Message-Id: <20200219153300.10679-1-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
Subject: [Xen-devel] [PATCH] xen/sched: don't disable interrupts all the
 time when dumping run-queues
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

SGF2aW5nIGludGVycnVwdHMgZGlzYWJsZWQgYWxsIHRoZSB0aW1lIHdoZW4gcnVubmluZyBkdW1w
X3J1bnEoKSBpcwpub3QgbmVjZXNzYXJ5LiBBbGwgdGhlIGNhbGxlZCBmdW5jdGlvbnMgYXJlIGRv
aW5nIHByb3BlciBsb2NraW5nCmFuZCBkaXNhYmxlIGludGVycnVwdHMgaWYgbmVlZGVkLgoKU2ln
bmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgotLS0KIHhlbi9jb21t
b24vc2NoZWQvY3B1cG9vbC5jIHwgMyAtLS0KIDEgZmlsZSBjaGFuZ2VkLCAzIGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vc2NoZWQvY3B1cG9vbC5jIGIveGVuL2NvbW1vbi9z
Y2hlZC9jcHVwb29sLmMKaW5kZXggNDc2OTE2YzZlYS4uYjc3MjFiNWQwMiAxMDA2NDQKLS0tIGEv
eGVuL2NvbW1vbi9zY2hlZC9jcHVwb29sLmMKKysrIGIveGVuL2NvbW1vbi9zY2hlZC9jcHVwb29s
LmMKQEAgLTg4OSwxMiArODg5LDEwIEBAIGNvbnN0IGNwdW1hc2tfdCAqY3B1cG9vbF92YWxpZF9j
cHVzKGNvbnN0IHN0cnVjdCBjcHVwb29sICpwb29sKQogCiB2b2lkIGR1bXBfcnVucSh1bnNpZ25l
ZCBjaGFyIGtleSkKIHsKLSAgICB1bnNpZ25lZCBsb25nICAgIGZsYWdzOwogICAgIHNfdGltZV90
ICAgICAgICAgbm93ID0gTk9XKCk7CiAgICAgc3RydWN0IGNwdXBvb2wgKipjOwogCiAgICAgc3Bp
bl9sb2NrKCZjcHVwb29sX2xvY2spOwotICAgIGxvY2FsX2lycV9zYXZlKGZsYWdzKTsKIAogICAg
IHByaW50aygic2NoZWRfc210X3Bvd2VyX3NhdmluZ3M6ICVzXG4iLAogICAgICAgICAgICAgc2No
ZWRfc210X3Bvd2VyX3NhdmluZ3M/ICJlbmFibGVkIjoiZGlzYWJsZWQiKTsKQEAgLTkxNCw3ICs5
MTIsNiBAQCB2b2lkIGR1bXBfcnVucSh1bnNpZ25lZCBjaGFyIGtleSkKICAgICAgICAgc2NoZWR1
bGVfZHVtcCgqYyk7CiAgICAgfQogCi0gICAgbG9jYWxfaXJxX3Jlc3RvcmUoZmxhZ3MpOwogICAg
IHNwaW5fdW5sb2NrKCZjcHVwb29sX2xvY2spOwogfQogCi0tIAoyLjE2LjQKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
