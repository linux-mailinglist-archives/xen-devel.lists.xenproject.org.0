Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDE1E1593FA
	for <lists+xen-devel@lfdr.de>; Tue, 11 Feb 2020 16:54:20 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j1XpS-0000oi-DP; Tue, 11 Feb 2020 15:52:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BEN5=37=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1j1XpQ-0000od-PQ
 for xen-devel@lists.xenproject.org; Tue, 11 Feb 2020 15:52:00 +0000
X-Inumbo-ID: 6fa3b1f8-4ce6-11ea-b5cb-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6fa3b1f8-4ce6-11ea-b5cb-12813bfff9fa;
 Tue, 11 Feb 2020 15:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1581436319;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=bQsi0H2yFc8xgZU38jH4Y+FaMPYqSbhcdm3vJ0u+G+0=;
 b=hX3KVH4mArGzHu7Sd7QshLqv2AeTBBQdmglWrw/HFZwtvgcEdH+Q1Q3J
 Q3cNvZRHdEzSVDTT4jZNx4mbMKBJkrifRyzDCY8y/VfNukhA8wRAzIwdJ
 TD8JZ3gaP5u6E37pPj/TcbG615wZucsD1x27lmlMHAQf0uRFIyG50vyA0 E=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: bXjUn0DzL7H/jdeKDJFeA677a6KvWgfnSgCiYf4TSl9Rarbw3lP9HLgeH7DPPSGDPQ/cBK9XqW
 Un3rX9YuCNhhhbYSN23YfD1dSsyKwJohYi385n616SHXEEHItkA80hZfQ997FP+F892ZL9gtS/
 cGiM5U96UTLbJu+pi0bauzR8dBpClhDIKUynAOh/X1/G6bBMfjb9oPeZvpWUfLRQ3+82mAWU5o
 4kV+XB+1fKL8MIJlgLJuNq9m6guLC42w3ape23bfn3esOXhyJzM/0NZHEuyC6xkvcXIPUQjOrJ
 Tio=
