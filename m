Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF3718BB22
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2020 16:29:43 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jEx4A-0003NP-7s; Thu, 19 Mar 2020 15:26:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=kuhB=5E=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jEx48-0003NC-MW
 for xen-devel@lists.xenproject.org; Thu, 19 Mar 2020 15:26:36 +0000
X-Inumbo-ID: 047937b8-69f6-11ea-bc31-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 047937b8-69f6-11ea-bc31-12813bfff9fa;
 Thu, 19 Mar 2020 15:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1584631595;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IFqmDK+pyXIICW/cF9wL4yB/wqgNWJh5iNiQY3eawJ8=;
 b=aXnJFMVM6pKd6mDUi4bWMnDwD/Ou6VChUA3UrZB4e8AmSxTisVna3n2M
 ToVtHmwWbObZC/3v8sHF2cgFEI7Lg7mfMbDZeh+vR4kKTlStRBqKHd6L+
 mApuBoLUME9qVOc+R4DdVNgiG3bl15r0RaBw4Ohp0z2xSPEsQAcUurtwf 0=;
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
IronPort-SDR: ctM7E/On9qb2FZo0C1gAA7ZhQ9ScNjOKTT4EYGkXnXHJFQSNqzz8jBj6dsQAYyrtT0hgDMI0KN
 67EiV5QT2yoy70OPSx5fElAF6PrfpnZL0LP8SprkIB04ITJgiDTqZXK39y5ElXAP0ouVxyRosR
 jO66oXkWFPAghvgJ+5ivrO91uq+xu/HjZQ+2hMOjSVlBBZa6+jds2soseZcPUMnzsoxn9cbDZc
 kiS03oeDKUk4elvr/fPTmejkZZ7yAIjYiHM1lizhcnNmgU7n98M6/vtrwMhltavtrfXi6yP7xb
 OEc=
X-SBRS: 2.7
X-MesageID: 14927763
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,572,1574139600"; d="scan'208";a="14927763"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Thu, 19 Mar 2020 15:26:19 +0000
Message-ID: <20200319152622.31758-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200319152622.31758-1-andrew.cooper3@citrix.com>
References: <20200319152622.31758-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 3/6] x86/ucode: Move interface from processor.h
 to microcode.h
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

