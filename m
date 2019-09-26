Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 205CABEEFD
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 11:52:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDQQ7-0000qI-Jd; Thu, 26 Sep 2019 09:50:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ph5t=XV=amazon.com=prvs=165c3e20f=hongyax@srs-us1.protection.inumbo.net>)
 id 1iDQQ2-0000jT-LP
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 09:50:38 +0000
X-Inumbo-ID: 0e7fd56a-e043-11e9-b588-bc764e2007e4
Received: from smtp-fw-2101.amazon.com (unknown [72.21.196.25])
 by localhost (Halon) with ESMTPS
 id 0e7fd56a-e043-11e9-b588-bc764e2007e4;
 Thu, 26 Sep 2019 09:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1569491422; x=1601027422;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=+1jLygSDyv4GFQENO5qpV0Y2nFg1v//DHVeDCSUFn/g=;
 b=NDAiXiSKfqZTaxKhvvItUUqMB+IQIPWe80Mu1q1v7CsMQEyU/cp35Neb
 C8tMCcH6B5frX7M0j89HFshFN5Az/OwQBPgVFdCJXwIwXAI9Q+IkpS8fB
 0kZwGh1APQqNXZbtlkh+Nk0cjFNdYaPfiCOkMIBc02hlIAdAEsqKku2r4 4=;
X-IronPort-AV: E=Sophos;i="5.64,551,1559520000"; d="scan'208";a="753354491"
Received: from iad6-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-1a-af6a10df.us-east-1.amazon.com) ([10.124.125.2])
 by smtp-border-fw-out-2101.iad2.amazon.com with ESMTP;
 26 Sep 2019 09:50:22 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1a-af6a10df.us-east-1.amazon.com (Postfix) with ESMTPS
 id 8FB9BA0702; Thu, 26 Sep 2019 09:50:20 +0000 (UTC)
Received: from EX13D28EUC003.ant.amazon.com (10.43.164.43) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 26 Sep 2019 09:49:54 +0000
Received: from EX13MTAUWA001.ant.amazon.com (10.43.160.58) by
 EX13D28EUC003.ant.amazon.com (10.43.164.43) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 26 Sep 2019 09:49:52 +0000
Received: from u9d785c4ba99158.ant.amazon.com (10.125.106.58) by
 mail-relay.amazon.com (10.43.160.118) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Thu, 26 Sep 2019 09:49:50 +0000
From: <hongyax@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 26 Sep 2019 10:46:40 +0100
Message-ID: <450fcebd6ad4cbf0b078070149b9287260bdc0a3.1569489002.git.hongyax@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1569489002.git.hongyax@amazon.com>
References: <cover.1569489002.git.hongyax@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [RFC PATCH 77/84] x86: properly (un)map pages in
 restore_all_guests.
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>,
 Hongyan Xia <hongyax@amazon.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogSG9uZ3lhbiBYaWEgPGhvbmd5YXhAYW1hem9uLmNvbT4KCkJlZm9yZSwgaXQgYXNzdW1l
