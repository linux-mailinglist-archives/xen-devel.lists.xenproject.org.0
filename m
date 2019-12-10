Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C59311866C
	for <lists+xen-devel@lfdr.de>; Tue, 10 Dec 2019 12:37:22 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iedmo-0006B5-2z; Tue, 10 Dec 2019 11:34:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ERUJ=2A=amazon.com=prvs=2402c4381=pdurrant@srs-us1.protection.inumbo.net>)
 id 1iedmm-0006An-Lx
 for xen-devel@lists.xenproject.org; Tue, 10 Dec 2019 11:34:36 +0000
X-Inumbo-ID: 0876b100-1b41-11ea-88e7-bc764e2007e4
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0876b100-1b41-11ea-88e7-bc764e2007e4;
 Tue, 10 Dec 2019 11:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1575977672; x=1607513672;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SKfQoX2A8rZ0EnP2XkyIWyJjMF/So/eVFwUYzJEpgTw=;
 b=dtYrwZZkF/0xOh/4jeA7vHw3mTCAqC9RmbNcNXqhi1bAUHt5+ylULzw+
 zGA8JghD+nq+kwj7JtoZE1ofrwryd5CxM5d2eMhVq4mvJ8lwb30LwHWy7
 dq+wz+S35R2kRMGAfyhsxYxQUVdpX/PzzSqXMFybDHmKEpDY5fNGhYy+L Y=;
IronPort-SDR: vewG7bUB+/omNwoB9Ygkc4A38bNyqW2e/VrOCzOaaGd4TY8FDadyuilEJ/ZdAM7WPMm0aG8e+l
 FNzqIDT2rUYQ==
X-IronPort-AV: E=Sophos;i="5.69,299,1571702400"; d="scan'208";a="14008117"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2a-90c42d1d.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 10 Dec 2019 11:34:13 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2a-90c42d1d.us-west-2.amazon.com (Postfix) with ESMTPS
 id EC26DA11A3; Tue, 10 Dec 2019 11:34:12 +0000 (UTC)
Received: from EX13D32EUC001.ant.amazon.com (10.43.164.159) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 10 Dec 2019 11:34:12 +0000
Received: from EX13MTAUEE001.ant.amazon.com (10.43.62.200) by
 EX13D32EUC001.ant.amazon.com (10.43.164.159) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 10 Dec 2019 11:34:11 +0000
Received: from u2f063a87eabd5f.cbg10.amazon.com (10.125.106.135) by
 mail-relay.amazon.com (10.43.62.226) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Tue, 10 Dec 2019 11:34:09 +0000
From: Paul Durrant <pdurrant@amazon.com>
To: <xen-devel@lists.xenproject.org>, <linux-kernel@vger.kernel.org>
Date: Tue, 10 Dec 2019 11:33:46 +0000
Message-ID: <20191210113347.3404-4-pdurrant@amazon.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191210113347.3404-1-pdurrant@amazon.com>
References: <20191210113347.3404-1-pdurrant@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v2 3/4] xen/interface: re-define
 FRONT/BACK_RING_ATTACH()
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
 Stefano Stabellini <sstabellini@kernel.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Q3VycmVudGx5IHRoZXNlIG1hY3JvcyBhcmUgZGVmaW5lZCB0byByZS1pbml0aWFsaXplIGEgZnJv
