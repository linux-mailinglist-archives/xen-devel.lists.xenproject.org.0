Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62E2C15B3D6
	for <lists+xen-devel@lfdr.de>; Wed, 12 Feb 2020 23:34:44 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j20YI-00036M-7R; Wed, 12 Feb 2020 22:32:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=X/s5=4A=amazon.com=prvs=304f9ffca=anchalag@srs-us1.protection.inumbo.net>)
 id 1j20YG-00036D-HO
 for xen-devel@lists.xenproject.org; Wed, 12 Feb 2020 22:32:12 +0000
X-Inumbo-ID: 83084018-4de7-11ea-b0fd-bc764e2007e4
Received: from smtp-fw-6001.amazon.com (unknown [52.95.48.154])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 83084018-4de7-11ea-b0fd-bc764e2007e4;
 Wed, 12 Feb 2020 22:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1581546732; x=1613082732;
 h=date:from:to:subject:message-id:mime-version;
 bh=ripc5+9/gE+qNPNBav/IIcm5ONNdq1mgToxmDX/jFW0=;
 b=BD/VBWFgh88GB7S74RQOCBRf77hdGKWMkusuYt9uZveDwI62KNBY0CYb
 ev9SonLhNh1xN8+DDV6iNaegEihEgyzsFRnSFESM3QFLyDbAu+Xd2vUF8
 6XwQ/1x1DjIW1pHzYud8lI7U2aEGNDb6hfLjzCyl81RMJl5/nlLmL0u7e A=;
IronPort-SDR: gWdTJ5PKnY7douCc4vbbNcXx94KDrgyfXSO+Z9w6LtPWXGYkzF7Gj3MVWjoq7H58a0vZhfHqJE
 3M+L5XR+QY3g==
X-IronPort-AV: E=Sophos;i="5.70,434,1574121600"; d="scan'208";a="17479331"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2c-2225282c.us-west-2.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP;
 12 Feb 2020 22:31:57 +0000
Received: from EX13MTAUEE002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2c-2225282c.us-west-2.amazon.com (Postfix) with ESMTPS
 id 09736A2725; Wed, 12 Feb 2020 22:31:55 +0000 (UTC)
Received: from EX13D08UEE003.ant.amazon.com (10.43.62.118) by
 EX13MTAUEE002.ant.amazon.com (10.43.62.24) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 12 Feb 2020 22:31:35 +0000
Received: from EX13MTAUEA002.ant.amazon.com (10.43.61.77) by
 EX13D08UEE003.ant.amazon.com (10.43.62.118) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 12 Feb 2020 22:31:35 +0000
Received: from dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com
 (172.22.96.68) by mail-relay.amazon.com (10.43.61.169) with Microsoft SMTP
 Server id 15.0.1236.3 via Frontend Transport; Wed, 12 Feb 2020 22:31:35 +0000
Received: by dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com (Postfix,
 from userid 4335130)
 id DBCC2400D1; Wed, 12 Feb 2020 22:31:34 +0000 (UTC)
Date: Wed, 12 Feb 2020 22:31:34 +0000
From: Anchal Agarwal <anchalag@amazon.com>
To: <tglx@linutronix.de>, <mingo@redhat.com>, <bp@alien8.de>, <hpa@zytor.com>, 
 <x86@kernel.org>, <boris.ostrovsky@oracle.com>, <jgross@suse.com>,
 <linux-pm@vger.kernel.org>, <linux-mm@kvack.org>, <kamatam@amazon.com>,
 <sstabellini@kernel.org>, <konrad.wilk@oracle.com>, <roger.pau@citrix.com>,
 <axboe@kernel.dk>, <davem@davemloft.net>, <rjw@rjwysocki.net>,
 <len.brown@intel.com>, <pavel@ucw.cz>, <peterz@infradead.org>,
 <eduval@amazon.com>, <sblbir@amazon.com>, <anchalag@amazon.com>,
 <xen-devel@lists.xenproject.org>, <vkuznets@redhat.com>,
 <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <dwmw@amazon.co.uk>, <fllinden@amaozn.com>, <benh@kernel.crashing.org>
