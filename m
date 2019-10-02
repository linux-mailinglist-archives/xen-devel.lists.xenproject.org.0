Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D9BBC8F98
	for <lists+xen-devel@lfdr.de>; Wed,  2 Oct 2019 19:19:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFiFf-0008JK-Cr; Wed, 02 Oct 2019 17:17:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=aMxB=X3=amazon.com=prvs=17142d732=hongyax@srs-us1.protection.inumbo.net>)
 id 1iFiFd-0008Im-Sh
 for xen-devel@lists.xenproject.org; Wed, 02 Oct 2019 17:17:21 +0000
X-Inumbo-ID: 7a18aae6-e538-11e9-8628-bc764e2007e4
Received: from smtp-fw-6002.amazon.com (unknown [52.95.49.90])
 by localhost (Halon) with ESMTPS
 id 7a18aae6-e538-11e9-8628-bc764e2007e4;
 Wed, 02 Oct 2019 17:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1570036633; x=1601572633;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=fV/9brbO4gWoje4rTTbmECdy77LcIRpQMwVCOUOHLvY=;
 b=Bkg3G6Lhx50Jw30+PFrnAspScmFPM6lNOc5gMJ2WpLnPuD8mgI9vvhx6
 IXbryp5tu+dpSInjPovNIxiNpMBi3ngJaobQTNZv07zNTT2oG6u3Nm3Wn
 IUOn+Z/oT5DeTmBg4x+yyY37L64Us8ky30iXNzyss7TMOHr9HGwjPtAAQ Q=;
X-IronPort-AV: E=Sophos;i="5.67,249,1566864000"; d="scan'208";a="425367849"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2a-e7be2041.us-west-2.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP;
 02 Oct 2019 17:17:11 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2a-e7be2041.us-west-2.amazon.com (Postfix) with ESMTPS
 id 9DDC2A226F; Wed,  2 Oct 2019 17:17:11 +0000 (UTC)
Received: from EX13D10UEE002.ant.amazon.com (10.43.62.136) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 2 Oct 2019 17:17:02 +0000
Received: from EX13MTAUEE001.ant.amazon.com (10.43.62.200) by
 EX13D10UEE002.ant.amazon.com (10.43.62.136) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 2 Oct 2019 17:17:02 +0000
Received: from u9d785c4ba99158.ant.amazon.com (10.125.106.78) by
 mail-relay.amazon.com (10.43.62.226) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Wed, 2 Oct 2019 17:17:01 +0000
