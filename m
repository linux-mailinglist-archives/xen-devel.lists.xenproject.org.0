Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B79610D4F1
	for <lists+xen-devel@lfdr.de>; Fri, 29 Nov 2019 12:34:23 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iaeV1-0007sJ-Qm; Fri, 29 Nov 2019 11:31:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3pi/=ZV=amazon.com=prvs=22965b742=pdurrant@srs-us1.protection.inumbo.net>)
 id 1iaeV0-0007s4-9d
 for xen-devel@lists.xenproject.org; Fri, 29 Nov 2019 11:31:46 +0000
X-Inumbo-ID: d1845b82-129b-11ea-a3e3-12813bfff9fa
Received: from smtp-fw-2101.amazon.com (unknown [72.21.196.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d1845b82-129b-11ea-a3e3-12813bfff9fa;
 Fri, 29 Nov 2019 11:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1575027104; x=1606563104;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=mMhOHfzPWPTlT1F2YNHMoR0lHgdtufqIO3c7y6opQtU=;
 b=AdSiDDeeX1p0uLSk14CA3pK6BmTY3b0vpuEM5f2upXnFTCE0vmW8ja2H
 bYPk1RZ6d7bWXtHlTmKtGZwe5dAeK7QcXi8/w02p8UxqDUzG/XUq4WLl9
 sWO3v46/kaxrhN3jcDg2wb1h/ssoFLpjydD3DTdb48pohFNejoSSX5izT Y=;
IronPort-SDR: tCTMha4UmWWdKldyDrvAlDYY68CEDgb6gKIYIsC2/pdiXNN710kvSXEsC3MIFWRdVM2fK2ap+j
 uQsRzkoyT6Qg==
X-IronPort-AV: E=Sophos;i="5.69,257,1571702400"; 
   d="scan'208";a="6338463"
Received: from iad6-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-1a-67b371d8.us-east-1.amazon.com) ([10.124.125.2])
 by smtp-border-fw-out-2101.iad2.amazon.com with ESMTP;
 29 Nov 2019 11:31:41 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1a-67b371d8.us-east-1.amazon.com (Postfix) with ESMTPS
 id CEE4EA1803; Fri, 29 Nov 2019 11:31:38 +0000 (UTC)
Received: from EX13D32EUB003.ant.amazon.com (10.43.166.165) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 29 Nov 2019 11:31:38 +0000
Received: from EX13MTAUWB001.ant.amazon.com (10.43.161.207) by
 EX13D32EUB003.ant.amazon.com (10.43.166.165) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 29 Nov 2019 11:31:37 +0000
Received: from u2f063a87eabd5f.cbg10.amazon.com (10.125.106.135) by
 mail-relay.amazon.com (10.43.161.249) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Fri, 29 Nov 2019 11:31:34 +0000
From: Paul Durrant <pdurrant@amazon.com>
To: <xen-devel@lists.xenproject.org>, <linux-block@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Date: Fri, 29 Nov 2019 11:31:31 +0000
Message-ID: <20191129113131.1954-1-pdurrant@amazon.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH] xen-blkback: allow module to be cleanly unloaded
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