ZCBib3RoIGNyMyBjb3VsZCBiZSBhY2Nlc3NlZCB2aWEgYSBkaXJlY3QgbWFwLiBUaGlzIGlzCm5v
IGxvbmdlciB0cnVlLiBBbHNvLCB0aGlzIG1lYW5zIHdlIGNhbiByZW1vdmUgYSB4ZW5oZWFwIG1h
cHBpbmcgaGFjawp3ZSBpbnRyb2R1Y2VkIGVhcmxpZXIgd2hlbiBidWlsZGluZyB0aGUgY3IzIG9m
IGRvbTAuCgpTaWduZWQtb2ZmLWJ5OiBIb25neWFuIFhpYSA8aG9uZ3lheEBhbWF6b24uY29tPgot
LS0KIHhlbi9hcmNoL3g4Ni9wdi9kb20wX2J1aWxkLmMgfCAxMSArKysrKy0tLS0tLQogeGVuL2Fy
Y2gveDg2L3g4Nl82NC9lbnRyeS5TICB8IDMyICsrKysrKysrKysrKysrKysrKysrKysrKysrKysr
LS0tCiAyIGZpbGVzIGNoYW5nZWQsIDM0IGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L3B2L2RvbTBfYnVpbGQuYyBiL3hlbi9hcmNoL3g4Ni9w
di9kb20wX2J1aWxkLmMKaW5kZXggMGVjMzA5ODhiOC4uMjAyZWRjYWExNyAxMDA2NDQKLS0tIGEv
eGVuL2FyY2gveDg2L3B2L2RvbTBfYnVpbGQuYworKysgYi94ZW4vYXJjaC94ODYvcHYvZG9tMF9i
dWlsZC5jCkBAIC02MjMsOSArNjIzLDcgQEAgaW50IF9faW5pdCBkb20wX2NvbnN0cnVjdF9wdihz
dHJ1Y3QgZG9tYWluICpkLAogICAgIGlmICggIWlzX3B2XzMyYml0X2RvbWFpbihkKSApCiAgICAg
ewogICAgICAgICBtYWRkcl90b19wYWdlKG1wdF9hbGxvYyktPnUuaW51c2UudHlwZV9pbmZvID0g
UEdUX2w0X3BhZ2VfdGFibGU7Ci0gICAgICAgIGw0c3RhcnQgPSBsNHRhYiA9IF9fdmEobXB0X2Fs
bG9jKTsKLSAgICAgICAgbWFwX3BhZ2VzX3RvX3hlbigodW5zaWduZWQgbG9uZylsNHN0YXJ0LCBt
YWRkcl90b19tZm4obXB0X2FsbG9jKSwgMSwKLSAgICAgICAgICAgICAgICBQQUdFX0hZUEVSVklT
T1IpOworICAgICAgICBsNHN0YXJ0ID0gbDR0YWIgPSBtYXBfeGVuX3BhZ2V0YWJsZShtYWRkcl90
b19tZm4obXB0X2FsbG9jKSk7CiAgICAgICAgIG1wdF9hbGxvYyArPSBQQUdFX1NJWkU7CiAgICAg
ICAgIGNsZWFyX3BhZ2UobDR0YWIpOwogICAgICAgICBpbml0X3hlbl9sNF9zbG90cyhsNHRhYiwg
X21mbih2aXJ0X3RvX21mbihsNHN0YXJ0KSksCkBAIC02MzUsOSArNjMzLDggQEAgaW50IF9faW5p
dCBkb20wX2NvbnN0cnVjdF9wdihzdHJ1Y3QgZG9tYWluICpkLAogICAgIGVsc2UKICAgICB7CiAg
ICAgICAgIC8qIE1vbml0b3IgdGFibGUgYWxyZWFkeSBjcmVhdGVkIGJ5IHN3aXRjaF9jb21wYXQo
KS4gKi8KLSAgICAgICAgbDRzdGFydCA9IGw0dGFiID0gX192YShwYWdldGFibGVfZ2V0X3BhZGRy
KHYtPmFyY2guZ3Vlc3RfdGFibGUpKTsKLSAgICAgICAgbWFwX3BhZ2VzX3RvX3hlbigodW5zaWdu
ZWQgbG9uZylsNHN0YXJ0LAotICAgICAgICAgICAgICAgIHBhZ2V0YWJsZV9nZXRfbWZuKHYtPmFy
Y2guZ3Vlc3RfdGFibGUpLCAxLCBQQUdFX0hZUEVSVklTT1IpOworICAgICAgICBsNHN0YXJ0ID0g
bDR0YWIgPQorICAgICAgICAgICAgICAgIG1hcF94ZW5fcGFnZXRhYmxlKHBhZ2V0YWJsZV9nZXRf
bWZuKHYtPmFyY2guZ3Vlc3RfdGFibGUpKTsKICAgICAgICAgLyogU2VlIHB1YmxpYy94ZW4uaCBv
biB3aHkgdGhlIGZvbGxvd2luZyBpcyBuZWVkZWQuICovCiAgICAgICAgIG1hZGRyX3RvX3BhZ2Uo
bXB0X2FsbG9jKS0+dS5pbnVzZS50eXBlX2luZm8gPSBQR1RfbDNfcGFnZV90YWJsZTsKICAgICAg
ICAgbDNzdGFydCA9IG1hcF94ZW5fcGFnZXRhYmxlKG1hZGRyX3RvX21mbihtcHRfYWxsb2MpKTsK
QEAgLTkwNyw2ICs5MDQsOCBAQCBpbnQgX19pbml0IGRvbTBfY29uc3RydWN0X3B2KHN0cnVjdCBk
b21haW4gKmQsCiAgICAgICAgIHB2X3NoaW1fc2V0dXBfZG9tKGQsIGw0c3RhcnQsIHZfc3RhcnQs
IHZ4ZW5zdG9yZV9zdGFydCwgdmNvbnNvbGVfc3RhcnQsCiAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHZwaHlzbWFwX3N0YXJ0LCBzaSk7CiAKKyAgICBVTk1BUF9YRU5fUEFHRVRBQkxFKGw0c3Rh
cnQpOworCiAgICAgaWYgKCBpc19wdl8zMmJpdF9kb21haW4oZCkgKQogICAgICAgICB4bGF0X3N0
YXJ0X2luZm8oc2ksIHB2X3NoaW0gPyBYTEFUX3N0YXJ0X2luZm9fY29uc29sZV9kb21VCiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA6IFhMQVRfc3RhcnRfaW5mb19jb25zb2xl
X2RvbTApOwpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L3g4Nl82NC9lbnRyeS5TIGIveGVuL2Fy
Y2gveDg2L3g4Nl82NC9lbnRyeS5TCmluZGV4IDExMzg1ODU3ZmEuLjhjYTlhOGUwZWEgMTAwNjQ0
Ci0tLSBhL3hlbi9hcmNoL3g4Ni94ODZfNjQvZW50cnkuUworKysgYi94ZW4vYXJjaC94ODYveDg2
XzY0L2VudHJ5LlMKQEAgLTE1MCwxMSArMTUwLDI3IEBAIHJlc3RvcmVfYWxsX2d1ZXN0OgogICAg
ICAgICBqZSAgICAuTHJhZ19jb3B5X2RvbmUKICAgICAgICAgbW92YiAgJDAsIFNUQUNLX0NQVUlO
Rk9fRklFTEQocm9vdF9wZ3RfY2hhbmdlZCkoJXJkeCkKICAgICAgICAgbW92YWJzICRQQUREUl9N
QVNLICYgUEFHRV9NQVNLLCAlcnNpCi0gICAgICAgIG1vdmFicyAkRElSRUNUTUFQX1ZJUlRfU1RB
UlQsICVyY3gKICAgICAgICAgYW5kICAgJXJzaSwgJXJkaQogICAgICAgICBhbmQgICAlcjksICVy
c2kKLSAgICAgICAgYWRkICAgJXJjeCwgJXJkaQotICAgICAgICBhZGQgICAlcmN4LCAlcnNpCisK
KyAgICAgICAgLyogV2l0aG91dCBhIGRpcmVjdCBtYXAsIHdlIGhhdmUgdG8gbWFwIHBhZ2VzIGZp
cnN0IGJlZm9yZSBjb3B5aW5nLiAqLworICAgICAgICAvKiBGSVhNRTogb3B0aW1pc2F0aW9ucyBt
YXkgYmUgbmVlZGVkLiAqLworICAgICAgICBwdXNocSAlcjkKKyAgICAgICAgcHVzaHEgJXJkeAor
ICAgICAgICBwdXNocSAlcmF4CisgICAgICAgIHB1c2hxICVyc2kKKyAgICAgICAgc2hyICAgJFBB
R0VfU0hJRlQsICVyZGkKKyAgICAgICAgY2FsbHEgbWFwX3hlbl9wYWdldGFibGUKKyAgICAgICAg
cG9wcSAgJXJkaQorICAgICAgICBwdXNocSAlcmF4CisgICAgICAgIHNociAgICRQQUdFX1NISUZU
LCAlcmRpCisgICAgICAgIGNhbGxxIG1hcF94ZW5fcGFnZXRhYmxlCisgICAgICAgIG1vdiAgICVy
YXgsICVyc2kKKyAgICAgICAgbW92ICAgMCglcnNwKSwgJXJkaQorCisgICAgICAgIC8qICVyc2kg
YW5kICVyZGkgYXJlIG9uIHRvcCB0aGUgc3RhY2sgZm9yIHVubWFwcGluZy4gKi8KKyAgICAgICAg
cHVzaHEgJXJzaQorCiAgICAgICAgIG1vdiAgICRST09UX1BBR0VUQUJMRV9GSVJTVF9YRU5fU0xP
VCwgJWVjeAogICAgICAgICBtb3YgICByb290X3RhYmxlX29mZnNldChTSF9MSU5FQVJfUFRfVklS
VF9TVEFSVCkqOCglcnNpKSwgJXI4CiAgICAgICAgIG1vdiAgICVyOCwgcm9vdF90YWJsZV9vZmZz
ZXQoU0hfTElORUFSX1BUX1ZJUlRfU1RBUlQpKjgoJXJkaSkKQEAgLTE2Niw2ICsxODIsMTYgQEAg
cmVzdG9yZV9hbGxfZ3Vlc3Q6CiAgICAgICAgIHN1YiAgICQoUk9PVF9QQUdFVEFCTEVfRklSU1Rf
WEVOX1NMT1QgLSBcCiAgICAgICAgICAgICAgICAgUk9PVF9QQUdFVEFCTEVfTEFTVF9YRU5fU0xP
VCAtIDEpICogOCwgJXJkaQogICAgICAgICByZXAgbW92c3EKKworICAgICAgICAvKiBVbm1hcCB0
aGUgdHdvIHBhZ2VzLiAqLworICAgICAgICBwb3BxICAlcmRpCisgICAgICAgIGNhbGxxIHVubWFw
X3hlbl9wYWdldGFibGUKKyAgICAgICAgcG9wcSAgJXJkaQorICAgICAgICBjYWxscSB1bm1hcF94
ZW5fcGFnZXRhYmxlCisgICAgICAgIHBvcHEgICVyYXgKKyAgICAgICAgcG9wcSAgJXJkeAorICAg
ICAgICBwb3BxICAlcjkKKwogLkxyYWdfY29weV9kb25lOgogICAgICAgICBtb3YgICAlcjksIFNU
QUNLX0NQVUlORk9fRklFTEQoeGVuX2NyMykoJXJkeCkKICAgICAgICAgbW92YiAgJDEsIFNUQUNL
X0NQVUlORk9fRklFTEQodXNlX3B2X2NyMykoJXJkeCkKLS0gCjIuMTcuMQoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
