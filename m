Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EEE16BEED1
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 11:51:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDQOT-0005Os-Hy; Thu, 26 Sep 2019 09:49:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ph5t=XV=amazon.com=prvs=165c3e20f=hongyax@srs-us1.protection.inumbo.net>)
 id 1iDQOR-0005Mo-QS
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 09:48:59 +0000
X-Inumbo-ID: dc80e46e-e042-11e9-8628-bc764e2007e4
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by localhost (Halon) with ESMTPS
 id dc80e46e-e042-11e9-8628-bc764e2007e4;
 Thu, 26 Sep 2019 09:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1569491339; x=1601027339;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=IWvv3JFE8UC9wDGna0qJ6XB0bPktobco6eb0qHMgbxc=;
 b=UOIg+PrIjjbRfK28IvkxC8avQRlYRZkfwzUo+oQZohXhh3ghGBq+HTSk
 8v2rUh/HFF3FLJBcCK0vdhi7vUnHWXExtS1Gaxpp9893042kXXZTngx5A
 UiGe6sHMZ9UIElkfEZZLJePeNtJaFBSn5F1LxU476TUa7XJL+PqdTueTP U=;
X-IronPort-AV: E=Sophos;i="5.64,551,1559520000"; d="scan'208";a="836988727"
Received: from sea3-co-svc-lb6-vlan2.sea.amazon.com (HELO
 email-inbound-relay-1a-e34f1ddc.us-east-1.amazon.com) ([10.47.22.34])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 26 Sep 2019 09:47:57 +0000
Received: from EX13MTAUWA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1a-e34f1ddc.us-east-1.amazon.com (Postfix) with ESMTPS
 id 2DE26A2684; Thu, 26 Sep 2019 09:47:46 +0000 (UTC)
Received: from EX13D03UWA001.ant.amazon.com (10.43.160.141) by
 EX13MTAUWA001.ant.amazon.com (10.43.160.118) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 26 Sep 2019 09:47:14 +0000
Received: from EX13MTAUWA001.ant.amazon.com (10.43.160.58) by
 EX13D03UWA001.ant.amazon.com (10.43.160.141) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 26 Sep 2019 09:47:13 +0000
Received: from u9d785c4ba99158.ant.amazon.com (10.125.106.58) by
 mail-relay.amazon.com (10.43.160.118) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Thu, 26 Sep 2019 09:47:12 +0000
From: <hongyax@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 26 Sep 2019 10:45:34 +0100
Message-ID: <17912d14fabfdcce9b309028fc9a0a8dbf5a5f32.1569489002.git.hongyax@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1569489002.git.hongyax@amazon.com>
References: <cover.1569489002.git.hongyax@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [RFC PATCH 11/84] x86/mm: change pl1e to l1t in
 virt_to_xen_l1e
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

RnJvbTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KCldlIHdpbGwgbmVlZCB0byBoYXZl
IGEgdmFyaWFibGUgbmFtZWQgcGwxZSB3aGVuIHdlIHJld3JpdGUKdmlydF90b194ZW5fbDFlLiBD
aGFuZ2UgcGwxZSB0byBsMXQgdG8gcmVmbGVjdCBiZXR0ZXIgaXRzIHB1cnBvc2UuClRoaXMgd2ls
bCBtYWtlIHJldmlld2luZyBsYXRlciBwYXRjaCBlYXNpZXIuCgpObyBmdW5jdGlvbmFsIGNoYW5n
ZS4KClNpZ25lZC1vZmYtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Ci0tLQogeGVu
L2FyY2gveDg2L21tLmMgfCAxNCArKysrKysrLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDcgaW5z
ZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvbW0u
YyBiL3hlbi9hcmNoL3g4Ni9tbS5jCmluZGV4IGVhNjkzMWUwNTIuLjdhNTIyZDkwZmUgMTAwNjQ0
Ci0tLSBhL3hlbi9hcmNoL3g4Ni9tbS5jCisrKyBiL3hlbi9hcmNoL3g4Ni9tbS5jCkBAIC00OTcy
LDIyICs0OTcyLDIyIEBAIGwxX3BnZW50cnlfdCAqdmlydF90b194ZW5fbDFlKHVuc2lnbmVkIGxv
bmcgdikKICAgICBpZiAoICEobDJlX2dldF9mbGFncygqcGwyZSkgJiBfUEFHRV9QUkVTRU5UKSAp
CiAgICAgewogICAgICAgICBib29sIGxvY2tpbmcgPSBzeXN0ZW1fc3RhdGUgPiBTWVNfU1RBVEVf
Ym9vdDsKLSAgICAgICAgbDFfcGdlbnRyeV90ICpwbDFlID0gYWxsb2NfeGVuX3BhZ2V0YWJsZSgp
OworICAgICAgICBsMV9wZ2VudHJ5X3QgKmwxdCA9IGFsbG9jX3hlbl9wYWdldGFibGUoKTsKIAot
ICAgICAgICBpZiAoICFwbDFlICkKKyAgICAgICAgaWYgKCAhbDF0ICkKICAgICAgICAgICAgIHJl
dHVybiBOVUxMOwogICAgICAgICBpZiAoIGxvY2tpbmcgKQogICAgICAgICAgICAgc3Bpbl9sb2Nr
KCZtYXBfcGdkaXJfbG9jayk7CiAgICAgICAgIGlmICggIShsMmVfZ2V0X2ZsYWdzKCpwbDJlKSAm
IF9QQUdFX1BSRVNFTlQpICkKICAgICAgICAgewotICAgICAgICAgICAgY2xlYXJfcGFnZShwbDFl
KTsKLSAgICAgICAgICAgIGwyZV93cml0ZShwbDJlLCBsMmVfZnJvbV9wYWRkcihfX3BhKHBsMWUp
LCBfX1BBR0VfSFlQRVJWSVNPUikpOwotICAgICAgICAgICAgcGwxZSA9IE5VTEw7CisgICAgICAg
ICAgICBjbGVhcl9wYWdlKGwxdCk7CisgICAgICAgICAgICBsMmVfd3JpdGUocGwyZSwgbDJlX2Zy
b21fcGFkZHIoX19wYShsMXQpLCBfX1BBR0VfSFlQRVJWSVNPUikpOworICAgICAgICAgICAgbDF0
ID0gTlVMTDsKICAgICAgICAgfQogICAgICAgICBpZiAoIGxvY2tpbmcgKQogICAgICAgICAgICAg
c3Bpbl91bmxvY2soJm1hcF9wZ2Rpcl9sb2NrKTsKLSAgICAgICAgaWYgKCBwbDFlICkKLSAgICAg
ICAgICAgIGZyZWVfeGVuX3BhZ2V0YWJsZShwbDFlKTsKKyAgICAgICAgaWYgKCBsMXQgKQorICAg
ICAgICAgICAgZnJlZV94ZW5fcGFnZXRhYmxlKGwxdCk7CiAgICAgfQogCiAgICAgQlVHX09OKGwy
ZV9nZXRfZmxhZ3MoKnBsMmUpICYgX1BBR0VfUFNFKTsKLS0gCjIuMTcuMQoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
