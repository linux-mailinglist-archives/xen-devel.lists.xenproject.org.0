Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E119140A5E
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jan 2020 14:02:17 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1isRDW-0000cB-Ui; Fri, 17 Jan 2020 12:59:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DzQF=3G=citrix.com=sergey.dyasli@srs-us1.protection.inumbo.net>)
 id 1isRDU-0000bK-Lt
 for xen-devel@lists.xen.org; Fri, 17 Jan 2020 12:59:12 +0000
X-Inumbo-ID: 1fa6a906-3929-11ea-b50e-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1fa6a906-3929-11ea-b50e-12813bfff9fa;
 Fri, 17 Jan 2020 12:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579265937;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=TwPVUHTicHlSrdJcOrXs1namoQC2uNcYl1AkvjzjGhk=;
 b=aMqnDzvYVGSRtw8oJfqiOX4RyZ9ADZrEgEZdtSFKMyoLaoq4Y7sJBADp
 iwZ1rfnS2c4+aQWtQ13unKIxdmC0WMoMOs8XsFrpsBk8GCwH49SbU/u8S
 qabEWEy088KpEIXxtxAycMhpCMfBYGvz+poi/zR18OsbovWogiiI/befb o=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=sergey.dyasli@citrix.com;
 spf=Pass smtp.mailfrom=sergey.dyasli@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 sergey.dyasli@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="sergey.dyasli@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 sergey.dyasli@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="sergey.dyasli@citrix.com";
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
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: D0PclziKwpbf2mE67IHsBMXSUsO637VOHeciRcXKoV4dZ/znm7ezy5sUfzEkiDTM1tPjAkpxI0
 9z1nh2VgQXK4qND5ZlC5PxX3k3Ak3hx44ptSXd9YyEIefZOsFtoKOH+nOmyCEPrXpPEUvzazv2
 5FSy4P2bKT7Nv9MhjwpYHUiT0vi2TTLkOaZUkDiqN71c2xmvNSXsidgGG+P2xcsdMKW3OhfNq3
 XBUg2XokzXqiTda2E3tvNu+PqUOpsQfdRpA92hKHVkurbuifgoHg753MU65hw2H3TMajL8F3c2
 AiQ=
X-SBRS: 2.7
X-MesageID: 11502058
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,330,1574139600"; d="scan'208";a="11502058"
From: Sergey Dyasli <sergey.dyasli@citrix.com>
To: <xen-devel@lists.xen.org>, <kasan-dev@googlegroups.com>,
 <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>
Date: Fri, 17 Jan 2020 12:58:32 +0000
Message-ID: <20200117125834.14552-3-sergey.dyasli@citrix.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200117125834.14552-1-sergey.dyasli@citrix.com>
References: <20200117125834.14552-1-sergey.dyasli@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 2/4] x86/xen: add basic KASAN support for PV
 kernel
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
 Stefano
 Stabellini <sstabellini@kernel.org>, George Dunlap <george.dunlap@citrix.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Alexander Potapenko <glider@google.com>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>, Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBlbmFibGVzIHRvIHVzZSBPdXRsaW5lIGluc3RydW1lbnRhdGlvbiBmb3IgWGVuIFBWIGtl
