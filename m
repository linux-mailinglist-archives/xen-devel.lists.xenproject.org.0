Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7209BEEF3
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 11:52:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDQPL-00078w-Kf; Thu, 26 Sep 2019 09:49:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ph5t=XV=amazon.com=prvs=165c3e20f=hongyax@srs-us1.protection.inumbo.net>)
 id 1iDQPJ-00075X-59
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 09:49:53 +0000
X-Inumbo-ID: fcd3d69a-e042-11e9-97fb-bc764e2007e4
Received: from smtp-fw-6002.amazon.com (unknown [52.95.49.90])
 by localhost (Halon) with ESMTPS
 id fcd3d69a-e042-11e9-97fb-bc764e2007e4;
 Thu, 26 Sep 2019 09:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1569491392; x=1601027392;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=hLhaqBqKlhsYdBQLmVKD140d9/Kwf8o4PkFJCGHBtN4=;
 b=iKzwo0UhQ7J1u2IhnJXXBYLBin2GNjjhjBAeAtELD6ufWbP8d2AZ2ZBf
 Ycs6/QpskEEIonYM1c7pIckscnzaiNChGvxZgjHUxrrPhhkyCPdGPszCH
 dFOlC4zHJFae+lGJYUoEYThgitjEIq0Ust8jsPDgAmSJyj3rfptufwdMv Y=;
X-IronPort-AV: E=Sophos;i="5.64,551,1559520000"; d="scan'208";a="423750784"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1e-62350142.us-east-1.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP;
 26 Sep 2019 09:49:52 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1e-62350142.us-east-1.amazon.com (Postfix) with ESMTPS
 id 0F489A1EF3; Thu, 26 Sep 2019 09:49:52 +0000 (UTC)
Received: from EX13D28EUB001.ant.amazon.com (10.43.166.50) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 26 Sep 2019 09:49:34 +0000
Received: from EX13MTAUWA001.ant.amazon.com (10.43.160.58) by
 EX13D28EUB001.ant.amazon.com (10.43.166.50) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 26 Sep 2019 09:49:33 +0000
Received: from u9d785c4ba99158.ant.amazon.com (10.125.106.58) by
 mail-relay.amazon.com (10.43.160.118) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Thu, 26 Sep 2019 09:49:30 +0000
