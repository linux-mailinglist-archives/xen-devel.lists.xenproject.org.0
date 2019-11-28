Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ECE210C696
	for <lists+xen-devel@lfdr.de>; Thu, 28 Nov 2019 11:25:29 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iaGwn-0007Uc-Az; Thu, 28 Nov 2019 10:22:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ofoG=ZU=linux.intel.com=yi.y.sun@srs-us1.protection.inumbo.net>)
 id 1iaGwm-0007UT-Dn
 for xen-devel@lists.xenproject.org; Thu, 28 Nov 2019 10:22:52 +0000
X-Inumbo-ID: 07c6ff48-11c9-11ea-b155-bc764e2007e4
Received: from mga12.intel.com (unknown [192.55.52.136])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 07c6ff48-11c9-11ea-b155-bc764e2007e4;
 Thu, 28 Nov 2019 10:22:51 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Nov 2019 02:22:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,253,1571727600"; d="scan'208";a="292341524"
Received: from yisun1-ubuntu2.bj.intel.com ([10.238.144.121])
 by orsmga001.jf.intel.com with ESMTP; 28 Nov 2019 02:22:48 -0800
From: Yi Sun <yi.y.sun@linux.intel.com>
To: xen-devel@lists.xenproject.org
Date: Thu, 28 Nov 2019 18:18:04 +0800
Message-Id: <1574936284-5139-1-git-send-email-yi.y.sun@linux.intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [Xen-devel] [PATCH v2] psr: fix bug which may cause crash
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
Lnkuc3VuQGxpbnV4LmludGVsLmNvbT4KLS0tCiB4ZW4vYXJjaC94ODYvcHNyLmMgfCAzICsrLQog
MSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdp
dCBhL3hlbi9hcmNoL3g4Ni9wc3IuYyBiL3hlbi9hcmNoL3g4Ni9wc3IuYwppbmRleCA1ODY2YTI2
Li5lY2NhNWI0IDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvcHNyLmMKKysrIGIveGVuL2FyY2gv
eDg2L3Bzci5jCkBAIC0xMjcxLDcgKzEyNzEsOCBAQCBzdGF0aWMgdm9pZCBkb193cml0ZV9wc3Jf
bXNycyh2b2lkICpkYXRhKQogCiAgICAgICAgIGZvciAoIGogPSAwOyBqIDwgY29zX251bTsgaisr
LCBpbmRleCsrICkKICAgICAgICAgewotICAgICAgICAgICAgaWYgKCBmZWF0LT5jb3NfcmVnX3Zh
bFtjb3MgKiBjb3NfbnVtICsgal0gIT0gaW5mby0+dmFsW2luZGV4XSApCisgICAgICAgICAgICBp
ZiAoIGNvcyA8PSBmZWF0LT5jb3NfbWF4ICYmCisgICAgICAgICAgICAgICAgIGZlYXQtPmNvc19y
ZWdfdmFsW2NvcyAqIGNvc19udW0gKyBqXSAhPSBpbmZvLT52YWxbaW5kZXhdICkKICAgICAgICAg
ICAgIHsKICAgICAgICAgICAgICAgICBmZWF0LT5jb3NfcmVnX3ZhbFtjb3MgKiBjb3NfbnVtICsg
al0gPSBpbmZvLT52YWxbaW5kZXhdOwogICAgICAgICAgICAgICAgIHByb3BzLT53cml0ZV9tc3Io
Y29zLCBpbmZvLT52YWxbaW5kZXhdLCBwcm9wcy0+dHlwZVtqXSk7Ci0tIAoxLjkuMQoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
