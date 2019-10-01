Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24C03C388C
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2019 17:07:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFJhi-0005Pj-Gr; Tue, 01 Oct 2019 15:04:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=hN/W=X2=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iFJhg-0005PF-AE
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2019 15:04:40 +0000
X-Inumbo-ID: c9ed7f42-e45c-11e9-9702-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id c9ed7f42-e45c-11e9-9702-12813bfff9fa;
 Tue, 01 Oct 2019 15:04:39 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 291F6AF8E;
 Tue,  1 Oct 2019 15:04:38 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Date: Tue,  1 Oct 2019 17:03:55 +0200
Message-Id: <20191001150355.25365-1-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
Subject: [Xen-devel] [PATCH] xen/xenbus: fix self-deadlock after killing
 user process
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
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, stable@vger.kernel.org,
 James Dingwall <james@dingwall.me.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SW4gY2FzZSBhIHVzZXIgcHJvY2VzcyB1c2luZyB4ZW5idXMgaGFzIG9wZW4gdHJhbnNhY3Rpb25z
IGFuZCBpcyBraWxsZWQKZS5nLiB2aWEgY3RybC1DIHRoZSBmb2xsb3dpbmcgY2xlYW51cCBvZiB0
aGUgYWxsb2NhdGVkIHJlc291cmNlcyBtaWdodApyZXN1bHQgaW4gYSBkZWFkbG9jayBkdWUgdG8g
dHJ5aW5nIHRvIGVuZCBhIHRyYW5zYWN0aW9uIGluIHRoZSB4ZW5idXMKd29ya2VyIHRocmVhZDoK
ClsgMjU1MS40NzQ3MDZdIElORk86IHRhc2sgeGVuYnVzOjM3IGJsb2NrZWQgZm9yIG1vcmUgdGhh
biAxMjAgc2Vjb25kcy4KWyAyNTUxLjQ5MjIxNV0gICAgICAgVGFpbnRlZDogUCAgICAgICAgICAg
T0UgICAgIDUuMC4wLTI5LWdlbmVyaWMgIzUKWyAyNTUxLjUxMDI2M10gImVjaG8gMCA+IC9wcm9j
L3N5cy9rZXJuZWwvaHVuZ190YXNrX3RpbWVvdXRfc2VjcyIgZGlzYWJsZXMgdGhpcyBtZXNzYWdl
LgpbIDI1NTEuNTI4NTg1XSB4ZW5idXMgICAgICAgICAgRCAgICAwICAgIDM3ICAgICAgMiAweDgw
MDAwMDgwClsgMjU1MS41Mjg1OTBdIENhbGwgVHJhY2U6ClsgMjU1MS41Mjg2MDNdICBfX3NjaGVk
dWxlKzB4MmMwLzB4ODcwClsgMjU1MS41Mjg2MDZdICA/IF9jb25kX3Jlc2NoZWQrMHgxOS8weDQw
ClsgMjU1MS41Mjg2MzJdICBzY2hlZHVsZSsweDJjLzB4NzAKWyAyNTUxLjUyODYzN10gIHhzX3Rh
bGt2KzB4MWVjLzB4MmIwClsgMjU1MS41Mjg2NDJdICA/IHdhaXRfd29rZW4rMHg4MC8weDgwClsg
MjU1MS41Mjg2NDVdICB4c19zaW5nbGUrMHg1My8weDgwClsgMjU1MS41Mjg2NDhdICB4ZW5idXNf
dHJhbnNhY3Rpb25fZW5kKzB4M2IvMHg3MApbIDI1NTEuNTI4NjUxXSAgeGVuYnVzX2ZpbGVfZnJl
ZSsweDVhLzB4MTYwClsgMjU1MS41Mjg2NTRdICB4ZW5idXNfZGV2X3F1ZXVlX3JlcGx5KzB4YzQv
MHgyMjAKWyAyNTUxLjUyODY1N10gIHhlbmJ1c190aHJlYWQrMHg3ZGUvMHg4ODAKWyAyNTUxLjUy
ODY2MF0gID8gd2FpdF93b2tlbisweDgwLzB4ODAKWyAyNTUxLjUyODY2NV0gIGt0aHJlYWQrMHgx
MjEvMHgxNDAKWyAyNTUxLjUyODY2N10gID8geGJfcmVhZCsweDFkMC8weDFkMApbIDI1NTEuNTI4
NjcwXSAgPyBrdGhyZWFkX3BhcmsrMHg5MC8weDkwClsgMjU1MS41Mjg2NzNdICByZXRfZnJvbV9m
b3JrKzB4MzUvMHg0MAoKRml4IHRoaXMgYnkgZG9pbmcgdGhlIGNsZWFudXAgdmlhIGEgd29ya3F1
ZXVlIGluc3RlYWQuCgpSZXBvcnRlZC1ieTogSmFtZXMgRGluZ3dhbGwgPGphbWVzQGRpbmd3YWxs
Lm1lLnVrPgpGaXhlczogZmQ4YWE5MDk1YTk1YyAoInhlbjogb3B0aW1pemUgeGVuYnVzIGRyaXZl
ciBmb3IgbXVsdGlwbGUgY29uY3VycmVudCB4ZW5zdG9yZSBhY2Nlc3NlcyIpCkNjOiA8c3RhYmxl
QHZnZXIua2VybmVsLm9yZz4gIyA0LjExClNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpn
cm9zc0BzdXNlLmNvbT4KLS0tCiBkcml2ZXJzL3hlbi94ZW5idXMveGVuYnVzX2Rldl9mcm9udGVu
ZC5jIHwgMjAgKysrKysrKysrKysrKysrKysrLS0KIDEgZmlsZSBjaGFuZ2VkLCAxOCBpbnNlcnRp
b25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMveGVuL3hlbmJ1cy94
ZW5idXNfZGV2X2Zyb250ZW5kLmMgYi9kcml2ZXJzL3hlbi94ZW5idXMveGVuYnVzX2Rldl9mcm9u
dGVuZC5jCmluZGV4IDA4YWRjNTkwZjYzMS4uNTk3YWY0NTVhNTIyIDEwMDY0NAotLS0gYS9kcml2
ZXJzL3hlbi94ZW5idXMveGVuYnVzX2Rldl9mcm9udGVuZC5jCisrKyBiL2RyaXZlcnMveGVuL3hl
bmJ1cy94ZW5idXNfZGV2X2Zyb250ZW5kLmMKQEAgLTU1LDYgKzU1LDcgQEAKICNpbmNsdWRlIDxs
aW51eC9zdHJpbmcuaD4KICNpbmNsdWRlIDxsaW51eC9zbGFiLmg+CiAjaW5jbHVkZSA8bGludXgv
bWlzY2RldmljZS5oPgorI2luY2x1ZGUgPGxpbnV4L3dvcmtxdWV1ZS5oPgogCiAjaW5jbHVkZSA8
eGVuL3hlbmJ1cy5oPgogI2luY2x1ZGUgPHhlbi94ZW4uaD4KQEAgLTExNiw2ICsxMTcsOCBAQCBz
dHJ1Y3QgeGVuYnVzX2ZpbGVfcHJpdiB7CiAJd2FpdF9xdWV1ZV9oZWFkX3QgcmVhZF93YWl0cTsK
IAogCXN0cnVjdCBrcmVmIGtyZWY7CisKKwlzdHJ1Y3Qgd29ya19zdHJ1Y3Qgd3E7CiB9OwogCiAv
KiBSZWFkIG91dCBhbnkgcmF3IHhlbmJ1cyBtZXNzYWdlcyBxdWV1ZWQgdXAuICovCkBAIC0zMDAs
MTQgKzMwMywxNCBAQCBzdGF0aWMgdm9pZCB3YXRjaF9maXJlZChzdHJ1Y3QgeGVuYnVzX3dhdGNo
ICp3YXRjaCwKIAltdXRleF91bmxvY2soJmFkYXAtPmRldl9kYXRhLT5yZXBseV9tdXRleCk7CiB9
CiAKLXN0YXRpYyB2b2lkIHhlbmJ1c19maWxlX2ZyZWUoc3RydWN0IGtyZWYgKmtyZWYpCitzdGF0
aWMgdm9pZCB4ZW5idXNfd29ya2VyKHN0cnVjdCB3b3JrX3N0cnVjdCAqd3EpCiB7CiAJc3RydWN0
IHhlbmJ1c19maWxlX3ByaXYgKnU7CiAJc3RydWN0IHhlbmJ1c190cmFuc2FjdGlvbl9ob2xkZXIg
KnRyYW5zLCAqdG1wOwogCXN0cnVjdCB3YXRjaF9hZGFwdGVyICp3YXRjaCwgKnRtcF93YXRjaDsK
IAlzdHJ1Y3QgcmVhZF9idWZmZXIgKnJiLCAqdG1wX3JiOwogCi0JdSA9IGNvbnRhaW5lcl9vZihr
cmVmLCBzdHJ1Y3QgeGVuYnVzX2ZpbGVfcHJpdiwga3JlZik7CisJdSA9IGNvbnRhaW5lcl9vZih3
cSwgc3RydWN0IHhlbmJ1c19maWxlX3ByaXYsIHdxKTsKIAogCS8qCiAJICogTm8gbmVlZCBmb3Ig
bG9ja2luZyBoZXJlIGJlY2F1c2UgdGhlcmUgYXJlIG5vIG90aGVyIHVzZXJzLApAQCAtMzMzLDYg
KzMzNiwxOCBAQCBzdGF0aWMgdm9pZCB4ZW5idXNfZmlsZV9mcmVlKHN0cnVjdCBrcmVmICprcmVm
KQogCWtmcmVlKHUpOwogfQogCitzdGF0aWMgdm9pZCB4ZW5idXNfZmlsZV9mcmVlKHN0cnVjdCBr
cmVmICprcmVmKQoreworCXN0cnVjdCB4ZW5idXNfZmlsZV9wcml2ICp1OworCisJLyoKKwkgKiBX
ZSBtaWdodCBiZSBjYWxsZWQgaW4geGVuYnVzX3RocmVhZCgpLgorCSAqIFVzZSB3b3JrcXVldWUg
dG8gYXZvaWQgZGVhZGxvY2suCisJICovCisJdSA9IGNvbnRhaW5lcl9vZihrcmVmLCBzdHJ1Y3Qg
eGVuYnVzX2ZpbGVfcHJpdiwga3JlZik7CisJc2NoZWR1bGVfd29yaygmdS0+d3EpOworfQorCiBz
dGF0aWMgc3RydWN0IHhlbmJ1c190cmFuc2FjdGlvbl9ob2xkZXIgKnhlbmJ1c19nZXRfdHJhbnNh
Y3Rpb24oCiAJc3RydWN0IHhlbmJ1c19maWxlX3ByaXYgKnUsIHVpbnQzMl90IHR4X2lkKQogewpA
QCAtNjUwLDYgKzY2NSw3IEBAIHN0YXRpYyBpbnQgeGVuYnVzX2ZpbGVfb3BlbihzdHJ1Y3QgaW5v
ZGUgKmlub2RlLCBzdHJ1Y3QgZmlsZSAqZmlscCkKIAlJTklUX0xJU1RfSEVBRCgmdS0+d2F0Y2hl
cyk7CiAJSU5JVF9MSVNUX0hFQUQoJnUtPnJlYWRfYnVmZmVycyk7CiAJaW5pdF93YWl0cXVldWVf
aGVhZCgmdS0+cmVhZF93YWl0cSk7CisJSU5JVF9XT1JLKCZ1LT53cSwgeGVuYnVzX3dvcmtlcik7
CiAKIAltdXRleF9pbml0KCZ1LT5yZXBseV9tdXRleCk7CiAJbXV0ZXhfaW5pdCgmdS0+bXNnYnVm
ZmVyX211dGV4KTsKLS0gCjIuMTYuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
