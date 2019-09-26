Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4B36BEED3
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 11:51:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDQNW-0003yb-1y; Thu, 26 Sep 2019 09:48:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ph5t=XV=amazon.com=prvs=165c3e20f=hongyax@srs-us1.protection.inumbo.net>)
 id 1iDQNU-0003xM-Ma
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 09:48:00 +0000
X-Inumbo-ID: b89c2ef1-e042-11e9-964c-12813bfff9fa
Received: from smtp-fw-6001.amazon.com (unknown [52.95.48.154])
 by localhost (Halon) with ESMTPS
 id b89c2ef1-e042-11e9-964c-12813bfff9fa;
 Thu, 26 Sep 2019 09:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1569491278; x=1601027278;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=LWFx3gZXlXyggl/OgrfKOJDKrGBkC4PTLu0JOK+Lpsc=;
 b=Lqkcp5sLQ8+1uvtDlVsN9BPTxRyj2r/rntgTnK0K6UuSK8S3s1+9P+wQ
 l3/Bxnf8/HVi2WmLq/kHkgFyTlfi4Cg5BbEef8eDaC7AaGKYlPDRK3kB2
 7RUwwKAjG/4PLyWdRhNrd67JkyWXH5PzIVOoKWiWvCMHItiE6ElF5IN3h s=;
X-IronPort-AV: E=Sophos;i="5.64,551,1559520000"; d="scan'208";a="417788142"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1e-17c49630.us-east-1.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP;
 26 Sep 2019 09:47:58 +0000
Received: from EX13MTAUWA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1e-17c49630.us-east-1.amazon.com (Postfix) with ESMTPS
 id 98786A2A41; Thu, 26 Sep 2019 09:47:57 +0000 (UTC)
Received: from EX13D19UWA004.ant.amazon.com (10.43.160.102) by
 EX13MTAUWA001.ant.amazon.com (10.43.160.58) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 26 Sep 2019 09:47:33 +0000
Received: from EX13MTAUWA001.ant.amazon.com (10.43.160.58) by
 EX13D19UWA004.ant.amazon.com (10.43.160.102) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 26 Sep 2019 09:47:32 +0000
Received: from u9d785c4ba99158.ant.amazon.com (10.125.106.58) by
 mail-relay.amazon.com (10.43.160.118) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Thu, 26 Sep 2019 09:47:31 +0000
From: <hongyax@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 26 Sep 2019 10:45:44 +0100
Message-ID: <818f17997f90b464bbe620ead9f35bab3844375c.1569489002.git.hongyax@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1569489002.git.hongyax@amazon.com>
References: <cover.1569489002.git.hongyax@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [RFC PATCH 21/84] x86/mm: switch to new APIs in
 arch_init_memory
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
aXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Ci0tLQogeGVuL2FyY2gveDg2L21tLmMgfCAxNSArKysr
KysrKystLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L21tLmMgYi94ZW4vYXJjaC94ODYvbW0uYwpp
bmRleCBhOTM2MWI4NTlhLi41OWRiYTA1YmE4IDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvbW0u
YworKysgYi94ZW4vYXJjaC94ODYvbW0uYwpAQCAtMzUzLDE5ICszNTMsMjIgQEAgdm9pZCBfX2lu
aXQgYXJjaF9pbml0X21lbW9yeSh2b2lkKQogICAgICAgICAgICAgQVNTRVJUKHJvb3RfcGd0X3B2
X3hlbl9zbG90cyA8IFJPT1RfUEFHRVRBQkxFX1BWX1hFTl9TTE9UUyk7CiAgICAgICAgICAgICBp
ZiAoIGw0X3RhYmxlX29mZnNldChzcGxpdF92YSkgPT0gbDRfdGFibGVfb2Zmc2V0KHNwbGl0X3Zh
IC0gMSkgKQogICAgICAgICAgICAgewotICAgICAgICAgICAgICAgIGwzX3BnZW50cnlfdCAqbDN0
YWIgPSBhbGxvY194ZW5fcGFnZXRhYmxlKCk7CisgICAgICAgICAgICAgICAgbWZuX3QgbDN0YWJf
bWZuID0gYWxsb2NfeGVuX3BhZ2V0YWJsZV9uZXcoKTsKIAotICAgICAgICAgICAgICAgIGlmICgg
bDN0YWIgKQorICAgICAgICAgICAgICAgIGlmICggIW1mbl9lcShsM3RhYl9tZm4sIElOVkFMSURf
TUZOKSApCiAgICAgICAgICAgICAgICAgewotICAgICAgICAgICAgICAgICAgICBjb25zdCBsM19w
Z2VudHJ5X3QgKmwzaWRsZSA9Ci0gICAgICAgICAgICAgICAgICAgICAgICBsNGVfdG9fbDNlKGlk
bGVfcGdfdGFibGVbbDRfdGFibGVfb2Zmc2V0KHNwbGl0X3ZhKV0pOworICAgICAgICAgICAgICAg
ICAgICBsM19wZ2VudHJ5X3QgKmwzaWRsZSA9CisgICAgICAgICAgICAgICAgICAgICAgICBtYXBf
eGVuX3BhZ2V0YWJsZV9uZXcoCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgbDRlX2dldF9t
Zm4oaWRsZV9wZ190YWJsZVtsNF90YWJsZV9vZmZzZXQoc3BsaXRfdmEpXSkpOworICAgICAgICAg
ICAgICAgICAgICBsM19wZ2VudHJ5X3QgKmwzdGFiID0gbWFwX3hlbl9wYWdldGFibGVfbmV3KGwz
dGFiX21mbik7CiAKICAgICAgICAgICAgICAgICAgICAgZm9yICggaSA9IDA7IGkgPCBsM190YWJs
ZV9vZmZzZXQoc3BsaXRfdmEpOyArK2kgKQogICAgICAgICAgICAgICAgICAgICAgICAgbDN0YWJb
aV0gPSBsM2lkbGVbaV07CiAgICAgICAgICAgICAgICAgICAgIGZvciAoIDsgaSA8IEwzX1BBR0VU
QUJMRV9FTlRSSUVTOyArK2kgKQogICAgICAgICAgICAgICAgICAgICAgICAgbDN0YWJbaV0gPSBs
M2VfZW1wdHkoKTsKLSAgICAgICAgICAgICAgICAgICAgc3BsaXRfbDRlID0gbDRlX2Zyb21fbWZu
KHZpcnRfdG9fbWZuKGwzdGFiKSwKLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIF9fUEFHRV9IWVBFUlZJU09SX1JXKTsKKyAgICAgICAgICAgICAgICAgICAgc3Bs
aXRfbDRlID0gbDRlX2Zyb21fbWZuKGwzdGFiX21mbiwgX19QQUdFX0hZUEVSVklTT1JfUlcpOwor
ICAgICAgICAgICAgICAgICAgICBVTk1BUF9YRU5fUEFHRVRBQkxFX05FVyhsM2lkbGUpOworICAg
ICAgICAgICAgICAgICAgICBVTk1BUF9YRU5fUEFHRVRBQkxFX05FVyhsM3RhYik7CiAgICAgICAg
ICAgICAgICAgfQogICAgICAgICAgICAgICAgIGVsc2UKICAgICAgICAgICAgICAgICAgICAgKyty
b290X3BndF9wdl94ZW5fc2xvdHM7Ci0tIAoyLjE3LjEKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
