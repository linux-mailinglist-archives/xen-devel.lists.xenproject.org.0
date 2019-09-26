Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0BA0BEF03
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 11:53:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDQR4-0002jr-KA; Thu, 26 Sep 2019 09:51:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ph5t=XV=amazon.com=prvs=165c3e20f=hongyax@srs-us1.protection.inumbo.net>)
 id 1iDQR2-0002hC-A7
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 09:51:40 +0000
X-Inumbo-ID: 39ff7e7a-e043-11e9-964d-12813bfff9fa
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by localhost (Halon) with ESMTPS
 id 39ff7e7a-e043-11e9-964d-12813bfff9fa;
 Thu, 26 Sep 2019 09:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1569491495; x=1601027495;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=FLP1Pjfg7I76yn1/Mf5e4V7h1NEQgm8sbRL2xI1/ZvQ=;
 b=d1+vRJUv8eHaKuLH+hiGppEJxXTGaZTRWijRZxBKQznM0NVJp06jrdNq
 UHZPARY0kZhRFDQsVJrSBnzGE+Ey44KOA8zwA82UXd2DE6k4qrrvqn7ym
 PX1bfazfDTNd8m8HTK/5GpCzx8Y6LYvut9v/opHWJbjGyHatMp5SySgWS w=;
X-IronPort-AV: E=Sophos;i="5.64,551,1559520000"; d="scan'208";a="704637634"
Received: from sea3-co-svc-lb6-vlan3.sea.amazon.com (HELO
 email-inbound-relay-1a-715bee71.us-east-1.amazon.com) ([10.47.22.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 26 Sep 2019 09:50:16 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1a-715bee71.us-east-1.amazon.com (Postfix) with ESMTPS
 id 8A8E4A2343; Thu, 26 Sep 2019 09:50:01 +0000 (UTC)
Received: from EX13D28EUB003.ant.amazon.com (10.43.166.124) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 26 Sep 2019 09:49:46 +0000
Received: from EX13MTAUWA001.ant.amazon.com (10.43.160.58) by
 EX13D28EUB003.ant.amazon.com (10.43.166.124) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 26 Sep 2019 09:49:45 +0000
Received: from u9d785c4ba99158.ant.amazon.com (10.125.106.58) by
 mail-relay.amazon.com (10.43.160.118) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Thu, 26 Sep 2019 09:49:42 +0000
From: <hongyax@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 26 Sep 2019 10:46:38 +0100
Message-ID: <5e135be6b8754ddfa24560eec8c5d1254dba34ae.1569489002.git.hongyax@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1569489002.git.hongyax@amazon.com>
References: <cover.1569489002.git.hongyax@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [RFC PATCH 75/84] x86/mm: handle PSE early termination
 cases in virt_to_mfn_walk().
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>,
 Hongyan Xia <hongyax@amazon.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogSG9uZ3lhbiBYaWEgPGhvbmd5YXhAYW1hem9uLmNvbT4KClNpZ25lZC1vZmYtYnk6IEhv
bmd5YW4gWGlhIDxob25neWF4QGFtYXpvbi5jb20+Ci0tLQogeGVuL2FyY2gveDg2L21tLmMgfCAz
NiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0KIDEgZmlsZSBjaGFuZ2VkLCAz
NCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4
Ni9tbS5jIGIveGVuL2FyY2gveDg2L21tLmMKaW5kZXggYWI3NjBlY2MxZi4uMzliYTlmOWJmNCAx
MDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L21tLmMKKysrIGIveGVuL2FyY2gveDg2L21tLmMKQEAg
LTUwNTgsOCArNTA1OCw0MCBAQCBsMV9wZ2VudHJ5X3QgKnZpcnRfdG9feGVuX2wxZSh1bnNpZ25l
ZCBsb25nIHYpCiAKIHVuc2lnbmVkIGxvbmcgdmlydF90b19tZm5fd2Fsayh2b2lkICp2YSkKIHsK
LSAgICBsMV9wZ2VudHJ5X3QgKnBsMWUgPSB2aXJ0X3RvX3hlbl9sMWUoKHVuc2lnbmVkIGxvbmcp
KHZhKSk7Ci0gICAgdW5zaWduZWQgbG9uZyByZXQgPSBsMWVfZ2V0X3BmbigqcGwxZSk7CisgICAg
dW5zaWduZWQgbG9uZyByZXQ7CisgICAgbDNfcGdlbnRyeV90ICpwbDNlOworICAgIGwyX3BnZW50
cnlfdCAqcGwyZTsKKyAgICBsMV9wZ2VudHJ5X3QgKnBsMWU7CisKKyAgICAvKgorICAgICAqIEZJ
WE1FOiBUaGlzIGlzIHJhdGhlciB1bm9wdGltaXNlZCwgYmVjYXVzZSBlLmcuIHZpcnRfdG9feGVu
X2wyZQorICAgICAqIHJlY29tcHV0ZXMgdmlydF90b194ZW5fbDNlIGFnYWluLiBDbGVhcmx5IG9u
ZSBjYW4ga2VlcCB0aGUgcmVzdWx0IGFuZAorICAgICAqIGNhcnJ5IG9uLgorICAgICAqLworCisg
ICAgcGwzZSA9IHZpcnRfdG9feGVuX2wzZSgodW5zaWduZWQgbG9uZykodmEpKTsKKyAgICBCVUdf
T04oIShsM2VfZ2V0X2ZsYWdzKCpwbDNlKSAmIF9QQUdFX1BSRVNFTlQpKTsKKyAgICBpZiAoIGwz
ZV9nZXRfZmxhZ3MoKnBsM2UpICYgX1BBR0VfUFNFICkKKyAgICB7CisgICAgICAgIHJldCA9IGwz
ZV9nZXRfcGZuKCpwbDNlKTsKKyAgICAgICAgcmV0IHw9ICgoKHVuc2lnbmVkIGxvbmcpdmEgJiAo
KDFVTCA8PCBMM19QQUdFVEFCTEVfU0hJRlQpLTEpKSA+PiBQQUdFX1NISUZUKTsKKyAgICAgICAg
dW5tYXBfeGVuX3BhZ2V0YWJsZShwbDNlKTsKKyAgICAgICAgcmV0dXJuIHJldDsKKyAgICB9CisK
KyAgICBwbDJlID0gdmlydF90b194ZW5fbDJlKCh1bnNpZ25lZCBsb25nKSh2YSkpOworICAgIEJV
R19PTighKGwyZV9nZXRfZmxhZ3MoKnBsMmUpICYgX1BBR0VfUFJFU0VOVCkpOworICAgIGlmICgg
bDJlX2dldF9mbGFncygqcGwyZSkgJiBfUEFHRV9QU0UgKQorICAgIHsKKyAgICAgICAgcmV0ID0g
bDJlX2dldF9wZm4oKnBsMmUpOworICAgICAgICByZXQgfD0gKCgodW5zaWduZWQgbG9uZyl2YSAm
ICgoMVVMIDw8IEwyX1BBR0VUQUJMRV9TSElGVCktMSkpID4+IFBBR0VfU0hJRlQpOworICAgICAg
ICB1bm1hcF94ZW5fcGFnZXRhYmxlKHBsMmUpOworICAgICAgICByZXR1cm4gcmV0OworICAgIH0K
KworICAgIHBsMWUgPSB2aXJ0X3RvX3hlbl9sMWUoKHVuc2lnbmVkIGxvbmcpKHZhKSk7CisgICAg
QlVHX09OKCEobDFlX2dldF9mbGFncygqcGwxZSkgJiBfUEFHRV9QUkVTRU5UKSk7CisgICAgcmV0
ID0gbDFlX2dldF9wZm4oKnBsMWUpOwogICAgIHVubWFwX3hlbl9wYWdldGFibGUocGwxZSk7CiAg
ICAgcmV0dXJuIHJldDsKIH0KLS0gCjIuMTcuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
