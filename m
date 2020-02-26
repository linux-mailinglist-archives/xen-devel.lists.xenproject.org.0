Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84FEE16FED2
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2020 13:22:22 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6vfY-0007iB-3V; Wed, 26 Feb 2020 12:20:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NxXS=4O=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j6vfW-0007a7-Ni
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2020 12:20:02 +0000
X-Inumbo-ID: 4f96bcb8-5892-11ea-9405-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4f96bcb8-5892-11ea-9405-12813bfff9fa;
 Wed, 26 Feb 2020 12:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582719601;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wv/vxk0u0VbbLGUWa/SXKuvSSwAq6bOO4pDv/657Jok=;
 b=epxwsUlcsvlpxhAMce7eMT8mbwgp1uXmT9epXA80PvDe1gYbBEsue391
 +Jr87OXVxuzzjvxLHNAyv7Yzi3uftkYkn7aZovedxqDVNOKvwZoOvtfJZ
 ynv5rRnB+56mETDyov3ShrYWliniHzm0XDHcRdlGXuF8Ek590oKZ2ocjb o=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Hdx9BAEX+6189xWIiTtwXHjOb7dSV/S3JvLXHOB0OxW/VZNSGQgv1pTbS/PXLBr0a08Al7pKlS
 lsgkZpfYxCWtVjkoEaFzeOg++vOOOmrdHR6OGpl+iD2LSiIEq2pKTKlefcfame1K0xIK0RelDD
 S6DKtXh8aOxm6vtoQLT4IiRY2m4NvHoC6e62HOjN9/gT51zaq5DaSAl5kZ50ty2CcK5yX9QWA0
 oNaz1M9gXWCX7Pifmxubd0CtRkHiVubedO2exmFropfY+lUdXr4K96cRwsR49+EYxngvhZTyPd
 9zU=
X-SBRS: 2.7
X-MesageID: 13386968
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,488,1574139600"; d="scan'208";a="13386968"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 26 Feb 2020 13:19:18 +0100
Message-ID: <20200226121921.28627-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200226121921.28627-1-roger.pau@citrix.com>
References: <20200226121921.28627-1-roger.pau@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v4 1/4] x86: introduce a nmi_count tracking
 variable
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
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, George
 Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBpcyBtb2RlbGVkIGFmdGVyIHRoZSBpcnFfY291bnQgdmFyaWFibGUsIGFuZCBpcyB1c2Vk