VGhpcyByZWR1Y2VzIHRoZSBjb21wbGV4aXR5IG9mIHByb2Nlc3Nvci5oLCBwYXJ0aWN1bGFybHkg
dGhlIG5lZWQgdG8gaW5jbHVkZQpwdWJsaWMveGVuLmguICBTdWJzdGl0dXRlIHByb2Nlc3Nvci5o
IGluY2x1ZGVzIGZvciBtaWNyb2NvZGUuaCBpbiBzb21lCnNvdXJjZXMsIGFuZCBhZGQgbWljcm9j
b2RlLmggaW5jbHVkZXMgaW4gb3RoZXJzLgoKT25seSA0IG9mIHRoZSBmdW5jdGlvbiBkZWNsYXJh
dGlvbnMgYXJlIGFjdHVhbGx5IGNhbGxlZCBleHRlcm5hbGx5LiAgTW92ZSB0aGUKYXZlbmRvciBp
bml0IGRlY2xhcmF0aW9ucyB0byBwcml2YXRlLmgKCk5vIGZ1bmN0aW9uYWwgY2hhbmdlLgoKU2ln
bmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KQWNr
ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KLS0tCkNDOiBKYW4gQmV1bGlj
aCA8SkJldWxpY2hAc3VzZS5jb20+CkNDOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgpDQzogUm9nZXIg
UGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Ci0tLQogeGVuL2FyY2gveDg2L2FjcGkv
cG93ZXIuYyAgICAgICAgICAgIHwgMSArCiB4ZW4vYXJjaC94ODYvY3B1L21pY3JvY29kZS9wcml2
YXRlLmggfCAzICsrKwogeGVuL2FyY2gveDg2L2VmaS9lZmktYm9vdC5oICAgICAgICAgIHwgMiAr
LQogeGVuL2FyY2gveDg2L3BsYXRmb3JtX2h5cGVyY2FsbC5jICAgIHwgMSArCiB4ZW4vYXJjaC94
ODYvc2V0dXAuYyAgICAgICAgICAgICAgICAgfCAxICsKIHhlbi9hcmNoL3g4Ni9zbXBib290LmMg
ICAgICAgICAgICAgICB8IDEgKwogeGVuL2FyY2gveDg2L3NwZWNfY3RybC5jICAgICAgICAgICAg
IHwgMSAtCiB4ZW4vaW5jbHVkZS9hc20teDg2L21pY3JvY29kZS5oICAgICAgfCA4ICsrKysrKysr
CiB4ZW4vaW5jbHVkZS9hc20teDg2L3Byb2Nlc3Nvci5oICAgICAgfCA4IC0tLS0tLS0tCiA5IGZp
bGVzIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKyksIDEwIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL3hlbi9hcmNoL3g4Ni9hY3BpL3Bvd2VyLmMgYi94ZW4vYXJjaC94ODYvYWNwaS9wb3dlci5j
CmluZGV4IGI1ZGYwMGIyMmMuLmUzZDZlZWZlNjUgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9h
Y3BpL3Bvd2VyLmMKKysrIGIveGVuL2FyY2gveDg2L2FjcGkvcG93ZXIuYwpAQCAtMzAsNiArMzAs
NyBAQAogI2luY2x1ZGUgPGFzbS90Ym9vdC5oPgogI2luY2x1ZGUgPGFzbS9hcGljLmg+CiAjaW5j
bHVkZSA8YXNtL2lvX2FwaWMuaD4KKyNpbmNsdWRlIDxhc20vbWljcm9jb2RlLmg+CiAjaW5jbHVk
ZSA8YXNtL3NwZWNfY3RybC5oPgogI2luY2x1ZGUgPGFjcGkvY3B1ZnJlcS9jcHVmcmVxLmg+CiAK
ZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9jcHUvbWljcm9jb2RlL3ByaXZhdGUuaCBiL3hlbi9h
cmNoL3g4Ni9jcHUvbWljcm9jb2RlL3ByaXZhdGUuaAppbmRleCAyZTNiZTc5ZWFmLi40NTliNmE0
YzU0IDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvY3B1L21pY3JvY29kZS9wcml2YXRlLmgKKysr
IGIveGVuL2FyY2gveDg2L2NwdS9taWNyb2NvZGUvcHJpdmF0ZS5oCkBAIC0zNCw0ICszNCw3IEBA
IHN0cnVjdCBtaWNyb2NvZGVfb3BzIHsKIAogZXh0ZXJuIGNvbnN0IHN0cnVjdCBtaWNyb2NvZGVf
b3BzICptaWNyb2NvZGVfb3BzOwogCitpbnQgbWljcm9jb2RlX2luaXRfaW50ZWwodm9pZCk7Citp
bnQgbWljcm9jb2RlX2luaXRfYW1kKHZvaWQpOworCiAjZW5kaWYgLyogQVNNX1g4Nl9NSUNST0NP
REVfUFJJVkFURV9IICovCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvZWZpL2VmaS1ib290Lmgg
Yi94ZW4vYXJjaC94ODYvZWZpL2VmaS1ib290LmgKaW5kZXggYmY3YjBhNjFkYy4uN2JmYjk2ODc1
YyAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L2VmaS9lZmktYm9vdC5oCisrKyBiL3hlbi9hcmNo
L3g4Ni9lZmkvZWZpLWJvb3QuaApAQCAtNiw4ICs2LDggQEAKICNpbmNsdWRlIDx4ZW4vdmdhLmg+
CiAjaW5jbHVkZSA8YXNtL2U4MjAuaD4KICNpbmNsdWRlIDxhc20vZWRkLmg+CisjaW5jbHVkZSA8
YXNtL21pY3JvY29kZS5oPgogI2luY2x1ZGUgPGFzbS9tc3IuaD4KLSNpbmNsdWRlIDxhc20vcHJv
Y2Vzc29yLmg+CiAKIHN0YXRpYyBzdHJ1Y3QgZmlsZSBfX2luaXRkYXRhIHVjb2RlOwogc3RhdGlj
IG11bHRpYm9vdF9pbmZvX3QgX19pbml0ZGF0YSBtYmkgPSB7CmRpZmYgLS1naXQgYS94ZW4vYXJj
aC94ODYvcGxhdGZvcm1faHlwZXJjYWxsLmMgYi94ZW4vYXJjaC94ODYvcGxhdGZvcm1faHlwZXJj
YWxsLmMKaW5kZXggODBlZmI4NDMyOC4uZWUyZWZkZDg3NSAxMDA2NDQKLS0tIGEveGVuL2FyY2gv
eDg2L3BsYXRmb3JtX2h5cGVyY2FsbC5jCisrKyBiL3hlbi9hcmNoL3g4Ni9wbGF0Zm9ybV9oeXBl
cmNhbGwuYwpAQCAtMjcsNiArMjcsNyBAQAogI2luY2x1ZGUgPHB1YmxpYy9wbGF0Zm9ybS5oPgog
I2luY2x1ZGUgPGFjcGkvY3B1ZnJlcS9wcm9jZXNzb3JfcGVyZi5oPgogI2luY2x1ZGUgPGFzbS9l
ZGQuaD4KKyNpbmNsdWRlIDxhc20vbWljcm9jb2RlLmg+CiAjaW5jbHVkZSA8YXNtL210cnIuaD4K
ICNpbmNsdWRlIDxhc20vaW9fYXBpYy5oPgogI2luY2x1ZGUgPGFzbS9zZXR1cC5oPgpkaWZmIC0t
Z2l0IGEveGVuL2FyY2gveDg2L3NldHVwLmMgYi94ZW4vYXJjaC94ODYvc2V0dXAuYwppbmRleCBj
ODcwNDBjODkwLi44ODU5MTlkNWMzIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvc2V0dXAuYwor
KysgYi94ZW4vYXJjaC94ODYvc2V0dXAuYwpAQCAtNTIsNiArNTIsNyBAQAogI2luY2x1ZGUgPGFz
bS9jcHVpZC5oPgogI2luY2x1ZGUgPGFzbS9zcGVjX2N0cmwuaD4KICNpbmNsdWRlIDxhc20vZ3Vl
c3QuaD4KKyNpbmNsdWRlIDxhc20vbWljcm9jb2RlLmg+CiAKIC8qIG9wdF9ub3NtcDogSWYgdHJ1
ZSwgc2Vjb25kYXJ5IHByb2Nlc3NvcnMgYXJlIGlnbm9yZWQuICovCiBzdGF0aWMgYm9vbCBfX2lu
aXRkYXRhIG9wdF9ub3NtcDsKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9zbXBib290LmMgYi94
ZW4vYXJjaC94ODYvc21wYm9vdC5jCmluZGV4IDBlNTRiZDE0ZjMuLjA5MjY0YjAyZDEgMTAwNjQ0
Ci0tLSBhL3hlbi9hcmNoL3g4Ni9zbXBib290LmMKKysrIGIveGVuL2FyY2gveDg2L3NtcGJvb3Qu
YwpAQCAtMzksNiArMzksNyBAQAogI2luY2x1ZGUgPGFzbS9kaXY2NC5oPgogI2luY2x1ZGUgPGFz
bS9mbHVzaHRsYi5oPgogI2luY2x1ZGUgPGFzbS9ndWVzdC5oPgorI2luY2x1ZGUgPGFzbS9taWNy
b2NvZGUuaD4KICNpbmNsdWRlIDxhc20vbXNyLmg+CiAjaW5jbHVkZSA8YXNtL210cnIuaD4KICNp
bmNsdWRlIDxhc20vc3BlY19jdHJsLmg+CmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvc3BlY19j
dHJsLmMgYi94ZW4vYXJjaC94ODYvc3BlY19jdHJsLmMKaW5kZXggYWVkMmM2NjEzYS4uYzVkOGU1
ODdhOCAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L3NwZWNfY3RybC5jCisrKyBiL3hlbi9hcmNo
L3g4Ni9zcGVjX2N0cmwuYwpAQCAtMjQsNyArMjQsNiBAQAogCiAjaW5jbHVkZSA8YXNtL21pY3Jv
Y29kZS5oPgogI2luY2x1ZGUgPGFzbS9tc3IuaD4KLSNpbmNsdWRlIDxhc20vcHJvY2Vzc29yLmg+
CiAjaW5jbHVkZSA8YXNtL3B2L2RvbWFpbi5oPgogI2luY2x1ZGUgPGFzbS9wdi9zaGltLmg+CiAj
aW5jbHVkZSA8YXNtL3NldHVwLmg+CmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9hc20teDg2L21p
Y3JvY29kZS5oIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9taWNyb2NvZGUuaAppbmRleCA5YjZmZjdk
YjA4Li44OWI5YWFhMDJkIDEwMDY0NAotLS0gYS94ZW4vaW5jbHVkZS9hc20teDg2L21pY3JvY29k
ZS5oCisrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYvbWljcm9jb2RlLmgKQEAgLTEsOCArMSwxMSBA
QAogI2lmbmRlZiBBU01fWDg2X19NSUNST0NPREVfSAogI2RlZmluZSBBU01fWDg2X19NSUNST0NP
REVfSAogCisjaW5jbHVkZSA8eGVuL3R5cGVzLmg+CiAjaW5jbHVkZSA8eGVuL3BlcmNwdS5oPgog
CisjaW5jbHVkZSA8cHVibGljL3hlbi5oPgorCiBzdHJ1Y3QgY3B1X3NpZ25hdHVyZSB7CiAgICAg
dW5zaWduZWQgaW50IHNpZzsKICAgICB1bnNpZ25lZCBpbnQgcGY7CkBAIC0xMSw0ICsxNCw5IEBA
IHN0cnVjdCBjcHVfc2lnbmF0dXJlIHsKIAogREVDTEFSRV9QRVJfQ1BVKHN0cnVjdCBjcHVfc2ln
bmF0dXJlLCBjcHVfc2lnKTsKIAordm9pZCBtaWNyb2NvZGVfc2V0X21vZHVsZSh1bnNpZ25lZCBp
bnQgaWR4KTsKK2ludCBtaWNyb2NvZGVfdXBkYXRlKFhFTl9HVUVTVF9IQU5ETEVfUEFSQU0oY29u
c3Rfdm9pZCksIHVuc2lnbmVkIGxvbmcgbGVuKTsKK2ludCBlYXJseV9taWNyb2NvZGVfaW5pdCh2
b2lkKTsKK2ludCBtaWNyb2NvZGVfdXBkYXRlX29uZShib29sIHN0YXJ0X3VwZGF0ZSk7CisKICNl
bmRpZiAvKiBBU01fWDg2X19NSUNST0NPREVfSCAqLwpkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUv
YXNtLXg4Ni9wcm9jZXNzb3IuaCBiL3hlbi9pbmNsdWRlL2FzbS14ODYvcHJvY2Vzc29yLmgKaW5k
ZXggODk1YzcwMzJiOS4uZmUyMzFjNTA3MiAxMDA2NDQKLS0tIGEveGVuL2luY2x1ZGUvYXNtLXg4
Ni9wcm9jZXNzb3IuaAorKysgYi94ZW4vaW5jbHVkZS9hc20teDg2L3Byb2Nlc3Nvci5oCkBAIC05
LDcgKzksNiBAQAogI2luY2x1ZGUgPHhlbi90eXBlcy5oPgogI2luY2x1ZGUgPHhlbi9zbXAuaD4K
ICNpbmNsdWRlIDx4ZW4vcGVyY3B1Lmg+Ci0jaW5jbHVkZSA8cHVibGljL3hlbi5oPgogI2luY2x1
ZGUgPGFzbS90eXBlcy5oPgogI2luY2x1ZGUgPGFzbS9jcHVmZWF0dXJlLmg+CiAjaW5jbHVkZSA8
YXNtL2Rlc2MuaD4KQEAgLTU3OSwxMyArNTc4LDYgQEAgdm9pZCBjcHVpZF9oeXBlcnZpc29yX2xl
YXZlcyhjb25zdCBzdHJ1Y3QgdmNwdSAqdiwgdWludDMyX3QgbGVhZiwKIGludCBndWVzdF9yZG1z
cl94ZW4oY29uc3Qgc3RydWN0IHZjcHUgKnYsIHVpbnQzMl90IGlkeCwgdWludDY0X3QgKnZhbCk7
CiBpbnQgZ3Vlc3Rfd3Jtc3JfeGVuKHN0cnVjdCB2Y3B1ICp2LCB1aW50MzJfdCBpZHgsIHVpbnQ2
NF90IHZhbCk7CiAKLXZvaWQgbWljcm9jb2RlX3NldF9tb2R1bGUodW5zaWduZWQgaW50KTsKLWlu
dCBtaWNyb2NvZGVfdXBkYXRlKFhFTl9HVUVTVF9IQU5ETEVfUEFSQU0oY29uc3Rfdm9pZCksIHVu
c2lnbmVkIGxvbmcgbGVuKTsKLWludCBlYXJseV9taWNyb2NvZGVfaW5pdCh2b2lkKTsKLWludCBt
aWNyb2NvZGVfdXBkYXRlX29uZShib29sIHN0YXJ0X3VwZGF0ZSk7Ci1pbnQgbWljcm9jb2RlX2lu
aXRfaW50ZWwodm9pZCk7Ci1pbnQgbWljcm9jb2RlX2luaXRfYW1kKHZvaWQpOwotCiBzdGF0aWMg
aW5saW5lIHVpbnQ4X3QgZ2V0X2NwdV9mYW1pbHkodWludDMyX3QgcmF3LCB1aW50OF90ICptb2Rl
bCwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1aW50OF90ICpzdGVwcGlu
ZykKIHsKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
