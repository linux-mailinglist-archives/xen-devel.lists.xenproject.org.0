Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF1C4C1EFF
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2019 12:36:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iEt0L-0006o5-Th; Mon, 30 Sep 2019 10:34:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Wfc7=XZ=amazon.com=prvs=169663feb=hongyax@srs-us1.protection.inumbo.net>)
 id 1iEt0K-0006ni-N1
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2019 10:34:08 +0000
X-Inumbo-ID: d54d122a-e36d-11e9-bf31-bc764e2007e4
Received: from smtp-fw-6001.amazon.com (unknown [52.95.48.154])
 by localhost (Halon) with ESMTPS
 id d54d122a-e36d-11e9-bf31-bc764e2007e4;
 Mon, 30 Sep 2019 10:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1569839647; x=1601375647;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=kpUuXZAvzGVSonE9aOxyMJVulSwYJnIv2Ma6gLcbPBA=;
 b=UWzkLOH/LQtu8A9qBI9ICRGMHyMMHSeAjq7l6SXjt3sUG3wk14wZ/aWd
 gAs+TsS0aOqs6+kb/2NDoJKLm8DWLNrrcvC08IQ4twYDxmLjpATrT8jvl
 ilvnLWN3JgOKivMCda3cbmhstLFJ5V7hfnnzS27dn2OqNfku3rvacMK/N 8=;
X-IronPort-AV: E=Sophos;i="5.64,565,1559520000"; d="scan'208";a="418649780"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1e-a70de69e.us-east-1.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP;
 30 Sep 2019 10:34:07 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1e-a70de69e.us-east-1.amazon.com (Postfix) with ESMTPS
 id E6EA8A2773; Mon, 30 Sep 2019 10:34:05 +0000 (UTC)
Received: from EX13D11UEE002.ant.amazon.com (10.43.62.113) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 30 Sep 2019 10:33:54 +0000
Received: from EX13MTAUEE001.ant.amazon.com (10.43.62.200) by
 EX13D11UEE002.ant.amazon.com (10.43.62.113) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 30 Sep 2019 10:33:54 +0000
Received: from u9d785c4ba99158.ant.amazon.com (10.125.106.78) by
 mail-relay.amazon.com (10.43.62.226) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Mon, 30 Sep 2019 10:33:53 +0000
From: Hongyan Xia <hongyax@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 30 Sep 2019 11:32:58 +0100
Message-ID: <d86148625b861498bdf2a6f56347a1ff36ca27c5.1569833766.git.hongyax@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1569833766.git.hongyax@amazon.com>
References: <cover.1569833766.git.hongyax@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v2 06/55] x86/mm: map_pages_to_xen should have
 one exit path
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
ZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgotLS0KIHhlbi9hcmNoL3g4Ni9tbS5jIHwgMzQg
KysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDI3IGlu
c2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L21t
LmMgYi94ZW4vYXJjaC94ODYvbW0uYwppbmRleCAwNjNjYWNmZmI4Li5iYTM4NTI1ZDM2IDEwMDY0
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
