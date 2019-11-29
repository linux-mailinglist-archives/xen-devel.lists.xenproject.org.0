Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4898C10D645
	for <lists+xen-devel@lfdr.de>; Fri, 29 Nov 2019 14:45:58 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iagYh-00052t-BQ; Fri, 29 Nov 2019 13:43:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3pi/=ZV=amazon.com=prvs=22965b742=pdurrant@srs-us1.protection.inumbo.net>)
 id 1iagYf-00052L-HM
 for xen-devel@lists.xenproject.org; Fri, 29 Nov 2019 13:43:41 +0000
X-Inumbo-ID: 394d9fb6-12ae-11ea-a3e7-12813bfff9fa
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 394d9fb6-12ae-11ea-a3e7-12813bfff9fa;
 Fri, 29 Nov 2019 13:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1575035011; x=1606571011;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0wuTXRU4Sy8QrykGuOio8VY85s141Nvd7sQNiwx40z8=;
 b=sfv/v4HzwB1k+h1OgJ8U207/x+JYnHHs3OFO6YXM9r7wk/jif18LwyFL
 DSPaBpQIz5Krd0Zdd2U9e8AxGJuSGYzu6iYIbYRV/HC5jeQ7Yl81Ftg2s
 JBG+qWrKOAlvkcH3L/0IEexsY8sD5zdGBQDMaIZOVhFQLCeAQ8D8Tdaz4 I=;
IronPort-SDR: PBJTPM/Se4EKdY7tZTf7JHYfAIWVI3TYanP7jOXFt5RONVywmOc7tTicSTzn8H1zkwS88WrFlx
 x3Xvxe9RwsnA==
X-IronPort-AV: E=Sophos;i="5.69,257,1571702400"; d="scan'208";a="10582601"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1d-98acfc19.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 29 Nov 2019 13:43:23 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1d-98acfc19.us-east-1.amazon.com (Postfix) with ESMTPS
 id 144ECA292A; Fri, 29 Nov 2019 13:43:20 +0000 (UTC)
Received: from EX13D32EUB004.ant.amazon.com (10.43.166.212) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 29 Nov 2019 13:43:20 +0000
Received: from EX13MTAUEE001.ant.amazon.com (10.43.62.200) by
 EX13D32EUB004.ant.amazon.com (10.43.166.212) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 29 Nov 2019 13:43:19 +0000
Received: from u2f063a87eabd5f.cbg10.amazon.com (10.125.106.135) by
 mail-relay.amazon.com (10.43.62.226) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Fri, 29 Nov 2019 13:43:17 +0000
From: Paul Durrant <pdurrant@amazon.com>
To: <linux-block@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <xen-devel@lists.xenproject.org>
Date: Fri, 29 Nov 2019 13:43:06 +0000
Message-ID: <20191129134306.2738-3-pdurrant@amazon.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191129134306.2738-1-pdurrant@amazon.com>
References: <20191129134306.2738-1-pdurrant@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v2 2/2] block/xen-blkback: allow module to be
 cleanly unloaded
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

