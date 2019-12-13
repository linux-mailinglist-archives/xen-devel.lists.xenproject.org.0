Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC01811E480
	for <lists+xen-devel@lfdr.de>; Fri, 13 Dec 2019 14:24:13 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ifksN-0005qi-P2; Fri, 13 Dec 2019 13:20:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8pyZ=2D=amazon.com=prvs=24328bf02=pdurrant@srs-us1.protection.inumbo.net>)
 id 1ifksM-0005qd-06
 for xen-devel@lists.xenproject.org; Fri, 13 Dec 2019 13:20:58 +0000
X-Inumbo-ID: 6103dd2c-1dab-11ea-b6f1-bc764e2007e4
Received: from smtp-fw-6002.amazon.com (unknown [52.95.49.90])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6103dd2c-1dab-11ea-b6f1-bc764e2007e4;
 Fri, 13 Dec 2019 13:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1576243249; x=1607779249;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=tFySCLGtPwSbxUYEux7/p0Qq1N3sbGfPAhYwtPWA8rI=;
 b=mW1x1TF4jQkaZEhMYR+oTy9xC+iWVkMe94NhSsd23N611UvsJGfMOyWX
 F+x9RRWwonKonyXsTiu0piXozQr0phRgiQ1AsPAAJk2tmQMh2lOWIWqKe
 rlqjDBCU/FE4TlYALNPBRtOgCWCfQBLkJsBTSHP00GxUKXOXT2NMHE7RV E=;
IronPort-SDR: O0jhjvelAXfwKAOT+PVxdrI3ucPHYGBWbSCbkKO9chIdq5QSf3fZxfvnAusUejisOvPnXz7Kg1
 G9cNGYjF/sKQ==
X-IronPort-AV: E=Sophos;i="5.69,309,1571702400"; 
   d="scan'208";a="7497894"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1e-27fb8269.us-east-1.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP;
 13 Dec 2019 13:20:49 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1e-27fb8269.us-east-1.amazon.com (Postfix) with ESMTPS
 id 181C5A1B8E; Fri, 13 Dec 2019 13:20:47 +0000 (UTC)
Received: from EX13D32EUB002.ant.amazon.com (10.43.166.114) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 13 Dec 2019 13:20:46 +0000
Received: from EX13MTAUWA001.ant.amazon.com (10.43.160.58) by
 EX13D32EUB002.ant.amazon.com (10.43.166.114) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 13 Dec 2019 13:20:45 +0000
Received: from u2f063a87eabd5f.cbg10.amazon.com (10.125.106.135) by
 mail-relay.amazon.com (10.43.160.118) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Fri, 13 Dec 2019 13:20:43 +0000
From: Paul Durrant <pdurrant@amazon.com>
To: <xen-devel@lists.xenproject.org>, <netdev@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Date: Fri, 13 Dec 2019 13:20:40 +0000
Message-ID: <20191213132040.21446-1-pdurrant@amazon.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH net v2] xen-netback: avoid race that can lead to
 NULL pointer dereference
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Juergen Gross <jgross@suse.com>, Paul Durrant <pdurrant@amazon.com>,
 Jakub Kicinski <jakub.kicinski@netronome.com>, Wei Liu <wei.liu@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SW4gZnVuY3Rpb24geGVudmlmX2Rpc2Nvbm5lY3RfcXVldWUoKSwgdGhlIHZhbHVlIG9mIHF1ZXVl
