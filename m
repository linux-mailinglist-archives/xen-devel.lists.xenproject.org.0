Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EF9C1250D8
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2019 19:41:46 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iheDB-0001Uc-0J; Wed, 18 Dec 2019 18:38:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=HzQX=2I=amazon.com=prvs=248bb817a=sjpark@srs-us1.protection.inumbo.net>)
 id 1iheD9-0001UK-SA
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2019 18:38:15 +0000
X-Inumbo-ID: 8d39d752-21c5-11ea-b6f1-bc764e2007e4
Received: from smtp-fw-9101.amazon.com (unknown [207.171.184.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8d39d752-21c5-11ea-b6f1-bc764e2007e4;
 Wed, 18 Dec 2019 18:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1576694296; x=1608230296;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=X93izDi+OFRUN5FGBE4eNUsCd4hh4S1nRuspQbSs7oM=;
 b=OKdsVNx3zdZWil7k1b98Aq9kGSQGo20rOFlb6+k6CRHNOIOEOFeL4uRt
 M4U7T3RltcNIZwEKpeBGfcfr0wu9AqjJ2H/xH83gDXrVhtuqf1AGRTLw7
 z4JsHDwRssnfcidIZPyOQSvuE+AtWSFx12UbxOYig2D0AIjCHhZIeYOgC s=;
IronPort-SDR: 64Fli9yuvExMGfRbUT1MKQQKAOTlqf1lk4tXWix7mjCiBKTTHMF3rmwQoOzo7MOUrxg7clLZ7v
 p+iJj47921wA==
X-IronPort-AV: E=Sophos;i="5.69,330,1571702400"; 
   d="scan'208";a="5909115"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2c-2225282c.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9101.sea19.amazon.com with ESMTP;
 18 Dec 2019 18:38:04 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2c-2225282c.us-west-2.amazon.com (Postfix) with ESMTPS
 id EE2D3A1E49; Wed, 18 Dec 2019 18:38:02 +0000 (UTC)
Received: from EX13D31EUA001.ant.amazon.com (10.43.165.15) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 18 Dec 2019 18:38:02 +0000
Received: from u886c93fd17d25d.ant.amazon.com (10.43.160.109) by
 EX13D31EUA001.ant.amazon.com (10.43.165.15) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 18 Dec 2019 18:37:57 +0000
From: SeongJae Park <sjpark@amazon.com>
To: <jgross@suse.com>, <axboe@kernel.dk>, <konrad.wilk@oracle.com>,
 <roger.pau@citrix.com>
Date: Wed, 18 Dec 2019 19:37:17 +0100
Message-ID: <20191218183718.31719-5-sjpark@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191218183718.31719-1-sjpark@amazon.com>
References: <20191218183718.31719-1-sjpark@amazon.com>
MIME-Version: 1.0
X-Originating-IP: [10.43.160.109]
X-ClientProxiedBy: EX13D10UWB003.ant.amazon.com (10.43.161.106) To
 EX13D31EUA001.ant.amazon.com (10.43.165.15)
Precedence: Bulk
Subject: [Xen-devel] [PATCH v13 4/5] xen/blkback: Remove unnecessary static
 variable name prefixes
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: linux-block@vger.kernel.org, sjpark@amazon.com, pdurrant@amazon.com,
 SeongJae Park <sjpark@amazon.de>, linux-kernel@vger.kernel.org,
 sj38.park@gmail.com, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogU2VvbmdKYWUgUGFyayA8c2pwYXJrQGFtYXpvbi5kZT4KCkEgZmV3IG9mIHN0YXRpYyB2
YXJpYWJsZXMgaW4gYmxrYmFjayBoYXZlICd4ZW5fYmxraWZfJyBwcmVmaXgsIHRob3VnaCBpdApp
cyB1bm5lY2Vzc2FyeSBmb3Igc3RhdGljIHZhcmlhYmxlcy4gIFRoaXMgY29tbWl0IHJlbW92ZXMg
c3VjaCBwcmVmaXhlcy4KClJldmlld2VkLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVA
Y2l0cml4LmNvbT4KU2lnbmVkLW9mZi1ieTogU2VvbmdKYWUgUGFyayA8c2pwYXJrQGFtYXpvbi5k
ZT4KLS0tCiBkcml2ZXJzL2Jsb2NrL3hlbi1ibGtiYWNrL2Jsa2JhY2suYyB8IDM3ICsrKysrKysr
KysrKystLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTcgaW5zZXJ0aW9ucygrKSwg
MjAgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ibG9jay94ZW4tYmxrYmFjay9i
bGtiYWNrLmMgYi9kcml2ZXJzL2Jsb2NrL3hlbi1ibGtiYWNrL2Jsa2JhY2suYwppbmRleCA3OWY2
NzdhZWI1Y2MuLmZiZDY3ZjhlNGU0ZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ibG9jay94ZW4tYmxr
YmFjay9ibGtiYWNrLmMKKysrIGIvZHJpdmVycy9ibG9jay94ZW4tYmxrYmFjay9ibGtiYWNrLmMK
QEAgLTYyLDggKzYyLDggQEAKICAqIElPIHdvcmtsb2Fkcy4KICAqLwogCi1zdGF0aWMgaW50IHhl
bl9ibGtpZl9tYXhfYnVmZmVyX3BhZ2VzID0gMTAyNDsKLW1vZHVsZV9wYXJhbV9uYW1lZChtYXhf
YnVmZmVyX3BhZ2VzLCB4ZW5fYmxraWZfbWF4X2J1ZmZlcl9wYWdlcywgaW50LCAwNjQ0KTsKK3N0
YXRpYyBpbnQgbWF4X2J1ZmZlcl9wYWdlcyA9IDEwMjQ7Cittb2R1bGVfcGFyYW1fbmFtZWQobWF4
X2J1ZmZlcl9wYWdlcywgbWF4X2J1ZmZlcl9wYWdlcywgaW50LCAwNjQ0KTsKIE1PRFVMRV9QQVJN
X0RFU0MobWF4X2J1ZmZlcl9wYWdlcywKICJNYXhpbXVtIG51bWJlciBvZiBmcmVlIHBhZ2VzIHRv
IGtlZXAgaW4gZWFjaCBibG9jayBiYWNrZW5kIGJ1ZmZlciIpOwogCkBAIC03OCw4ICs3OCw4IEBA
IE1PRFVMRV9QQVJNX0RFU0MobWF4X2J1ZmZlcl9wYWdlcywKICAqIGFsZ29yaXRobS4KICAqLwog
Ci1zdGF0aWMgaW50IHhlbl9ibGtpZl9tYXhfcGdyYW50cyA9IDEwNTY7Ci1tb2R1bGVfcGFyYW1f
bmFtZWQobWF4X3BlcnNpc3RlbnRfZ3JhbnRzLCB4ZW5fYmxraWZfbWF4X3BncmFudHMsIGludCwg
MDY0NCk7CitzdGF0aWMgaW50IG1heF9wZ3JhbnRzID0gMTA1NjsKK21vZHVsZV9wYXJhbV9uYW1l
ZChtYXhfcGVyc2lzdGVudF9ncmFudHMsIG1heF9wZ3JhbnRzLCBpbnQsIDA2NDQpOwogTU9EVUxF
X1BBUk1fREVTQyhtYXhfcGVyc2lzdGVudF9ncmFudHMsCiAgICAgICAgICAgICAgICAgICJNYXhp
bXVtIG51bWJlciBvZiBncmFudHMgdG8gbWFwIHBlcnNpc3RlbnRseSIpOwogCkBAIC04OCw4ICs4
OCw4IEBAIE1PRFVMRV9QQVJNX0RFU0MobWF4X3BlcnNpc3RlbnRfZ3JhbnRzLAogICogdXNlLiBU
aGUgdGltZSBpcyBpbiBzZWNvbmRzLCAwIG1lYW5zIGluZGVmaW5pdGVseSBsb25nLgogICovCiAK
LXN0YXRpYyB1bnNpZ25lZCBpbnQgeGVuX2Jsa2lmX3BncmFudF90aW1lb3V0ID0gNjA7Ci1tb2R1
bGVfcGFyYW1fbmFtZWQocGVyc2lzdGVudF9ncmFudF91bnVzZWRfc2Vjb25kcywgeGVuX2Jsa2lm
X3BncmFudF90aW1lb3V0LAorc3RhdGljIHVuc2lnbmVkIGludCBwZ3JhbnRfdGltZW91dCA9IDYw
OworbW9kdWxlX3BhcmFtX25hbWVkKHBlcnNpc3RlbnRfZ3JhbnRfdW51c2VkX3NlY29uZHMsIHBn
cmFudF90aW1lb3V0LAogCQkgICB1aW50LCAwNjQ0KTsKIE1PRFVMRV9QQVJNX0RFU0MocGVyc2lz
dGVudF9ncmFudF91bnVzZWRfc2Vjb25kcywKIAkJICJUaW1lIGluIHNlY29uZHMgYW4gdW51c2Vk
IHBlcnNpc3RlbnQgZ3JhbnQgaXMgYWxsb3dlZCB0byAiCkBAIC0xMzcsOSArMTM3LDggQEAgbW9k
dWxlX3BhcmFtKGxvZ19zdGF0cywgaW50LCAwNjQ0KTsKIAogc3RhdGljIGlubGluZSBib29sIHBl
cnNpc3RlbnRfZ250X3RpbWVvdXQoc3RydWN0IHBlcnNpc3RlbnRfZ250ICpwZXJzaXN0ZW50X2du
dCkKIHsKLQlyZXR1cm4geGVuX2Jsa2lmX3BncmFudF90aW1lb3V0ICYmCi0JICAgICAgIChqaWZm
aWVzIC0gcGVyc2lzdGVudF9nbnQtPmxhc3RfdXNlZCA+PQotCQlIWiAqIHhlbl9ibGtpZl9wZ3Jh
bnRfdGltZW91dCk7CisJcmV0dXJuIHBncmFudF90aW1lb3V0ICYmIChqaWZmaWVzIC0gcGVyc2lz
dGVudF9nbnQtPmxhc3RfdXNlZCA+PQorCQkJSFogKiBwZ3JhbnRfdGltZW91dCk7CiB9CiAKIHN0
YXRpYyBpbmxpbmUgaW50IGdldF9mcmVlX3BhZ2Uoc3RydWN0IHhlbl9ibGtpZl9yaW5nICpyaW5n
LCBzdHJ1Y3QgcGFnZSAqKnBhZ2UpCkBAIC0yMzQsNyArMjMzLDcgQEAgc3RhdGljIGludCBhZGRf
cGVyc2lzdGVudF9nbnQoc3RydWN0IHhlbl9ibGtpZl9yaW5nICpyaW5nLAogCXN0cnVjdCBwZXJz
aXN0ZW50X2dudCAqdGhpczsKIAlzdHJ1Y3QgeGVuX2Jsa2lmICpibGtpZiA9IHJpbmctPmJsa2lm
OwogCi0JaWYgKHJpbmctPnBlcnNpc3RlbnRfZ250X2MgPj0geGVuX2Jsa2lmX21heF9wZ3JhbnRz
KSB7CisJaWYgKHJpbmctPnBlcnNpc3RlbnRfZ250X2MgPj0gbWF4X3BncmFudHMpIHsKIAkJaWYg
KCFibGtpZi0+dmJkLm92ZXJmbG93X21heF9ncmFudHMpCiAJCQlibGtpZi0+dmJkLm92ZXJmbG93
X21heF9ncmFudHMgPSAxOwogCQlyZXR1cm4gLUVCVVNZOwpAQCAtMzk3LDE0ICszOTYsMTMgQEAg
c3RhdGljIHZvaWQgcHVyZ2VfcGVyc2lzdGVudF9nbnQoc3RydWN0IHhlbl9ibGtpZl9yaW5nICpy
aW5nKQogCQlnb3RvIG91dDsKIAl9CiAKLQlpZiAocmluZy0+cGVyc2lzdGVudF9nbnRfYyA8IHhl
bl9ibGtpZl9tYXhfcGdyYW50cyB8fAotCSAgICAocmluZy0+cGVyc2lzdGVudF9nbnRfYyA9PSB4
ZW5fYmxraWZfbWF4X3BncmFudHMgJiYKKwlpZiAocmluZy0+cGVyc2lzdGVudF9nbnRfYyA8IG1h
eF9wZ3JhbnRzIHx8CisJICAgIChyaW5nLT5wZXJzaXN0ZW50X2dudF9jID09IG1heF9wZ3JhbnRz
ICYmCiAJICAgICFyaW5nLT5ibGtpZi0+dmJkLm92ZXJmbG93X21heF9ncmFudHMpKSB7CiAJCW51
bV9jbGVhbiA9IDA7CiAJfSBlbHNlIHsKLQkJbnVtX2NsZWFuID0gKHhlbl9ibGtpZl9tYXhfcGdy
YW50cyAvIDEwMCkgKiBMUlVfUEVSQ0VOVF9DTEVBTjsKLQkJbnVtX2NsZWFuID0gcmluZy0+cGVy
c2lzdGVudF9nbnRfYyAtIHhlbl9ibGtpZl9tYXhfcGdyYW50cyArCi0JCQkgICAgbnVtX2NsZWFu
OworCQludW1fY2xlYW4gPSAobWF4X3BncmFudHMgLyAxMDApICogTFJVX1BFUkNFTlRfQ0xFQU47
CisJCW51bV9jbGVhbiA9IHJpbmctPnBlcnNpc3RlbnRfZ250X2MgLSBtYXhfcGdyYW50cyArIG51
bV9jbGVhbjsKIAkJbnVtX2NsZWFuID0gbWluKHJpbmctPnBlcnNpc3RlbnRfZ250X2MsIG51bV9j
bGVhbik7CiAJCXByX2RlYnVnKCJHb2luZyB0byBwdXJnZSBhdCBsZWFzdCAldSBwZXJzaXN0ZW50
IGdyYW50c1xuIiwKIAkJCSBudW1fY2xlYW4pOwpAQCAtNTk5LDggKzU5Nyw3IEBAIHN0YXRpYyB2
b2lkIHByaW50X3N0YXRzKHN0cnVjdCB4ZW5fYmxraWZfcmluZyAqcmluZykKIAkJIGN1cnJlbnQt
PmNvbW0sIHJpbmctPnN0X29vX3JlcSwKIAkJIHJpbmctPnN0X3JkX3JlcSwgcmluZy0+c3Rfd3Jf
cmVxLAogCQkgcmluZy0+c3RfZl9yZXEsIHJpbmctPnN0X2RzX3JlcSwKLQkJIHJpbmctPnBlcnNp
c3RlbnRfZ250X2MsCi0JCSB4ZW5fYmxraWZfbWF4X3BncmFudHMpOworCQkgcmluZy0+cGVyc2lz
dGVudF9nbnRfYywgbWF4X3BncmFudHMpOwogCXJpbmctPnN0X3ByaW50ID0gamlmZmllcyArIG1z
ZWNzX3RvX2ppZmZpZXMoMTAgKiAxMDAwKTsKIAlyaW5nLT5zdF9yZF9yZXEgPSAwOwogCXJpbmct
PnN0X3dyX3JlcSA9IDA7CkBAIC02NjAsNyArNjU3LDcgQEAgaW50IHhlbl9ibGtpZl9zY2hlZHVs
ZSh2b2lkICphcmcpCiAJCWlmICh0aW1lX2JlZm9yZShqaWZmaWVzLCBibGtpZi0+YnVmZmVyX3Nx
dWVlemVfZW5kKSkKIAkJCXNocmlua19mcmVlX3BhZ2Vwb29sKHJpbmcsIDApOwogCQllbHNlCi0J
CQlzaHJpbmtfZnJlZV9wYWdlcG9vbChyaW5nLCB4ZW5fYmxraWZfbWF4X2J1ZmZlcl9wYWdlcyk7
CisJCQlzaHJpbmtfZnJlZV9wYWdlcG9vbChyaW5nLCBtYXhfYnVmZmVyX3BhZ2VzKTsKIAogCQlp
ZiAobG9nX3N0YXRzICYmIHRpbWVfYWZ0ZXIoamlmZmllcywgcmluZy0+c3RfcHJpbnQpKQogCQkJ
cHJpbnRfc3RhdHMocmluZyk7CkBAIC04ODcsNyArODg0LDcgQEAgc3RhdGljIGludCB4ZW5fYmxr
YmtfbWFwKHN0cnVjdCB4ZW5fYmxraWZfcmluZyAqcmluZywKIAkJCWNvbnRpbnVlOwogCQl9CiAJ
CWlmICh1c2VfcGVyc2lzdGVudF9nbnRzICYmCi0JCSAgICByaW5nLT5wZXJzaXN0ZW50X2dudF9j
IDwgeGVuX2Jsa2lmX21heF9wZ3JhbnRzKSB7CisJCSAgICByaW5nLT5wZXJzaXN0ZW50X2dudF9j
IDwgbWF4X3BncmFudHMpIHsKIAkJCS8qCiAJCQkgKiBXZSBhcmUgdXNpbmcgcGVyc2lzdGVudCBn
cmFudHMsIHRoZSBncmFudCBpcwogCQkJICogbm90IG1hcHBlZCBidXQgd2UgbWlnaHQgaGF2ZSBy
b29tIGZvciBpdC4KQEAgLTkxNCw3ICs5MTEsNyBAQCBzdGF0aWMgaW50IHhlbl9ibGtia19tYXAo
c3RydWN0IHhlbl9ibGtpZl9yaW5nICpyaW5nLAogCQkJcGFnZXNbc2VnX2lkeF0tPnBlcnNpc3Rl
bnRfZ250ID0gcGVyc2lzdGVudF9nbnQ7CiAJCQlwcl9kZWJ1ZygiZ3JhbnQgJXUgYWRkZWQgdG8g
dGhlIHRyZWUgb2YgcGVyc2lzdGVudCBncmFudHMsIHVzaW5nICV1LyV1XG4iLAogCQkJCSBwZXJz
aXN0ZW50X2dudC0+Z250LCByaW5nLT5wZXJzaXN0ZW50X2dudF9jLAotCQkJCSB4ZW5fYmxraWZf
bWF4X3BncmFudHMpOworCQkJCSBtYXhfcGdyYW50cyk7CiAJCQlnb3RvIG5leHQ7CiAJCX0KIAkJ
aWYgKHVzZV9wZXJzaXN0ZW50X2dudHMgJiYgIWJsa2lmLT52YmQub3ZlcmZsb3dfbWF4X2dyYW50
cykgewotLSAKMi4xNy4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
