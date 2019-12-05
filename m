Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6B9A114238
	for <lists+xen-devel@lfdr.de>; Thu,  5 Dec 2019 15:04:24 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1icrhZ-0007An-67; Thu, 05 Dec 2019 14:01:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SJM4=Z3=amazon.com=prvs=235339fe4=pdurrant@srs-us1.protection.inumbo.net>)
 id 1icrhX-0007AT-EW
 for xen-devel@lists.xenproject.org; Thu, 05 Dec 2019 14:01:51 +0000
X-Inumbo-ID: c75acfbf-1767-11ea-8227-12813bfff9fa
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c75acfbf-1767-11ea-8227-12813bfff9fa;
 Thu, 05 Dec 2019 14:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1575554510; x=1607090510;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=M1DO+KbIJ99CAIvcChEU16BtTaZvlFzToApxdR/ZnjM=;
 b=iJ7Qes2umEIGWr/90YOwyD4UfY41CYMB9CkVKd/d05pj14XxXbJGDatU
 UKmhcJeybfCHSQTYnM1vq3NfQTwLpVLP8idjAKwrk+dJutRJl0LgSDIYZ
 1j6tt0TnF8l1BropS7rm7uMbS0tRvlCz4uYK6jHFnguEc8waG33QX2qny o=;
IronPort-SDR: gj5++Yno1kwsugOsNS7pF4srHlcaFX85uQqpW3Kb1TUMUCi8mVV7f7AaIipyxetATC3KYd8oOX
 s+uS/3/U4H/A==
X-IronPort-AV: E=Sophos;i="5.69,281,1571702400"; d="scan'208";a="11809763"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1e-62350142.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 05 Dec 2019 14:01:37 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1e-62350142.us-east-1.amazon.com (Postfix) with ESMTPS
 id 5AEBAA182C; Thu,  5 Dec 2019 14:01:36 +0000 (UTC)
Received: from EX13D32EUB001.ant.amazon.com (10.43.166.125) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 5 Dec 2019 14:01:35 +0000
Received: from EX13MTAUWC001.ant.amazon.com (10.43.162.135) by
 EX13D32EUB001.ant.amazon.com (10.43.166.125) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 5 Dec 2019 14:01:34 +0000
Received: from u2f063a87eabd5f.cbg10.amazon.com (10.125.106.135) by
 mail-relay.amazon.com (10.43.162.232) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Thu, 5 Dec 2019 14:01:32 +0000
From: Paul Durrant <pdurrant@amazon.com>
To: <linux-kernel@vger.kernel.org>, <xen-devel@lists.xenproject.org>
Date: Thu, 5 Dec 2019 14:01:20 +0000
Message-ID: <20191205140123.3817-2-pdurrant@amazon.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191205140123.3817-1-pdurrant@amazon.com>
References: <20191205140123.3817-1-pdurrant@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH 1/4] xenbus: move xenbus_dev_shutdown() into
 frontend code...
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

