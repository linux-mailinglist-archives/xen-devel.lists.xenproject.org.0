Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4395A14EF19
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jan 2020 16:04:36 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ixXoI-00061w-Rg; Fri, 31 Jan 2020 15:02:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Qch3=3U=amazon.co.uk=prvs=292a3fd2f=pdurrant@srs-us1.protection.inumbo.net>)
 id 1ixXoH-00061a-SY
 for xen-devel@lists.xenproject.org; Fri, 31 Jan 2020 15:02:17 +0000
X-Inumbo-ID: abe59294-443a-11ea-8396-bc764e2007e4
Received: from smtp-fw-2101.amazon.com (unknown [72.21.196.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id abe59294-443a-11ea-8396-bc764e2007e4;
 Fri, 31 Jan 2020 15:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1580482937; x=1612018937;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kgzoePSZ5DVmpFR0cl3W71MSx1H7ORTwRVlSh90CEBY=;
 b=W/ORD+4+b17QhfYXsQo2xxQT6RCjdblidfT+gh98PtpguIDCV2nP423n
 pJ+hMRSC7trmqDWZo00CUrTdxaQLHATYqqa8+aznfxOfbyftTesV3OvZ1
 v6OlBrKiKBE7crE8ULQS/pRirBrki2147xzPTA6yzx+WsfAvzJhfmIUV1 0=;
IronPort-SDR: 8vbpK4HOD1/1spJH6FZhSyrBxtSEG9SBoVqmOns/Wm8TubA5UzfQTIUfvXIpoukJN0C6I2AD6v
 rpNX24GrgJ8g==
X-IronPort-AV: E=Sophos;i="5.70,386,1574121600"; d="scan'208";a="15104667"
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-2b-8cc5d68b.us-west-2.amazon.com) ([10.43.8.2])
 by smtp-border-fw-out-2101.iad2.amazon.com with ESMTP;
 31 Jan 2020 15:02:15 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2b-8cc5d68b.us-west-2.amazon.com (Postfix) with ESMTPS
 id BA15BA0733; Fri, 31 Jan 2020 15:02:14 +0000 (UTC)
Received: from EX13D32EUB002.ant.amazon.com (10.43.166.114) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Fri, 31 Jan 2020 15:02:00 +0000
Received: from EX13MTAUEE002.ant.amazon.com (10.43.62.24) by
 EX13D32EUB002.ant.amazon.com (10.43.166.114) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 31 Jan 2020 15:01:59 +0000
Received: from u2f063a87eabd5f.cbg10.amazon.com (10.125.106.135) by
 mail-relay.amazon.com (10.43.62.224) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Fri, 31 Jan 2020 15:01:57 +0000
From: Paul Durrant <pdurrant@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 31 Jan 2020 15:01:46 +0000
Message-ID: <20200131150149.2008-5-pdurrant@amazon.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200131150149.2008-1-pdurrant@amazon.com>
References: <20200131150149.2008-1-pdurrant@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v5 4/7] libxl: add infrastructure to track and
 query 'recent' domids
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Paul Durrant <pdurrant@amazon.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QSBkb21pZCBpcyBjb25zaWRlcmVkIHJlY2VudCBpZiB0aGUgZG9tYWluIGl0IHJlcHJlc2VudHMg
d2FzIGRlc3Ryb3llZApsZXNzIHRoYW4gYSBzcGVjaWZpZWQgbnVtYmVyIG9mIHNlY29uZHMgYWdv
LiBGb3IgZGVidWdnaW5nIGFuZC9vciB0ZXN0aW5nCnB1cnBvc2VzIHRoZSBudW1iZXIgY2FuIGJl
IHNldCB1c2luZyB0aGUgZW52aXJvbm1lbnQgdmFyaWFibGUKTElCWExfRE9NSURfUkVVU0VfVElN
RU9VVC4gSWYgdGhlIHZhcmlhYmxlIGRvZXMgbm90IGV4aXN0IHRoZW4gYSBkZWZhdWx0CnZhbHVl
IG9mIDYwcyBpcyB1c2VkLgoKV2hlbmV2ZXIgYSBkb21haW4gaXMgZGVzdHJveWVkLCBhIHRpbWUt
c3RhbXBlZCByZWNvcmQgd2lsbCBiZSB3cml0dGVuIGludG8KYSBoaXN0b3J5IGZpbGUgKC92YXIv
cnVuL3hlbi9kb21pZC1oaXN0b3J5KS4gVG8gYXZvaWQgdGhlIGhpc3RvcnkgZmlsZQpncm93aW5n
IHRvbyBsYXJnZSwgYW55IHJlY29yZHMgd2l0aCB0aW1lLXN0YW1wcyB0aGF0IGluZGljYXRlIHRo
YXQgdGhlCmFnZSBvZiBhIGRvbWlkIGhhcyBleGNlZWRlZCB0aGUgcmUtdXNlIHRpbWVvdXQgd2ls
bCBhbHNvIGJlIHB1cmdlZC4KCkEgbmV3IHV0aWxpdHkgZnVuY3Rpb24sIGxpYnhsX19pc19yZWNl
bnRfZG9taWQoKSwgaGFzIGJlZW4gYWRkZWQuIFRoaXMKZnVuY3Rpb24gcmVhZHMgdGhlIHNhbWUg
aGlzdG9yeSBmaWxlIGNoZWNraW5nIHdoZXRoZXIgYSBzcGVjaWZpZWQgZG9taWQKaGFzIGEgcmVj
b3JkIHRoYXQgZG9lcyBub3QgZXhjZWVkIHRoZSByZS11c2UgdGltZW91dC4gU2luY2UgdGhpcyB1
dGlsaXR5CmZ1bmN0aW9uIGRvZXMgbm90IHdyaXRlIHRvIHRoZSBmaWxlLCBubyByZWNvcmRzIGFy
ZSBhY3R1YWxseSBwdXJnZWQgYnkgaXQuCgpOT1RFOiBUaGUgaGlzdG9yeSBmaWxlIGlzIHB1cmdl
ZCBvbiBib290IHRvIGl0IGlzIHNhZmUgdG8gdXNlCiAgICAgIENMT0NLX01PTk9UT05JQyBhcyBh
IHRpbWUgc291cmNlLgoKU2lnbmVkLW9mZi1ieTogUGF1bCBEdXJyYW50IDxwZHVycmFudEBhbWF6
b24uY29tPgotLS0KQ2M6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgpD
YzogV2VpIExpdSA8d2xAeGVuLm9yZz4KQ2M6IEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFy
ZEBjaXRyaXguY29tPgoKdjU6CiAtIFJlLXdvcmsgZmlsZSBtYW5pcHVsYXRpb24gc29tZSBtb3Jl
CiAtIEFkZCBtb3JlIGVycm9yIGNoZWNrcwoKdjQ6CiAtIFVzZSBuZXcgZ2VuZXJhbGlzZWQgbGli
eGxfX2Zsb2NrCiAtIERvbid0IHJlYWQgYW5kIHdyaXRlIHRoZSBzYW1lIGZpbGUKIC0gVXNlICdy
ZWNlbnQnIHJhdGhlciB0aGFuICdyZXRpcmVkJwogLSBBZGQgY29kZSBpbnRvIHhlbi1pbml0LWRv
bTAgdG8gZGVsZXRlIGFuIG9sZCBoaXN0b3J5IGZpbGUgYXQgYm9vdAoKdjI6CiAtIE5ldyBpbiB2
MgotLS0KIHRvb2xzL2hlbHBlcnMveGVuLWluaXQtZG9tMC5jIHwgIDMwICsrKysrCiB0b29scy9s
aWJ4bC9saWJ4bC5oICAgICAgICAgICB8ICAgMiArCiB0b29scy9saWJ4bC9saWJ4bF9kb21haW4u
YyAgICB8IDIwNCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCiB0b29scy9saWJ4
bC9saWJ4bF9pbnRlcm5hbC5jICB8ICAxMCArKwogdG9vbHMvbGlieGwvbGlieGxfaW50ZXJuYWwu
aCAgfCAgMTQgKysrCiA1IGZpbGVzIGNoYW5nZWQsIDI2MCBpbnNlcnRpb25zKCspCgpkaWZmIC0t
Z2l0IGEvdG9vbHMvaGVscGVycy94ZW4taW5pdC1kb20wLmMgYi90b29scy9oZWxwZXJzL3hlbi1p
bml0LWRvbTAuYwppbmRleCBhMWU1NzI5NDU4Li41NmY2OWFiNjZmIDEwMDY0NAotLS0gYS90b29s
cy9oZWxwZXJzL3hlbi1pbml0LWRvbTAuYworKysgYi90b29scy9oZWxwZXJzL3hlbi1pbml0LWRv
bTAuYwpAQCAtMTIsNiArMTIsMzIgQEAKICNkZWZpbmUgRE9NTkFNRV9QQVRIICAgIi9sb2NhbC9k
b21haW4vMC9uYW1lIgogI2RlZmluZSBET01JRF9QQVRIICAgICAiL2xvY2FsL2RvbWFpbi8wL2Rv
bWlkIgogCitpbnQgY2xlYXJfZG9taWRfaGlzdG9yeSh2b2lkKQoreworICAgIGludCByYyA9IDE7
CisgICAgeGVudG9vbGxvZ19sb2dnZXJfc3RkaW9zdHJlYW0gKmxvZ2dlcjsKKyAgICBsaWJ4bF9j
dHggKmN0eDsKKworICAgIGxvZ2dlciA9IHh0bF9jcmVhdGVsb2dnZXJfc3RkaW9zdHJlYW0oc3Rk
ZXJyLCBYVExfRVJST1IsIDApOworICAgIGlmICghbG9nZ2VyKQorICAgICAgICByZXR1cm4gMTsK
KworICAgIGlmIChsaWJ4bF9jdHhfYWxsb2MoJmN0eCwgTElCWExfVkVSU0lPTiwgMCwKKyAgICAg
ICAgICAgICAgICAgICAgICAgICh4ZW50b29sbG9nX2xvZ2dlciAqKWxvZ2dlcikpIHsKKyAgICAg
ICAgZnByaW50ZihzdGRlcnIsICJjYW5ub3QgaW5pdCBsaWJ4bCBjb250ZXh0XG4iKTsKKyAgICAg
ICAgZ290byBvdXRsb2c7CisgICAgfQorCisgICAgaWYgKCFsaWJ4bF9jbGVhcl9kb21pZF9oaXN0
b3J5KGN0eCkpCisgICAgICAgIHJjID0gMDsKKworICAgIGxpYnhsX2N0eF9mcmVlKGN0eCk7CisK
K291dGxvZzoKKyAgICB4dGxfbG9nZ2VyX2Rlc3Ryb3koKHhlbnRvb2xsb2dfbG9nZ2VyICopbG9n
Z2VyKTsKKyAgICByZXR1cm4gcmM7Cit9CisKIGludCBtYWluKGludCBhcmdjLCBjaGFyICoqYXJn
dikKIHsKICAgICBpbnQgcmM7CkBAIC03MCw2ICs5NiwxMCBAQCBpbnQgbWFpbihpbnQgYXJnYywg
Y2hhciAqKmFyZ3YpCiAgICAgaWYgKHJjKQogICAgICAgICBnb3RvIG91dDsKIAorICAgIHJjID0g
Y2xlYXJfZG9taWRfaGlzdG9yeSgpOworICAgIGlmIChyYykKKyAgICAgICAgZ290byBvdXQ7CisK
ICAgICAvKiBXcml0ZSB4ZW5zdG9yZSBlbnRyaWVzLiAqLwogICAgIGlmICgheHNfd3JpdGUoeHNo
LCBYQlRfTlVMTCwgRE9NSURfUEFUSCwgIjAiLCBzdHJsZW4oIjAiKSkpIHsKICAgICAgICAgZnBy
aW50ZihzdGRlcnIsICJjYW5ub3Qgc2V0IGRvbWlkIGZvciBEb20wXG4iKTsKZGlmZiAtLWdpdCBh
L3Rvb2xzL2xpYnhsL2xpYnhsLmggYi90b29scy9saWJ4bC9saWJ4bC5oCmluZGV4IDE4YzFhMmQ2
YmYuLjFkMjM1ZWNiMWMgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2xpYnhsL2xpYnhsLmgKKysrIGIvdG9v
bHMvbGlieGwvbGlieGwuaApAQCAtMjY1Nyw2ICsyNjU3LDggQEAgc3RhdGljIGlubGluZSBpbnQg
bGlieGxfcWVtdV9tb25pdG9yX2NvbW1hbmRfMHgwNDEyMDAobGlieGxfY3R4ICpjdHgsCiAKICNp
bmNsdWRlIDxsaWJ4bF9ldmVudC5oPgogCitpbnQgbGlieGxfY2xlYXJfZG9taWRfaGlzdG9yeShs
aWJ4bF9jdHggKmN0eCk7CisKICNlbmRpZiAvKiBMSUJYTF9IICovCiAKIC8qCmRpZmYgLS1naXQg
YS90b29scy9saWJ4bC9saWJ4bF9kb21haW4uYyBiL3Rvb2xzL2xpYnhsL2xpYnhsX2RvbWFpbi5j
CmluZGV4IDk3M2ZjMTQzNGQuLjUzNDlkZWZjZjAgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2xpYnhsL2xp
YnhsX2RvbWFpbi5jCisrKyBiL3Rvb2xzL2xpYnhsL2xpYnhsX2RvbWFpbi5jCkBAIC0xMjY4LDYg
KzEyNjgsMjA4IEBAIHN0YXRpYyB2b2lkIGRtX2Rlc3Ryb3lfY2IobGlieGxfX2VnYyAqZWdjLAog
ICAgIGxpYnhsX19kZXZpY2VzX2Rlc3Ryb3koZWdjLCAmZGlzLT5kcnMpOwogfQogCitzdGF0aWMg
dW5zaWduZWQgaW50IGxpYnhsX19nZXRfZG9taWRfcmV1c2VfdGltZW91dCh2b2lkKQoreworICAg
IGNvbnN0IGNoYXIgKmVudl90aW1lb3V0ID0gZ2V0ZW52KCJMSUJYTF9ET01JRF9SRVVTRV9USU1F
T1VUIik7CisKKyAgICByZXR1cm4gZW52X3RpbWVvdXQgPyBzdHJ0b2woZW52X3RpbWVvdXQsIE5V
TEwsIDApIDoKKyAgICAgICAgTElCWExfRE9NSURfUkVVU0VfVElNRU9VVDsKK30KKworY2hhciAq
bGlieGxfX2RvbWlkX2hpc3RvcnlfcGF0aChsaWJ4bF9fZ2MgKmdjLCBjb25zdCBjaGFyICpzdWZm
aXgpCit7CisgICAgcmV0dXJuIEdDU1BSSU5URigiJXMvZG9taWQtaGlzdG9yeSVzIiwgbGlieGxf
X3J1bl9kaXJfcGF0aCgpLAorICAgICAgICAgICAgICAgICAgICAgc3VmZml4ID86ICIiKTsKK30K
KworaW50IGxpYnhsX2NsZWFyX2RvbWlkX2hpc3RvcnkobGlieGxfY3R4ICpjdHgpCit7CisgICAg
R0NfSU5JVChjdHgpOworICAgIGNoYXIgKnBhdGg7CisgICAgaW50IHJjID0gRVJST1JfRkFJTDsK
KworICAgIHBhdGggPSBsaWJ4bF9fZG9taWRfaGlzdG9yeV9wYXRoKGdjLCBOVUxMKTsKKyAgICBp
ZiAoIXBhdGgpCisgICAgICAgIGdvdG8gb3V0OworCisgICAgaWYgKHVubGluayhwYXRoKSA8IDAg
JiYgZXJybm8gIT0gRU5PRU5UKSB7CisgICAgICAgIExPR0UoRVJST1IsICJmYWlsZWQgdG8gcmVt
b3ZlICclcydcbiIsIHBhdGgpOworICAgICAgICBnb3RvIG91dDsKKyAgICB9CisKKyAgICByYyA9
IDA7CisKK291dDoKKyAgICBHQ19GUkVFOworICAgIHJldHVybiByYzsKK30KKworc3RhdGljIGJv
b2wgbGlieGxfX3JlYWRfcmVjZW50KEZJTEUgKmYsIHVuc2lnbmVkIGxvbmcgKnNlYywKKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgKmRvbWlkKQoreworICAgIGlu
dCBuOworCisgICAgYXNzZXJ0KGYpOworCisgICAgbiA9IGZzY2FuZihmLCAiJWx1ICV1Iiwgc2Vj
LCBkb21pZCk7CisgICAgaWYgKG4gPT0gRU9GKQorICAgICAgICByZXR1cm4gZmFsc2U7CisgICAg
ZWxzZSBpZiAobiAhPSAyKSAvKiBtYWxmb3JtZWQgZW50cnkgKi8KKyAgICAgICAgKmRvbWlkID0g
SU5WQUxJRF9ET01JRDsKKworICAgIHJldHVybiB0cnVlOworfQorCitzdGF0aWMgYm9vbCBsaWJ4
bF9fd3JpdGVfcmVjZW50KEZJTEUgKmYsIHVuc2lnbmVkIGxvbmcgc2VjLAorICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgZG9taWQpCit7CisgICAgYXNzZXJ0KGYp
OworICAgIGFzc2VydChsaWJ4bF9kb21pZF92YWxpZF9ndWVzdChkb21pZCkpOworCisgICAgcmV0
dXJuIGZwcmludGYoZiwgIiVsdSAldVxuIiwgc2VjLCBkb21pZCkgPiAwOworfQorCitzdGF0aWMg
aW50IGxpYnhsX19tYXJrX2RvbWlkX3JlY2VudChsaWJ4bF9fZ2MgKmdjLCB1aW50MzJfdCBkb21p
ZCkKK3sKKyAgICBsb25nIHRpbWVvdXQgPSBsaWJ4bF9fZ2V0X2RvbWlkX3JldXNlX3RpbWVvdXQo
KTsKKyAgICBsaWJ4bF9fZmxvY2sgKmxvY2s7CisgICAgY2hhciAqb2xkLCAqbmV3OworICAgIEZJ
TEUgKm9mID0gTlVMTCwgKm5mID0gTlVMTDsKKyAgICBzdHJ1Y3QgdGltZXNwZWMgdHM7CisgICAg
aW50IHJjID0gRVJST1JfRkFJTDsKKworICAgIGxvY2sgPSBsaWJ4bF9fbG9ja19kb21pZF9oaXN0
b3J5KGdjKTsKKyAgICBpZiAoIWxvY2spIHsKKyAgICAgICAgTE9HRUQoRVJST1IsIGRvbWlkLCAi
ZmFpbGVkIHRvIGFjcXVpcmUgbG9jayIpOworICAgICAgICBnb3RvIG91dDsKKyAgICB9CisKKyAg
ICBvbGQgPSBsaWJ4bF9fZG9taWRfaGlzdG9yeV9wYXRoKGdjLCBOVUxMKTsKKyAgICBvZiA9IGZv
cGVuKG9sZCwgInIiKTsKKyAgICBpZiAoIW9mICYmIGVycm5vICE9IEVOT0VOVCkKKyAgICAgICAg
TE9HRUQoV0FSTiwgZG9taWQsICJmYWlsZWQgdG8gb3BlbiAnJXMnIiwgb2xkKTsKKworICAgIG5l
dyA9IGxpYnhsX19kb21pZF9oaXN0b3J5X3BhdGgoZ2MsICIubmV3Iik7CisgICAgbmYgPSBmb3Bl
bihuZXcsICJhIik7CisgICAgaWYgKCFuZikgeworICAgICAgICBMT0dFRChFUlJPUiwgZG9taWQs
ICJmYWlsZWQgdG8gb3BlbiAnJXMnIiwgbmV3KTsKKyAgICAgICAgZ290byBvdXQ7CisgICAgfQor
CisgICAgaWYgKGNsb2NrX2dldHRpbWUoQ0xPQ0tfTU9OT1RPTklDLCAmdHMpKSB7CisgICAgICAg
IExPR0VEKEVSUk9SLCBkb21pZCwgImZhaWxlZCB0byBnZXQgdGltZSIpOworICAgICAgICBnb3Rv
IG91dDsKKyAgICB9CisKKyAgICBpZiAob2YpIHsKKyAgICAgICAgdW5zaWduZWQgbG9uZyBzZWM7
CisgICAgICAgIHVuc2lnbmVkIGludCB2YWw7CisKKyAgICAgICAgd2hpbGUgKGxpYnhsX19yZWFk
X3JlY2VudChvZiwgJnNlYywgJnZhbCkpIHsKKyAgICAgICAgICAgIGlmICghbGlieGxfZG9taWRf
dmFsaWRfZ3Vlc3QodmFsKSkKKyAgICAgICAgICAgICAgICBjb250aW51ZTsgLyogSWdub3JlIGlu
dmFsaWQgZW50cmllcyAqLworCisgICAgICAgICAgICBpZiAodHMudHZfc2VjIC0gc2VjID4gdGlt
ZW91dCkKKyAgICAgICAgICAgICAgICBjb250aW51ZTsgLyogSWdub3JlIGV4cGlyZWQgZW50cmll
cyAqLworCisgICAgICAgICAgICBpZiAoIWxpYnhsX193cml0ZV9yZWNlbnQobmYsIHNlYywgdmFs
KSkgeworICAgICAgICAgICAgICAgIExPR0VEKEVSUk9SLCBkb21pZCwgImZhaWxlZCB0byB3cml0
ZSB0byAnJXMnIiwgbmV3KTsKKyAgICAgICAgICAgICAgICBnb3RvIG91dDsKKyAgICAgICAgICAg
IH0KKyAgICAgICAgfQorICAgICAgICBpZiAoZmVycm9yKG9mKSkgeworICAgICAgICAgICAgTE9H
RUQoRVJST1IsIGRvbWlkLCAiZmFpbGVkIHRvIHJlYWQgZnJvbSAnJXMnIiwgb2xkKTsKKyAgICAg
ICAgICAgIGdvdG8gb3V0OworICAgICAgICB9CisgICAgfQorCisgICAgaWYgKCFsaWJ4bF9fd3Jp
dGVfcmVjZW50KG5mLCB0cy50dl9zZWMsIGRvbWlkKSkgeworICAgICAgICBMT0dFRChFUlJPUiwg
ZG9taWQsICJmYWlsZWQgdG8gd3JpdGUgdG8gJyVzJyIsIG5ldyk7CisgICAgICAgIGdvdG8gb3V0
OworICAgIH0KKworICAgIGlmIChmY2xvc2UobmYpID09IEVPRikgeworICAgICAgICBMT0dFRChF
UlJPUiwgZG9taWQsICJmYWlsZWQgdG8gY2xvc2UgJyVzJyIsIG5ldyk7CisgICAgICAgIG5mID0g
TlVMTDsKKyAgICAgICAgZ290byBvdXQ7CisgICAgfQorICAgIG5mID0gTlVMTDsKKworICAgIGlm
IChvZiAmJiBmY2xvc2Uob2YpID09IEVPRikgeworICAgICAgICBMT0dFRChFUlJPUiwgZG9taWQs
ICJmYWlsZWQgdG8gY2xvc2UgJyVzJyIsIG9sZCk7CisgICAgICAgIG9mID0gTlVMTDsKKyAgICAg
ICAgZ290byBvdXQ7CisgICAgfQorICAgIG9mID0gTlVMTDsKKworICAgIGlmIChyZW5hbWUobmV3
LCBvbGQpIDwgMCkgeworICAgICAgICBMT0dFRChFUlJPUiwgZG9taWQsICJmYWlsZWQgdG8gcmVu
YW1lICclcycgLT4gJyVzJyIsIG9sZCwgbmV3KTsKKyAgICAgICAgZ290byBvdXQ7CisgICAgfQor
ICAgIHJjID0gMDsKKworb3V0OgorICAgIGlmIChuZikgZmNsb3NlKG5mKTsKKyAgICBpZiAob2Yp
IGZjbG9zZShvZik7CisgICAgaWYgKGxvY2spIGxpYnhsX191bmxvY2tfZmlsZShsb2NrKTsKKwor
ICAgIHJldHVybiByYzsKK30KKworaW50IGxpYnhsX19pc19kb21pZF9yZWNlbnQobGlieGxfX2dj
ICpnYywgdWludDMyX3QgZG9taWQsIGJvb2wgKnJlY2VudCkKK3sKKyAgICBsb25nIHRpbWVvdXQg
PSBsaWJ4bF9fZ2V0X2RvbWlkX3JldXNlX3RpbWVvdXQoKTsKKyAgICBjb25zdCBjaGFyICpuYW1l
OworICAgIEZJTEUgKmY7CisgICAgc3RydWN0IHRpbWVzcGVjIHRzOworICAgIHVuc2lnbmVkIGxv
bmcgc2VjOworICAgIHVuc2lnbmVkIGludCB2YWw7CisgICAgaW50IHJjID0gRVJST1JfRkFJTDsK
KworICAgIG5hbWUgPSBHQ1NQUklOVEYoIiVzL2RvbWlkLWhpc3RvcnkiLCBsaWJ4bF9fcnVuX2Rp
cl9wYXRoKCkpOworICAgIGYgPSBmb3BlbihuYW1lLCAiciIpOworICAgIGlmICghZikgeworICAg
ICAgICBpZiAoZXJybm8gIT0gRU5PRU5UKQorICAgICAgICAgICAgTE9HRUQoV0FSTiwgZG9taWQs
ICJmYWlsZWQgdG8gb3BlbiAlcyIsIG5hbWUpOworICAgICAgICBlbHNlCisgICAgICAgICAgICBy
YyA9IDA7CisKKyAgICAgICAgZ290byBvdXQ7CisgICAgfQorCisgICAgaWYgKGNsb2NrX2dldHRp
bWUoQ0xPQ0tfTU9OT1RPTklDLCAmdHMpKSB7CisgICAgICAgIExPR0VEKEVSUk9SLCBkb21pZCwg
ImZhaWxlZCB0byBnZXQgdGltZSIpOworICAgICAgICBnb3RvIG91dDsKKyAgICB9CisKKyAgICAq
cmVjZW50ID0gZmFsc2U7CisgICAgd2hpbGUgKGxpYnhsX19yZWFkX3JlY2VudChmLCAmc2VjLCAm
dmFsKSkgeworICAgICAgICBpZiAoIWxpYnhsX2RvbWlkX3ZhbGlkX2d1ZXN0KHZhbCkpCisgICAg
ICAgICAgICBjb250aW51ZTsgLyogSWdub3JlIGludmFsaWQgZW50cmllcyAqLworCisgICAgICAg
IGlmICh2YWwgPT0gZG9taWQgJiYgdHMudHZfc2VjIC0gc2VjIDw9IHRpbWVvdXQpIHsKKyAgICAg
ICAgICAgICpyZWNlbnQgPSB0cnVlOworICAgICAgICAgICAgYnJlYWs7CisgICAgICAgIH0KKyAg
ICB9CisgICAgaWYgKGZlcnJvcihmKSkgeworICAgICAgICBMT0dFRChFUlJPUiwgZG9taWQsICJm
YWlsZWQgdG8gcmVhZCBmcm9tICclcyciLCBuYW1lKTsKKyAgICAgICAgZ290byBvdXQ7CisgICAg
fQorCisgICAgaWYgKGZjbG9zZShmKSA9PSBFT0YpIHsKKyAgICAgICAgTE9HRUQoRVJST1IsIGRv
bWlkLCAiZmFpbGVkIHRvIGNsb3NlICclcyciLCBuYW1lKTsKKyAgICAgICAgZiA9IE5VTEw7Cisg
ICAgICAgIGdvdG8gb3V0OworICAgIH0KKyAgICBmID0gTlVMTDsKKyAgICByYyA9IDA7CisKK291
dDoKKyAgICBpZiAoZikgZmNsb3NlKGYpOworICAgIHJldHVybiByYzsKK30KKwogc3RhdGljIHZv
aWQgZGV2aWNlc19kZXN0cm95X2NiKGxpYnhsX19lZ2MgKmVnYywKICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBsaWJ4bF9fZGV2aWNlc19yZW1vdmVfc3RhdGUgKmRycywKICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBpbnQgcmMpCkBAIC0xMzMxLDYgKzE1MzMsOCBAQCBzdGF0
aWMgdm9pZCBkZXZpY2VzX2Rlc3Ryb3lfY2IobGlieGxfX2VnYyAqZWdjLAogICAgICAgICBpZiAo
IWN0eC0+eGNoKSBnb3RvIGJhZGNoaWxkOwogCiAgICAgICAgIGlmICghZGlzLT5zb2Z0X3Jlc2V0
KSB7CisgICAgICAgICAgICByYyA9IGxpYnhsX19tYXJrX2RvbWlkX3JlY2VudChnYywgZG9taWQp
OworICAgICAgICAgICAgaWYgKHJjKSBnb3RvIGJhZGNoaWxkOwogICAgICAgICAgICAgcmMgPSB4
Y19kb21haW5fZGVzdHJveShjdHgtPnhjaCwgZG9taWQpOwogICAgICAgICB9IGVsc2UgewogICAg
ICAgICAgICAgcmMgPSB4Y19kb21haW5fcGF1c2UoY3R4LT54Y2gsIGRvbWlkKTsKZGlmZiAtLWdp
dCBhL3Rvb2xzL2xpYnhsL2xpYnhsX2ludGVybmFsLmMgYi90b29scy9saWJ4bC9saWJ4bF9pbnRl
cm5hbC5jCmluZGV4IDIxMTIzNmRjOTkuLmJiZDRjNmNiYTkgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2xp
YnhsL2xpYnhsX2ludGVybmFsLmMKKysrIGIvdG9vbHMvbGlieGwvbGlieGxfaW50ZXJuYWwuYwpA
QCAtNTA0LDYgKzUwNCwxNiBAQCBsaWJ4bF9fZmxvY2sgKmxpYnhsX19sb2NrX2RvbWFpbl91c2Vy
ZGF0YShsaWJ4bF9fZ2MgKmdjLCB1aW50MzJfdCBkb21pZCkKICAgICByZXR1cm4gbG9jazsKIH0K
IAorbGlieGxfX2Zsb2NrICpsaWJ4bF9fbG9ja19kb21pZF9oaXN0b3J5KGxpYnhsX19nYyAqZ2Mp
Cit7CisgICAgY29uc3QgY2hhciAqbG9ja2ZpbGU7CisKKyAgICBsb2NrZmlsZSA9IGxpYnhsX19k
b21pZF9oaXN0b3J5X3BhdGgoZ2MsICIubG9jayIpOworICAgIGlmICghbG9ja2ZpbGUpIHJldHVy
biBOVUxMOworCisgICAgcmV0dXJuIGxpYnhsX19sb2NrX2ZpbGUoZ2MsIGxvY2tmaWxlKTsKK30K
KwogaW50IGxpYnhsX19nZXRfZG9tYWluX2NvbmZpZ3VyYXRpb24obGlieGxfX2djICpnYywgdWlu
dDMyX3QgZG9taWQsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBsaWJ4bF9k
b21haW5fY29uZmlnICpkX2NvbmZpZykKIHsKZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnhsL2xpYnhs
X2ludGVybmFsLmggYi90b29scy9saWJ4bC9saWJ4bF9pbnRlcm5hbC5oCmluZGV4IGRkM2MwOGJj
MTQuLjM5ZGUyZDU5MTAgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2xpYnhsL2xpYnhsX2ludGVybmFsLmgK
KysrIGIvdG9vbHMvbGlieGwvbGlieGxfaW50ZXJuYWwuaApAQCAtNDI2MCw2ICs0MjYwLDggQEAg
X2hpZGRlbiB2b2lkIGxpYnhsX19yZW11c190ZWFyZG93bihsaWJ4bF9fZWdjICplZ2MsCiBfaGlk
ZGVuIHZvaWQgbGlieGxfX3JlbXVzX3Jlc3RvcmVfc2V0dXAobGlieGxfX2VnYyAqZWdjLAogICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGxpYnhsX19kb21haW5fY3JlYXRl
X3N0YXRlICpkY3MpOwogCitfaGlkZGVuIGNoYXIgKmxpYnhsX19kb21pZF9oaXN0b3J5X3BhdGgo
bGlieGxfX2djICpnYywKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBj
b25zdCBjaGFyICpzdWZmaXgpOwogCiAvKgogICogQ29udmVuaWVuY2UgbWFjcm9zLgpAQCAtNDY1
OCw2ICs0NjYwLDcgQEAgbGlieGxfX2Zsb2NrICpsaWJ4bF9fbG9ja19maWxlKGxpYnhsX19nYyAq
Z2MsIGNvbnN0IGNoYXIgKmZpbGVuYW1lKTsKIHZvaWQgbGlieGxfX3VubG9ja19maWxlKGxpYnhs
X19mbG9jayAqbG9jayk7CiAKIGxpYnhsX19mbG9jayAqbGlieGxfX2xvY2tfZG9tYWluX3VzZXJk
YXRhKGxpYnhsX19nYyAqZ2MsIHVpbnQzMl90IGRvbWlkKTsKK2xpYnhsX19mbG9jayAqbGlieGxf
X2xvY2tfZG9taWRfaGlzdG9yeShsaWJ4bF9fZ2MgKmdjKTsKIAogLyoKICAqIFJldHJpZXZlIC8g
c3RvcmUgZG9tYWluIGNvbmZpZ3VyYXRpb24gZnJvbSAvIHRvIGxpYnhsIHByaXZhdGUKQEAgLTQ3
OTYsNiArNDc5OSwxNyBAQCBfaGlkZGVuIGludCBsaWJ4bF9fZG9tYWluX3B2Y29udHJvbChsaWJ4
bF9fZWdjICplZ2MsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBsaWJ4bF9f
eHN3YWl0X3N0YXRlICpwdmNvbnRyb2wsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBkb21pZF90IGRvbWlkLCBjb25zdCBjaGFyICpjbWQpOwogCisvKgorICogTWF4aW11bSBu
dW1iZXIgb2Ygc2Vjb25kcyBhZnRlciBkZXNjdHJ1Y3Rpb24gdGhlbiBhIGRvbWlkIHJlbWFpbnMK
KyAqICdyZWNlbnQnLiBSZWNlbnQgZG9taWRzIGFyZSBub3QgYWxsb3dlZCB0byBiZSByZS11c2Vk
LiBUaGlzIGNhbiBiZQorICogb3ZlcmlkZGVuLCBmb3IgZGVidWdnaW5nIHB1cnBvc2VzLCBieSB0
aGUgZW52aXJvbm1lbnQgdmFyaWFibGUgb2YgdGhlCisgKiBzYW1lIG5hbWUuCisgKi8KKyNkZWZp
bmUgTElCWExfRE9NSURfUkVVU0VfVElNRU9VVCA2MAorCisvKiBDaGVjayB3aGV0aGVyIGEgZG9t
aWQgaXMgcmVjZW50ICovCitpbnQgbGlieGxfX2lzX2RvbWlkX3JlY2VudChsaWJ4bF9fZ2MgKmdj
LCB1aW50MzJfdCBkb21pZCwgYm9vbCAqcmVjZW50KTsKKwogI2VuZGlmCiAKIC8qCi0tIAoyLjIw
LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
