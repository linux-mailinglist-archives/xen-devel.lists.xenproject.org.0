Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CAD65C8FC1
	for <lists+xen-devel@lfdr.de>; Wed,  2 Oct 2019 19:22:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFiIG-0000ql-Nx; Wed, 02 Oct 2019 17:20:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=aMxB=X3=amazon.com=prvs=17142d732=hongyax@srs-us1.protection.inumbo.net>)
 id 1iFiIE-0000cC-Fg
 for xen-devel@lists.xenproject.org; Wed, 02 Oct 2019 17:20:02 +0000
X-Inumbo-ID: dd963854-e538-11e9-971c-12813bfff9fa
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by localhost (Halon) with ESMTPS
 id dd963854-e538-11e9-971c-12813bfff9fa;
 Wed, 02 Oct 2019 17:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1570036801; x=1601572801;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=nlNmX6oFMATrz1mrFcpu7UP42RxsFpSgYon4ulWCf4k=;
 b=lFvDBUjt7Or8n9uNLg+yTmeeqhXYAqO8HR0eltHvBSveYaBKu5VzpTT9
 Es84st6w32R7EMr0fmMxZzIdECZ0ZC0I1e1sR7eHBzgF1WNvwrQ75EjEM
 uD7w9OKP5jGcBq0BduWpK+jsID73M77njlmc0r3pqmGTxj5EJNWad6kZV g=;
