Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94556115EBD
	for <lists+xen-devel@lfdr.de>; Sat,  7 Dec 2019 22:19:34 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1idhRd-0005v1-KL; Sat, 07 Dec 2019 21:16:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=U5T7=Z5=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1idhRb-0005uw-KJ
 for xen-devel@lists.xenproject.org; Sat, 07 Dec 2019 21:16:51 +0000
X-Inumbo-ID: e1d0c9a2-1936-11ea-8621-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e1d0c9a2-1936-11ea-8621-12813bfff9fa;
 Sat, 07 Dec 2019 21:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1575753410;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=2HKfHf1ZOGx8QLyGYqdyvRKBqHqqaAVsYsoH+JPY94M=;
 b=RALomlPlb37VkuUBIuKL1fqdn+LMqbozZp2FSqkV7JMPjmoSFGZDKn7U
 q+H8g+T9aGnYNugAVRzbhYqJ9/mxDyWjxhvK7ayCja36UTcUUa7G2WnPZ
 4u8t8ohWeG7Wi+CFDiZhQzQ0BCYVR5A3noIw5YAU7MtWIb/qn0nHhpDA3 k=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
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
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: bXWHwkXDAZEQgPa76oTVnzfMATIXGTjw8pB9wXAvP7oDuk8rnLFPP4nWjyZjJcUqIvnciqNs81
 LoDeEUBFxZ7+XZLFziIeScQnLuL17HsBZSvYmjYO9rKYldWcywqy5rB/+3uAPKpch3BCHXXMe1
 8anuBjtNtH6JxXy8I7gKh9Uiz1D0WYL3gJ1ETKx2N0Jef9h4/eXIg0lU//hsy6TXcu80qCevsp
 RDx8U/+6FgX7B4InCqd6+E/LuKNGiRZjkDZNEUQQsK3MFom0XBLYWla0YgNcvMnz+2h/UokWws
 nQY=
X-SBRS: 2.7
X-MesageID: 9355332
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,289,1571716800"; 
   d="scan'208";a="9355332"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Sat, 7 Dec 2019 21:16:32 +0000
