Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2F13C1F28
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2019 12:37:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iEt1a-0008D3-N8; Mon, 30 Sep 2019 10:35:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Wfc7=XZ=amazon.com=prvs=169663feb=hongyax@srs-us1.protection.inumbo.net>)
 id 1iEt1Y-0008Au-Tb
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2019 10:35:24 +0000
X-Inumbo-ID: f07ef241-e36d-11e9-96cd-12813bfff9fa
Received: from smtp-fw-6001.amazon.com (unknown [52.95.48.154])
 by localhost (Halon) with ESMTPS
 id f07ef241-e36d-11e9-96cd-12813bfff9fa;
 Mon, 30 Sep 2019 10:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1569839694; x=1601375694;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=3SN61TJ04n0xBCYnr1+TtV3siYlmPBFZgsnjGBXinLs=;
 b=fjQ8GW7yi4uXR9kzpdooTTvgSGzNfWhqY1WFtrfAjopL1yWQFA2dN3Px
 SPUitb4V+Y5NSZUX012nt3lcfLjEP93o1FFMCt1v0Ade8qElvFLuH5Xu9
 S2vP3/BjaLX70u958urzArextt1fvh32lgSNvIcsZCP8gbBxs1Ke6Q2hZ A=;
X-IronPort-AV: E=Sophos;i="5.64,565,1559520000"; d="scan'208";a="418649933"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1e-62350142.us-east-1.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP;
 30 Sep 2019 10:34:54 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1e-62350142.us-east-1.amazon.com (Postfix) with ESMTPS
 id 0F3B3A177E; Mon, 30 Sep 2019 10:34:53 +0000 (UTC)
Received: from EX13D03UEE003.ant.amazon.com (10.43.62.105) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 30 Sep 2019 10:34:28 +0000
Received: from EX13MTAUEE001.ant.amazon.com (10.43.62.200) by
 EX13D03UEE003.ant.amazon.com (10.43.62.105) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 30 Sep 2019 10:34:27 +0000
Received: from u9d785c4ba99158.ant.amazon.com (10.125.106.78) by
 mail-relay.amazon.com (10.43.62.226) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Mon, 30 Sep 2019 10:34:26 +0000
From: Hongyan Xia <hongyax@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 30 Sep 2019 11:33:32 +0100
Message-ID: <e8a1c83f8189e8833aef19c08d717029561475b5.1569833766.git.hongyax@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1569833766.git.hongyax@amazon.com>
References: <cover.1569833766.git.hongyax@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v2 40/55] x86/shim: map and unmap page tables in
 replace_va_mapping
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

RnJvbTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KClNpZ25lZC1vZmYtYnk6IFdlaSBM
aXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Ci0tLQogeGVuL2FyY2gveDg2L3B2L3NoaW0uYyB8IDIw
ICsrKysrKysrKysrKysrKy0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKSwg
NSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvcHYvc2hpbS5jIGIveGVu
L2FyY2gveDg2L3B2L3NoaW0uYwppbmRleCAzMjRjYTI3ZjkzLi5jZjYzOGZhOTY1IDEwMDY0NAot
LS0gYS94ZW4vYXJjaC94ODYvcHYvc2hpbS5jCisrKyBiL3hlbi9hcmNoL3g4Ni9wdi9zaGltLmMK
QEAgLTE2NywxNSArMTY3LDI1IEBAIHN0YXRpYyB2b2lkIF9faW5pdCByZXBsYWNlX3ZhX21hcHBp
bmcoc3RydWN0IGRvbWFpbiAqZCwgbDRfcGdlbnRyeV90ICpsNHN0YXJ0LAogICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nIHZhLCBtZm5fdCBtZm4pCiB7
CiAgICAgbDRfcGdlbnRyeV90ICpwbDRlID0gbDRzdGFydCArIGw0X3RhYmxlX29mZnNldCh2YSk7
Ci0gICAgbDNfcGdlbnRyeV90ICpwbDNlID0gbDRlX3RvX2wzZSgqcGw0ZSkgKyBsM190YWJsZV9v
ZmZzZXQodmEpOwotICAgIGwyX3BnZW50cnlfdCAqcGwyZSA9IGwzZV90b19sMmUoKnBsM2UpICsg
bDJfdGFibGVfb2Zmc2V0KHZhKTsKLSAgICBsMV9wZ2VudHJ5X3QgKnBsMWUgPSBsMmVfdG9fbDFl
KCpwbDJlKSArIGwxX3RhYmxlX29mZnNldCh2YSk7Ci0gICAgc3RydWN0IHBhZ2VfaW5mbyAqcGFn
ZSA9IG1mbl90b19wYWdlKGwxZV9nZXRfbWZuKCpwbDFlKSk7CisgICAgbDNfcGdlbnRyeV90ICpw
bDNlOworICAgIGwyX3BnZW50cnlfdCAqcGwyZTsKKyAgICBsMV9wZ2VudHJ5X3QgKnBsMWU7CiAK
LSAgICBwdXRfcGFnZV9hbmRfdHlwZShwYWdlKTsKKyAgICBwbDNlID0gbWFwX3hlbl9wYWdldGFi
bGVfbmV3KGw0ZV9nZXRfbWZuKCpwbDRlKSk7CisgICAgcGwzZSArPSBsM190YWJsZV9vZmZzZXQo
dmEpOworICAgIHBsMmUgPSBtYXBfeGVuX3BhZ2V0YWJsZV9uZXcobDNlX2dldF9tZm4oKnBsM2Up
KTsKKyAgICBwbDJlICs9IGwyX3RhYmxlX29mZnNldCh2YSk7CisgICAgcGwxZSA9IG1hcF94ZW5f
cGFnZXRhYmxlX25ldyhsMmVfZ2V0X21mbigqcGwyZSkpOworICAgIHBsMWUgKz0gbDFfdGFibGVf
b2Zmc2V0KHZhKTsKKworICAgIHB1dF9wYWdlX2FuZF90eXBlKG1mbl90b19wYWdlKGwxZV9nZXRf
bWZuKCpwbDFlKSkpOwogCiAgICAgKnBsMWUgPSBsMWVfZnJvbV9tZm4obWZuLCAoIWlzX3B2XzMy
Yml0X2RvbWFpbihkKSA/IEwxX1BST1QKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIDogQ09NUEFUX0wxX1BST1QpKTsKKworICAgIFVOTUFQX1hF
Tl9QQUdFVEFCTEVfTkVXKHBsMWUpOworICAgIFVOTUFQX1hFTl9QQUdFVEFCTEVfTkVXKHBsMmUp
OworICAgIFVOTUFQX1hFTl9QQUdFVEFCTEVfTkVXKHBsM2UpOwogfQogCiBzdGF0aWMgdm9pZCBl
dnRjaG5fcmVzZXJ2ZShzdHJ1Y3QgZG9tYWluICpkLCB1bnNpZ25lZCBpbnQgcG9ydCkKLS0gCjIu
MTcuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
