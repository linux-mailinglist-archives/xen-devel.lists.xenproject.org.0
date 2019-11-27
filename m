Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FF1C10AAAE
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2019 07:32:13 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZqpG-00014e-Ou; Wed, 27 Nov 2019 06:29:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=JXTx=ZT=linux.intel.com=yi.y.sun@srs-us1.protection.inumbo.net>)
 id 1iZqpF-00014Z-Kh
 for xen-devel@lists.xenproject.org; Wed, 27 Nov 2019 06:29:21 +0000
X-Inumbo-ID: 3e56fe5e-10df-11ea-b155-bc764e2007e4
Received: from mga03.intel.com (unknown [134.134.136.65])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3e56fe5e-10df-11ea-b155-bc764e2007e4;
 Wed, 27 Nov 2019 06:29:20 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Nov 2019 22:29:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,248,1571727600"; d="scan'208";a="220875231"
Received: from yisun1-ubuntu2.bj.intel.com ([10.238.144.121])
 by orsmga002.jf.intel.com with ESMTP; 26 Nov 2019 22:29:17 -0800
From: Yi Sun <yi.y.sun@linux.intel.com>
To: xen-devel@lists.xenproject.org
Date: Wed, 27 Nov 2019 14:24:31 +0800
Message-Id: <1574835871-5005-1-git-send-email-yi.y.sun@linux.intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [Xen-devel] [PATCH v1] psr: fix bug which may cause crash
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
Cc: andrew.cooper3@citrix.com, Yi Sun <yi.y.sun@linux.intel.com>,
 jbeulich@suse.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RHVyaW5nIHRlc3QsIHdlIGZvdW5kIGEgY3Jhc2ggb24gWGVuIHdpdGggYmVsb3cgdHJhY2UuCihY
