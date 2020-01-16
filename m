Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E72E813DF83
	for <lists+xen-devel@lfdr.de>; Thu, 16 Jan 2020 17:03:40 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1is7ZE-0007vj-0q; Thu, 16 Jan 2020 16:00:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=nMvQ=3F=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1is7ZC-0007ve-Hf
 for xen-devel@lists.xenproject.org; Thu, 16 Jan 2020 16:00:18 +0000
X-Inumbo-ID: 452806d0-3879-11ea-a985-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 452806d0-3879-11ea-a985-bc764e2007e4;
 Thu, 16 Jan 2020 16:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579190409;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=5R2V5+tIVMkTgKNkpcdcHLvGCSEp357re7PioKsT3TM=;
 b=ZxdQWflzfW7sxHYOM1oHPUB3B2H4Tpir6CsYqrHtAwlduc54BErfBJRB
 wEqJi2xL8udHVBnXIs38KFHB+wZeJngvN764jyB+X49RCshhjRnf4kBPk
 y5QYqATRNBhMUpinVXlbQFNFtUY7uWrJIbqaleryAUZ8lGBTt/EVPy9wG I=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=igor.druzhinin@citrix.com;
 spf=Pass smtp.mailfrom=igor.druzhinin@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 igor.druzhinin@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 igor.druzhinin@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: k9HR0y3BI9tmGKywhQc6plfVMHhqVRIYOOIVs2X+B5kR4TGY8i7UOk2lvvF/K+0ok5Hvu0rkwt
 Z5GzoSsAL7zv4I0A3+oqBw+p9kJ27xJ82HdeC5YT0tYnxAoXdI+LHm4qU8ForAsQnKINxpGQNG
 LkU6Ec6myQSB4glyiDCOalQZSk6nT4z4J2qZvFGCUBajP+HJNZ2mOLnDSGw10e3b8HfsyWqDki
 9vwosi5Gf9N7L3qNYdjLuFMA68iFjxjd12hUNi0Jb6PgDJNbjUVyZBNAHXMlWasuf44AYHxGGz
 NFo=
X-SBRS: 2.7
X-MesageID: 11190833
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,326,1574139600"; d="scan'208";a="11190833"
From: Igor Druzhinin <igor.druzhinin@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 16 Jan 2020 16:00:03 +0000
Message-ID: <1579190403-23720-1-git-send-email-igor.druzhinin@citrix.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] x86/sm{e,
 a}p: do not enable SMEP/SMAP in PV shim by default on AMD
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
Cc: Igor Druzhinin <igor.druzhinin@citrix.com>, sstabellini@kernel.org,
 julien@xen.org, wl@xen.org, konrad.wilk@oracle.com,
 George.Dunlap@eu.citrix.com, andrew.cooper3@citrix.com,
 ian.jackson@eu.citrix.com, jbeulich@suse.com, roger.pau@citrix.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RHVlIHRvIEFNRCBhbmQgSHlnb24gYmVpbmcgdW5hYmxlIHRvIHNlbGVjdGl2ZWx5IHRyYXAgQ1I0
