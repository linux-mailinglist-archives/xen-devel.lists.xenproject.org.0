Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AEB0C1F38
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2019 12:38:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iEt2I-0001Ab-Ru; Mon, 30 Sep 2019 10:36:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Wfc7=XZ=amazon.com=prvs=169663feb=hongyax@srs-us1.protection.inumbo.net>)
 id 1iEt2G-000182-TY
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2019 10:36:08 +0000
X-Inumbo-ID: 07f36d3c-e36e-11e9-bf31-bc764e2007e4
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by localhost (Halon) with ESMTPS
 id 07f36d3c-e36e-11e9-bf31-bc764e2007e4;
 Mon, 30 Sep 2019 10:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1569839733; x=1601375733;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=WWxC8CaECvf3fPLUIHiBL4xp/pGS6BRlh6hTeTHWnrE=;
 b=KdSd2wYNeqV7+eRwxrJPjpGupRhboK5mMePtu/BMvzmHASL2elEmmW3U
 QQZn4iBW7D/J3z6EpVdLt6IfbSAq8tc74J/OK+TUJa+ReKSN45+wKIo3s
 bm9phjq0LXiwUnk2CUmOX3VdDI7rElK9hHE76MaZYqQTdMW5GclP2TsHT w=;
X-IronPort-AV: E=Sophos;i="5.64,565,1559520000"; d="scan'208";a="705521345"
Received: from sea3-co-svc-lb6-vlan3.sea.amazon.com (HELO
 email-inbound-relay-1e-97fdccfd.us-east-1.amazon.com) ([10.47.22.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 30 Sep 2019 10:35:02 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1e-97fdccfd.us-east-1.amazon.com (Postfix) with ESMTPS
 id 7BFACA24D8; Mon, 30 Sep 2019 10:34:46 +0000 (UTC)
Received: from EX13D09UEE002.ant.amazon.com (10.43.62.239) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 30 Sep 2019 10:34:17 +0000
Received: from EX13MTAUEE001.ant.amazon.com (10.43.62.200) by
 EX13D09UEE002.ant.amazon.com (10.43.62.239) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 30 Sep 2019 10:34:17 +0000
Received: from u9d785c4ba99158.ant.amazon.com (10.125.106.78) by
 mail-relay.amazon.com (10.43.62.226) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Mon, 30 Sep 2019 10:34:16 +0000
From: Hongyan Xia <hongyax@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 30 Sep 2019 11:33:20 +0100
Message-ID: <5629b76f1923c6ff4e79a9bc9905ebbaddba189b.1569833766.git.hongyax@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1569833766.git.hongyax@amazon.com>
References: <cover.1569833766.git.hongyax@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v2 28/55] efi: use new page table APIs in
 copy_mapping
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KCkFmdGVyIGluc3BlY3Rpb24gQVJN
IGRvZXNuJ3QgaGF2ZSBhbGxvY194ZW5fcGFnZXRhYmxlIHNvIHRoaXMgZnVuY3Rpb24KaXMgeDg2
IG9ubHksIHdoaWNoIG1lYW5zIGl0IGlzIHNhZmUgZm9yIHVzIHRvIGNoYW5nZS4KClNpZ25lZC1v
ZmYtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Ci0tLQpYWFggdGVzdCB0aGlzIGlu
IGdpdGxhYiBjaSB0byBiZSBzdXJlLgotLS0KIHhlbi9jb21tb24vZWZpL2Jvb3QuYyB8IDE2ICsr
KysrKysrKysrLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCA1IGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vZWZpL2Jvb3QuYyBiL3hlbi9jb21tb24v
ZWZpL2Jvb3QuYwppbmRleCA3OTE5Mzc4NGZmLi42MmI1OTQ0ZTYxIDEwMDY0NAotLS0gYS94ZW4v
Y29tbW9uL2VmaS9ib290LmMKKysrIGIveGVuL2NvbW1vbi9lZmkvYm9vdC5jCkBAIC0xNDQwLDE2
ICsxNDQwLDIyIEBAIHN0YXRpYyBfX2luaXQgdm9pZCBjb3B5X21hcHBpbmcodW5zaWduZWQgbG9u
ZyBtZm4sIHVuc2lnbmVkIGxvbmcgZW5kLAogICAgICAgICAgICAgY29udGludWU7CiAgICAgICAg
IGlmICggIShsNGVfZ2V0X2ZsYWdzKGw0ZSkgJiBfUEFHRV9QUkVTRU5UKSApCiAgICAgICAgIHsK
LSAgICAgICAgICAgIGwzZHN0ID0gYWxsb2NfeGVuX3BhZ2V0YWJsZSgpOwotICAgICAgICAgICAg
QlVHX09OKCFsM2RzdCk7CisgICAgICAgICAgICBtZm5fdCBsM3RfbWZuOworCisgICAgICAgICAg
ICBsM3RfbWZuID0gYWxsb2NfeGVuX3BhZ2V0YWJsZV9uZXcoKTsKKyAgICAgICAgICAgIEJVR19P
TihtZm5fZXEobDN0X21mbiwgSU5WQUxJRF9NRk4pKTsKKyAgICAgICAgICAgIGwzZHN0ID0gbWFw
X3hlbl9wYWdldGFibGVfbmV3KGwzdF9tZm4pOwogICAgICAgICAgICAgY2xlYXJfcGFnZShsM2Rz
dCk7CiAgICAgICAgICAgICBlZmlfbDRfcGd0YWJsZVtsNF90YWJsZV9vZmZzZXQobWZuIDw8IFBB
R0VfU0hJRlQpXSA9Ci0gICAgICAgICAgICAgICAgbDRlX2Zyb21fcGFkZHIodmlydF90b19tYWRk
cihsM2RzdCksIF9fUEFHRV9IWVBFUlZJU09SKTsKKyAgICAgICAgICAgICAgICBsNGVfZnJvbV9t
Zm4obDN0X21mbiwgX19QQUdFX0hZUEVSVklTT1IpOwogICAgICAgICB9CiAgICAgICAgIGVsc2UK
LSAgICAgICAgICAgIGwzZHN0ID0gbDRlX3RvX2wzZShsNGUpOwotICAgICAgICBsM3NyYyA9IGw0
ZV90b19sM2UoaWRsZV9wZ190YWJsZVtsNF90YWJsZV9vZmZzZXQodmEpXSk7CisgICAgICAgICAg
ICBsM2RzdCA9IG1hcF94ZW5fcGFnZXRhYmxlX25ldyhsNGVfZ2V0X21mbihsNGUpKTsKKyAgICAg
ICAgbDNzcmMgPSBtYXBfeGVuX3BhZ2V0YWJsZV9uZXcoCisgICAgICAgICAgICBsNGVfZ2V0X21m
bihpZGxlX3BnX3RhYmxlW2w0X3RhYmxlX29mZnNldCh2YSldKSk7CiAgICAgICAgIGwzZHN0W2wz
X3RhYmxlX29mZnNldChtZm4gPDwgUEFHRV9TSElGVCldID0gbDNzcmNbbDNfdGFibGVfb2Zmc2V0
KHZhKV07CisgICAgICAgIFVOTUFQX1hFTl9QQUdFVEFCTEVfTkVXKGwzc3JjKTsKKyAgICAgICAg
VU5NQVBfWEVOX1BBR0VUQUJMRV9ORVcobDNkc3QpOwogICAgIH0KIH0KIAotLSAKMi4xNy4xCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
