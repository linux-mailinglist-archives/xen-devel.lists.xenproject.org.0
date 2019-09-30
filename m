Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 329D2C1F2D
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2019 12:38:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iEt1g-0008Mk-DE; Mon, 30 Sep 2019 10:35:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Wfc7=XZ=amazon.com=prvs=169663feb=hongyax@srs-us1.protection.inumbo.net>)
 id 1iEt1d-0008JF-TW
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2019 10:35:29 +0000
X-Inumbo-ID: f15782e0-e36d-11e9-96cd-12813bfff9fa
Received: from smtp-fw-6001.amazon.com (unknown [52.95.48.154])
 by localhost (Halon) with ESMTPS
 id f15782e0-e36d-11e9-96cd-12813bfff9fa;
 Mon, 30 Sep 2019 10:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1569839695; x=1601375695;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=GcGaU3T/FyplS83xbErSj/1YIbxmGvXcFYgUGeeyEZg=;
 b=pJoBZzlxfrI6kiDh0d1A7SoIU0q0Ed/cGfB/M99XZx8N+z1TCbn7jBKy
 iSN4I2AsiapB+1qqgtrUwmbl2rkNHdguYCWcAAc7+a/0AHtdL91HdGRDs
 bDsfFqMKZcAASbC//CT4BCb5DBm5Mnc7HremRXjtPnY26VA7E1fn0Q41v w=;
X-IronPort-AV: E=Sophos;i="5.64,565,1559520000"; d="scan'208";a="418649938"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1e-62350142.us-east-1.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP;
 30 Sep 2019 10:34:55 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1e-62350142.us-east-1.amazon.com (Postfix) with ESMTPS
 id 62441A1CCD; Mon, 30 Sep 2019 10:34:55 +0000 (UTC)
Received: from EX13D21UEE003.ant.amazon.com (10.43.62.160) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 30 Sep 2019 10:34:31 +0000
Received: from EX13MTAUEE001.ant.amazon.com (10.43.62.200) by
 EX13D21UEE003.ant.amazon.com (10.43.62.160) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 30 Sep 2019 10:34:31 +0000
Received: from u9d785c4ba99158.ant.amazon.com (10.125.106.78) by
 mail-relay.amazon.com (10.43.62.226) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Mon, 30 Sep 2019 10:34:30 +0000
