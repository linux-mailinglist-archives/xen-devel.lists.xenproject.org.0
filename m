Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F8CF550A6
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2019 15:42:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hflg1-0005QJ-2s; Tue, 25 Jun 2019 13:40:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ez/b=UY=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hflfz-0005QE-Gc
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2019 13:39:59 +0000
X-Inumbo-ID: b77c9272-974e-11e9-8170-c701df7cb881
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b77c9272-974e-11e9-8170-c701df7cb881;
 Tue, 25 Jun 2019 13:39:55 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: ik/1wvINYMhCo3kjltlLzOG7yNzPHiC9rYS4rh6qabfgni7PN4okZQFh+SgM2JxRFhZq2EBWXW
 aDWPWk0VnLWmfUp6KphQ/M65fvkgAJIHN+Y43XjJUZSxVKpJ15YE5POco+8lRKKr5XcyMa/UeD
 l/EAEKazdr+mhdmvHeJZ4yhiBB5ATGvu8at63QR7c2SLFviPDngbaRtfFcSG7EhE1SlaFt53mC
 yGELndSQsVMrHqrnfZCCh1EGh1Iv5qjkZlb5LDAoRo2MTf/ZdQWXlWtqdHM6w0rCweYvWhrE6i
 nXE=
X-SBRS: 2.7
X-MesageID: 2189977
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,416,1557201600"; 
   d="scan'208";a="2189977"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 25 Jun 2019 15:39:44 +0200
