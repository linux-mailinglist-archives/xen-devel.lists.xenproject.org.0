Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BCE415902D
	for <lists+xen-devel@lfdr.de>; Tue, 11 Feb 2020 14:44:28 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j1Vo8-0005op-Qi; Tue, 11 Feb 2020 13:42:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pFJM=37=citrix.com=sergey.dyasli@srs-us1.protection.inumbo.net>)
 id 1j1Vo7-0005oj-Dl
 for xen-devel@lists.xen.org; Tue, 11 Feb 2020 13:42:31 +0000
X-Inumbo-ID: 58b77afe-4cd4-11ea-8d48-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 58b77afe-4cd4-11ea-8d48-bc764e2007e4;
 Tue, 11 Feb 2020 13:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1581428549;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=LzZdjxeovOAjuW2fRy9P0iCKqWm7ctYmXUJ6+k/RVNM=;
 b=SrA/gFMWsTkItFue9v8ApPF5n1iu/UqyTqLQBx8ILCuFkHFkJQrdMzdu
 OM1ehnrAhRnq2dz4a4Ei9BDZm+W5RoJ+X784EOcAn2TC7X7cKGHG3Qr8+
 MCZTMohMtd6goXLb27B7jpTWBUIc/A9TOySh/54h9kfSfTrmlbE40iHEh E=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=sergey.dyasli@citrix.com;
 spf=Pass smtp.mailfrom=sergey.dyasli@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 sergey.dyasli@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="sergey.dyasli@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 sergey.dyasli@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="sergey.dyasli@citrix.com";
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
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: bNxA+R7gyur1Sj2L3TtRRoObJ5CYr0WG215h7iTjx3fQ3bIV2wfJe3sIEq0l0g/Mqaycgdj2O7
 Lr6SKHdNv5LGUGeHNeh5LYonnQUDAZP6n54mGHxK7rHi9pJg0xjRXbQoCifh7vM5VoQ19k5gsX
 oTpElFjoSQOF3GcUlZBJaXMd/Jx03iM+jARSFJfSx6Kzu7s4I8x1ZLrPdsU2SwSyxCUrY2n3Ql
 CRKjT4XkAV/v65dFSDXf1mUsYFzvJcV6vdAXc9sy9Juz9bGPsJY7IjJ+9LvWSn/G8JSN8IhF8Z
 4MU=
