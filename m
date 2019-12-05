Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E6AA11423F
	for <lists+xen-devel@lfdr.de>; Thu,  5 Dec 2019 15:04:55 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1icrhd-0007C2-Fs; Thu, 05 Dec 2019 14:01:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SJM4=Z3=amazon.com=prvs=235339fe4=pdurrant@srs-us1.protection.inumbo.net>)
 id 1icrhc-0007Bm-EY
 for xen-devel@lists.xenproject.org; Thu, 05 Dec 2019 14:01:56 +0000
X-Inumbo-ID: c87cec05-1767-11ea-8227-12813bfff9fa
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c87cec05-1767-11ea-8227-12813bfff9fa;
 Thu, 05 Dec 2019 14:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1575554511; x=1607090511;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3V/slw6i8lEhvkIzZyT6X8o1Z4Oo4kiWfC2gC+XC92E=;
 b=e/zfhcrUs8YBDAcPMluZdoedp8ptazW6MdTWmvv2n3Gp2I5YgJvGgH2M
 OB/zj+lT2rtlUaewmWpgAYpSIZJnmQ+tu6XhvuLlyCvjbaVLY9DczknB4
 nEiD7Aw0hg3TGgQKqVC5m1fHPhyoA9TCsGiKtgHHwbEUG5FChFofWLHA1 8=;
IronPort-SDR: jZ7e9uzRrTtrcEfwO8IvA3gzi/yT0CgX020KZM87+W0LUhDIm/3rcRxMA2UpgNXRQmt4BPG2e6
 WcmrHkejHKfA==
X-IronPort-AV: E=Sophos;i="5.69,281,1571702400"; d="scan'208";a="11809799"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1d-f273de60.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 05 Dec 2019 14:01:42 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1d-f273de60.us-east-1.amazon.com (Postfix) with ESMTPS
 id F0512A283A; Thu,  5 Dec 2019 14:01:41 +0000 (UTC)
Received: from EX13D32EUC001.ant.amazon.com (10.43.164.159) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 5 Dec 2019 14:01:41 +0000
Received: from EX13MTAUWC001.ant.amazon.com (10.43.162.135) by
 EX13D32EUC001.ant.amazon.com (10.43.164.159) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 5 Dec 2019 14:01:39 +0000
Received: from u2f063a87eabd5f.cbg10.amazon.com (10.125.106.135) by
 mail-relay.amazon.com (10.43.162.232) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Thu, 5 Dec 2019 14:01:38 +0000
From: Paul Durrant <pdurrant@amazon.com>
To: <linux-kernel@vger.kernel.org>, <xen-devel@lists.xenproject.org>
Date: Thu, 5 Dec 2019 14:01:22 +0000
Message-ID: <20191205140123.3817-4-pdurrant@amazon.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191205140123.3817-1-pdurrant@amazon.com>
References: <20191205140123.3817-1-pdurrant@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH 3/4] xen/interface: don't discard pending work
 in FRONT/BACK_RING_ATTACH
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

Q3VycmVudGx5IHRoZXNlIG1hY3JvcyB3aWxsIHNraXAgb3ZlciBhbnkgcmVxdWVzdHMvcmVzcG9u
c2VzIHRoYXQgYXJlCmFkZGVkIHRvIHRoZSBzaGFyZWQgcmluZyB3aGlsc3QgaXQgaXMgZGV0YWNo
ZWQuIFRoaXMsIGluIGdlbmVyYWwsIGlzIG5vdAphIGRlc2lyYWJsZSBzZW1hbnRpYyBzaW5jZSBt
b3N0IGZyb250ZW5kIGltcGxlbWVudGF0aW9ucyB3aWxsIGV2ZW50dWFsbHkKYmxvY2sgd2FpdGlu
ZyBmb3IgYSByZXNwb25zZSB3aGljaCB3b3VsZCBlaXRoZXIgbmV2ZXIgYXBwZWFyIG9yIG5ldmVy
IGJlCnByb2Nlc3NlZC4KCk5PVEU6IFRoZXNlIG1hY3JvcyBhcmUgY3VycmVudGx5IHVudXNlZC4g
QkFDS19SSU5HX0FUVEFDSCgpLCBob3dldmVyLCB3aWxsCiAgICAgIGJlIHVzZWQgaW4gYSBzdWJz
ZXF1ZW50IHBhdGNoLgoKU2lnbmVkLW9mZi1ieTogUGF1bCBEdXJyYW50IDxwZHVycmFudEBhbWF6
b24uY29tPgotLS0KQ2M6IEJvcmlzIE9zdHJvdnNreSA8Ym9yaXMub3N0cm92c2t5QG9yYWNsZS5j
b20+CkNjOiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+CkNjOiBTdGVmYW5vIFN0YWJl
bGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+Ci0tLQogaW5jbHVkZS94ZW4vaW50ZXJmYWNl
L2lvL3JpbmcuaCB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9pbmNsdWRlL3hlbi9pbnRlcmZhY2UvaW8vcmluZy5o
IGIvaW5jbHVkZS94ZW4vaW50ZXJmYWNlL2lvL3JpbmcuaAppbmRleCAzZjQwNTAxZmM2MGIuLjQw
NWFkZmVkODdlNiAxMDA2NDQKLS0tIGEvaW5jbHVkZS94ZW4vaW50ZXJmYWNlL2lvL3JpbmcuaAor
KysgYi9pbmNsdWRlL3hlbi9pbnRlcmZhY2UvaW8vcmluZy5oCkBAIC0xNDMsMTQgKzE0MywxNCBA
QCBzdHJ1Y3QgX19uYW1lIyNfYmFja19yaW5nIHsJCQkJCQlcCiAjZGVmaW5lIEZST05UX1JJTkdf
QVRUQUNIKF9yLCBfcywgX19zaXplKSBkbyB7CQkJCVwKICAgICAoX3IpLT5zcmluZyA9IChfcyk7
CQkJCQkJCVwKICAgICAoX3IpLT5yZXFfcHJvZF9wdnQgPSAoX3MpLT5yZXFfcHJvZDsJCQkJXAot
ICAgIChfciktPnJzcF9jb25zID0gKF9zKS0+cnNwX3Byb2Q7CQkJCQlcCisgICAgKF9yKS0+cnNw
X2NvbnMgPSAoX3MpLT5yZXFfcHJvZDsJCQkJCVwKICAgICAoX3IpLT5ucl9lbnRzID0gX19SSU5H
X1NJWkUoX3MsIF9fc2l6ZSk7CQkJCVwKIH0gd2hpbGUgKDApCiAKICNkZWZpbmUgQkFDS19SSU5H
X0FUVEFDSChfciwgX3MsIF9fc2l6ZSkgZG8gewkJCQlcCiAgICAgKF9yKS0+c3JpbmcgPSAoX3Mp
OwkJCQkJCQlcCiAgICAgKF9yKS0+cnNwX3Byb2RfcHZ0ID0gKF9zKS0+cnNwX3Byb2Q7CQkJCVwK
LSAgICAoX3IpLT5yZXFfY29ucyA9IChfcyktPnJlcV9wcm9kOwkJCQkJXAorICAgIChfciktPnJl
cV9jb25zID0gKF9zKS0+cnNwX3Byb2Q7CQkJCQlcCiAgICAgKF9yKS0+bnJfZW50cyA9IF9fUklO
R19TSVpFKF9zLCBfX3NpemUpOwkJCQlcCiB9IHdoaWxlICgwKQogCi0tIAoyLjIwLjEKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