Message-ID: <20190625133944.36588-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.20.1 (Apple Git-117)
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] config: don't hardcode toolchain binaries
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Q3VycmVudGx5IHRoZSBuYW1lcyBvZiB0aGUgYnVpbGQgdG9vbGNoYWluIGJpbmFyaWVzIGFyZSBo
YXJkY29kZWQgaW4KU3RkR05VLm1rLCBhbmQgdGhlIHZhbHVlcyBmcm9tIHRoZSBlbnZpcm9ubWVu
dCBhcmUgaWdub3JlZC4KClN3aXRjaCBTdGRHTlUubWsgdG8gdXNlICc/PScgaW5zdGVhZCBvZiAn
PScsIHNvIHRoYXQgdmFsdWVzIGZyb20gdGhlCmVudmlyb25tZW50IGFyZSB1c2VkIGlmIHByZXNl
bnQsIGVsc2UgZGVmYXVsdCB0byB0aGUgdmFsdWVzIHByb3ZpZGVkCmJ5IHRoZSBjb25maWcgZmls
ZS4KClRoaXMgY2hhbmdlIGZpeGVzIHRoZSBnaXRsYWIgQ0kgbG9vcCwgdGhhdCB3YXMgcmVseWlu
ZyBvbiBwYXNzaW5nCmN1c3RvbSB2YWx1ZXMgaW4gdGhlIGVudmlyb25tZW50IHZhcmlhYmxlcyBm
b3IgdGhlIGNvbXBpbGVyIGFuZCB0aGUKbGlua2VyLgoKU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1
IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Ci0tLQpDYzogQW5kcmV3IENvb3BlciA8YW5k
cmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KQ2M6IEdlb3JnZSBEdW5sYXAgPEdlb3JnZS5EdW5sYXBA
ZXUuY2l0cml4LmNvbT4KQ2M6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29t
PgpDYzogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpDYzogSnVsaWVuIEdyYWxsIDxq
dWxpZW4uZ3JhbGxAYXJtLmNvbT4KQ2M6IEtvbnJhZCBSemVzenV0ZWsgV2lsayA8a29ucmFkLndp
bGtAb3JhY2xlLmNvbT4KQ2M6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVs
Lm9yZz4KQ2M6IFRpbSBEZWVnYW4gPHRpbUB4ZW4ub3JnPgpDYzogV2VpIExpdSA8d2xAeGVuLm9y
Zz4KLS0tCiBjb25maWcvU3RkR05VLm1rIHwgMzQgKysrKysrKysrKysrKysrKystLS0tLS0tLS0t
LS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDE3IGluc2VydGlvbnMoKyksIDE3IGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL2NvbmZpZy9TdGRHTlUubWsgYi9jb25maWcvU3RkR05VLm1rCmluZGV4
IDAzOTI3NGVhNjEuLmM5NjI0YjA0M2MgMTAwNjQ0Ci0tLSBhL2NvbmZpZy9TdGRHTlUubWsKKysr
IGIvY29uZmlnL1N0ZEdOVS5tawpAQCAtMSwyNyArMSwyNyBAQAotQVMgICAgICAgICA9ICQoQ1JP
U1NfQ09NUElMRSlhcwotTEQgICAgICAgICA9ICQoQ1JPU1NfQ09NUElMRSlsZAorQVMgICAgICAg
ID89ICQoQ1JPU1NfQ09NUElMRSlhcworTEQgICAgICAgID89ICQoQ1JPU1NfQ09NUElMRSlsZAog
aWZlcSAoJChjbGFuZykseSkKLUNDICAgICAgICAgPSAkKENST1NTX0NPTVBJTEUpY2xhbmcKLUNY
WCAgICAgICAgPSAkKENST1NTX0NPTVBJTEUpY2xhbmcrKwotTERfTFRPICAgICA9ICQoQ1JPU1Nf
Q09NUElMRSlsbHZtLWxkCitDQyAgICAgICAgPz0gJChDUk9TU19DT01QSUxFKWNsYW5nCitDWFgg
ICAgICAgPz0gJChDUk9TU19DT01QSUxFKWNsYW5nKysKK0xEX0xUTyAgICA/PSAkKENST1NTX0NP
TVBJTEUpbGx2bS1sZAogZWxzZQotQ0MgICAgICAgICA9ICQoQ1JPU1NfQ09NUElMRSlnY2MKLUNY
WCAgICAgICAgPSAkKENST1NTX0NPTVBJTEUpZysrCi1MRF9MVE8gICAgID0gJChDUk9TU19DT01Q
SUxFKWxkCitDQyAgICAgICAgPz0gJChDUk9TU19DT01QSUxFKWdjYworQ1hYICAgICAgID89ICQo
Q1JPU1NfQ09NUElMRSlnKysKK0xEX0xUTyAgICA/PSAkKENST1NTX0NPTVBJTEUpbGQKIGVuZGlm
Ci1DUFAgICAgICAgID0gJChDQykgLUUKLUFSICAgICAgICAgPSAkKENST1NTX0NPTVBJTEUpYXIK
LVJBTkxJQiAgICAgPSAkKENST1NTX0NPTVBJTEUpcmFubGliCi1OTSAgICAgICAgID0gJChDUk9T
U19DT01QSUxFKW5tCi1TVFJJUCAgICAgID0gJChDUk9TU19DT01QSUxFKXN0cmlwCi1PQkpDT1BZ
ICAgID0gJChDUk9TU19DT01QSUxFKW9iamNvcHkKLU9CSkRVTVAgICAgPSAkKENST1NTX0NPTVBJ
TEUpb2JqZHVtcAotU0laRVVUSUwgICA9ICQoQ1JPU1NfQ09NUElMRSlzaXplCitDUFAgICAgICAg
Pz0gJChDQykgLUUKK0FSICAgICAgICA/PSAkKENST1NTX0NPTVBJTEUpYXIKK1JBTkxJQiAgICA/
PSAkKENST1NTX0NPTVBJTEUpcmFubGliCitOTSAgICAgICAgPz0gJChDUk9TU19DT01QSUxFKW5t
CitTVFJJUCAgICAgPz0gJChDUk9TU19DT01QSUxFKXN0cmlwCitPQkpDT1BZICAgPz0gJChDUk9T
U19DT01QSUxFKW9iamNvcHkKK09CSkRVTVAgICA/PSAkKENST1NTX0NPTVBJTEUpb2JqZHVtcAor
U0laRVVUSUwgID89ICQoQ1JPU1NfQ09NUElMRSlzaXplCiAKICMgQWxsb3cgZ2l0IHRvIGJlIHdy
YXBwZXJlZCBpbiB0aGUgZW52aXJvbm1lbnQKIEdJVCAgICAgICAgPz0gZ2l0CiAKLUlOU1RBTEwg
ICAgICA9IGluc3RhbGwKK0lOU1RBTEwgICA/PSBpbnN0YWxsCiBJTlNUQUxMX0RJUiAgPSAkKElO
U1RBTEwpIC1kIC1tMDc1NSAtcAogSU5TVEFMTF9EQVRBID0gJChJTlNUQUxMKSAtbTA2NDQgLXAK
IElOU1RBTExfUFJPRyA9ICQoSU5TVEFMTCkgLW0wNzU1IC1wCi0tIAoyLjIwLjEgKEFwcGxlIEdp
dC0xMTcpCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