X-IronPort-AV: E=Sophos;i="5.67,249,1566864000"; d="scan'208";a="706204429"
Received: from sea3-co-svc-lb6-vlan3.sea.amazon.com (HELO
 email-inbound-relay-2c-6f38efd9.us-west-2.amazon.com) ([10.47.22.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 02 Oct 2019 17:17:56 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2c-6f38efd9.us-west-2.amazon.com (Postfix) with ESMTPS
 id 82251A0561; Wed,  2 Oct 2019 17:17:10 +0000 (UTC)
Received: from EX13D18UEE002.ant.amazon.com (10.43.62.65) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 2 Oct 2019 17:17:01 +0000
Received: from EX13MTAUEE001.ant.amazon.com (10.43.62.200) by
 EX13D18UEE002.ant.amazon.com (10.43.62.65) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 2 Oct 2019 17:17:00 +0000
Received: from u9d785c4ba99158.ant.amazon.com (10.125.106.78) by
 mail-relay.amazon.com (10.43.62.226) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Wed, 2 Oct 2019 17:17:00 +0000
From: Hongyan Xia <hongyax@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 2 Oct 2019 18:16:50 +0100
Message-ID: <f2f9ecb21bb40d0d41d169872b1cb18088f28e37.1570034362.git.hongyax@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1570034362.git.hongyax@amazon.com>
References: <cover.1570034362.git.hongyax@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v3 5/9] x86/mm: map_pages_to_xen should have one
 exit path
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

RnJvbTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KCldlIHdpbGwgc29vbiByZXdyaXRl
IHRoZSBmdW5jdGlvbiB0byBoYW5kbGUgZHluYW1pY2FsbHkgbWFwcGluZyBhbmQKdW5tYXBwaW5n
IG9mIHBhZ2UgdGFibGVzLgoKTm8gZnVuY3Rpb25hbCBjaGFuZ2UuCgpTaWduZWQtb2ZmLWJ5OiBX
ZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgotLS0KIHhlbi9hcmNoL3g4Ni9tbS5jIHwgMzQg
KysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDI3IGlu
c2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L21t
LmMgYi94ZW4vYXJjaC94ODYvbW0uYwppbmRleCAyYjhlMTkyZTI2Li4yNmZjYjI3MDliIDEwMDY0
NAotLS0gYS94ZW4vYXJjaC94ODYvbW0uYworKysgYi94ZW4vYXJjaC94ODYvbW0uYwpAQCAtNTAx
NCw5ICs1MDE0LDExIEBAIGludCBtYXBfcGFnZXNfdG9feGVuKAogICAgIHVuc2lnbmVkIGludCBm
bGFncykKIHsKICAgICBib29sIGxvY2tpbmcgPSBzeXN0ZW1fc3RhdGUgPiBTWVNfU1RBVEVfYm9v
dDsKKyAgICBsM19wZ2VudHJ5X3QgKnBsM2UsIG9sM2U7CiAgICAgbDJfcGdlbnRyeV90ICpwbDJl
LCBvbDJlOwogICAgIGwxX3BnZW50cnlfdCAqcGwxZSwgb2wxZTsKICAgICB1bnNpZ25lZCBpbnQg
IGk7CisgICAgaW50IHJjID0gLUVOT01FTTsKIAogI2RlZmluZSBmbHVzaF9mbGFncyhvbGRmKSBk
byB7ICAgICAgICAgICAgICAgICBcCiAgICAgdW5zaWduZWQgaW50IG9fID0gKG9sZGYpOyAgICAg
ICAgICAgICAgICAgIFwKQEAgLTUwMzQsMTAgKzUwMzYsMTMgQEAgaW50IG1hcF9wYWdlc190b194
ZW4oCiAKICAgICB3aGlsZSAoIG5yX21mbnMgIT0gMCApCiAgICAgewotICAgICAgICBsM19wZ2Vu
dHJ5X3Qgb2wzZSwgKnBsM2UgPSB2aXJ0X3RvX3hlbl9sM2UodmlydCk7CisgICAgICAgIHBsM2Ug
PSB2aXJ0X3RvX3hlbl9sM2UodmlydCk7CiAKICAgICAgICAgaWYgKCAhcGwzZSApCi0gICAgICAg
ICAgICByZXR1cm4gLUVOT01FTTsKKyAgICAgICAgeworICAgICAgICAgICAgQVNTRVJUKHJjID09
IC1FTk9NRU0pOworICAgICAgICAgICAgZ290byBvdXQ7CisgICAgICAgIH0KICAgICAgICAgb2wz
ZSA9ICpwbDNlOwogCiAgICAgICAgIGlmICggY3B1X2hhc19wYWdlMWdiICYmCkBAIC01MTI5LDcg
KzUxMzQsMTAgQEAgaW50IG1hcF9wYWdlc190b194ZW4oCiAKICAgICAgICAgICAgIGwydCA9IGFs
bG9jX3hlbl9wYWdldGFibGUoKTsKICAgICAgICAgICAgIGlmICggbDJ0ID09IE5VTEwgKQotICAg
ICAgICAgICAgICAgIHJldHVybiAtRU5PTUVNOworICAgICAgICAgICAgeworICAgICAgICAgICAg
ICAgIEFTU0VSVChyYyA9PSAtRU5PTUVNKTsKKyAgICAgICAgICAgICAgICBnb3RvIG91dDsKKyAg
ICAgICAgICAgIH0KIAogICAgICAgICAgICAgZm9yICggaSA9IDA7IGkgPCBMMl9QQUdFVEFCTEVf
RU5UUklFUzsgaSsrICkKICAgICAgICAgICAgICAgICBsMmVfd3JpdGUobDJ0ICsgaSwKQEAgLTUx
NTgsNyArNTE2NiwxMCBAQCBpbnQgbWFwX3BhZ2VzX3RvX3hlbigKIAogICAgICAgICBwbDJlID0g
dmlydF90b194ZW5fbDJlKHZpcnQpOwogICAgICAgICBpZiAoICFwbDJlICkKLSAgICAgICAgICAg
IHJldHVybiAtRU5PTUVNOworICAgICAgICB7CisgICAgICAgICAgICBBU1NFUlQocmMgPT0gLUVO
T01FTSk7CisgICAgICAgICAgICBnb3RvIG91dDsKKyAgICAgICAgfQogCiAgICAgICAgIGlmICgg
KCgoKHZpcnQgPj4gUEFHRV9TSElGVCkgfCBtZm5feChtZm4pKSAmCiAgICAgICAgICAgICAgICAo
KDF1IDw8IFBBR0VUQUJMRV9PUkRFUikgLSAxKSkgPT0gMCkgJiYKQEAgLTUyMDMsNyArNTIxNCwx
MCBAQCBpbnQgbWFwX3BhZ2VzX3RvX3hlbigKICAgICAgICAgICAgIHsKICAgICAgICAgICAgICAg
ICBwbDFlID0gdmlydF90b194ZW5fbDFlKHZpcnQpOwogICAgICAgICAgICAgICAgIGlmICggcGwx
ZSA9PSBOVUxMICkKLSAgICAgICAgICAgICAgICAgICAgcmV0dXJuIC1FTk9NRU07CisgICAgICAg
ICAgICAgICAgeworICAgICAgICAgICAgICAgICAgICBBU1NFUlQocmMgPT0gLUVOT01FTSk7Cisg
ICAgICAgICAgICAgICAgICAgIGdvdG8gb3V0OworICAgICAgICAgICAgICAgIH0KICAgICAgICAg
ICAgIH0KICAgICAgICAgICAgIGVsc2UgaWYgKCBsMmVfZ2V0X2ZsYWdzKCpwbDJlKSAmIF9QQUdF
X1BTRSApCiAgICAgICAgICAgICB7CkBAIC01MjMxLDcgKzUyNDUsMTAgQEAgaW50IG1hcF9wYWdl
c190b194ZW4oCiAKICAgICAgICAgICAgICAgICBsMXQgPSBhbGxvY194ZW5fcGFnZXRhYmxlKCk7
CiAgICAgICAgICAgICAgICAgaWYgKCBsMXQgPT0gTlVMTCApCi0gICAgICAgICAgICAgICAgICAg
IHJldHVybiAtRU5PTUVNOworICAgICAgICAgICAgICAgIHsKKyAgICAgICAgICAgICAgICAgICAg
QVNTRVJUKHJjID09IC1FTk9NRU0pOworICAgICAgICAgICAgICAgICAgICBnb3RvIG91dDsKKyAg
ICAgICAgICAgICAgICB9CiAKICAgICAgICAgICAgICAgICBmb3IgKCBpID0gMDsgaSA8IEwxX1BB
R0VUQUJMRV9FTlRSSUVTOyBpKysgKQogICAgICAgICAgICAgICAgICAgICBsMWVfd3JpdGUoJmwx
dFtpXSwKQEAgLTUzNzcsNyArNTM5NCwxMCBAQCBpbnQgbWFwX3BhZ2VzX3RvX3hlbigKIAogI3Vu
ZGVmIGZsdXNoX2ZsYWdzCiAKLSAgICByZXR1cm4gMDsKKyAgICByYyA9IDA7CisKKyBvdXQ6Cisg
ICAgcmV0dXJuIHJjOwogfQogCiBpbnQgcG9wdWxhdGVfcHRfcmFuZ2UodW5zaWduZWQgbG9uZyB2
aXJ0LCB1bnNpZ25lZCBsb25nIG5yX21mbnMpCi0tIAoyLjE3LjEKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
