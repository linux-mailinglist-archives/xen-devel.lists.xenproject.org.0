Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6998C1408B2
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jan 2020 12:13:48 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1isPWn-0007vj-HQ; Fri, 17 Jan 2020 11:11:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Cv4k=3G=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1isPWm-0007v0-2X
 for xen-devel@lists.xenproject.org; Fri, 17 Jan 2020 11:11:00 +0000
X-Inumbo-ID: 07a1dba0-391a-11ea-b4d2-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 07a1dba0-391a-11ea-b4d2-12813bfff9fa;
 Fri, 17 Jan 2020 11:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579259456;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FhooL5xAplE5fDlGtrpx8Y+IwHbT9MVN3wLm0Emh++M=;
 b=TT5NBwrROT1gK+F3L6EozHuQgMY2iOaNoOmpk8qizp+DyXz6cwcCbcM8
 g+xxBBNa58/VU66aO/TLc3hPlViGUqUnLSFP0+jFg/4yu2t+coSG4MDbh
 Vtde8X1KzS3sv5I1dLIyia2gaCwyndJPBODVSJvO2jJ4Vc1HA95lbD7jz A=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: D6nNOFmv4egWRSuxL/+krWAaQz1d9vkZSEiDOG1lpoiBfhY9kpLKz1bNHRsY9wGDo5HpQSkr4n
 DXg8Z0VPMnraGETxYNyvsWLj0Cm+pbNptTV23eTr8KUVGnzwH/z7c6jqtoe8yjf2nmUpW+B3JR
 0M++j92CKUpz/hRGFobXUduEbWl8DdAw8rMD0+RnCqZ2z+BDSEWWs/F9osgDcz9IDW+TM7e9Nc
 tzDG13T6iRQAlhNAOqNqFwYdcnxaa2E8fAnTv32+uWytLgj/NndJFSAjDQx5C8EV9Z0OZkeBpR
 c6o=
