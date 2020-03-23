Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D955D18F298
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2020 11:20:50 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jGK9T-0007Z1-5f; Mon, 23 Mar 2020 10:17:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0LFc=5I=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jGK9S-0007Ym-CV
 for xen-devel@lists.xenproject.org; Mon, 23 Mar 2020 10:17:46 +0000
X-Inumbo-ID: 855c6ce6-6cef-11ea-a6c1-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 855c6ce6-6cef-11ea-a6c1-bc764e2007e4;
 Mon, 23 Mar 2020 10:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1584958658;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DhcDOqjAEEu8+UEOwRSVuIVRyg3CjwPAxqeTQgZP7/U=;
 b=Dew8tMPsWXcSdsymQhlFlnlXW9RaSNf9F+fXiWXN9A1e6a+FRjf6rvoy
 NHpZ9wf9phQRSUQADX8JuVJ3fbxOQF9Ea0G5SgiPRVjkYfchd++TDjBOT
 Bn84lsnAOuHTS9bGPyR7KOo5dLGcWH9OJEmNR5inkyttEPzGGXaxtt+/D k=;
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
IronPort-SDR: HW6sIBdcxZYmlcXwI557dXTUPzvU5cIlXgQugV2OxqjoXqd6pH6+nyqvdkPH7mIztXSFfzDCns
 dF3TJB9w7xfxE4ak5eqlTIS5Uhf5I+rRNdvJUf0oS0Ex36B+1kWG3eVKYkKL9lrvdePbc5Snz0
 odsdl9QlG1qAQdT81dveayUl4kxO7gq23486mfmEUcRYEOiveGhsj4nqM/Owm7SlzDRdBec+nz
 aDDs1AESKw5vl5XWHLGXG0Bbv+tesgBwcAKoCFZYvVPCzGih5EPRi050HAvrGuaiN/jW51gKea
 GYE=
X-SBRS: 2.7
X-MesageID: 15099733
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,296,1580792400"; d="scan'208";a="15099733"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Mon, 23 Mar 2020 10:17:19 +0000
Message-ID: <20200323101724.15655-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200323101724.15655-1-andrew.cooper3@citrix.com>
References: <20200323101724.15655-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 2/7] x86/ucode/intel: Adjust
 microcode_sanity_check() to not take void *
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

