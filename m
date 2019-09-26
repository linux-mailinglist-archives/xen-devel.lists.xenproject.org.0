Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E61ABEF08
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 11:53:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDQOp-00064l-EF; Thu, 26 Sep 2019 09:49:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ph5t=XV=amazon.com=prvs=165c3e20f=hongyax@srs-us1.protection.inumbo.net>)
 id 1iDQOm-00060m-Pt
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 09:49:20 +0000
X-Inumbo-ID: db477202-e042-11e9-964c-12813bfff9fa
Received: from smtp-fw-6002.amazon.com (unknown [52.95.49.90])
 by localhost (Halon) with ESMTPS
 id db477202-e042-11e9-964c-12813bfff9fa;
 Thu, 26 Sep 2019 09:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1569491336; x=1601027336;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=85eRksdJi5K0oVMyeH7P/wmA8MP87rAHYUSXiEfwFHk=;
 b=DwUA6MnXScC/Y1y/2+QhySpT5me9TJh7s4Xkh7BMWxInNvzQmFOqEhuL
 qnhXCo5aQ3hq/FtCwfQGU2r2YJdAe/vVUPSq19j60kLi5CTZPFs2XZtfu
 /B2F5QWCC6pjvNDaV/Db+4To2SgewqE0sWgZPKrpWchhe63ZcWjKYliyV E=;
X-IronPort-AV: E=Sophos;i="5.64,551,1559520000"; d="scan'208";a="423750612"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1a-7d76a15f.us-east-1.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP;
 26 Sep 2019 09:48:55 +0000
Received: from EX13MTAUWA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1a-7d76a15f.us-east-1.amazon.com (Postfix) with ESMTPS
 id A4E2DA2102; Thu, 26 Sep 2019 09:48:55 +0000 (UTC)
Received: from EX13D03UWA004.ant.amazon.com (10.43.160.250) by
 EX13MTAUWA001.ant.amazon.com (10.43.160.58) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 26 Sep 2019 09:48:25 +0000
Received: from EX13MTAUWA001.ant.amazon.com (10.43.160.58) by
 EX13D03UWA004.ant.amazon.com (10.43.160.250) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 26 Sep 2019 09:48:25 +0000
Received: from u9d785c4ba99158.ant.amazon.com (10.125.106.58) by
 mail-relay.amazon.com (10.43.160.118) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Thu, 26 Sep 2019 09:48:23 +0000
From: <hongyax@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 26 Sep 2019 10:46:13 +0100
Message-ID: <89715b3932df742de4f14474358eaeeb5db2c841.1569489002.git.hongyax@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1569489002.git.hongyax@amazon.com>
References: <cover.1569489002.git.hongyax@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [RFC PATCH 50/84] x86/smpboot: remove lXe_to_lYe in
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KClNpZ25lZC1vZmYtYnk6IFdlaSBM
aXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Ci0tLQogeGVuL2FyY2gveDg2L3NtcGJvb3QuYyB8IDEy
ICsrKysrKysrKy0tLQogMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvc21wYm9vdC5jIGIveGVuL2FyY2gveDg2
L3NtcGJvb3QuYwppbmRleCBmMDk1NjNhYjM0Li5kNjU3YWMwMTA4IDEwMDY0NAotLS0gYS94ZW4v
YXJjaC94ODYvc21wYm9vdC5jCisrKyBiL3hlbi9hcmNoL3g4Ni9zbXBib290LmMKQEAgLTk1MSwx
MSArOTUxLDE3IEBAIHN0YXRpYyB2b2lkIGNsZWFudXBfY3B1X3Jvb3RfcGd0KHVuc2lnbmVkIGlu
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
