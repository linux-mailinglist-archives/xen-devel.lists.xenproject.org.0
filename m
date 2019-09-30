Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E82DCC1F16
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2019 12:37:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iEt0m-00077h-N7; Mon, 30 Sep 2019 10:34:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Wfc7=XZ=amazon.com=prvs=169663feb=hongyax@srs-us1.protection.inumbo.net>)
 id 1iEt0k-00076Z-Sg
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2019 10:34:34 +0000
X-Inumbo-ID: df2000d2-e36d-11e9-96cc-12813bfff9fa
Received: from smtp-fw-6002.amazon.com (unknown [52.95.49.90])
 by localhost (Halon) with ESMTPS
 id df2000d2-e36d-11e9-96cc-12813bfff9fa;
 Mon, 30 Sep 2019 10:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1569839664; x=1601375664;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=oJedWuo8zlV2fAKG2dDdFVDd+2/P/qJmMMw67NRF0oI=;
 b=mGRMEXPeBq6JMhi6xbZNzHNhngOKswEGilijwn0JUKVxJPV72QIsIHfW
 oizwQtVJmsTfkurUV62QMvADRqkprAq/WMdEYapKA7Sr4SH55CoMptX99
 oDT4wJHNaTndDxxNiadgd5X8baiOPuswW19zoT4qFKuu0gWgwzOPpjloA Q=;
X-IronPort-AV: E=Sophos;i="5.64,565,1559520000"; d="scan'208";a="424630064"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1d-98acfc19.us-east-1.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP;
 30 Sep 2019 10:34:24 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1d-98acfc19.us-east-1.amazon.com (Postfix) with ESMTPS
 id 69BC2A1840; Mon, 30 Sep 2019 10:34:22 +0000 (UTC)
Received: from EX13D10UEE001.ant.amazon.com (10.43.62.201) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 30 Sep 2019 10:34:03 +0000
Received: from EX13MTAUEE001.ant.amazon.com (10.43.62.200) by
 EX13D10UEE001.ant.amazon.com (10.43.62.201) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 30 Sep 2019 10:34:02 +0000
Received: from u9d785c4ba99158.ant.amazon.com (10.125.106.78) by
 mail-relay.amazon.com (10.43.62.226) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Mon, 30 Sep 2019 10:34:02 +0000
