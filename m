Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E627B18F29A
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2020 11:20:56 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jGK9h-0007hC-Tn; Mon, 23 Mar 2020 10:18:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0LFc=5I=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jGK9f-0007g5-Ip
 for xen-devel@lists.xenproject.org; Mon, 23 Mar 2020 10:17:59 +0000
X-Inumbo-ID: 917515f0-6cef-11ea-829d-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 917515f0-6cef-11ea-829d-12813bfff9fa;
 Mon, 23 Mar 2020 10:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1584958678;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Sxrnn/HeXrku8q3Uxl6x5vwRPlCId0vHiJDnUachLKs=;
 b=AI1fMvmyXgJJ+EhVY+VxJvuu5UHWNDCAXyjjJvZk8tbt+nwWN8XNu73J
 jQieYs1mA9PwTOTCyzOcRxhSUn/f1GpT/bKkANCcttAgAyKEG3zzLeosl
 NN/daXGth3qYMf5BJdwhp2DF7Y51tO/+HAWRsgbfVptOxMq6G4/zHHM1E w=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
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
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: O9D3cZ3CyTubtCl/3yyBugdPbrryv9m1z6uZ8fS/Lx/iIuT4VMtjXrH6iJ+4chpiPS0ItyzPtt
 LZP5mChQCXrxB1daYh7jdA1C9bqBS6ZPbqANirvj+jcPhjHEejEgCGzwFdJvjjjVd/++dn1q/d
 Z51rcD+0YpclDytECYrZ+WM2stze2S2vOpBKcXUu/SN4DddDDJaWrN+SUB8FQYbdQ8RgOxU/QW
 tJoSk2bf7P09ucttqBfe0T9qmrI+Tu6MQpWhO6mScbHDcVCeC+QpbTBIr76PhA3jXfyUBKoqjP
 mWc=
X-SBRS: 2.7
X-MesageID: 14788287
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,296,1580792400"; d="scan'208";a="14788287"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Mon, 23 Mar 2020 10:17:23 +0000
Message-ID: <20200323101724.15655-7-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200323101724.15655-1-andrew.cooper3@citrix.com>
References: <20200323101724.15655-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 6/7] x86/ucode/intel: Clean up
 microcode_sanity_check()
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

