Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D79E8B7823
	for <lists+xen-devel@lfdr.de>; Thu, 19 Sep 2019 13:07:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAuF3-00038A-V4; Thu, 19 Sep 2019 11:04:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=vwgP=XO=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1iAuF2-00037U-Me
 for xen-devel@lists.xenproject.org; Thu, 19 Sep 2019 11:04:52 +0000
X-Inumbo-ID: 4b30d16a-dacd-11e9-9656-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4b30d16a-dacd-11e9-9656-12813bfff9fa;
 Thu, 19 Sep 2019 11:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568891088;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UeKCQHWeJOASb8rxm9HLX6TfIzx2QFYCoa+K6Ntx9wE=;
 b=GG4WoFjW1UQq4QbCSXnDnwS3U1nvieVGu0fLf44kR/Lag075o6wfWSnC
 AaRnyD0p5zBXu0SBT4BxinO+kPiuT+mh/300GVbMWf/YEAXzVz6oRkU+u
 jogNYT4hJYxGlvwjHJ7hk504fkTY5Wts9fQmSdat8nDcqlJnKmDRHg9DO c=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 4ov39xbBXkBANKPfsPrLPvnx1FlUbvXQ6cS8VvY0RLC/HO7lxFakUaTFrrrHO6G4bbwOZtCA3J
 UExGUUVGis3ju0Oq5dDYOLgStknca1fixcUn7j8QWoRaHjqqk8YrkuHaNK43d7AtDx5gsk6/EW
 GmFbZpnIqdfXT0bcCT9z72yeBumibdA/O+OWWrDI+GqkjW3sWSdvnJPIhAl+Z0bcKeVg14i/B7
 +ZeFpcCau40EaA7n/iprYUfN+1pTEBd2/ELA6s/Mkq/5vWsZIjWfmvBB+h+eVlB9VNN6EfrlvT
 wnU=
X-SBRS: 2.7
X-MesageID: 5777960
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,523,1559534400"; 
   d="scan'208";a="5777960"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 19 Sep 2019 12:04:42 +0100