Message-ID: <20200212223134.GA3625@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.5.21 (2010-09-15)
Precedence: Bulk
Subject: [Xen-devel] [RFC PATCH v3 03/12] x86/xen: Introduce new function to
 map HYPERVISOR_shared_info on Resume
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SW50cm9kdWNlIGEgc21hbGwgZnVuY3Rpb24gd2hpY2ggcmUtdXNlcyBzaGFyZWQgcGFnZSdzIFBB
IGFsbG9jYXRlZApkdXJpbmcgZ3Vlc3QgaW5pdGlhbGl6YXRpb24gdGltZSBpbiByZXNlcnZlX3No
YXJlZF9pbmZvKCkgYW5kIG5vdAphbGxvY2F0ZSBuZXcgcGFnZSBkdXJpbmcgcmVzdW1lIGZsb3cu
Ckl0IGFsc28gIGRvZXMgdGhlIG1hcHBpbmcgb2Ygc2hhcmVkX2luZm9fcGFnZSBieSBjYWxsaW5n
Cnhlbl9odm1faW5pdF9zaGFyZWRfaW5mbygpIHRvIHVzZSB0aGUgZnVuY3Rpb24uCgpTaWduZWQt
b2ZmLWJ5OiBBbmNoYWwgQWdhcndhbCA8YW5jaGFsYWdAYW1hem9uLmNvbT4KCi0tLQpDaGFuZ2Vz
IHNpbmNlIFYyOiBOb25lCi0tLQogYXJjaC94ODYveGVuL2VubGlnaHRlbl9odm0uYyB8IDcgKysr
KysrKwogYXJjaC94ODYveGVuL3hlbi1vcHMuaCAgICAgICB8IDEgKwogMiBmaWxlcyBjaGFuZ2Vk
LCA4IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9hcmNoL3g4Ni94ZW4vZW5saWdodGVuX2h2
bS5jIGIvYXJjaC94ODYveGVuL2VubGlnaHRlbl9odm0uYwppbmRleCBlMTM4ZjdkZTUyZDIuLjc1
YjFlYzdhMGZjZCAxMDA2NDQKLS0tIGEvYXJjaC94ODYveGVuL2VubGlnaHRlbl9odm0uYworKysg
Yi9hcmNoL3g4Ni94ZW4vZW5saWdodGVuX2h2bS5jCkBAIC0yNyw2ICsyNywxMyBAQAogCiBzdGF0
aWMgdW5zaWduZWQgbG9uZyBzaGFyZWRfaW5mb19wZm47CiAKK3ZvaWQgeGVuX2h2bV9tYXBfc2hh
cmVkX2luZm8odm9pZCkKK3sKKwl4ZW5faHZtX2luaXRfc2hhcmVkX2luZm8oKTsKKwlpZiAoc2hh
cmVkX2luZm9fcGZuKQorCQlIWVBFUlZJU09SX3NoYXJlZF9pbmZvID0gX192YShQRk5fUEhZUyhz
aGFyZWRfaW5mb19wZm4pKTsKK30KKwogdm9pZCB4ZW5faHZtX2luaXRfc2hhcmVkX2luZm8odm9p
ZCkKIHsKIAlzdHJ1Y3QgeGVuX2FkZF90b19waHlzbWFwIHhhdHA7CmRpZmYgLS1naXQgYS9hcmNo
L3g4Ni94ZW4veGVuLW9wcy5oIGIvYXJjaC94ODYveGVuL3hlbi1vcHMuaAppbmRleCA0NWE0NDFj
MzNkNmQuLmQ4NGMzNTc5OTRiZCAxMDA2NDQKLS0tIGEvYXJjaC94ODYveGVuL3hlbi1vcHMuaAor
KysgYi9hcmNoL3g4Ni94ZW4veGVuLW9wcy5oCkBAIC01Niw2ICs1Niw3IEBAIHZvaWQgeGVuX2Vu
YWJsZV9zeXNjYWxsKHZvaWQpOwogdm9pZCB4ZW5fdmNwdV9yZXN0b3JlKHZvaWQpOwogCiB2b2lk
IHhlbl9jYWxsYmFja192ZWN0b3Iodm9pZCk7Cit2b2lkIHhlbl9odm1fbWFwX3NoYXJlZF9pbmZv
KHZvaWQpOwogdm9pZCB4ZW5faHZtX2luaXRfc2hhcmVkX2luZm8odm9pZCk7CiB2b2lkIHhlbl91
bnBsdWdfZW11bGF0ZWRfZGV2aWNlcyh2b2lkKTsKIAotLSAKMi4yNC4xLkFNWk4KCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
