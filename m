Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EEF65123132
	for <lists+xen-devel@lfdr.de>; Tue, 17 Dec 2019 17:11:54 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihFPL-0006ER-8u; Tue, 17 Dec 2019 16:09:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=mCDn=2H=amazon.com=prvs=2471a56b0=sjpark@srs-us1.protection.inumbo.net>)
 id 1ihFPJ-0006E4-DH
 for xen-devel@lists.xenproject.org; Tue, 17 Dec 2019 16:09:09 +0000
X-Inumbo-ID: 8dbaf349-20e7-11ea-8f0d-12813bfff9fa
Received: from smtp-fw-6001.amazon.com (unknown [52.95.48.154])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8dbaf349-20e7-11ea-8f0d-12813bfff9fa;
 Tue, 17 Dec 2019 16:09:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1576598949; x=1608134949;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=NVFC9qV2eoj93ZmYEaKEr4kRRmxcwtF4qCgUA1XgM8c=;
 b=EkarZcfbcLJiis14U3PlfKnn6WCG2T4H2I9FImCZfSU72ll8FOptUeAg
 mP0bBhdKvzCEULJS3p7ITdWfwM8+JtZxucLXEksFFu4CXpfawlJyY9c6q
 7m022sikd171xcVfcxZu2Fepb5WeUA/VBdjZoXb2vs4DzevMz9NlbqN/G s=;
IronPort-SDR: aRO1wLh9GqAmNNqsU3pay3V9ZmFMs4xiqfcPlG864PHeqR5P2dbee9CuQQFkIOZkbpvnzYiCR+
 QfjSy1l0Ljog==
X-IronPort-AV: E=Sophos;i="5.69,326,1571702400"; 
   d="scan'208";a="9472487"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2b-55156cd4.us-west-2.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP;
 17 Dec 2019 16:09:08 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2b-55156cd4.us-west-2.amazon.com (Postfix) with ESMTPS
 id 7C933A21FC; Tue, 17 Dec 2019 16:09:06 +0000 (UTC)
Received: from EX13D31EUA001.ant.amazon.com (10.43.165.15) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Tue, 17 Dec 2019 16:09:05 +0000
Received: from u886c93fd17d25d.ant.amazon.com (10.43.161.179) by
 EX13D31EUA001.ant.amazon.com (10.43.165.15) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 17 Dec 2019 16:09:00 +0000
From: SeongJae Park <sjpark@amazon.com>
To: <jgross@suse.com>, <axboe@kernel.dk>, <konrad.wilk@oracle.com>,
 <roger.pau@citrix.com>
Date: Tue, 17 Dec 2019 17:07:46 +0100
Message-ID: <20191217160748.693-5-sjpark@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191217160748.693-1-sjpark@amazon.com>
References: <20191217160748.693-1-sjpark@amazon.com>
MIME-Version: 1.0
X-Originating-IP: [10.43.161.179]
X-ClientProxiedBy: EX13d09UWC002.ant.amazon.com (10.43.162.102) To
 EX13D31EUA001.ant.amazon.com (10.43.165.15)
Precedence: Bulk
Subject: [Xen-devel] [PATCH v11 4/6] xen/blkback: Protect 'reclaim_memory()'
 with 'reclaim_lock'
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

