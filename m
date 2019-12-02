Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0913710E9B9
	for <lists+xen-devel@lfdr.de>; Mon,  2 Dec 2019 12:44:56 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ibk5U-00049w-4Z; Mon, 02 Dec 2019 11:41:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=oqAn=ZY=amazon.com=prvs=23249dff4=pdurrant@srs-us1.protection.inumbo.net>)
 id 1ibk5S-00049d-Ri
 for xen-devel@lists.xenproject.org; Mon, 02 Dec 2019 11:41:54 +0000
X-Inumbo-ID: bc898950-14f8-11ea-9db0-bc764e2007e4
Received: from smtp-fw-9101.amazon.com (unknown [207.171.184.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bc898950-14f8-11ea-9db0-bc764e2007e4;
 Mon, 02 Dec 2019 11:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1575286915; x=1606822915;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=s8XvxZ0fNsu10HOeFwxMLW9YLhKZXhrIK9PCbhCy7tY=;
 b=SKTtPhRyHkhYn3WIeXGxxgWE9T8lWBXhEYQIaSpkbZUSmlaFrcLm0xiN
 Yg+oeJxAvQe5vTx8n4NKOeLCOSFjF75KksoLzT7RXAves/Q2hn78Vftly
 AmnWbwcoIrWLngFr6NnjsMdZTRfv7QJ3AhUZA8hdPNnFSxatYXuma2zI4 w=;
IronPort-SDR: h8rgTEIu4Hn1eGWLtLSNN3T19Ltbix9FJSB1ccXh7x8ZIZv4dovNIfCqkAO08bnxFRgfN1p+zi
 dyCgPP7V05Eg==
X-IronPort-AV: E=Sophos;i="5.69,268,1571702400"; 
   d="scan'208";a="2606754"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2c-168cbb73.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9101.sea19.amazon.com with ESMTP;
 02 Dec 2019 11:41:42 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2c-168cbb73.us-west-2.amazon.com (Postfix) with ESMTPS
 id CE644A0603; Mon,  2 Dec 2019 11:41:40 +0000 (UTC)
Received: from EX13D32EUB002.ant.amazon.com (10.43.166.114) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 2 Dec 2019 11:41:40 +0000
Received: from EX13MTAUWB001.ant.amazon.com (10.43.161.207) by
 EX13D32EUB002.ant.amazon.com (10.43.166.114) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 2 Dec 2019 11:41:39 +0000
Received: from u2f063a87eabd5f.cbg10.amazon.com (10.125.106.135) by
 mail-relay.amazon.com (10.43.161.249) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Mon, 2 Dec 2019 11:41:36 +0000
From: Paul Durrant <pdurrant@amazon.com>
To: <linux-block@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <xen-devel@lists.xenproject.org>
Date: Mon, 2 Dec 2019 11:41:17 +0000
Message-ID: <20191202114117.1264-3-pdurrant@amazon.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191202114117.1264-1-pdurrant@amazon.com>
References: <20191202114117.1264-1-pdurrant@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v3 2/2] xen-blkback: allow module to be cleanly
 unloaded
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Juergen Gross <jgross@suse.com>, Jens Axboe <axboe@kernel.dk>,
 Paul Durrant <pdurrant@amazon.com>, Konrad Rzeszutek
 Wilk <konrad.wilk@oracle.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QWRkIGEgbW9kdWxlX2V4aXQoKSB0byBwZXJmb3JtIHRoZSBuZWNlc3NhcnkgY2xlYW4tdXAuCgpT
aWduZWQtb2ZmLWJ5OiBQYXVsIER1cnJhbnQgPHBkdXJyYW50QGFtYXpvbi5jb20+ClJldmlld2Vk
LWJ5OiAiUm9nZXIgUGF1IE1vbm7DqSIgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgpSZXZpZXdlZC1i
eTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgotLS0KQ2M6IEtvbnJhZCBSemVzenV0
ZWsgV2lsayA8a29ucmFkLndpbGtAb3JhY2xlLmNvbT4KQ2M6IEplbnMgQXhib2UgPGF4Ym9lQGtl
cm5lbC5kaz4KClNpZ25lZC1vZmYtYnk6IFBhdWwgRHVycmFudCA8cGR1cnJhbnRAYW1hem9uLmNv
bT4KLS0tCiBkcml2ZXJzL2Jsb2NrL3hlbi1ibGtiYWNrL2Jsa2JhY2suYyB8ICA4ICsrKysrKysr
CiBkcml2ZXJzL2Jsb2NrL3hlbi1ibGtiYWNrL2NvbW1vbi5oICB8ICAzICsrKwogZHJpdmVycy9i
bG9jay94ZW4tYmxrYmFjay94ZW5idXMuYyAgfCAxMSArKysrKysrKysrKwogMyBmaWxlcyBjaGFu
Z2VkLCAyMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ibG9jay94ZW4tYmxr
YmFjay9ibGtiYWNrLmMgYi9kcml2ZXJzL2Jsb2NrL3hlbi1ibGtiYWNrL2Jsa2JhY2suYwppbmRl
eCBmZDFlMTlmMWE0OWYuLmU1NjJhN2UyMGMzYyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ibG9jay94
ZW4tYmxrYmFjay9ibGtiYWNrLmMKKysrIGIvZHJpdmVycy9ibG9jay94ZW4tYmxrYmFjay9ibGti
YWNrLmMKQEAgLTE1MDQsNSArMTUwNCwxMyBAQCBzdGF0aWMgaW50IF9faW5pdCB4ZW5fYmxraWZf
aW5pdCh2b2lkKQogCiBtb2R1bGVfaW5pdCh4ZW5fYmxraWZfaW5pdCk7CiAKK3N0YXRpYyB2b2lk
IF9fZXhpdCB4ZW5fYmxraWZfZmluaSh2b2lkKQoreworCXhlbl9ibGtpZl94ZW5idXNfZmluaSgp
OworCXhlbl9ibGtpZl9pbnRlcmZhY2VfZmluaSgpOworfQorCittb2R1bGVfZXhpdCh4ZW5fYmxr
aWZfZmluaSk7CisKIE1PRFVMRV9MSUNFTlNFKCJEdWFsIEJTRC9HUEwiKTsKIE1PRFVMRV9BTElB
UygieGVuLWJhY2tlbmQ6dmJkIik7CmRpZmYgLS1naXQgYS9kcml2ZXJzL2Jsb2NrL3hlbi1ibGti
YWNrL2NvbW1vbi5oIGIvZHJpdmVycy9ibG9jay94ZW4tYmxrYmFjay9jb21tb24uaAppbmRleCAx
ZDMwMDJkNzczZjcuLjQ5MTMyYjBhZGJiZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ibG9jay94ZW4t
YmxrYmFjay9jb21tb24uaAorKysgYi9kcml2ZXJzL2Jsb2NrL3hlbi1ibGtiYWNrL2NvbW1vbi5o
CkBAIC0zNzUsOSArMzc1LDEyIEBAIHN0cnVjdCBwaHlzX3JlcSB7CiAJc3RydWN0IGJsb2NrX2Rl
dmljZQkqYmRldjsKIAlibGtpZl9zZWN0b3JfdAkJc2VjdG9yX251bWJlcjsKIH07CisKIGludCB4
ZW5fYmxraWZfaW50ZXJmYWNlX2luaXQodm9pZCk7Cit2b2lkIHhlbl9ibGtpZl9pbnRlcmZhY2Vf
ZmluaSh2b2lkKTsKIAogaW50IHhlbl9ibGtpZl94ZW5idXNfaW5pdCh2b2lkKTsKK3ZvaWQgeGVu
X2Jsa2lmX3hlbmJ1c19maW5pKHZvaWQpOwogCiBpcnFyZXR1cm5fdCB4ZW5fYmxraWZfYmVfaW50
KGludCBpcnEsIHZvaWQgKmRldl9pZCk7CiBpbnQgeGVuX2Jsa2lmX3NjaGVkdWxlKHZvaWQgKmFy
Zyk7CmRpZmYgLS1naXQgYS9kcml2ZXJzL2Jsb2NrL3hlbi1ibGtiYWNrL3hlbmJ1cy5jIGIvZHJp
dmVycy9ibG9jay94ZW4tYmxrYmFjay94ZW5idXMuYwppbmRleCBiOTBkYmNkOTljMDMuLmU4YzVj
NTRlMWQyNiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ibG9jay94ZW4tYmxrYmFjay94ZW5idXMuYwor
KysgYi9kcml2ZXJzL2Jsb2NrL3hlbi1ibGtiYWNrL3hlbmJ1cy5jCkBAIC0zMzMsNiArMzMzLDEy
IEBAIGludCBfX2luaXQgeGVuX2Jsa2lmX2ludGVyZmFjZV9pbml0KHZvaWQpCiAJcmV0dXJuIDA7
CiB9CiAKK3ZvaWQgeGVuX2Jsa2lmX2ludGVyZmFjZV9maW5pKHZvaWQpCit7CisJa21lbV9jYWNo
ZV9kZXN0cm95KHhlbl9ibGtpZl9jYWNoZXApOworCXhlbl9ibGtpZl9jYWNoZXAgPSBOVUxMOwor
fQorCiAvKgogICogIHN5c2ZzIGludGVyZmFjZSBmb3IgVkJEIEkvTyByZXF1ZXN0cwogICovCkBA
IC0xMTIyLDMgKzExMjgsOCBAQCBpbnQgeGVuX2Jsa2lmX3hlbmJ1c19pbml0KHZvaWQpCiB7CiAJ
cmV0dXJuIHhlbmJ1c19yZWdpc3Rlcl9iYWNrZW5kKCZ4ZW5fYmxrYmtfZHJpdmVyKTsKIH0KKwor
dm9pZCB4ZW5fYmxraWZfeGVuYnVzX2Zpbmkodm9pZCkKK3sKKwl4ZW5idXNfdW5yZWdpc3Rlcl9k
cml2ZXIoJnhlbl9ibGtia19kcml2ZXIpOworfQotLSAKMi4yMC4xCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