From: Hongyan Xia <hongyax@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 2 Oct 2019 18:16:51 +0100
Message-ID: <b95777174dca3eec45804195628edfc97aa8ecba.1570034362.git.hongyax@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1570034362.git.hongyax@amazon.com>
References: <cover.1570034362.git.hongyax@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v3 6/9] x86/mm: add an end_of_loop label in
 map_pages_to_xen
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KCldlIHdpbGwgc29vbiBuZWVkIHRv
IGNsZWFuIHVwIG1hcHBpbmdzIHdoZW5ldmVyIHRoZSBvdXQgbW9zdCBsb29wIGlzCmVuZGVkLiBB
ZGQgYSBuZXcgbGFiZWwgYW5kIHR1cm4gcmVsZXZhbnQgY29udGludWUncyBpbnRvIGdvdG8ncy4K
Ck5vIGZ1bmN0aW9uYWwgY2hhbmdlLgoKU2lnbmVkLW9mZi1ieTogV2VpIExpdSA8d2VpLmxpdTJA
Y2l0cml4LmNvbT4KLS0tCiB4ZW4vYXJjaC94ODYvbW0uYyB8IDkgKysrKystLS0tCiAxIGZpbGUg
Y2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hl
bi9hcmNoL3g4Ni9tbS5jIGIveGVuL2FyY2gveDg2L21tLmMKaW5kZXggMjZmY2IyNzA5Yi4uNWE1
ZjA2ODVjYyAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L21tLmMKKysrIGIveGVuL2FyY2gveDg2
L21tLmMKQEAgLTUxMDIsNyArNTEwMiw3IEBAIGludCBtYXBfcGFnZXNfdG9feGVuKAogICAgICAg
ICAgICAgaWYgKCAhbWZuX2VxKG1mbiwgSU5WQUxJRF9NRk4pICkKICAgICAgICAgICAgICAgICBt
Zm4gID0gbWZuX2FkZChtZm4sIDFVTCA8PCAoTDNfUEFHRVRBQkxFX1NISUZUIC0gUEFHRV9TSElG
VCkpOwogICAgICAgICAgICAgbnJfbWZucyAtPSAxVUwgPDwgKEwzX1BBR0VUQUJMRV9TSElGVCAt
IFBBR0VfU0hJRlQpOwotICAgICAgICAgICAgY29udGludWU7CisgICAgICAgICAgICBnb3RvIGVu
ZF9vZl9sb29wOwogICAgICAgICB9CiAKICAgICAgICAgaWYgKCAobDNlX2dldF9mbGFncyhvbDNl
KSAmIF9QQUdFX1BSRVNFTlQpICYmCkBAIC01MTI5LDcgKzUxMjksNyBAQCBpbnQgbWFwX3BhZ2Vz
X3RvX3hlbigKICAgICAgICAgICAgICAgICBpZiAoICFtZm5fZXEobWZuLCBJTlZBTElEX01GTikg
KQogICAgICAgICAgICAgICAgICAgICBtZm4gPSBtZm5fYWRkKG1mbiwgaSk7CiAgICAgICAgICAg
ICAgICAgbnJfbWZucyAtPSBpOwotICAgICAgICAgICAgICAgIGNvbnRpbnVlOworICAgICAgICAg
ICAgICAgIGdvdG8gZW5kX29mX2xvb3A7CiAgICAgICAgICAgICB9CiAKICAgICAgICAgICAgIGwy
dCA9IGFsbG9jX3hlbl9wYWdldGFibGUoKTsKQEAgLTUzMTAsNyArNTMxMCw3IEBAIGludCBtYXBf
cGFnZXNfdG9feGVuKAogICAgICAgICAgICAgICAgIHsKICAgICAgICAgICAgICAgICAgICAgaWYg
KCBsb2NraW5nICkKICAgICAgICAgICAgICAgICAgICAgICAgIHNwaW5fdW5sb2NrKCZtYXBfcGdk
aXJfbG9jayk7Ci0gICAgICAgICAgICAgICAgICAgIGNvbnRpbnVlOworICAgICAgICAgICAgICAg
ICAgICBnb3RvIGVuZF9vZl9sb29wOwogICAgICAgICAgICAgICAgIH0KIAogICAgICAgICAgICAg
ICAgIGlmICggbDJlX2dldF9mbGFncyhvbDJlKSAmIF9QQUdFX1BTRSApCkBAIC01MzY1LDcgKzUz
NjUsNyBAQCBpbnQgbWFwX3BhZ2VzX3RvX3hlbigKICAgICAgICAgICAgIHsKICAgICAgICAgICAg
ICAgICBpZiAoIGxvY2tpbmcgKQogICAgICAgICAgICAgICAgICAgICBzcGluX3VubG9jaygmbWFw
X3BnZGlyX2xvY2spOwotICAgICAgICAgICAgICAgIGNvbnRpbnVlOworICAgICAgICAgICAgICAg
IGdvdG8gZW5kX29mX2xvb3A7CiAgICAgICAgICAgICB9CiAKICAgICAgICAgICAgIGwydCA9IGwz
ZV90b19sMmUob2wzZSk7CkBAIC01MzkwLDYgKzUzOTAsNyBAQCBpbnQgbWFwX3BhZ2VzX3RvX3hl
bigKICAgICAgICAgICAgIGVsc2UgaWYgKCBsb2NraW5nICkKICAgICAgICAgICAgICAgICBzcGlu
X3VubG9jaygmbWFwX3BnZGlyX2xvY2spOwogICAgICAgICB9CisgICAgZW5kX29mX2xvb3A6Owog
ICAgIH0KIAogI3VuZGVmIGZsdXNoX2ZsYWdzCi0tIAoyLjE3LjEKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
