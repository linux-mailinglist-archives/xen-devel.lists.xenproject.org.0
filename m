Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4FBC11308A
	for <lists+xen-devel@lfdr.de>; Wed,  4 Dec 2019 18:13:35 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1icYBc-0003h0-Ie; Wed, 04 Dec 2019 17:11:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pQYo=Z2=amazon.com=prvs=234ed30ac=hongyxia@srs-us1.protection.inumbo.net>)
 id 1icYBa-0003gA-RH
 for xen-devel@lists.xenproject.org; Wed, 04 Dec 2019 17:11:34 +0000
X-Inumbo-ID: 1aa4d154-16b9-11ea-8206-12813bfff9fa
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1aa4d154-16b9-11ea-8206-12813bfff9fa;
 Wed, 04 Dec 2019 17:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1575479486; x=1607015486;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=P0ze9j9IMl8twsXynPSvX0GZYqiXEm239vamHZAscSo=;
 b=cg3OcqFCkQjkbCRrjc8kd+hmQzGtA79yDgJ6UCXOt/ixjXyG0MNYdLwt
 NznlT7EREdYzNsJFGrQoeErEv6/skB3/wYvurYEZU5lqM6d8deqQlwW07
 iBM/OWS+F3rb1KSb3xp//pNxZtAV6HK4R9xUGPPCAt8TPL1G4WvYzNRXT M=;
IronPort-SDR: 1Nz4LTFn846Tn8mIjjejWVr72kc95/aZ0rreMuHFvlSfp/3k6hFZ19K0danzydJEsTSeBLwqds
 omCkGm9kWQ+A==
X-IronPort-AV: E=Sophos;i="5.69,277,1571702400"; d="scan'208";a="13005505"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2b-81e76b79.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 04 Dec 2019 17:11:21 +0000
Received: from EX13MTAUWA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2b-81e76b79.us-west-2.amazon.com (Postfix) with ESMTPS
 id 6BC74A2209; Wed,  4 Dec 2019 17:11:21 +0000 (UTC)
Received: from EX13D24UWA004.ant.amazon.com (10.43.160.233) by
 EX13MTAUWA001.ant.amazon.com (10.43.160.58) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 4 Dec 2019 17:11:10 +0000
Received: from EX13MTAUWA001.ant.amazon.com (10.43.160.58) by
 EX13D24UWA004.ant.amazon.com (10.43.160.233) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 4 Dec 2019 17:11:10 +0000
Received: from u60d575063b1f53.ant.amazon.com (10.125.106.64) by
 mail-relay.amazon.com (10.43.160.118) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Wed, 4 Dec 2019 17:11:09 +0000
From: Hongyan Xia <hongyxia@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 4 Dec 2019 17:10:57 +0000
Message-ID: <3057ce64c73e8e48c91b89192c8a8b43196bb1ce.1575477921.git.hongyxia@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1575477921.git.hongyxia@amazon.com>
References: <cover.1575477921.git.hongyxia@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v4 5/9] x86/mm: map_pages_to_xen would better
 have one exit path
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

RnJvbTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KCldlIHdpbGwgc29vbiByZXdyaXRl
IHRoZSBmdW5jdGlvbiB0byBoYW5kbGUgZHluYW1pY2FsbHkgbWFwcGluZyBhbmQKdW5tYXBwaW5n
IG9mIHBhZ2UgdGFibGVzLgoKTm8gZnVuY3Rpb25hbCBjaGFuZ2UuCgpTaWduZWQtb2ZmLWJ5OiBX
ZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgpTaWduZWQtb2ZmLWJ5OiBIb25neWFuIFhpYSA8
aG9uZ3l4aWFAYW1hem9uLmNvbT4KCi0tLQpDaGFuZ2VkIHNpbmNlIHYzOgotIHJlbW92ZSBhc3Nl
cnRzIG9uIHJjIHNpbmNlIHJjIG5ldmVyIGdldHMgY2hhbmdlZCB0byBhbnl0aGluZyBlbHNlCi0g
cmV3b3JkIGNvbW1pdCBtZXNzYWdlCi0tLQogeGVuL2FyY2gveDg2L21tLmMgfCAyMCArKysrKysr
KysrKysrLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKyksIDcgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L21tLmMgYi94ZW4vYXJjaC94ODYvbW0u
YwppbmRleCAzMDNiYzM1NTQ5Li5mNzQ2NGMyMTAzIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYv
bW0uYworKysgYi94ZW4vYXJjaC94ODYvbW0uYwpAQCAtNTE4Nyw5ICs1MTg3LDExIEBAIGludCBt
YXBfcGFnZXNfdG9feGVuKAogICAgIHVuc2lnbmVkIGludCBmbGFncykKIHsKICAgICBib29sIGxv
Y2tpbmcgPSBzeXN0ZW1fc3RhdGUgPiBTWVNfU1RBVEVfYm9vdDsKKyAgICBsM19wZ2VudHJ5X3Qg
KnBsM2UsIG9sM2U7CiAgICAgbDJfcGdlbnRyeV90ICpwbDJlLCBvbDJlOwogICAgIGwxX3BnZW50
cnlfdCAqcGwxZSwgb2wxZTsKICAgICB1bnNpZ25lZCBpbnQgIGk7CisgICAgaW50IHJjID0gLUVO
T01FTTsKIAogI2RlZmluZSBmbHVzaF9mbGFncyhvbGRmKSBkbyB7ICAgICAgICAgICAgICAgICBc
CiAgICAgdW5zaWduZWQgaW50IG9fID0gKG9sZGYpOyAgICAgICAgICAgICAgICAgIFwKQEAgLTUy
MDcsMTAgKzUyMDksMTEgQEAgaW50IG1hcF9wYWdlc190b194ZW4oCiAKICAgICB3aGlsZSAoIG5y
X21mbnMgIT0gMCApCiAgICAgewotICAgICAgICBsM19wZ2VudHJ5X3Qgb2wzZSwgKnBsM2UgPSB2
aXJ0X3RvX3hlbl9sM2UodmlydCk7CisgICAgICAgIHBsM2UgPSB2aXJ0X3RvX3hlbl9sM2Uodmly
dCk7CiAKICAgICAgICAgaWYgKCAhcGwzZSApCi0gICAgICAgICAgICByZXR1cm4gLUVOT01FTTsK
KyAgICAgICAgICAgIGdvdG8gb3V0OworCiAgICAgICAgIG9sM2UgPSAqcGwzZTsKIAogICAgICAg
ICBpZiAoIGNwdV9oYXNfcGFnZTFnYiAmJgpAQCAtNTMwMiw3ICs1MzA1LDcgQEAgaW50IG1hcF9w
YWdlc190b194ZW4oCiAKICAgICAgICAgICAgIGwydCA9IGFsbG9jX3hlbl9wYWdldGFibGUoKTsK
ICAgICAgICAgICAgIGlmICggbDJ0ID09IE5VTEwgKQotICAgICAgICAgICAgICAgIHJldHVybiAt
RU5PTUVNOworICAgICAgICAgICAgICAgIGdvdG8gb3V0OwogCiAgICAgICAgICAgICBmb3IgKCBp
ID0gMDsgaSA8IEwyX1BBR0VUQUJMRV9FTlRSSUVTOyBpKysgKQogICAgICAgICAgICAgICAgIGwy
ZV93cml0ZShsMnQgKyBpLApAQCAtNTMzMSw3ICs1MzM0LDcgQEAgaW50IG1hcF9wYWdlc190b194
ZW4oCiAKICAgICAgICAgcGwyZSA9IHZpcnRfdG9feGVuX2wyZSh2aXJ0KTsKICAgICAgICAgaWYg
KCAhcGwyZSApCi0gICAgICAgICAgICByZXR1cm4gLUVOT01FTTsKKyAgICAgICAgICAgIGdvdG8g
b3V0OwogCiAgICAgICAgIGlmICggKCgoKHZpcnQgPj4gUEFHRV9TSElGVCkgfCBtZm5feChtZm4p
KSAmCiAgICAgICAgICAgICAgICAoKDF1IDw8IFBBR0VUQUJMRV9PUkRFUikgLSAxKSkgPT0gMCkg
JiYKQEAgLTUzNzYsNyArNTM3OSw3IEBAIGludCBtYXBfcGFnZXNfdG9feGVuKAogICAgICAgICAg
ICAgewogICAgICAgICAgICAgICAgIHBsMWUgPSB2aXJ0X3RvX3hlbl9sMWUodmlydCk7CiAgICAg
ICAgICAgICAgICAgaWYgKCBwbDFlID09IE5VTEwgKQotICAgICAgICAgICAgICAgICAgICByZXR1
cm4gLUVOT01FTTsKKyAgICAgICAgICAgICAgICAgICAgZ290byBvdXQ7CiAgICAgICAgICAgICB9
CiAgICAgICAgICAgICBlbHNlIGlmICggbDJlX2dldF9mbGFncygqcGwyZSkgJiBfUEFHRV9QU0Ug
KQogICAgICAgICAgICAgewpAQCAtNTQwNCw3ICs1NDA3LDcgQEAgaW50IG1hcF9wYWdlc190b194
ZW4oCiAKICAgICAgICAgICAgICAgICBsMXQgPSBhbGxvY194ZW5fcGFnZXRhYmxlKCk7CiAgICAg
ICAgICAgICAgICAgaWYgKCBsMXQgPT0gTlVMTCApCi0gICAgICAgICAgICAgICAgICAgIHJldHVy
biAtRU5PTUVNOworICAgICAgICAgICAgICAgICAgICBnb3RvIG91dDsKIAogICAgICAgICAgICAg
ICAgIGZvciAoIGkgPSAwOyBpIDwgTDFfUEFHRVRBQkxFX0VOVFJJRVM7IGkrKyApCiAgICAgICAg
ICAgICAgICAgICAgIGwxZV93cml0ZSgmbDF0W2ldLApAQCAtNTU1MCw3ICs1NTUzLDEwIEBAIGlu
dCBtYXBfcGFnZXNfdG9feGVuKAogCiAjdW5kZWYgZmx1c2hfZmxhZ3MKIAotICAgIHJldHVybiAw
OworICAgIHJjID0gMDsKKworIG91dDoKKyAgICByZXR1cm4gcmM7CiB9CiAKIGludCBwb3B1bGF0
ZV9wdF9yYW5nZSh1bnNpZ25lZCBsb25nIHZpcnQsIHVuc2lnbmVkIGxvbmcgbnJfbWZucykKLS0g
CjIuMTcuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