IGJpdCBtb2RpZmljYXRpb25zCnJ1bm5pbmcgMzItYml0IFBWIGd1ZXN0IGluc2lkZSBQViBzaGlt
IGNvbWVzIHdpdGggc2lnbmlmaWNhbnQgcGVyZm9ybWFuY2UKaGl0LiBNb3Jlb3ZlciwgZm9yIFNN
RVAgaW4gcGFydGljdWxhciBldmVyeSB0aW1lIENSNC5TTUVQIGNoYW5nZXMgb24gY29udGV4dApz
d2l0Y2ggdG8vZnJvbSAzMi1iaXQgUFYgZ3Vlc3QsIGl0IGdldHMgdHJhcHBlZCBieSBMMCBYZW4g
d2hpY2ggdGhlbgp0cmllcyB0byBwZXJmb3JtIGdsb2JhbCBUTEIgaW52YWxpZGF0aW9uIGZvciBQ
ViBzaGltIGRvbWFpbi4gVGhpcyB1c3VhbGx5CnJlc3VsdHMgaW4gZXZlbnR1YWwgaGFuZyBvZiBh
IFBWIHNoaW0gd2l0aCBhdCBsZWFzdCBzZXZlcmFsIHZDUFVzLgoKU2luY2UgdGhlIG92ZXJhbGwg
c2VjdXJpdHkgcmlzayBpcyBnZW5lcmFsbHkgbG93ZXIgZm9yIHNoaW0gWGVuIGFzIGl0IGJlaW5n
CnRoZXJlIG1vcmUgb2YgYSBkZWZlbnNlLWluLWRlcHRoIG1lY2hhbmlzbSwgY2hvb3NlIHRvIGRp
c2FibGUgU01FUC9TTUFQIGluCml0IGJ5IGRlZmF1bHQgb24gQU1EIGFuZCBIeWdvbiB1bmxlc3Mg
YSB1c2VyIGNob3NlIG90aGVyd2lzZS4KClNpZ25lZC1vZmYtYnk6IElnb3IgRHJ1emhpbmluIDxp
Z29yLmRydXpoaW5pbkBjaXRyaXguY29tPgotLS0KSSdtIGEgbGl0dGxlIGJpdCBvbiB0aGUgZmVu
Y2Ugd2l0aCB0aGlzIG9uZS4gV2UncmUgaGF2aW5nIHRoZSBzYW1lIGlzc3VlIHdpdGgKZ2VuZXJh
bCBuZXN0ZWQgdmlydCBidXQgSSdtIG5vdCBpbmNsaW5lZCB0byB0cmFkZSBzZWN1cml0eSBmb3Ig
YSB1c2VyIGluCmdlbmVyYWwgY2FzZS4gRGlzYWJsaW5nIGl0IGJ5IGRlZmF1bHQgZm9yIFBWIHNo
aW0gb25seSBzZWVtcyByYXRoZXIgaW5vY3VvdXMKZHVlIHRvIHRoZSB1c2UgY2FzZSByZXN0cmlj
aW9uLiBJJ2QgbGlrZSB0byBoZWFyIG1vcmUgb3BpbmlvbnMuCi0tLQogZG9jcy9taXNjL3hlbi1j
b21tYW5kLWxpbmUucGFuZG9jIHwgMTAgKysrKysrKystLQogeGVuL2FyY2gveDg2L3NldHVwLmMg
ICAgICAgICAgICAgIHwgMjAgKysrKysrKysrKysrKystLS0tLS0KIDIgZmlsZXMgY2hhbmdlZCwg
MjIgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kb2NzL21pc2Mv
eGVuLWNvbW1hbmQtbGluZS5wYW5kb2MgYi9kb2NzL21pc2MveGVuLWNvbW1hbmQtbGluZS5wYW5k
b2MKaW5kZXggOTgxYTVlMi4uMDViMmRkZSAxMDA2NDQKLS0tIGEvZG9jcy9taXNjL3hlbi1jb21t
YW5kLWxpbmUucGFuZG9jCisrKyBiL2RvY3MvbWlzYy94ZW4tY29tbWFuZC1saW5lLnBhbmRvYwpA
QCAtMTkzNiwxOSArMTkzNiwyNSBAQCBpcyAxTUIuCiAjIyMgc21hcCAoeDg2KQogPiBgPSA8Ym9v
bGVhbj4gfCBodm1gCiAKLT4gRGVmYXVsdDogYHRydWVgCis+IERlZmF1bHQ6IGB0cnVlYCB1bmxl
c3MgcnVubmluZyBpbiBwdi1zaGltIG1vZGUgb24gQU1EIG9yIEh5Z29uIGhhcmR3YXJlCiAKIEZs
YWcgdG8gZW5hYmxlIFN1cGVydmlzb3IgTW9kZSBBY2Nlc3MgUHJldmVudGlvbgogVXNlIGBzbWFw
PWh2bWAgdG8gYWxsb3cgU01BUCB1c2UgYnkgSFZNIGd1ZXN0cyBvbmx5LgogCitJbiBQViBzaGlt
IG1vZGUgb24gQU1EIG9yIEh5Z29uIGhhcmR3YXJlIGR1ZSB0byBzaWduaWZpY2FudCBwZXJmb21h
bmNlIGltcGFjdAoraW4gc29tZSBjYXNlcyBhbmQgZ2VuZXJhbGx5IGxvd2VyIHNlY3VyaXR5IHJp
c2sgdGhlIG9wdGlvbiBkZWZhdWx0cyB0byBmYWxzZS4KKwogIyMjIHNtZXAgKHg4NikKID4gYD0g
PGJvb2xlYW4+IHwgaHZtYAogCi0+IERlZmF1bHQ6IGB0cnVlYAorPiBEZWZhdWx0OiBgdHJ1ZWAg
dW5sZXNzIHJ1bm5pbmcgaW4gcHYtc2hpbSBtb2RlIG9uIEFNRCBvciBIeWdvbiBoYXJkd2FyZQog
CiBGbGFnIHRvIGVuYWJsZSBTdXBlcnZpc29yIE1vZGUgRXhlY3V0aW9uIFByb3RlY3Rpb24KIFVz
ZSBgc21lcD1odm1gIHRvIGFsbG93IFNNRVAgdXNlIGJ5IEhWTSBndWVzdHMgb25seS4KIAorSW4g
UFYgc2hpbSBtb2RlIG9uIEFNRCBvciBIeWdvbiBoYXJkd2FyZSBkdWUgdG8gc2lnbmlmaWNhbnQg
cGVyZm9tYW5jZSBpbXBhY3QKK2luIHNvbWUgY2FzZXMgYW5kIGdlbmVyYWxseSBsb3dlciBzZWN1
cml0eSByaXNrIHRoZSBvcHRpb24gZGVmYXVsdHMgdG8gZmFsc2UuCisKICMjIyBzbXQgKHg4NikK
ID4gYD0gPGJvb2xlYW4+YAogCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvc2V0dXAuYyBiL3hl
bi9hcmNoL3g4Ni9zZXR1cC5jCmluZGV4IDViZGMyMjkuLjg0MzJiNzcgMTAwNjQ0Ci0tLSBhL3hl
bi9hcmNoL3g4Ni9zZXR1cC5jCisrKyBiL3hlbi9hcmNoL3g4Ni9zZXR1cC5jCkBAIC0xMDUsOSAr
MTA1LDkgQEAgc3RydWN0IGNwdWluZm9feDg2IF9fcmVhZF9tb3N0bHkgYm9vdF9jcHVfZGF0YSA9
IHsgMCwgMCwgMCwgMCwgLTEgfTsKIAogdW5zaWduZWQgbG9uZyBfX3JlYWRfbW9zdGx5IG1tdV9j
cjRfZmVhdHVyZXMgPSBYRU5fTUlOSU1BTF9DUjQ7CiAKLS8qIHNtZXA6IEVuYWJsZS9kaXNhYmxl
IFN1cGVydmlzb3IgTW9kZSBFeGVjdXRpb24gUHJvdGVjdGlvbiAoZGVmYXVsdCBvbikuICovCi0j
ZGVmaW5lIFNNRVBfSFZNX09OTFkgKC0xKQotc3RhdGljIHM4IF9faW5pdGRhdGEgb3B0X3NtZXAg
PSAxOworLyogc21lcDogRW5hYmxlL2Rpc2FibGUgU3VwZXJ2aXNvciBNb2RlIEV4ZWN1dGlvbiBQ
cm90ZWN0aW9uICovCisjZGVmaW5lIFNNRVBfSFZNX09OTFkgKC0yKQorc3RhdGljIHM4IF9faW5p
dGRhdGEgb3B0X3NtZXAgPSAtMTsKIAogLyoKICAqIEluaXRpYWwgZG9tYWluIHBsYWNlIGhvbGRl
ci4gTmVlZHMgdG8gYmUgZ2xvYmFsIHNvIGl0IGNhbiBiZSBjcmVhdGVkIGluCkBAIC0xNDIsOSAr
MTQyLDkgQEAgc3RhdGljIGludCBfX2luaXQgcGFyc2Vfc21lcF9wYXJhbShjb25zdCBjaGFyICpz
KQogfQogY3VzdG9tX3BhcmFtKCJzbWVwIiwgcGFyc2Vfc21lcF9wYXJhbSk7CiAKLS8qIHNtYXA6
IEVuYWJsZS9kaXNhYmxlIFN1cGVydmlzb3IgTW9kZSBBY2Nlc3MgUHJldmVudGlvbiAoZGVmYXVs
dCBvbikuICovCi0jZGVmaW5lIFNNQVBfSFZNX09OTFkgKC0xKQotc3RhdGljIHM4IF9faW5pdGRh
dGEgb3B0X3NtYXAgPSAxOworLyogc21hcDogRW5hYmxlL2Rpc2FibGUgU3VwZXJ2aXNvciBNb2Rl
IEFjY2VzcyBQcmV2ZW50aW9uICovCisjZGVmaW5lIFNNQVBfSFZNX09OTFkgKC0yKQorc3RhdGlj
IHM4IF9faW5pdGRhdGEgb3B0X3NtYXAgPSAtMTsKIAogc3RhdGljIGludCBfX2luaXQgcGFyc2Vf
c21hcF9wYXJhbShjb25zdCBjaGFyICpzKQogewpAQCAtMTYxNiw2ICsxNjE2LDE0IEBAIHZvaWQg
X19pbml0IG5vcmV0dXJuIF9fc3RhcnRfeGVuKHVuc2lnbmVkIGxvbmcgbWJpX3ApCiAKICAgICBz
ZXRfaW5fY3I0KFg4Nl9DUjRfT1NGWFNSIHwgWDg2X0NSNF9PU1hNTUVYQ1BUKTsKIAorICAgIC8q
IERvIG5vdCBlbmFibGUgU01FUC9TTUFQIGluIFBWIHNoaW0gb24gQU1EIGFuZCBIeWdvbiBieSBk
ZWZhdWx0ICovCisgICAgaWYgKCBvcHRfc21lcCA9PSAtMSApCisgICAgICAgIG9wdF9zbWVwID0g
IXB2X3NoaW0gfHwgIShib290X2NwdV9kYXRhLng4Nl92ZW5kb3IgJgorICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAoWDg2X1ZFTkRPUl9BTUQgfCBYODZfVkVORE9SX0hZR09OKSk7Cisg
ICAgaWYgKCBvcHRfc21hcCA9PSAtMSApCisgICAgICAgIG9wdF9zbWFwID0gIXB2X3NoaW0gfHwg
IShib290X2NwdV9kYXRhLng4Nl92ZW5kb3IgJgorICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAoWDg2X1ZFTkRPUl9BTUQgfCBYODZfVkVORE9SX0hZR09OKSk7CisKICAgICBpZiAoICFv
cHRfc21lcCApCiAgICAgICAgIHNldHVwX2NsZWFyX2NwdV9jYXAoWDg2X0ZFQVRVUkVfU01FUCk7
CiAgICAgaWYgKCBjcHVfaGFzX3NtZXAgJiYgb3B0X3NtZXAgIT0gU01FUF9IVk1fT05MWSApCi0t
IAoyLjcuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