cm5lbHMuCgpLQVNBTl9JTkxJTkUgYW5kIEtBU0FOX1ZNQUxMT0Mgb3B0aW9ucyBjdXJyZW50bHkg
bGVhZCB0byBib290IGNyYXNoZXMKYW5kIGhlbmNlIGRpc2FibGVkLgoKU2lnbmVkLW9mZi1ieTog
U2VyZ2V5IER5YXNsaSA8c2VyZ2V5LmR5YXNsaUBjaXRyaXguY29tPgotLS0KdjEgLS0+IHYyOgot
IEZpeCBjb21waWxhdGlvbiB3aXRob3V0IENPTkZJR19YRU5fUFYKLSBVc2UgbWFjcm9zIGZvciBL
QVNBTl9TSEFET1dfU1RBUlQKClJGQyAtLT4gdjE6Ci0gTmV3IGZ1bmN0aW9ucyB3aXRoIGRlY2xh
cmF0aW9ucyBpbiB4ZW4veGVuLW9wcy5oCi0gRml4ZWQgdGhlIGlzc3VlIHdpdGggZnJlZV9rZXJu
ZWxfaW1hZ2VfcGFnZXMoKSB3aXRoIHRoZSBoZWxwIG9mCiAgeGVuX3B2X2thc2FuX3VucGluX3Bn
ZCgpCi0tLQogYXJjaC94ODYvbW0va2FzYW5faW5pdF82NC5jIHwgMTIgKysrKysrKysrKysrCiBh
cmNoL3g4Ni94ZW4vTWFrZWZpbGUgICAgICAgfCAgNyArKysrKysrCiBhcmNoL3g4Ni94ZW4vZW5s
aWdodGVuX3B2LmMgfCAgMyArKysKIGFyY2gveDg2L3hlbi9tbXVfcHYuYyAgICAgICB8IDM4ICsr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKIGRyaXZlcnMveGVuL01ha2VmaWxl
ICAgICAgICB8ICAyICsrCiBpbmNsdWRlL3hlbi94ZW4tb3BzLmggICAgICAgfCAxMCArKysrKysr
KysrCiBrZXJuZWwvTWFrZWZpbGUgICAgICAgICAgICAgfCAgMiArKwogbGliL0tjb25maWcua2Fz
YW4gICAgICAgICAgIHwgIDMgKystCiA4IGZpbGVzIGNoYW5nZWQsIDc2IGluc2VydGlvbnMoKyks
IDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9hcmNoL3g4Ni9tbS9rYXNhbl9pbml0XzY0LmMg
Yi9hcmNoL3g4Ni9tbS9rYXNhbl9pbml0XzY0LmMKaW5kZXggY2Y1YmMzN2M5MGFjLi45MDJhNmEx
NTJkMzMgMTAwNjQ0Ci0tLSBhL2FyY2gveDg2L21tL2thc2FuX2luaXRfNjQuYworKysgYi9hcmNo
L3g4Ni9tbS9rYXNhbl9pbml0XzY0LmMKQEAgLTEzLDYgKzEzLDkgQEAKICNpbmNsdWRlIDxsaW51
eC9zY2hlZC90YXNrLmg+CiAjaW5jbHVkZSA8bGludXgvdm1hbGxvYy5oPgogCisjaW5jbHVkZSA8
eGVuL3hlbi5oPgorI2luY2x1ZGUgPHhlbi94ZW4tb3BzLmg+CisKICNpbmNsdWRlIDxhc20vZTgy
MC90eXBlcy5oPgogI2luY2x1ZGUgPGFzbS9wZ2FsbG9jLmg+CiAjaW5jbHVkZSA8YXNtL3RsYmZs
dXNoLmg+CkBAIC0zMzIsNiArMzM1LDExIEBAIHZvaWQgX19pbml0IGthc2FuX2Vhcmx5X2luaXQo
dm9pZCkKIAlmb3IgKGkgPSAwOyBwZ3RhYmxlX2w1X2VuYWJsZWQoKSAmJiBpIDwgUFRSU19QRVJf
UDREOyBpKyspCiAJCWthc2FuX2Vhcmx5X3NoYWRvd19wNGRbaV0gPSBfX3A0ZChwNGRfdmFsKTsK
IAorCWlmICh4ZW5fcHZfZG9tYWluKCkpIHsKKwkJcGdkX3QgKnB2X3RvcF9wZ3QgPSB4ZW5fcHZf
a2FzYW5fZWFybHlfaW5pdCgpOworCQlrYXNhbl9tYXBfZWFybHlfc2hhZG93KHB2X3RvcF9wZ3Qp
OworCX0KKwogCWthc2FuX21hcF9lYXJseV9zaGFkb3coZWFybHlfdG9wX3BndCk7CiAJa2FzYW5f
bWFwX2Vhcmx5X3NoYWRvdyhpbml0X3RvcF9wZ3QpOwogfQpAQCAtMzY5LDYgKzM3Nyw4IEBAIHZv
aWQgX19pbml0IGthc2FuX2luaXQodm9pZCkKIAkJCQlfX3BnZChfX3BhKHRtcF9wNGRfdGFibGUp
IHwgX0tFUk5QR19UQUJMRSkpOwogCX0KIAorCXhlbl9wdl9rYXNhbl9waW5fcGdkKGVhcmx5X3Rv
cF9wZ3QpOworCiAJbG9hZF9jcjMoZWFybHlfdG9wX3BndCk7CiAJX19mbHVzaF90bGJfYWxsKCk7
CiAKQEAgLTQzMyw2ICs0NDMsOCBAQCB2b2lkIF9faW5pdCBrYXNhbl9pbml0KHZvaWQpCiAJbG9h
ZF9jcjMoaW5pdF90b3BfcGd0KTsKIAlfX2ZsdXNoX3RsYl9hbGwoKTsKIAorCXhlbl9wdl9rYXNh
bl91bnBpbl9wZ2QoZWFybHlfdG9wX3BndCk7CisKIAkvKgogCSAqIGthc2FuX2Vhcmx5X3NoYWRv
d19wYWdlIGhhcyBiZWVuIHVzZWQgYXMgZWFybHkgc2hhZG93IG1lbW9yeSwgdGh1cwogCSAqIGl0
IG1heSBjb250YWluIHNvbWUgZ2FyYmFnZS4gTm93IHdlIGNhbiBjbGVhciBhbmQgd3JpdGUgcHJv
dGVjdCBpdCwKZGlmZiAtLWdpdCBhL2FyY2gveDg2L3hlbi9NYWtlZmlsZSBiL2FyY2gveDg2L3hl
bi9NYWtlZmlsZQppbmRleCAwODRkZTc3YTEwOWUuLjEwMmZhZDBiMGJjYSAxMDA2NDQKLS0tIGEv
YXJjaC94ODYveGVuL01ha2VmaWxlCisrKyBiL2FyY2gveDg2L3hlbi9NYWtlZmlsZQpAQCAtMSwz
ICsxLDEwIEBACitLQVNBTl9TQU5JVElaRV9lbmxpZ2h0ZW5fcHYubyA6PSBuCitLQVNBTl9TQU5J
VElaRV9lbmxpZ2h0ZW4ubyA6PSBuCitLQVNBTl9TQU5JVElaRV9pcnEubyA6PSBuCitLQVNBTl9T
QU5JVElaRV9tbXVfcHYubyA6PSBuCitLQVNBTl9TQU5JVElaRV9wMm0ubyA6PSBuCitLQVNBTl9T
QU5JVElaRV9tdWx0aWNhbGxzLm8gOj0gbgorCiAjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBH
UEwtMi4wCiBPQkpFQ1RfRklMRVNfTk9OX1NUQU5EQVJEX3hlbi1hc21fJChCSVRTKS5vIDo9IHkK
IApkaWZmIC0tZ2l0IGEvYXJjaC94ODYveGVuL2VubGlnaHRlbl9wdi5jIGIvYXJjaC94ODYveGVu
L2VubGlnaHRlbl9wdi5jCmluZGV4IGFlNGE0MWNhMTlmNi4uMjdkZTU1Njk5ZjI0IDEwMDY0NAot
LS0gYS9hcmNoL3g4Ni94ZW4vZW5saWdodGVuX3B2LmMKKysrIGIvYXJjaC94ODYveGVuL2VubGln
aHRlbl9wdi5jCkBAIC03Miw2ICs3Miw3IEBACiAjaW5jbHVkZSA8YXNtL213YWl0Lmg+CiAjaW5j
bHVkZSA8YXNtL3BjaV94ODYuaD4KICNpbmNsdWRlIDxhc20vY3B1Lmg+CisjaW5jbHVkZSA8YXNt
L2thc2FuLmg+CiAKICNpZmRlZiBDT05GSUdfQUNQSQogI2luY2x1ZGUgPGxpbnV4L2FjcGkuaD4K
QEAgLTEyMzEsNiArMTIzMiw4IEBAIGFzbWxpbmthZ2UgX192aXNpYmxlIHZvaWQgX19pbml0IHhl
bl9zdGFydF9rZXJuZWwodm9pZCkKIAkvKiBHZXQgbWZuIGxpc3QgKi8KIAl4ZW5fYnVpbGRfZHlu
YW1pY19waHlzX3RvX21hY2hpbmUoKTsKIAorCWthc2FuX2Vhcmx5X2luaXQoKTsKKwogCS8qCiAJ
ICogU2V0IHVwIGtlcm5lbCBHRFQgYW5kIHNlZ21lbnQgcmVnaXN0ZXJzLCBtYWlubHkgc28gdGhh
dAogCSAqIC1mc3RhY2stcHJvdGVjdG9yIGNvZGUgY2FuIGJlIGV4ZWN1dGVkLgpkaWZmIC0tZ2l0
IGEvYXJjaC94ODYveGVuL21tdV9wdi5jIGIvYXJjaC94ODYveGVuL21tdV9wdi5jCmluZGV4IGM4
ZGJlZTYyZWMyYS4uNWNkNjNlMzdhMmRiIDEwMDY0NAotLS0gYS9hcmNoL3g4Ni94ZW4vbW11X3B2
LmMKKysrIGIvYXJjaC94ODYveGVuL21tdV9wdi5jCkBAIC0xNzcxLDYgKzE3NzEsMzYgQEAgc3Rh
dGljIHZvaWQgX19pbml0IHNldF9wYWdlX3Byb3Qodm9pZCAqYWRkciwgcGdwcm90X3QgcHJvdCkK
IHsKIAlyZXR1cm4gc2V0X3BhZ2VfcHJvdF9mbGFncyhhZGRyLCBwcm90LCBVVk1GX05PTkUpOwog
fQorCitwZ2RfdCAqIF9faW5pdCB4ZW5fcHZfa2FzYW5fZWFybHlfaW5pdCh2b2lkKQoreworCS8q
IFBWIHBhZ2UgdGFibGVzIG11c3QgYmUgcmVhZC1vbmx5ICovCisJc2V0X3BhZ2VfcHJvdChrYXNh
bl9lYXJseV9zaGFkb3dfcHVkLCBQQUdFX0tFUk5FTF9STyk7CisJc2V0X3BhZ2VfcHJvdChrYXNh
bl9lYXJseV9zaGFkb3dfcG1kLCBQQUdFX0tFUk5FTF9STyk7CisJc2V0X3BhZ2VfcHJvdChrYXNh
bl9lYXJseV9zaGFkb3dfcHRlLCBQQUdFX0tFUk5FTF9STyk7CisKKwkvKiBSZXR1cm4gYSBwb2lu
dGVyIHRvIHRoZSBpbml0aWFsIFBWIHBhZ2UgdGFibGVzICovCisJcmV0dXJuIChwZ2RfdCAqKXhl
bl9zdGFydF9pbmZvLT5wdF9iYXNlOworfQorCit2b2lkIF9faW5pdCB4ZW5fcHZfa2FzYW5fcGlu
X3BnZChwZ2RfdCAqcGdkKQoreworCWlmICgheGVuX3B2X2RvbWFpbigpKQorCQlyZXR1cm47CisK
KwlzZXRfcGFnZV9wcm90KHBnZCwgUEFHRV9LRVJORUxfUk8pOworCXBpbl9wYWdldGFibGVfcGZu
KE1NVUVYVF9QSU5fTDRfVEFCTEUsIFBGTl9ET1dOKF9fcGFfc3ltYm9sKHBnZCkpKTsKK30KKwor
dm9pZCBfX2luaXQgeGVuX3B2X2thc2FuX3VucGluX3BnZChwZ2RfdCAqcGdkKQoreworCWlmICgh
eGVuX3B2X2RvbWFpbigpKQorCQlyZXR1cm47CisKKwlwaW5fcGFnZXRhYmxlX3BmbihNTVVFWFRf
VU5QSU5fVEFCTEUsIFBGTl9ET1dOKF9fcGFfc3ltYm9sKHBnZCkpKTsKKwlzZXRfcGFnZV9wcm90
KHBnZCwgUEFHRV9LRVJORUwpOworfQorCiAjaWZkZWYgQ09ORklHX1g4Nl8zMgogc3RhdGljIHZv
aWQgX19pbml0IHhlbl9tYXBfaWRlbnRpdHlfZWFybHkocG1kX3QgKnBtZCwgdW5zaWduZWQgbG9u
ZyBtYXhfcGZuKQogewpAQCAtMTk0Myw2ICsxOTczLDE0IEBAIHZvaWQgX19pbml0IHhlbl9zZXR1
cF9rZXJuZWxfcGFnZXRhYmxlKHBnZF90ICpwZ2QsIHVuc2lnbmVkIGxvbmcgbWF4X3BmbikKIAlp
ZiAoaSAmJiBpIDwgcGdkX2luZGV4KF9fU1RBUlRfS0VSTkVMX21hcCkpCiAJCWluaXRfdG9wX3Bn
dFtpXSA9ICgocGdkX3QgKil4ZW5fc3RhcnRfaW5mby0+cHRfYmFzZSlbaV07CiAKKyNpZmRlZiBD
T05GSUdfS0FTQU4KKwkvKiBDb3B5IEtBU0FOIG1hcHBpbmdzICovCisJZm9yIChpID0gcGdkX2lu
ZGV4KEtBU0FOX1NIQURPV19TVEFSVCk7CisJICAgICBpIDwgcGdkX2luZGV4KEtBU0FOX1NIQURP
V19FTkQpOworCSAgICAgaSsrKQorCQlpbml0X3RvcF9wZ3RbaV0gPSAoKHBnZF90ICopeGVuX3N0
YXJ0X2luZm8tPnB0X2Jhc2UpW2ldOworI2VuZGlmIC8qIGlmZGVmIENPTkZJR19LQVNBTiAqLwor
CiAJLyogTWFrZSBwYWdldGFibGUgcGllY2VzIFJPICovCiAJc2V0X3BhZ2VfcHJvdChpbml0X3Rv
cF9wZ3QsIFBBR0VfS0VSTkVMX1JPKTsKIAlzZXRfcGFnZV9wcm90KGxldmVsM19pZGVudF9wZ3Qs
IFBBR0VfS0VSTkVMX1JPKTsKZGlmZiAtLWdpdCBhL2RyaXZlcnMveGVuL01ha2VmaWxlIGIvZHJp
dmVycy94ZW4vTWFrZWZpbGUKaW5kZXggMGM0ZWZhNmZlNDUwLi4xZTllMWU0MWMwYTggMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMveGVuL01ha2VmaWxlCisrKyBiL2RyaXZlcnMveGVuL01ha2VmaWxlCkBA
IC0xLDQgKzEsNiBAQAogIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMAorS0FTQU5f
U0FOSVRJWkVfZmVhdHVyZXMubyA6PSBuCisKIG9iai0kKENPTkZJR19IT1RQTFVHX0NQVSkJCSs9
IGNwdV9ob3RwbHVnLm8KIG9iai15CSs9IGdyYW50LXRhYmxlLm8gZmVhdHVyZXMubyBiYWxsb29u
Lm8gbWFuYWdlLm8gcHJlZW1wdC5vIHRpbWUubwogb2JqLXkJKz0gbWVtLXJlc2VydmF0aW9uLm8K
ZGlmZiAtLWdpdCBhL2luY2x1ZGUveGVuL3hlbi1vcHMuaCBiL2luY2x1ZGUveGVuL3hlbi1vcHMu
aAppbmRleCBkODk5NjlhYTk5NDIuLjNkMjBmMDAwYWYxMiAxMDA2NDQKLS0tIGEvaW5jbHVkZS94
ZW4veGVuLW9wcy5oCisrKyBiL2luY2x1ZGUveGVuL3hlbi1vcHMuaApAQCAtMjQxLDQgKzI0MSwx
NCBAQCBzdGF0aWMgaW5saW5lIHZvaWQgeGVuX3ByZWVtcHRpYmxlX2hjYWxsX2VuZCh2b2lkKQog
CiAjZW5kaWYgLyogQ09ORklHX1BSRUVNUFQgKi8KIAorI2lmIGRlZmluZWQoQ09ORklHX1hFTl9Q
VikKK3BnZF90ICp4ZW5fcHZfa2FzYW5fZWFybHlfaW5pdCh2b2lkKTsKK3ZvaWQgeGVuX3B2X2th
c2FuX3Bpbl9wZ2QocGdkX3QgKnBnZCk7Cit2b2lkIHhlbl9wdl9rYXNhbl91bnBpbl9wZ2QocGdk
X3QgKnBnZCk7CisjZWxzZQorc3RhdGljIGlubGluZSBwZ2RfdCAqeGVuX3B2X2thc2FuX2Vhcmx5
X2luaXQodm9pZCkgeyByZXR1cm4gTlVMTDsgfQorc3RhdGljIGlubGluZSB2b2lkIHhlbl9wdl9r
YXNhbl9waW5fcGdkKHBnZF90ICpwZ2QpIHsgfQorc3RhdGljIGlubGluZSB2b2lkIHhlbl9wdl9r
YXNhbl91bnBpbl9wZ2QocGdkX3QgKnBnZCkgeyB9CisjZW5kaWYgLyogZGVmaW5lZChDT05GSUdf
WEVOX1BWKSAqLworCiAjZW5kaWYgLyogSU5DTFVERV9YRU5fT1BTX0ggKi8KZGlmZiAtLWdpdCBh
L2tlcm5lbC9NYWtlZmlsZSBiL2tlcm5lbC9NYWtlZmlsZQppbmRleCBmMmNjMGQxMThhMGIuLjFk
YTZmZDkzYzAwYyAxMDA2NDQKLS0tIGEva2VybmVsL01ha2VmaWxlCisrKyBiL2tlcm5lbC9NYWtl
ZmlsZQpAQCAtMTIsNiArMTIsOCBAQCBvYmoteSAgICAgPSBmb3JrLm8gZXhlY19kb21haW4ubyBw
YW5pYy5vIFwKIAkgICAgbm90aWZpZXIubyBrc3lzZnMubyBjcmVkLm8gcmVib290Lm8gXAogCSAg
ICBhc3luYy5vIHJhbmdlLm8gc21wYm9vdC5vIHVjb3VudC5vCiAKK0tBU0FOX1NBTklUSVpFX2Nw
dS5vIDo9IG4KKwogb2JqLSQoQ09ORklHX01PRFVMRVMpICs9IGttb2Qubwogb2JqLSQoQ09ORklH
X01VTFRJVVNFUikgKz0gZ3JvdXBzLm8KIApkaWZmIC0tZ2l0IGEvbGliL0tjb25maWcua2FzYW4g
Yi9saWIvS2NvbmZpZy5rYXNhbgppbmRleCA4MWY1NDY0ZWE5ZTEuLjQyOWE2Mzg2MjVlYSAxMDA2
NDQKLS0tIGEvbGliL0tjb25maWcua2FzYW4KKysrIGIvbGliL0tjb25maWcua2FzYW4KQEAgLTk4
LDYgKzk4LDcgQEAgY29uZmlnIEtBU0FOX09VVExJTkUKIAogY29uZmlnIEtBU0FOX0lOTElORQog
CWJvb2wgIklubGluZSBpbnN0cnVtZW50YXRpb24iCisJZGVwZW5kcyBvbiAhWEVOX1BWCiAJaGVs
cAogCSAgQ29tcGlsZXIgZGlyZWN0bHkgaW5zZXJ0cyBjb2RlIGNoZWNraW5nIHNoYWRvdyBtZW1v
cnkgYmVmb3JlCiAJICBtZW1vcnkgYWNjZXNzZXMuIFRoaXMgaXMgZmFzdGVyIHRoYW4gb3V0bGlu
ZSAoaW4gc29tZSB3b3JrbG9hZHMKQEAgLTE0Nyw3ICsxNDgsNyBAQCBjb25maWcgS0FTQU5fU1df
VEFHU19JREVOVElGWQogCiBjb25maWcgS0FTQU5fVk1BTExPQwogCWJvb2wgIkJhY2sgbWFwcGlu
Z3MgaW4gdm1hbGxvYyBzcGFjZSB3aXRoIHJlYWwgc2hhZG93IG1lbW9yeSIKLQlkZXBlbmRzIG9u
IEtBU0FOICYmIEhBVkVfQVJDSF9LQVNBTl9WTUFMTE9DCisJZGVwZW5kcyBvbiBLQVNBTiAmJiBI
QVZFX0FSQ0hfS0FTQU5fVk1BTExPQyAmJiAhWEVOX1BWCiAJaGVscAogCSAgQnkgZGVmYXVsdCwg
dGhlIHNoYWRvdyByZWdpb24gZm9yIHZtYWxsb2Mgc3BhY2UgaXMgdGhlIHJlYWQtb25seQogCSAg
emVybyBwYWdlLiBUaGlzIG1lYW5zIHRoYXQgS0FTQU4gY2Fubm90IGRldGVjdCBlcnJvcnMgaW52
b2x2aW5nCi0tIAoyLjE3LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
