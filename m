Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 332FE18F290
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2020 11:20:13 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jGK9K-0007VP-9J; Mon, 23 Mar 2020 10:17:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0LFc=5I=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jGK9I-0007V9-E6
 for xen-devel@lists.xenproject.org; Mon, 23 Mar 2020 10:17:36 +0000
X-Inumbo-ID: 83b2b51c-6cef-11ea-bec1-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 83b2b51c-6cef-11ea-bec1-bc764e2007e4;
 Mon, 23 Mar 2020 10:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1584958655;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NsMWDE7OwbNOm1ai+erLnQ/LhuB+0yZ90hzjAPNiNqA=;
 b=EnwnUPiFeASMTqH7qvDa6bDCr5LmFjNaEkmI01KPIJ13k3af+JVkHFOy
 cUAf+7B4SB8zO/yU0vaILUwGAEllYKix3yi2tjcHnRYxH9BveNZkT+vJH
 O9hGbCuZXVLHQoggiDJCSfCbATWm7hUJKg1jmgxou3gwbA8sJKDjwGot9 s=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
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
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: KNXa4Ac0u2amlyDvJh5MU16AJngNhYxgCGTCRhhRoN+tEIEtoLInY74p91IzAaCFTsvPWmjy3O
 miOT/WpeAqDNyOzDSAf/bi86P81vx11vf/l/Wrx2PsYan1mrZ2/vmF7te8EH0BxRH5qsRMcvts
 1VGNo2Ds9UQigxPnadeE3RcSPD0uR5/tsIp932VWYth3IyYdaxYd8G1bciEr1LBdPbLO8H+TRZ
 NnCWGqHZCZsjRBa0VO6mgegwIdbdQRsTGiAn/YJnejCyqsESFn4ZSDNdv5KUe2dk/q/zmkQv73
 Qac=
