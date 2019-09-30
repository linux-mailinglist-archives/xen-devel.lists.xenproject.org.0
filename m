Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50EB4C1F12
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2019 12:36:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iEt1U-00083c-Vd; Mon, 30 Sep 2019 10:35:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Wfc7=XZ=amazon.com=prvs=169663feb=hongyax@srs-us1.protection.inumbo.net>)
 id 1iEt1S-00081A-RV
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2019 10:35:18 +0000
X-Inumbo-ID: f1d3176e-e36d-11e9-bf31-bc764e2007e4
Received: from smtp-fw-6002.amazon.com (unknown [52.95.49.90])
 by localhost (Halon) with ESMTPS
 id f1d3176e-e36d-11e9-bf31-bc764e2007e4;
 Mon, 30 Sep 2019 10:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1569839695; x=1601375695;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=P0cwxGL9Za3ub4ggzM1FvUu37oEFscV2CGp82CE/u8M=;
 b=KlMP5k+ML/R6FGwwVeRvgzUlK3ewkV2CPKI3VyqCp1EvHNgZdw5EAzVG
 7W5G142tAXqe3RZVedIHu3py1x70hoPBzt4TtvTjuXTbn02bk31EJmwdR
 zHCHjTYNTxdymqnC/tMQZHhGrB55eByuz49WKjq8UBO7tAzttPzb4U9Ut 4=;
X-IronPort-AV: E=Sophos;i="5.64,565,1559520000"; d="scan'208";a="424630151"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1d-98acfc19.us-east-1.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP;
 30 Sep 2019 10:34:52 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1d-98acfc19.us-east-1.amazon.com (Postfix) with ESMTPS
 id 2F2CDA1DD8; Mon, 30 Sep 2019 10:34:51 +0000 (UTC)
Received: from EX13D15UEE001.ant.amazon.com (10.43.62.86) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 30 Sep 2019 10:34:23 +0000
Received: from EX13MTAUEE001.ant.amazon.com (10.43.62.200) by
 EX13D15UEE001.ant.amazon.com (10.43.62.86) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 30 Sep 2019 10:34:23 +0000
Received: from u9d785c4ba99158.ant.amazon.com (10.125.106.78) by
 mail-relay.amazon.com (10.43.62.226) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Mon, 30 Sep 2019 10:34:22 +0000