X-SBRS: 2.7
X-MesageID: 12712084
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,428,1574139600"; d="scan'208";a="12712084"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Tue, 11 Feb 2020 15:51:54 +0000
Message-ID: <20200211155155.17396-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2] x86/amd: Avoid cpu_has_hypervisor evaluating
 true on native hardware
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
Cc: Igor Druzhinin <igor.druzhinin@citrix.com>, Claudia <claudia1@disroot.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Q3VycmVudGx5IHdoZW4gYm9vdGluZyBuYXRpdmUgb24gQU1EIGhhcmR3YXJlLCBjcHVpZG1hc2tf
ZGVmYXVsdHMuXzFjZCBnZXRzCmNvbmZpZ3VyZWQgd2l0aCB0aGUgSFlQRVJWSVNPUiBiaXQgYmVm
b3JlIG5hdGl2ZSBDUFVJRCBpcyBzY2FubmVkIGZvciBmZWF0dXJlCmJpdHMuCgpUaGlzIHJlc3Vs
dHMgaW4gY3B1X2hhc19oeXBlcnZpc29yIGJlY29taW5nIHNldCBhcyBwYXJ0IG9mIGlkZW50aWZ5
X2NwdSgpLCBhbmQKZW5kcyB1cCBhcHBlYXJpbmcgaW4gdGhlIHJhdyBhbmQgaG9zdCBDUFUgcG9s
aWNpZXMuCgpBIGNvbWJpbmF0aW9uIG9mIHRoaXMgYnVnLCBhbmQgYy9zIGJiNTAyYThjYTU5ICJ4
ODY6IGNoZWNrIGZlYXR1cmUgZmxhZ3MgYWZ0ZXIKcmVzdW1lIiB3aGljaCBjaGVja3MgdGhhdCBm
ZWF0dXJlIGJpdHMgZG9uJ3QgZ28gbWlzc2luZywgcmVzdWx0cyBpbiBicm9rZW4gUzMKb24gQU1E
IGhhcmR3YXJlLgoKQWx0ZXIgYW1kX2luaXRfbGV2ZWxsaW5nKCkgdG8gZXhjbHVkZSB0aGUgSFlQ
RVJWSVNPUiBiaXQgZnJvbQpjcHVtYXNrX2RlZmF1bHRzLCBhbmQgdXBkYXRlIGRvbWFpbl9jcHVf
cG9saWN5X2NoYW5nZWQoKSB0byBhbGxvdyBpdCB0byBiZQpleHBsaWNpdGx5IGZvcndhcmRlZC4K
ClRoaXMgYWxzbyBmaXhlcyBhIGJ1ZyBvbiBrZXhlYywgd2hlcmUgdGhlIGh5cGVydmlzb3IgYml0
IGlzIGxlZnQgZW5hYmxlZCBmb3IKdGhlIG5ldyBrZXJuZWwgdG8gZmluZC4KClRoZXNlIGNoYW5n
ZXMgaGlnaGxpZ2h0IGEgZnVydGhlciBidXQgLSBkb20wIGNvbnN0cnVjdGlvbiBpcyBhc3ltZXRy
aWMgd2l0aApkb21VIGNvbnN0cnVjdGlvbiwgYnkgbm90IGhhdmluZyBhbnkgY2FsbHMgdG8gZG9t
YWluX2NwdV9wb2xpY3lfY2hhbmdlZCgpLgpFeHRlbmQgYXJjaF9kb21haW5fY3JlYXRlKCkgdG8g
YWx3YXlzIGNhbGwgZG9tYWluX2NwdV9wb2xpY3lfY2hhbmdlZCgpLgoKUmVwb3J0ZWQtYnk6IEln
b3IgRHJ1emhpbmluIDxpZ29yLmRydXpoaW5pbkBjaXRyaXguY29tPgpTaWduZWQtb2ZmLWJ5OiBB
bmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgotLS0KQ0M6IEphbiBCZXVs
aWNoIDxKQmV1bGljaEBzdXNlLmNvbT4KQ0M6IFdlaSBMaXUgPHdsQHhlbi5vcmc+CkNDOiBSb2dl
ciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KQ0M6IElnb3IgRHJ1emhpbmluIDxp
Z29yLmRydXpoaW5pbkBjaXRyaXguY29tPgpDQzogTWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tp
IDxtYXJtYXJla0BpbnZpc2libGV0aGluZ3NsYWIuY29tPgpDQzogQ2xhdWRpYSA8Y2xhdWRpYTFA
ZGlzcm9vdC5vcmc+Cgp2MjoKICogUmV3cml0ZSB0aGUgY29tbWl0IG1lc3NhZ2UuICBObyBjaGFu
Z2UgdG8gdGhlIHBhdGNoIGNvbnRlbnQuCgpNYXJlay9DbGF1ZGlhOiBEbyBlaXRoZXIgb2YgeW91
IHdhbnQgYSBSZXBvcnRlZC1ieSB0YWcgc2VlaW5nIGFzIHlvdSBmb3VuZCBhCmJyYW5kIG5ldyB3
YXkgdGhhdCB0aGlzIHdhcyBicm9rZW4/Ci0tLQogeGVuL2FyY2gveDg2L2NwdS9hbWQuYyAgICAg
ICB8IDMgLS0tCiB4ZW4vYXJjaC94ODYvZG9tYWluLmMgICAgICAgIHwgMiArKwogeGVuL2FyY2gv
eDg2L2RvbWN0bC5jICAgICAgICB8IDkgKysrKysrKystCiB4ZW4vaW5jbHVkZS9hc20teDg2L2Rv
bWFpbi5oIHwgMiArKwogNCBmaWxlcyBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCA0IGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9jcHUvYW1kLmMgYi94ZW4vYXJjaC94
ODYvY3B1L2FtZC5jCmluZGV4IGUzNTFkZDIyN2YuLmY5NWE4ZTBmZDMgMTAwNjQ0Ci0tLSBhL3hl
bi9hcmNoL3g4Ni9jcHUvYW1kLmMKKysrIGIveGVuL2FyY2gveDg2L2NwdS9hbWQuYwpAQCAtMjk4
LDkgKzI5OCw2IEBAIHN0YXRpYyB2b2lkIF9faW5pdCBub2lubGluZSBhbWRfaW5pdF9sZXZlbGxp
bmcodm9pZCkKIAkJCWVjeCB8PSBjcHVmZWF0X21hc2soWDg2X0ZFQVRVUkVfT1NYU0FWRSk7CiAJ
CWVkeCB8PSBjcHVmZWF0X21hc2soWDg2X0ZFQVRVUkVfQVBJQyk7CiAKLQkJLyogQWxsb3cgdGhl
IEhZUEVSVklTT1IgYml0IHRvIGJlIHNldCB2aWEgZ3Vlc3QgcG9saWN5LiAqLwotCQllY3ggfD0g
Y3B1ZmVhdF9tYXNrKFg4Nl9GRUFUVVJFX0hZUEVSVklTT1IpOwotCiAJCWNwdWlkbWFza19kZWZh
dWx0cy5fMWNkID0gKCh1aW50NjRfdCllY3ggPDwgMzIpIHwgZWR4OwogCX0KIApkaWZmIC0tZ2l0
IGEveGVuL2FyY2gveDg2L2RvbWFpbi5jIGIveGVuL2FyY2gveDg2L2RvbWFpbi5jCmluZGV4IGY1
M2FlNWZmODYuLjEyYmQ1NTQzOTEgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9kb21haW4uYwor
KysgYi94ZW4vYXJjaC94ODYvZG9tYWluLmMKQEAgLTY1Niw2ICs2NTYsOCBAQCBpbnQgYXJjaF9k
b21haW5fY3JlYXRlKHN0cnVjdCBkb21haW4gKmQsCiAgICAgICovCiAgICAgZC0+YXJjaC54ODdf
ZmlwX3dpZHRoID0gY3B1X2hhc19mcHVfc2VsID8gMCA6IDg7CiAKKyAgICBkb21haW5fY3B1X3Bv
bGljeV9jaGFuZ2VkKGQpOworCiAgICAgcmV0dXJuIDA7CiAKICBmYWlsOgpkaWZmIC0tZ2l0IGEv
eGVuL2FyY2gveDg2L2RvbWN0bC5jIGIveGVuL2FyY2gveDg2L2RvbWN0bC5jCmluZGV4IDRmYTlj
OTExNDAuLmNlNzZkNmQ3NzYgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9kb21jdGwuYworKysg
Yi94ZW4vYXJjaC94ODYvZG9tY3RsLmMKQEAgLTQ4LDcgKzQ4LDcgQEAgc3RhdGljIGludCBnZGJz
eF9ndWVzdF9tZW1faW8oZG9taWRfdCBkb21pZCwgc3RydWN0IHhlbl9kb21jdGxfZ2Ric3hfbWVt
aW8gKmlvcCkKIH0KICNlbmRpZgogCi1zdGF0aWMgdm9pZCBkb21haW5fY3B1X3BvbGljeV9jaGFu
Z2VkKHN0cnVjdCBkb21haW4gKmQpCit2b2lkIGRvbWFpbl9jcHVfcG9saWN5X2NoYW5nZWQoc3Ry
dWN0IGRvbWFpbiAqZCkKIHsKICAgICBjb25zdCBzdHJ1Y3QgY3B1aWRfcG9saWN5ICpwID0gZC0+
YXJjaC5jcHVpZDsKICAgICBzdHJ1Y3QgdmNwdSAqdjsKQEAgLTEwNiw2ICsxMDYsMTMgQEAgc3Rh
dGljIHZvaWQgZG9tYWluX2NwdV9wb2xpY3lfY2hhbmdlZChzdHJ1Y3QgZG9tYWluICpkKQogICAg
ICAgICAgICAgICAgICAgICBlY3ggPSAwOwogICAgICAgICAgICAgICAgIGVkeCA9IGNwdWZlYXRf
bWFzayhYODZfRkVBVFVSRV9BUElDKTsKIAorICAgICAgICAgICAgICAgIC8qCisgICAgICAgICAg
ICAgICAgICogSWYgdGhlIEh5cGVydmlzb3IgYml0IGlzIHNldCBpbiB0aGUgcG9saWN5LCB3ZSBj
YW4gYWxzbworICAgICAgICAgICAgICAgICAqIGZvcndhcmQgaXQgaW50byByZWFsIENQVUlELgor
ICAgICAgICAgICAgICAgICAqLworICAgICAgICAgICAgICAgIGlmICggcC0+YmFzaWMuaHlwZXJ2
aXNvciApCisgICAgICAgICAgICAgICAgICAgIGVjeCB8PSBjcHVmZWF0X21hc2soWDg2X0ZFQVRV
UkVfSFlQRVJWSVNPUik7CisKICAgICAgICAgICAgICAgICBtYXNrIHw9ICgodWludDY0X3QpZWN4
IDw8IDMyKSB8IGVkeDsKICAgICAgICAgICAgICAgICBicmVhazsKICAgICAgICAgICAgIH0KZGlm
ZiAtLWdpdCBhL3hlbi9pbmNsdWRlL2FzbS14ODYvZG9tYWluLmggYi94ZW4vaW5jbHVkZS9hc20t
eDg2L2RvbWFpbi5oCmluZGV4IGYwYzI1ZmZlYzAuLjE4NDNjNzZkMWEgMTAwNjQ0Ci0tLSBhL3hl
bi9pbmNsdWRlL2FzbS14ODYvZG9tYWluLmgKKysrIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9kb21h
aW4uaApAQCAtNjI0LDYgKzYyNCw4IEBAIHN0cnVjdCBndWVzdF9tZW1vcnlfcG9saWN5CiB2b2lk
IHVwZGF0ZV9ndWVzdF9tZW1vcnlfcG9saWN5KHN0cnVjdCB2Y3B1ICp2LAogICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgZ3Vlc3RfbWVtb3J5X3BvbGljeSAqcG9saWN5KTsK
IAordm9pZCBkb21haW5fY3B1X3BvbGljeV9jaGFuZ2VkKHN0cnVjdCBkb21haW4gKmQpOworCiBi
b29sIHVwZGF0ZV9ydW5zdGF0ZV9hcmVhKHN0cnVjdCB2Y3B1ICopOwogYm9vbCB1cGRhdGVfc2Vj
b25kYXJ5X3N5c3RlbV90aW1lKHN0cnVjdCB2Y3B1ICosCiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgc3RydWN0IHZjcHVfdGltZV9pbmZvICopOwotLSAKMi4xMS4wCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
