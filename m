Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC4D3C1F05
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2019 12:36:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iEt0v-0007FG-PI; Mon, 30 Sep 2019 10:34:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Wfc7=XZ=amazon.com=prvs=169663feb=hongyax@srs-us1.protection.inumbo.net>)
 id 1iEt0t-0007Df-Qy
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2019 10:34:43 +0000
X-Inumbo-ID: e77f60c4-e36d-11e9-97fb-bc764e2007e4
Received: from smtp-fw-6002.amazon.com (unknown [52.95.49.90])
 by localhost (Halon) with ESMTPS
 id e77f60c4-e36d-11e9-97fb-bc764e2007e4;
 Mon, 30 Sep 2019 10:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1569839678; x=1601375678;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=nHlDLoGw/1YR58cRbIoTIBNc4eFjZOJefaEjsYgn0Jw=;
 b=hlt7NrO7P6tREqUN5leH4/be3qeCPQ6eKbHPS7A4B+e5sf2G0rU/f3SL
 9zfLeATa1xZVE0/ZW57KLeiY+W09YStStK6TzKc48p67jQb+dOt4L8/hV
 amICYVfFHynD2Zx/2UDWXtYt1MknO7gsfj2om/b+rCBE8JSqENCGHcTsp A=;
X-IronPort-AV: E=Sophos;i="5.64,565,1559520000"; d="scan'208";a="424630094"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1e-17c49630.us-east-1.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP;
 30 Sep 2019 10:34:38 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1e-17c49630.us-east-1.amazon.com (Postfix) with ESMTPS
 id 25BCDA2289; Mon, 30 Sep 2019 10:34:38 +0000 (UTC)
Received: from EX13D12UEE003.ant.amazon.com (10.43.62.198) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 30 Sep 2019 10:34:09 +0000
Received: from EX13MTAUEE001.ant.amazon.com (10.43.62.200) by
 EX13D12UEE003.ant.amazon.com (10.43.62.198) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 30 Sep 2019 10:34:09 +0000
Received: from u9d785c4ba99158.ant.amazon.com (10.125.106.78) by
 mail-relay.amazon.com (10.43.62.226) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Mon, 30 Sep 2019 10:34:08 +0000
From: Hongyan Xia <hongyax@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 30 Sep 2019 11:33:12 +0100
Message-ID: <ad2ec6d9900149fefa4c4d4d61c05b96c02ce5f6.1569833766.git.hongyax@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1569833766.git.hongyax@amazon.com>
References: <cover.1569833766.git.hongyax@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v2 20/55] x86/mm: switch to new APIs in
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KClNpZ25lZC1vZmYtYnk6IFdlaSBM
aXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Ci0tLQogeGVuL2FyY2gveDg2L21tLmMgfCAxNSArKysr
KysrKystLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L21tLmMgYi94ZW4vYXJjaC94ODYvbW0uYwpp
bmRleCA2ZmI4YzkyNTQzLi44NzA2ZGMwMTc0IDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvbW0u
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
