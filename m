Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FBA427A88
	for <lists+xen-devel@lfdr.de>; Thu, 23 May 2019 12:29:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hTkwK-0004f7-HM; Thu, 23 May 2019 10:27:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=52eM=TX=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hTkwJ-0004f2-JR
 for xen-devel@lists.xenproject.org; Thu, 23 May 2019 10:27:11 +0000
X-Inumbo-ID: 50477ffe-7d45-11e9-a1f2-8b667931a91e
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 50477ffe-7d45-11e9-a1f2-8b667931a91e;
 Thu, 23 May 2019 10:27:07 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL01.citrite.net
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=23.29.105.83; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 23.29.105.83 as
 permitted sender) identity=mailfrom; client-ip=23.29.105.83;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:23.29.105.83 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL01.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL01.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: ad6CYnaea4sN/IeB2X9BVdKUwqyqVOxTQhrRnszX2raT2eRGOp9MTztys6KT6dIbphs6OiXXEJ
 Ypb+MBl9+TGaiqPmTt2/7Wq5pktM4FPRoxnU95GZmXyP1EmPa1Qoe1ClRJ+s8Urmr+Z5t4TVlA
 gVzrbW4yWS3xKWLtc8cxYjc3u0ytwxndgEuk2wE52XWwiQw12SbR1s7OfYifC39vHwVspvwjxx
 H+4Z5VwdNw4RCM3X/kQfG2X/G+BbMbzRsf/4X/6jnFPapoA4UJtkRo0TScGfxGf4ODkLkHF0Rr
 +xY=
X-SBRS: 2.7
X-MesageID: 821092
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,502,1549947600"; 
   d="scan'208";a="821092"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Thu, 23 May 2019 11:27:03 +0100