QWRkIGEgbW9kdWxlX2V4aXQoKSB0byBwZXJmb3JtIHRoZSBuZWNlc3NhcnkgY2xlYW4tdXAuCgpT
aWduZWQtb2ZmLWJ5OiBQYXVsIER1cnJhbnQgPHBkdXJyYW50QGFtYXpvbi5jb20+Ci0tLQpDYzog
S29ucmFkIFJ6ZXN6dXRlayBXaWxrIDxrb25yYWQud2lsa0BvcmFjbGUuY29tPgpDYzogIlJvZ2Vy
IFBhdSBNb25uw6kiIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KQ2M6IEplbnMgQXhib2UgPGF4Ym9l
QGtlcm5lbC5kaz4KCnYyOgogLSBEcm9wIHRoZSBhZGRpdGlvbiBvZiBhZC1ob2MgcmVmZXJlbmNl
IGNvdW50aW5nIGFzIHRoaXMgaXMgbm93IGRvbmUKICAgY2VudHJhbGx5IGluIHhlbmJ1cwotLS0K
IGRyaXZlcnMvYmxvY2sveGVuLWJsa2JhY2svYmxrYmFjay5jIHwgIDggKysrKysrKysKIGRyaXZl
cnMvYmxvY2sveGVuLWJsa2JhY2svY29tbW9uLmggIHwgIDMgKysrCiBkcml2ZXJzL2Jsb2NrL3hl
bi1ibGtiYWNrL3hlbmJ1cy5jICB8IDExICsrKysrKysrKysrCiAzIGZpbGVzIGNoYW5nZWQsIDIy
IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2Jsb2NrL3hlbi1ibGtiYWNrL2Js
a2JhY2suYyBiL2RyaXZlcnMvYmxvY2sveGVuLWJsa2JhY2svYmxrYmFjay5jCmluZGV4IGZkMWUx
OWYxYTQ5Zi4uZTU2MmE3ZTIwYzNjIDEwMDY0NAotLS0gYS9kcml2ZXJzL2Jsb2NrL3hlbi1ibGti
YWNrL2Jsa2JhY2suYworKysgYi9kcml2ZXJzL2Jsb2NrL3hlbi1ibGtiYWNrL2Jsa2JhY2suYwpA
QCAtMTUwNCw1ICsxNTA0LDEzIEBAIHN0YXRpYyBpbnQgX19pbml0IHhlbl9ibGtpZl9pbml0KHZv
aWQpCiAKIG1vZHVsZV9pbml0KHhlbl9ibGtpZl9pbml0KTsKIAorc3RhdGljIHZvaWQgX19leGl0
IHhlbl9ibGtpZl9maW5pKHZvaWQpCit7CisJeGVuX2Jsa2lmX3hlbmJ1c19maW5pKCk7CisJeGVu
X2Jsa2lmX2ludGVyZmFjZV9maW5pKCk7Cit9CisKK21vZHVsZV9leGl0KHhlbl9ibGtpZl9maW5p
KTsKKwogTU9EVUxFX0xJQ0VOU0UoIkR1YWwgQlNEL0dQTCIpOwogTU9EVUxFX0FMSUFTKCJ4ZW4t
YmFja2VuZDp2YmQiKTsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvYmxvY2sveGVuLWJsa2JhY2svY29t
bW9uLmggYi9kcml2ZXJzL2Jsb2NrL3hlbi1ibGtiYWNrL2NvbW1vbi5oCmluZGV4IDFkMzAwMmQ3
NzNmNy4uNDkxMzJiMGFkYmJlIDEwMDY0NAotLS0gYS9kcml2ZXJzL2Jsb2NrL3hlbi1ibGtiYWNr
L2NvbW1vbi5oCisrKyBiL2RyaXZlcnMvYmxvY2sveGVuLWJsa2JhY2svY29tbW9uLmgKQEAgLTM3
NSw5ICszNzUsMTIgQEAgc3RydWN0IHBoeXNfcmVxIHsKIAlzdHJ1Y3QgYmxvY2tfZGV2aWNlCSpi
ZGV2OwogCWJsa2lmX3NlY3Rvcl90CQlzZWN0b3JfbnVtYmVyOwogfTsKKwogaW50IHhlbl9ibGtp
Zl9pbnRlcmZhY2VfaW5pdCh2b2lkKTsKK3ZvaWQgeGVuX2Jsa2lmX2ludGVyZmFjZV9maW5pKHZv
aWQpOwogCiBpbnQgeGVuX2Jsa2lmX3hlbmJ1c19pbml0KHZvaWQpOwordm9pZCB4ZW5fYmxraWZf
eGVuYnVzX2Zpbmkodm9pZCk7CiAKIGlycXJldHVybl90IHhlbl9ibGtpZl9iZV9pbnQoaW50IGly
cSwgdm9pZCAqZGV2X2lkKTsKIGludCB4ZW5fYmxraWZfc2NoZWR1bGUodm9pZCAqYXJnKTsKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvYmxvY2sveGVuLWJsa2JhY2sveGVuYnVzLmMgYi9kcml2ZXJzL2Js
b2NrL3hlbi1ibGtiYWNrL3hlbmJ1cy5jCmluZGV4IGI5MGRiY2Q5OWMwMy4uZThjNWM1NGUxZDI2
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2Jsb2NrL3hlbi1ibGtiYWNrL3hlbmJ1cy5jCisrKyBiL2Ry
aXZlcnMvYmxvY2sveGVuLWJsa2JhY2sveGVuYnVzLmMKQEAgLTMzMyw2ICszMzMsMTIgQEAgaW50
IF9faW5pdCB4ZW5fYmxraWZfaW50ZXJmYWNlX2luaXQodm9pZCkKIAlyZXR1cm4gMDsKIH0KIAor
dm9pZCB4ZW5fYmxraWZfaW50ZXJmYWNlX2Zpbmkodm9pZCkKK3sKKwlrbWVtX2NhY2hlX2Rlc3Ry
b3koeGVuX2Jsa2lmX2NhY2hlcCk7CisJeGVuX2Jsa2lmX2NhY2hlcCA9IE5VTEw7Cit9CisKIC8q
CiAgKiAgc3lzZnMgaW50ZXJmYWNlIGZvciBWQkQgSS9PIHJlcXVlc3RzCiAgKi8KQEAgLTExMjIs
MyArMTEyOCw4IEBAIGludCB4ZW5fYmxraWZfeGVuYnVzX2luaXQodm9pZCkKIHsKIAlyZXR1cm4g
eGVuYnVzX3JlZ2lzdGVyX2JhY2tlbmQoJnhlbl9ibGtia19kcml2ZXIpOwogfQorCit2b2lkIHhl
bl9ibGtpZl94ZW5idXNfZmluaSh2b2lkKQoreworCXhlbmJ1c191bnJlZ2lzdGVyX2RyaXZlcigm
eGVuX2Jsa2JrX2RyaXZlcik7Cit9Ci0tIAoyLjIwLjEKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
