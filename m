Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0238118BC6
	for <lists+xen-devel@lfdr.de>; Tue, 10 Dec 2019 15:57:55 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iegt1-0006RL-7g; Tue, 10 Dec 2019 14:53:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ERUJ=2A=amazon.com=prvs=2402c4381=pdurrant@srs-us1.protection.inumbo.net>)
 id 1iegsz-0006RG-79
 for xen-devel@lists.xenproject.org; Tue, 10 Dec 2019 14:53:13 +0000
X-Inumbo-ID: c9dd2980-1b5c-11ea-88e7-bc764e2007e4
Received: from smtp-fw-2101.amazon.com (unknown [72.21.196.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c9dd2980-1b5c-11ea-88e7-bc764e2007e4;
 Tue, 10 Dec 2019 14:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1575989592; x=1607525592;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=NAV6kZQrewVA32BcVnXou+TwbV5q6MZxjxEtrGeNo8M=;
 b=RNJhtl/XlmTHq2BOYV4AjGGq0hdpCL9Zov36OXVQSJQSgvCj/KWMknkU
 O6ekift68LkwvukdyveJNzxGE7VCWQW9SIGrPV9DezgzVCGoGJRx+8XOb
 nG0Hd4ZS2bng1gDYOnEyNwO38NHnUz7x3ESc4ndvw0qMCxdwRp/uLjgGu M=;
IronPort-SDR: wVWUhxat8iw5Q6ERyDQmmnGyVDPqrDPvphLeTNPJ5eufTf7zRgq8/rqezj2Zfh8mbPGQUj9a9W
 6wuUfkDS+udQ==
X-IronPort-AV: E=Sophos;i="5.69,300,1571702400"; 
   d="scan'208";a="7928558"
Received: from iad6-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-2a-119b4f96.us-west-2.amazon.com) ([10.124.125.2])
 by smtp-border-fw-out-2101.iad2.amazon.com with ESMTP;
 10 Dec 2019 14:53:11 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2a-119b4f96.us-west-2.amazon.com (Postfix) with ESMTPS
 id A2C651A1EEE; Tue, 10 Dec 2019 14:53:10 +0000 (UTC)
Received: from EX13D32EUB002.ant.amazon.com (10.43.166.114) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 10 Dec 2019 14:53:10 +0000
Received: from EX13MTAUEA001.ant.amazon.com (10.43.61.82) by
 EX13D32EUB002.ant.amazon.com (10.43.166.114) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 10 Dec 2019 14:53:09 +0000
Received: from u2f063a87eabd5f.cbg10.amazon.com (10.125.106.135) by
 mail-relay.amazon.com (10.43.61.243) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Tue, 10 Dec 2019 14:53:07 +0000
From: Paul Durrant <pdurrant@amazon.com>
To: <xen-devel@lists.xenproject.org>, <linux-block@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Date: Tue, 10 Dec 2019 14:53:05 +0000
Message-ID: <20191210145305.6605-1-pdurrant@amazon.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH] xen-blkback: prevent premature module unload
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Jens Axboe <axboe@kernel.dk>, Paul Durrant <pdurrant@amazon.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T2JqZWN0cyBhbGxvY2F0ZWQgYnkgeGVuX2Jsa2lmX2FsbG9jIGNvbWUgZnJvbSB0aGUgJ2Jsa2lm
X2NhY2hlJyBrbWVtCmNhY2hlLiBUaGlzIGNhY2hlIGlzIGRlc3RveWVkIHdoZW4geGVuLWJsa2lm
IGlzIHVubG9hZGVkIHNvIGl0IGlzCm5lY2Vzc2FyeSB0byB3YWl0IGZvciB0aGUgZGVmZXJyZWQg
ZnJlZSByb3V0aW5lIHVzZWQgZm9yIHN1Y2ggb2JqZWN0cyB0bwpjb21wbGV0ZS4gVGhpcyBuZWNl
c3NpdHkgd2FzIG1pc3NlZCBpbiBjb21taXQgMTQ4NTU5NTRmNjM2ICJ4ZW4tYmxrYmFjazoKYWxs
b3cgbW9kdWxlIHRvIGJlIGNsZWFubHkgdW5sb2FkZWQiLiBUaGlzIHBhdGNoIGZpeGVzIHRoZSBw
cm9ibGVtIGJ5CnRha2luZy9yZWxlYXNpbmcgZXh0cmEgbW9kdWxlIHJlZmVyZW5jZXMgaW4geGVu
X2Jsa2lmX2FsbG9jL2ZyZWUoKQpyZXNwZWN0aXZlbHkuCgpTaWduZWQtb2ZmLWJ5OiBQYXVsIER1
cnJhbnQgPHBkdXJyYW50QGFtYXpvbi5jb20+Ci0tLQpDYzogS29ucmFkIFJ6ZXN6dXRlayBXaWxr
IDxrb25yYWQud2lsa0BvcmFjbGUuY29tPgpDYzogIlJvZ2VyIFBhdSBNb25uw6kiIDxyb2dlci5w
YXVAY2l0cml4LmNvbT4KQ2M6IEplbnMgQXhib2UgPGF4Ym9lQGtlcm5lbC5kaz4KLS0tCiBkcml2
ZXJzL2Jsb2NrL3hlbi1ibGtiYWNrL3hlbmJ1cy5jIHwgMTAgKysrKysrKysrKwogMSBmaWxlIGNo
YW5nZWQsIDEwIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2Jsb2NrL3hlbi1i
bGtiYWNrL3hlbmJ1cy5jIGIvZHJpdmVycy9ibG9jay94ZW4tYmxrYmFjay94ZW5idXMuYwppbmRl
eCBlOGM1YzU0ZTFkMjYuLjU5ZDU3NmQyN2NhNyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ibG9jay94
ZW4tYmxrYmFjay94ZW5idXMuYworKysgYi9kcml2ZXJzL2Jsb2NrL3hlbi1ibGtiYWNrL3hlbmJ1
cy5jCkBAIC0xNzEsNiArMTcxLDE1IEBAIHN0YXRpYyBzdHJ1Y3QgeGVuX2Jsa2lmICp4ZW5fYmxr
aWZfYWxsb2MoZG9taWRfdCBkb21pZCkKIAlibGtpZi0+ZG9taWQgPSBkb21pZDsKIAlhdG9taWNf
c2V0KCZibGtpZi0+cmVmY250LCAxKTsKIAlpbml0X2NvbXBsZXRpb24oJmJsa2lmLT5kcmFpbl9j
b21wbGV0ZSk7CisKKwkvKgorCSAqIEJlY2F1c2UgZnJlZWluZyBiYWNrIHRvIHRoZSBjYWNoZSBt
YXkgYmUgZGVmZXJyZWQsIGl0IGlzIG5vdAorCSAqIHNhZmUgdG8gdW5sb2FkIHRoZSBtb2R1bGUg
KGFuZCBoZW5jZSBkZXN0cm95IHRoZSBjYWNoZSkgdW50aWwKKwkgKiB0aGlzIGhhcyBjb21wbGV0
ZWQuIFRvIHByZXZlbnQgcHJlbWF0dXJlIHVubG9hZGluZywgdGFrZSBhbgorCSAqIGV4dHJhIG1v
ZHVsZSByZWZlcmVuY2UgaGVyZSBhbmQgcmVsZWFzZSBvbmx5IHdoZW4gdGhlIG9iamVjdAorCSAq
IGhhcyBiZWVuIGZyZWUgYmFjayB0byB0aGUgY2FjaGUuCisJICovCisJX19tb2R1bGVfZ2V0KFRI
SVNfTU9EVUxFKTsKIAlJTklUX1dPUksoJmJsa2lmLT5mcmVlX3dvcmssIHhlbl9ibGtpZl9kZWZl
cnJlZF9mcmVlKTsKIAogCXJldHVybiBibGtpZjsKQEAgLTMyMCw2ICszMjksNyBAQCBzdGF0aWMg
dm9pZCB4ZW5fYmxraWZfZnJlZShzdHJ1Y3QgeGVuX2Jsa2lmICpibGtpZikKIAogCS8qIE1ha2Ug
c3VyZSBldmVyeXRoaW5nIGlzIGRyYWluZWQgYmVmb3JlIHNodXR0aW5nIGRvd24gKi8KIAlrbWVt
X2NhY2hlX2ZyZWUoeGVuX2Jsa2lmX2NhY2hlcCwgYmxraWYpOworCW1vZHVsZV9wdXQoVEhJU19N
T0RVTEUpOwogfQogCiBpbnQgX19pbml0IHhlbl9ibGtpZl9pbnRlcmZhY2VfaW5pdCh2b2lkKQot
LSAKMi4yMC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
