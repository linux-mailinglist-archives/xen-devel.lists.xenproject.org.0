Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89602122EE8
	for <lists+xen-devel@lfdr.de>; Tue, 17 Dec 2019 15:37:26 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihDux-00040M-Ho; Tue, 17 Dec 2019 14:33:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ZJMm=2H=amazon.com=prvs=247059a19=hongyxia@srs-us1.protection.inumbo.net>)
 id 1ihDuw-00040H-EI
 for xen-devel@lists.xenproject.org; Tue, 17 Dec 2019 14:33:42 +0000
X-Inumbo-ID: 3836fdfc-20da-11ea-8ee0-12813bfff9fa
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3836fdfc-20da-11ea-8ee0-12813bfff9fa;
 Tue, 17 Dec 2019 14:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1576593222; x=1608129222;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=+SqJUYrag+T7AGIoPftcbYu/rgwa8zhR6d1WJeiXo5I=;
 b=PAfDM2Dc5jx5k3lxOVO49xmW2iuIRYQamD4ZxkshUM+VfNxSeJkCF5h8
 i/T1J8ibv3iN0EvjLEY/7WMJLdSJ+1o1LmkRsuS7T85HP2rFe5DqHNBhZ
 BWeWnAsiROLpSw0wZxvKoQFdzp+jtpbIAS4IaBWKnlW41qQ0Od8dFqeI1 0=;
IronPort-SDR: NQxuNb/8TTMvXQutO22CaxNK/uNg5vJEnd3jl9SOuVrOWC1dvu8lBI3ufYrKZnOpFElVWBSXqj
 QCBrNtuSXyvw==
X-IronPort-AV: E=Sophos;i="5.69,325,1571702400"; d="scan'208";a="15402865"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1e-97fdccfd.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 17 Dec 2019 14:33:27 +0000
Received: from EX13MTAUEE002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1e-97fdccfd.us-east-1.amazon.com (Postfix) with ESMTPS
 id 57584A184F; Tue, 17 Dec 2019 14:33:23 +0000 (UTC)
Received: from EX13D03UEE004.ant.amazon.com (10.43.62.93) by
 EX13MTAUEE002.ant.amazon.com (10.43.62.24) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 17 Dec 2019 14:33:21 +0000
Received: from EX13MTAUEE001.ant.amazon.com (10.43.62.200) by
 EX13D03UEE004.ant.amazon.com (10.43.62.93) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 17 Dec 2019 14:33:21 +0000
Received: from u60d575063b1f53.ant.amazon.com (10.55.230.166) by
 mail-relay.amazon.com (10.43.62.226) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Tue, 17 Dec 2019 14:33:19 +0000
