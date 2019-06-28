Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B98BC59632
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jun 2019 10:34:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hgmIk-00006G-Kq; Fri, 28 Jun 2019 08:32:10 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=droh=U3=gandi.net=nicolas.belouin@srs-us1.protection.inumbo.net>)
 id 1hgmIj-000069-1K
 for xen-devel@lists.xenproject.org; Fri, 28 Jun 2019 08:32:09 +0000
X-Inumbo-ID: 36c7efde-997f-11e9-8980-bc764e045a96
Received: from gandi.net (unknown [217.70.182.73])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 36c7efde-997f-11e9-8980-bc764e045a96;
 Fri, 28 Jun 2019 08:32:07 +0000 (UTC)
Received: from diconico07.dev (unknown
 [IPv6:2001:4b98:beef:a:e7c:1fb4:ff55:f4a9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by gandi.net (Postfix) with ESMTPSA id 9CC1C16032C;
 Fri, 28 Jun 2019 08:32:06 +0000 (UTC)
From: Nicolas Belouin <nicolas.belouin@gandi.net>
To: xen-devel@lists.xenproject.org
Date: Fri, 28 Jun 2019 10:31:48 +0200
Message-Id: <20190628083148.1747-1-nicolas.belouin@gandi.net>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2] golang/xenlight: Fix type issues with recent
 Go version
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
Cc: Ian Jackson <ian.jackson@eu.citrix.com>,
 Nicolas Belouin <nicolas.belouin@gandi.net>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

TmV3ZXIgdmVyc2lvbnMgb2YgR28gaGF2ZSBiZWNvbWUgc3RyaWN0ZXIgb24gZW5mb3JjaW5nIHRo
ZSBubyBpbXBsaWNpdApjb252ZXJzaW9ucyBwb2xpY3kgd2hlbiB1c2luZyBDR28uClNwZWNpZmlj
YWxseSwgdGhlIGZvbGxvd2luZyB0d28gY29udmVyc2lvbnMgYXJlIG5vIGxvbmdlciBhbGxvd2Vk
OgoKLSB1bnNhZmUuUG9pbnRlciBiZWluZyBhdXRvbWF0aWNhbGx5IGNhc3QgdG8gYW55IEMgcG9p
bnRlcgotIEEgcG9pbnRlciB0eXBlIG90aGVyIHRoYW4gdW5zYWZlLlBvaW50ZXIgYmVpbmcgYXV0
b21hdGljYWxseSBjYXN0IHRvIEMKdm9pZCAqCgpGaXggdGhpcyBieSBhZGRpbmcgZXhwbGljaXQg
Y2FzdHMgd2hlcmUgbmVjZXNzYXJ5LgoKU2lnbmVkLW9mZi1ieTogTmljb2xhcyBCZWxvdWluIDxu
aWNvbGFzLmJlbG91aW5AZ2FuZGkubmV0PgotLS0KIHRvb2xzL2dvbGFuZy94ZW5saWdodC94ZW5s
aWdodC5nbyB8IDEzICsrKysrKystLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMo
KyksIDYgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdG9vbHMvZ29sYW5nL3hlbmxpZ2h0L3hl
bmxpZ2h0LmdvIGIvdG9vbHMvZ29sYW5nL3hlbmxpZ2h0L3hlbmxpZ2h0LmdvCmluZGV4IDUzNTM0
ZDA0N2UuLmEyYWY2ZjZlZjkgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2dvbGFuZy94ZW5saWdodC94ZW5s
aWdodC5nbworKysgYi90b29scy9nb2xhbmcveGVubGlnaHQveGVubGlnaHQuZ28KQEAgLTEyMiw3
ICsxMjIsNyBAQCB0eXBlIFV1aWQgQy5saWJ4bF91dWlkCiAKIHR5cGUgQ29udGV4dCBzdHJ1Y3Qg
ewogCWN0eCAgICAqQy5saWJ4bF9jdHgKLQlsb2dnZXIgKkMueGVudG9vbGxvZ19sb2dnZXJfc3Rk
aW9zdHJlYW0KKwlsb2dnZXIgKkMueGVudG9vbGxvZ19sb2dnZXIKIH0KIAogdHlwZSBId2NhcCBb
XUMudWludDMyX3QKQEAgLTg0NywxNCArODQ3LDE1IEBAIGZ1bmMgKEN0eCAqQ29udGV4dCkgT3Bl
bigpIChlcnIgZXJyb3IpIHsKIAkJcmV0dXJuCiAJfQogCi0JQ3R4LmxvZ2dlciA9IEMueHRsX2Ny
ZWF0ZWxvZ2dlcl9zdGRpb3N0cmVhbShDLnN0ZGVyciwgQy5YVExfRVJST1IsIDApCisJQ3R4Lmxv
Z2dlciA9ICgqQy54ZW50b29sbG9nX2xvZ2dlcikodW5zYWZlLlBvaW50ZXIoCisJCUMueHRsX2Ny
ZWF0ZWxvZ2dlcl9zdGRpb3N0cmVhbShDLnN0ZGVyciwgQy5YVExfRVJST1IsIDApKSkKIAlpZiBD
dHgubG9nZ2VyID09IG5pbCB7CiAJCWVyciA9IGZtdC5FcnJvcmYoIkNhbm5vdCBvcGVuIHN0ZGlv
c3RyZWFtIikKIAkJcmV0dXJuCiAJfQogCiAJcmV0IDo9IEMubGlieGxfY3R4X2FsbG9jKCZDdHgu
Y3R4LCBDLkxJQlhMX1ZFUlNJT04sCi0JCTAsIHVuc2FmZS5Qb2ludGVyKEN0eC5sb2dnZXIpKQor
CQkwLCBDdHgubG9nZ2VyKQogCiAJaWYgcmV0ICE9IDAgewogCQllcnIgPSBFcnJvcigtcmV0KQpA
QCAtODY5LDcgKzg3MCw3IEBAIGZ1bmMgKEN0eCAqQ29udGV4dCkgQ2xvc2UoKSAoZXJyIGVycm9y
KSB7CiAJaWYgcmV0ICE9IDAgewogCQllcnIgPSBFcnJvcigtcmV0KQogCX0KLQlDLnh0bF9sb2dn
ZXJfZGVzdHJveSh1bnNhZmUuUG9pbnRlcihDdHgubG9nZ2VyKSkKKwlDLnh0bF9sb2dnZXJfZGVz
dHJveShDdHgubG9nZ2VyKQogCXJldHVybgogfQogCkBAIC0xMTcwLDcgKzExNzEsNyBAQCBmdW5j
IChDdHggKkNvbnRleHQpIENvbnNvbGVHZXRUdHkoaWQgRG9taWQsIGNvbnNOdW0gaW50LCBjb25U
eXBlIENvbnNvbGVUeXBlKSAocAogCQllcnIgPSBFcnJvcigtcmV0KQogCQlyZXR1cm4KIAl9Ci0J
ZGVmZXIgQy5mcmVlKGNwYXRoKQorCWRlZmVyIEMuZnJlZSh1bnNhZmUuUG9pbnRlcihjcGF0aCkp
CiAKIAlwYXRoID0gQy5Hb1N0cmluZyhjcGF0aCkKIAlyZXR1cm4KQEAgLTExOTAsNyArMTE5MSw3
IEBAIGZ1bmMgKEN0eCAqQ29udGV4dCkgUHJpbWFyeUNvbnNvbGVHZXRUdHkoZG9taWQgdWludDMy
KSAocGF0aCBzdHJpbmcsIGVyciBlcnJvcikKIAkJZXJyID0gRXJyb3IoLXJldCkKIAkJcmV0dXJu
CiAJfQotCWRlZmVyIEMuZnJlZShjcGF0aCkKKwlkZWZlciBDLmZyZWUodW5zYWZlLlBvaW50ZXIo
Y3BhdGgpKQogCiAJcGF0aCA9IEMuR29TdHJpbmcoY3BhdGgpCiAJcmV0dXJuCi0tIAoyLjIyLjAK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