X-SBRS: 2.7
X-MesageID: 12638711
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,428,1574139600"; d="scan'208";a="12638711"
From: Sergey Dyasli <sergey.dyasli@citrix.com>
To: <xen-devel@lists.xen.org>
Date: Tue, 11 Feb 2020 13:42:20 +0000
Message-ID: <20200211134220.9194-3-sergey.dyasli@citrix.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200211134220.9194-1-sergey.dyasli@citrix.com>
References: <20200211134220.9194-1-sergey.dyasli@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v4 2/2] xsm: hide detailed Xen version from
 unprivileged guests
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
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Doug Goldstein <cardoe@cardoe.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGlkZSB0aGUgZm9sbG93aW5nIGluZm9ybWF0aW9uIHRoYXQgY2FuIGhlbHAgaWRlbnRpZnkgdGhl
IHJ1bm5pbmcgWGVuCmJpbmFyeSB2ZXJzaW9uOiBYRU5WRVJfW2V4dHJhdmVyc2lvbnxjb21waWxl
X2luZm98Y2hhbmdlc2V0XQpUaGlzIG1ha2VzIGhhcmRlciBmb3IgbWFsaWNpb3VzIGd1ZXN0cyB0
byBmaW5nZXJwcmludCBYZW4gdG8gaWRlbnRpZnkKZXhwbG9pdGFibGUgc3lzdGVtcy4KCkludHJv
ZHVjZSB4c21fZmlsdGVyX2RlbmllZCgpIHRvIGh2bWxvYWRlciB0byByZW1vdmUgIjxkZW5pZWQ+
IiBzdHJpbmcKZnJvbSBndWVzdCdzIERNSSB0YWJsZXMgdGhhdCBvdGhlcndpc2Ugd291bGQgYmUg
c2hvd24gaW4gdG9vbHMgbGlrZQpkbWlkZWNvZGUuCgpXaGlsZSBhdCBpdCwgYWRkIGV4cGxpY2l0
IGNhc2VzIGZvciBYRU5WRVJfW2NvbW1hbmRsaW5lfGJ1aWxkX2lkXQpmb3IgYmV0dGVyIGNvZGUg
cmVhZGFiaWxpdHkuIEFkZCBhIGRlZmF1bHQgY2FzZSB3aXRoIGFuIEFTU0VSVCB0byBtYWtlCnN1
cmUgdGhhdCBldmVyeSBjYXNlIGlzIGV4cGxpY2l0bHkgbGlzdGVkIGFzIHdlbGwuCgpTaWduZWQt
b2ZmLWJ5OiBTZXJnZXkgRHlhc2xpIDxzZXJnZXkuZHlhc2xpQGNpdHJpeC5jb20+Ci0tLQp2MyAt
LT4gdjQ6Ci0gVXBkYXRlZCBjb21taXQgbWVzc2FnZQotIFJlLWFkZCBodm1sb2FkZXIgZmlsdGVy
aW5nCgp2MiAtLT4gdjM6Ci0gUmVtb3ZlIGh2bWxvYWRlciBmaWx0ZXJpbmcKLSBBZGQgQVNTRVJU
X1VOUkVBQ0hBQkxFCgp2MSAtLT4gdjI6Ci0gQWRkZWQgeHNtX2ZpbHRlcl9kZW5pZWQoKSB0byBo
dm1sb2FkZXIgaW5zdGVhZCBvZiBtb2RpZnlpbmcgeGVuX2RlbnkoKQotIE1hZGUgYmVoYXZpb3Vy
IHRoZSBzYW1lIGZvciBib3RoIFJlbGVhc2UgYW5kIERlYnVnIGJ1aWxkcwotIFhFTlZFUl9jYXBh
YmlsaXRpZXMgaXMgbm8gbG9uZ2VyIGhpZGVkCgotLS0KIHRvb2xzL2Zpcm13YXJlL2h2bWxvYWRl
ci9odm1sb2FkZXIuYyB8ICAxICsKIHRvb2xzL2Zpcm13YXJlL2h2bWxvYWRlci9zbWJpb3MuYyAg
ICB8ICAxICsKIHRvb2xzL2Zpcm13YXJlL2h2bWxvYWRlci91dGlsLmMgICAgICB8IDExICsrKysr
KysrKysrCiB0b29scy9maXJtd2FyZS9odm1sb2FkZXIvdXRpbC5oICAgICAgfCAgMiArKwogeGVu
L2luY2x1ZGUveHNtL2R1bW15LmggICAgICAgICAgICAgIHwgMTUgKysrKysrKysrKystLS0tCiA1
IGZpbGVzIGNoYW5nZWQsIDI2IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEvdG9vbHMvZmlybXdhcmUvaHZtbG9hZGVyL2h2bWxvYWRlci5jIGIvdG9vbHMvZmlybXdh
cmUvaHZtbG9hZGVyL2h2bWxvYWRlci5jCmluZGV4IDU5OGEyMjYyNzguLmIzNTg5OWYyZmIgMTAw
NjQ0Ci0tLSBhL3Rvb2xzL2Zpcm13YXJlL2h2bWxvYWRlci9odm1sb2FkZXIuYworKysgYi90b29s
cy9maXJtd2FyZS9odm1sb2FkZXIvaHZtbG9hZGVyLmMKQEAgLTE0Nyw2ICsxNDcsNyBAQCBzdGF0
aWMgdm9pZCBpbml0X2h5cGVyY2FsbHModm9pZCkKICAgICAvKiBQcmludCB2ZXJzaW9uIGluZm9y
bWF0aW9uLiAqLwogICAgIGNwdWlkKGJhc2UgKyAxLCAmZWF4LCAmZWJ4LCAmZWN4LCAmZWR4KTsK
ICAgICBoeXBlcmNhbGxfeGVuX3ZlcnNpb24oWEVOVkVSX2V4dHJhdmVyc2lvbiwgZXh0cmF2ZXJz
aW9uKTsKKyAgICB4c21fZmlsdGVyX2RlbmllZChleHRyYXZlcnNpb24pOwogICAgIHByaW50Zigi
RGV0ZWN0ZWQgWGVuIHYldS4ldSVzXG4iLCBlYXggPj4gMTYsIGVheCAmIDB4ZmZmZiwgZXh0cmF2
ZXJzaW9uKTsKIH0KIApkaWZmIC0tZ2l0IGEvdG9vbHMvZmlybXdhcmUvaHZtbG9hZGVyL3NtYmlv
cy5jIGIvdG9vbHMvZmlybXdhcmUvaHZtbG9hZGVyL3NtYmlvcy5jCmluZGV4IDk3YTA1NGU5ZTMu
LmE3MWJmZTgzOTIgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2Zpcm13YXJlL2h2bWxvYWRlci9zbWJpb3Mu
YworKysgYi90b29scy9maXJtd2FyZS9odm1sb2FkZXIvc21iaW9zLmMKQEAgLTI3NSw2ICsyNzUs
NyBAQCBodm1fd3JpdGVfc21iaW9zX3RhYmxlcygKICAgICB4ZW5fbWlub3JfdmVyc2lvbiA9ICh1
aW50MTZfdCkgeGVuX3ZlcnNpb247CiAKICAgICBoeXBlcmNhbGxfeGVuX3ZlcnNpb24oWEVOVkVS
X2V4dHJhdmVyc2lvbiwgeGVuX2V4dHJhX3ZlcnNpb24pOworICAgIHhzbV9maWx0ZXJfZGVuaWVk
KHhlbl9leHRyYV92ZXJzaW9uKTsKIAogICAgIC8qIGJ1aWxkIHVwIGh1bWFuLXJlYWRhYmxlIFhl
biB2ZXJzaW9uIHN0cmluZyAqLwogICAgIHAgPSB4ZW5fdmVyc2lvbl9zdHI7CmRpZmYgLS1naXQg
YS90b29scy9maXJtd2FyZS9odm1sb2FkZXIvdXRpbC5jIGIvdG9vbHMvZmlybXdhcmUvaHZtbG9h
ZGVyL3V0aWwuYwppbmRleCAwYzNmMmQyNGNkLi40OWI0YjMyMWUzIDEwMDY0NAotLS0gYS90b29s
cy9maXJtd2FyZS9odm1sb2FkZXIvdXRpbC5jCisrKyBiL3Rvb2xzL2Zpcm13YXJlL2h2bWxvYWRl
ci91dGlsLmMKQEAgLTI4LDYgKzI4LDcgQEAKICNpbmNsdWRlIDx4ZW4veGVuLmg+CiAjaW5jbHVk
ZSA8eGVuL21lbW9yeS5oPgogI2luY2x1ZGUgPHhlbi9zY2hlZC5oPgorI2luY2x1ZGUgPHhlbi92
ZXJzaW9uLmg+CiAjaW5jbHVkZSA8eGVuL2h2bS9odm1feHNfc3RyaW5ncy5oPgogI2luY2x1ZGUg
PHhlbi9odm0vcGFyYW1zLmg+CiAKQEAgLTk5NSw2ICs5OTYsMTYgQEAgdm9pZCBodm1sb2FkZXJf
YWNwaV9idWlsZF90YWJsZXMoc3RydWN0IGFjcGlfY29uZmlnICpjb25maWcsCiAgICAgaHZtX3Bh
cmFtX3NldChIVk1fUEFSQU1fVk1fR0VORVJBVElPTl9JRF9BRERSLCBjb25maWctPnZtX2dpZF9h
ZGRyKTsKIH0KIAordm9pZCB4c21fZmlsdGVyX2RlbmllZChjaGFyICpzdHIpCit7CisgICAgeGVu
X2RlbmllZF9zdHJpbmdfdCBkZW55X3N0ciA9ICIiOworCisgICAgaHlwZXJjYWxsX3hlbl92ZXJz
aW9uKFhFTlZFUl9kZW5pZWRfc3RyaW5nLCBkZW55X3N0cik7CisKKyAgICBpZiAoIHN0cmNtcChz
dHIsIGRlbnlfc3RyKSA9PSAwICkKKyAgICAgICAgKnN0ciA9ICdcMCc7Cit9CisKIC8qCiAgKiBM
b2NhbCB2YXJpYWJsZXM6CiAgKiBtb2RlOiBDCmRpZmYgLS1naXQgYS90b29scy9maXJtd2FyZS9o
dm1sb2FkZXIvdXRpbC5oIGIvdG9vbHMvZmlybXdhcmUvaHZtbG9hZGVyL3V0aWwuaAppbmRleCA3
YmNhNjQxOGQyLi5lNGZkMjZkZTlkIDEwMDY0NAotLS0gYS90b29scy9maXJtd2FyZS9odm1sb2Fk
ZXIvdXRpbC5oCisrKyBiL3Rvb2xzL2Zpcm13YXJlL2h2bWxvYWRlci91dGlsLmgKQEAgLTI4Niw2
ICsyODYsOCBAQCBzdHJ1Y3QgYWNwaV9jb25maWc7CiB2b2lkIGh2bWxvYWRlcl9hY3BpX2J1aWxk
X3RhYmxlcyhzdHJ1Y3QgYWNwaV9jb25maWcgKmNvbmZpZywKICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHVuc2lnbmVkIGludCBwaHlzaWNhbCk7CiAKK3ZvaWQgeHNtX2ZpbHRlcl9k
ZW5pZWQoY2hhciAqc3RyKTsKKwogI2VuZGlmIC8qIF9fSFZNTE9BREVSX1VUSUxfSF9fICovCiAK
IC8qCmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS94c20vZHVtbXkuaCBiL3hlbi9pbmNsdWRlL3hz
bS9kdW1teS5oCmluZGV4IDcyYTEwMWIxMDYuLjI1NjdjY2FhMGEgMTAwNjQ0Ci0tLSBhL3hlbi9p
bmNsdWRlL3hzbS9kdW1teS5oCisrKyBiL3hlbi9pbmNsdWRlL3hzbS9kdW1teS5oCkBAIC03NTEs
MTYgKzc1MSwyMyBAQCBzdGF0aWMgWFNNX0lOTElORSBpbnQgeHNtX3hlbl92ZXJzaW9uIChYU01f
REVGQVVMVF9BUkcgdWludDMyX3Qgb3ApCiAgICAgY2FzZSBYRU5WRVJfZGVuaWVkX3N0cmluZzoK
ICAgICAgICAgLyogVGhlc2Ugc3ViLW9wcyBpZ25vcmUgdGhlIHBlcm1pc3Npb24gY2hlY2tzIGFu
ZCByZXR1cm4gZGF0YS4gKi8KICAgICAgICAgcmV0dXJuIDA7Ci0gICAgY2FzZSBYRU5WRVJfZXh0
cmF2ZXJzaW9uOgotICAgIGNhc2UgWEVOVkVSX2NvbXBpbGVfaW5mbzoKKwogICAgIGNhc2UgWEVO
VkVSX2NhcGFiaWxpdGllczoKLSAgICBjYXNlIFhFTlZFUl9jaGFuZ2VzZXQ6CiAgICAgY2FzZSBY
RU5WRVJfcGFnZXNpemU6CiAgICAgY2FzZSBYRU5WRVJfZ3Vlc3RfaGFuZGxlOgogICAgICAgICAv
KiBUaGVzZSBNVVNUIGFsd2F5cyBiZSBhY2Nlc3NpYmxlIHRvIGFueSBndWVzdCBieSBkZWZhdWx0
LiAqLwogICAgICAgICByZXR1cm4geHNtX2RlZmF1bHRfYWN0aW9uKFhTTV9IT09LLCBjdXJyZW50
LT5kb21haW4sIE5VTEwpOwotICAgIGRlZmF1bHQ6CisKKyAgICBjYXNlIFhFTlZFUl9leHRyYXZl
cnNpb246CisgICAgY2FzZSBYRU5WRVJfY29tcGlsZV9pbmZvOgorICAgIGNhc2UgWEVOVkVSX2No
YW5nZXNldDoKKyAgICBjYXNlIFhFTlZFUl9jb21tYW5kbGluZToKKyAgICBjYXNlIFhFTlZFUl9i
dWlsZF9pZDoKICAgICAgICAgcmV0dXJuIHhzbV9kZWZhdWx0X2FjdGlvbihYU01fUFJJViwgY3Vy
cmVudC0+ZG9tYWluLCBOVUxMKTsKKworICAgIGRlZmF1bHQ6CisgICAgICAgIEFTU0VSVF9VTlJF
QUNIQUJMRSgpOworICAgICAgICByZXR1cm4gLUVQRVJNOwogICAgIH0KIH0KIAotLSAKMi4xNy4x
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
