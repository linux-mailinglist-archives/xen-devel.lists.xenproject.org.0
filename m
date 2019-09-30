Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF148C1F0A
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2019 12:36:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iEt0G-0006m7-Hu; Mon, 30 Sep 2019 10:34:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Wfc7=XZ=amazon.com=prvs=169663feb=hongyax@srs-us1.protection.inumbo.net>)
 id 1iEt0E-0006lg-UR
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2019 10:34:02 +0000
X-Inumbo-ID: d1ce6874-e36d-11e9-bf31-bc764e2007e4
Received: from smtp-fw-2101.amazon.com (unknown [72.21.196.25])
 by localhost (Halon) with ESMTPS
 id d1ce6874-e36d-11e9-bf31-bc764e2007e4;
 Mon, 30 Sep 2019 10:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1569839642; x=1601375642;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=dzdF87SizyQOXNy95CNVyj6xRv19mPnErY+Ua4/etgQ=;
 b=GzXlXKTL1aFrLXoDctGCNU52JFR8VJWA1ydzJ5xlVNwn2J2C+zmaPi03
 pYNvD1+uDVTVVOReSVkQQGevySv8ergCLKG62CXIfr81XQkB9KxLjru84
 CuWQVYxRBtwlbUDLytYGrjwwCGL0KrQPH5YGIk79BlJF/k79QMSoydFc3 w=;
X-IronPort-AV: E=Sophos;i="5.64,565,1559520000"; d="scan'208";a="754242139"
Received: from iad6-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-1a-821c648d.us-east-1.amazon.com) ([10.124.125.2])
 by smtp-border-fw-out-2101.iad2.amazon.com with ESMTP;
 30 Sep 2019 10:34:01 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1a-821c648d.us-east-1.amazon.com (Postfix) with ESMTPS
 id A41C6A24F7; Mon, 30 Sep 2019 10:33:50 +0000 (UTC)
Received: from EX13D02UEE002.ant.amazon.com (10.43.62.231) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 30 Sep 2019 10:33:50 +0000
Received: from EX13MTAUEE001.ant.amazon.com (10.43.62.200) by
 EX13D02UEE002.ant.amazon.com (10.43.62.231) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 30 Sep 2019 10:33:49 +0000
Received: from u9d785c4ba99158.ant.amazon.com (10.125.106.78) by
 mail-relay.amazon.com (10.43.62.226) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Mon, 30 Sep 2019 10:33:49 +0000
From: Hongyan Xia <hongyax@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 30 Sep 2019 11:32:53 +0100
Message-ID: <e16d11bb1dc1dc973476d0ca3b26844ff9d738a4.1569833766.git.hongyax@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1569833766.git.hongyax@amazon.com>
References: <cover.1569833766.git.hongyax@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v2 01/55] x86/mm: defer clearing page in
 virt_to_xen_lXe
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

RnJvbTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KCkRlZmVyIHRoZSBjYWxsIHRvIGNs
ZWFyX3BhZ2UgdG8gdGhlIHBvaW50IHdoZW4gd2UncmUgc3VyZSB0aGUgcGFnZSBpcwpnb2luZyB0
byBiZWNvbWUgYSBwYWdlIHRhYmxlLgoKVGhpcyBpcyBhIG1pbm9yIG9wdGltaXNhdGlvbi4gTm8g
ZnVuY3Rpb25hbCBjaGFuZ2UuCgpTaWduZWQtb2ZmLWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRy
aXguY29tPgotLS0KIHhlbi9hcmNoL3g4Ni9tbS5jIHwgNiArKystLS0KIDEgZmlsZSBjaGFuZ2Vk
LCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gv
eDg2L21tLmMgYi94ZW4vYXJjaC94ODYvbW0uYwppbmRleCA5OTgxNmZjNjdjLi5lOTBjOGE2M2E2
IDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvbW0uYworKysgYi94ZW4vYXJjaC94ODYvbW0uYwpA
QCAtNDg3OSwxMyArNDg3OSwxMyBAQCBzdGF0aWMgbDNfcGdlbnRyeV90ICp2aXJ0X3RvX3hlbl9s
M2UodW5zaWduZWQgbG9uZyB2KQogCiAgICAgICAgIGlmICggIXBsM2UgKQogICAgICAgICAgICAg
cmV0dXJuIE5VTEw7Ci0gICAgICAgIGNsZWFyX3BhZ2UocGwzZSk7CiAgICAgICAgIGlmICggbG9j
a2luZyApCiAgICAgICAgICAgICBzcGluX2xvY2soJm1hcF9wZ2Rpcl9sb2NrKTsKICAgICAgICAg
aWYgKCAhKGw0ZV9nZXRfZmxhZ3MoKnBsNGUpICYgX1BBR0VfUFJFU0VOVCkgKQogICAgICAgICB7
CiAgICAgICAgICAgICBsNF9wZ2VudHJ5X3QgbDRlID0gbDRlX2Zyb21fcGFkZHIoX19wYShwbDNl
KSwgX19QQUdFX0hZUEVSVklTT1IpOwogCisgICAgICAgICAgICBjbGVhcl9wYWdlKHBsM2UpOwog
ICAgICAgICAgICAgbDRlX3dyaXRlKHBsNGUsIGw0ZSk7CiAgICAgICAgICAgICBlZmlfdXBkYXRl
X2w0X3BndGFibGUobDRfdGFibGVfb2Zmc2V0KHYpLCBsNGUpOwogICAgICAgICAgICAgcGwzZSA9
IE5VTEw7CkBAIC00OTE0LDExICs0OTE0LDExIEBAIHN0YXRpYyBsMl9wZ2VudHJ5X3QgKnZpcnRf
dG9feGVuX2wyZSh1bnNpZ25lZCBsb25nIHYpCiAKICAgICAgICAgaWYgKCAhcGwyZSApCiAgICAg
ICAgICAgICByZXR1cm4gTlVMTDsKLSAgICAgICAgY2xlYXJfcGFnZShwbDJlKTsKICAgICAgICAg
aWYgKCBsb2NraW5nICkKICAgICAgICAgICAgIHNwaW5fbG9jaygmbWFwX3BnZGlyX2xvY2spOwog
ICAgICAgICBpZiAoICEobDNlX2dldF9mbGFncygqcGwzZSkgJiBfUEFHRV9QUkVTRU5UKSApCiAg
ICAgICAgIHsKKyAgICAgICAgICAgIGNsZWFyX3BhZ2UocGwyZSk7CiAgICAgICAgICAgICBsM2Vf
d3JpdGUocGwzZSwgbDNlX2Zyb21fcGFkZHIoX19wYShwbDJlKSwgX19QQUdFX0hZUEVSVklTT1Ip
KTsKICAgICAgICAgICAgIHBsMmUgPSBOVUxMOwogICAgICAgICB9CkBAIC00OTQ3LDExICs0OTQ3
LDExIEBAIGwxX3BnZW50cnlfdCAqdmlydF90b194ZW5fbDFlKHVuc2lnbmVkIGxvbmcgdikKIAog
ICAgICAgICBpZiAoICFwbDFlICkKICAgICAgICAgICAgIHJldHVybiBOVUxMOwotICAgICAgICBj
bGVhcl9wYWdlKHBsMWUpOwogICAgICAgICBpZiAoIGxvY2tpbmcgKQogICAgICAgICAgICAgc3Bp
bl9sb2NrKCZtYXBfcGdkaXJfbG9jayk7CiAgICAgICAgIGlmICggIShsMmVfZ2V0X2ZsYWdzKCpw
bDJlKSAmIF9QQUdFX1BSRVNFTlQpICkKICAgICAgICAgeworICAgICAgICAgICAgY2xlYXJfcGFn
ZShwbDFlKTsKICAgICAgICAgICAgIGwyZV93cml0ZShwbDJlLCBsMmVfZnJvbV9wYWRkcihfX3Bh
KHBsMWUpLCBfX1BBR0VfSFlQRVJWSVNPUikpOwogICAgICAgICAgICAgcGwxZSA9IE5VTEw7CiAg
ICAgICAgIH0KLS0gCjIuMTcuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
