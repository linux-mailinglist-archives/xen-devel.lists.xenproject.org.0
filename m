Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CBD618F6F7
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2020 15:31:57 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jGO4f-0005gX-UZ; Mon, 23 Mar 2020 14:29:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=zIvS=5I=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jGO4e-0005gR-35
 for xen-devel@lists.xenproject.org; Mon, 23 Mar 2020 14:29:04 +0000
X-Inumbo-ID: a490aa50-6d12-11ea-82e2-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a490aa50-6d12-11ea-82e2-12813bfff9fa;
 Mon, 23 Mar 2020 14:29:03 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 5A6A0B1D4;
 Mon, 23 Mar 2020 14:29:02 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Mon, 23 Mar 2020 15:29:00 +0100
Message-Id: <20200323142900.22255-1-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
Subject: [Xen-devel] [PATCH] tools/xenstore: don't close connection in
 xs_talkv()
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
Cc: Juergen Gross <jgross@suse.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SW4gY2FzZSBvZiBzb21lIGVycm9ycyB4c190YWxrdigpIHdpbGwgY2xvc2UgdGhlIGNvbm5lY3Rp
b24gdG8KWGVuc3RvcmUuIFRoaXMgaXMgYW5ub3lpbmcgYXMgaXQgaXMgbm90IGNsZWFyIHRvIHRo
ZSBjYWxsZXIgaW4gd2hpY2gKZXJyb3IgY2FzZSB0aGUgY29ubmVjdGlvbiBpcyBzdGlsbCBhdmFp
bGFibGUuCgpEcm9wIHRoYXQgaW1wbGljaXQgY2xvc2luZyB0byBtYWtlIHRoZSBpbnRlcmZhY2Ug
YmVoYXZlIGluIGEgc2FuZSBhbmQKcHJlZGljdGFibGUgd2F5LgoKU2lnbmVkLW9mZi1ieTogSnVl
cmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgotLS0KIHRvb2xzL3hlbnN0b3JlL3hzLmMgfCAx
NCArKysrKystLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgOCBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS90b29scy94ZW5zdG9yZS94cy5jIGIvdG9vbHMveGVuc3Rv
cmUveHMuYwppbmRleCBhYTFkMjRiOGI5Li5iYmYzZTAwYmVkIDEwMDY0NAotLS0gYS90b29scy94
ZW5zdG9yZS94cy5jCisrKyBiL3Rvb2xzL3hlbnN0b3JlL3hzLmMKQEAgLTUyNCwxMiArNTI0LDE0
IEBAIHN0YXRpYyB2b2lkICp4c190YWxrdihzdHJ1Y3QgeHNfaGFuZGxlICpoLCB4c190cmFuc2Fj
dGlvbl90IHQsCiAJCQlnb3RvIGZhaWw7CiAKIAlyZXQgPSByZWFkX3JlcGx5KGgsICZtc2cudHlw
ZSwgbGVuKTsKLQlpZiAoIXJldCkKLQkJZ290byBmYWlsOwogCiAJbXV0ZXhfdW5sb2NrKCZoLT5y
ZXF1ZXN0X211dGV4KTsKIAogCXNpZ2FjdGlvbihTSUdQSVBFLCAmb2xkYWN0LCBOVUxMKTsKKwor
CWlmICghcmV0KQorCQlyZXR1cm4gTlVMTDsKKwogCWlmIChtc2cudHlwZSA9PSBYU19FUlJPUikg
ewogCQlzYXZlZF9lcnJubyA9IGdldF9lcnJvcihyZXQpOwogCQlmcmVlKHJldCk7CkBAIC01Mzks
MTkgKzU0MSwxNSBAQCBzdGF0aWMgdm9pZCAqeHNfdGFsa3Yoc3RydWN0IHhzX2hhbmRsZSAqaCwg
eHNfdHJhbnNhY3Rpb25fdCB0LAogCiAJaWYgKG1zZy50eXBlICE9IHR5cGUpIHsKIAkJZnJlZShy
ZXQpOwotCQlzYXZlZF9lcnJubyA9IEVCQURGOwotCQlnb3RvIGNsb3NlX2ZkOworCQllcnJubyA9
IEVCQURGOworCQlyZXR1cm4gTlVMTDsKIAl9CiAJcmV0dXJuIHJldDsKIAogZmFpbDoKLQkvKiBX
ZSdyZSBpbiBhIGJhZCBzdGF0ZSwgc28gY2xvc2UgZmQuICovCiAJc2F2ZWRfZXJybm8gPSBlcnJu
bzsKIAltdXRleF91bmxvY2soJmgtPnJlcXVlc3RfbXV0ZXgpOwogCXNpZ2FjdGlvbihTSUdQSVBF
LCAmb2xkYWN0LCBOVUxMKTsKLWNsb3NlX2ZkOgotCWNsb3NlKGgtPmZkKTsKLQloLT5mZCA9IC0x
OwogCWVycm5vID0gc2F2ZWRfZXJybm87CiAJcmV0dXJuIE5VTEw7CiB9Ci0tIAoyLjE2LjQKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
