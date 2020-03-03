Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF57C1770BA
	for <lists+xen-devel@lfdr.de>; Tue,  3 Mar 2020 09:05:51 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j92WB-0005Y0-01; Tue, 03 Mar 2020 08:03:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=HQGm=4U=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1j92W8-0005Xs-UV
 for xen-devel@lists.xenproject.org; Tue, 03 Mar 2020 08:03:04 +0000
X-Inumbo-ID: 66ff7e5d-5d25-11ea-a09c-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 66ff7e5d-5d25-11ea-a09c-12813bfff9fa;
 Tue, 03 Mar 2020 08:03:03 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 43579AC1D;
 Tue,  3 Mar 2020 08:03:02 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Tue,  3 Mar 2020 09:03:00 +0100
Message-Id: <20200303080300.12467-1-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
Subject: [Xen-devel] [PATCH] xen/sched: fix error path in
 cpupool_unassign_cpu_start()
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

SW4gY2FzZSBtb3ZpbmcgYXdheSBhbGwgZG9tYWlucyBmcm9tIHRoZSBjcHUgdG8gYmUgcmVtb3Zl
ZCBpcyBmYWlsaW5nCmluIGNwdXBvb2xfdW5hc3NpZ25fY3B1X3N0YXJ0KCkgdGhlIGVycm9yIHBh
dGggaXMgbWlzc2luZyB0byByZWxlYXNlCnNjaGVkX3Jlc19yY3Vsb2NrLgoKVGhlIG5vcm1hbCBl
eGl0IHBhdGggaXMgcmVsZWFzaW5nIGRvbWxpc3RfcmVhZF9sb2NrIGluc3RlYWQgKHRoaXMgaXMK
Y3VycmVudGx5IG5vIHByb2JsZW0gYXMgdGhlIHJlZmVyZW5jZSB0byB0aGUgc3BlY2lmaWMgcmN1
IGxvY2sgaXMgbm90CnVzZWQgYnkgcmN1X3JlYWRfdW5sb2NrKCkpLgoKUmVwb3J0ZWQtYnk6IEln
b3IgRHJ1emhpbmluIDxpZ29yLmRydXpoaW5pbkBjaXRyaXguY29tPgpTaWduZWQtb2ZmLWJ5OiBK
dWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+Ci0tLQogeGVuL2NvbW1vbi9zY2hlZC9jcHVw
b29sLmMgfCA1ICsrKy0tCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAyIGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vc2NoZWQvY3B1cG9vbC5jIGIveGVuL2Nv
bW1vbi9zY2hlZC9jcHVwb29sLmMKaW5kZXggYjc3MjFiNWQwMi4uNGJmM2Q4NDM0ZCAxMDA2NDQK
LS0tIGEveGVuL2NvbW1vbi9zY2hlZC9jcHVwb29sLmMKKysrIGIveGVuL2NvbW1vbi9zY2hlZC9j
cHVwb29sLmMKQEAgLTQ2Niw3ICs0NjYsNyBAQCBzdGF0aWMgaW50IGNwdXBvb2xfdW5hc3NpZ25f
Y3B1X3N0YXJ0KHN0cnVjdCBjcHVwb29sICpjLCB1bnNpZ25lZCBpbnQgY3B1KQogICAgICAgICB9
CiAgICAgICAgIHJjdV9yZWFkX3VubG9jaygmZG9tbGlzdF9yZWFkX2xvY2spOwogICAgICAgICBp
ZiAoIHJldCApCi0gICAgICAgICAgICBnb3RvIG91dDsKKyAgICAgICAgICAgIGdvdG8gb3V0X3Jj
dTsKICAgICB9CiAgICAgY3B1cG9vbF9tb3ZpbmdfY3B1ID0gY3B1OwogICAgIGF0b21pY19pbmMo
JmMtPnJlZmNudCk7CkBAIC00NzQsNyArNDc0LDggQEAgc3RhdGljIGludCBjcHVwb29sX3VuYXNz
aWduX2NwdV9zdGFydChzdHJ1Y3QgY3B1cG9vbCAqYywgdW5zaWduZWQgaW50IGNwdSkKICAgICBj
cHVtYXNrX2FuZG5vdChjLT5jcHVfdmFsaWQsIGMtPmNwdV92YWxpZCwgY3B1cyk7CiAgICAgY3B1
bWFza19hbmQoYy0+cmVzX3ZhbGlkLCBjLT5jcHVfdmFsaWQsICZzY2hlZF9yZXNfbWFzayk7CiAK
LSAgICByY3VfcmVhZF91bmxvY2soJmRvbWxpc3RfcmVhZF9sb2NrKTsKK291dF9yY3U6CisgICAg
cmN1X3JlYWRfdW5sb2NrKCZzY2hlZF9yZXNfcmN1bG9jayk7CiBvdXQ6CiAgICAgc3Bpbl91bmxv
Y2soJmNwdXBvb2xfbG9jayk7CiAKLS0gCjIuMTYuNAoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