From: Hongyan Xia <hongyax@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 30 Sep 2019 11:33:27 +0100
Message-ID: <7133eb6c9eb2800c8bc69e9aed279466e1369489.1569833766.git.hongyax@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1569833766.git.hongyax@amazon.com>
References: <cover.1569833766.git.hongyax@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v2 35/55] x86/smpboot: switch pl3e to use new
 APIs in clone_mapping
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
aXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Ci0tLQogeGVuL2FyY2gveDg2L3NtcGJvb3QuYyB8IDIy
ICsrKysrKysrKysrKysrKy0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCsp
LCA3IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9zbXBib290LmMgYi94
ZW4vYXJjaC94ODYvc21wYm9vdC5jCmluZGV4IDcxNmRjMTUxMmQuLmRiMzlmNWNiYjIgMTAwNjQ0
Ci0tLSBhL3hlbi9hcmNoL3g4Ni9zbXBib290LmMKKysrIGIveGVuL2FyY2gveDg2L3NtcGJvb3Qu
YwpAQCAtNjY0LDcgKzY2NCw3IEBAIHN0YXRpYyBpbnQgY2xvbmVfbWFwcGluZyhjb25zdCB2b2lk
ICpwdHIsIHJvb3RfcGdlbnRyeV90ICpycHQpCiB7CiAgICAgdW5zaWduZWQgbG9uZyBsaW5lYXIg
PSAodW5zaWduZWQgbG9uZylwdHIsIHBmbjsKICAgICB1bnNpZ25lZCBpbnQgZmxhZ3M7Ci0gICAg
bDNfcGdlbnRyeV90ICpwbDNlOworICAgIGwzX3BnZW50cnlfdCAqcGwzZSA9IE5VTEw7CiAgICAg
bDJfcGdlbnRyeV90ICpwbDJlOwogICAgIGwxX3BnZW50cnlfdCAqcGwxZTsKICAgICBpbnQgcmM7
CkBAIC02ODcsOCArNjg3LDkgQEAgc3RhdGljIGludCBjbG9uZV9tYXBwaW5nKGNvbnN0IHZvaWQg
KnB0ciwgcm9vdF9wZ2VudHJ5X3QgKnJwdCkKICAgICAgICAgZ290byBvdXQ7CiAgICAgfQogCi0g
ICAgcGwzZSA9IGw0ZV90b19sM2UoaWRsZV9wZ190YWJsZVtyb290X3RhYmxlX29mZnNldChsaW5l
YXIpXSkgKwotICAgICAgICBsM190YWJsZV9vZmZzZXQobGluZWFyKTsKKyAgICBwbDNlID0gbWFw
X3hlbl9wYWdldGFibGVfbmV3KAorICAgICAgICBsNGVfZ2V0X21mbihpZGxlX3BnX3RhYmxlW3Jv
b3RfdGFibGVfb2Zmc2V0KGxpbmVhcildKSk7CisgICAgcGwzZSArPSBsM190YWJsZV9vZmZzZXQo
bGluZWFyKTsKIAogICAgIGZsYWdzID0gbDNlX2dldF9mbGFncygqcGwzZSk7CiAgICAgQVNTRVJU
KGZsYWdzICYgX1BBR0VfUFJFU0VOVCk7CkBAIC03MjIsMjAgKzcyMywyNiBAQCBzdGF0aWMgaW50
IGNsb25lX21hcHBpbmcoY29uc3Qgdm9pZCAqcHRyLCByb290X3BnZW50cnlfdCAqcnB0KQogICAg
ICAgICB9CiAgICAgfQogCisgICAgVU5NQVBfWEVOX1BBR0VUQUJMRV9ORVcocGwzZSk7CisKICAg
ICBpZiAoICEocm9vdF9nZXRfZmxhZ3MocnB0W3Jvb3RfdGFibGVfb2Zmc2V0KGxpbmVhcildKSAm
IF9QQUdFX1BSRVNFTlQpICkKICAgICB7Ci0gICAgICAgIHBsM2UgPSBhbGxvY194ZW5fcGFnZXRh
YmxlKCk7Ci0gICAgICAgIGlmICggIXBsM2UgKQorICAgICAgICBtZm5fdCBsM3RfbWZuID0gYWxs
b2NfeGVuX3BhZ2V0YWJsZV9uZXcoKTsKKworICAgICAgICBpZiAoIG1mbl9lcShsM3RfbWZuLCBJ
TlZBTElEX01GTikgKQogICAgICAgICB7CiAgICAgICAgICAgICByYyA9IC1FTk9NRU07CiAgICAg
ICAgICAgICBnb3RvIG91dDsKICAgICAgICAgfQorCisgICAgICAgIHBsM2UgPSBtYXBfeGVuX3Bh
Z2V0YWJsZV9uZXcobDN0X21mbik7CiAgICAgICAgIGNsZWFyX3BhZ2UocGwzZSk7CiAgICAgICAg
IGw0ZV93cml0ZSgmcnB0W3Jvb3RfdGFibGVfb2Zmc2V0KGxpbmVhcildLAotICAgICAgICAgICAg
ICAgICAgbDRlX2Zyb21fcGFkZHIoX19wYShwbDNlKSwgX19QQUdFX0hZUEVSVklTT1IpKTsKKyAg
ICAgICAgICAgICAgICAgIGw0ZV9mcm9tX21mbihsM3RfbWZuLCBfX1BBR0VfSFlQRVJWSVNPUikp
OwogICAgIH0KICAgICBlbHNlCi0gICAgICAgIHBsM2UgPSBsNGVfdG9fbDNlKHJwdFtyb290X3Rh
YmxlX29mZnNldChsaW5lYXIpXSk7CisgICAgICAgIHBsM2UgPSBtYXBfeGVuX3BhZ2V0YWJsZV9u
ZXcoCisgICAgICAgICAgICBsNGVfZ2V0X21mbihycHRbcm9vdF90YWJsZV9vZmZzZXQobGluZWFy
KV0pKTsKIAogICAgIHBsM2UgKz0gbDNfdGFibGVfb2Zmc2V0KGxpbmVhcik7CiAKQEAgLTc4OCw2
ICs3OTUsNyBAQCBzdGF0aWMgaW50IGNsb25lX21hcHBpbmcoY29uc3Qgdm9pZCAqcHRyLCByb290
X3BnZW50cnlfdCAqcnB0KQogCiAgICAgcmMgPSAwOwogIG91dDoKKyAgICBVTk1BUF9YRU5fUEFH
RVRBQkxFX05FVyhwbDNlKTsKICAgICByZXR1cm4gcmM7CiB9CiAKLS0gCjIuMTcuMQoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