RU4pIFhlbiBjYWxsIHRyYWNlOgooWEVOKSAgICBbPGZmZmY4MmQwODAyYTA2NWE+XSBSIHBzci5j
I2wzX2NkcF93cml0ZV9tc3IrMHgxZS8weDIyCihYRU4pICAgIFs8ZmZmZjgyZDA4MDJhMDg1OD5d
IEYgcHNyLmMjZG9fd3JpdGVfcHNyX21zcnMrMHg2ZC8weDEwOQooWEVOKSAgICBbPGZmZmY4MmQw
ODAyM2UwMDA+XSBGIHNtcF9jYWxsX2Z1bmN0aW9uX2ludGVycnVwdCsweDVhLzB4YWMKKFhFTikg
ICAgWzxmZmZmODJkMDgwMmEyYjg5Pl0gRiBjYWxsX2Z1bmN0aW9uX2ludGVycnVwdCsweDIwLzB4
MzQKKFhFTikgICAgWzxmZmZmODJkMDgwMjgyYzY0Pl0gRiBkb19JUlErMHgxNzUvMHg2YWUKKFhF
TikgICAgWzxmZmZmODJkMDgwMzhiOGJhPl0gRiBjb21tb25faW50ZXJydXB0KzB4MTBhLzB4MTIw
CihYRU4pICAgIFs8ZmZmZjgyZDA4MDJlYzYxNj5dIEYgY3B1X2lkbGUuYyNhY3BpX2lkbGVfZG9f
ZW50cnkrMHg5ZC8weGIxCihYRU4pICAgIFs8ZmZmZjgyZDA4MDJlY2MwMT5dIEYgY3B1X2lkbGUu
YyNhY3BpX3Byb2Nlc3Nvcl9pZGxlKzB4NDFkLzB4NjI2CihYRU4pICAgIFs8ZmZmZjgyZDA4MDI3
MzUzYj5dIEYgZG9tYWluLmMjaWRsZV9sb29wKzB4YTUvMHhhNwooWEVOKQooWEVOKQooWEVOKSAq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqCihYRU4pIFBhbmljIG9uIENQ
VSAyMDoKKFhFTikgR0VORVJBTCBQUk9URUNUSU9OIEZBVUxUCihYRU4pIFtlcnJvcl9jb2RlPTAw
MDBdCihYRU4pICoqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioKClJvb3Qg
Y2F1c2UgaXMgdGhhdCB0aGUgY2FjaGUgb2YgQ09TIHJlZ2lzdGVycyBhcmUgbm90IGluaXRpYWxp
emVkCmZvciBDQVQvQ0RQIHdoaWNoIGhhdmUgbm9uLXplcm8gZGVmYXVsdCB2YWx1ZS4gVGhhdCBj
YXVzZXMgaW52YWxpZAp3cml0ZSB0byBNU1Igd2hlbiBDT1MgaWQgaGFzIGV4Y2VlZGVkIHRoZSBt
YXggbnVtYmVyLi4gU28gZml4IGl0IGJ5CmluaXRpYWxpemluZyB0aGUgY2FjaGUuCgpTaWduZWQt
b2ZmLWJ5OiBZaSBTdW4gPHlpLnkuc3VuQGxpbnV4LmludGVsLmNvbT4KLS0tCiB4ZW4vYXJjaC94
ODYvcHNyLmMgfCAxMSArKysrKysrKy0tLQogMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygr
KSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvcHNyLmMgYi94ZW4v
YXJjaC94ODYvcHNyLmMKaW5kZXggNTg2NmEyNi4uZDNlNzQ2NyAxMDA2NDQKLS0tIGEveGVuL2Fy
Y2gveDg2L3Bzci5jCisrKyBiL3hlbi9hcmNoL3g4Ni9wc3IuYwpAQCAtMzE2LDYgKzMxNiw3IEBA
IHN0YXRpYyBib29sIGNhdF9pbml0X2ZlYXR1cmUoY29uc3Qgc3RydWN0IGNwdWlkX2xlYWYgKnJl
Z3MsCiAgICAgICAgIFtGRUFUX1RZUEVfTDNfQ0RQXSA9ICJMMyBDRFAiLAogICAgICAgICBbRkVB
VF9UWVBFX0wyX0NBVF0gPSAiTDIgQ0FUIiwKICAgICB9OworICAgIHVuc2lnbmVkIGludCBpID0g
MDsKIAogICAgIC8qIE5vIHZhbGlkIHZhbHVlIHNvIGRvIG5vdCBlbmFibGUgZmVhdHVyZS4gKi8K
ICAgICBpZiAoICFyZWdzLT5hIHx8ICFyZWdzLT5kICkKQEAgLTMzMiw3ICszMzMsOCBAQCBzdGF0
aWMgYm9vbCBjYXRfaW5pdF9mZWF0dXJlKGNvbnN0IHN0cnVjdCBjcHVpZF9sZWFmICpyZWdzLAog
ICAgICAgICAgICAgcmV0dXJuIGZhbHNlOwogCiAgICAgICAgIC8qIFdlIHJlc2VydmUgY29zPTAg
YXMgZGVmYXVsdCBjYm0gKGFsbCBiaXRzIHdpdGhpbiBjYm1fbGVuIGFyZSAxKS4gKi8KLSAgICAg
ICAgZmVhdC0+Y29zX3JlZ192YWxbMF0gPSBjYXRfZGVmYXVsdF92YWwoZmVhdC0+Y2F0LmNibV9s
ZW4pOworICAgICAgICBmb3IoaSA9IDA7IGkgPCBNQVhfQ09TX1JFR19DTlQ7IGkrKykKKyAgICAg
ICAgICAgIGZlYXQtPmNvc19yZWdfdmFsW2ldID0gY2F0X2RlZmF1bHRfdmFsKGZlYXQtPmNhdC5j
Ym1fbGVuKTsKIAogICAgICAgICB3cm1zcmwoKHR5cGUgPT0gRkVBVF9UWVBFX0wzX0NBVCA/CiAg
ICAgICAgICAgICAgICAgTVNSX0lBMzJfUFNSX0wzX01BU0soMCkgOgpAQCAtMzUyLDggKzM1NCwx
MSBAQCBzdGF0aWMgYm9vbCBjYXRfaW5pdF9mZWF0dXJlKGNvbnN0IHN0cnVjdCBjcHVpZF9sZWFm
ICpyZWdzLAogICAgICAgICBmZWF0LT5jb3NfbWF4ID0gKGZlYXQtPmNvc19tYXggLSAxKSA+PiAx
OwogCiAgICAgICAgIC8qIFdlIHJlc2VydmUgY29zPTAgYXMgZGVmYXVsdCBjYm0gKGFsbCBiaXRz
IHdpdGhpbiBjYm1fbGVuIGFyZSAxKS4gKi8KLSAgICAgICAgZ2V0X2NkcF9jb2RlKGZlYXQsIDAp
ID0gY2F0X2RlZmF1bHRfdmFsKGZlYXQtPmNhdC5jYm1fbGVuKTsKLSAgICAgICAgZ2V0X2NkcF9k
YXRhKGZlYXQsIDApID0gY2F0X2RlZmF1bHRfdmFsKGZlYXQtPmNhdC5jYm1fbGVuKTsKKyAgICAg
ICAgZm9yKGkgPSAwOyBpIDwgTUFYX0NPU19SRUdfQ05ULzI7IGkrKykKKyAgICAgICAgeworICAg
ICAgICAgICAgZ2V0X2NkcF9jb2RlKGZlYXQsIGkpID0gY2F0X2RlZmF1bHRfdmFsKGZlYXQtPmNh
dC5jYm1fbGVuKTsKKyAgICAgICAgICAgIGdldF9jZHBfZGF0YShmZWF0LCBpKSA9IGNhdF9kZWZh
dWx0X3ZhbChmZWF0LT5jYXQuY2JtX2xlbik7CisgICAgICAgIH0KIAogICAgICAgICB3cm1zcmwo
TVNSX0lBMzJfUFNSX0wzX01BU0soMCksIGNhdF9kZWZhdWx0X3ZhbChmZWF0LT5jYXQuY2JtX2xl
bikpOwogICAgICAgICB3cm1zcmwoTVNSX0lBMzJfUFNSX0wzX01BU0soMSksIGNhdF9kZWZhdWx0
X3ZhbChmZWF0LT5jYXQuY2JtX2xlbikpOwotLSAKMS45LjEKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