From: Hongyan Xia <hongyax@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 30 Sep 2019 11:33:07 +0100
Message-ID: <18d6bbf165484f7e97a03fed849cdca77f2842af.1569833766.git.hongyax@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1569833766.git.hongyax@amazon.com>
References: <cover.1569833766.git.hongyax@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v2 15/55] x86/mm: rewrite virt_to_xen_l1e
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KClJld3JpdGUgdGhpcyBmdW5jdGlv
biB0byB1c2UgbmV3IEFQSXMuIE1vZGlmeSBpdHMgY2FsbGVycyB0byB1bm1hcCB0aGUKcG9pbnRl
ciByZXR1cm5lZC4KClNpZ25lZC1vZmYtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+
Ci0tLQogeGVuL2FyY2gveDg2L2RvbWFpbl9wYWdlLmMgfCAxMCArKysrKystLS0tCiB4ZW4vYXJj
aC94ODYvbW0uYyAgICAgICAgICB8IDMwICsrKysrKysrKysrKysrKysrKysrKysrKystLS0tLQog
MiBmaWxlcyBjaGFuZ2VkLCAzMSBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL3hlbi9hcmNoL3g4Ni9kb21haW5fcGFnZS5jIGIveGVuL2FyY2gveDg2L2RvbWFpbl9w
YWdlLmMKaW5kZXggNGEwN2NmYjE4ZS4uMjQwODNlOWE4NiAxMDA2NDQKLS0tIGEveGVuL2FyY2gv
eDg2L2RvbWFpbl9wYWdlLmMKKysrIGIveGVuL2FyY2gveDg2L2RvbWFpbl9wYWdlLmMKQEAgLTMz
MywyMSArMzMzLDIzIEBAIHZvaWQgdW5tYXBfZG9tYWluX3BhZ2VfZ2xvYmFsKGNvbnN0IHZvaWQg
KnB0cikKIG1mbl90IGRvbWFpbl9wYWdlX21hcF90b19tZm4oY29uc3Qgdm9pZCAqcHRyKQogewog
ICAgIHVuc2lnbmVkIGxvbmcgdmEgPSAodW5zaWduZWQgbG9uZylwdHI7Ci0gICAgY29uc3QgbDFf
cGdlbnRyeV90ICpwbDFlOworICAgIGwxX3BnZW50cnlfdCBsMWU7CiAKICAgICBpZiAoIHZhID49
IERJUkVDVE1BUF9WSVJUX1NUQVJUICkKICAgICAgICAgcmV0dXJuIF9tZm4odmlydF90b19tZm4o
cHRyKSk7CiAKICAgICBpZiAoIHZhID49IFZNQVBfVklSVF9TVEFSVCAmJiB2YSA8IFZNQVBfVklS
VF9FTkQgKQogICAgIHsKLSAgICAgICAgcGwxZSA9IHZpcnRfdG9feGVuX2wxZSh2YSk7CisgICAg
ICAgIGwxX3BnZW50cnlfdCAqcGwxZSA9IHZpcnRfdG9feGVuX2wxZSh2YSk7CiAgICAgICAgIEJV
R19PTighcGwxZSk7CisgICAgICAgIGwxZSA9ICpwbDFlOworICAgICAgICBVTk1BUF9YRU5fUEFH
RVRBQkxFX05FVyhwbDFlKTsKICAgICB9CiAgICAgZWxzZQogICAgIHsKICAgICAgICAgQVNTRVJU
KHZhID49IE1BUENBQ0hFX1ZJUlRfU1RBUlQgJiYgdmEgPCBNQVBDQUNIRV9WSVJUX0VORCk7Ci0g
ICAgICAgIHBsMWUgPSAmX19saW5lYXJfbDFfdGFibGVbbDFfbGluZWFyX29mZnNldCh2YSldOwor
ICAgICAgICBsMWUgPSBfX2xpbmVhcl9sMV90YWJsZVtsMV9saW5lYXJfb2Zmc2V0KHZhKV07CiAg
ICAgfQogCi0gICAgcmV0dXJuIGwxZV9nZXRfbWZuKCpwbDFlKTsKKyAgICByZXR1cm4gbDFlX2dl
dF9tZm4obDFlKTsKIH0KZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9tbS5jIGIveGVuL2FyY2gv
eDg2L21tLmMKaW5kZXggYWQwZDdhMGI4MC4uZjdmZDBlNmJhZCAxMDA2NDQKLS0tIGEveGVuL2Fy
Y2gveDg2L21tLmMKKysrIGIveGVuL2FyY2gveDg2L21tLmMKQEAgLTUwMjQsMjYgKzUwMjQsNDQg
QEAgbDFfcGdlbnRyeV90ICp2aXJ0X3RvX3hlbl9sMWUodW5zaWduZWQgbG9uZyB2KQogICAgIGlm
ICggIShsMmVfZ2V0X2ZsYWdzKCpwbDJlKSAmIF9QQUdFX1BSRVNFTlQpICkKICAgICB7CiAgICAg
ICAgIGJvb2wgbG9ja2luZyA9IHN5c3RlbV9zdGF0ZSA+IFNZU19TVEFURV9ib290OwotICAgICAg
ICBsMV9wZ2VudHJ5X3QgKmwxdCA9IGFsbG9jX3hlbl9wYWdldGFibGUoKTsKKyAgICAgICAgbDFf
cGdlbnRyeV90ICpsMXQ7CisgICAgICAgIG1mbl90IG1mbjsKIAotICAgICAgICBpZiAoICFsMXQg
KQorICAgICAgICBtZm4gPSBhbGxvY194ZW5fcGFnZXRhYmxlX25ldygpOworICAgICAgICBpZiAo
IG1mbl9lcShtZm4sIElOVkFMSURfTUZOKSApCiAgICAgICAgICAgICBnb3RvIG91dDsKKworICAg
ICAgICBsMXQgPSBtYXBfeGVuX3BhZ2V0YWJsZV9uZXcobWZuKTsKKwogICAgICAgICBpZiAoIGxv
Y2tpbmcgKQogICAgICAgICAgICAgc3Bpbl9sb2NrKCZtYXBfcGdkaXJfbG9jayk7CiAgICAgICAg
IGlmICggIShsMmVfZ2V0X2ZsYWdzKCpwbDJlKSAmIF9QQUdFX1BSRVNFTlQpICkKICAgICAgICAg
ewogICAgICAgICAgICAgY2xlYXJfcGFnZShsMXQpOwotICAgICAgICAgICAgbDJlX3dyaXRlKHBs
MmUsIGwyZV9mcm9tX3BhZGRyKF9fcGEobDF0KSwgX19QQUdFX0hZUEVSVklTT1IpKTsKKyAgICAg
ICAgICAgIGwyZV93cml0ZShwbDJlLCBsMmVfZnJvbV9tZm4obWZuLCBfX1BBR0VfSFlQRVJWSVNP
UikpOworICAgICAgICAgICAgcGwxZSA9IGwxdCArIGwxX3RhYmxlX29mZnNldCh2KTsKICAgICAg
ICAgICAgIGwxdCA9IE5VTEw7CiAgICAgICAgIH0KICAgICAgICAgaWYgKCBsb2NraW5nICkKICAg
ICAgICAgICAgIHNwaW5fdW5sb2NrKCZtYXBfcGdkaXJfbG9jayk7CisKICAgICAgICAgaWYgKCBs
MXQgKQotICAgICAgICAgICAgZnJlZV94ZW5fcGFnZXRhYmxlKGwxdCk7CisgICAgICAgIHsKKyAg
ICAgICAgICAgIEFTU0VSVCghcGwxZSk7CisgICAgICAgICAgICBBU1NFUlQoIW1mbl9lcShtZm4s
IElOVkFMSURfTUZOKSk7CisgICAgICAgICAgICBVTk1BUF9YRU5fUEFHRVRBQkxFX05FVyhsMXQp
OworICAgICAgICAgICAgZnJlZV94ZW5fcGFnZXRhYmxlX25ldyhtZm4pOworICAgICAgICB9CiAg
ICAgfQogCiAgICAgQlVHX09OKGwyZV9nZXRfZmxhZ3MoKnBsMmUpICYgX1BBR0VfUFNFKTsKLSAg
ICBwbDFlID0gbDJlX3RvX2wxZSgqcGwyZSkgKyBsMV90YWJsZV9vZmZzZXQodik7CisKKyAgICBp
ZiAoICFwbDFlICkKKyAgICB7CisgICAgICAgIEFTU0VSVChsMmVfZ2V0X2ZsYWdzKCpwbDJlKSAm
IF9QQUdFX1BSRVNFTlQpOworICAgICAgICBwbDFlID0gKGwxX3BnZW50cnlfdCAqKW1hcF94ZW5f
cGFnZXRhYmxlX25ldyhsMmVfZ2V0X21mbigqcGwyZSkpCisgICAgICAgICAgICArIGwxX3RhYmxl
X29mZnNldCh2KTsKKyAgICB9CiAKICBvdXQ6CiAgICAgVU5NQVBfWEVOX1BBR0VUQUJMRV9ORVco
cGwyZSk7CkBAIC01NDQ3LDYgKzU0NjUsNyBAQCBpbnQgbWFwX3BhZ2VzX3RvX3hlbigKICAgICAg
ICAgICAgICAgICBzcGluX3VubG9jaygmbWFwX3BnZGlyX2xvY2spOwogICAgICAgICB9CiAgICAg
ZW5kX29mX2xvb3A6CisgICAgICAgIFVOTUFQX1hFTl9QQUdFVEFCTEVfTkVXKHBsMWUpOwogICAg
ICAgICBVTk1BUF9YRU5fUEFHRVRBQkxFX05FVyhwbDJlKTsKICAgICAgICAgVU5NQVBfWEVOX1BB
R0VUQUJMRV9ORVcocGwzZSk7CiAgICAgfQpAQCAtNTQ1Niw2ICs1NDc1LDcgQEAgaW50IG1hcF9w
YWdlc190b194ZW4oCiAgICAgcmMgPSAwOwogCiAgb3V0OgorICAgIFVOTUFQX1hFTl9QQUdFVEFC
TEVfTkVXKHBsMWUpOwogICAgIFVOTUFQX1hFTl9QQUdFVEFCTEVfTkVXKHBsMmUpOwogICAgIFVO
TUFQX1hFTl9QQUdFVEFCTEVfTkVXKHBsM2UpOwogICAgIHJldHVybiByYzsKLS0gCjIuMTcuMQoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