From: Hongyan Xia <hongyxia@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 17 Dec 2019 14:33:19 +0000
Message-ID: <386d90786338008fa5f7f5b649f529da2dec14e9.1576593199.git.hongyxia@amazon.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH] xen/page_alloc: statically allocate
 bootmem_region_list
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIGV4aXN0aW5nIGNvZGUgYXNzdW1lcyB0aGF0IHRoZSBmaXJzdCBtZm4gcGFzc2VkIHRvIHRo
ZSBib290CmFsbG9jYXRvciBpcyBtYXBwZWQsIHdoaWNoIGNyZWF0ZXMgcHJvYmxlbXMgd2hlbiwg
ZS5nLiwgd2UgZG8gbm90IGhhdmUKYSBkaXJlY3QgbWFwLCBhbmQgbWF5IGNyZWF0ZSBvdGhlciBi
b290c3RyYXBwaW5nIHByb2JsZW1zIGluIHRoZQpmdXR1cmUuIE1ha2UgaXQgc3RhdGljLiBUaGUg
c2l6ZSBpcyBrZXB0IHRoZSBzYW1lIGFzIGJlZm9yZSAoMSBwYWdlKS4KClNpZ25lZC1vZmYtYnk6
IEhvbmd5YW4gWGlhIDxob25neXhpYUBhbWF6b24uY29tPgotLS0KIHhlbi9jb21tb24vcGFnZV9h
bGxvYy5jIHwgMTEgKysrKystLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyks
IDYgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9wYWdlX2FsbG9jLmMgYi94
ZW4vY29tbW9uL3BhZ2VfYWxsb2MuYwppbmRleCA3Y2IxYmQzNjhiLi43YWZiNjUxYjc5IDEwMDY0
NAotLS0gYS94ZW4vY29tbW9uL3BhZ2VfYWxsb2MuYworKysgYi94ZW4vY29tbW9uL3BhZ2VfYWxs
b2MuYwpAQCAtMjQ0LDkgKzI0NCwxMiBAQCBQQUdFX0xJU1RfSEVBRChwYWdlX2Jyb2tlbl9saXN0
KTsKICAqLwogbWZuX3QgZmlyc3RfdmFsaWRfbWZuID0gSU5WQUxJRF9NRk5fSU5JVElBTElaRVI7
CiAKLXN0YXRpYyBzdHJ1Y3QgYm9vdG1lbV9yZWdpb24geworc3RydWN0IGJvb3RtZW1fcmVnaW9u
IHsKICAgICB1bnNpZ25lZCBsb25nIHMsIGU7IC8qIE1GTnMgQHMgdGhyb3VnaCBAZS0xIGluY2x1
c2l2ZSBhcmUgZnJlZSAqLwotfSAqX19pbml0ZGF0YSBib290bWVtX3JlZ2lvbl9saXN0OworfTsK
Ky8qIFN0YXRpY2FsbHkgYWxsb2NhdGUgYSBwYWdlIGZvciBib290bWVtX3JlZ2lvbl9saXN0LiAq
Lworc3RhdGljIHN0cnVjdCBib290bWVtX3JlZ2lvbiBfX2luaXRkYXRhCisgICAgYm9vdG1lbV9y
ZWdpb25fbGlzdFtQQUdFX1NJWkUvc2l6ZW9mKHN0cnVjdCBib290bWVtX3JlZ2lvbildOwogc3Rh
dGljIHVuc2lnbmVkIGludCBfX2luaXRkYXRhIG5yX2Jvb3RtZW1fcmVnaW9uczsKIAogc3RydWN0
IHNjcnViX3JlZ2lvbiB7CkBAIC0yNjMsOSArMjY2LDYgQEAgc3RhdGljIHZvaWQgX19pbml0IGJv
b3RtZW1fcmVnaW9uX2FkZCh1bnNpZ25lZCBsb25nIHMsIHVuc2lnbmVkIGxvbmcgZSkKIHsKICAg
ICB1bnNpZ25lZCBpbnQgaTsKIAotICAgIGlmICggKGJvb3RtZW1fcmVnaW9uX2xpc3QgPT0gTlVM
TCkgJiYgKHMgPCBlKSApCi0gICAgICAgIGJvb3RtZW1fcmVnaW9uX2xpc3QgPSBtZm5fdG9fdmly
dChzKyspOwotCiAgICAgaWYgKCBzID49IGUgKQogICAgICAgICByZXR1cm47CiAKQEAgLTE4Njks
NyArMTg2OSw2IEBAIHZvaWQgX19pbml0IGVuZF9ib290X2FsbG9jYXRvcih2b2lkKQogICAgICAg
ICAgICAgaW5pdF9oZWFwX3BhZ2VzKG1mbl90b19wYWdlKF9tZm4oci0+cykpLCByLT5lIC0gci0+
cyk7CiAgICAgfQogICAgIG5yX2Jvb3RtZW1fcmVnaW9ucyA9IDA7Ci0gICAgaW5pdF9oZWFwX3Bh
Z2VzKHZpcnRfdG9fcGFnZShib290bWVtX3JlZ2lvbl9saXN0KSwgMSk7CiAKICAgICBpZiAoICFk
bWFfYml0c2l6ZSAmJiAobnVtX29ubGluZV9ub2RlcygpID4gMSkgKQogICAgICAgICBkbWFfYml0
c2l6ZSA9IGFyY2hfZ2V0X2RtYV9iaXRzaXplKCk7Ci0tIAoyLjE3LjEKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
