Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73B21106C96
	for <lists+xen-devel@lfdr.de>; Fri, 22 Nov 2019 11:54:28 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iY6Xw-0000d5-32; Fri, 22 Nov 2019 10:52:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=767Z=ZO=citrix.com=sergey.dyasli@srs-us1.protection.inumbo.net>)
 id 1iY6Xu-0000d0-7J
 for xen-devel@lists.xen.org; Fri, 22 Nov 2019 10:52:14 +0000
X-Inumbo-ID: 23467f1c-0d16-11ea-9631-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 23467f1c-0d16-11ea-9631-bc764e2007e4;
 Fri, 22 Nov 2019 10:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1574419932;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=bRujceWkPNcpDP73fmp1sTpTovbp0lpQ4DSjX6d6T0g=;
 b=iLSNLdjZOa5/zEN7TmoYhV3czira/diZ/ff/tjUOv5lTMzFEAgy+yEbK
 oZomxN11V/xi3BaK+hycn9JdB98aBDnokoSh+Asg9xTzH88muDqygxDac
 oPfZy5O4ZGyJSYOUU/6QTEmHTTL0aHl1isY8p9YUBCcf96wTCuJyhHkD9 Q=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=sergey.dyasli@citrix.com;
 spf=Pass smtp.mailfrom=sergey.dyasli@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 sergey.dyasli@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="sergey.dyasli@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 sergey.dyasli@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="sergey.dyasli@citrix.com";
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
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 3qk733YXkHDjqd53hSp4UhjYSsUXklb6TN1x3RZXQoTvWL9B900MyZrtvRL9wCPW1IYFBSV+oS
 Kjcu85K5BMtjqi0puyleNKNRdlNjP3K8jCEotd6O9cezegUegwd4f7Ik6OwNpTiL1Ax0ZcE7QQ
 UnAyD3FTS9ffI/4nvud5tNkhR2YBteCF/Zkc37LFmajOhLlee0dIOlTX9d6HjuWvrFTYSBv1yC
 EvFw1f3OR2DdjanwhslxlTjtj1jpJ/noRjoRn3C9BwpSmF4bZpcgmg0VEmAUmBvGtxJouqRdh2
 oIg=
X-SBRS: 2.7
X-MesageID: 8709342
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,229,1571716800"; 
   d="scan'208";a="8709342"