Li4uYW5kIG1ha2UgaXQgc3RhdGljCgp4ZW5idXNfZGV2X3NodXRkb3duKCkgaXMgc2VlbWluZ2x5
IGludGVuZGVkIHRvIGNhdXNlIGNsZWFuIHNodXRkb3duIG9mIFBWCmZyb250ZW5kcyB3aGVuIGEg
Z3Vlc3QgaXMgcmVib290ZWQuIEluZGVlZCB0aGUgZnVuY3Rpb24gd2FpdHMgZm9yIGEKY29ucGxl
dGlvbiB3aGljaCBpcyBvbmx5IHNldCBieSBhIGNhbGwgdG8geGVuYnVzX2Zyb250ZW5kX2Nsb3Nl
ZCgpLgoKVGhpcyBwYXRjaCByZW1vdmVzIHRoZSBzaHV0ZG93bigpIG1ldGhvZCBmcm9tIGJhY2tl
bmRzIGFuZCBtb3Zlcwp4ZW5idXNfZGV2X3NodXRkb3duKCkgZnJvbSB4ZW5idXNfcHJvYmUuYyBp
bnRvIHhlbmJ1c19wcm9iZV9mcm9udGVuZC5jLApyZW5hbWluZyBpdCBhcHByb3ByaWF0ZWx5IGFu
ZCBtYWtpbmcgaXQgc3RhdGljLgoKU2lnbmVkLW9mZi1ieTogUGF1bCBEdXJyYW50IDxwZHVycmFu
dEBhbWF6b24uY29tPgotLS0KQ2M6IEJvcmlzIE9zdHJvdnNreSA8Ym9yaXMub3N0cm92c2t5QG9y
YWNsZS5jb20+CkNjOiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+CkNjOiBTdGVmYW5v
IFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+Ci0tLQogZHJpdmVycy94ZW4veGVu
YnVzL3hlbmJ1cy5oICAgICAgICAgICAgICAgIHwgIDIgLS0KIGRyaXZlcnMveGVuL3hlbmJ1cy94
ZW5idXNfcHJvYmUuYyAgICAgICAgICB8IDIzIC0tLS0tLS0tLS0tLS0tLS0tLS0tLQogZHJpdmVy
cy94ZW4veGVuYnVzL3hlbmJ1c19wcm9iZV9iYWNrZW5kLmMgIHwgIDEgLQogZHJpdmVycy94ZW4v
eGVuYnVzL3hlbmJ1c19wcm9iZV9mcm9udGVuZC5jIHwgMjQgKysrKysrKysrKysrKysrKysrKysr
LQogNCBmaWxlcyBjaGFuZ2VkLCAyMyBpbnNlcnRpb25zKCspLCAyNyBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL3hlbi94ZW5idXMveGVuYnVzLmggYi9kcml2ZXJzL3hlbi94ZW5i
dXMveGVuYnVzLmgKaW5kZXggZDc1YTIzODViMzdjLi41ZjViOGE3ZDViODAgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMveGVuL3hlbmJ1cy94ZW5idXMuaAorKysgYi9kcml2ZXJzL3hlbi94ZW5idXMveGVu
YnVzLmgKQEAgLTExNiw4ICsxMTYsNiBAQCBpbnQgeGVuYnVzX3Byb2JlX2RldmljZXMoc3RydWN0
IHhlbl9idXNfdHlwZSAqYnVzKTsKIAogdm9pZCB4ZW5idXNfZGV2X2NoYW5nZWQoY29uc3QgY2hh
ciAqbm9kZSwgc3RydWN0IHhlbl9idXNfdHlwZSAqYnVzKTsKIAotdm9pZCB4ZW5idXNfZGV2X3No
dXRkb3duKHN0cnVjdCBkZXZpY2UgKl9kZXYpOwotCiBpbnQgeGVuYnVzX2Rldl9zdXNwZW5kKHN0
cnVjdCBkZXZpY2UgKmRldik7CiBpbnQgeGVuYnVzX2Rldl9yZXN1bWUoc3RydWN0IGRldmljZSAq
ZGV2KTsKIGludCB4ZW5idXNfZGV2X2NhbmNlbChzdHJ1Y3QgZGV2aWNlICpkZXYpOwpkaWZmIC0t
Z2l0IGEvZHJpdmVycy94ZW4veGVuYnVzL3hlbmJ1c19wcm9iZS5jIGIvZHJpdmVycy94ZW4veGVu
YnVzL3hlbmJ1c19wcm9iZS5jCmluZGV4IDQ0NjFmNDU4MzQ3Ni4uYTEwMzExYzM0OGI5IDEwMDY0
NAotLS0gYS9kcml2ZXJzL3hlbi94ZW5idXMveGVuYnVzX3Byb2JlLmMKKysrIGIvZHJpdmVycy94
ZW4veGVuYnVzL3hlbmJ1c19wcm9iZS5jCkBAIC0yODEsMjkgKzI4MSw2IEBAIGludCB4ZW5idXNf
ZGV2X3JlbW92ZShzdHJ1Y3QgZGV2aWNlICpfZGV2KQogfQogRVhQT1JUX1NZTUJPTF9HUEwoeGVu
YnVzX2Rldl9yZW1vdmUpOwogCi12b2lkIHhlbmJ1c19kZXZfc2h1dGRvd24oc3RydWN0IGRldmlj
ZSAqX2RldikKLXsKLQlzdHJ1Y3QgeGVuYnVzX2RldmljZSAqZGV2ID0gdG9feGVuYnVzX2Rldmlj
ZShfZGV2KTsKLQl1bnNpZ25lZCBsb25nIHRpbWVvdXQgPSA1KkhaOwotCi0JRFBSSU5USygiJXMi
LCBkZXYtPm5vZGVuYW1lKTsKLQotCWdldF9kZXZpY2UoJmRldi0+ZGV2KTsKLQlpZiAoZGV2LT5z
dGF0ZSAhPSBYZW5idXNTdGF0ZUNvbm5lY3RlZCkgewotCQlwcl9pbmZvKCIlczogJXM6ICVzICE9
IENvbm5lY3RlZCwgc2tpcHBpbmdcbiIsCi0JCQlfX2Z1bmNfXywgZGV2LT5ub2RlbmFtZSwgeGVu
YnVzX3N0cnN0YXRlKGRldi0+c3RhdGUpKTsKLQkJZ290byBvdXQ7Ci0JfQotCXhlbmJ1c19zd2l0
Y2hfc3RhdGUoZGV2LCBYZW5idXNTdGF0ZUNsb3NpbmcpOwotCXRpbWVvdXQgPSB3YWl0X2Zvcl9j
b21wbGV0aW9uX3RpbWVvdXQoJmRldi0+ZG93biwgdGltZW91dCk7Ci0JaWYgKCF0aW1lb3V0KQot
CQlwcl9pbmZvKCIlczogJXMgdGltZW91dCBjbG9zaW5nIGRldmljZVxuIiwKLQkJCV9fZnVuY19f
LCBkZXYtPm5vZGVuYW1lKTsKLSBvdXQ6Ci0JcHV0X2RldmljZSgmZGV2LT5kZXYpOwotfQotRVhQ
T1JUX1NZTUJPTF9HUEwoeGVuYnVzX2Rldl9zaHV0ZG93bik7Ci0KIGludCB4ZW5idXNfcmVnaXN0
ZXJfZHJpdmVyX2NvbW1vbihzdHJ1Y3QgeGVuYnVzX2RyaXZlciAqZHJ2LAogCQkJCSAgc3RydWN0
IHhlbl9idXNfdHlwZSAqYnVzLAogCQkJCSAgc3RydWN0IG1vZHVsZSAqb3duZXIsIGNvbnN0IGNo
YXIgKm1vZF9uYW1lKQpkaWZmIC0tZ2l0IGEvZHJpdmVycy94ZW4veGVuYnVzL3hlbmJ1c19wcm9i
ZV9iYWNrZW5kLmMgYi9kcml2ZXJzL3hlbi94ZW5idXMveGVuYnVzX3Byb2JlX2JhY2tlbmQuYwpp
bmRleCBiMGJlZDRmYWY0NGMuLjE0ODc2ZmFmZjNiMCAxMDA2NDQKLS0tIGEvZHJpdmVycy94ZW4v
eGVuYnVzL3hlbmJ1c19wcm9iZV9iYWNrZW5kLmMKKysrIGIvZHJpdmVycy94ZW4veGVuYnVzL3hl
bmJ1c19wcm9iZV9iYWNrZW5kLmMKQEAgLTE5OCw3ICsxOTgsNiBAQCBzdGF0aWMgc3RydWN0IHhl
bl9idXNfdHlwZSB4ZW5idXNfYmFja2VuZCA9IHsKIAkJLnVldmVudAkJPSB4ZW5idXNfdWV2ZW50
X2JhY2tlbmQsCiAJCS5wcm9iZQkJPSB4ZW5idXNfZGV2X3Byb2JlLAogCQkucmVtb3ZlCQk9IHhl
bmJ1c19kZXZfcmVtb3ZlLAotCQkuc2h1dGRvd24JPSB4ZW5idXNfZGV2X3NodXRkb3duLAogCQku
ZGV2X2dyb3Vwcwk9IHhlbmJ1c19kZXZfZ3JvdXBzLAogCX0sCiB9OwpkaWZmIC0tZ2l0IGEvZHJp
dmVycy94ZW4veGVuYnVzL3hlbmJ1c19wcm9iZV9mcm9udGVuZC5jIGIvZHJpdmVycy94ZW4veGVu
YnVzL3hlbmJ1c19wcm9iZV9mcm9udGVuZC5jCmluZGV4IGE3ZDkwYTcxOWNlYS4uOGExNjUwYmJl
MThmIDEwMDY0NAotLS0gYS9kcml2ZXJzL3hlbi94ZW5idXMveGVuYnVzX3Byb2JlX2Zyb250ZW5k
LmMKKysrIGIvZHJpdmVycy94ZW4veGVuYnVzL3hlbmJ1c19wcm9iZV9mcm9udGVuZC5jCkBAIC0x
MjYsNiArMTI2LDI4IEBAIHN0YXRpYyBpbnQgeGVuYnVzX2Zyb250ZW5kX2Rldl9wcm9iZShzdHJ1
Y3QgZGV2aWNlICpkZXYpCiAJcmV0dXJuIHhlbmJ1c19kZXZfcHJvYmUoZGV2KTsKIH0KIAorc3Rh
dGljIHZvaWQgeGVuYnVzX2Zyb250ZW5kX2Rldl9zaHV0ZG93bihzdHJ1Y3QgZGV2aWNlICpfZGV2
KQoreworCXN0cnVjdCB4ZW5idXNfZGV2aWNlICpkZXYgPSB0b194ZW5idXNfZGV2aWNlKF9kZXYp
OworCXVuc2lnbmVkIGxvbmcgdGltZW91dCA9IDUqSFo7CisKKwlEUFJJTlRLKCIlcyIsIGRldi0+
bm9kZW5hbWUpOworCisJZ2V0X2RldmljZSgmZGV2LT5kZXYpOworCWlmIChkZXYtPnN0YXRlICE9
IFhlbmJ1c1N0YXRlQ29ubmVjdGVkKSB7CisJCXByX2luZm8oIiVzOiAlczogJXMgIT0gQ29ubmVj
dGVkLCBza2lwcGluZ1xuIiwKKwkJCV9fZnVuY19fLCBkZXYtPm5vZGVuYW1lLCB4ZW5idXNfc3Ry
c3RhdGUoZGV2LT5zdGF0ZSkpOworCQlnb3RvIG91dDsKKwl9CisJeGVuYnVzX3N3aXRjaF9zdGF0
ZShkZXYsIFhlbmJ1c1N0YXRlQ2xvc2luZyk7CisJdGltZW91dCA9IHdhaXRfZm9yX2NvbXBsZXRp
b25fdGltZW91dCgmZGV2LT5kb3duLCB0aW1lb3V0KTsKKwlpZiAoIXRpbWVvdXQpCisJCXByX2lu
Zm8oIiVzOiAlcyB0aW1lb3V0IGNsb3NpbmcgZGV2aWNlXG4iLAorCQkJX19mdW5jX18sIGRldi0+
bm9kZW5hbWUpOworIG91dDoKKwlwdXRfZGV2aWNlKCZkZXYtPmRldik7Cit9CisKIHN0YXRpYyBj
b25zdCBzdHJ1Y3QgZGV2X3BtX29wcyB4ZW5idXNfcG1fb3BzID0gewogCS5zdXNwZW5kCT0geGVu
YnVzX2Rldl9zdXNwZW5kLAogCS5yZXN1bWUJCT0geGVuYnVzX2Zyb250ZW5kX2Rldl9yZXN1bWUs
CkBAIC0xNDYsNyArMTY4LDcgQEAgc3RhdGljIHN0cnVjdCB4ZW5fYnVzX3R5cGUgeGVuYnVzX2Zy
b250ZW5kID0gewogCQkudWV2ZW50CQk9IHhlbmJ1c191ZXZlbnRfZnJvbnRlbmQsCiAJCS5wcm9i
ZQkJPSB4ZW5idXNfZnJvbnRlbmRfZGV2X3Byb2JlLAogCQkucmVtb3ZlCQk9IHhlbmJ1c19kZXZf
cmVtb3ZlLAotCQkuc2h1dGRvd24JPSB4ZW5idXNfZGV2X3NodXRkb3duLAorCQkuc2h1dGRvd24J
PSB4ZW5idXNfZnJvbnRlbmRfZGV2X3NodXRkb3duLAogCQkuZGV2X2dyb3Vwcwk9IHhlbmJ1c19k
ZXZfZ3JvdXBzLAogCiAJCS5wbQkJPSAmeGVuYnVzX3BtX29wcywKLS0gCjIuMjAuMQoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
