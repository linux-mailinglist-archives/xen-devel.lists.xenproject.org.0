Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA2FC1F30
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2019 12:38:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iEt1q-0000Fz-VM; Mon, 30 Sep 2019 10:35:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Wfc7=XZ=amazon.com=prvs=169663feb=hongyax@srs-us1.protection.inumbo.net>)
 id 1iEt1n-0000Ar-VS
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2019 10:35:40 +0000
X-Inumbo-ID: f3fde294-e36d-11e9-96cd-12813bfff9fa
Received: from smtp-fw-2101.amazon.com (unknown [72.21.196.25])
 by localhost (Halon) with ESMTPS
 id f3fde294-e36d-11e9-96cd-12813bfff9fa;
 Mon, 30 Sep 2019 10:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1569839699; x=1601375699;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=VU/eAywnkNFh7IYkFRbTTN/QOXXVFbVyKonknwX0+iU=;
 b=RQF+XDF+V6h08x7y53ao9U+7TzQ8yIyADkL1fjjMaHKMzCzfhnUaomgI
 6cNtmfDYmUcC1qXjJlWko0O5GZ6OLUKb+ibTqEYuAET/73w8ZudaexbQI
 iLM+kbdVjATl16WK5FP/6KV8F8RGg/txu/YXUOfy+ollUiyj+epnmhHiR 4=;
X-IronPort-AV: E=Sophos;i="5.64,565,1559520000"; d="scan'208";a="754242303"
Received: from iad6-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-1e-57e1d233.us-east-1.amazon.com) ([10.124.125.2])
 by smtp-border-fw-out-2101.iad2.amazon.com with ESMTP;
 30 Sep 2019 10:34:59 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1e-57e1d233.us-east-1.amazon.com (Postfix) with ESMTPS
 id 13C8B1417AB; Mon, 30 Sep 2019 10:34:58 +0000 (UTC)
Received: from EX13D08UEE002.ant.amazon.com (10.43.62.92) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 30 Sep 2019 10:34:36 +0000
Received: from EX13MTAUEE001.ant.amazon.com (10.43.62.200) by
 EX13D08UEE002.ant.amazon.com (10.43.62.92) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 30 Sep 2019 10:34:35 +0000
Received: from u9d785c4ba99158.ant.amazon.com (10.125.106.78) by
 mail-relay.amazon.com (10.43.62.226) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Mon, 30 Sep 2019 10:34:35 +0000
From: Hongyan Xia <hongyax@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 30 Sep 2019 11:33:41 +0100
Message-ID: <f48815069d479062bb73ceb0528ee74df0ce7a77.1569833766.git.hongyax@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1569833766.git.hongyax@amazon.com>
References: <cover.1569833766.git.hongyax@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v2 49/55] x86/smpboot: remove lXe_to_lYe in
 cleanup_cpu_root_pgt
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
aXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Ci0tLQogeGVuL2FyY2gveDg2L3NtcGJvb3QuYyB8IDEy
ICsrKysrKysrKy0tLQogMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvc21wYm9vdC5jIGIveGVuL2FyY2gveDg2
L3NtcGJvb3QuYwppbmRleCBjYThmYzZkNDg1Li45ZmUwZWYxOGExIDEwMDY0NAotLS0gYS94ZW4v
YXJjaC94ODYvc21wYm9vdC5jCisrKyBiL3hlbi9hcmNoL3g4Ni9zbXBib290LmMKQEAgLTk0OSwx
MSArOTQ5LDE3IEBAIHN0YXRpYyB2b2lkIGNsZWFudXBfY3B1X3Jvb3RfcGd0KHVuc2lnbmVkIGlu
dCBjcHUpCiAgICAgLyogQWxzbyB6YXAgdGhlIHN0dWIgbWFwcGluZyBmb3IgdGhpcyBDUFUuICov
CiAgICAgaWYgKCBzdHViX2xpbmVhciApCiAgICAgewotICAgICAgICBsM19wZ2VudHJ5X3QgKmwz
dCA9IGw0ZV90b19sM2UoY29tbW9uX3BndCk7Ci0gICAgICAgIGwyX3BnZW50cnlfdCAqbDJ0ID0g
bDNlX3RvX2wyZShsM3RbbDNfdGFibGVfb2Zmc2V0KHN0dWJfbGluZWFyKV0pOwotICAgICAgICBs
MV9wZ2VudHJ5X3QgKmwxdCA9IGwyZV90b19sMWUobDJ0W2wyX3RhYmxlX29mZnNldChzdHViX2xp
bmVhcildKTsKKyAgICAgICAgbDNfcGdlbnRyeV90ICpsM3QgPSBtYXBfeGVuX3BhZ2V0YWJsZV9u
ZXcobDRlX2dldF9tZm4oY29tbW9uX3BndCkpOworICAgICAgICBsMl9wZ2VudHJ5X3QgKmwydCA9
IG1hcF94ZW5fcGFnZXRhYmxlX25ldygKKyAgICAgICAgICAgIGwzZV9nZXRfbWZuKGwzdFtsM190
YWJsZV9vZmZzZXQoc3R1Yl9saW5lYXIpXSkpOworICAgICAgICBsMV9wZ2VudHJ5X3QgKmwxdCA9
IG1hcF94ZW5fcGFnZXRhYmxlX25ldygKKyAgICAgICAgICAgIGwyZV9nZXRfbWZuKGwydFtsMl90
YWJsZV9vZmZzZXQoc3R1Yl9saW5lYXIpXSkpOwogCiAgICAgICAgIGwxdFtsMV90YWJsZV9vZmZz
ZXQoc3R1Yl9saW5lYXIpXSA9IGwxZV9lbXB0eSgpOworCisgICAgICAgIFVOTUFQX1hFTl9QQUdF
VEFCTEVfTkVXKGwxdCk7CisgICAgICAgIFVOTUFQX1hFTl9QQUdFVEFCTEVfTkVXKGwydCk7Cisg
ICAgICAgIFVOTUFQX1hFTl9QQUdFVEFCTEVfTkVXKGwzdCk7CiAgICAgfQogfQogCi0tIAoyLjE3
LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