bnQvYmFjayByaW5nCihyZXNwZWN0aXZlbHkpIHRvIHZhbHVlcyByZWFkIGZyb20gdGhlIHNoYXJl
ZCByaW5nIGluIHN1Y2ggYSB3YXkgdGhhdCBhbnkKcmVxdWVzdHMvcmVzcG9uc2VzIHRoYXQgYXJl
IGFkZGVkIHRvIHRoZSBzaGFyZWQgcmluZyB3aGlsc3QgdGhlIGZyb250L2JhY2sKaXMgZGV0YWNo
ZWQgd2lsbCBiZSBza2lwcGVkIG92ZXIuIFRoaXMsIGluIGdlbmVyYWwsIGlzIG5vdCBhIGRlc2ly
YWJsZQpzZW1hbnRpYyBzaW5jZSBtb3N0IGZyb250ZW5kIGltcGxlbWVudGF0aW9ucyB3aWxsIGV2
ZW50dWFsbHkgYmxvY2sgd2FpdGluZwpmb3IgYSByZXNwb25zZSB3aGljaCB3b3VsZCBlaXRoZXIg
bmV2ZXIgYXBwZWFyIG9yIG5ldmVyIGJlIHByb2Nlc3NlZC4KClNpbmNlIHRoZSBtYWNyb3MgYXJl
IGN1cnJlbnRseSB1bnVzZWQsIHRha2UgdGhpcyBvcHBvcnR1bml0eSB0byByZS1kZWZpbmUKdGhl
bSB0byByZS1pbml0aWFsaXplIGEgZnJvbnQvYmFjayByaW5nIHVzaW5nIHNwZWNpZmllZCB2YWx1
ZXMuIFRoaXMgYWxzbwphbGxvd3MgRlJPTlQvQkFDS19SSU5HX0lOSVQoKSB0byBiZSByZS1kZWZp
bmVkIGluIHRlcm1zIG9mCkZST05UL0JBQ0tfUklOR19BVFRBQ0goKSB1c2luZyBhIHNwZWNpZmll
ZCB2YWx1ZSBvZiAwLgoKTk9URTogQkFDS19SSU5HX0FUVEFDSCgpIHdpbGwgYmUgdXNlZCBkaXJl
Y3RseSBpbiBhIHN1YnNlcXVlbnQgcGF0Y2guCgpTaWduZWQtb2ZmLWJ5OiBQYXVsIER1cnJhbnQg
PHBkdXJyYW50QGFtYXpvbi5jb20+Ci0tLQpDYzogQm9yaXMgT3N0cm92c2t5IDxib3Jpcy5vc3Ry
b3Zza3lAb3JhY2xlLmNvbT4KQ2M6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KQ2M6
IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KCkEgcGF0Y2ggdG8g
YWRkIHRoZSBGUk9OVC9CQUNLX1JJTkdfQVRUQUNIKCkgbWFjcm9zIHRvIHRoZSBjYW5vbmljYWwK
cmluZy5oIGluIHhlbi5naXQgd2lsbCBiZSBzZW50IG9uY2UgdGhlIGRlZmluaXRpb25zIGhhdmUg
YmVlbiBhZ3JlZWQuCgp2MjoKIC0gY2hhbmdlIGRlZmluaXRpb25zIHRvIHRha2UgZXhwbGljaXQg
aW5pdGlhbCBpbmRleCB2YWx1ZXMKLS0tCiBpbmNsdWRlL3hlbi9pbnRlcmZhY2UvaW8vcmluZy5o
IHwgMjkgKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA5IGlu
c2VydGlvbnMoKyksIDIwIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2luY2x1ZGUveGVuL2lu
dGVyZmFjZS9pby9yaW5nLmggYi9pbmNsdWRlL3hlbi9pbnRlcmZhY2UvaW8vcmluZy5oCmluZGV4
IDNmNDA1MDFmYzYwYi4uMmFmN2ExY2Q2NjU4IDEwMDY0NAotLS0gYS9pbmNsdWRlL3hlbi9pbnRl
cmZhY2UvaW8vcmluZy5oCisrKyBiL2luY2x1ZGUveGVuL2ludGVyZmFjZS9pby9yaW5nLmgKQEAg
LTEyNSwzNSArMTI1LDI0IEBAIHN0cnVjdCBfX25hbWUjI19iYWNrX3JpbmcgewkJCQkJCVwKICAg
ICBtZW1zZXQoKF9zKS0+cGFkLCAwLCBzaXplb2YoKF9zKS0+cGFkKSk7CQkJCVwKIH0gd2hpbGUo
MCkKIAotI2RlZmluZSBGUk9OVF9SSU5HX0lOSVQoX3IsIF9zLCBfX3NpemUpIGRvIHsJCQkJXAot
ICAgIChfciktPnJlcV9wcm9kX3B2dCA9IDA7CQkJCQkJXAotICAgIChfciktPnJzcF9jb25zID0g
MDsJCQkJCQkJXAorI2RlZmluZSBGUk9OVF9SSU5HX0FUVEFDSChfciwgX3MsIF9pLCBfX3NpemUp
IGRvIHsJCQlcCisgICAgKF9yKS0+cmVxX3Byb2RfcHZ0ID0gKF9pKTsJCQkJCQlcCisgICAgKF9y
KS0+cnNwX2NvbnMgPSAoX2kpOwkJCQkJCVwKICAgICAoX3IpLT5ucl9lbnRzID0gX19SSU5HX1NJ
WkUoX3MsIF9fc2l6ZSk7CQkJCVwKICAgICAoX3IpLT5zcmluZyA9IChfcyk7CQkJCQkJCVwKIH0g
d2hpbGUgKDApCiAKLSNkZWZpbmUgQkFDS19SSU5HX0lOSVQoX3IsIF9zLCBfX3NpemUpIGRvIHsJ
CQkJXAotICAgIChfciktPnJzcF9wcm9kX3B2dCA9IDA7CQkJCQkJXAotICAgIChfciktPnJlcV9j
b25zID0gMDsJCQkJCQkJXAotICAgIChfciktPm5yX2VudHMgPSBfX1JJTkdfU0laRShfcywgX19z
aXplKTsJCQkJXAotICAgIChfciktPnNyaW5nID0gKF9zKTsJCQkJCQkJXAotfSB3aGlsZSAoMCkK
KyNkZWZpbmUgRlJPTlRfUklOR19JTklUKF9yLCBfcywgX19zaXplKSBGUk9OVF9SSU5HX0FUVEFD
SChfciwgX3MsIDAsIF9fc2l6ZSkKIAotLyogSW5pdGlhbGl6ZSB0byBleGlzdGluZyBzaGFyZWQg
aW5kZXhlcyAtLSBmb3IgcmVjb3ZlcnkgKi8KLSNkZWZpbmUgRlJPTlRfUklOR19BVFRBQ0goX3Is
IF9zLCBfX3NpemUpIGRvIHsJCQkJXAotICAgIChfciktPnNyaW5nID0gKF9zKTsJCQkJCQkJXAot
ICAgIChfciktPnJlcV9wcm9kX3B2dCA9IChfcyktPnJlcV9wcm9kOwkJCQlcCi0gICAgKF9yKS0+
cnNwX2NvbnMgPSAoX3MpLT5yc3BfcHJvZDsJCQkJCVwKKyNkZWZpbmUgQkFDS19SSU5HX0FUVEFD
SChfciwgX3MsIF9pLCBfX3NpemUpIGRvIHsJCQlcCisgICAgKF9yKS0+cnNwX3Byb2RfcHZ0ID0g
KF9pKTsJCQkJCQlcCisgICAgKF9yKS0+cmVxX2NvbnMgPSAoX2kpOwkJCQkJCVwKICAgICAoX3Ip
LT5ucl9lbnRzID0gX19SSU5HX1NJWkUoX3MsIF9fc2l6ZSk7CQkJCVwKLX0gd2hpbGUgKDApCi0K
LSNkZWZpbmUgQkFDS19SSU5HX0FUVEFDSChfciwgX3MsIF9fc2l6ZSkgZG8gewkJCQlcCiAgICAg
KF9yKS0+c3JpbmcgPSAoX3MpOwkJCQkJCQlcCi0gICAgKF9yKS0+cnNwX3Byb2RfcHZ0ID0gKF9z
KS0+cnNwX3Byb2Q7CQkJCVwKLSAgICAoX3IpLT5yZXFfY29ucyA9IChfcyktPnJlcV9wcm9kOwkJ
CQkJXAotICAgIChfciktPm5yX2VudHMgPSBfX1JJTkdfU0laRShfcywgX19zaXplKTsJCQkJXAog
fSB3aGlsZSAoMCkKIAorI2RlZmluZSBCQUNLX1JJTkdfSU5JVChfciwgX3MsIF9fc2l6ZSkgQkFD
S19SSU5HX0FUVEFDSChfciwgX3MsIDAsIF9fc2l6ZSkKKwogLyogSG93IGJpZyBpcyB0aGlzIHJp
bmc/ICovCiAjZGVmaW5lIFJJTkdfU0laRShfcikJCQkJCQkJXAogICAgICgoX3IpLT5ucl9lbnRz
KQotLSAKMi4yMC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