From: Sergey Dyasli <sergey.dyasli@citrix.com>
To: <xen-devel@lists.xen.org>
Date: Fri, 22 Nov 2019 10:52:02 +0000
Message-ID: <20191122105202.25507-1-sergey.dyasli@citrix.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v1 for 4.13] x86/microcode: refuse to load the
 same revision ucode
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
Cc: Juergen Gross <jgross@suse.com>, Sergey Dyasli <sergey.dyasli@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Chao Gao <chao.gao@intel.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Q3VycmVudGx5IGlmIGEgdXNlciB0cmllcyB0byBsaXZlLWxvYWQgdGhlIHNhbWUgdWNvZGUgcmV2
aXNpb24gdGhhdCBDUFUKYWxyZWFkeSBoYXMsIGhlIHdpbGwgZ2V0IGEgc2luZ2xlIG1lc3NhZ2Ug
aW4gWGVuIGxvZyBsaWtlOgoKICAgIChYRU4pIDEyOCBjb3JlcyBhcmUgdG8gdXBkYXRlIHRoZWly
IG1pY3JvY29kZQoKTm8gYWN0dWFsIHVjb2RlIGxvYWRpbmcgd2lsbCBoYXBwZW4gYW5kIHRoaXMg
c2l0dWF0aW9uIGNhbiBiZSBxdWl0ZQpjb25mdXNpbmcuIEZpeCB0aGlzIGJ5IHN0YXJ0aW5nIHVj
b2RlIHVwZGF0ZSBvbmx5IHdoZW4gYSBuZXdlciB1Y29kZQpyZXZpc2lvbiBoYXMgYmVlbiBwcm92
aWRlZC4gVGhpcyBpcyBiYXNlZCBvbiBhbiBhc3N1bXB0aW9uIHRoYXQgYWxsIENQVXMKaW4gdGhl
IHN5c3RlbSBoYXZlIHRoZSBzYW1lIHVjb2RlIHJldmlzaW9uLiBJZiB0aGF0J3Mgbm90IHRoZSBj
YXNlLAp0aGUgc3lzdGVtIG11c3QgYmUgY29uc2lkZXJlZCB1bnN0YWJsZS4KCkFkZGl0aW9uYWxs
eSwgcHJpbnQgYSB1c2VyIGZyaWVuZGx5IG1lc3NhZ2UgaWYgbm8gbmV3ZXIgdWNvZGUgY2FuIGJl
CmZvdW5kLiBUaGlzIGFsc28gcmVxdWlyZXMgaWdub3JpbmcgLUVOT0RBVEEgaW4gQU1ELXNpZGUg
Y29kZSwgb3RoZXJ3aXNlCnRoZSBtZXNzYWdlIGdpdmVuIHRvIHVzZXIgaXM6CgogICAgKFhFTikg
UGFyc2luZyBtaWNyb2NvZGUgYmxvYiBlcnJvciAtNjEKCldoaWNoIGFjdHVhbGx5IG1lYW5zIHRo
YXQgYSB1Y29kZSBibG9iIHdhcyBwYXJzZWQgZmluZSwgYnV0IG5vIG1hdGNoaW5nCnVjb2RlIHdh
cyBmb3VuZC4KClNpZ25lZC1vZmYtYnk6IFNlcmdleSBEeWFzbGkgPHNlcmdleS5keWFzbGlAY2l0
cml4LmNvbT4KLS0tCkNDOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CkNDOiBBbmRy
ZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgpDQzogUm9nZXIgUGF1IE1vbm7D
qSA8cm9nZXIucGF1QGNpdHJpeC5jb20+CkNDOiBDaGFvIEdhbyA8Y2hhby5nYW9AaW50ZWwuY29t
PgpDQzogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgotLS0KIHhlbi9hcmNoL3g4Ni9t
aWNyb2NvZGUuYyAgICAgICB8IDIgKysKIHhlbi9hcmNoL3g4Ni9taWNyb2NvZGVfYW1kLmMgICB8
IDQgKystLQogeGVuL2FyY2gveDg2L21pY3JvY29kZV9pbnRlbC5jIHwgMiArLQogMyBmaWxlcyBj
aGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVu
L2FyY2gveDg2L21pY3JvY29kZS5jIGIveGVuL2FyY2gveDg2L21pY3JvY29kZS5jCmluZGV4IDY1
ZDFmNDFlN2MuLjI1NTYxMzU2OWQgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9taWNyb2NvZGUu
YworKysgYi94ZW4vYXJjaC94ODYvbWljcm9jb2RlLmMKQEAgLTY0MSw2ICs2NDEsOCBAQCBpbnQg
bWljcm9jb2RlX3VwZGF0ZShYRU5fR1VFU1RfSEFORExFX1BBUkFNKGNvbnN0X3ZvaWQpIGJ1Ziwg
dW5zaWduZWQgbG9uZyBsZW4pCiAgICAgaWYgKCAhcGF0Y2ggKQogICAgIHsKICAgICAgICAgcmV0
ID0gLUVOT0VOVDsKKyAgICAgICAgcHJpbnRrKFhFTkxPR19XQVJOSU5HICJtaWNyb2NvZGU6IGNv
dWxkbid0IGZpbmQgYW55IG5ld2VyIHJldmlzaW9uIGluICIKKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICJ0aGUgcHJvdmlkZWQgYmxvYiFcbiIpOwogICAgICAgICBnb3RvIHB1dDsKICAg
ICB9CiAKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9taWNyb2NvZGVfYW1kLmMgYi94ZW4vYXJj
aC94ODYvbWljcm9jb2RlX2FtZC5jCmluZGV4IDFlNTJmN2Y0OWEuLmRkODFiNTIzOWEgMTAwNjQ0
Ci0tLSBhL3hlbi9hcmNoL3g4Ni9taWNyb2NvZGVfYW1kLmMKKysrIGIveGVuL2FyY2gveDg2L21p
Y3JvY29kZV9hbWQuYwpAQCAtNTE4LDcgKzUxOCw3IEBAIHN0YXRpYyBzdHJ1Y3QgbWljcm9jb2Rl
X3BhdGNoICpjcHVfcmVxdWVzdF9taWNyb2NvZGUoY29uc3Qgdm9pZCAqYnVmLAogICAgICAgICAg
KiBJZiB0aGUgbmV3IHVjb2RlIGNvdmVycyBjdXJyZW50IENQVSwgY29tcGFyZSB1Y29kZXMgYW5k
IHN0b3JlIHRoZQogICAgICAgICAgKiBvbmUgd2l0aCBoaWdoZXIgcmV2aXNpb24uCiAgICAgICAg
ICAqLwotICAgICAgICBpZiAoIChtaWNyb2NvZGVfZml0cyhtY19hbWQpICE9IE1JU19VQ09ERSkg
JiYKKyAgICAgICAgaWYgKCAobWljcm9jb2RlX2ZpdHMobWNfYW1kKSA9PSBORVdfVUNPREUpICYm
CiAgICAgICAgICAgICAgKCFzYXZlZCB8fCAoY29tcGFyZV9oZWFkZXIobWNfYW1kLT5tcGIsIHNh
dmVkKSA9PSBORVdfVUNPREUpKSApCiAgICAgICAgIHsKICAgICAgICAgICAgIHhmcmVlKHNhdmVk
KTsKQEAgLTU3Niw3ICs1NzYsNyBAQCBzdGF0aWMgc3RydWN0IG1pY3JvY29kZV9wYXRjaCAqY3B1
X3JlcXVlc3RfbWljcm9jb2RlKGNvbnN0IHZvaWQgKmJ1ZiwKICAgICAgICAgZnJlZV9wYXRjaCht
Y19hbWQpOwogCiAgIG91dDoKLSAgICBpZiAoIGVycm9yICYmICFwYXRjaCApCisgICAgaWYgKCBl
cnJvciAmJiBlcnJvciAhPSAtRU5PREFUQSAmJiAhcGF0Y2ggKQogICAgICAgICBwYXRjaCA9IEVS
Ul9QVFIoZXJyb3IpOwogCiAgICAgcmV0dXJuIHBhdGNoOwpkaWZmIC0tZ2l0IGEveGVuL2FyY2gv
eDg2L21pY3JvY29kZV9pbnRlbC5jIGIveGVuL2FyY2gveDg2L21pY3JvY29kZV9pbnRlbC5jCmlu
ZGV4IDlmNjYwNTdhYWQuLmE3NmI4NjAyMjYgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9taWNy
b2NvZGVfaW50ZWwuYworKysgYi94ZW4vYXJjaC94ODYvbWljcm9jb2RlX2ludGVsLmMKQEAgLTM3
Nyw3ICszNzcsNyBAQCBzdGF0aWMgc3RydWN0IG1pY3JvY29kZV9wYXRjaCAqY3B1X3JlcXVlc3Rf
bWljcm9jb2RlKGNvbnN0IHZvaWQgKmJ1ZiwKICAgICAgICAgICogSWYgdGhlIG5ldyB1cGRhdGUg
Y292ZXJzIGN1cnJlbnQgQ1BVLCBjb21wYXJlIHVwZGF0ZXMgYW5kIHN0b3JlIHRoZQogICAgICAg
ICAgKiBvbmUgd2l0aCBoaWdoZXIgcmV2aXNpb24uCiAgICAgICAgICAqLwotICAgICAgICBpZiAo
IChtaWNyb2NvZGVfdXBkYXRlX21hdGNoKCZtYy0+aGRyKSAhPSBNSVNfVUNPREUpICYmCisgICAg
ICAgIGlmICggKG1pY3JvY29kZV91cGRhdGVfbWF0Y2goJm1jLT5oZHIpID09IE5FV19VQ09ERSkg
JiYKICAgICAgICAgICAgICAoIXNhdmVkIHx8IChtYy0+aGRyLnJldiA+IHNhdmVkLT5oZHIucmV2
KSkgKQogICAgICAgICB7CiAgICAgICAgICAgICB4ZnJlZShzYXZlZCk7Ci0tIAoyLjE3LjEKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