X-SBRS: 2.7
X-MesageID: 15099728
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,296,1580792400"; d="scan'208";a="15099728"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Mon, 23 Mar 2020 10:17:21 +0000
Message-ID: <20200323101724.15655-5-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200323101724.15655-1-andrew.cooper3@citrix.com>
References: <20200323101724.15655-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 4/7] x86/ucode/intel: Reimplement get_{data,
 total}size() helpers
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RXZlcnkgY2FsbGVyIGFjdHVhbGx5IHBhc3NlcyBhIHN0cnVjdCBtaWNyb2NvZGVfaGVhZGVyX2lu
dGVsLiAgSW1wbGVtZW50IHRoZQpoZWxwZXJzIHdpdGggcHJvcGVyIHR5cGVzLCBhbmQgbGVhdmUg
YSBjb21tZW50IGV4cGxhaW5pbmcgdGhlIFBlbnRpdW0gUHJvL0lJCmJlaGF2aW91ciB3aXRoIGVt
cHR5IHtkYXRhLHRvdGFsfXNpemUgZmllbGRzLgoKTm8gZnVuY3Rpb25hbCBjaGFuZ2UuCgpTaWdu
ZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgotLS0K
Q0M6IEphbiBCZXVsaWNoIDxKQmV1bGljaEBzdXNlLmNvbT4KQ0M6IFdlaSBMaXUgPHdsQHhlbi5v
cmc+CkNDOiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KLS0tCiB4ZW4v
YXJjaC94ODYvY3B1L21pY3JvY29kZS9pbnRlbC5jIHwgMzIgKysrKysrKysrKysrKysrKysrKyst
LS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAyMCBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvY3B1L21pY3JvY29kZS9pbnRlbC5jIGIv
eGVuL2FyY2gveDg2L2NwdS9taWNyb2NvZGUvaW50ZWwuYwppbmRleCAwY2NlYWM2MjU1Li5kZmU0
NDY3OWJlIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvY3B1L21pY3JvY29kZS9pbnRlbC5jCisr
KyBiL3hlbi9hcmNoL3g4Ni9jcHUvbWljcm9jb2RlL2ludGVsLmMKQEAgLTQ2LDkgKzQ2LDE2IEBA
IHN0cnVjdCBtaWNyb2NvZGVfaGVhZGVyX2ludGVsIHsKICAgICB1bnNpZ25lZCBpbnQgc2lnOwog
ICAgIHVuc2lnbmVkIGludCBja3N1bTsKICAgICB1bnNpZ25lZCBpbnQgbGRydmVyOworCisgICAg
LyoKKyAgICAgKiBNaWNyb2NvZGUgZm9yIHRoZSBQZW50aXVtIFBybyBhbmQgSUkgaGFkIGFsbCBm
dXJ0aGVyIGZpZWxkcyBpbiB0aGUKKyAgICAgKiBoZWFkZXIgcmVzZXJ2ZWQsIGhhZCBhIGZpeGVk
IGRhdGFzaXplIG9mIDIwMDAgYW5kIHRvdGFsc2l6ZSBvZiAyMDQ4LAorICAgICAqIGFuZCBkaWRu
J3QgdXNlIHBsYXRmb3JtIGZsYWdzIGRlc3BpdGUgdGhlIGF2YWlsYWJpbGl0eSBvZiB0aGUgTVNS
LgorICAgICAqLworCiAgICAgdW5zaWduZWQgaW50IHBmOwotICAgIHVuc2lnbmVkIGludCBkYXRh
c2l6ZTsKLSAgICB1bnNpZ25lZCBpbnQgdG90YWxzaXplOworICAgIHVuc2lnbmVkIGludCBfZGF0
YXNpemU7CisgICAgdW5zaWduZWQgaW50IF90b3RhbHNpemU7CiAgICAgdW5zaWduZWQgaW50IHJl
c2VydmVkWzNdOwogfTsKIApAQCAtNzUsMjAgKzgyLDIxIEBAIHN0cnVjdCBtaWNyb2NvZGVfcGF0
Y2ggewogICAgIHN0cnVjdCBtaWNyb2NvZGVfaW50ZWwgKm1jX2ludGVsOwogfTsKIAotI2RlZmlu
ZSBERUZBVUxUX1VDT0RFX0RBVEFTSVpFICAoMjAwMCkKKyNkZWZpbmUgUFBST19VQ09ERV9EQVRB
U0laRSAgICAgMjAwMAogI2RlZmluZSBNQ19IRUFERVJfU0laRSAgICAgICAgICAoc2l6ZW9mKHN0
cnVjdCBtaWNyb2NvZGVfaGVhZGVyX2ludGVsKSkKLSNkZWZpbmUgREVGQVVMVF9VQ09ERV9UT1RB
TFNJWkUgKERFRkFVTFRfVUNPREVfREFUQVNJWkUgKyBNQ19IRUFERVJfU0laRSkKICNkZWZpbmUg
RVhUX0hFQURFUl9TSVpFICAgICAgICAgKHNpemVvZihzdHJ1Y3QgZXh0ZW5kZWRfc2lndGFibGUp
KQogI2RlZmluZSBFWFRfU0lHTkFUVVJFX1NJWkUgICAgICAoc2l6ZW9mKHN0cnVjdCBleHRlbmRl
ZF9zaWduYXR1cmUpKQogI2RlZmluZSBEV1NJWkUgICAgICAgICAgICAgICAgICAoc2l6ZW9mKHUz
MikpCi0jZGVmaW5lIGdldF90b3RhbHNpemUobWMpIFwKLSAgICAgICAgKCgoc3RydWN0IG1pY3Jv
Y29kZV9pbnRlbCAqKW1jKS0+aGRyLnRvdGFsc2l6ZSA/IFwKLSAgICAgICAgICgoc3RydWN0IG1p
Y3JvY29kZV9pbnRlbCAqKW1jKS0+aGRyLnRvdGFsc2l6ZSA6IFwKLSAgICAgICAgIERFRkFVTFRf
VUNPREVfVE9UQUxTSVpFKQotCi0jZGVmaW5lIGdldF9kYXRhc2l6ZShtYykgXAotICAgICAgICAo
KChzdHJ1Y3QgbWljcm9jb2RlX2ludGVsICopbWMpLT5oZHIuZGF0YXNpemUgPyBcCi0gICAgICAg
ICAoKHN0cnVjdCBtaWNyb2NvZGVfaW50ZWwgKiltYyktPmhkci5kYXRhc2l6ZSA6IERFRkFVTFRf
VUNPREVfREFUQVNJWkUpCisKK3N0YXRpYyB1aW50MzJfdCBnZXRfZGF0YXNpemUoY29uc3Qgc3Ry
dWN0IG1pY3JvY29kZV9oZWFkZXJfaW50ZWwgKmhkcikKK3sKKyAgICByZXR1cm4gaGRyLT5fZGF0
YXNpemUgPzogUFBST19VQ09ERV9EQVRBU0laRTsKK30KKworc3RhdGljIHVpbnQzMl90IGdldF90
b3RhbHNpemUoY29uc3Qgc3RydWN0IG1pY3JvY29kZV9oZWFkZXJfaW50ZWwgKmhkcikKK3sKKyAg
ICByZXR1cm4gaGRyLT5fdG90YWxzaXplID86IFBQUk9fVUNPREVfREFUQVNJWkUgKyBNQ19IRUFE
RVJfU0laRTsKK30KIAogI2RlZmluZSBzaWdtYXRjaChzMSwgczIsIHAxLCBwMikgXAogICAgICAg
ICAoKChzMSkgPT0gKHMyKSkgJiYgKCgocDEpICYgKHAyKSkgfHwgKCgocDEpID09IDApICYmICgo
cDIpID09IDApKSkpCi0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