RnJvbTogU2VvbmdKYWUgUGFyayA8c2pwYXJrQGFtYXpvbi5kZT4KClRoZSAncmVjbGFpbV9tZW1v
cnkoKScgY2FsbGJhY2sgb2YgYmxrYmFjayBjb3VsZCByYWNlIHdpdGgKJ3hlbl9ibGtia19wcm9i
ZSgpJyBhbmQgJ3hlbl9ibGtia19yZW1vdmUoKScuICBJbiB0aGUgY2FzZSwgaW5jb21wbGV0ZWx5
CmxpbmtlZCAnYmFja2VuZF9pbmZvJyBhbmQgJ2Jsa2lmJyBtaWdodCBiZSBleHBvc2VkIHRvIHRo
ZSBjYWxsYmFjaywgdGh1cwpyZXN1bHQgaW4gYmFkIHJlc3VsdHMgaW5jbHVkaW5nIE5VTEwgZGVy
ZWZlcmVuY2UuICBUaGlzIGNvbW1pdCBmaXhlcyB0aGUKcHJvYmxlbSBieSBhcHBseWluZyB0aGUg
J3JlY2xhaW1fbG9jaycgcHJvdGVjdGlvbiB0byB0aG9zZS4KCk5vdGUgdGhhdCB0aGlzIGNvbW1p
dCBpcyBzZXBhcmF0ZWQgZm9yIHJldmlldyBwdXJwb3NlIG9ubHkuICBBcyB0aGUKcHJldmlvdXMg
Y29tbWl0IG1pZ2h0IHJlc3VsdCBpbiByYWNlIGNvbmRpdGlvbiBhbmQgbWlnaHQgbWFrZSBiaXNl
Y3QKY29uZnVzZSwgcGxlYXNlIHNxdWFzaCB0aGlzIGNvbW1pdCBpbnRvIHByZXZpb3VzIGNvbW1p
dCBpZiBwb3NzaWJsZS4KClNpZ25lZC1vZmYtYnk6IFNlb25nSmFlIFBhcmsgPHNqcGFya0BhbWF6
b24uZGU+CgotLS0KIGRyaXZlcnMvYmxvY2sveGVuLWJsa2JhY2sveGVuYnVzLmMgfCAxMSArKysr
KysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2Jsb2NrL3hlbi1ibGtiYWNrL3hlbmJ1cy5jIGIvZHJpdmVycy9ibG9jay94ZW4tYmxr
YmFjay94ZW5idXMuYwppbmRleCA0ZjZlYTRmZWNhNzkuLjIwMDQ1ODI3YTM5MSAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ibG9jay94ZW4tYmxrYmFjay94ZW5idXMuYworKysgYi9kcml2ZXJzL2Jsb2Nr
L3hlbi1ibGtiYWNrL3hlbmJ1cy5jCkBAIC00OTIsNiArNDkyLDcgQEAgc3RhdGljIGludCB4ZW5f
dmJkX2NyZWF0ZShzdHJ1Y3QgeGVuX2Jsa2lmICpibGtpZiwgYmxraWZfdmRldl90IGhhbmRsZSwK
IHN0YXRpYyBpbnQgeGVuX2Jsa2JrX3JlbW92ZShzdHJ1Y3QgeGVuYnVzX2RldmljZSAqZGV2KQog
ewogCXN0cnVjdCBiYWNrZW5kX2luZm8gKmJlID0gZGV2X2dldF9kcnZkYXRhKCZkZXYtPmRldik7
CisJdW5zaWduZWQgbG9uZyBmbGFnczsKIAogCXByX2RlYnVnKCIlcyAlcCAlZFxuIiwgX19mdW5j
X18sIGRldiwgZGV2LT5vdGhlcmVuZF9pZCk7CiAKQEAgLTUwNCw2ICs1MDUsNyBAQCBzdGF0aWMg
aW50IHhlbl9ibGtia19yZW1vdmUoc3RydWN0IHhlbmJ1c19kZXZpY2UgKmRldikKIAkJYmUtPmJh
Y2tlbmRfd2F0Y2gubm9kZSA9IE5VTEw7CiAJfQogCisJc3Bpbl9sb2NrX2lycXNhdmUoJmRldi0+
cmVjbGFpbV9sb2NrLCBmbGFncyk7CiAJZGV2X3NldF9kcnZkYXRhKCZkZXYtPmRldiwgTlVMTCk7
CiAKIAlpZiAoYmUtPmJsa2lmKSB7CkBAIC01MTIsNiArNTE0LDcgQEAgc3RhdGljIGludCB4ZW5f
YmxrYmtfcmVtb3ZlKHN0cnVjdCB4ZW5idXNfZGV2aWNlICpkZXYpCiAJCS8qIFB1dCB0aGUgcmVm
ZXJlbmNlIHdlIHNldCBpbiB4ZW5fYmxraWZfYWxsb2MoKS4gKi8KIAkJeGVuX2Jsa2lmX3B1dChi
ZS0+YmxraWYpOwogCX0KKwlzcGluX3VubG9ja19pcnFyZXN0b3JlKCZkZXYtPnJlY2xhaW1fbG9j
aywgZmxhZ3MpOwogCiAJcmV0dXJuIDA7CiB9CkBAIC01OTcsNiArNjAwLDcgQEAgc3RhdGljIGlu
dCB4ZW5fYmxrYmtfcHJvYmUoc3RydWN0IHhlbmJ1c19kZXZpY2UgKmRldiwKIAlpbnQgZXJyOwog
CXN0cnVjdCBiYWNrZW5kX2luZm8gKmJlID0ga3phbGxvYyhzaXplb2Yoc3RydWN0IGJhY2tlbmRf
aW5mbyksCiAJCQkJCSAgR0ZQX0tFUk5FTCk7CisJdW5zaWduZWQgbG9uZyBmbGFnczsKIAogCS8q
IG1hdGNoIHRoZSBwcl9kZWJ1ZyBpbiB4ZW5fYmxrYmtfcmVtb3ZlICovCiAJcHJfZGVidWcoIiVz
ICVwICVkXG4iLCBfX2Z1bmNfXywgZGV2LCBkZXYtPm90aGVyZW5kX2lkKTsKQEAgLTYwNyw2ICs2
MTEsNyBAQCBzdGF0aWMgaW50IHhlbl9ibGtia19wcm9iZShzdHJ1Y3QgeGVuYnVzX2RldmljZSAq
ZGV2LAogCQlyZXR1cm4gLUVOT01FTTsKIAl9CiAJYmUtPmRldiA9IGRldjsKKwlzcGluX2xvY2tf
aXJxc2F2ZSgmZGV2LT5yZWNsYWltX2xvY2ssIGZsYWdzKTsKIAlkZXZfc2V0X2RydmRhdGEoJmRl
di0+ZGV2LCBiZSk7CiAKIAliZS0+YmxraWYgPSB4ZW5fYmxraWZfYWxsb2MoZGV2LT5vdGhlcmVu
ZF9pZCk7CkBAIC02MTQsOCArNjE5LDEwIEBAIHN0YXRpYyBpbnQgeGVuX2Jsa2JrX3Byb2JlKHN0
cnVjdCB4ZW5idXNfZGV2aWNlICpkZXYsCiAJCWVyciA9IFBUUl9FUlIoYmUtPmJsa2lmKTsKIAkJ
YmUtPmJsa2lmID0gTlVMTDsKIAkJeGVuYnVzX2Rldl9mYXRhbChkZXYsIGVyciwgImNyZWF0aW5n
IGJsb2NrIGludGVyZmFjZSIpOworCQlzcGluX3VubG9ja19pcnFyZXN0b3JlKCZkZXYtPnJlY2xh
aW1fbG9jaywgZmxhZ3MpOwogCQlnb3RvIGZhaWw7CiAJfQorCXNwaW5fdW5sb2NrX2lycXJlc3Rv
cmUoJmRldi0+cmVjbGFpbV9sb2NrLCBmbGFncyk7CiAKIAllcnIgPSB4ZW5idXNfcHJpbnRmKFhC
VF9OSUwsIGRldi0+bm9kZW5hbWUsCiAJCQkgICAgImZlYXR1cmUtbWF4LWluZGlyZWN0LXNlZ21l
bnRzIiwgIiV1IiwKQEAgLTgzOCw2ICs4NDUsMTAgQEAgc3RhdGljIHZvaWQgcmVjbGFpbV9tZW1v
cnkoc3RydWN0IHhlbmJ1c19kZXZpY2UgKmRldikKIHsKIAlzdHJ1Y3QgYmFja2VuZF9pbmZvICpi
ZSA9IGRldl9nZXRfZHJ2ZGF0YSgmZGV2LT5kZXYpOwogCisJLyogRGV2aWNlIGlzIHJlZ2lzdGVy
ZWQgYnV0IG5vdCBwcm9iZWQgeWV0ICovCisJaWYgKCFiZSkKKwkJcmV0dXJuOworCiAJYmUtPmJs
a2lmLT5idWZmZXJfc3F1ZWV6ZV9lbmQgPSBqaWZmaWVzICsKIAkJbXNlY3NfdG9famlmZmllcyhi
dWZmZXJfc3F1ZWV6ZV9kdXJhdGlvbl9tcyk7CiB9Ci0tIAoyLjE3LjEKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