QWRkIGEgbW9kdWxlX2V4aXQoKSB0byBwZXJmb3JtIHRoZSBuZWNlc3NhcnkgY2xlYW4tdXAuIEFs
c28gYWRkCl9fbW9kdWxlX2dldCgpIGFuZCBtb2R1bGVfcHV0KCkgY2FsbHMgaW50byB4ZW5fYmxr
aWZfYWxsb2MoKSBhbmQKeGVuX2Jsa2lmX2ZyZWUoKSByZXNwZWN0aXZlbHkgdG8gbWFrZSBzdXJl
IGFuIGluLXVzZSBtb2R1bGUgY2Fubm90IGJlCnVubG9hZGVkLgoKU2lnbmVkLW9mZi1ieTogUGF1
bCBEdXJyYW50IDxwZHVycmFudEBhbWF6b24uY29tPgotLS0KQ2M6IEtvbnJhZCBSemVzenV0ZWsg
V2lsayA8a29ucmFkLndpbGtAb3JhY2xlLmNvbT4KQ2M6ICJSb2dlciBQYXUgTW9ubsOpIiA8cm9n
ZXIucGF1QGNpdHJpeC5jb20+CkNjOiBKZW5zIEF4Ym9lIDxheGJvZUBrZXJuZWwuZGs+Ci0tLQog
ZHJpdmVycy9ibG9jay94ZW4tYmxrYmFjay9ibGtiYWNrLmMgfCAgOCArKysrKysrKwogZHJpdmVy
cy9ibG9jay94ZW4tYmxrYmFjay9jb21tb24uaCAgfCAgMyArKysKIGRyaXZlcnMvYmxvY2sveGVu
LWJsa2JhY2sveGVuYnVzLmMgIHwgMTUgKysrKysrKysrKysrKysrCiAzIGZpbGVzIGNoYW5nZWQs
IDI2IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2Jsb2NrL3hlbi1ibGtiYWNr
L2Jsa2JhY2suYyBiL2RyaXZlcnMvYmxvY2sveGVuLWJsa2JhY2svYmxrYmFjay5jCmluZGV4IGZk
MWUxOWYxYTQ5Zi4uZTU2MmE3ZTIwYzNjIDEwMDY0NAotLS0gYS9kcml2ZXJzL2Jsb2NrL3hlbi1i
bGtiYWNrL2Jsa2JhY2suYworKysgYi9kcml2ZXJzL2Jsb2NrL3hlbi1ibGtiYWNrL2Jsa2JhY2su
YwpAQCAtMTUwNCw1ICsxNTA0LDEzIEBAIHN0YXRpYyBpbnQgX19pbml0IHhlbl9ibGtpZl9pbml0
KHZvaWQpCiAKIG1vZHVsZV9pbml0KHhlbl9ibGtpZl9pbml0KTsKIAorc3RhdGljIHZvaWQgX19l
eGl0IHhlbl9ibGtpZl9maW5pKHZvaWQpCit7CisJeGVuX2Jsa2lmX3hlbmJ1c19maW5pKCk7CisJ
eGVuX2Jsa2lmX2ludGVyZmFjZV9maW5pKCk7Cit9CisKK21vZHVsZV9leGl0KHhlbl9ibGtpZl9m
aW5pKTsKKwogTU9EVUxFX0xJQ0VOU0UoIkR1YWwgQlNEL0dQTCIpOwogTU9EVUxFX0FMSUFTKCJ4
ZW4tYmFja2VuZDp2YmQiKTsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvYmxvY2sveGVuLWJsa2JhY2sv
Y29tbW9uLmggYi9kcml2ZXJzL2Jsb2NrL3hlbi1ibGtiYWNrL2NvbW1vbi5oCmluZGV4IDFkMzAw
MmQ3NzNmNy4uNDkxMzJiMGFkYmJlIDEwMDY0NAotLS0gYS9kcml2ZXJzL2Jsb2NrL3hlbi1ibGti
YWNrL2NvbW1vbi5oCisrKyBiL2RyaXZlcnMvYmxvY2sveGVuLWJsa2JhY2svY29tbW9uLmgKQEAg
LTM3NSw5ICszNzUsMTIgQEAgc3RydWN0IHBoeXNfcmVxIHsKIAlzdHJ1Y3QgYmxvY2tfZGV2aWNl
CSpiZGV2OwogCWJsa2lmX3NlY3Rvcl90CQlzZWN0b3JfbnVtYmVyOwogfTsKKwogaW50IHhlbl9i
bGtpZl9pbnRlcmZhY2VfaW5pdCh2b2lkKTsKK3ZvaWQgeGVuX2Jsa2lmX2ludGVyZmFjZV9maW5p
KHZvaWQpOwogCiBpbnQgeGVuX2Jsa2lmX3hlbmJ1c19pbml0KHZvaWQpOwordm9pZCB4ZW5fYmxr
aWZfeGVuYnVzX2Zpbmkodm9pZCk7CiAKIGlycXJldHVybl90IHhlbl9ibGtpZl9iZV9pbnQoaW50
IGlycSwgdm9pZCAqZGV2X2lkKTsKIGludCB4ZW5fYmxraWZfc2NoZWR1bGUodm9pZCAqYXJnKTsK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvYmxvY2sveGVuLWJsa2JhY2sveGVuYnVzLmMgYi9kcml2ZXJz
L2Jsb2NrL3hlbi1ibGtiYWNrL3hlbmJ1cy5jCmluZGV4IGI5MGRiY2Q5OWMwMy4uZjk0ODU4NGZj
ZjY2IDEwMDY0NAotLS0gYS9kcml2ZXJzL2Jsb2NrL3hlbi1ibGtiYWNrL3hlbmJ1cy5jCisrKyBi
L2RyaXZlcnMvYmxvY2sveGVuLWJsa2JhY2sveGVuYnVzLmMKQEAgLTE3Myw2ICsxNzMsOCBAQCBz
dGF0aWMgc3RydWN0IHhlbl9ibGtpZiAqeGVuX2Jsa2lmX2FsbG9jKGRvbWlkX3QgZG9taWQpCiAJ
aW5pdF9jb21wbGV0aW9uKCZibGtpZi0+ZHJhaW5fY29tcGxldGUpOwogCUlOSVRfV09SSygmYmxr
aWYtPmZyZWVfd29yaywgeGVuX2Jsa2lmX2RlZmVycmVkX2ZyZWUpOwogCisJX19tb2R1bGVfZ2V0
KFRISVNfTU9EVUxFKTsKKwogCXJldHVybiBibGtpZjsKIH0KIApAQCAtMzIwLDYgKzMyMiw4IEBA
IHN0YXRpYyB2b2lkIHhlbl9ibGtpZl9mcmVlKHN0cnVjdCB4ZW5fYmxraWYgKmJsa2lmKQogCiAJ
LyogTWFrZSBzdXJlIGV2ZXJ5dGhpbmcgaXMgZHJhaW5lZCBiZWZvcmUgc2h1dHRpbmcgZG93biAq
LwogCWttZW1fY2FjaGVfZnJlZSh4ZW5fYmxraWZfY2FjaGVwLCBibGtpZik7CisKKwltb2R1bGVf
cHV0KFRISVNfTU9EVUxFKTsKIH0KIAogaW50IF9faW5pdCB4ZW5fYmxraWZfaW50ZXJmYWNlX2lu
aXQodm9pZCkKQEAgLTMzMyw2ICszMzcsMTIgQEAgaW50IF9faW5pdCB4ZW5fYmxraWZfaW50ZXJm
YWNlX2luaXQodm9pZCkKIAlyZXR1cm4gMDsKIH0KIAordm9pZCB4ZW5fYmxraWZfaW50ZXJmYWNl
X2Zpbmkodm9pZCkKK3sKKwlrbWVtX2NhY2hlX2Rlc3Ryb3koeGVuX2Jsa2lmX2NhY2hlcCk7CisJ
eGVuX2Jsa2lmX2NhY2hlcCA9IE5VTEw7Cit9CisKIC8qCiAgKiAgc3lzZnMgaW50ZXJmYWNlIGZv
ciBWQkQgSS9PIHJlcXVlc3RzCiAgKi8KQEAgLTExMjIsMyArMTEzMiw4IEBAIGludCB4ZW5fYmxr
aWZfeGVuYnVzX2luaXQodm9pZCkKIHsKIAlyZXR1cm4geGVuYnVzX3JlZ2lzdGVyX2JhY2tlbmQo
Jnhlbl9ibGtia19kcml2ZXIpOwogfQorCit2b2lkIHhlbl9ibGtpZl94ZW5idXNfZmluaSh2b2lk
KQoreworCXhlbmJ1c191bnJlZ2lzdGVyX2RyaXZlcigmeGVuX2Jsa2JrX2RyaXZlcik7Cit9Ci0t
IAoyLjIwLjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
