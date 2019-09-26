Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84F41BEEDE
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 11:51:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDQO6-0004oS-Ai; Thu, 26 Sep 2019 09:48:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ph5t=XV=amazon.com=prvs=165c3e20f=hongyax@srs-us1.protection.inumbo.net>)
 id 1iDQO3-0004jX-O5
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 09:48:35 +0000
X-Inumbo-ID: c7c32be1-e042-11e9-964c-12813bfff9fa
Received: from smtp-fw-6001.amazon.com (unknown [52.95.48.154])
 by localhost (Halon) with ESMTPS
 id c7c32be1-e042-11e9-964c-12813bfff9fa;
 Thu, 26 Sep 2019 09:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1569491303; x=1601027303;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=9WigQ+PC2MhUNlwYiu/8I0IxPqzWO1pANTCorurPBOE=;
 b=G6wiJEl2UzbjOKCWl+hdBYo3kbtrVGlyPYGEeNo6BdINAEfIUwStIQ6q
 H38ChkMGztp0nCQqRTZJ4rEiazb14aiqcPZU2nI6d6WKe112RFflKGK0G
 gltnvQXm/enklp1VDSLn7b6P8zNXmn7kzB1u7Of0lmF79T29RQdsFpsSg I=;
X-IronPort-AV: E=Sophos;i="5.64,551,1559520000"; d="scan'208";a="417788203"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1d-f273de60.us-east-1.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP;
 26 Sep 2019 09:48:23 +0000
Received: from EX13MTAUWA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1d-f273de60.us-east-1.amazon.com (Postfix) with ESMTPS
 id 6EEAAA2229; Thu, 26 Sep 2019 09:48:21 +0000 (UTC)
Received: from EX13D18UWA002.ant.amazon.com (10.43.160.199) by
 EX13MTAUWA001.ant.amazon.com (10.43.160.58) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 26 Sep 2019 09:47:59 +0000
Received: from EX13MTAUWA001.ant.amazon.com (10.43.160.58) by
 EX13D18UWA002.ant.amazon.com (10.43.160.199) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 26 Sep 2019 09:47:58 +0000
Received: from u9d785c4ba99158.ant.amazon.com (10.125.106.58) by
 mail-relay.amazon.com (10.43.160.118) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Thu, 26 Sep 2019 09:47:57 +0000
From: <hongyax@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 26 Sep 2019 10:45:59 +0100
Message-ID: <0f1379a676f2cd6676b950bdae66b9a81df34fe0.1569489002.git.hongyax@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1569489002.git.hongyax@amazon.com>
References: <cover.1569489002.git.hongyax@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [RFC PATCH 36/84] x86/smpboot: switch pl3e to use new
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KClNpZ25lZC1vZmYtYnk6IFdlaSBM
aXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Ci0tLQogeGVuL2FyY2gveDg2L3NtcGJvb3QuYyB8IDIy
ICsrKysrKysrKysrKysrKy0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCsp
LCA3IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9zbXBib290LmMgYi94
ZW4vYXJjaC94ODYvc21wYm9vdC5jCmluZGV4IDhiZWUwYzQxZTMuLmY5NzBiMWJkNjkgMTAwNjQ0
Ci0tLSBhL3hlbi9hcmNoL3g4Ni9zbXBib290LmMKKysrIGIveGVuL2FyY2gveDg2L3NtcGJvb3Qu
YwpAQCAtNjY2LDcgKzY2Niw3IEBAIHN0YXRpYyBpbnQgY2xvbmVfbWFwcGluZyhjb25zdCB2b2lk
ICpwdHIsIHJvb3RfcGdlbnRyeV90ICpycHQpCiB7CiAgICAgdW5zaWduZWQgbG9uZyBsaW5lYXIg
PSAodW5zaWduZWQgbG9uZylwdHIsIHBmbjsKICAgICB1bnNpZ25lZCBpbnQgZmxhZ3M7Ci0gICAg
bDNfcGdlbnRyeV90ICpwbDNlOworICAgIGwzX3BnZW50cnlfdCAqcGwzZSA9IE5VTEw7CiAgICAg
bDJfcGdlbnRyeV90ICpwbDJlOwogICAgIGwxX3BnZW50cnlfdCAqcGwxZTsKICAgICBpbnQgcmM7
CkBAIC02ODksOCArNjg5LDkgQEAgc3RhdGljIGludCBjbG9uZV9tYXBwaW5nKGNvbnN0IHZvaWQg
KnB0ciwgcm9vdF9wZ2VudHJ5X3QgKnJwdCkKICAgICAgICAgZ290byBvdXQ7CiAgICAgfQogCi0g
ICAgcGwzZSA9IGw0ZV90b19sM2UoaWRsZV9wZ190YWJsZVtyb290X3RhYmxlX29mZnNldChsaW5l
YXIpXSkgKwotICAgICAgICBsM190YWJsZV9vZmZzZXQobGluZWFyKTsKKyAgICBwbDNlID0gbWFw
X3hlbl9wYWdldGFibGVfbmV3KAorICAgICAgICBsNGVfZ2V0X21mbihpZGxlX3BnX3RhYmxlW3Jv
b3RfdGFibGVfb2Zmc2V0KGxpbmVhcildKSk7CisgICAgcGwzZSArPSBsM190YWJsZV9vZmZzZXQo
bGluZWFyKTsKIAogICAgIGZsYWdzID0gbDNlX2dldF9mbGFncygqcGwzZSk7CiAgICAgQVNTRVJU
KGZsYWdzICYgX1BBR0VfUFJFU0VOVCk7CkBAIC03MjQsMjAgKzcyNSwyNiBAQCBzdGF0aWMgaW50
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
KV0pKTsKIAogICAgIHBsM2UgKz0gbDNfdGFibGVfb2Zmc2V0KGxpbmVhcik7CiAKQEAgLTc5MCw2
ICs3OTcsNyBAQCBzdGF0aWMgaW50IGNsb25lX21hcHBpbmcoY29uc3Qgdm9pZCAqcHRyLCByb290
X3BnZW50cnlfdCAqcnB0KQogCiAgICAgcmMgPSAwOwogIG91dDoKKyAgICBVTk1BUF9YRU5fUEFH
RVRBQkxFX05FVyhwbDNlKTsKICAgICByZXR1cm4gcmM7CiB9CiAKLS0gCjIuMTcuMQoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
