Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 492E710D3B1
	for <lists+xen-devel@lfdr.de>; Fri, 29 Nov 2019 11:10:05 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iadAU-0007Qt-1Q; Fri, 29 Nov 2019 10:06:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=A/8y=ZV=linux.intel.com=yi.y.sun@srs-us1.protection.inumbo.net>)
 id 1iadAS-0007Qo-Bi
 for xen-devel@lists.xenproject.org; Fri, 29 Nov 2019 10:06:28 +0000
X-Inumbo-ID: e6865dcb-128f-11ea-a3e0-12813bfff9fa
Received: from mga07.intel.com (unknown [134.134.136.100])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e6865dcb-128f-11ea-a3e0-12813bfff9fa;
 Fri, 29 Nov 2019 10:06:26 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Nov 2019 02:06:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,257,1571727600"; d="scan'208";a="217759365"
Received: from yisun1-ubuntu2.bj.intel.com ([10.238.144.114])
 by fmsmga001.fm.intel.com with ESMTP; 29 Nov 2019 02:06:23 -0800
From: Yi Sun <yi.y.sun@linux.intel.com>
To: xen-devel@lists.xenproject.org
Date: Fri, 29 Nov 2019 18:01:38 +0800
Message-Id: <1575021698-10589-1-git-send-email-yi.y.sun@linux.intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [Xen-devel] [PATCH v3] psr: fix bug which may cause crash
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
Lnkuc3VuQGxpbnV4LmludGVsLmNvbT4KLS0tCiB4ZW4vYXJjaC94ODYvcHNyLmMgfCA4ICsrKysr
KystCiAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZm
IC0tZ2l0IGEveGVuL2FyY2gveDg2L3Bzci5jIGIveGVuL2FyY2gveDg2L3Bzci5jCmluZGV4IDU4
NjZhMjYuLjk0M2ExZTAgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9wc3IuYworKysgYi94ZW4v
YXJjaC94ODYvcHNyLmMKQEAgLTEyNzEsNyArMTI3MSwxMyBAQCBzdGF0aWMgdm9pZCBkb193cml0
ZV9wc3JfbXNycyh2b2lkICpkYXRhKQogCiAgICAgICAgIGZvciAoIGogPSAwOyBqIDwgY29zX251
bTsgaisrLCBpbmRleCsrICkKICAgICAgICAgewotICAgICAgICAgICAgaWYgKCBmZWF0LT5jb3Nf
cmVnX3ZhbFtjb3MgKiBjb3NfbnVtICsgal0gIT0gaW5mby0+dmFsW2luZGV4XSApCisgICAgICAg
ICAgICAvKgorICAgICAgICAgICAgICogTXVsdGlwbGUgUkRUIGZlYXR1cmVzIG1heSBjby1leGlz
dCBhbmQgdGhlaXIgQ09TX01BWCBtYXkgYmUKKyAgICAgICAgICAgICAqIGRpZmZlcmVudC4gU28g
d2Ugc2hvdWxkIHByZXZlbnQgb25lIGZlYXR1cmUgdG8gd3JpdGUgQ09TCisgICAgICAgICAgICAg
KiByZWdpc3RlciB3aGljaCBleGNlZWRzIGl0cyBDT1NfTUFYLiBPdGhlcndpc2UsIHBhbmljIG1h
eSBoYXBwZW4uCisgICAgICAgICAgICAgKi8KKyAgICAgICAgICAgIGlmICggY29zIDw9IGZlYXQt
PmNvc19tYXggJiYKKyAgICAgICAgICAgICAgICAgZmVhdC0+Y29zX3JlZ192YWxbY29zICogY29z
X251bSArIGpdICE9IGluZm8tPnZhbFtpbmRleF0gKQogICAgICAgICAgICAgewogICAgICAgICAg
ICAgICAgIGZlYXQtPmNvc19yZWdfdmFsW2NvcyAqIGNvc19udW0gKyBqXSA9IGluZm8tPnZhbFtp
bmRleF07CiAgICAgICAgICAgICAgICAgcHJvcHMtPndyaXRlX21zcihjb3MsIGluZm8tPnZhbFtp
bmRleF0sIHByb3BzLT50eXBlW2pdKTsKLS0gCjEuOS4xCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