IHRvIGFjY291bnQKZm9yIGFsbCB0aGUgTk1JcyBoYW5kbGVkIGJ5IHRoZSBzeXN0ZW0uCgpUaGlz
IHdpbGwgYWxsb3cgdG8gcmVwdXJwb3NlIHRoZSBubWlfY291bnQoKSBoZWxwZXIgc28gaXQgY2Fu
IGJlIHVzZWQKaW4gYSBzaW1pbGFyIG1hbm5lciBhcyBsb2NhbF9pcnFfY291bnQoKTogYWNjb3Vu
dCBmb3IgdGhlIE5NSXMKY3VycmVudGx5IGluIHNlcnZpY2UuCgpTaWduZWQtb2ZmLWJ5OiBSb2dl
ciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KLS0tCkNoYW5nZXMgc2luY2UgdjM6
CiAtIFJlbW92ZSBubWlfY291bnQgbWFjcm8gYW5kIF9fbm1pX2NvdW50IGZpZWxkIGluIGlycV9j
cHVzdGF0X3QuCi0tLQogeGVuL2FyY2gveDg2L25taS5jICAgICAgICAgICAgfCAxMSArKysrKy0t
LS0tLQogeGVuL2FyY2gveDg2L3RyYXBzLmMgICAgICAgICAgfCAgNCArKystCiB4ZW4vaW5jbHVk
ZS9hc20teDg2L2hhcmRpcnEuaCB8ICAxIC0KIHhlbi9pbmNsdWRlL2FzbS14ODYvbm1pLmggICAg
IHwgIDIgKysKIHhlbi9pbmNsdWRlL3hlbi9pcnFfY3B1c3RhdC5oIHwgIDEgLQogNSBmaWxlcyBj
aGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hl
bi9hcmNoL3g4Ni9ubWkuYyBiL3hlbi9hcmNoL3g4Ni9ubWkuYwppbmRleCBhNjliOTFhOTI0Li5j
M2Y5MmVkMjMxIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvbm1pLmMKKysrIGIveGVuL2FyY2gv
eDg2L25taS5jCkBAIC0xNTEsMTUgKzE1MSwxNCBAQCBpbnQgbm1pX2FjdGl2ZTsKIAogc3RhdGlj
IHZvaWQgX19pbml0IHdhaXRfZm9yX25taXModm9pZCAqcCkKIHsKLSAgICB1bnNpZ25lZCBpbnQg
Y3B1ID0gc21wX3Byb2Nlc3Nvcl9pZCgpOwotICAgIHVuc2lnbmVkIGludCBzdGFydF9jb3VudCA9
IG5taV9jb3VudChjcHUpOworICAgIHVuc2lnbmVkIGludCBzdGFydF9jb3VudCA9IHRoaXNfY3B1
KG5taV9jb3VudCk7CiAgICAgdW5zaWduZWQgbG9uZyB0aWNrcyA9IDEwICogMTAwMCAqIGNwdV9r
aHogLyBubWlfaHo7CiAgICAgdW5zaWduZWQgbG9uZyBzLCBlOwogCiAgICAgcyA9IHJkdHNjKCk7
CiAgICAgZG8gewogICAgICAgICBjcHVfcmVsYXgoKTsKLSAgICAgICAgaWYgKCBubWlfY291bnQo
Y3B1KSA+PSBzdGFydF9jb3VudCArIDIgKQorICAgICAgICBpZiAoIHRoaXNfY3B1KG5taV9jb3Vu
dCkgPj0gc3RhcnRfY291bnQgKyAyICkKICAgICAgICAgICAgIGJyZWFrOwogICAgICAgICBlID0g
cmR0c2MoKTsKICAgICB9IHdoaWxlKCBlIC0gcyA8IHRpY2tzICk7CkBAIC0xNzcsNyArMTc2LDcg
QEAgdm9pZCBfX2luaXQgY2hlY2tfbm1pX3dhdGNoZG9nKHZvaWQpCiAgICAgcHJpbnRrKCJUZXN0
aW5nIE5NSSB3YXRjaGRvZyBvbiBhbGwgQ1BVczoiKTsKIAogICAgIGZvcl9lYWNoX29ubGluZV9j
cHUgKCBjcHUgKQotICAgICAgICBwcmV2X25taV9jb3VudFtjcHVdID0gbm1pX2NvdW50KGNwdSk7
CisgICAgICAgIHByZXZfbm1pX2NvdW50W2NwdV0gPSBwZXJfY3B1KG5taV9jb3VudCwgY3B1KTsK
IAogICAgIC8qCiAgICAgICogV2FpdCBhdCBtb3N0IDEwIHRpY2tzIGZvciAyIHdhdGNoZG9nIE5N
SXMgb24gZWFjaCBDUFUuCkBAIC0xODgsNyArMTg3LDcgQEAgdm9pZCBfX2luaXQgY2hlY2tfbm1p
X3dhdGNoZG9nKHZvaWQpCiAKICAgICBmb3JfZWFjaF9vbmxpbmVfY3B1ICggY3B1ICkKICAgICB7
Ci0gICAgICAgIGlmICggbm1pX2NvdW50KGNwdSkgLSBwcmV2X25taV9jb3VudFtjcHVdIDwgMiAp
CisgICAgICAgIGlmICggcGVyX2NwdShubWlfY291bnQsIGNwdSkgLSBwcmV2X25taV9jb3VudFtj
cHVdIDwgMiApCiAgICAgICAgIHsKICAgICAgICAgICAgIHByaW50aygiICVkIiwgY3B1KTsKICAg
ICAgICAgICAgIG9rID0gZmFsc2U7CkBAIC01OTMsNyArNTkyLDcgQEAgc3RhdGljIHZvaWQgZG9f
bm1pX3N0YXRzKHVuc2lnbmVkIGNoYXIga2V5KQogCiAgICAgcHJpbnRrKCJDUFVcdE5NSVxuIik7
CiAgICAgZm9yX2VhY2hfb25saW5lX2NwdSAoIGNwdSApCi0gICAgICAgIHByaW50aygiJTN1XHQl
M3VcbiIsIGNwdSwgbm1pX2NvdW50KGNwdSkpOworICAgICAgICBwcmludGsoIiUzdVx0JTN1XG4i
LCBjcHUsIHBlcl9jcHUobm1pX2NvdW50LCBjcHUpKTsKIAogICAgIGlmICggIWhhcmR3YXJlX2Rv
bWFpbiB8fCAhKHYgPSBkb21haW5fdmNwdShoYXJkd2FyZV9kb21haW4sIDApKSApCiAgICAgICAg
IHJldHVybjsKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni90cmFwcy5jIGIveGVuL2FyY2gveDg2
L3RyYXBzLmMKaW5kZXggNTYwNjdmODVkMS4uM2RiYzY2YmI2NCAxMDA2NDQKLS0tIGEveGVuL2Fy
Y2gveDg2L3RyYXBzLmMKKysrIGIveGVuL2FyY2gveDg2L3RyYXBzLmMKQEAgLTE2ODMsMTMgKzE2
ODMsMTUgQEAgc3RhdGljIGludCBkdW1teV9ubWlfY2FsbGJhY2soY29uc3Qgc3RydWN0IGNwdV91
c2VyX3JlZ3MgKnJlZ3MsIGludCBjcHUpCiAKIHN0YXRpYyBubWlfY2FsbGJhY2tfdCAqbm1pX2Nh
bGxiYWNrID0gZHVtbXlfbm1pX2NhbGxiYWNrOwogCitERUZJTkVfUEVSX0NQVSh1bnNpZ25lZCBp
bnQsIG5taV9jb3VudCk7CisKIHZvaWQgZG9fbm1pKGNvbnN0IHN0cnVjdCBjcHVfdXNlcl9yZWdz
ICpyZWdzKQogewogICAgIHVuc2lnbmVkIGludCBjcHUgPSBzbXBfcHJvY2Vzc29yX2lkKCk7CiAg
ICAgdW5zaWduZWQgY2hhciByZWFzb24gPSAwOwogICAgIGJvb2wgaGFuZGxlX3Vua25vd24gPSBm
YWxzZTsKIAotICAgICsrbm1pX2NvdW50KGNwdSk7CisgICAgdGhpc19jcHUobm1pX2NvdW50KSsr
OwogCiAgICAgaWYgKCBubWlfY2FsbGJhY2socmVncywgY3B1KSApCiAgICAgICAgIHJldHVybjsK
ZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL2FzbS14ODYvaGFyZGlycS5oIGIveGVuL2luY2x1ZGUv
YXNtLXg4Ni9oYXJkaXJxLmgKaW5kZXggMzRlMWI0OTI2MC4uODAyZjkxY2ZkZiAxMDA2NDQKLS0t
IGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9oYXJkaXJxLmgKKysrIGIveGVuL2luY2x1ZGUvYXNtLXg4
Ni9oYXJkaXJxLmgKQEAgLTcsNyArNyw2IEBACiB0eXBlZGVmIHN0cnVjdCB7CiAJdW5zaWduZWQg
aW50IF9fc29mdGlycV9wZW5kaW5nOwogCXVuc2lnbmVkIGludCBfX2xvY2FsX2lycV9jb3VudDsK
LQl1bnNpZ25lZCBpbnQgX19ubWlfY291bnQ7CiAJYm9vbF90IF9fbXdhaXRfd2FrZXVwOwogfSBf
X2NhY2hlbGluZV9hbGlnbmVkIGlycV9jcHVzdGF0X3Q7CiAKZGlmZiAtLWdpdCBhL3hlbi9pbmNs
dWRlL2FzbS14ODYvbm1pLmggYi94ZW4vaW5jbHVkZS9hc20teDg2L25taS5oCmluZGV4IGY5ZGZj
YTZhZmIuLmEyODhmMDJhNTAgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL2FzbS14ODYvbm1pLmgK
KysrIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9ubWkuaApAQCAtMzEsNSArMzEsNyBAQCBubWlfY2Fs
bGJhY2tfdCAqc2V0X25taV9jYWxsYmFjayhubWlfY2FsbGJhY2tfdCAqY2FsbGJhY2spOwogICog
UmVtb3ZlIHRoZSBoYW5kbGVyIHByZXZpb3VzbHkgc2V0LgogICovCiB2b2lkIHVuc2V0X25taV9j
YWxsYmFjayh2b2lkKTsKKworREVDTEFSRV9QRVJfQ1BVKHVuc2lnbmVkIGludCwgbm1pX2NvdW50
KTsKICAKICNlbmRpZiAvKiBBU01fTk1JX0ggKi8KZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL3hl
bi9pcnFfY3B1c3RhdC5oIGIveGVuL2luY2x1ZGUveGVuL2lycV9jcHVzdGF0LmgKaW5kZXggNzM2
MjlmNmVjOC4uYjk2MjlmMjVjMiAxMDA2NDQKLS0tIGEveGVuL2luY2x1ZGUveGVuL2lycV9jcHVz
dGF0LmgKKysrIGIveGVuL2luY2x1ZGUveGVuL2lycV9jcHVzdGF0LmgKQEAgLTI0LDcgKzI0LDYg
QEAgZXh0ZXJuIGlycV9jcHVzdGF0X3QgaXJxX3N0YXRbXTsKICAgLyogYXJjaCBpbmRlcGVuZGVu
dCBpcnFfc3RhdCBmaWVsZHMgKi8KICNkZWZpbmUgc29mdGlycV9wZW5kaW5nKGNwdSkJX19JUlFf
U1RBVCgoY3B1KSwgX19zb2Z0aXJxX3BlbmRpbmcpCiAjZGVmaW5lIGxvY2FsX2lycV9jb3VudChj
cHUpCV9fSVJRX1NUQVQoKGNwdSksIF9fbG9jYWxfaXJxX2NvdW50KQotI2RlZmluZSBubWlfY291
bnQoY3B1KQkJX19JUlFfU1RBVCgoY3B1KSwgX19ubWlfY291bnQpCiAjZGVmaW5lIG13YWl0X3dh
a2V1cChjcHUpCV9fSVJRX1NUQVQoKGNwdSksIF9fbXdhaXRfd2FrZXVwKQogCiAjZW5kaWYJLyog
X19pcnFfY3B1c3RhdF9oICovCi0tIAoyLjI1LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