LT5yeF9pcnEgaXMKemVyb2VkICpiZWZvcmUqIHF1ZXVlLT50YXNrIGlzIHN0b3BwZWQuIFVuZm9y
dHVuYXRlbHkgdGhhdCB0YXNrIG1heSBjYWxsCm5vdGlmeV9yZW1vdGVfdmlhX2lycShxdWV1ZS0+
cnhfaXJxKSBhbmQgY2FsbGluZyB0aGF0IGZ1bmN0aW9uIHdpdGggYQp6ZXJvIHZhbHVlIHJlc3Vs
dHMgaW4gYSBOVUxMIHBvaW50ZXIgZGVyZWZlcmVuY2UgaW4gZXZ0Y2huX2Zyb21faXJxKCkuCgpU
aGlzIHBhdGNoIHNpbXBseSByZS1vcmRlcnMgdGhpbmdzLCBzdG9wcGluZyBhbGwgdGFza3MgYmVm
b3JlIHplcm8taW5nIHRoZQppcnEgdmFsdWVzLCB0aGVyZWJ5IGF2b2lkaW5nIHRoZSBwb3NzaWJp
bGl0eSBvZiB0aGUgcmFjZS4KCkZpeGVzOiAyYWMwNjFjZTk3ZjQgKCJ4ZW4vbmV0YmFjazogY2xl
YW51cCBpbml0IGFuZCBkZWluaXQgY29kZSIpClNpZ25lZC1vZmYtYnk6IFBhdWwgRHVycmFudCA8
cGR1cnJhbnRAYW1hem9uLmNvbT4KLS0tCkNjOiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5j
b20+CkNjOiBKYWt1YiBLaWNpbnNraSA8amFrdWIua2ljaW5za2lAbmV0cm9ub21lLmNvbT4KQ2M6
IFdlaSBMaXUgPHdlaS5saXVAa2VybmVsLm9yZz4KQ2M6ICJEYXZpZCBTLiBNaWxsZXIiIDxkYXZl
bUBkYXZlbWxvZnQubmV0PgoKdjI6CiAtIEFkZCAnRml4ZXMnIHRhZyBhbmQgcmUtd29yayBjb21t
aXQgY29tbWVudAotLS0KIGRyaXZlcnMvbmV0L3hlbi1uZXRiYWNrL2ludGVyZmFjZS5jIHwgMjQg
KysrKysrKysrKysrLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygr
KSwgMTIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQveGVuLW5ldGJhY2sv
aW50ZXJmYWNlLmMgYi9kcml2ZXJzL25ldC94ZW4tbmV0YmFjay9pbnRlcmZhY2UuYwppbmRleCA2
OGRkN2JiMDdjYTYuLmYxNWJhM2RlNjE5NSAxMDA2NDQKLS0tIGEvZHJpdmVycy9uZXQveGVuLW5l
dGJhY2svaW50ZXJmYWNlLmMKKysrIGIvZHJpdmVycy9uZXQveGVuLW5ldGJhY2svaW50ZXJmYWNl
LmMKQEAgLTYyOCwxOCArNjI4LDYgQEAgaW50IHhlbnZpZl9jb25uZWN0X2N0cmwoc3RydWN0IHhl
bnZpZiAqdmlmLCBncmFudF9yZWZfdCByaW5nX3JlZiwKIAogc3RhdGljIHZvaWQgeGVudmlmX2Rp
c2Nvbm5lY3RfcXVldWUoc3RydWN0IHhlbnZpZl9xdWV1ZSAqcXVldWUpCiB7Ci0JaWYgKHF1ZXVl
LT50eF9pcnEpIHsKLQkJdW5iaW5kX2Zyb21faXJxaGFuZGxlcihxdWV1ZS0+dHhfaXJxLCBxdWV1
ZSk7Ci0JCWlmIChxdWV1ZS0+dHhfaXJxID09IHF1ZXVlLT5yeF9pcnEpCi0JCQlxdWV1ZS0+cnhf
aXJxID0gMDsKLQkJcXVldWUtPnR4X2lycSA9IDA7Ci0JfQotCi0JaWYgKHF1ZXVlLT5yeF9pcnEp
IHsKLQkJdW5iaW5kX2Zyb21faXJxaGFuZGxlcihxdWV1ZS0+cnhfaXJxLCBxdWV1ZSk7Ci0JCXF1
ZXVlLT5yeF9pcnEgPSAwOwotCX0KLQogCWlmIChxdWV1ZS0+dGFzaykgewogCQlrdGhyZWFkX3N0
b3AocXVldWUtPnRhc2spOwogCQlxdWV1ZS0+dGFzayA9IE5VTEw7CkBAIC02NTUsNiArNjQzLDE4
IEBAIHN0YXRpYyB2b2lkIHhlbnZpZl9kaXNjb25uZWN0X3F1ZXVlKHN0cnVjdCB4ZW52aWZfcXVl
dWUgKnF1ZXVlKQogCQlxdWV1ZS0+bmFwaS5wb2xsID0gTlVMTDsKIAl9CiAKKwlpZiAocXVldWUt
PnR4X2lycSkgeworCQl1bmJpbmRfZnJvbV9pcnFoYW5kbGVyKHF1ZXVlLT50eF9pcnEsIHF1ZXVl
KTsKKwkJaWYgKHF1ZXVlLT50eF9pcnEgPT0gcXVldWUtPnJ4X2lycSkKKwkJCXF1ZXVlLT5yeF9p
cnEgPSAwOworCQlxdWV1ZS0+dHhfaXJxID0gMDsKKwl9CisKKwlpZiAocXVldWUtPnJ4X2lycSkg
eworCQl1bmJpbmRfZnJvbV9pcnFoYW5kbGVyKHF1ZXVlLT5yeF9pcnEsIHF1ZXVlKTsKKwkJcXVl
dWUtPnJ4X2lycSA9IDA7CisJfQorCiAJeGVudmlmX3VubWFwX2Zyb250ZW5kX2RhdGFfcmluZ3Mo
cXVldWUpOwogfQogCi0tIAoyLjIwLjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
