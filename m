Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F77F10E661
	for <lists+xen-devel@lfdr.de>; Mon,  2 Dec 2019 08:33:55 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ibg9O-00083G-4h; Mon, 02 Dec 2019 07:29:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=mzKR=ZY=linux.intel.com=yi.y.sun@srs-us1.protection.inumbo.net>)
 id 1ibg9M-00083B-8a
 for xen-devel@lists.xenproject.org; Mon, 02 Dec 2019 07:29:40 +0000
X-Inumbo-ID: 7eeb7428-14d5-11ea-a406-12813bfff9fa
Received: from mga04.intel.com (unknown [192.55.52.120])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7eeb7428-14d5-11ea-a406-12813bfff9fa;
 Mon, 02 Dec 2019 07:29:38 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 01 Dec 2019 23:29:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,268,1571727600"; d="scan'208";a="218300335"
Received: from yisun1-ubuntu2.bj.intel.com ([10.238.144.114])
 by fmsmga001.fm.intel.com with ESMTP; 01 Dec 2019 23:29:36 -0800
From: Yi Sun <yi.y.sun@linux.intel.com>
To: xen-devel@lists.xenproject.org
Date: Mon,  2 Dec 2019 15:24:48 +0800
Message-Id: <1575271488-12126-1-git-send-email-yi.y.sun@linux.intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [Xen-devel] [PATCH v4] psr: fix bug which may cause crash
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
MDBdCihYRU4pICoqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioKClRoZSBi
dWcgaGFwcGVucyB3aGVuIENEUCBhbmQgTUJBIGNvLWV4aXN0IGFuZCBNQkEgQ09TX01BWCBpcyBi
aWdnZXIKdGhhbiBDRFAgQ09TX01BWC4gRS5nLiBNQkEgaGFzIDggQ09TIHJlZ2lzdGVycyBidXQg
Q0RQIG9ubHkgaGF2ZSA2LgpXaGVuIHNldHRpbmcgTUJBIHRocm90dGxpbmcgdmFsdWUgZm9yIHRo
ZSA3dGggZ3Vlc3QsIHRoZSB2YWx1ZSBhcnJheQp3b3VsZCBiZToKICAgICstLS0tLS0tLS0tLS0t
LS0tLS0rLS0tLS0tLS0tLS0tLS0tLS0tKy0tLS0tLS0tLS0tLS0tKwogICAgfCBEYXRhIGRlZmF1
bHQgdmFsIHwgQ29kZSBkZWZhdWx0IHZhbCB8IE1CQSB0aHJvdHRsZSB8CiAgICArLS0tLS0tLS0t
LS0tLS0tLS0tKy0tLS0tLS0tLS0tLS0tLS0tLSstLS0tLS0tLS0tLS0tLSsKClRoZW4sIENPUyBp
ZCA3IHdpbGwgYmUgc2VsZWN0ZWQgZm9yIHdyaXR0aW5nIHRoZSB2YWx1ZXMuIFdlIHNob3VsZAph
dm9pZCB3cml0dGluZyBDRFAgZGF0YS9jb2RlIHZhbHVsZXMgdG8gQ09TIGlkIDcgTVNSIGJlY2F1
c2UgaXQKZXhjZWVkcyB0aGUgQ0RQIENPU19NQVguCgpTaWduZWQtb2ZmLWJ5OiBZaSBTdW4gPHlp
Lnkuc3VuQGxpbnV4LmludGVsLmNvbT4KLS0tCiB4ZW4vYXJjaC94ODYvcHNyLmMgfCAxMSArKysr
KysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS94
ZW4vYXJjaC94ODYvcHNyLmMgYi94ZW4vYXJjaC94ODYvcHNyLmMKaW5kZXggNTg2NmEyNi4uOGJm
MWMyMyAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L3Bzci5jCisrKyBiL3hlbi9hcmNoL3g4Ni9w
c3IuYwpAQCAtMTI2OSw2ICsxMjY5LDE3IEBAIHN0YXRpYyB2b2lkIGRvX3dyaXRlX3Bzcl9tc3Jz
KHZvaWQgKmRhdGEpCiAgICAgICAgIGNvc19udW0gPSBwcm9wcy0+Y29zX251bTsKICAgICAgICAg
QVNTRVJUKGluZm8tPmFycmF5X2xlbiA+PSBpbmRleCArIGNvc19udW0pOwogCisgICAgICAgIC8q
CisgICAgICAgICAqIE11bHRpcGxlIFJEVCBmZWF0dXJlcyBtYXkgY28tZXhpc3QgYW5kIHRoZWly
IENPU19NQVggbWF5IGJlCisgICAgICAgICAqIGRpZmZlcmVudC4gU28gd2Ugc2hvdWxkIHByZXZl
bnQgb25lIGZlYXR1cmUgdG8gd3JpdGUgQ09TCisgICAgICAgICAqIHJlZ2lzdGVyIHdoaWNoIGV4
Y2VlZHMgaXRzIENPU19NQVguCisgICAgICAgICAqLworICAgICAgICBpZiAoIGNvcyA+IGZlYXQt
PmNvc19tYXggKQorICAgICAgICB7CisgICAgICAgICAgICBpbmRleCArPSBjb3NfbnVtOworICAg
ICAgICAgICAgY29udGludWU7CisgICAgICAgIH0KKwogICAgICAgICBmb3IgKCBqID0gMDsgaiA8
IGNvc19udW07IGorKywgaW5kZXgrKyApCiAgICAgICAgIHsKICAgICAgICAgICAgIGlmICggZmVh
dC0+Y29zX3JlZ192YWxbY29zICogY29zX251bSArIGpdICE9IGluZm8tPnZhbFtpbmRleF0gKQot
LSAKMS45LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
