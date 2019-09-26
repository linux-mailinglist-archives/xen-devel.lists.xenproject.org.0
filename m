Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 826EDBEED8
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 11:51:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDQOh-0005pF-MK; Thu, 26 Sep 2019 09:49:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ph5t=XV=amazon.com=prvs=165c3e20f=hongyax@srs-us1.protection.inumbo.net>)
 id 1iDQOf-0005lY-4d
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 09:49:13 +0000
X-Inumbo-ID: e14891cc-e042-11e9-bf31-bc764e2007e4
Received: from smtp-fw-6002.amazon.com (unknown [52.95.49.90])
 by localhost (Halon) with ESMTPS
 id e14891cc-e042-11e9-bf31-bc764e2007e4;
 Thu, 26 Sep 2019 09:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1569491346; x=1601027346;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=s4mefAb4N0ny9YTycU16/nUjrF+aqb1Mt3BdhB6r1z8=;
 b=WcOdG9xQamKv8wIdB9Z1hRPoMnth/HFK8f1H8VAf4LMJ3gWkO/J19E9L
 9dZAJu2Xs8xD91VGnOhnNBSfG8+73+2x2pyAUc4NkU5QpmpjXC9oiuTry
 L85Ruigkt+N5QZiX2az/aUhO5BI61J2D5VprPg341UQUKNa26wXADMWV9 g=;
X-IronPort-AV: E=Sophos;i="5.64,551,1559520000"; d="scan'208";a="423750636"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1a-e34f1ddc.us-east-1.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP;
 26 Sep 2019 09:49:06 +0000
Received: from EX13MTAUWA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1a-e34f1ddc.us-east-1.amazon.com (Postfix) with ESMTPS
 id 3A17FA2685; Thu, 26 Sep 2019 09:49:04 +0000 (UTC)
Received: from EX13D19UWA003.ant.amazon.com (10.43.160.170) by
 EX13MTAUWA001.ant.amazon.com (10.43.160.58) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 26 Sep 2019 09:48:39 +0000
Received: from EX13MTAUWA001.ant.amazon.com (10.43.160.58) by
 EX13D19UWA003.ant.amazon.com (10.43.160.170) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 26 Sep 2019 09:48:38 +0000
Received: from u9d785c4ba99158.ant.amazon.com (10.125.106.58) by
 mail-relay.amazon.com (10.43.160.118) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Thu, 26 Sep 2019 09:48:37 +0000
From: <hongyax@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 26 Sep 2019 10:46:20 +0100
Message-ID: <4401db4cb6eafd307444ecbc6340c6e39c446418.1569489002.git.hongyax@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1569489002.git.hongyax@amazon.com>
References: <cover.1569489002.git.hongyax@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [RFC PATCH 57/84] x86: add Persistent Map (PMAP)
 infrastructure
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

RnJvbTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KClRoZSBiYXNpYyBpZGVhIGlzIGxp
a2UgUGVyc2lzdGVudCBLZXJuZWwgTWFwIChQS01BUCkgaW4gbGludXguIFdlCnByZS1wb3B1bGF0
ZSBhbGwgdGhlIHJlbGV2YW50IHBhZ2UgdGFibGVzIGJlZm9yZSBzeXN0ZW0gaXMgZnVsbHkgc2V0
CnVwLgoKSXQgaXMgbmVlZGVkIHRvIGJvb3RzdHJhcCBtYXAgZG9tYWluIHBhZ2UgaW5mcmFzdHJ1
Y3R1cmUgLS0gd2UgbmVlZApzb21lIHdheSB0byBtYXAgcGFnZXMgdG8gc2V0IHVwIHBlci1jcHUg
cmVnaW9uIHdpdGhvdXQgYSBkaXJlY3QgbWFwLgoKSW4gb3JkZXIgdG8ga2VlcCB0aGUgbnVtYmVy
IG9mIGVudHJpZXMgbWluaW1hbCwgdGhpcyBpbmZyYXN0cnVjdHVyZQpjYW4gb25seSBiZSB1c2Vk
IGJ5IG9uZSBDUFUgYXQgYSB0aW1lLgoKU2lnbmVkLW9mZi1ieTogV2VpIExpdSA8d2VpLmxpdTJA
Y2l0cml4LmNvbT4KLS0tCiB4ZW4vYXJjaC94ODYvTWFrZWZpbGUgICAgICAgIHwgIDEgKwogeGVu
L2FyY2gveDg2L3BtYXAuYyAgICAgICAgICB8IDgyICsrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKwogeGVuL2luY2x1ZGUvYXNtLXg4Ni9maXhtYXAuaCB8ICAzICsrCiB4ZW4vaW5j
bHVkZS9hc20teDg2L3BtYXAuaCAgIHwgMTIgKysrKysrCiA0IGZpbGVzIGNoYW5nZWQsIDk4IGlu
c2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCB4ZW4vYXJjaC94ODYvcG1hcC5jCiBjcmVh
dGUgbW9kZSAxMDA2NDQgeGVuL2luY2x1ZGUvYXNtLXg4Ni9wbWFwLmgKCmRpZmYgLS1naXQgYS94
ZW4vYXJjaC94ODYvTWFrZWZpbGUgYi94ZW4vYXJjaC94ODYvTWFrZWZpbGUKaW5kZXggMjQ0M2Zk
MmNjNS4uNzUwODIxOTY4NiAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L01ha2VmaWxlCisrKyBi
L3hlbi9hcmNoL3g4Ni9NYWtlZmlsZQpAQCAtNTUsNiArNTUsNyBAQCBvYmoteSArPSBwY2kubwog
b2JqLXkgKz0gcGVyY3B1Lm8KIG9iai15ICs9IHBoeXNkZXYubyB4ODZfNjQvcGh5c2Rldi5vCiBv
YmoteSArPSBwbGF0Zm9ybV9oeXBlcmNhbGwubyB4ODZfNjQvcGxhdGZvcm1faHlwZXJjYWxsLm8K
K29iai15ICs9IHBtYXAubwogb2JqLXkgKz0gcHNyLm8KIG9iai15ICs9IHNldHVwLm8KIG9iai15
ICs9IHNodXRkb3duLm8KZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9wbWFwLmMgYi94ZW4vYXJj
aC94ODYvcG1hcC5jCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLjRhZTE2
YjAyMTIKLS0tIC9kZXYvbnVsbAorKysgYi94ZW4vYXJjaC94ODYvcG1hcC5jCkBAIC0wLDAgKzEs
ODIgQEAKKyNpbmNsdWRlIDx4ZW4vaW5pdC5oPgorI2luY2x1ZGUgPHhlbi9tbS5oPgorI2luY2x1
ZGUgPHhlbi9zcGlubG9jay5oPgorCisjaW5jbHVkZSA8YXNtL2JpdG9wcy5oPgorI2luY2x1ZGUg
PGFzbS9maXhtYXAuaD4KKworLyoKKyAqIFNpbXBsZSBtYXBwaW5nIGluZnJhc3RydWN0dXJlIHRv
IG1hcCAvIHVubWFwIHBhZ2VzIGluIGZpeGVkIG1hcC4KKyAqIFRoaXMgaXMgdXNlZCB0byBzZXQg
dXAgcGVyY3B1IHBhZ2UgdGFibGUgZm9yIG1hcGNhY2hlLCB3aGljaCBpcworICogdXNlZCBieSBt
YXAgZG9tYWluIHBhZ2UgaW5mcmFzdHJ1Y3R1cmUuCisgKgorICogVGhlcmUgaXMgYSByZXN0cmlj
dGlvbiB0aGF0IG9ubHkgb25lIENQVSBjYW4gdXNlIHRoaXMKKyAqIGluZnJhc3RydWN0dXJlIGF0
IGEgdGltZS4gU28gdGhpcyBpbmZyYXN0cnVjdHVyZSBfc2hvdWxkIG5vdF8gYmUKKyAqIHVzZWQg
YW55d2hlcmUgZWxzZSBvdGhlciB0aGFuIHRoZSBzdGF0ZWQgcHVycG9zZSBhYm92ZS4KKyAqLwor
CitzdGF0aWMgREVGSU5FX1NQSU5MT0NLKGxvY2spOworLyogQml0bWFwIHRvIHRyYWNrIHdoaWNo
IHNsb3QgaXMgdXNlZCAqLworc3RhdGljIHVuc2lnbmVkIGxvbmcgaW51c2U7CisKK3ZvaWQgcG1h
cF9sb2NrKHZvaWQpCit7CisgICAgc3Bpbl9sb2NrKCZsb2NrKTsKK30KKwordm9pZCBwbWFwX3Vu
bG9jayh2b2lkKQoreworICAgIHNwaW5fdW5sb2NrKCZsb2NrKTsKK30KKwordm9pZCAqcG1hcF9t
YXAoc3RydWN0IHBhZ2VfaW5mbyAqcGFnZSkKK3sKKyAgICB1bnNpZ25lZCBpbnQgaWR4OworICAg
IHZvaWQgKmxpbmVhciA9IE5VTEw7CisgICAgZW51bSBmaXhlZF9hZGRyZXNzZXMgc2xvdDsKKwor
ICAgIEFTU0VSVCghaW5faXJxKCkpOworICAgIEFTU0VSVChzcGluX2lzX2xvY2tlZCgmbG9jaykp
OworCisgICAgaWR4ID0gZmluZF9maXJzdF96ZXJvX2JpdCgmaW51c2UsIE5VTV9GSVhfUE1BUCk7
CisgICAgaWYgKCBpZHggPT0gTlVNX0ZJWF9QTUFQICkKKyAgICAgICAgcGFuaWMoIk91dCBvZiBQ
TUFQIHNsb3RzXG4iKTsKKworICAgIF9fc2V0X2JpdChpZHgsICZpbnVzZSk7CisKKyAgICBzbG90
ID0gaWR4ICsgRklYX1BNQVBfQkVHSU47CisgICAgQVNTRVJUKHNsb3QgPj0gRklYX1BNQVBfQkVH
SU4gJiYgc2xvdCA8PSBGSVhfUE1BUF9FTkQpOworCisgICAgc2V0X2ZpeG1hcChzbG90LCBtZm5f
eChwYWdlX3RvX21mbihwYWdlKSkpOworICAgIGxpbmVhciA9ICh2b2lkICopX19maXhfdG9fdmly
dChzbG90KTsKKworICAgIHJldHVybiBsaW5lYXI7Cit9CisKK3ZvaWQgcG1hcF91bm1hcCh2b2lk
ICpwKQoreworICAgIHVuc2lnbmVkIGludCBpZHg7CisgICAgZW51bSBmaXhlZF9hZGRyZXNzZXMg
c2xvdCA9IF9fdmlydF90b19maXgoKHVuc2lnbmVkIGxvbmcpcCk7CisKKyAgICBBU1NFUlQoIWlu
X2lycSgpKTsKKyAgICBBU1NFUlQoc2xvdCA+PSBGSVhfUE1BUF9CRUdJTiAmJiBzbG90IDw9IEZJ
WF9QTUFQX0VORCk7CisgICAgQVNTRVJUKHNwaW5faXNfbG9ja2VkKCZsb2NrKSk7CisKKyAgICBp
ZHggPSBzbG90IC0gRklYX1BNQVBfQkVHSU47CisgICAgX19jbGVhcl9iaXQoaWR4LCAmaW51c2Up
OworICAgIGNsZWFyX2ZpeG1hcChzbG90KTsKK30KKworc3RhdGljIHZvaWQgX19tYXliZV91bnVz
ZWQgYnVpbGRfYXNzZXJ0aW9ucyh2b2lkKQoreworICAgIEJVSUxEX0JVR19PTihzaXplb2YoaW51
c2UpICogQklUU19QRVJfTE9ORyA8IE5VTV9GSVhfUE1BUCk7Cit9CisKKy8qCisgKiBMb2NhbCB2
YXJpYWJsZXM6CisgKiBtb2RlOiBDCisgKiBjLWZpbGUtc3R5bGU6ICJCU0QiCisgKiBjLWJhc2lj
LW9mZnNldDogNAorICogaW5kZW50LXRhYnMtbW9kZTogbmlsCisgKiBFbmQ6CisgKi8KZGlmZiAt
LWdpdCBhL3hlbi9pbmNsdWRlL2FzbS14ODYvZml4bWFwLmggYi94ZW4vaW5jbHVkZS9hc20teDg2
L2ZpeG1hcC5oCmluZGV4IDlmYjJmNDc5NDYuLjg1ODg1Zjg5NTAgMTAwNjQ0Ci0tLSBhL3hlbi9p
bmNsdWRlL2FzbS14ODYvZml4bWFwLmgKKysrIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9maXhtYXAu
aApAQCAtMjMsNiArMjMsNyBAQAogI2luY2x1ZGUgPHhlbi9rZXhlYy5oPgogI2luY2x1ZGUgPGFz
bS9hcGljZGVmLmg+CiAjaW5jbHVkZSA8YXNtL21zaS5oPgorI2luY2x1ZGUgPGFzbS9wbWFwLmg+
CiAjaW5jbHVkZSA8YWNwaS9hcGVpLmg+CiAKIC8qCkBAIC00OCw2ICs0OSw4IEBAIGVudW0gZml4
ZWRfYWRkcmVzc2VzIHsKICAgICBGSVhfWEVOX1NIQVJFRF9JTkZPLAogI2VuZGlmIC8qIENPTkZJ
R19YRU5fR1VFU1QgKi8KICAgICAvKiBFdmVyeXRoaW5nIGVsc2Ugc2hvdWxkIGdvIGZ1cnRoZXIg
ZG93bi4gKi8KKyAgICBGSVhfUE1BUF9CRUdJTiwKKyAgICBGSVhfUE1BUF9FTkQgPSBGSVhfUE1B
UF9CRUdJTiArIE5VTV9GSVhfUE1BUCAtIDEsCiAgICAgRklYX0FQSUNfQkFTRSwKICAgICBGSVhf
SU9fQVBJQ19CQVNFXzAsCiAgICAgRklYX0lPX0FQSUNfQkFTRV9FTkQgPSBGSVhfSU9fQVBJQ19C
QVNFXzAgKyBNQVhfSU9fQVBJQ1MtMSwKZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL2FzbS14ODYv
cG1hcC5oIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9wbWFwLmgKbmV3IGZpbGUgbW9kZSAxMDA2NDQK
aW5kZXggMDAwMDAwMDAwMC4uNDJjZDRjNzc5MwotLS0gL2Rldi9udWxsCisrKyBiL3hlbi9pbmNs
dWRlL2FzbS14ODYvcG1hcC5oCkBAIC0wLDAgKzEsMTIgQEAKKyNpZm5kZWYgX19YODZfUE1BUF9I
X18KKyNkZWZpbmUgX19YODZfUE1BUF9IX18KKworLyogTGFyZ2UgZW5vdWdoIGZvciBtYXBwaW5n
IDUgbGV2ZWxzIG9mIHBhZ2UgdGFibGVzICovCisjZGVmaW5lIE5VTV9GSVhfUE1BUCA1CisKK3Zv
aWQgcG1hcF9sb2NrKHZvaWQpOwordm9pZCBwbWFwX3VubG9jayh2b2lkKTsKK3ZvaWQgKnBtYXBf
bWFwKHN0cnVjdCBwYWdlX2luZm8gKnBhZ2UpOwordm9pZCBwbWFwX3VubWFwKHZvaWQgKnApOwor
CisjZW5kaWYJLyogX19YODZfUE1BUF9IX18gKi8KLS0gCjIuMTcuMQoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
