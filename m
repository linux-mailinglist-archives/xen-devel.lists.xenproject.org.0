Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 693BBC1F1E
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2019 12:37:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iEt1o-0000AP-5M; Mon, 30 Sep 2019 10:35:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Wfc7=XZ=amazon.com=prvs=169663feb=hongyax@srs-us1.protection.inumbo.net>)
 id 1iEt1m-00008r-SL
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2019 10:35:38 +0000
X-Inumbo-ID: f538ab12-e36d-11e9-97fb-bc764e2007e4
Received: from smtp-fw-4101.amazon.com (unknown [72.21.198.25])
 by localhost (Halon) with ESMTPS
 id f538ab12-e36d-11e9-97fb-bc764e2007e4;
 Mon, 30 Sep 2019 10:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1569839701; x=1601375701;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=nr+dk+LZcxtUkwKkvUL9TfVJ9eECRYdgkB1jYtP2PtI=;
 b=eUWerRXfKnr/vZrWfqP7ZmRxddKpPQTzkqTKxm8da8T60kaQbH/MjOrX
 1ekCqIbUEWfeY2LetnF0iP7XzNM74svD2ABxLoWgxS8DbE994C1f4SRyE
 vSKOTKZXC21U1zw6CjF8edE3YaWawf0vwqsjCJv1Vjsr4sNcwwQpOMYzB s=;
X-IronPort-AV: E=Sophos;i="5.64,565,1559520000"; d="scan'208";a="788414753"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1e-17c49630.us-east-1.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-4101.iad4.amazon.com with ESMTP;
 30 Sep 2019 10:35:01 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1e-17c49630.us-east-1.amazon.com (Postfix) with ESMTPS
 id 1BFD5A229A; Mon, 30 Sep 2019 10:35:00 +0000 (UTC)
Received: from EX13D18UEE003.ant.amazon.com (10.43.62.169) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 30 Sep 2019 10:34:41 +0000
Received: from EX13MTAUEE001.ant.amazon.com (10.43.62.200) by
 EX13D18UEE003.ant.amazon.com (10.43.62.169) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 30 Sep 2019 10:34:40 +0000
Received: from u9d785c4ba99158.ant.amazon.com (10.125.106.78) by
 mail-relay.amazon.com (10.43.62.226) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Mon, 30 Sep 2019 10:34:39 +0000
From: Hongyan Xia <hongyax@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 30 Sep 2019 11:33:46 +0100
Message-ID: <b547f966130e8b19a7ea6a59ef530a57035cbe54.1569833766.git.hongyax@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1569833766.git.hongyax@amazon.com>
References: <cover.1569833766.git.hongyax@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v2 54/55] x86: switch to use domheap page for
 page tables
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

RnJvbTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KCk1vZGlmeSBhbGwgdGhlIF9uZXcg
QVBJcyB0byBoYW5kbGUgZG9taGVhcCBwYWdlcy4KClNpZ25lZC1vZmYtYnk6IFdlaSBMaXUgPHdl
aS5saXUyQGNpdHJpeC5jb20+Ci0tLQogeGVuL2FyY2gveDg2L21tLmMgfCAxMyArKysrKysrLS0t
LS0tCiAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9tbS5jIGIveGVuL2FyY2gveDg2L21tLmMKaW5kZXggYzli
ZTIzOWQ1My4uYTJkMmQwMTY2MCAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L21tLmMKKysrIGIv
eGVuL2FyY2gveDg2L21tLmMKQEAgLTQ4NTQsMTAgKzQ4NTQsMTAgQEAgbWZuX3QgYWxsb2NfeGVu
X3BhZ2V0YWJsZV9uZXcodm9pZCkKIHsKICAgICBpZiAoIHN5c3RlbV9zdGF0ZSAhPSBTWVNfU1RB
VEVfZWFybHlfYm9vdCApCiAgICAgewotICAgICAgICB2b2lkICpwdHIgPSBhbGxvY194ZW5oZWFw
X3BhZ2UoKTsKKyAgICAgICAgc3RydWN0IHBhZ2VfaW5mbyAqcGcgPSBhbGxvY19kb21oZWFwX3Bh
Z2UoTlVMTCwgMCk7CiAKLSAgICAgICAgQlVHX09OKCFoYXJkd2FyZV9kb21haW4gJiYgIXB0cik7
Ci0gICAgICAgIHJldHVybiB2aXJ0X3RvX21mbihwdHIpOworICAgICAgICBCVUdfT04oIWhhcmR3
YXJlX2RvbWFpbiAmJiAhcGcpOworICAgICAgICByZXR1cm4gcGcgPyBwYWdlX3RvX21mbihwZykg
OiBJTlZBTElEX01GTjsKICAgICB9CiAKICAgICByZXR1cm4gYWxsb2NfYm9vdF9wYWdlcygxLCAx
KTsKQEAgLTQ4NjUsMjAgKzQ4NjUsMjEgQEAgbWZuX3QgYWxsb2NfeGVuX3BhZ2V0YWJsZV9uZXco
dm9pZCkKIAogdm9pZCAqbWFwX3hlbl9wYWdldGFibGVfbmV3KG1mbl90IG1mbikKIHsKLSAgICBy
ZXR1cm4gbWZuX3RvX3ZpcnQobWZuX3gobWZuKSk7CisgICAgcmV0dXJuIG1hcF9kb21haW5fcGFn
ZShtZm4pOwogfQogCiAvKiB2IGNhbiBwb2ludCB0byBhbiBlbnRyeSB3aXRoaW4gYSB0YWJsZSBv
ciBiZSBOVUxMICovCiB2b2lkIHVubWFwX3hlbl9wYWdldGFibGVfbmV3KHZvaWQgKnYpCiB7Ci0g
ICAgLyogWFhYIHN0aWxsIHVzaW5nIHhlbmhlYXAgcGFnZSwgbm8gbmVlZCB0byBkbyBhbnl0aGlu
Zy4gICovCisgICAgaWYgKCB2ICkKKyAgICAgICAgdW5tYXBfZG9tYWluX3BhZ2UoKGNvbnN0IHZv
aWQgKikoKHVuc2lnbmVkIGxvbmcpdiAmIFBBR0VfTUFTSykpOwogfQogCiAvKiBtZm4gY2FuIGJl
IElOVkFMSURfTUZOICovCiB2b2lkIGZyZWVfeGVuX3BhZ2V0YWJsZV9uZXcobWZuX3QgbWZuKQog
ewogICAgIGlmICggc3lzdGVtX3N0YXRlICE9IFNZU19TVEFURV9lYXJseV9ib290ICYmICFtZm5f
ZXEobWZuLCBJTlZBTElEX01GTikgKQotICAgICAgICBmcmVlX3hlbmhlYXBfcGFnZShtZm5fdG9f
dmlydChtZm5feChtZm4pKSk7CisgICAgICAgIGZyZWVfZG9taGVhcF9wYWdlKG1mbl90b19wYWdl
KG1mbikpOwogfQogCiBzdGF0aWMgREVGSU5FX1NQSU5MT0NLKG1hcF9wZ2Rpcl9sb2NrKTsKLS0g
CjIuMTcuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