Message-ID: <20190919110443.817594-9-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190919110443.817594-1-anthony.perard@citrix.com>
References: <20190919110443.817594-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 8/9] libxl: Move qmp_parameters_* prototypes
 to libxl_internal.h
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
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Li4gYW5kIHJlbmFtZSB0aGVtIHRvIGxpYnhsX19xbXBfcGFyYW1fKi4KClRoaXMgaXMgdG8gYWxs
b3cgb3RoZXIgZmlsZXMgdGhhbiBsaWJ4bF9xbXAuYyB0byBtYWtlIFFNUCBjYWxscyB3aXRoCnBh
cmFtZXRlcnMuCgpTaWduZWQtb2ZmLWJ5OiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRA
Y2l0cml4LmNvbT4KQWNrZWQtYnk6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXgu
Y29tPgotLS0KIHRvb2xzL2xpYnhsL2xpYnhsX2ludGVybmFsLmggfCAxNSArKysrKysrKwogdG9v
bHMvbGlieGwvbGlieGxfcW1wLmMgICAgICB8IDc1ICsrKysrKysrKysrKysrKysrLS0tLS0tLS0t
LS0tLS0tLS0tLQogMiBmaWxlcyBjaGFuZ2VkLCA1MSBpbnNlcnRpb25zKCspLCAzOSBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS90b29scy9saWJ4bC9saWJ4bF9pbnRlcm5hbC5oIGIvdG9vbHMv
bGlieGwvbGlieGxfaW50ZXJuYWwuaAppbmRleCBjN2JjZGU1ZWRhZTcuLmU4NTU0N2U2NzY3MiAx
MDA2NDQKLS0tIGEvdG9vbHMvbGlieGwvbGlieGxfaW50ZXJuYWwuaAorKysgYi90b29scy9saWJ4
bC9saWJ4bF9pbnRlcm5hbC5oCkBAIC00NzAsNiArNDcwLDIxIEBAIHN0cnVjdCBsaWJ4bF9fZXZf
cW1wIHsKICAgICBpbnQgbXNnX2lkOwogfTsKIAorLyogUU1QIHBhcmFtZXRlcnMgaGVscGVycyAq
LworCitfaGlkZGVuIHZvaWQgbGlieGxfX3FtcF9wYXJhbV9hZGRfc3RyaW5nKGxpYnhsX19nYyAq
Z2MsCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGxpYnhsX19qc29u
X29iamVjdCAqKnBhcmFtLAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBjb25zdCBjaGFyICpuYW1lLCBjb25zdCBjaGFyICpzKTsKK19oaWRkZW4gdm9pZCBsaWJ4bF9f
cW1wX3BhcmFtX2FkZF9ib29sKGxpYnhsX19nYyAqZ2MsCisgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBsaWJ4bF9fanNvbl9vYmplY3QgKipwYXJhbSwKKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IGNoYXIgKm5hbWUsIGJvb2wgYik7Citf
aGlkZGVuIHZvaWQgbGlieGxfX3FtcF9wYXJhbV9hZGRfaW50ZWdlcihsaWJ4bF9fZ2MgKmdjLAor
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbGlieGxfX2pzb25fb2Jq
ZWN0ICoqcGFyYW0sCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBj
b25zdCBjaGFyICpuYW1lLCBjb25zdCBpbnQgaSk7CisjZGVmaW5lIFFNUF9QQVJBTUVURVJTX1NQ
UklOVEYoYXJncywgbmFtZSwgZm9ybWF0LCAuLi4pIFwKKyAgICBsaWJ4bF9fcW1wX3BhcmFtX2Fk
ZF9zdHJpbmcoZ2MsIGFyZ3MsIG5hbWUsIFwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgR0NTUFJJTlRGKGZvcm1hdCwgX19WQV9BUkdTX18pKQorCiAKIC8qCiAgKiBldmdlbiBzdHJ1
Y3R1cmVzLCB3aGljaCBhcmUgdGhlIHN0YXRlIHdlIHVzZSBmb3IgZ2VuZXJhdGluZwpkaWZmIC0t
Z2l0IGEvdG9vbHMvbGlieGwvbGlieGxfcW1wLmMgYi90b29scy9saWJ4bC9saWJ4bF9xbXAuYwpp
bmRleCA5YzQ0ODBhMmIxNWYuLjY5M2M1ZDcwNTcyMCAxMDA2NDQKLS0tIGEvdG9vbHMvbGlieGwv
bGlieGxfcW1wLmMKKysrIGIvdG9vbHMvbGlieGwvbGlieGxfcW1wLmMKQEAgLTc1Miw5ICs3NTIs
OSBAQCBzdGF0aWMgdm9pZCBxbXBfcGFyYW1ldGVyc19jb21tb25fYWRkKGxpYnhsX19nYyAqZ2Ms
CiAgICAgZmxleGFycmF5X2FwcGVuZCgoKnBhcmFtKS0+dS5tYXAsIGFyZyk7CiB9CiAKLXN0YXRp
YyB2b2lkIHFtcF9wYXJhbWV0ZXJzX2FkZF9zdHJpbmcobGlieGxfX2djICpnYywKLSAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbGlieGxfX2pzb25fb2JqZWN0ICoqcGFyYW0s
Ci0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IGNoYXIgKm5hbWUs
IGNvbnN0IGNoYXIgKmFyZ3VtZW50KQordm9pZCBsaWJ4bF9fcW1wX3BhcmFtX2FkZF9zdHJpbmco
bGlieGxfX2djICpnYywKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGxpYnhsX19q
c29uX29iamVjdCAqKnBhcmFtLAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29u
c3QgY2hhciAqbmFtZSwgY29uc3QgY2hhciAqYXJndW1lbnQpCiB7CiAgICAgbGlieGxfX2pzb25f
b2JqZWN0ICpvYmo7CiAKQEAgLTc2NCw5ICs3NjQsOSBAQCBzdGF0aWMgdm9pZCBxbXBfcGFyYW1l
dGVyc19hZGRfc3RyaW5nKGxpYnhsX19nYyAqZ2MsCiAgICAgcW1wX3BhcmFtZXRlcnNfY29tbW9u
X2FkZChnYywgcGFyYW0sIG5hbWUsIG9iaik7CiB9CiAKLXN0YXRpYyB2b2lkIHFtcF9wYXJhbWV0
ZXJzX2FkZF9ib29sKGxpYnhsX19nYyAqZ2MsCi0gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBsaWJ4bF9fanNvbl9vYmplY3QgKipwYXJhbSwKLSAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIGNvbnN0IGNoYXIgKm5hbWUsIGJvb2wgYikKK3ZvaWQgbGlieGxfX3Ft
cF9wYXJhbV9hZGRfYm9vbChsaWJ4bF9fZ2MgKmdjLAorICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIGxpYnhsX19qc29uX29iamVjdCAqKnBhcmFtLAorICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGNvbnN0IGNoYXIgKm5hbWUsIGJvb2wgYikKIHsKICAgICBsaWJ4bF9fanNvbl9v
YmplY3QgKm9iajsKIApAQCAtNzc1LDkgKzc3NSw5IEBAIHN0YXRpYyB2b2lkIHFtcF9wYXJhbWV0
ZXJzX2FkZF9ib29sKGxpYnhsX19nYyAqZ2MsCiAgICAgcW1wX3BhcmFtZXRlcnNfY29tbW9uX2Fk
ZChnYywgcGFyYW0sIG5hbWUsIG9iaik7CiB9CiAKLXN0YXRpYyB2b2lkIHFtcF9wYXJhbWV0ZXJz
X2FkZF9pbnRlZ2VyKGxpYnhsX19nYyAqZ2MsCi0gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBsaWJ4bF9fanNvbl9vYmplY3QgKipwYXJhbSwKLSAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IGNoYXIgKm5hbWUsIGNvbnN0IGludCBpKQordm9p
ZCBsaWJ4bF9fcW1wX3BhcmFtX2FkZF9pbnRlZ2VyKGxpYnhsX19nYyAqZ2MsCisgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgbGlieGxfX2pzb25fb2JqZWN0ICoqcGFyYW0sCisgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3QgY2hhciAqbmFtZSwgY29uc3QgaW50
IGkpCiB7CiAgICAgbGlieGxfX2pzb25fb2JqZWN0ICpvYmo7CiAKQEAgLTc4Nyw5ICs3ODcsNiBA
QCBzdGF0aWMgdm9pZCBxbXBfcGFyYW1ldGVyc19hZGRfaW50ZWdlcihsaWJ4bF9fZ2MgKmdjLAog
ICAgIHFtcF9wYXJhbWV0ZXJzX2NvbW1vbl9hZGQoZ2MsIHBhcmFtLCBuYW1lLCBvYmopOwogfQog
Ci0jZGVmaW5lIFFNUF9QQVJBTUVURVJTX1NQUklOVEYoYXJncywgbmFtZSwgZm9ybWF0LCAuLi4p
IFwKLSAgICBxbXBfcGFyYW1ldGVyc19hZGRfc3RyaW5nKGdjLCBhcmdzLCBuYW1lLCBHQ1NQUklO
VEYoZm9ybWF0LCBfX1ZBX0FSR1NfXykpCi0KIC8qCiAgKiBBUEkKICAqLwpAQCAtOTc1LDcgKzk3
Miw3IEBAIGludCBsaWJ4bF9fcW1wX3J1bl9jb21tYW5kX2ZsZXhhcnJheShsaWJ4bF9fZ2MgKmdj
LCBpbnQgZG9taWQsCiAgICAgZm9yIChpID0gMDsgaSA8IGFycmF5LT5jb3VudDsgaSArPSAyKSB7
CiAgICAgICAgIGZsZXhhcnJheV9nZXQoYXJyYXksIGksICZuYW1lKTsKICAgICAgICAgZmxleGFy
cmF5X2dldChhcnJheSwgaSArIDEsICZ2YWx1ZSk7Ci0gICAgICAgIHFtcF9wYXJhbWV0ZXJzX2Fk
ZF9zdHJpbmcoZ2MsICZhcmdzLCAoY2hhciAqKW5hbWUsIChjaGFyICopdmFsdWUpOworICAgICAg
ICBsaWJ4bF9fcW1wX3BhcmFtX2FkZF9zdHJpbmcoZ2MsICZhcmdzLCAoY2hhciAqKW5hbWUsIChj
aGFyICopdmFsdWUpOwogICAgIH0KIAogICAgIHJldHVybiBxbXBfcnVuX2NvbW1hbmQoZ2MsIGRv
bWlkLCBjbWQsIGFyZ3MsIE5VTEwsIE5VTEwpOwpAQCAtOTk3LDEwICs5OTQsMTAgQEAgaW50IGxp
YnhsX19xbXBfcGNpX2FkZChsaWJ4bF9fZ2MgKmdjLCBpbnQgZG9taWQsIGxpYnhsX2RldmljZV9w
Y2kgKnBjaWRldikKICAgICBpZiAoIWhvc3RhZGRyKQogICAgICAgICByZXR1cm4gLTE7CiAKLSAg
ICBxbXBfcGFyYW1ldGVyc19hZGRfc3RyaW5nKGdjLCAmYXJncywgImRyaXZlciIsICJ4ZW4tcGNp
LXBhc3N0aHJvdWdoIik7CisgICAgbGlieGxfX3FtcF9wYXJhbV9hZGRfc3RyaW5nKGdjLCAmYXJn
cywgImRyaXZlciIsICJ4ZW4tcGNpLXBhc3N0aHJvdWdoIik7CiAgICAgUU1QX1BBUkFNRVRFUlNf
U1BSSU5URigmYXJncywgImlkIiwgUENJX1BUX1FERVZfSUQsCiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBwY2lkZXYtPmJ1cywgcGNpZGV2LT5kZXYsIHBjaWRldi0+ZnVuYyk7Ci0gICAgcW1w
X3BhcmFtZXRlcnNfYWRkX3N0cmluZyhnYywgJmFyZ3MsICJob3N0YWRkciIsIGhvc3RhZGRyKTsK
KyAgICBsaWJ4bF9fcW1wX3BhcmFtX2FkZF9zdHJpbmcoZ2MsICZhcmdzLCAiaG9zdGFkZHIiLCBo
b3N0YWRkcik7CiAgICAgaWYgKHBjaWRldi0+dmRldmZuKSB7CiAgICAgICAgIFFNUF9QQVJBTUVU
RVJTX1NQUklOVEYoJmFyZ3MsICJhZGRyIiwgIiV4LiV4IiwKICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBQQ0lfU0xPVChwY2lkZXYtPnZkZXZmbiksIFBDSV9GVU5DKHBjaWRldi0+dmRl
dmZuKSk7CkBAIC0xMDE2LDcgKzEwMTMsNyBAQCBpbnQgbGlieGxfX3FtcF9wY2lfYWRkKGxpYnhs
X19nYyAqZ2MsIGludCBkb21pZCwgbGlieGxfZGV2aWNlX3BjaSAqcGNpZGV2KQogICAgICAqIHJl
YXNvbiB0byBzZXQgdGhlIGZsYWcgc28gdGhpcyBpcyBvay4KICAgICAgKi8KICAgICBpZiAocGNp
ZGV2LT5wZXJtaXNzaXZlKQotICAgICAgICBxbXBfcGFyYW1ldGVyc19hZGRfYm9vbChnYywgJmFy
Z3MsICJwZXJtaXNzaXZlIiwgdHJ1ZSk7CisgICAgICAgIGxpYnhsX19xbXBfcGFyYW1fYWRkX2Jv
b2woZ2MsICZhcmdzLCAicGVybWlzc2l2ZSIsIHRydWUpOwogCiAgICAgcmMgPSBxbXBfc3luY2hy
b25vdXNfc2VuZChxbXAsICJkZXZpY2VfYWRkIiwgYXJncywKICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIE5VTEwsIE5VTEwsIHFtcC0+dGltZW91dCk7CkBAIC0xMDM5LDcgKzEwMzYsNyBA
QCBzdGF0aWMgaW50IHFtcF9kZXZpY2VfZGVsKGxpYnhsX19nYyAqZ2MsIGludCBkb21pZCwgY2hh
ciAqaWQpCiAgICAgaWYgKCFxbXApCiAgICAgICAgIHJldHVybiBFUlJPUl9GQUlMOwogCi0gICAg
cW1wX3BhcmFtZXRlcnNfYWRkX3N0cmluZyhnYywgJmFyZ3MsICJpZCIsIGlkKTsKKyAgICBsaWJ4
bF9fcW1wX3BhcmFtX2FkZF9zdHJpbmcoZ2MsICZhcmdzLCAiaWQiLCBpZCk7CiAgICAgcmMgPSBx
bXBfc3luY2hyb25vdXNfc2VuZChxbXAsICJkZXZpY2VfZGVsIiwgYXJncywKICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIE5VTEwsIE5VTEwsIHFtcC0+dGltZW91dCk7CiAgICAgaWYgKHJj
ID09IDApIHsKQEAgLTEwODIsNyArMTA3OSw3IEBAIGludCBsaWJ4bF9fcW1wX3Jlc3RvcmUobGli
eGxfX2djICpnYywgaW50IGRvbWlkLCBjb25zdCBjaGFyICpzdGF0ZV9maWxlKQogewogICAgIGxp
YnhsX19qc29uX29iamVjdCAqYXJncyA9IE5VTEw7CiAKLSAgICBxbXBfcGFyYW1ldGVyc19hZGRf
c3RyaW5nKGdjLCAmYXJncywgImZpbGVuYW1lIiwgc3RhdGVfZmlsZSk7CisgICAgbGlieGxfX3Ft
cF9wYXJhbV9hZGRfc3RyaW5nKGdjLCAmYXJncywgImZpbGVuYW1lIiwgc3RhdGVfZmlsZSk7CiAK
ICAgICByZXR1cm4gcW1wX3J1bl9jb21tYW5kKGdjLCBkb21pZCwgInhlbi1sb2FkLWRldmljZXMt
c3RhdGUiLCBhcmdzLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgTlVMTCwgTlVMTCk7CkBA
IC0xMDk0LDEwICsxMDkxLDEwIEBAIHN0YXRpYyBpbnQgcW1wX2NoYW5nZShsaWJ4bF9fZ2MgKmdj
LCBsaWJ4bF9fcW1wX2hhbmRsZXIgKnFtcCwKICAgICBsaWJ4bF9fanNvbl9vYmplY3QgKmFyZ3Mg
PSBOVUxMOwogICAgIGludCByYyA9IDA7CiAKLSAgICBxbXBfcGFyYW1ldGVyc19hZGRfc3RyaW5n
KGdjLCAmYXJncywgImRldmljZSIsIGRldmljZSk7Ci0gICAgcW1wX3BhcmFtZXRlcnNfYWRkX3N0
cmluZyhnYywgJmFyZ3MsICJ0YXJnZXQiLCB0YXJnZXQpOworICAgIGxpYnhsX19xbXBfcGFyYW1f
YWRkX3N0cmluZyhnYywgJmFyZ3MsICJkZXZpY2UiLCBkZXZpY2UpOworICAgIGxpYnhsX19xbXBf
cGFyYW1fYWRkX3N0cmluZyhnYywgJmFyZ3MsICJ0YXJnZXQiLCB0YXJnZXQpOwogICAgIGlmIChh
cmcpIHsKLSAgICAgICAgcW1wX3BhcmFtZXRlcnNfYWRkX3N0cmluZyhnYywgJmFyZ3MsICJhcmci
LCBhcmcpOworICAgICAgICBsaWJ4bF9fcW1wX3BhcmFtX2FkZF9zdHJpbmcoZ2MsICZhcmdzLCAi
YXJnIiwgYXJnKTsKICAgICB9CiAKICAgICByYyA9IHFtcF9zeW5jaHJvbm91c19zZW5kKHFtcCwg
ImNoYW5nZSIsIGFyZ3MsCkBAIC0xMTE1LDcgKzExMTIsNyBAQCBpbnQgbGlieGxfX3FtcF9zZXRf
Z2xvYmFsX2RpcnR5X2xvZyhsaWJ4bF9fZ2MgKmdjLCBpbnQgZG9taWQsIGJvb2wgZW5hYmxlKQog
ewogICAgIGxpYnhsX19qc29uX29iamVjdCAqYXJncyA9IE5VTEw7CiAKLSAgICBxbXBfcGFyYW1l
dGVyc19hZGRfYm9vbChnYywgJmFyZ3MsICJlbmFibGUiLCBlbmFibGUpOworICAgIGxpYnhsX19x
bXBfcGFyYW1fYWRkX2Jvb2woZ2MsICZhcmdzLCAiZW5hYmxlIiwgZW5hYmxlKTsKIAogICAgIHJl
dHVybiBxbXBfcnVuX2NvbW1hbmQoZ2MsIGRvbWlkLCAieGVuLXNldC1nbG9iYWwtZGlydHktbG9n
IiwgYXJncywKICAgICAgICAgICAgICAgICAgICAgICAgICAgIE5VTEwsIE5VTEwpOwpAQCAtMTEz
Miw4ICsxMTI5LDggQEAgaW50IGxpYnhsX19xbXBfaW5zZXJ0X2Nkcm9tKGxpYnhsX19nYyAqZ2Ms
IGludCBkb21pZCwKICAgICBpZiAoZGlzay0+Zm9ybWF0ID09IExJQlhMX0RJU0tfRk9STUFUX0VN
UFRZKSB7CiAgICAgICAgIHJldHVybiBxbXBfcnVuX2NvbW1hbmQoZ2MsIGRvbWlkLCAiZWplY3Qi
LCBhcmdzLCBOVUxMLCBOVUxMKTsKICAgICB9IGVsc2UgewotICAgICAgICBxbXBfcGFyYW1ldGVy
c19hZGRfc3RyaW5nKGdjLCAmYXJncywgInRhcmdldCIsIGRpc2stPnBkZXZfcGF0aCk7Ci0gICAg
ICAgIHFtcF9wYXJhbWV0ZXJzX2FkZF9zdHJpbmcoZ2MsICZhcmdzLCAiYXJnIiwKKyAgICAgICAg
bGlieGxfX3FtcF9wYXJhbV9hZGRfc3RyaW5nKGdjLCAmYXJncywgInRhcmdldCIsIGRpc2stPnBk
ZXZfcGF0aCk7CisgICAgICAgIGxpYnhsX19xbXBfcGFyYW1fYWRkX3N0cmluZyhnYywgJmFyZ3Ms
ICJhcmciLAogICAgICAgICAgICAgbGlieGxfX3FlbXVfZGlza19mb3JtYXRfc3RyaW5nKGRpc2st
PmZvcm1hdCkpOwogICAgICAgICByZXR1cm4gcW1wX3J1bl9jb21tYW5kKGdjLCBkb21pZCwgImNo
YW5nZSIsIGFyZ3MsIE5VTEwsIE5VTEwpOwogICAgIH0KQEAgLTExNDMsNyArMTE0MCw3IEBAIGlu
dCBsaWJ4bF9fcW1wX2NwdV9hZGQobGlieGxfX2djICpnYywgaW50IGRvbWlkLCBpbnQgaWR4KQog
ewogICAgIGxpYnhsX19qc29uX29iamVjdCAqYXJncyA9IE5VTEw7CiAKLSAgICBxbXBfcGFyYW1l
dGVyc19hZGRfaW50ZWdlcihnYywgJmFyZ3MsICJpZCIsIGlkeCk7CisgICAgbGlieGxfX3FtcF9w
YXJhbV9hZGRfaW50ZWdlcihnYywgJmFyZ3MsICJpZCIsIGlkeCk7CiAKICAgICByZXR1cm4gcW1w
X3J1bl9jb21tYW5kKGdjLCBkb21pZCwgImNwdS1hZGQiLCBhcmdzLCBOVUxMLCBOVUxMKTsKIH0K
QEAgLTEyMDEsMTAgKzExOTgsMTAgQEAgaW50IGxpYnhsX19xbXBfbmJkX3NlcnZlcl9zdGFydChs
aWJ4bF9fZ2MgKmdjLCBpbnQgZG9taWQsCiAgICAgICogICB9CiAgICAgICogfQogICAgICAqLwot
ICAgIHFtcF9wYXJhbWV0ZXJzX2FkZF9zdHJpbmcoZ2MsICZkYXRhLCAiaG9zdCIsIGhvc3QpOwot
ICAgIHFtcF9wYXJhbWV0ZXJzX2FkZF9zdHJpbmcoZ2MsICZkYXRhLCAicG9ydCIsIHBvcnQpOwor
ICAgIGxpYnhsX19xbXBfcGFyYW1fYWRkX3N0cmluZyhnYywgJmRhdGEsICJob3N0IiwgaG9zdCk7
CisgICAgbGlieGxfX3FtcF9wYXJhbV9hZGRfc3RyaW5nKGdjLCAmZGF0YSwgInBvcnQiLCBwb3J0
KTsKIAotICAgIHFtcF9wYXJhbWV0ZXJzX2FkZF9zdHJpbmcoZ2MsICZhZGRyLCAidHlwZSIsICJp
bmV0Iik7CisgICAgbGlieGxfX3FtcF9wYXJhbV9hZGRfc3RyaW5nKGdjLCAmYWRkciwgInR5cGUi
LCAiaW5ldCIpOwogICAgIHFtcF9wYXJhbWV0ZXJzX2NvbW1vbl9hZGQoZ2MsICZhZGRyLCAiZGF0
YSIsIGRhdGEpOwogCiAgICAgcW1wX3BhcmFtZXRlcnNfY29tbW9uX2FkZChnYywgJmFyZ3MsICJh
ZGRyIiwgYWRkcik7CkBAIC0xMjE2LDggKzEyMTMsOCBAQCBpbnQgbGlieGxfX3FtcF9uYmRfc2Vy
dmVyX2FkZChsaWJ4bF9fZ2MgKmdjLCBpbnQgZG9taWQsIGNvbnN0IGNoYXIgKmRpc2spCiB7CiAg
ICAgbGlieGxfX2pzb25fb2JqZWN0ICphcmdzID0gTlVMTDsKIAotICAgIHFtcF9wYXJhbWV0ZXJz
X2FkZF9zdHJpbmcoZ2MsICZhcmdzLCAiZGV2aWNlIiwgZGlzayk7Ci0gICAgcW1wX3BhcmFtZXRl
cnNfYWRkX2Jvb2woZ2MsICZhcmdzLCAid3JpdGFibGUiLCB0cnVlKTsKKyAgICBsaWJ4bF9fcW1w
X3BhcmFtX2FkZF9zdHJpbmcoZ2MsICZhcmdzLCAiZGV2aWNlIiwgZGlzayk7CisgICAgbGlieGxf
X3FtcF9wYXJhbV9hZGRfYm9vbChnYywgJmFyZ3MsICJ3cml0YWJsZSIsIHRydWUpOwogCiAgICAg
cmV0dXJuIHFtcF9ydW5fY29tbWFuZChnYywgZG9taWQsICJuYmQtc2VydmVyLWFkZCIsIGFyZ3Ms
IE5VTEwsIE5VTEwpOwogfQpAQCAtMTIyNiw4ICsxMjIzLDggQEAgaW50IGxpYnhsX19xbXBfc3Rh
cnRfcmVwbGljYXRpb24obGlieGxfX2djICpnYywgaW50IGRvbWlkLCBib29sIHByaW1hcnkpCiB7
CiAgICAgbGlieGxfX2pzb25fb2JqZWN0ICphcmdzID0gTlVMTDsKIAotICAgIHFtcF9wYXJhbWV0
ZXJzX2FkZF9ib29sKGdjLCAmYXJncywgImVuYWJsZSIsIHRydWUpOwotICAgIHFtcF9wYXJhbWV0
ZXJzX2FkZF9ib29sKGdjLCAmYXJncywgInByaW1hcnkiLCBwcmltYXJ5KTsKKyAgICBsaWJ4bF9f
cW1wX3BhcmFtX2FkZF9ib29sKGdjLCAmYXJncywgImVuYWJsZSIsIHRydWUpOworICAgIGxpYnhs
X19xbXBfcGFyYW1fYWRkX2Jvb2woZ2MsICZhcmdzLCAicHJpbWFyeSIsIHByaW1hcnkpOwogCiAg
ICAgcmV0dXJuIHFtcF9ydW5fY29tbWFuZChnYywgZG9taWQsICJ4ZW4tc2V0LXJlcGxpY2F0aW9u
IiwgYXJncywgTlVMTCwgTlVMTCk7CiB9CkBAIC0xMjQ4LDggKzEyNDUsOCBAQCBpbnQgbGlieGxf
X3FtcF9zdG9wX3JlcGxpY2F0aW9uKGxpYnhsX19nYyAqZ2MsIGludCBkb21pZCwgYm9vbCBwcmlt
YXJ5KQogewogICAgIGxpYnhsX19qc29uX29iamVjdCAqYXJncyA9IE5VTEw7CiAKLSAgICBxbXBf
cGFyYW1ldGVyc19hZGRfYm9vbChnYywgJmFyZ3MsICJlbmFibGUiLCBmYWxzZSk7Ci0gICAgcW1w
X3BhcmFtZXRlcnNfYWRkX2Jvb2woZ2MsICZhcmdzLCAicHJpbWFyeSIsIHByaW1hcnkpOworICAg
IGxpYnhsX19xbXBfcGFyYW1fYWRkX2Jvb2woZ2MsICZhcmdzLCAiZW5hYmxlIiwgZmFsc2UpOwor
ICAgIGxpYnhsX19xbXBfcGFyYW1fYWRkX2Jvb2woZ2MsICZhcmdzLCAicHJpbWFyeSIsIHByaW1h
cnkpOwogCiAgICAgcmV0dXJuIHFtcF9ydW5fY29tbWFuZChnYywgZG9taWQsICJ4ZW4tc2V0LXJl
cGxpY2F0aW9uIiwgYXJncywgTlVMTCwgTlVMTCk7CiB9CkBAIC0xMjY0LDExICsxMjYxLDExIEBA
IGludCBsaWJ4bF9fcW1wX3hfYmxvY2tkZXZfY2hhbmdlKGxpYnhsX19nYyAqZ2MsIGludCBkb21p
ZCwgY29uc3QgY2hhciAqcGFyZW50LAogewogICAgIGxpYnhsX19qc29uX29iamVjdCAqYXJncyA9
IE5VTEw7CiAKLSAgICBxbXBfcGFyYW1ldGVyc19hZGRfc3RyaW5nKGdjLCAmYXJncywgInBhcmVu
dCIsIHBhcmVudCk7CisgICAgbGlieGxfX3FtcF9wYXJhbV9hZGRfc3RyaW5nKGdjLCAmYXJncywg
InBhcmVudCIsIHBhcmVudCk7CiAgICAgaWYgKGNoaWxkKQotICAgICAgICBxbXBfcGFyYW1ldGVy
c19hZGRfc3RyaW5nKGdjLCAmYXJncywgImNoaWxkIiwgY2hpbGQpOworICAgICAgICBsaWJ4bF9f
cW1wX3BhcmFtX2FkZF9zdHJpbmcoZ2MsICZhcmdzLCAiY2hpbGQiLCBjaGlsZCk7CiAgICAgaWYg
KG5vZGUpCi0gICAgICAgIHFtcF9wYXJhbWV0ZXJzX2FkZF9zdHJpbmcoZ2MsICZhcmdzLCAibm9k
ZSIsIG5vZGUpOworICAgICAgICBsaWJ4bF9fcW1wX3BhcmFtX2FkZF9zdHJpbmcoZ2MsICZhcmdz
LCAibm9kZSIsIG5vZGUpOwogCiAgICAgcmV0dXJuIHFtcF9ydW5fY29tbWFuZChnYywgZG9taWQs
ICJ4LWJsb2NrZGV2LWNoYW5nZSIsIGFyZ3MsIE5VTEwsIE5VTEwpOwogfQpAQCAtMTMwNSw3ICsx
MzAyLDcgQEAgaW50IGxpYnhsX19xbXBfaG1wKGxpYnhsX19nYyAqZ2MsIGludCBkb21pZCwgY29u
c3QgY2hhciAqY29tbWFuZF9saW5lLAogewogICAgIGxpYnhsX19qc29uX29iamVjdCAqYXJncyA9
IE5VTEw7CiAKLSAgICBxbXBfcGFyYW1ldGVyc19hZGRfc3RyaW5nKGdjLCAmYXJncywgImNvbW1h
bmQtbGluZSIsIGNvbW1hbmRfbGluZSk7CisgICAgbGlieGxfX3FtcF9wYXJhbV9hZGRfc3RyaW5n
KGdjLCAmYXJncywgImNvbW1hbmQtbGluZSIsIGNvbW1hbmRfbGluZSk7CiAKICAgICByZXR1cm4g
cW1wX3J1bl9jb21tYW5kKGdjLCBkb21pZCwgImh1bWFuLW1vbml0b3ItY29tbWFuZCIsIGFyZ3Ms
CiAgICAgICAgICAgICAgICAgICAgICAgICAgICBobXBfY2FsbGJhY2ssIG91dHB1dCk7CkBAIC0x
NDQyLDcgKzE0MzksNyBAQCBzdGF0aWMgdm9pZCBkbV9zdGF0ZV9mZF9yZWFkeShsaWJ4bF9fZWdj
ICplZ2MsIGxpYnhsX19ldl9xbXAgKmV2LAogICAgICAqIHRoZSBzYXZlIG9wZXJhdGlvbiBpcyBm
b3IgYSBsaXZlIG1pZ3JhdGlvbiByYXRoZXIgdGhhbiBmb3IgdGFraW5nIGEKICAgICAgKiBzbmFw
c2hvdC4gKi8KICAgICBpZiAocW1wX2V2X3FlbXVfY29tcGFyZV92ZXJzaW9uKGV2LCAyLCAxMSwg
MCkgPj0gMCkKLSAgICAgICAgcW1wX3BhcmFtZXRlcnNfYWRkX2Jvb2woZ2MsICZhcmdzLCAibGl2
ZSIsIGRzcHMtPmxpdmUpOworICAgICAgICBsaWJ4bF9fcW1wX3BhcmFtX2FkZF9ib29sKGdjLCAm
YXJncywgImxpdmUiLCBkc3BzLT5saXZlKTsKICAgICBRTVBfUEFSQU1FVEVSU19TUFJJTlRGKCZh
cmdzLCAiZmlsZW5hbWUiLCAiL2Rldi9mZHNldC8lZCIsIGZkc2V0KTsKICAgICByYyA9IGxpYnhs
X19ldl9xbXBfc2VuZChnYywgZXYsICJ4ZW4tc2F2ZS1kZXZpY2VzLXN0YXRlIiwgYXJncyk7CiAg
ICAgaWYgKHJjKQotLSAKQW50aG9ueSBQRVJBUkQKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