Message-ID: <20191207211634.9958-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20191207211634.9958-1-andrew.cooper3@citrix.com>
References: <20191207211634.9958-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 1/3] xen/flask: Drop the gen-policy.py script
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
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIHNjcmlwdCBpcyBQeXRob24gMiBzcGVjaWZpYywgYW5kIGZhaWxzIHdpdGggc3RyaW5nL2Jp
bmFyeSBpc3N1ZXMgd2l0aApQeXRob24gMzoKCiAgVHJhY2ViYWNrIChtb3N0IHJlY2VudCBjYWxs
IGxhc3QpOgogICAgRmlsZSAiZ2VuLXBvbGljeS5weSIsIGxpbmUgMTQsIGluIDxtb2R1bGU+CiAg
ICAgIGZvciBjaGFyIGluIHN5cy5zdGRpbi5yZWFkKCk6CiAgICBGaWxlICIvdXNyL2xpYi9weXRo
b24zLjUvY29kZWNzLnB5IiwgbGluZSAzMjEsIGluIGRlY29kZQogICAgICAocmVzdWx0LCBjb25z
dW1lZCkgPSBzZWxmLl9idWZmZXJfZGVjb2RlKGRhdGEsIHNlbGYuZXJyb3JzLCBmaW5hbCkKICBV
bmljb2RlRGVjb2RlRXJyb3I6ICd1dGYtOCcgY29kZWMgY2FuJ3QgZGVjb2RlIGJ5dGUgMHg4YyBp
biBwb3NpdGlvbiAwOiBpbnZhbGlkIHN0YXJ0IGJ5dGUKCkZpeGluZyB0aGUgc2NyaXB0IHRvIGJl
IGNvbXBhdGlibGUgaXNuJ3QgaGFyZCwgYnV0IHVzaW5nIHB5dGhvbiBoZXJlIGlzCndhc3RlZnVs
LiAgRHJvcCB0aGUgc2NyaXB0IGVudGlyZWx5LCBhbmQgd3JpdGUgYSBzaG9ydCBmbGFzay1wb2xp
Y3kuUyBpbnN0ZWFkLgoKU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3Bl
cjNAY2l0cml4LmNvbT4KLS0tCkNDOiBEYW5pZWwgRGUgR3JhYWYgPGRnZGVncmFAdHljaG8ubnNh
Lmdvdj4KQ0M6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KCnYyOgogKiBGaXggdGFi
cyB2cyBzcGFjZXMgaXNzdWVzCnYzOgogKiBVc2UgJSByYXRoZXIgdGhhbiBAIGZvciBwcm9nYml0
cy9vYmplY3QsIGZvciBBcm0zMiBidWlsZC4KICogU3BvdHRlZCBieSBodHRwczovL3RyYXZpcy1j
aS5vcmcvYW5keWhocC94ZW4vYnVpbGRzLzYyMjA4NTEzOAoKRm9yIDQuMTMuICBUaGlzIGlzIGEg
YmxvY2tlciB0byBvdXIgaW50ZW50IHRvIGJ5IFB5My1jbGVhbiBpbiB0aGlzIHJlbGVhc2UuCgpE
aXNjb3ZlcmVkIGVudGlyZWx5IGFjY2lkZW50bHkgd2hlbiB0ZXN0aW5nIHRoZSBmaW5hbCBwYXRj
aC4KLS0tCiB4ZW4veHNtL2ZsYXNrL01ha2VmaWxlICAgICAgIHwgIDYgKystLS0tCiB4ZW4veHNt
L2ZsYXNrL2ZsYXNrLXBvbGljeS5TIHwgMjAgKysrKysrKysrKysrKysrKysrKysKIHhlbi94c20v
Zmxhc2svZ2VuLXBvbGljeS5weSAgfCAyMyAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogMyBmaWxl
cyBjaGFuZ2VkLCAyMiBpbnNlcnRpb25zKCspLCAyNyBkZWxldGlvbnMoLSkKIGNyZWF0ZSBtb2Rl
IDEwMDY0NCB4ZW4veHNtL2ZsYXNrL2ZsYXNrLXBvbGljeS5TCiBkZWxldGUgbW9kZSAxMDA2NDQg
eGVuL3hzbS9mbGFzay9nZW4tcG9saWN5LnB5CgpkaWZmIC0tZ2l0IGEveGVuL3hzbS9mbGFzay9N
YWtlZmlsZSBiL3hlbi94c20vZmxhc2svTWFrZWZpbGUKaW5kZXggZjVmZmFiMTIyNi4uN2MzZjM4
MTI4NyAxMDA2NDQKLS0tIGEveGVuL3hzbS9mbGFzay9NYWtlZmlsZQorKysgYi94ZW4veHNtL2Zs
YXNrL01ha2VmaWxlCkBAIC0yNyw3ICsyNyw4IEBAICQoRkxBU0tfSF9GSUxFUyk6ICQoRkxBU0tf
SF9ERVBFTkQpCiAkKEFWX0hfRklMRVMpOiAkKEFWX0hfREVQRU5EKQogCSQoQ09ORklHX1NIRUxM
KSBwb2xpY3kvbWthY2Nlc3NfdmVjdG9yLnNoICQoQVdLKSAkKEFWX0hfREVQRU5EKQogCi1vYmot
JChDT05GSUdfWFNNX0ZMQVNLX1BPTElDWSkgKz0gcG9saWN5Lm8KK29iai1iaW4tJChDT05GSUdf
WFNNX0ZMQVNLX1BPTElDWSkgKz0gZmxhc2stcG9saWN5Lm8KK2ZsYXNrLXBvbGljeS5vOiBwb2xp
Y3kuYmluCiAKIEZMQVNLX0JVSUxEX0RJUiA6PSAkKENVUkRJUikKIFBPTElDWV9TUkMgOj0gJChG
TEFTS19CVUlMRF9ESVIpL3hlbnBvbGljeS0kKFhFTl9GVUxMVkVSU0lPTikKQEAgLTM2LDkgKzM3
LDYgQEAgcG9saWN5LmJpbjogRk9SQ0UKIAkkKE1BS0UpIC1mICQoWEVOX1JPT1QpL3Rvb2xzL2Zs
YXNrL3BvbGljeS9NYWtlZmlsZS5jb21tb24gLUMgJChYRU5fUk9PVCkvdG9vbHMvZmxhc2svcG9s
aWN5IEZMQVNLX0JVSUxEX0RJUj0kKEZMQVNLX0JVSUxEX0RJUikKIAljbXAgLXMgJChQT0xJQ1lf
U1JDKSAkQCB8fCBjcCAkKFBPTElDWV9TUkMpICRACiAKLXBvbGljeS5jOiBwb2xpY3kuYmluIGdl
bi1wb2xpY3kucHkKLQkkKFBZVEhPTikgZ2VuLXBvbGljeS5weSA8ICQ8ID4gJEAKLQogLlBIT05Z
OiBjbGVhbgogY2xlYW46OgogCXJtIC1mICQoQUxMX0hfRklMRVMpICoubyAkKERFUFNfUk0pIHBv
bGljeS4qICQoUE9MSUNZX1NSQykKZGlmZiAtLWdpdCBhL3hlbi94c20vZmxhc2svZmxhc2stcG9s
aWN5LlMgYi94ZW4veHNtL2ZsYXNrL2ZsYXNrLXBvbGljeS5TCm5ldyBmaWxlIG1vZGUgMTAwNjQ0
CmluZGV4IDAwMDAwMDAwMDAuLjgxYmZjMDllYzIKLS0tIC9kZXYvbnVsbAorKysgYi94ZW4veHNt
L2ZsYXNrL2ZsYXNrLXBvbGljeS5TCkBAIC0wLDAgKzEsMjAgQEAKKyAgICAgICAgLnNlY3Rpb24g
LmluaXQucm9kYXRhLCAiYSIsICVwcm9nYml0cworCisvKiBjb25zdCB1bnNpZ25lZCBjaGFyIHhz
bV9mbGFza19pbml0X3BvbGljeVtdIF9faW5pdGNvbnN0ICovCisgICAgICAgIC5hbGlnbiA0Cisg
ICAgICAgIC5nbG9iYWwgeHNtX2ZsYXNrX2luaXRfcG9saWN5Cit4c21fZmxhc2tfaW5pdF9wb2xp
Y3k6CisgICAgICAgIC5pbmNiaW4gInBvbGljeS5iaW4iCisuTGVuZDoKKworICAgICAgICAudHlw
ZSB4c21fZmxhc2tfaW5pdF9wb2xpY3ksICVvYmplY3QKKyAgICAgICAgLnNpemUgeHNtX2ZsYXNr
X2luaXRfcG9saWN5LCAuIC0geHNtX2ZsYXNrX2luaXRfcG9saWN5CisKKy8qIGNvbnN0IHVuc2ln
bmVkIGludCBfX2luaXRjb25zdCB4c21fZmxhc2tfaW5pdF9wb2xpY3lfc2l6ZSAqLworICAgICAg
ICAuYWxpZ24gNAorICAgICAgICAuZ2xvYmFsIHhzbV9mbGFza19pbml0X3BvbGljeV9zaXplCit4
c21fZmxhc2tfaW5pdF9wb2xpY3lfc2l6ZToKKyAgICAgICAgLmxvbmcgLkxlbmQgLSB4c21fZmxh
c2tfaW5pdF9wb2xpY3kKKworICAgICAgICAudHlwZSB4c21fZmxhc2tfaW5pdF9wb2xpY3lfc2l6
ZSwgJW9iamVjdAorICAgICAgICAuc2l6ZSB4c21fZmxhc2tfaW5pdF9wb2xpY3lfc2l6ZSwgLiAt
IHhzbV9mbGFza19pbml0X3BvbGljeV9zaXplCmRpZmYgLS1naXQgYS94ZW4veHNtL2ZsYXNrL2dl
bi1wb2xpY3kucHkgYi94ZW4veHNtL2ZsYXNrL2dlbi1wb2xpY3kucHkKZGVsZXRlZCBmaWxlIG1v
ZGUgMTAwNjQ0CmluZGV4IGM3NTAxZTQ2MTQuLjAwMDAwMDAwMDAKLS0tIGEveGVuL3hzbS9mbGFz
ay9nZW4tcG9saWN5LnB5CisrKyAvZGV2L251bGwKQEAgLTEsMjMgKzAsMCBAQAotIyEvdXNyL2Jp
bi9lbnYgcHl0aG9uCi1pbXBvcnQgc3lzCi0KLXBvbGljeV9zaXplID0gMAotCi1zeXMuc3Rkb3V0
LndyaXRlKCIiIgotLyogVGhpcyBmaWxlIGlzIGF1dG9nZW5lcmF0ZWQgYnkgZ2VuX3BvbGljeS5w
eSAqLwotI2luY2x1ZGUgPHhlbi9pbml0Lmg+Ci0jaW5jbHVkZSA8eHNtL3hzbS5oPgotCi1jb25z
dCB1bnNpZ25lZCBjaGFyIHhzbV9mbGFza19pbml0X3BvbGljeVtdIF9faW5pdGNvbnN0ID0gewot
IiIiKQotCi1mb3IgY2hhciBpbiBzeXMuc3RkaW4ucmVhZCgpOgotICAgIHN5cy5zdGRvdXQud3Jp
dGUoIiAweCUwMngsIiAlIG9yZChjaGFyKSkKLSAgICBwb2xpY3lfc2l6ZSA9IHBvbGljeV9zaXpl
ICsgMQotICAgIGlmIHBvbGljeV9zaXplICUgMTMgPT0gMDoKLSAgICAgICAgc3lzLnN0ZG91dC53
cml0ZSgiXG4iKQotCi1zeXMuc3Rkb3V0LndyaXRlKCIiIgotfTsKLWNvbnN0IHVuc2lnbmVkIGlu
dCBfX2luaXRjb25zdCB4c21fZmxhc2tfaW5pdF9wb2xpY3lfc2l6ZSA9ICVkOwotIiIiICUgcG9s
aWN5X3NpemUpCi0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