From: Hongyan Xia <hongyax@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 30 Sep 2019 11:33:36 +0100
Message-ID: <5f30e1eae274645434f59deee6dfd763dee84c20.1569833766.git.hongyax@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1569833766.git.hongyax@amazon.com>
References: <cover.1569833766.git.hongyax@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v2 44/55] x86_64/mm: map and unmap page tables
 in destroy_m2p_mapping
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KClNpZ25lZC1vZmYtYnk6IFdlaSBM
aXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Ci0tLQogeGVuL2FyY2gveDg2L3g4Nl82NC9tbS5jIHwg
MTggKysrKysrKysrKysrKystLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKSwg
NCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYveDg2XzY0L21tLmMgYi94
ZW4vYXJjaC94ODYveDg2XzY0L21tLmMKaW5kZXggMmZmZjVmOTMwNi4uMWQyZWJkNjQyZiAxMDA2
NDQKLS0tIGEveGVuL2FyY2gveDg2L3g4Nl82NC9tbS5jCisrKyBiL3hlbi9hcmNoL3g4Ni94ODZf
NjQvbW0uYwpAQCAtMjkyLDcgKzI5Miw4IEBAIHN0YXRpYyB2b2lkIGRlc3Ryb3lfbTJwX21hcHBp
bmcoc3RydWN0IG1lbV9ob3RhZGRfaW5mbyAqaW5mbykKICAgICB1bnNpZ25lZCBsb25nIGksIHZh
LCByd3ZhOwogICAgIHVuc2lnbmVkIGxvbmcgc21hcCA9IGluZm8tPnNwZm4sIGVtYXAgPSBpbmZv
LT5lcGZuOwogCi0gICAgbDNfcm9fbXB0ID0gbDRlX3RvX2wzZShpZGxlX3BnX3RhYmxlW2w0X3Rh
YmxlX29mZnNldChST19NUFRfVklSVF9TVEFSVCldKTsKKyAgICBsM19yb19tcHQgPSBtYXBfeGVu
X3BhZ2V0YWJsZV9uZXcoCisgICAgICAgIGw0ZV9nZXRfbWZuKGlkbGVfcGdfdGFibGVbbDRfdGFi
bGVfb2Zmc2V0KFJPX01QVF9WSVJUX1NUQVJUKV0pKTsKIAogICAgIC8qCiAgICAgICogTm8gbmVl
ZCB0byBjbGVhbiBtMnAgc3RydWN0dXJlIGV4aXN0aW5nIGJlZm9yZSB0aGUgaG90cGx1ZwpAQCAt
MzE0LDI2ICszMTUsMzUgQEAgc3RhdGljIHZvaWQgZGVzdHJveV9tMnBfbWFwcGluZyhzdHJ1Y3Qg
bWVtX2hvdGFkZF9pbmZvICppbmZvKQogICAgICAgICAgICAgY29udGludWU7CiAgICAgICAgIH0K
IAotICAgICAgICBsMl9yb19tcHQgPSBsM2VfdG9fbDJlKGwzX3JvX21wdFtsM190YWJsZV9vZmZz
ZXQodmEpXSk7CisgICAgICAgIGwyX3JvX21wdCA9IG1hcF94ZW5fcGFnZXRhYmxlX25ldygKKyAg
ICAgICAgICAgIGwzZV9nZXRfbWZuKGwzX3JvX21wdFtsM190YWJsZV9vZmZzZXQodmEpXSkpOwog
ICAgICAgICBpZiAoIShsMmVfZ2V0X2ZsYWdzKGwyX3JvX21wdFtsMl90YWJsZV9vZmZzZXQodmEp
XSkgJiBfUEFHRV9QUkVTRU5UKSkKICAgICAgICAgewogICAgICAgICAgICAgaSA9ICggaSAmIH4o
KDFVTCA8PCAoTDJfUEFHRVRBQkxFX1NISUZUIC0gMykpIC0gMSkpICsKICAgICAgICAgICAgICAg
ICAgICAgKDFVTCA8PCAoTDJfUEFHRVRBQkxFX1NISUZUIC0gMykpIDsKKyAgICAgICAgICAgIFVO
TUFQX1hFTl9QQUdFVEFCTEVfTkVXKGwyX3JvX21wdCk7CiAgICAgICAgICAgICBjb250aW51ZTsK
ICAgICAgICAgfQogCiAgICAgICAgIHB0X3BmbiA9IGwyZV9nZXRfcGZuKGwyX3JvX21wdFtsMl90
YWJsZV9vZmZzZXQodmEpXSk7CiAgICAgICAgIGlmICggaG90YWRkX21lbV92YWxpZChwdF9wZm4s
IGluZm8pICkKICAgICAgICAgeworICAgICAgICAgICAgbDJfcGdlbnRyeV90ICpsMnQ7CisKICAg
ICAgICAgICAgIGRlc3Ryb3lfeGVuX21hcHBpbmdzKHJ3dmEsIHJ3dmEgKyAoMVVMIDw8IEwyX1BB
R0VUQUJMRV9TSElGVCkpOwogCi0gICAgICAgICAgICBsMl9yb19tcHQgPSBsM2VfdG9fbDJlKGwz
X3JvX21wdFtsM190YWJsZV9vZmZzZXQodmEpXSk7Ci0gICAgICAgICAgICBsMmVfd3JpdGUoJmwy
X3JvX21wdFtsMl90YWJsZV9vZmZzZXQodmEpXSwgbDJlX2VtcHR5KCkpOworICAgICAgICAgICAg
bDJ0ID0gbWFwX3hlbl9wYWdldGFibGVfbmV3KAorICAgICAgICAgICAgICAgIGwzZV9nZXRfbWZu
KGwzX3JvX21wdFtsM190YWJsZV9vZmZzZXQodmEpXSkpOworICAgICAgICAgICAgbDJlX3dyaXRl
KCZsMnRbbDJfdGFibGVfb2Zmc2V0KHZhKV0sIGwyZV9lbXB0eSgpKTsKKyAgICAgICAgICAgIFVO
TUFQX1hFTl9QQUdFVEFCTEVfTkVXKGwydCk7CiAgICAgICAgIH0KICAgICAgICAgaSA9ICggaSAm
IH4oKDFVTCA8PCAoTDJfUEFHRVRBQkxFX1NISUZUIC0gMykpIC0gMSkpICsKICAgICAgICAgICAg
ICAgKDFVTCA8PCAoTDJfUEFHRVRBQkxFX1NISUZUIC0gMykpOworICAgICAgICBVTk1BUF9YRU5f
UEFHRVRBQkxFX05FVyhsMl9yb19tcHQpOwogICAgIH0KIAorICAgIFVOTUFQX1hFTl9QQUdFVEFC
TEVfTkVXKGwzX3JvX21wdCk7CisKICAgICBkZXN0cm95X2NvbXBhdF9tMnBfbWFwcGluZyhpbmZv
KTsKIAogICAgIC8qIEJydXRlLUZvcmNlIGZsdXNoIGFsbCBUTEIgKi8KLS0gCjIuMTcuMQoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