UmV3cml0ZSB0aGUgc2l6ZSBjaGVja3MgaW4gYSB3YXkgd2hpY2ggd2hpY2ggZG9lc24ndCBkZXBl
bmQgb24gWGVuIGJlaW5nCmNvbXBpbGVkIGFzIDY0Yml0LgoKSW50cm9kdWNlIGEgY2hlY2sgbWlz
c2luZyBmcm9tIHRoZSBvbGQgY29kZSwgdGhhdCB0b3RhbF9zaXplIGlzIGEgbXVsdGlwbGUgb2YK
MTAyNCBieXRlcywgYW5kIGRyb3AgdW5uZWNlc3NhcmlseSBkZWZpbmVzL21hY3Jvcy9zdHJ1Y3R1
cmVzLgoKTm8gcHJhY3RpY2FsIGNoYW5nZSBpbiBiZWhhdmlvdXIuCgpTaWduZWQtb2ZmLWJ5OiBB
bmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgotLS0KQ0M6IEphbiBCZXVs
aWNoIDxKQmV1bGljaEBzdXNlLmNvbT4KQ0M6IFdlaSBMaXUgPHdsQHhlbi5vcmc+CkNDOiBSb2dl
ciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KLS0tCiB4ZW4vYXJjaC94ODYvY3B1
L21pY3JvY29kZS9pbnRlbC5jIHwgMTQ3ICsrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA1OCBpbnNlcnRpb25zKCspLCA4OSBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvY3B1L21pY3JvY29kZS9pbnRlbC5jIGIveGVuL2Fy
Y2gveDg2L2NwdS9taWNyb2NvZGUvaW50ZWwuYwppbmRleCBiYzNiYmYxMzllLi4yY2NjZjljMjZk
IDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvY3B1L21pY3JvY29kZS9pbnRlbC5jCisrKyBiL3hl
bi9hcmNoL3g4Ni9jcHUvbWljcm9jb2RlL2ludGVsLmMKQEAgLTY1LDE3ICs2NSwxNSBAQCBzdHJ1
Y3QgbWljcm9jb2RlX2ludGVsIHsKIH07CiAKIC8qIG1pY3JvY29kZSBmb3JtYXQgaXMgZXh0ZW5k
ZWQgZnJvbSBwcmVzY290dCBwcm9jZXNzb3JzICovCi1zdHJ1Y3QgZXh0ZW5kZWRfc2lnbmF0dXJl
IHsKLSAgICB1bnNpZ25lZCBpbnQgc2lnOwotICAgIHVuc2lnbmVkIGludCBwZjsKLSAgICB1bnNp
Z25lZCBpbnQgY2tzdW07Ci19OwotCiBzdHJ1Y3QgZXh0ZW5kZWRfc2lndGFibGUgewogICAgIHVu
c2lnbmVkIGludCBjb3VudDsKICAgICB1bnNpZ25lZCBpbnQgY2tzdW07CiAgICAgdW5zaWduZWQg
aW50IHJlc2VydmVkWzNdOwotICAgIHN0cnVjdCBleHRlbmRlZF9zaWduYXR1cmUgc2lnc1swXTsK
KyAgICBzdHJ1Y3QgeworICAgICAgICB1bnNpZ25lZCBpbnQgc2lnOworICAgICAgICB1bnNpZ25l
ZCBpbnQgcGY7CisgICAgICAgIHVuc2lnbmVkIGludCBja3N1bTsKKyAgICB9IHNpZ3NbXTsKIH07
CiAKIHN0cnVjdCBtaWNyb2NvZGVfcGF0Y2ggewpAQCAtODQsOSArODIsNiBAQCBzdHJ1Y3QgbWlj
cm9jb2RlX3BhdGNoIHsKIAogI2RlZmluZSBQUFJPX1VDT0RFX0RBVEFTSVpFICAgICAyMDAwCiAj
ZGVmaW5lIE1DX0hFQURFUl9TSVpFICAgICAgICAgIChzaXplb2Yoc3RydWN0IG1pY3JvY29kZV9o
ZWFkZXJfaW50ZWwpKQotI2RlZmluZSBFWFRfSEVBREVSX1NJWkUgICAgICAgICAoc2l6ZW9mKHN0
cnVjdCBleHRlbmRlZF9zaWd0YWJsZSkpCi0jZGVmaW5lIEVYVF9TSUdOQVRVUkVfU0laRSAgICAg
IChzaXplb2Yoc3RydWN0IGV4dGVuZGVkX3NpZ25hdHVyZSkpCi0jZGVmaW5lIERXU0laRSAgICAg
ICAgICAgICAgICAgIChzaXplb2YodTMyKSkKIAogc3RhdGljIHVpbnQzMl90IGdldF9kYXRhc2l6
ZShjb25zdCBzdHJ1Y3QgbWljcm9jb2RlX2hlYWRlcl9pbnRlbCAqaGRyKQogewpAQCAtMTM0LDgg
KzEyOSw2IEBAIHN0YXRpYyBib29sIHNpZ25hdHVyZV9tYWNoZXMoY29uc3Qgc3RydWN0IGNwdV9z
aWduYXR1cmUgKmNwdV9zaWcsCiAgICAgcmV0dXJuIGNwdV9zaWctPnBmICYgdWNvZGVfcGY7CiB9
CiAKLSNkZWZpbmUgZXh0dGFibGVfc2l6ZShldCkgKChldCktPmNvdW50ICogRVhUX1NJR05BVFVS
RV9TSVpFICsgRVhUX0hFQURFUl9TSVpFKQotCiBzdGF0aWMgaW50IGNvbGxlY3RfY3B1X2luZm8o
c3RydWN0IGNwdV9zaWduYXR1cmUgKmNzaWcpCiB7CiAgICAgdWludDY0X3QgbXNyX2NvbnRlbnQ7
CkBAIC0xNjAsOTMgKzE1Myw2OSBAQCBzdGF0aWMgaW50IGNvbGxlY3RfY3B1X2luZm8oc3RydWN0
IGNwdV9zaWduYXR1cmUgKmNzaWcpCiAgICAgcmV0dXJuIDA7CiB9CiAKKy8qCisgKiBTYW5pdHkg
Y2hlY2sgYSBibG9iIHdoaWNoIGlzIGV4cGVjdGVkIHRvIGJlIGEgbWljcm9jb2RlIHBhdGNoLiAg
VGhlIDQ4IGJ5dGUKKyAqIGhlYWRlciBpcyBvZiBhIGtub3duIGZvcm1hdCwgYW5kIHRvZ2V0aGVy
IHdpdGggdG90YWxzaXplIGFyZSB3aXRoaW4gdGhlCisgKiBib3VuZHMgb2YgdGhlIGNvbnRhaW5l
ci4gIEV2ZXJ5dGhpbmcgZWxzZSBpcyB1bmNoZWNrZWQuCisgKi8KIHN0YXRpYyBpbnQgbWljcm9j
b2RlX3Nhbml0eV9jaGVjayhjb25zdCBzdHJ1Y3QgbWljcm9jb2RlX2ludGVsICptYykKIHsKLSAg
ICBjb25zdCBzdHJ1Y3QgbWljcm9jb2RlX2hlYWRlcl9pbnRlbCAqbWNfaGVhZGVyID0gJm1jLT5o
ZHI7Ci0gICAgY29uc3Qgc3RydWN0IGV4dGVuZGVkX3NpZ3RhYmxlICpleHRfaGVhZGVyID0gTlVM
TDsKLSAgICBjb25zdCBzdHJ1Y3QgZXh0ZW5kZWRfc2lnbmF0dXJlICpleHRfc2lnOwotICAgIHVu
c2lnbmVkIGxvbmcgdG90YWxfc2l6ZSwgZGF0YV9zaXplLCBleHRfdGFibGVfc2l6ZTsKLSAgICB1
bnNpZ25lZCBpbnQgZXh0X3NpZ2NvdW50ID0gMCwgaTsKLSAgICB1aW50MzJfdCBzdW0sIG9yaWdf
c3VtOwotCi0gICAgdG90YWxfc2l6ZSA9IGdldF90b3RhbHNpemUobWNfaGVhZGVyKTsKLSAgICBk
YXRhX3NpemUgPSBnZXRfZGF0YXNpemUobWNfaGVhZGVyKTsKLSAgICBpZiAoIChkYXRhX3NpemUg
KyBNQ19IRUFERVJfU0laRSkgPiB0b3RhbF9zaXplICkKLSAgICB7Ci0gICAgICAgIHByaW50ayhL
RVJOX0VSUiAibWljcm9jb2RlOiBlcnJvciEgIgotICAgICAgICAgICAgICAgIkJhZCBkYXRhIHNp
emUgaW4gbWljcm9jb2RlIGRhdGEgZmlsZVxuIik7CisgICAgY29uc3Qgc3RydWN0IGV4dGVuZGVk
X3NpZ3RhYmxlICpleHQ7CisgICAgdW5zaWduZWQgaW50IHRvdGFsX3NpemUgPSBnZXRfdG90YWxz
aXplKCZtYy0+aGRyKTsKKyAgICB1bnNpZ25lZCBpbnQgZGF0YV9zaXplID0gZ2V0X2RhdGFzaXpl
KCZtYy0+aGRyKTsKKyAgICB1bnNpZ25lZCBpbnQgaSwgZXh0X3NpemU7CisgICAgdWludDMyX3Qg
c3VtLCAqcHRyOworCisgICAgLyoKKyAgICAgKiBUb3RhbCBzaXplIG11c3QgYmUgYSBtdWx0aXBs
ZSBvZiAxMDI0IGJ5dGVzLiAgRGF0YSBzaXplIGFuZCB0aGUgaGVhZGVyCisgICAgICogbXVzdCBm
aXQgd2l0aGluIGl0LgorICAgICAqLworICAgIGlmICggKHRvdGFsX3NpemUgJiAxMDIzKSB8fAor
ICAgICAgICAgZGF0YV9zaXplID4gKHRvdGFsX3NpemUgLSBNQ19IRUFERVJfU0laRSkgKQogICAg
ICAgICByZXR1cm4gLUVJTlZBTDsKLSAgICB9CiAKLSAgICBpZiAoIChtY19oZWFkZXItPmxkcnZl
ciAhPSAxKSB8fCAobWNfaGVhZGVyLT5oZHJ2ZXIgIT0gMSkgKQotICAgIHsKLSAgICAgICAgcHJp
bnRrKEtFUk5fRVJSICJtaWNyb2NvZGU6IGVycm9yISAiCi0gICAgICAgICAgICAgICAiVW5rbm93
biBtaWNyb2NvZGUgdXBkYXRlIGZvcm1hdFxuIik7CisgICAgLyogQ2hlY2tzdW0gdGhlIG1haW4g
aGVhZGVyIGFuZCBkYXRhLiAqLworICAgIGZvciAoIHN1bSA9IDAsIHB0ciA9ICh1aW50MzJfdCAq
KW1jOworICAgICAgICAgIHB0ciA8ICh1aW50MzJfdCAqKSZtYy0+ZGF0YVtkYXRhX3NpemVdOyAr
K3B0ciApCisgICAgICAgIHN1bSArPSAqcHRyOworCisgICAgaWYgKCBzdW0gIT0gMCApCiAgICAg
ICAgIHJldHVybiAtRUlOVkFMOwotICAgIH0KLSAgICBleHRfdGFibGVfc2l6ZSA9IHRvdGFsX3Np
emUgLSAoTUNfSEVBREVSX1NJWkUgKyBkYXRhX3NpemUpOwotICAgIGlmICggZXh0X3RhYmxlX3Np
emUgKQotICAgIHsKLSAgICAgICAgaWYgKCAoZXh0X3RhYmxlX3NpemUgPCBFWFRfSEVBREVSX1NJ
WkUpIHx8Ci0gICAgICAgICAgICAgKChleHRfdGFibGVfc2l6ZSAtIEVYVF9IRUFERVJfU0laRSkg
JSBFWFRfU0lHTkFUVVJFX1NJWkUpICkKLSAgICAgICAgewotICAgICAgICAgICAgcHJpbnRrKEtF
Uk5fRVJSICJtaWNyb2NvZGU6IGVycm9yISAiCi0gICAgICAgICAgICAgICAgICAgIlNtYWxsIGV4
dHRhYmxlIHNpemUgaW4gbWljcm9jb2RlIGRhdGEgZmlsZVxuIik7Ci0gICAgICAgICAgICByZXR1
cm4gLUVJTlZBTDsKLSAgICAgICAgfQotICAgICAgICBleHRfaGVhZGVyID0gKHZvaWQgKiltYyAr
IE1DX0hFQURFUl9TSVpFICsgZGF0YV9zaXplOwotICAgICAgICBpZiAoIGV4dF90YWJsZV9zaXpl
ICE9IGV4dHRhYmxlX3NpemUoZXh0X2hlYWRlcikgKQotICAgICAgICB7Ci0gICAgICAgICAgICBw
cmludGsoS0VSTl9FUlIgIm1pY3JvY29kZTogZXJyb3IhICIKLSAgICAgICAgICAgICAgICAgICAi
QmFkIGV4dHRhYmxlIHNpemUgaW4gbWljcm9jb2RlIGRhdGEgZmlsZVxuIik7Ci0gICAgICAgICAg
ICByZXR1cm4gLUVGQVVMVDsKLSAgICAgICAgfQotICAgICAgICBleHRfc2lnY291bnQgPSBleHRf
aGVhZGVyLT5jb3VudDsKLSAgICB9CiAKLSAgICAvKiBjaGVjayBleHRlbmRlZCB0YWJsZSBjaGVj
a3N1bSAqLwotICAgIGlmICggZXh0X3RhYmxlX3NpemUgKQotICAgIHsKLSAgICAgICAgdWludDMy
X3QgZXh0X3RhYmxlX3N1bSA9IDA7Ci0gICAgICAgIHVpbnQzMl90ICpleHRfdGFibGVwID0gKHVp
bnQzMl90ICopZXh0X2hlYWRlcjsKKyAgICAvKiBMb29rIHRvIHNlZSBpZiB0aGVyZSBpcyBhbiBl
eHRlbmRlZCBzaWduYXR1cmUgdGFibGUuICovCisgICAgZXh0X3NpemUgPSB0b3RhbF9zaXplIC0g
ZGF0YV9zaXplIC0gTUNfSEVBREVSX1NJWkU7CiAKLSAgICAgICAgaSA9IGV4dF90YWJsZV9zaXpl
IC8gRFdTSVpFOwotICAgICAgICB3aGlsZSAoIGktLSApCi0gICAgICAgICAgICBleHRfdGFibGVf
c3VtICs9IGV4dF90YWJsZXBbaV07Ci0gICAgICAgIGlmICggZXh0X3RhYmxlX3N1bSApCi0gICAg
ICAgIHsKLSAgICAgICAgICAgIHByaW50ayhLRVJOX1dBUk5JTkcgIm1pY3JvY29kZTogYWJvcnRp
bmcsICIKLSAgICAgICAgICAgICAgICAgICAiYmFkIGV4dGVuZGVkIHNpZ25hdHVyZSB0YWJsZSBj
aGVja3N1bVxuIik7Ci0gICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKLSAgICAgICAgfQotICAg
IH0KKyAgICAvKiBObyBleHRlbmRlZCBzaWduYXR1cmUgdGFibGU/ICBBbGwgZG9uZS4gKi8KKyAg
ICBpZiAoIGV4dF9zaXplID09IDAgKQorICAgICAgICByZXR1cm4gMDsKIAotICAgIC8qIGNhbGN1
bGF0ZSB0aGUgY2hlY2tzdW0gKi8KLSAgICBvcmlnX3N1bSA9IDA7Ci0gICAgaSA9IChNQ19IRUFE
RVJfU0laRSArIGRhdGFfc2l6ZSkgLyBEV1NJWkU7Ci0gICAgd2hpbGUgKCBpLS0gKQotICAgICAg
ICBvcmlnX3N1bSArPSAoKHVpbnQzMl90ICopbWMpW2ldOwotICAgIGlmICggb3JpZ19zdW0gKQot
ICAgIHsKLSAgICAgICAgcHJpbnRrKEtFUk5fRVJSICJtaWNyb2NvZGU6IGFib3J0aW5nLCBiYWQg
Y2hlY2tzdW1cbiIpOworICAgIC8qCisgICAgICogQ2hlY2sgdGhlIHN0cnVjdHVyZSBvZiB0aGUg
ZXh0ZW5kZWQgc2lnbmF0dXJlIHRhYmxlLCBlbnN1cmluZyB0aGF0IGl0CisgICAgICogZml0cyBl
eGFjdGx5IGluIHRoZSByZW1haW5pbmcgc3BhY2UuCisgICAgICovCisgICAgZXh0ID0gKHZvaWQg
KikmbWMtPmRhdGFbZGF0YV9zaXplXTsKKyAgICBpZiAoIGV4dF9zaXplIDwgc2l6ZW9mKCpleHQp
IHx8CisgICAgICAgICAoZXh0X3NpemUgLSBzaXplb2YoKmV4dCkpICUgc2l6ZW9mKGV4dC0+c2ln
c1swXSkgfHwKKyAgICAgICAgIChleHRfc2l6ZSAtIHNpemVvZigqZXh0KSkgLyBzaXplb2YoZXh0
LT5zaWdzWzBdKSAhPSBleHQtPmNvdW50ICkKICAgICAgICAgcmV0dXJuIC1FSU5WQUw7Ci0gICAg
fQotICAgIGlmICggIWV4dF90YWJsZV9zaXplICkKLSAgICAgICAgcmV0dXJuIDA7Ci0gICAgLyog
Y2hlY2sgZXh0ZW5kZWQgc2lnbmF0dXJlIGNoZWNrc3VtICovCi0gICAgZm9yICggaSA9IDA7IGkg
PCBleHRfc2lnY291bnQ7IGkrKyApCi0gICAgewotICAgICAgICBleHRfc2lnID0gKHZvaWQgKill
eHRfaGVhZGVyICsgRVhUX0hFQURFUl9TSVpFICsKLSAgICAgICAgICAgIEVYVF9TSUdOQVRVUkVf
U0laRSAqIGk7Ci0gICAgICAgIHN1bSA9IG9yaWdfc3VtCi0gICAgICAgICAgICAtIChtY19oZWFk
ZXItPnNpZyArIG1jX2hlYWRlci0+cGYgKyBtY19oZWFkZXItPmNrc3VtKQotICAgICAgICAgICAg
KyAoZXh0X3NpZy0+c2lnICsgZXh0X3NpZy0+cGYgKyBleHRfc2lnLT5ja3N1bSk7Ci0gICAgICAg
IGlmICggc3VtICkKLSAgICAgICAgewotICAgICAgICAgICAgcHJpbnRrKEtFUk5fRVJSICJtaWNy
b2NvZGU6IGFib3J0aW5nLCBiYWQgY2hlY2tzdW1cbiIpOworCisgICAgLyogQ2hlY2tzdW0gdGhl
IHdob2xlIGV4dGVuZGVkIHNpZ25hdHVyZSB0YWJsZS4gKi8KKyAgICBmb3IgKCBzdW0gPSAwLCBw
dHIgPSAodWludDMyX3QgKilleHQ7CisgICAgICAgICAgcHRyIDwgKHVpbnQzMl90ICopJmV4dC0+
c2lnc1tleHQtPmNvdW50XTsgKytwdHIgKQorICAgICAgICBzdW0gKz0gKnB0cjsKKworICAgIGlm
ICggc3VtICE9IDAgKQorICAgICAgICByZXR1cm4gLUVJTlZBTDsKKworICAgIC8qCisgICAgICog
Q2hlY2tzdW0gZWFjaCBpbmRpdml1ZGFsIGV4dGVuZGVkIHNpZ25hdHVyZSBhcyBpZiBpdCBoYWQg
YmVlbiBpbiB0aGUKKyAgICAgKiBtYWluIGhlYWRlci4KKyAgICAgKi8KKyAgICBzdW0gPSBtYy0+
aGRyLnNpZyArIG1jLT5oZHIucGYgKyBtYy0+aGRyLmNrc3VtOworICAgIGZvciAoIGkgPSAwOyBp
IDwgZXh0LT5jb3VudDsgKytpICkKKyAgICAgICAgaWYgKCBzdW0gIT0gKGV4dC0+c2lnc1tpXS5z
aWcgKyBleHQtPnNpZ3NbaV0ucGYgKyBleHQtPnNpZ3NbaV0uY2tzdW0pICkKICAgICAgICAgICAg
IHJldHVybiAtRUlOVkFMOwotICAgICAgICB9Ci0gICAgfQorCiAgICAgcmV0dXJuIDA7CiB9CiAK
LS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
