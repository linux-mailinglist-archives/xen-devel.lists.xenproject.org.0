Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B87D11E94C
	for <lists+xen-devel@lfdr.de>; Fri, 13 Dec 2019 18:40:26 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ifot1-0000LW-Fe; Fri, 13 Dec 2019 17:37:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=GgWl=2D=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1ifot0-0000LQ-7x
 for xen-devel@lists.xenproject.org; Fri, 13 Dec 2019 17:37:54 +0000
X-Inumbo-ID: 472156d6-1dcf-11ea-8fa7-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 472156d6-1dcf-11ea-8fa7-12813bfff9fa;
 Fri, 13 Dec 2019 17:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1576258668;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XJoBKVr1xnxEx2YA5bZnDBwblMT0dntvOAbVZCdtvvo=;
 b=OSNCeTj9sJKSxrBjUYvvVh/rKOQzgEdVuElNGlo8/rSsjoMfxDSccjDD
 yvoC7Q7AAhf1K0nIyJju7LdXCJQalnGtUtqHJXhgGsI8fJ3ocBZxTZCsH
 LYydG3n0jhjcK6pjhY0AIRv+/kmDkLV4+Lewsx5I4GEjUXuLjRA6lcON3 Y=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=george.dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 george.dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="george.dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Nc0113P35LfzzwBCxWWPqw5At+UE+gsTfcR264LDdrUwyOQ/gjw0npWQampRXZCPx/ss8qOzzh
 9kXPT/m1EklkGYCaDEee6kuukQszMVrlszbyxwAcnMh2bhWLci05HTq5h3rpYPET2XTn9k8qgt
 z6Hmz1Ph42XR+fwYMWIkviiChCW1ZMo/Mt6la7FnPuynlcE+axnQCyNs5B7XUPpNlhv2DU3Ff4
 R6WsRzCc/n/vww4kuWsGKJRYuxQLVGSzIlRMg1ixEPhtgHieoTgzG9WHawNoV9N+lgNlBMNXWv
 QW4=
