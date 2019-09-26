Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7444BEEC5
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 11:50:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDQNp-0004MT-6P; Thu, 26 Sep 2019 09:48:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ph5t=XV=amazon.com=prvs=165c3e20f=hongyax@srs-us1.protection.inumbo.net>)
 id 1iDQNn-0004L8-PK
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 09:48:19 +0000
X-Inumbo-ID: c4226992-e042-11e9-b588-bc764e2007e4
Received: from smtp-fw-6002.amazon.com (unknown [52.95.49.90])
 by localhost (Halon) with ESMTPS
 id c4226992-e042-11e9-b588-bc764e2007e4;
 Thu, 26 Sep 2019 09:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1569491297; x=1601027297;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=WWxC8CaECvf3fPLUIHiBL4xp/pGS6BRlh6hTeTHWnrE=;
 b=PgwIX4cZh0M+Lr8gZrgR5yyd2xERooyApf9qDmzHMWstIM6go208ibSx
 RLOfoX2DZ2lHiwpjvCeolXNjshfNPaKqCwE4EiTOKBJsdVBrtiPrxmoE+
 FNqXJT92uLNLi7KA/J6UPqrIDZVUR4nqQynpBQJeppfa1N2//E/FGRnmE g=;
X-IronPort-AV: E=Sophos;i="5.64,551,1559520000"; d="scan'208";a="423750482"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1a-e34f1ddc.us-east-1.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP;
 26 Sep 2019 09:48:17 +0000
Received: from EX13MTAUWA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1a-e34f1ddc.us-east-1.amazon.com (Postfix) with ESMTPS
 id 6FCD8A2688; Thu, 26 Sep 2019 09:48:16 +0000 (UTC)
Received: from EX13d09UWA004.ant.amazon.com (10.43.160.158) by
 EX13MTAUWA001.ant.amazon.com (10.43.160.58) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 26 Sep 2019 09:47:47 +0000
Received: from EX13MTAUWA001.ant.amazon.com (10.43.160.58) by
 EX13d09UWA004.ant.amazon.com (10.43.160.158) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 26 Sep 2019 09:47:47 +0000
Received: from u9d785c4ba99158.ant.amazon.com (10.125.106.58) by
 mail-relay.amazon.com (10.43.160.118) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Thu, 26 Sep 2019 09:47:46 +0000
From: <hongyax@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 26 Sep 2019 10:45:52 +0100
Message-ID: <7df76e609e1f67834bc2ffc1a63f67681b11050d.1569489002.git.hongyax@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1569489002.git.hongyax@amazon.com>
References: <cover.1569489002.git.hongyax@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [RFC PATCH 29/84] efi: use new page table APIs in
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
Cc: Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>
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