bWljcm9jb2RlX3Nhbml0eV9jaGVjaygpJ3MgY2FsbGVycyBhY3R1YWxseSBjYWxsIGl0IHdpdGgg
YSBtaXh0dXJlIG9mCm1pY3JvY29kZV9pbnRlbCBhbmQgbWljcm9jb2RlX2hlYWRlcl9pbnRlbCBw
b2ludGVycywgd2hpY2ggaXMgZnJhZ2lsZS4KClJld29yayBpdCB0byB0YWtlIHN0cnVjdCBtaWNy
b2NvZGVfaW50ZWwgKiwgd2hpY2ggaW4gdHVybiByZXF1aXJlcwptaWNyb2NvZGVfdXBkYXRlX21h
dGNoKCkncyB0eXBlIHRvIGJlIGFsdGVyZWQuCgpObyBmdW5jdGlvbmFsIGNoYW5nZSAtIGNvbXBp
bGVkIGJpbmFyeSBpcyBpZGVudGljYWwuCgpTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxh
bmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgotLS0KQ0M6IEphbiBCZXVsaWNoIDxKQmV1bGljaEBz
dXNlLmNvbT4KQ0M6IFdlaSBMaXUgPHdsQHhlbi5vcmc+CkNDOiBSb2dlciBQYXUgTW9ubsOpIDxy
b2dlci5wYXVAY2l0cml4LmNvbT4KLS0tCiB4ZW4vYXJjaC94ODYvY3B1L21pY3JvY29kZS9pbnRl
bC5jIHwgMTkgKysrKysrKysrKy0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlv
bnMoKyksIDkgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2NwdS9taWNy
b2NvZGUvaW50ZWwuYyBiL3hlbi9hcmNoL3g4Ni9jcHUvbWljcm9jb2RlL2ludGVsLmMKaW5kZXgg
ZjI2NTExZGE5OC4uZjBiZWVmZTFiYiAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L2NwdS9taWNy
b2NvZGUvaW50ZWwuYworKysgYi94ZW4vYXJjaC94ODYvY3B1L21pY3JvY29kZS9pbnRlbC5jCkBA
IC0xMTksOSArMTE5LDkgQEAgc3RhdGljIGludCBjb2xsZWN0X2NwdV9pbmZvKHN0cnVjdCBjcHVf
c2lnbmF0dXJlICpjc2lnKQogICAgIHJldHVybiAwOwogfQogCi1zdGF0aWMgaW50IG1pY3JvY29k
ZV9zYW5pdHlfY2hlY2soY29uc3Qgdm9pZCAqbWMpCitzdGF0aWMgaW50IG1pY3JvY29kZV9zYW5p
dHlfY2hlY2soY29uc3Qgc3RydWN0IG1pY3JvY29kZV9pbnRlbCAqbWMpCiB7Ci0gICAgY29uc3Qg
c3RydWN0IG1pY3JvY29kZV9oZWFkZXJfaW50ZWwgKm1jX2hlYWRlciA9IG1jOworICAgIGNvbnN0
IHN0cnVjdCBtaWNyb2NvZGVfaGVhZGVyX2ludGVsICptY19oZWFkZXIgPSAmbWMtPmhkcjsKICAg
ICBjb25zdCBzdHJ1Y3QgZXh0ZW5kZWRfc2lndGFibGUgKmV4dF9oZWFkZXIgPSBOVUxMOwogICAg
IGNvbnN0IHN0cnVjdCBleHRlbmRlZF9zaWduYXR1cmUgKmV4dF9zaWc7CiAgICAgdW5zaWduZWQg
bG9uZyB0b3RhbF9zaXplLCBkYXRhX3NpemUsIGV4dF90YWJsZV9zaXplOwpAQCAtMTUzLDcgKzE1
Myw3IEBAIHN0YXRpYyBpbnQgbWljcm9jb2RlX3Nhbml0eV9jaGVjayhjb25zdCB2b2lkICptYykK
ICAgICAgICAgICAgICAgICAgICAiU21hbGwgZXh0dGFibGUgc2l6ZSBpbiBtaWNyb2NvZGUgZGF0
YSBmaWxlXG4iKTsKICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOwogICAgICAgICB9Ci0gICAg
ICAgIGV4dF9oZWFkZXIgPSBtYyArIE1DX0hFQURFUl9TSVpFICsgZGF0YV9zaXplOworICAgICAg
ICBleHRfaGVhZGVyID0gKHZvaWQgKiltYyArIE1DX0hFQURFUl9TSVpFICsgZGF0YV9zaXplOwog
ICAgICAgICBpZiAoIGV4dF90YWJsZV9zaXplICE9IGV4dHRhYmxlX3NpemUoZXh0X2hlYWRlcikg
KQogICAgICAgICB7CiAgICAgICAgICAgICBwcmludGsoS0VSTl9FUlIgIm1pY3JvY29kZTogZXJy
b3IhICIKQEAgLTIxMSw4ICsyMTEsOSBAQCBzdGF0aWMgaW50IG1pY3JvY29kZV9zYW5pdHlfY2hl
Y2soY29uc3Qgdm9pZCAqbWMpCiAKIC8qIENoZWNrIGFuIHVwZGF0ZSBhZ2FpbnN0IHRoZSBDUFUg
c2lnbmF0dXJlIGFuZCBjdXJyZW50IHVwZGF0ZSByZXZpc2lvbiAqLwogc3RhdGljIGVudW0gbWlj
cm9jb2RlX21hdGNoX3Jlc3VsdCBtaWNyb2NvZGVfdXBkYXRlX21hdGNoKAotICAgIGNvbnN0IHN0
cnVjdCBtaWNyb2NvZGVfaGVhZGVyX2ludGVsICptY19oZWFkZXIpCisgICAgY29uc3Qgc3RydWN0
IG1pY3JvY29kZV9pbnRlbCAqbWMpCiB7CisgICAgY29uc3Qgc3RydWN0IG1pY3JvY29kZV9oZWFk
ZXJfaW50ZWwgKm1jX2hlYWRlciA9ICZtYy0+aGRyOwogICAgIGNvbnN0IHN0cnVjdCBleHRlbmRl
ZF9zaWd0YWJsZSAqZXh0X2hlYWRlcjsKICAgICBjb25zdCBzdHJ1Y3QgZXh0ZW5kZWRfc2lnbmF0
dXJlICpleHRfc2lnOwogICAgIHVuc2lnbmVkIGludCBpOwpAQCAtMjIzLDcgKzIyNCw3IEBAIHN0
YXRpYyBlbnVtIG1pY3JvY29kZV9tYXRjaF9yZXN1bHQgbWljcm9jb2RlX3VwZGF0ZV9tYXRjaCgK
ICAgICB1bnNpZ25lZCBsb25nIGRhdGFfc2l6ZSA9IGdldF9kYXRhc2l6ZShtY19oZWFkZXIpOwog
ICAgIGNvbnN0IHZvaWQgKmVuZCA9IChjb25zdCB2b2lkICopbWNfaGVhZGVyICsgZ2V0X3RvdGFs
c2l6ZShtY19oZWFkZXIpOwogCi0gICAgQVNTRVJUKCFtaWNyb2NvZGVfc2FuaXR5X2NoZWNrKG1j
X2hlYWRlcikpOworICAgIEFTU0VSVCghbWljcm9jb2RlX3Nhbml0eV9jaGVjayhtYykpOwogICAg
IGlmICggc2lnbWF0Y2goc2lnLCBtY19oZWFkZXItPnNpZywgcGYsIG1jX2hlYWRlci0+cGYpICkK
ICAgICAgICAgcmV0dXJuIChtY19oZWFkZXItPnJldiA+IHJldikgPyBORVdfVUNPREUgOiBPTERf
VUNPREU7CiAKQEAgLTI0OSw3ICsyNTAsNyBAQCBzdGF0aWMgYm9vbCBtYXRjaF9jcHUoY29uc3Qg
c3RydWN0IG1pY3JvY29kZV9wYXRjaCAqcGF0Y2gpCiAgICAgaWYgKCAhcGF0Y2ggKQogICAgICAg
ICByZXR1cm4gZmFsc2U7CiAKLSAgICByZXR1cm4gbWljcm9jb2RlX3VwZGF0ZV9tYXRjaCgmcGF0
Y2gtPm1jX2ludGVsLT5oZHIpID09IE5FV19VQ09ERTsKKyAgICByZXR1cm4gbWljcm9jb2RlX3Vw
ZGF0ZV9tYXRjaChwYXRjaC0+bWNfaW50ZWwpID09IE5FV19VQ09ERTsKIH0KIAogc3RhdGljIHZv
aWQgZnJlZV9wYXRjaChzdHJ1Y3QgbWljcm9jb2RlX3BhdGNoICpwYXRjaCkKQEAgLTI2OCw4ICsy
NjksOCBAQCBzdGF0aWMgZW51bSBtaWNyb2NvZGVfbWF0Y2hfcmVzdWx0IGNvbXBhcmVfcGF0Y2go
CiAgICAgICogQm90aCBwYXRjaGVzIHRvIGNvbXBhcmUgYXJlIHN1cHBvc2VkIHRvIGJlIGFwcGxp
Y2FibGUgdG8gbG9jYWwgQ1BVLgogICAgICAqIEp1c3QgY29tcGFyZSB0aGUgcmV2aXNpb24gbnVt
YmVyLgogICAgICAqLwotICAgIEFTU0VSVChtaWNyb2NvZGVfdXBkYXRlX21hdGNoKCZvbGQtPm1j
X2ludGVsLT5oZHIpICE9IE1JU19VQ09ERSk7Ci0gICAgQVNTRVJUKG1pY3JvY29kZV91cGRhdGVf
bWF0Y2goJm5ldy0+bWNfaW50ZWwtPmhkcikgIT0gTUlTX1VDT0RFKTsKKyAgICBBU1NFUlQobWlj
cm9jb2RlX3VwZGF0ZV9tYXRjaChvbGQtPm1jX2ludGVsKSAhPSBNSVNfVUNPREUpOworICAgIEFT
U0VSVChtaWNyb2NvZGVfdXBkYXRlX21hdGNoKG5ldy0+bWNfaW50ZWwpICE9IE1JU19VQ09ERSk7
CiAKICAgICByZXR1cm4gKG5ldy0+bWNfaW50ZWwtPmhkci5yZXYgPiBvbGQtPm1jX2ludGVsLT5o
ZHIucmV2KSA/IE5FV19VQ09ERQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIDogT0xEX1VDT0RFOwpAQCAtMzY3LDcgKzM2OCw3IEBA
IHN0YXRpYyBzdHJ1Y3QgbWljcm9jb2RlX3BhdGNoICpjcHVfcmVxdWVzdF9taWNyb2NvZGUoY29u
c3Qgdm9pZCAqYnVmLAogICAgICAgICAgKiBJZiB0aGUgbmV3IHVwZGF0ZSBjb3ZlcnMgY3VycmVu
dCBDUFUsIGNvbXBhcmUgdXBkYXRlcyBhbmQgc3RvcmUgdGhlCiAgICAgICAgICAqIG9uZSB3aXRo
IGhpZ2hlciByZXZpc2lvbi4KICAgICAgICAgICovCi0gICAgICAgIGlmICggKG1pY3JvY29kZV91
cGRhdGVfbWF0Y2goJm1jLT5oZHIpICE9IE1JU19VQ09ERSkgJiYKKyAgICAgICAgaWYgKCAobWlj
cm9jb2RlX3VwZGF0ZV9tYXRjaChtYykgIT0gTUlTX1VDT0RFKSAmJgogICAgICAgICAgICAgICgh
c2F2ZWQgfHwgKG1jLT5oZHIucmV2ID4gc2F2ZWQtPmhkci5yZXYpKSApCiAgICAgICAgIHsKICAg
ICAgICAgICAgIHhmcmVlKHNhdmVkKTsKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