X-SBRS: 2.7
X-MesageID: 10226688
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,309,1571716800"; d="scan'208";a="10226688"
From: George Dunlap <george.dunlap@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 13 Dec 2019 17:37:40 +0000
Message-ID: <20191213173742.1960441-2-george.dunlap@citrix.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191213173742.1960441-1-george.dunlap@citrix.com>
References: <20191213173742.1960441-1-george.dunlap@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 1/3] x86/mm: Use a more descriptive name for
 pagetable mfns
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SW4gbWFueSBwbGFjZXMsIGEgUFRFIGJlaW5nIG1vZGlmaWVkIGlzIGFjY29tcGFuaWVkIGJ5IHRo
ZSBwYWdldGFibGUKbWZuIHdoaWNoIGNvbnRhaW5zIHRoZSBQVEUgKHByaW1hcmlseSBpbiBvcmRl
ciB0byBiZSBhYmxlIHRvIG1haW50YWluCmxpbmVhciBtYXBwaW5nIGNvdW50cykuICBJbiBtYW55
IGNhc2VzLCB0aGlzIG1mbiBpcyBzdG9yZWQgaW4gdGhlCm5vbi1kZXNjcmlwdCB2YXJpYWJsZSAo
b3IgYXJnZW1lbnQpICJwZm4iLgoKUmVwbGFjZSB0aGVzZSBuYW1lcyB3aXRoIGxObWZuLCB0byBp
bmRpY2F0ZSB0aGF0IDEpIHRoaXMgaXMgYQpwYWdldGFibGUgbWZuLCBhbmQgMikgdGhhdCBpdCBp
cyB0aGUgc2FtZSBsZXZlbCBhcyB0aGUgUFRFIGluCnF1ZXN0aW9uLiAgVGhpcyBzaG91bGQgYmUg
ZW5vdWdoIHRvIHJlbWluZCByZWFkZXJzIHRoYXQgaXQncyB0aGUgbWZuCmNvbnRhaW5pbmcgdGhl
IFBURS4KCk5vIGZ1bmN0aW9uYWwgY2hhbmdlLgoKU2lnbmVkLW9mZi1ieTogR2VvcmdlIER1bmxh
cCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPgotLS0KdjI6Ci0gQWxzbyByZW5hbWUgYXJndW1l
bnRzIGZvciBwdXRfcGFnZV9mcm9tX2xOZQoKQ0M6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29w
ZXIzQGNpdHJpeC5jb20+CkNDOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Ci0tLQog
eGVuL2FyY2gveDg2L21tLmMgfCA2OCArKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDM0IGluc2VydGlvbnMoKyksIDM0IGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9tbS5jIGIveGVuL2FyY2gveDg2L21t
LmMKaW5kZXggOTU1NmU4Zjc4MC4uY2ViNjU2Y2E3NSAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2
L21tLmMKKysrIGIveGVuL2FyY2gveDg2L21tLmMKQEAgLTExNDEsNyArMTE0MSw3IEBAIHN0YXRp
YyBpbnQgZ2V0X3BhZ2VfYW5kX3R5cGVfZnJvbV9tZm4oCiBkZWZpbmVfZ2V0X2xpbmVhcl9wYWdl
dGFibGUobDIpOwogc3RhdGljIGludAogZ2V0X3BhZ2VfZnJvbV9sMmUoCi0gICAgbDJfcGdlbnRy
eV90IGwyZSwgdW5zaWduZWQgbG9uZyBwZm4sIHN0cnVjdCBkb21haW4gKmQsIHVuc2lnbmVkIGlu
dCBmbGFncykKKyAgICBsMl9wZ2VudHJ5X3QgbDJlLCB1bnNpZ25lZCBsb25nIGwybWZuLCBzdHJ1
Y3QgZG9tYWluICpkLCB1bnNpZ25lZCBpbnQgZmxhZ3MpCiB7CiAgICAgdW5zaWduZWQgbG9uZyBt
Zm4gPSBsMmVfZ2V0X3BmbihsMmUpOwogICAgIGludCByYzsKQEAgLTExNTYsNyArMTE1Niw3IEBA
IGdldF9wYWdlX2Zyb21fbDJlKAogICAgIEFTU0VSVCghKGZsYWdzICYgUFRGX3ByZWVtcHRpYmxl
KSk7CiAKICAgICByYyA9IGdldF9wYWdlX2FuZF90eXBlX2Zyb21fbWZuKF9tZm4obWZuKSwgUEdU
X2wxX3BhZ2VfdGFibGUsIGQsIGZsYWdzKTsKLSAgICBpZiAoIHVubGlrZWx5KHJjID09IC1FSU5W
QUwpICYmIGdldF9sMl9saW5lYXJfcGFnZXRhYmxlKGwyZSwgcGZuLCBkKSApCisgICAgaWYgKCB1
bmxpa2VseShyYyA9PSAtRUlOVkFMKSAmJiBnZXRfbDJfbGluZWFyX3BhZ2V0YWJsZShsMmUsIGwy
bWZuLCBkKSApCiAgICAgICAgIHJjID0gMDsKIAogICAgIHJldHVybiByYzsKQEAgLTExNjUsNyAr
MTE2NSw3IEBAIGdldF9wYWdlX2Zyb21fbDJlKAogZGVmaW5lX2dldF9saW5lYXJfcGFnZXRhYmxl
KGwzKTsKIHN0YXRpYyBpbnQKIGdldF9wYWdlX2Zyb21fbDNlKAotICAgIGwzX3BnZW50cnlfdCBs
M2UsIHVuc2lnbmVkIGxvbmcgcGZuLCBzdHJ1Y3QgZG9tYWluICpkLCB1bnNpZ25lZCBpbnQgZmxh
Z3MpCisgICAgbDNfcGdlbnRyeV90IGwzZSwgdW5zaWduZWQgbG9uZyBsM21mbiwgc3RydWN0IGRv
bWFpbiAqZCwgdW5zaWduZWQgaW50IGZsYWdzKQogewogICAgIGludCByYzsKIApAQCAtMTE4MCw3
ICsxMTgwLDcgQEAgZ2V0X3BhZ2VfZnJvbV9sM2UoCiAgICAgICAgIGwzZV9nZXRfbWZuKGwzZSks
IFBHVF9sMl9wYWdlX3RhYmxlLCBkLCBmbGFncyB8IFBURl9wcmVlbXB0aWJsZSk7CiAgICAgaWYg
KCB1bmxpa2VseShyYyA9PSAtRUlOVkFMKSAmJgogICAgICAgICAgIWlzX3B2XzMyYml0X2RvbWFp
bihkKSAmJgotICAgICAgICAgZ2V0X2wzX2xpbmVhcl9wYWdldGFibGUobDNlLCBwZm4sIGQpICkK
KyAgICAgICAgIGdldF9sM19saW5lYXJfcGFnZXRhYmxlKGwzZSwgbDNtZm4sIGQpICkKICAgICAg
ICAgcmMgPSAwOwogCiAgICAgcmV0dXJuIHJjOwpAQCAtMTE4OSw3ICsxMTg5LDcgQEAgZ2V0X3Bh
Z2VfZnJvbV9sM2UoCiBkZWZpbmVfZ2V0X2xpbmVhcl9wYWdldGFibGUobDQpOwogc3RhdGljIGlu
dAogZ2V0X3BhZ2VfZnJvbV9sNGUoCi0gICAgbDRfcGdlbnRyeV90IGw0ZSwgdW5zaWduZWQgbG9u
ZyBwZm4sIHN0cnVjdCBkb21haW4gKmQsIHVuc2lnbmVkIGludCBmbGFncykKKyAgICBsNF9wZ2Vu
dHJ5X3QgbDRlLCB1bnNpZ25lZCBsb25nIGw0bWZuLCBzdHJ1Y3QgZG9tYWluICpkLCB1bnNpZ25l
ZCBpbnQgZmxhZ3MpCiB7CiAgICAgaW50IHJjOwogCkBAIC0xMjAyLDcgKzEyMDIsNyBAQCBnZXRf
cGFnZV9mcm9tX2w0ZSgKIAogICAgIHJjID0gZ2V0X3BhZ2VfYW5kX3R5cGVfZnJvbV9tZm4oCiAg
ICAgICAgIGw0ZV9nZXRfbWZuKGw0ZSksIFBHVF9sM19wYWdlX3RhYmxlLCBkLCBmbGFncyB8IFBU
Rl9wcmVlbXB0aWJsZSk7Ci0gICAgaWYgKCB1bmxpa2VseShyYyA9PSAtRUlOVkFMKSAmJiBnZXRf
bDRfbGluZWFyX3BhZ2V0YWJsZShsNGUsIHBmbiwgZCkgKQorICAgIGlmICggdW5saWtlbHkocmMg
PT0gLUVJTlZBTCkgJiYgZ2V0X2w0X2xpbmVhcl9wYWdldGFibGUobDRlLCBsNG1mbiwgZCkgKQog
ICAgICAgICByYyA9IDA7CiAKICAgICByZXR1cm4gcmM7CkBAIC0xMzI5LDEwICsxMzI5LDEwIEBA
IHN0YXRpYyBpbnQgcHV0X2RhdGFfcGFnZXMoc3RydWN0IHBhZ2VfaW5mbyAqcGFnZSwgYm9vbCB3
cml0ZWFibGUsIGludCBwdF9zaGlmdCkKICAqIE5CLiBWaXJ0dWFsIGFkZHJlc3MgJ2wyZScgbWFw
cyB0byBhIG1hY2hpbmUgYWRkcmVzcyB3aXRoaW4gZnJhbWUgJ3BmbicuCiAgKiBOb3RlIGFsc28g
dGhhdCB0aGlzIGF1dG9tYXRpY2FsbHkgZGVhbHMgY29ycmVjdGx5IHdpdGggbGluZWFyIHAudC4n
cy4KICAqLwotc3RhdGljIGludCBwdXRfcGFnZV9mcm9tX2wyZShsMl9wZ2VudHJ5X3QgbDJlLCB1
bnNpZ25lZCBsb25nIHBmbiwKK3N0YXRpYyBpbnQgcHV0X3BhZ2VfZnJvbV9sMmUobDJfcGdlbnRy
eV90IGwyZSwgdW5zaWduZWQgbG9uZyBsMm1mbiwKICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgdW5zaWduZWQgaW50IGZsYWdzKQogewotICAgIGlmICggIShsMmVfZ2V0X2ZsYWdzKGwyZSkg
JiBfUEFHRV9QUkVTRU5UKSB8fCAobDJlX2dldF9wZm4obDJlKSA9PSBwZm4pICkKKyAgICBpZiAo
ICEobDJlX2dldF9mbGFncyhsMmUpICYgX1BBR0VfUFJFU0VOVCkgfHwgKGwyZV9nZXRfcGZuKGwy
ZSkgPT0gbDJtZm4pICkKICAgICAgICAgcmV0dXJuIDE7CiAKICAgICBpZiAoIGwyZV9nZXRfZmxh
Z3MobDJlKSAmIF9QQUdFX1BTRSApCkBAIC0xMzQwLDEzICsxMzQwLDEzIEBAIHN0YXRpYyBpbnQg
cHV0X3BhZ2VfZnJvbV9sMmUobDJfcGdlbnRyeV90IGwyZSwgdW5zaWduZWQgbG9uZyBwZm4sCiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBsMmVfZ2V0X2ZsYWdzKGwyZSkgJiBfUEFHRV9S
VywKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIEwyX1BBR0VUQUJMRV9TSElGVCk7CiAK
LSAgICByZXR1cm4gcHV0X3B0X3BhZ2UobDJlX2dldF9wYWdlKGwyZSksIG1mbl90b19wYWdlKF9t
Zm4ocGZuKSksIGZsYWdzKTsKKyAgICByZXR1cm4gcHV0X3B0X3BhZ2UobDJlX2dldF9wYWdlKGwy
ZSksIG1mbl90b19wYWdlKF9tZm4obDJtZm4pKSwgZmxhZ3MpOwogfQogCi1zdGF0aWMgaW50IHB1
dF9wYWdlX2Zyb21fbDNlKGwzX3BnZW50cnlfdCBsM2UsIHVuc2lnbmVkIGxvbmcgcGZuLAorc3Rh
dGljIGludCBwdXRfcGFnZV9mcm9tX2wzZShsM19wZ2VudHJ5X3QgbDNlLCB1bnNpZ25lZCBsb25n
IGwzbWZuLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgZmxhZ3Mp
CiB7Ci0gICAgaWYgKCAhKGwzZV9nZXRfZmxhZ3MobDNlKSAmIF9QQUdFX1BSRVNFTlQpIHx8IChs
M2VfZ2V0X3BmbihsM2UpID09IHBmbikgKQorICAgIGlmICggIShsM2VfZ2V0X2ZsYWdzKGwzZSkg
JiBfUEFHRV9QUkVTRU5UKSB8fCAobDNlX2dldF9wZm4obDNlKSA9PSBsM21mbikgKQogICAgICAg
ICByZXR1cm4gMTsKIAogICAgIGlmICggdW5saWtlbHkobDNlX2dldF9mbGFncyhsM2UpICYgX1BB
R0VfUFNFKSApCkBAIC0xMzU0LDE2ICsxMzU0LDE2IEBAIHN0YXRpYyBpbnQgcHV0X3BhZ2VfZnJv
bV9sM2UobDNfcGdlbnRyeV90IGwzZSwgdW5zaWduZWQgbG9uZyBwZm4sCiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBsM2VfZ2V0X2ZsYWdzKGwzZSkgJiBfUEFHRV9SVywKICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIEwzX1BBR0VUQUJMRV9TSElGVCk7CiAKLSAgICByZXR1cm4g
cHV0X3B0X3BhZ2UobDNlX2dldF9wYWdlKGwzZSksIG1mbl90b19wYWdlKF9tZm4ocGZuKSksIGZs
YWdzKTsKKyAgICByZXR1cm4gcHV0X3B0X3BhZ2UobDNlX2dldF9wYWdlKGwzZSksIG1mbl90b19w
YWdlKF9tZm4obDNtZm4pKSwgZmxhZ3MpOwogfQogCi1zdGF0aWMgaW50IHB1dF9wYWdlX2Zyb21f
bDRlKGw0X3BnZW50cnlfdCBsNGUsIHVuc2lnbmVkIGxvbmcgcGZuLAorc3RhdGljIGludCBwdXRf
cGFnZV9mcm9tX2w0ZShsNF9wZ2VudHJ5X3QgbDRlLCB1bnNpZ25lZCBsb25nIGw0bWZuLAogICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgZmxhZ3MpCiB7Ci0gICAgaWYg
KCAhKGw0ZV9nZXRfZmxhZ3MobDRlKSAmIF9QQUdFX1BSRVNFTlQpIHx8IChsNGVfZ2V0X3Bmbihs
NGUpID09IHBmbikgKQorICAgIGlmICggIShsNGVfZ2V0X2ZsYWdzKGw0ZSkgJiBfUEFHRV9QUkVT
RU5UKSB8fCAobDRlX2dldF9wZm4obDRlKSA9PSBsNG1mbikgKQogICAgICAgICByZXR1cm4gMTsK
IAotICAgIHJldHVybiBwdXRfcHRfcGFnZShsNGVfZ2V0X3BhZ2UobDRlKSwgbWZuX3RvX3BhZ2Uo
X21mbihwZm4pKSwgZmxhZ3MpOworICAgIHJldHVybiBwdXRfcHRfcGFnZShsNGVfZ2V0X3BhZ2Uo
bDRlKSwgbWZuX3RvX3BhZ2UoX21mbihsNG1mbikpLCBmbGFncyk7CiB9CiAKIHN0YXRpYyBpbnQg
YWxsb2NfbDFfdGFibGUoc3RydWN0IHBhZ2VfaW5mbyAqcGFnZSkKQEAgLTE0NjAsMTMgKzE0NjAs
MTMgQEAgc3RhdGljIGludCBjcmVhdGVfcGFlX3hlbl9tYXBwaW5ncyhzdHJ1Y3QgZG9tYWluICpk
LCBsM19wZ2VudHJ5X3QgKnBsM2UpCiBzdGF0aWMgaW50IGFsbG9jX2wyX3RhYmxlKHN0cnVjdCBw
YWdlX2luZm8gKnBhZ2UsIHVuc2lnbmVkIGxvbmcgdHlwZSkKIHsKICAgICBzdHJ1Y3QgZG9tYWlu
ICpkID0gcGFnZV9nZXRfb3duZXIocGFnZSk7Ci0gICAgdW5zaWduZWQgbG9uZyAgcGZuID0gbWZu
X3gocGFnZV90b19tZm4ocGFnZSkpOworICAgIHVuc2lnbmVkIGxvbmcgIGwybWZuID0gbWZuX3go
cGFnZV90b19tZm4ocGFnZSkpOwogICAgIGwyX3BnZW50cnlfdCAgKnBsMmU7CiAgICAgdW5zaWdu
ZWQgaW50ICAgaTsKICAgICBpbnQgICAgICAgICAgICByYyA9IDA7CiAgICAgdW5zaWduZWQgaW50
ICAgcGFydGlhbF9mbGFncyA9IHBhZ2UtPnBhcnRpYWxfZmxhZ3M7CiAKLSAgICBwbDJlID0gbWFw
X2RvbWFpbl9wYWdlKF9tZm4ocGZuKSk7CisgICAgcGwyZSA9IG1hcF9kb21haW5fcGFnZShfbWZu
KGwybWZuKSk7CiAKICAgICAvKgogICAgICAqIE5CIHRoYXQgYWxsb2NfbDJfdGFibGUgd2lsbCBu
ZXZlciBzZXQgcGFydGlhbF9wdGUgb24gYW4gbDI7IGJ1dApAQCAtMTQ5Miw3ICsxNDkyLDcgQEAg
c3RhdGljIGludCBhbGxvY19sMl90YWJsZShzdHJ1Y3QgcGFnZV9pbmZvICpwYWdlLCB1bnNpZ25l
ZCBsb25nIHR5cGUpCiAgICAgICAgICAgICByYyA9IC1FSU5UUjsKICAgICAgICAgfQogICAgICAg
ICBlbHNlCi0gICAgICAgICAgICByYyA9IGdldF9wYWdlX2Zyb21fbDJlKGwyZSwgcGZuLCBkLCBw
YXJ0aWFsX2ZsYWdzKTsKKyAgICAgICAgICAgIHJjID0gZ2V0X3BhZ2VfZnJvbV9sMmUobDJlLCBs
Mm1mbiwgZCwgcGFydGlhbF9mbGFncyk7CiAKICAgICAgICAgLyoKICAgICAgICAgICogSXQgc2hv
dWxkbid0IGJlIHBvc3NpYmxlIGZvciBnZXRfcGFnZV9mcm9tX2wyZSB0byByZXR1cm4KQEAgLTE1
NTksMTQgKzE1NTksMTQgQEAgc3RhdGljIGludCBhbGxvY19sMl90YWJsZShzdHJ1Y3QgcGFnZV9p
bmZvICpwYWdlLCB1bnNpZ25lZCBsb25nIHR5cGUpCiBzdGF0aWMgaW50IGFsbG9jX2wzX3RhYmxl
KHN0cnVjdCBwYWdlX2luZm8gKnBhZ2UpCiB7CiAgICAgc3RydWN0IGRvbWFpbiAqZCA9IHBhZ2Vf
Z2V0X293bmVyKHBhZ2UpOwotICAgIHVuc2lnbmVkIGxvbmcgIHBmbiA9IG1mbl94KHBhZ2VfdG9f
bWZuKHBhZ2UpKTsKKyAgICB1bnNpZ25lZCBsb25nICBsM21mbiA9IG1mbl94KHBhZ2VfdG9fbWZu
KHBhZ2UpKTsKICAgICBsM19wZ2VudHJ5X3QgICpwbDNlOwogICAgIHVuc2lnbmVkIGludCAgIGk7
CiAgICAgaW50ICAgICAgICAgICAgcmMgPSAwOwogICAgIHVuc2lnbmVkIGludCAgIHBhcnRpYWxf
ZmxhZ3MgPSBwYWdlLT5wYXJ0aWFsX2ZsYWdzOwogICAgIGwzX3BnZW50cnlfdCAgIGwzZSA9IGwz
ZV9lbXB0eSgpOwogCi0gICAgcGwzZSA9IG1hcF9kb21haW5fcGFnZShfbWZuKHBmbikpOworICAg
IHBsM2UgPSBtYXBfZG9tYWluX3BhZ2UoX21mbihsM21mbikpOwogCiAgICAgLyoKICAgICAgKiBQ
QUUgZ3Vlc3RzIGFsbG9jYXRlIGZ1bGwgcGFnZXMsIGJ1dCBhcmVuJ3QgcmVxdWlyZWQgdG8gaW5p
dGlhbGl6ZQpAQCAtMTYwMyw3ICsxNjAzLDcgQEAgc3RhdGljIGludCBhbGxvY19sM190YWJsZShz
dHJ1Y3QgcGFnZV9pbmZvICpwYWdlKQogICAgICAgICAgICAgcmMgPSAtRUlOVFI7CiAgICAgICAg
IH0KICAgICAgICAgZWxzZQotICAgICAgICAgICAgcmMgPSBnZXRfcGFnZV9mcm9tX2wzZShsM2Us
IHBmbiwgZCwKKyAgICAgICAgICAgIHJjID0gZ2V0X3BhZ2VfZnJvbV9sM2UobDNlLCBsM21mbiwg
ZCwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFydGlhbF9mbGFncyB8IFBU
Rl9yZXRhaW5fcmVmX29uX3Jlc3RhcnQpOwogCiAgICAgICAgIGlmICggcmMgPT0gLUVSRVNUQVJU
ICkKQEAgLTE3ODYsOCArMTc4Niw4IEBAIHZvaWQgemFwX3JvX21wdChtZm5fdCBtZm4pCiBzdGF0
aWMgaW50IGFsbG9jX2w0X3RhYmxlKHN0cnVjdCBwYWdlX2luZm8gKnBhZ2UpCiB7CiAgICAgc3Ry
dWN0IGRvbWFpbiAqZCA9IHBhZ2VfZ2V0X293bmVyKHBhZ2UpOwotICAgIHVuc2lnbmVkIGxvbmcg
IHBmbiA9IG1mbl94KHBhZ2VfdG9fbWZuKHBhZ2UpKTsKLSAgICBsNF9wZ2VudHJ5X3QgICpwbDRl
ID0gbWFwX2RvbWFpbl9wYWdlKF9tZm4ocGZuKSk7CisgICAgdW5zaWduZWQgbG9uZyAgbDRtZm4g
PSBtZm5feChwYWdlX3RvX21mbihwYWdlKSk7CisgICAgbDRfcGdlbnRyeV90ICAqcGw0ZSA9IG1h
cF9kb21haW5fcGFnZShfbWZuKGw0bWZuKSk7CiAgICAgdW5zaWduZWQgaW50ICAgaTsKICAgICBp
bnQgICAgICAgICAgICByYyA9IDA7CiAgICAgdW5zaWduZWQgaW50ICAgcGFydGlhbF9mbGFncyA9
IHBhZ2UtPnBhcnRpYWxfZmxhZ3M7CkBAIC0xODA5LDcgKzE4MDksNyBAQCBzdGF0aWMgaW50IGFs
bG9jX2w0X3RhYmxlKHN0cnVjdCBwYWdlX2luZm8gKnBhZ2UpCiAgICAgICAgICAgICByYyA9IC1F
SU5UUjsKICAgICAgICAgfQogICAgICAgICBlbHNlCi0gICAgICAgICAgICByYyA9IGdldF9wYWdl
X2Zyb21fbDRlKGw0ZSwgcGZuLCBkLAorICAgICAgICAgICAgcmMgPSBnZXRfcGFnZV9mcm9tX2w0
ZShsNGUsIGw0bWZuLCBkLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXJ0
aWFsX2ZsYWdzIHwgUFRGX3JldGFpbl9yZWZfb25fcmVzdGFydCk7CiAKICAgICAgICAgaWYgKCBy
YyA9PSAtRVJFU1RBUlQgKQpAQCAtMTg2OSw3ICsxODY5LDcgQEAgc3RhdGljIGludCBhbGxvY19s
NF90YWJsZShzdHJ1Y3QgcGFnZV9pbmZvICpwYWdlKQogCiAgICAgaWYgKCAhcmMgKQogICAgIHsK
LSAgICAgICAgaW5pdF94ZW5fbDRfc2xvdHMocGw0ZSwgX21mbihwZm4pLAorICAgICAgICBpbml0
X3hlbl9sNF9zbG90cyhwbDRlLCBfbWZuKGw0bWZuKSwKICAgICAgICAgICAgICAgICAgICAgICAg
ICAgZCwgSU5WQUxJRF9NRk4sIFZNX0FTU0lTVChkLCBtMnBfc3RyaWN0KSk7CiAgICAgICAgIGF0
b21pY19pbmMoJmQtPmFyY2gucHYubnJfbDRfcGFnZXMpOwogICAgIH0KQEAgLTE4OTYsMTggKzE4
OTYsMTggQEAgc3RhdGljIHZvaWQgZnJlZV9sMV90YWJsZShzdHJ1Y3QgcGFnZV9pbmZvICpwYWdl
KQogc3RhdGljIGludCBmcmVlX2wyX3RhYmxlKHN0cnVjdCBwYWdlX2luZm8gKnBhZ2UpCiB7CiAg
ICAgc3RydWN0IGRvbWFpbiAqZCA9IHBhZ2VfZ2V0X293bmVyKHBhZ2UpOwotICAgIHVuc2lnbmVk
IGxvbmcgcGZuID0gbWZuX3gocGFnZV90b19tZm4ocGFnZSkpOworICAgIHVuc2lnbmVkIGxvbmcg
bDJtZm4gPSBtZm5feChwYWdlX3RvX21mbihwYWdlKSk7CiAgICAgbDJfcGdlbnRyeV90ICpwbDJl
OwogICAgIGludCByYyA9IDA7CiAgICAgdW5zaWduZWQgaW50IHBhcnRpYWxfZmxhZ3MgPSBwYWdl
LT5wYXJ0aWFsX2ZsYWdzLAogICAgICAgICBpID0gcGFnZS0+bnJfdmFsaWRhdGVkX3B0ZXMgLSAh
KHBhcnRpYWxfZmxhZ3MgJiBQVEZfcGFydGlhbF9zZXQpOwogCi0gICAgcGwyZSA9IG1hcF9kb21h
aW5fcGFnZShfbWZuKHBmbikpOworICAgIHBsMmUgPSBtYXBfZG9tYWluX3BhZ2UoX21mbihsMm1m
bikpOwogCiAgICAgZm9yICggOyA7ICkKICAgICB7CiAgICAgICAgIGlmICggaXNfZ3Vlc3RfbDJf
c2xvdChkLCBwYWdlLT51LmludXNlLnR5cGVfaW5mbywgaSkgKQotICAgICAgICAgICAgcmMgPSBw
dXRfcGFnZV9mcm9tX2wyZShwbDJlW2ldLCBwZm4sIHBhcnRpYWxfZmxhZ3MpOworICAgICAgICAg
ICAgcmMgPSBwdXRfcGFnZV9mcm9tX2wyZShwbDJlW2ldLCBsMm1mbiwgcGFydGlhbF9mbGFncyk7
CiAgICAgICAgIGlmICggcmMgPCAwICkKICAgICAgICAgICAgIGJyZWFrOwogCkBAIC0xOTQ4LDE3
ICsxOTQ4LDE3IEBAIHN0YXRpYyBpbnQgZnJlZV9sMl90YWJsZShzdHJ1Y3QgcGFnZV9pbmZvICpw
YWdlKQogc3RhdGljIGludCBmcmVlX2wzX3RhYmxlKHN0cnVjdCBwYWdlX2luZm8gKnBhZ2UpCiB7
CiAgICAgc3RydWN0IGRvbWFpbiAqZCA9IHBhZ2VfZ2V0X293bmVyKHBhZ2UpOwotICAgIHVuc2ln
bmVkIGxvbmcgcGZuID0gbWZuX3gocGFnZV90b19tZm4ocGFnZSkpOworICAgIHVuc2lnbmVkIGxv
bmcgbDNtZm4gPSBtZm5feChwYWdlX3RvX21mbihwYWdlKSk7CiAgICAgbDNfcGdlbnRyeV90ICpw
bDNlOwogICAgIGludCByYyA9IDA7CiAgICAgdW5zaWduZWQgaW50IHBhcnRpYWxfZmxhZ3MgPSBw
YWdlLT5wYXJ0aWFsX2ZsYWdzLAogICAgICAgICBpID0gcGFnZS0+bnJfdmFsaWRhdGVkX3B0ZXMg
LSAhKHBhcnRpYWxfZmxhZ3MgJiBQVEZfcGFydGlhbF9zZXQpOwogCi0gICAgcGwzZSA9IG1hcF9k
b21haW5fcGFnZShfbWZuKHBmbikpOworICAgIHBsM2UgPSBtYXBfZG9tYWluX3BhZ2UoX21mbihs
M21mbikpOwogCiAgICAgZm9yICggOyA7ICkKICAgICB7Ci0gICAgICAgIHJjID0gcHV0X3BhZ2Vf
ZnJvbV9sM2UocGwzZVtpXSwgcGZuLCBwYXJ0aWFsX2ZsYWdzKTsKKyAgICAgICAgcmMgPSBwdXRf
cGFnZV9mcm9tX2wzZShwbDNlW2ldLCBsM21mbiwgcGFydGlhbF9mbGFncyk7CiAgICAgICAgIGlm
ICggcmMgPCAwICkKICAgICAgICAgICAgIGJyZWFrOwogCkBAIC0xOTk1LDE1ICsxOTk1LDE1IEBA
IHN0YXRpYyBpbnQgZnJlZV9sM190YWJsZShzdHJ1Y3QgcGFnZV9pbmZvICpwYWdlKQogc3RhdGlj
IGludCBmcmVlX2w0X3RhYmxlKHN0cnVjdCBwYWdlX2luZm8gKnBhZ2UpCiB7CiAgICAgc3RydWN0
IGRvbWFpbiAqZCA9IHBhZ2VfZ2V0X293bmVyKHBhZ2UpOwotICAgIHVuc2lnbmVkIGxvbmcgcGZu
ID0gbWZuX3gocGFnZV90b19tZm4ocGFnZSkpOwotICAgIGw0X3BnZW50cnlfdCAqcGw0ZSA9IG1h
cF9kb21haW5fcGFnZShfbWZuKHBmbikpOworICAgIHVuc2lnbmVkIGxvbmcgbDRtZm4gPSBtZm5f
eChwYWdlX3RvX21mbihwYWdlKSk7CisgICAgbDRfcGdlbnRyeV90ICpwbDRlID0gbWFwX2RvbWFp
bl9wYWdlKF9tZm4obDRtZm4pKTsKICAgICBpbnQgcmMgPSAwOwogICAgIHVuc2lnbmVkIHBhcnRp
YWxfZmxhZ3MgPSBwYWdlLT5wYXJ0aWFsX2ZsYWdzLAogICAgICAgICBpID0gcGFnZS0+bnJfdmFs
aWRhdGVkX3B0ZXMgLSAhKHBhcnRpYWxfZmxhZ3MgJiBQVEZfcGFydGlhbF9zZXQpOwogCiAgICAg
ZG8gewogICAgICAgICBpZiAoIGlzX2d1ZXN0X2w0X3Nsb3QoZCwgaSkgKQotICAgICAgICAgICAg
cmMgPSBwdXRfcGFnZV9mcm9tX2w0ZShwbDRlW2ldLCBwZm4sIHBhcnRpYWxfZmxhZ3MpOworICAg
ICAgICAgICAgcmMgPSBwdXRfcGFnZV9mcm9tX2w0ZShwbDRlW2ldLCBsNG1mbiwgcGFydGlhbF9m
bGFncyk7CiAgICAgICAgIGlmICggcmMgPCAwICkKICAgICAgICAgICAgIGJyZWFrOwogICAgICAg
ICBwYXJ0aWFsX2ZsYWdzID0gMDsKLS0gCjIuMjQuMAoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