From: <hongyax@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 26 Sep 2019 10:46:35 +0100
Message-ID: <e5719944c6005ee7eebcdbee503baf26c106d14f.1569489002.git.hongyax@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1569489002.git.hongyax@amazon.com>
References: <cover.1569489002.git.hongyax@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [RFC PATCH 72/84] acpi: don't assume an always-mapped
 direct map in acpi allocations.
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Jan Beulich <jbeulich@suse.com>, Hongyan Xia <hongyax@amazon.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogSG9uZ3lhbiBYaWEgPGhvbmd5YXhAYW1hem9uLmNvbT4KClNpZ25lZC1vZmYtYnk6IEhv
bmd5YW4gWGlhIDxob25neWF4QGFtYXpvbi5jb20+Ci0tLQogeGVuL2RyaXZlcnMvYWNwaS9vc2wu
YyB8IDQxICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tCiAxIGZpbGUg
Y2hhbmdlZCwgMjkgaW5zZXJ0aW9ucygrKSwgMTIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
eGVuL2RyaXZlcnMvYWNwaS9vc2wuYyBiL3hlbi9kcml2ZXJzL2FjcGkvb3NsLmMKaW5kZXggNGM4
YmI3ODM5ZS4uZGJmNjIzMjVmMyAxMDA2NDQKLS0tIGEveGVuL2RyaXZlcnMvYWNwaS9vc2wuYwor
KysgYi94ZW4vZHJpdmVycy9hY3BpL29zbC5jCkBAIC0yMTYsMTQgKzIxNiwyNSBAQCBhY3BpX29z
X3dyaXRlX21lbW9yeShhY3BpX3BoeXNpY2FsX2FkZHJlc3MgcGh5c19hZGRyLCB1MzIgdmFsdWUs
IHUzMiB3aWR0aCkKIAogdm9pZCAqX19pbml0IGFjcGlfb3NfYWxsb2NfbWVtb3J5KHNpemVfdCBz
eikKIHsKLQl2b2lkICpwdHI7Ci0KLQlpZiAoc3lzdGVtX3N0YXRlID09IFNZU19TVEFURV9lYXJs
eV9ib290KQotCQlyZXR1cm4gbWZuX3RvX3ZpcnQobWZuX3goYWxsb2NfYm9vdF9wYWdlcyhQRk5f
VVAoc3opLCAxKSkpOwotCi0JcHRyID0geG1hbGxvY19ieXRlcyhzeik7Ci0JQVNTRVJUKCFwdHIg
fHwgaXNfeG1hbGxvY19tZW1vcnkocHRyKSk7Ci0JcmV0dXJuIHB0cjsKKyAgICB2b2lkICpwdHI7
CisgICAgdW5zaWduZWQgbG9uZyBucl9wZm5zID0gUEZOX1VQKHN6KTsKKyAgICBtZm5fdCBtZm47
CisKKyAgICBpZiAoc3lzdGVtX3N0YXRlID09IFNZU19TVEFURV9lYXJseV9ib290KQorICAgIHsK
KyAgICAgICAgbWZuID0gYWxsb2NfYm9vdF9wYWdlcyhucl9wZm5zLCAxKTsKKyAgICAgICAgcHRy
ID0gbWZuX3RvX3ZpcnQobWZuX3gobWZuKSk7CisgICAgICAgIC8qCisgICAgICAgICAqIERpcmVj
dCBtYXAgaXMgZ2FyYmFnZSBub3csIGZpbGwgdGhlIGFjdHVhbCBtYXBwaW5nLiBTYWZlIHRvIGRv
IHNvCisgICAgICAgICAqIG5vdyBiZWNhdXNlIG1hcF9wYWdlcyBnb3QgcmlkIG9mIHRoZSBkaXJl
Y3QgbWFwIGV2ZW4gaW4gZWFybHkgYm9vdC4KKyAgICAgICAgICovCisgICAgICAgIG1hcF9wYWdl
c190b194ZW4oKHVuc2lnbmVkIGxvbmcpcHRyLCBtZm4sIG5yX3BmbnMsIFBBR0VfSFlQRVJWSVNP
Uik7CisgICAgICAgIHJldHVybiBwdHI7CisgICAgfQorCisgICAgcHRyID0geG1hbGxvY19ieXRl
cyhzeik7CisgICAgQVNTRVJUKCFwdHIgfHwgaXNfeG1hbGxvY19tZW1vcnkocHRyKSk7CisgICAg
cmV0dXJuIHB0cjsKIH0KIAogdm9pZCAqX19pbml0IGFjcGlfb3NfemFsbG9jX21lbW9yeShzaXpl
X3Qgc3opCkBAIC0yNDEsOCArMjUyLDE0IEBAIHZvaWQgKl9faW5pdCBhY3BpX29zX3phbGxvY19t
ZW1vcnkoc2l6ZV90IHN6KQogCiB2b2lkIF9faW5pdCBhY3BpX29zX2ZyZWVfbWVtb3J5KHZvaWQg
KnB0cikKIHsKLQlpZiAoaXNfeG1hbGxvY19tZW1vcnkocHRyKSkKLQkJeGZyZWUocHRyKTsKLQll
bHNlIGlmIChwdHIgJiYgc3lzdGVtX3N0YXRlID09IFNZU19TVEFURV9lYXJseV9ib290KQotCQlp
bml0X2Jvb3RfcGFnZXMoX19wYShwdHIpLCBfX3BhKHB0cikgKyBQQUdFX1NJWkUpOworICAgIG1m
bl90IG1mbjsKKyAgICBpZiAoaXNfeG1hbGxvY19tZW1vcnkocHRyKSkKKyAgICAgICAgeGZyZWUo
cHRyKTsKKyAgICBlbHNlIGlmIChwdHIgJiYgc3lzdGVtX3N0YXRlID09IFNZU19TVEFURV9lYXJs
eV9ib290KQorICAgIHsKKyAgICAgICAgaW5pdF9ib290X3BhZ2VzKF9fcGEocHRyKSwgX19wYShw
dHIpICsgUEFHRV9TSVpFKTsKKyAgICAgICAgLyogQWxzbyB1bm1hcCBpbiB0aGUgMToxIHJlZ2lv
biBmb3Igc2VjdXJpdHkuICovCisgICAgICAgIG1mbiA9IF9tZm4odmlydF90b19tZm4ocHRyKSk7
CisgICAgICAgIG1hcF9wYWdlc190b194ZW4oKHVuc2lnbmVkIGxvbmcpcHRyLCBtZm4sIDEsIF9Q
QUdFX05PTkUpOworICAgIH0KIH0KLS0gCjIuMTcuMQoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