X-SBRS: 2.7
X-MesageID: 11080930
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,330,1574139600"; d="scan'208";a="11080930"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 17 Jan 2020 10:53:57 +0000
Message-ID: <20200117105358.607910-12-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200117105358.607910-1-anthony.perard@citrix.com>
References: <20200117105358.607910-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [XEN PATCH v2 11/12] xen/build: introduce ccflags-y and
 CFLAGS_$@
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2UgYXJlIGdvaW5nIHRvIHdhbnQgJChDRkxBR1MpIHRvIGJlIHN0YXRpYyBhbmQgbmV2ZXIgY2hh
bmdlIGR1cmluZwp0aGUgYnVpbGQsIHNvIGludHJvZHVjZSBuZXcgdmFyaWFibGVzIHRoYXQgY2Fu
IGJlIHVzZSB0byBjaGFuZ2UgdGhlCmZsYWdzIG9mIGEgc2luZ2xlIHRhcmdldCBvciBvZiBhIHdo
b2xlIGRpcmVjdG9yeS4KClRob3NlIHR3byB2YXJpYWJsZXMgYXJlIHRha2VuIGZyb20gS2J1aWxk
LCBpbiBMaW51eCB2NS40LgoKU2lnbmVkLW9mZi1ieTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnku
cGVyYXJkQGNpdHJpeC5jb20+Ci0tLQogeGVuL1J1bGVzLm1rICAgICAgICAgICAgICAgfCA3ICsr
KysrKy0KIHhlbi9hcmNoL2FybS9lZmkvTWFrZWZpbGUgIHwgMiArLQogeGVuL2FyY2gveDg2L01h
a2VmaWxlICAgICAgfCA2ICsrKy0tLQogeGVuL2FyY2gveDg2L2VmaS9NYWtlZmlsZSAgfCAyICst
CiB4ZW4vY29tbW9uL2xpYmVsZi9NYWtlZmlsZSB8IDIgKy0KIHhlbi9jb21tb24vbGliZmR0L01h
a2VmaWxlIHwgMiArLQogeGVuL3hzbS9mbGFzay9NYWtlZmlsZSAgICAgfCAyICstCiB4ZW4veHNt
L2ZsYXNrL3NzL01ha2VmaWxlICB8IDIgKy0KIDggZmlsZXMgY2hhbmdlZCwgMTUgaW5zZXJ0aW9u
cygrKSwgMTAgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL1J1bGVzLm1rIGIveGVuL1J1
bGVzLm1rCmluZGV4IGM5OGQ1MzcyZjNkYi4uZjAxMTFmMmJjMWI0IDEwMDY0NAotLS0gYS94ZW4v
UnVsZXMubWsKKysrIGIveGVuL1J1bGVzLm1rCkBAIC0zOSw2ICszOSw3IEBAIEFMTF9PQkpTLSQo
Q09ORklHX0NSWVBUTykgICArPSAkKEJBU0VESVIpL2NyeXB0by9idWlsdF9pbi5vCiAKICMgSW5p
dGlhbGlzZSBzb21lIHZhcmlhYmxlcwogQ0ZMQUdTX1VCU0FOIDo9CitjY2ZsYWdzLXkgOj0KIAog
aWZlcSAoJChDT05GSUdfREVCVUcpLHkpCiBDRkxBR1MgKz0gLU8xCkBAIC0xMzcsOSArMTM4LDEz
IEBAIGVuZGlmCiAjIEFsd2F5cyBidWlsZCBvYmotYmluIGZpbGVzIGFzIGJpbmFyeSBldmVuIGlm
IHRoZXkgY29tZSBmcm9tIEMgc291cmNlLiAKICQob2JqLWJpbi15KTogQ0ZMQUdTIDo9ICQoZmls
dGVyLW91dCAtZmx0bywkKENGTEFHUykpCiAKKyMgdGFyZ2V0IHdpdGggaXRzIHN1ZmZpeCBzdHJp
cHBlZAordGFyZ2V0LXN0ZW0gPSAkKGJhc2VuYW1lICRAKQorCiBjX2ZsYWdzID0gLU1NRCAtTUYg
JChARCkvLiQoQEYpLmQgXAogICAgICAgICAgICQoQ0ZMQUdTKSBcCi0gICAgICAgICAgJy1EX19P
QkpFQ1RfRklMRV9fPSIkQCInCisgICAgICAgICAgJy1EX19PQkpFQ1RfRklMRV9fPSIkQCInIFwK
KyAgICAgICAgICAkKGNjZmxhZ3MteSkgJChDRkxBR1NfJCh0YXJnZXQtc3RlbSkubykKIAogYV9m
bGFncyA9IC1NTUQgLU1GICQoQEQpLy4kKEBGKS5kIFwKICAgICAgICAgICAkKEFGTEFHUykKZGlm
ZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9lZmkvTWFrZWZpbGUgYi94ZW4vYXJjaC9hcm0vZWZpL01h
a2VmaWxlCmluZGV4IGQzNGM5MTY4OTE0YS4uZTRhYWJhM2UwNzRiIDEwMDY0NAotLS0gYS94ZW4v
YXJjaC9hcm0vZWZpL01ha2VmaWxlCisrKyBiL3hlbi9hcmNoL2FybS9lZmkvTWFrZWZpbGUKQEAg
LTEsNCArMSw0IEBACi1DRkxBR1MgKz0gLWZzaG9ydC13Y2hhcgorY2NmbGFncy15ICs9IC1mc2hv
cnQtd2NoYXIKIAogb2JqLXkgKz0gIGJvb3QuaW5pdC5vIHJ1bnRpbWUubwogb2JqLSQoQ09ORklH
X0FDUEkpICs9ICBlZmktZG9tMC5pbml0Lm8KZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9NYWtl
ZmlsZSBiL3hlbi9hcmNoL3g4Ni9NYWtlZmlsZQppbmRleCA0NzJlM2ZhZGI3MTkuLmFjZjRjMTQ1
Yzg5NiAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L01ha2VmaWxlCisrKyBiL3hlbi9hcmNoL3g4
Ni9NYWtlZmlsZQpAQCAtMTc0LDE0ICsxNzQsMTQgQEAgRUZJX0xERkxBR1MgKz0gLS1tYWpvci1z
dWJzeXN0ZW0tdmVyc2lvbj0yIC0tbWlub3Itc3Vic3lzdGVtLXZlcnNpb249MAogZXhwb3J0IFhF
Tl9CVUlMRF9FRkkgOj0gJChzaGVsbCAkKENDKSAkKGZpbHRlci1vdXQgJChDRkxBR1MteSkgLiUu
ZCwkKENGTEFHUykpIC1jIGVmaS9jaGVjay5jIC1vIGVmaS9jaGVjay5vIDI+L2Rldi9udWxsICYm
IGVjaG8geSkKICMgQ2hlY2sgaWYgdGhlIGxpbmtlciBzdXBwb3J0cyBQRS4KIFhFTl9CVUlMRF9Q
RSA6PSAkKGlmICQoWEVOX0JVSUxEX0VGSSksJChzaGVsbCAkKExEKSAtbWkzODZwZXAgLS1zdWJz
eXN0ZW09MTAgLW8gZWZpL2NoZWNrLmVmaSBlZmkvY2hlY2subyAyPi9kZXYvbnVsbCAmJiBlY2hv
IHkpKQotQ0ZMQUdTLSQoWEVOX0JVSUxEX0VGSSkgKz0gLURYRU5fQlVJTERfRUZJCitjY2ZsYWdz
LSQoWEVOX0JVSUxEX0VGSSkgKz0gLURYRU5fQlVJTERfRUZJCiAKICQoVEFSR0VUKS5lZmk6IFZJ
UlRfQkFTRSA9IDB4JChzaGVsbCAkKE5NKSBlZmkvcmVsb2NzLWR1bW15Lm8gfCBzZWQgLW4gJ3Ms
IEEgVklSVF9TVEFSVCQkLCxwJykKICQoVEFSR0VUKS5lZmk6IEFMVF9CQVNFID0gMHgkKHNoZWxs
ICQoTk0pIGVmaS9yZWxvY3MtZHVtbXkubyB8IHNlZCAtbiAncywgQSBBTFRfU1RBUlQkJCwscCcp
CiAKIGlmbmVxICgkKGJ1aWxkX2lkX2xpbmtlciksKQogaWZlcSAoJChjYWxsIGxkLXZlci1idWls
ZC1pZCwkKExEKSAkKGZpbHRlciAtbSUsJChFRklfTERGTEFHUykpKSx5KQotQ0ZMQUdTICs9IC1E
QlVJTERfSURfRUZJCitjY2ZsYWdzLXkgKz0gLURCVUlMRF9JRF9FRkkKIEVGSV9MREZMQUdTICs9
ICQoYnVpbGRfaWRfbGlua2VyKQogbm90ZV9maWxlIDo9IGVmaS9idWlsZGlkLm8KICMgTkI6IHRo
aXMgbXVzdCBiZSB0aGUgbGFzdCBpbnB1dCBpbiB0aGUgbGlua2VyIGNhbGwsIGJlY2F1c2UgaW5w
dXRzIGZvbGxvd2luZwpAQCAtMjI3LDcgKzIyNyw3IEBAIGVmaS9ib290LmluaXQubyBlZmkvcnVu
dGltZS5vIGVmaS9jb21wYXQubyBlZmkvYnVpbGRpZC5vIGVmaS9yZWxvY3MtZHVtbXkubzogOwog
YXNtLW9mZnNldHMuczogJChUQVJHRVRfU1VCQVJDSCkvYXNtLW9mZnNldHMuYyAkKEJBU0VESVIp
L2luY2x1ZGUvYXNtLXg4Ni9hc20tbWFjcm9zLmgKIAkkKENDKSAkKGZpbHRlci1vdXQgLVdhJChj
b21tYSklIC1mbHRvLCQoY19mbGFncykpIC1TIC1vICRAICQ8CiAKLWFzbS1tYWNyb3MuaTogQ0ZM
QUdTICs9IC1EX19BU1NFTUJMWV9fIC1QCitDRkxBR1NfYXNtLW1hY3Jvcy5vICs9IC1EX19BU1NF
TUJMWV9fIC1QCiAKICQoQkFTRURJUikvaW5jbHVkZS9hc20teDg2L2FzbS1tYWNyb3MuaDogYXNt
LW1hY3Jvcy5pIE1ha2VmaWxlCiAJZWNobyAnI2lmIDAnID4kQC5uZXcKZGlmZiAtLWdpdCBhL3hl
bi9hcmNoL3g4Ni9lZmkvTWFrZWZpbGUgYi94ZW4vYXJjaC94ODYvZWZpL01ha2VmaWxlCmluZGV4
IDRiYzBhMTk2ZTljYS4uMmNiYjNkZTNhOGFiIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvZWZp
L01ha2VmaWxlCisrKyBiL3hlbi9hcmNoL3g4Ni9lZmkvTWFrZWZpbGUKQEAgLTEsNCArMSw0IEBA
Ci1DRkxBR1MgKz0gLWZzaG9ydC13Y2hhcgorY2NmbGFncy15ICs9IC1mc2hvcnQtd2NoYXIKIAog
JS5vOiAlLmloZXgKIAkkKE9CSkNPUFkpIC1JIGloZXggLU8gYmluYXJ5ICQ8ICRACmRpZmYgLS1n
aXQgYS94ZW4vY29tbW9uL2xpYmVsZi9NYWtlZmlsZSBiL3hlbi9jb21tb24vbGliZWxmL01ha2Vm
aWxlCmluZGV4IDNkOWUzOGYyN2U2NS4uOWE0MzNmMDFmYmQ0IDEwMDY0NAotLS0gYS94ZW4vY29t
bW9uL2xpYmVsZi9NYWtlZmlsZQorKysgYi94ZW4vY29tbW9uL2xpYmVsZi9NYWtlZmlsZQpAQCAt
Myw3ICszLDcgQEAgbm9jb3YteSArPSBsaWJlbGYubwogCiBTRUNUSU9OUyA6PSB0ZXh0IGRhdGEg
JChTUEVDSUFMX0RBVEFfU0VDVElPTlMpCiAKLUNGTEFHUyArPSAtV25vLXBvaW50ZXItc2lnbgor
Y2NmbGFncy15ICs9IC1Xbm8tcG9pbnRlci1zaWduCiAKIGxpYmVsZi5vOiBsaWJlbGYtdGVtcC5v
IE1ha2VmaWxlCiAJJChPQkpDT1BZKSAkKGZvcmVhY2ggcywkKFNFQ1RJT05TKSwtLXJlbmFtZS1z
ZWN0aW9uIC4kKHMpPS5pbml0LiQocykpICQ8ICRACmRpZmYgLS1naXQgYS94ZW4vY29tbW9uL2xp
YmZkdC9NYWtlZmlsZSBiL3hlbi9jb21tb24vbGliZmR0L01ha2VmaWxlCmluZGV4IGMwNzViYmY1
NDYyYS4uOWVhNWM2OTZkNTJhIDEwMDY0NAotLS0gYS94ZW4vY29tbW9uL2xpYmZkdC9NYWtlZmls
ZQorKysgYi94ZW4vY29tbW9uL2xpYmZkdC9NYWtlZmlsZQpAQCAtNSw3ICs1LDcgQEAgU0VDVElP
TlMgOj0gdGV4dCBkYXRhICQoU1BFQ0lBTF9EQVRBX1NFQ1RJT05TKQogb2JqLXkgKz0gbGliZmR0
Lm8KIG5vY292LXkgKz0gbGliZmR0Lm8KIAotQ0ZMQUdTICs9IC1JJChCQVNFRElSKS9pbmNsdWRl
L3hlbi9saWJmZHQvCitjY2ZsYWdzLXkgKz0gLUkkKEJBU0VESVIpL2luY2x1ZGUveGVuL2xpYmZk
dC8KIAogbGliZmR0Lm86IGxpYmZkdC10ZW1wLm8gTWFrZWZpbGUKIAkkKE9CSkNPUFkpICQoZm9y
ZWFjaCBzLCQoU0VDVElPTlMpLC0tcmVuYW1lLXNlY3Rpb24gLiQocyk9LmluaXQuJChzKSkgJDwg
JEAKZGlmZiAtLWdpdCBhL3hlbi94c20vZmxhc2svTWFrZWZpbGUgYi94ZW4veHNtL2ZsYXNrL01h
a2VmaWxlCmluZGV4IGIxZmQ0NTQyMTk5My4uM2JmMGE2ZmEwNDU2IDEwMDY0NAotLS0gYS94ZW4v
eHNtL2ZsYXNrL01ha2VmaWxlCisrKyBiL3hlbi94c20vZmxhc2svTWFrZWZpbGUKQEAgLTQsNyAr
NCw3IEBAIG9iai15ICs9IGZsYXNrX29wLm8KIAogb2JqLXkgKz0gc3MvCiAKLUNGTEFHUyArPSAt
SS4vaW5jbHVkZQorY2NmbGFncy15ICs9IC1JLi9pbmNsdWRlCiAKIEFXSyA9IGF3awogCmRpZmYg
LS1naXQgYS94ZW4veHNtL2ZsYXNrL3NzL01ha2VmaWxlIGIveGVuL3hzbS9mbGFzay9zcy9NYWtl
ZmlsZQppbmRleCAwNDZjZThmNTMzMjYuLjMwZjkxMGE5YzljMSAxMDA2NDQKLS0tIGEveGVuL3hz
bS9mbGFzay9zcy9NYWtlZmlsZQorKysgYi94ZW4veHNtL2ZsYXNrL3NzL01ha2VmaWxlCkBAIC04
LDQgKzgsNCBAQCBvYmoteSArPSBzZXJ2aWNlcy5vCiBvYmoteSArPSBjb25kaXRpb25hbC5vCiBv
YmoteSArPSBtbHMubwogCi1DRkxBR1MgKz0gLUkuLi9pbmNsdWRlCitjY2ZsYWdzLXkgKz0gLUku
Li9pbmNsdWRlCi0tIApBbnRob255IFBFUkFSRAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
