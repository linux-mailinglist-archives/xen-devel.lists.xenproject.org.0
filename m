Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6550E11CD61
	for <lists+xen-devel@lfdr.de>; Thu, 12 Dec 2019 13:40:35 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ifNj8-00088F-PE; Thu, 12 Dec 2019 12:37:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=CCjO=2C=amazon.com=prvs=242b57cca=pdurrant@srs-us1.protection.inumbo.net>)
 id 1ifNj6-000885-Mn
 for xen-devel@lists.xenproject.org; Thu, 12 Dec 2019 12:37:52 +0000
X-Inumbo-ID: 36417d6c-1cdc-11ea-b6f1-bc764e2007e4
Received: from smtp-fw-9101.amazon.com (unknown [207.171.184.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 36417d6c-1cdc-11ea-b6f1-bc764e2007e4;
 Thu, 12 Dec 2019 12:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1576154273; x=1607690273;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=64i9dOS4nNgwTFfSAmSWV7jMZ71ZQlmzTwYxEKBpjQc=;
 b=ZOXWWasnhBVeZxq7O0dUAJJ/VdHQEynkqNuDL+tL52AoxlOvxkIyQ5YO
 Fvo4nGHQMN+oW0v3voIDZW4H9jYRTe0RIV0DV7d76/9T7AjT+sebE35RK
 r2ey9TD4yaLjPgldkSmOruYAI4ZUj3OIxanSIb+VYwcswDHBsmQCPCI62 4=;
IronPort-SDR: u48cjDvfsDaqvN8mi03+dtkm+PjjjAcd0TOEvApWEU4rNGoaDFBQwhsWz1lW0OSTr6EgStUtWO
 qWR9JC3DsDjA==
X-IronPort-AV: E=Sophos;i="5.69,305,1571702400"; 
   d="scan'208";a="4722440"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1e-97fdccfd.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9101.sea19.amazon.com with ESMTP;
 12 Dec 2019 12:37:39 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1e-97fdccfd.us-east-1.amazon.com (Postfix) with ESMTPS
 id B8FDBA1CBF; Thu, 12 Dec 2019 12:37:36 +0000 (UTC)
Received: from EX13D32EUB004.ant.amazon.com (10.43.166.212) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 12 Dec 2019 12:37:36 +0000
Received: from EX13MTAUWA001.ant.amazon.com (10.43.160.58) by
 EX13D32EUB004.ant.amazon.com (10.43.166.212) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 12 Dec 2019 12:37:35 +0000
Received: from u2f063a87eabd5f.cbg10.amazon.com (10.125.106.135) by
 mail-relay.amazon.com (10.43.160.118) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Thu, 12 Dec 2019 12:37:32 +0000
From: Paul Durrant <pdurrant@amazon.com>
To: <netdev@vger.kernel.org>, <xen-devel@lists.xenproject.org>,
 <linux-kernel@vger.kernel.org>
Date: Thu, 12 Dec 2019 12:37:23 +0000
Message-ID: <20191212123723.21548-1-pdurrant@amazon.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH net] xen-netback: avoid race that can lead to
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

Q29tbWl0IDJhYzA2MWNlOTdmNCAoInhlbi9uZXRiYWNrOiBjbGVhbnVwIGluaXQgYW5kIGRlaW5p
dCBjb2RlIikKaW50cm9kdWNlZCBhIHByb2JsZW0uIEluIGZ1bmN0aW9uIHhlbnZpZl9kaXNjb25u
ZWN0X3F1ZXVlKCksIHRoZSB2YWx1ZSBvZgpxdWV1ZS0+cnhfaXJxIGlzIHplcm9lZCAqYmVmb3Jl
KiBxdWV1ZS0+dGFzayBpcyBzdG9wcGVkLiBVbmZvcnR1bmF0ZWx5IHRoYXQKdGFzayBtYXkgY2Fs
bCBub3RpZnlfcmVtb3RlX3ZpYV9pcnEocXVldWUtPnJ4X2lycSkgYW5kIGNhbGxpbmcgdGhhdApm
dW5jdGlvbiB3aXRoIGEgemVybyB2YWx1ZSByZXN1bHRzIGluIGEgTlVMTCBwb2ludGVyIGRlcmVm
ZXJlbmNlIGluCmV2dGNobl9mcm9tX2lycSgpLgoKVGhpcyBwYXRjaCBzaW1wbHkgcmUtb3JkZXJz
IHRoaW5ncywgc3RvcHBpbmcgYWxsIHRhc2tzIGJlZm9yZSB6ZXJvLWluZyB0aGUKaXJxIHZhbHVl
cywgdGhlcmVieSBhdm9pZGluZyB0aGUgcG9zc2liaWxpdHkgb2YgdGhlIHJhY2UuCgpTaWduZWQt
b2ZmLWJ5OiBQYXVsIER1cnJhbnQgPHBkdXJyYW50QGFtYXpvbi5jb20+Ci0tLQpDYzogSnVlcmdl
biBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgpDYzogSmFrdWIgS2ljaW5za2kgPGpha3ViLmtpY2lu
c2tpQG5ldHJvbm9tZS5jb20+CkNjOiBXZWkgTGl1IDx3ZWkubGl1QGtlcm5lbC5vcmc+CkNjOiAi
RGF2aWQgUy4gTWlsbGVyIiA8ZGF2ZW1AZGF2ZW1sb2Z0Lm5ldD4KLS0tCiBkcml2ZXJzL25ldC94
ZW4tbmV0YmFjay9pbnRlcmZhY2UuYyB8IDI0ICsrKysrKysrKysrKy0tLS0tLS0tLS0tLQogMSBm
aWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDEyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvbmV0L3hlbi1uZXRiYWNrL2ludGVyZmFjZS5jIGIvZHJpdmVycy9uZXQveGVu
LW5ldGJhY2svaW50ZXJmYWNlLmMKaW5kZXggNjhkZDdiYjA3Y2E2Li5mMTViYTNkZTYxOTUgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvbmV0L3hlbi1uZXRiYWNrL2ludGVyZmFjZS5jCisrKyBiL2RyaXZl
cnMvbmV0L3hlbi1uZXRiYWNrL2ludGVyZmFjZS5jCkBAIC02MjgsMTggKzYyOCw2IEBAIGludCB4
ZW52aWZfY29ubmVjdF9jdHJsKHN0cnVjdCB4ZW52aWYgKnZpZiwgZ3JhbnRfcmVmX3QgcmluZ19y
ZWYsCiAKIHN0YXRpYyB2b2lkIHhlbnZpZl9kaXNjb25uZWN0X3F1ZXVlKHN0cnVjdCB4ZW52aWZf
cXVldWUgKnF1ZXVlKQogewotCWlmIChxdWV1ZS0+dHhfaXJxKSB7Ci0JCXVuYmluZF9mcm9tX2ly
cWhhbmRsZXIocXVldWUtPnR4X2lycSwgcXVldWUpOwotCQlpZiAocXVldWUtPnR4X2lycSA9PSBx
dWV1ZS0+cnhfaXJxKQotCQkJcXVldWUtPnJ4X2lycSA9IDA7Ci0JCXF1ZXVlLT50eF9pcnEgPSAw
OwotCX0KLQotCWlmIChxdWV1ZS0+cnhfaXJxKSB7Ci0JCXVuYmluZF9mcm9tX2lycWhhbmRsZXIo
cXVldWUtPnJ4X2lycSwgcXVldWUpOwotCQlxdWV1ZS0+cnhfaXJxID0gMDsKLQl9Ci0KIAlpZiAo
cXVldWUtPnRhc2spIHsKIAkJa3RocmVhZF9zdG9wKHF1ZXVlLT50YXNrKTsKIAkJcXVldWUtPnRh
c2sgPSBOVUxMOwpAQCAtNjU1LDYgKzY0MywxOCBAQCBzdGF0aWMgdm9pZCB4ZW52aWZfZGlzY29u
bmVjdF9xdWV1ZShzdHJ1Y3QgeGVudmlmX3F1ZXVlICpxdWV1ZSkKIAkJcXVldWUtPm5hcGkucG9s
bCA9IE5VTEw7CiAJfQogCisJaWYgKHF1ZXVlLT50eF9pcnEpIHsKKwkJdW5iaW5kX2Zyb21faXJx
aGFuZGxlcihxdWV1ZS0+dHhfaXJxLCBxdWV1ZSk7CisJCWlmIChxdWV1ZS0+dHhfaXJxID09IHF1
ZXVlLT5yeF9pcnEpCisJCQlxdWV1ZS0+cnhfaXJxID0gMDsKKwkJcXVldWUtPnR4X2lycSA9IDA7
CisJfQorCisJaWYgKHF1ZXVlLT5yeF9pcnEpIHsKKwkJdW5iaW5kX2Zyb21faXJxaGFuZGxlcihx
dWV1ZS0+cnhfaXJxLCBxdWV1ZSk7CisJCXF1ZXVlLT5yeF9pcnEgPSAwOworCX0KKwogCXhlbnZp
Zl91bm1hcF9mcm9udGVuZF9kYXRhX3JpbmdzKHF1ZXVlKTsKIH0KIAotLSAKMi4yMC4xCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