Message-ID: <1558607223-19630-1-git-send-email-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1558540230-26612-1-git-send-email-andrew.cooper3@citrix.com>
References: <1558540230-26612-1-git-send-email-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] libx86: Introduce wrappers for extracting
 XCR0/XSS from a cpuid policy
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBhdm9pZHMgb3BlbmNvZGluZyB0aGUgc2xpZ2h0bHktYXdrd2FyZCBsb2dpYy4gIE1vcmUg
dXNlcyBvZiB0aGVzZQp3cmFwcGVycyB3aWxsIGJlIGludHJvZHVjZWQgc2hvcnRseS4KClNpZ25l
ZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Ci0tLQpD
QzogSmFuIEJldWxpY2ggPEpCZXVsaWNoQHN1c2UuY29tPgpDQzogV2VpIExpdSA8d2VpLmxpdTJA
Y2l0cml4LmNvbT4KQ0M6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgoK
SSd2ZSBkZWNpZGVkIHRvIGludHJvZHVjZSB0aGlzIHBhdGNoIGFoZWFkIG9mICJbUEFUQ0hdIGxp
Yng4NjogRWxpZGUgbW9yZQplbXB0eSBDUFVJRCBsZWF2ZXMgd2hlbiBzZXJpYWxpc2luZyBhIHBv
bGljeSIgKHdoaWNoIHNpbXBsaWZpZXMgdGhlIHhzdGF0ZQpodW5rIGEgbGl0dGxlKSBhcyBJJ3Zl
IGZvdW5kIHlldCBtb3JlIGNhc2VzIHdoZXJlIEkgbmVlZCB0byB1c2UKY3B1aWRfcG9saWN5X3hz
dGF0ZXMoKSwgYW5kIG9wZW5jb2RpbmcgdGhlbSBhbGwgc2VlbWVkIHZlcnkgc2lsbHkuCi0tLQog
eGVuL2FyY2gveDg2L3hzdGF0ZS5jICAgICAgICAgICB8ICA4ICsrLS0tLS0tCiB4ZW4vaW5jbHVk
ZS94ZW4vbGliL3g4Ni9jcHVpZC5oIHwgMTIgKysrKysrKysrKysrCiB4ZW4vbGliL3g4Ni9jcHVp
ZC5jICAgICAgICAgICAgIHwgIDMgKy0tCiAzIGZpbGVzIGNoYW5nZWQsIDE1IGluc2VydGlvbnMo
KyksIDggZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L3hzdGF0ZS5jIGIv
eGVuL2FyY2gveDg2L3hzdGF0ZS5jCmluZGV4IDNkYTYwOWEuLjA0ZGE1NjkgMTAwNjQ0Ci0tLSBh
L3hlbi9hcmNoL3g4Ni94c3RhdGUuYworKysgYi94ZW4vYXJjaC94ODYveHN0YXRlLmMKQEAgLTY2
MCw5ICs2NjAsNyBAQCBzdGF0aWMgYm9vbCB2YWxpZF94Y3IwKHU2NCB4Y3IwKQogaW50IHZhbGlk
YXRlX3hzdGF0ZShjb25zdCBzdHJ1Y3QgZG9tYWluICpkLCB1aW50NjRfdCB4Y3IwLCB1aW50NjRf
dCB4Y3IwX2FjY3VtLAogICAgICAgICAgICAgICAgICAgICBjb25zdCBzdHJ1Y3QgeHNhdmVfaGRy
ICpoZHIpCiB7Ci0gICAgY29uc3Qgc3RydWN0IGNwdWlkX3BvbGljeSAqY3AgPSBkLT5hcmNoLmNw
dWlkOwotICAgIHVpbnQ2NF90IHhjcjBfbWF4ID0KLSAgICAgICAgKCh1aW50NjRfdCljcC0+eHN0
YXRlLnhjcjBfaGlnaCA8PCAzMikgfCBjcC0+eHN0YXRlLnhjcjBfbG93OworICAgIHVpbnQ2NF90
IHhjcjBfbWF4ID0gY3B1aWRfcG9saWN5X3hjcjAoZC0+YXJjaC5jcHVpZCk7CiAgICAgdW5zaWdu
ZWQgaW50IGk7CiAKICAgICBpZiAoIChoZHItPnhzdGF0ZV9idiAmIH54Y3IwX2FjY3VtKSB8fApA
QCAtNjg2LDkgKzY4NCw3IEBAIGludCB2YWxpZGF0ZV94c3RhdGUoY29uc3Qgc3RydWN0IGRvbWFp
biAqZCwgdWludDY0X3QgeGNyMCwgdWludDY0X3QgeGNyMF9hY2N1bSwKIGludCBoYW5kbGVfeHNl
dGJ2KHUzMiBpbmRleCwgdTY0IG5ld19idikKIHsKICAgICBzdHJ1Y3QgdmNwdSAqY3VyciA9IGN1
cnJlbnQ7Ci0gICAgY29uc3Qgc3RydWN0IGNwdWlkX3BvbGljeSAqY3AgPSBjdXJyLT5kb21haW4t
PmFyY2guY3B1aWQ7Ci0gICAgdWludDY0X3QgeGNyMF9tYXggPQotICAgICAgICAoKHVpbnQ2NF90
KWNwLT54c3RhdGUueGNyMF9oaWdoIDw8IDMyKSB8IGNwLT54c3RhdGUueGNyMF9sb3c7CisgICAg
dWludDY0X3QgeGNyMF9tYXggPSBjcHVpZF9wb2xpY3lfeGNyMChjdXJyLT5kb21haW4tPmFyY2gu
Y3B1aWQpOwogICAgIHU2NCBtYXNrOwogCiAgICAgaWYgKCBpbmRleCAhPSBYQ1JfWEZFQVRVUkVf
RU5BQkxFRF9NQVNLICkKZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL3hlbi9saWIveDg2L2NwdWlk
LmggYi94ZW4vaW5jbHVkZS94ZW4vbGliL3g4Ni9jcHVpZC5oCmluZGV4IDI1MmQyYzkuLmVhNGRi
NWIgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL3hlbi9saWIveDg2L2NwdWlkLmgKKysrIGIveGVu
L2luY2x1ZGUveGVuL2xpYi94ODYvY3B1aWQuaApAQCAtMzA4LDYgKzMwOCwxOCBAQCBzdGF0aWMg
aW5saW5lIHZvaWQgY3B1aWRfZmVhdHVyZXNldF90b19wb2xpY3koCiAgICAgcC0+ZmVhdC5fN2Ex
ICA9IGZzW0ZFQVRVUkVTRVRfN2ExXTsKIH0KIAorc3RhdGljIGlubGluZSB1aW50NjRfdCBjcHVp
ZF9wb2xpY3lfeGNyMChjb25zdCBzdHJ1Y3QgY3B1aWRfcG9saWN5ICpwKQoreworICAgIHJldHVy
biAoKHVpbnQ2NF90KXAtPnhzdGF0ZS54Y3IwX2hpZ2ggPDwgMzIpIHwgcC0+eHN0YXRlLnhjcjBf
bG93OworfQorCitzdGF0aWMgaW5saW5lIHVpbnQ2NF90IGNwdWlkX3BvbGljeV94c3RhdGVzKGNv
bnN0IHN0cnVjdCBjcHVpZF9wb2xpY3kgKnApCit7CisgICAgdWludDY0X3QgdmFsID0gcC0+eHN0
YXRlLnhjcjBfaGlnaCB8IHAtPnhzdGF0ZS54c3NfaGlnaDsKKworICAgIHJldHVybiAodmFsIDw8
IDMyKSB8IHAtPnhzdGF0ZS54Y3IwX2xvdyB8IHAtPnhzdGF0ZS54c3NfbG93OworfQorCiBjb25z
dCB1aW50MzJfdCAqeDg2X2NwdWlkX2xvb2t1cF9kZWVwX2RlcHModWludDMyX3QgZmVhdHVyZSk7
CiAKIC8qKgpkaWZmIC0tZ2l0IGEveGVuL2xpYi94ODYvY3B1aWQuYyBiL3hlbi9saWIveDg2L2Nw
dWlkLmMKaW5kZXggMjM2MTljNy4uNzRjNWIxOCAxMDA2NDQKLS0tIGEveGVuL2xpYi94ODYvY3B1
aWQuYworKysgYi94ZW4vbGliL3g4Ni9jcHVpZC5jCkBAIC0xNDQsOCArMTQ0LDcgQEAgdm9pZCB4
ODZfY3B1aWRfcG9saWN5X2ZpbGxfbmF0aXZlKHN0cnVjdCBjcHVpZF9wb2xpY3kgKnApCiAgICAg
ICAgIGNwdWlkX2NvdW50X2xlYWYoMHhkLCAwLCAmcC0+eHN0YXRlLnJhd1swXSk7CiAgICAgICAg
IGNwdWlkX2NvdW50X2xlYWYoMHhkLCAxLCAmcC0+eHN0YXRlLnJhd1sxXSk7CiAKLSAgICAgICAg
eHN0YXRlcyAgPSAoKHVpbnQ2NF90KShwLT54c3RhdGUueGNyMF9oaWdoIHwgcC0+eHN0YXRlLnhz
c19oaWdoKSA8PCAzMik7Ci0gICAgICAgIHhzdGF0ZXMgfD0gICAgICAgICAgICAocC0+eHN0YXRl
LnhjcjBfbG93ICB8IHAtPnhzdGF0ZS54c3NfbG93KTsKKyAgICAgICAgeHN0YXRlcyA9IGNwdWlk
X3BvbGljeV94c3RhdGVzKHApOwogCiAgICAgICAgIGZvciAoIGkgPSAyOyBpIDwgbWluX3QodW5z
aWduZWQgaW50LCA2MywKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBBUlJBWV9TSVpF
KHAtPnhzdGF0ZS5yYXcpKTsgKytpICkKLS0gCjIuMS40CgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
