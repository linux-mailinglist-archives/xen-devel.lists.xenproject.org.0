Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0C0B10D8DA
	for <lists+xen-devel@lfdr.de>; Fri, 29 Nov 2019 18:23:23 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iajwP-0004YW-7U; Fri, 29 Nov 2019 17:20:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=UeaM=ZV=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iajwN-0004YR-NB
 for xen-devel@lists.xenproject.org; Fri, 29 Nov 2019 17:20:23 +0000
X-Inumbo-ID: 85c9ba58-12cc-11ea-a3e7-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 85c9ba58-12cc-11ea-a3e7-12813bfff9fa;
 Fri, 29 Nov 2019 17:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1575048022;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9xMYwalkvmeMpWEMCV0edlvlbtCdMxWFQZknwYonZYE=;
 b=EKAO67mAIzLVr8FZV2jKk8woLGjKtSn7ECp02zY7jmlgPOSTC56gFQbK
 DWsQQ+wM+ytaGsAJ6xojj46w6vC6aY2kfp57p5QPqNU3g0F54JbhmxSrZ
 oSRP2OejHBIlXTDWCKTZknjyyyd9W3JKoFfHBUkG2WYw0hfhH1gkGXmQC Y=;
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
IronPort-SDR: RX/enVVGPXbr9HwVuou9WPJYZQmbZYUEQuPO9cZ2zbH9jOuRP6dm2ZMzW95boN6g+dVSidQGB5
 kMbwg5jaUd0gelINOxeEvrEwrEkHVOmRpuhip4yiulQ+3ZDGB/yZ7NpFLX0oPEr0tLsMLJtus4
 Fea/ajfCXQ1XuYiRqYe1nUbHf8Xt+MNHuaB4e6zwAoiiOB6xGvAXtAXlNjsPKhyi0FlTt4jELl
 rOfbxGkCzzyqG/SU5C3DlSj6RZGBYQ9en8FhyAF3TzY8S/j7hNiOY7Y8b3dGknjIdrLDA9s2M0
 Ow4=
X-SBRS: 2.7
X-MesageID: 8999015
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,257,1571716800"; 
   d="scan'208";a="8999015"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Fri, 29 Nov 2019 17:20:16 +0000
Message-ID: <20191129172016.30689-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20191128114414.21716-1-andrew.cooper3@citrix.com>
References: <20191128114414.21716-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH for-next v2] x86/svm: Correct vm_event API for
 descriptor accesses
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
Cc: Petre Pircalabu <ppircalabu@bitdefender.com>,
 Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wl@xen.org>,
 Razvan Cojocaru <rcojocaru@bitdefender.com>, Adrian Pop <apop@bitdefender.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <JBeulich@suse.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Yy9zIGQwYTY5OWEzODlmMSAieDg2L21vbml0b3I6IGFkZCBzdXBwb3J0IGZvciBkZXNjcmlwdG9y
IGFjY2VzcyBldmVudHMiCmludHJvZHVjZWQgbG9naWMgbG9va2luZyBmb3Igd2hhdCBhcHBlYXJl
ZCB0byBiZSBleGl0aW5mbyAobm90IHRoYXQgdGhpcwpleGlzdHMgaW4gU1ZNIC0gZXhpdGluZm8x
IG9yIDIgZG8pLCBidXQgYWN0dWFsbHkgcGFzc2VkIHRoZSBleGl0IElEVCB2ZWN0b3JpbmcKaW5m
b3JtYXRpb24uICBUaGVyZSBpcyBuZXZlciBhbnkgSURUIHZlY3RvcmluZyBpbnZvbHZlZCBpbiB0
aGVzZSBpbnRlcmNlcHRzIHNvCnRoZSB2YWx1ZSBwYXNzZWQgaXMgYWx3YXlzIHplcm8uCgpJbiBm
YWN0LCBTVk0gZG9lc24ndCBwcm92aWRlIGFueSBpbmZvcm1hdGlvbiwgZXZlbiBpbiBleGl0aW5m
bzEgYW5kIDIuICBEcm9wCnRoZSBzdm0gc3RydWN0IGVudGlyZWx5LCBhbmQgYnVtcCB0aGUgaW50
ZXJmYWNlIHZlcnNpb24uCgpJbiB0aGUgU1ZNIHZtZXhpdCBoYW5kbGVyIGl0c2VsZiwgb3B0aW1p
c2UgdGhlIHN3aXRjaCBzdGF0ZW1lbnQgYnkgb2JzZXJ2aW5nCnRoYXQgdGhlcmUgaXMgYSBsaW5l
YXIgdHJhbnNmb3JtYXRpb24gYmV0d2VlbiB0aGUgU1ZNIGV4aXRfcmVhc29uIGFuZApWTV9FVkVO
VF9ERVNDXyogdmFsdWVzLiAgKEJsb2F0LW8tbWV0ZXIgcmVwb3J0cyA2MDI4ID0+IDU4NzcgZm9y
IGEgc2F2aW5nIG9mCjE1MSBieXRlcykuCgpTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxh
bmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgpBY2tlZC1ieTogUmF6dmFuIENvam9jYXJ1IDxyY29q
b2NhcnVAYml0ZGVmZW5kZXIuY29tPgpSZXZpZXdlZC1ieTogQWxleGFuZHJ1IElzYWlsYSA8YWlz
YWlsYUBiaXRkZWZlbmRlci5jb20+CkFja2VkLWJ5OiBBZHJpYW4gUG9wIDxhcG9wQGJpdGRlZmVu
ZGVyLmNvbT4KQWNrZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KLS0tCkND
OiBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3VzZS5jb20+CkNDOiBXZWkgTGl1IDx3bEB4ZW4ub3Jn
PgpDQzogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+CkNDOiBSYXp2YW4g
Q29qb2NhcnUgPHJjb2pvY2FydUBiaXRkZWZlbmRlci5jb20+CkNDOiBUYW1hcyBLIExlbmd5ZWwg
PHRhbWFzQHRrbGVuZ3llbC5jb20+CkNDOiBBbGV4YW5kcnUgSXNhaWxhIDxhaXNhaWxhQGJpdGRl
ZmVuZGVyLmNvbT4KQ0M6IFBldHJlIFBpcmNhbGFidSA8cHBpcmNhbGFidUBiaXRkZWZlbmRlci5j
b20+CkNDOiBBZHJpYW4gUG9wIDxhcG9wQGJpdGRlZmVuZGVyLmNvbT4KCnYyOgogKiBEcm9wIHRo
ZSBzdm0gc3RydWN0IGFuZCBidW1wIHRoZSBpbnRlcmZhY2UgdmVyc2lvbi4KLS0tCiB4ZW4vYXJj
aC94ODYvaHZtL21vbml0b3IuYyAgICB8ICA0IC0tLS0KIHhlbi9hcmNoL3g4Ni9odm0vc3ZtL3N2
bS5jICAgIHwgMzcgKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0tLQogeGVuL2lu
Y2x1ZGUvcHVibGljL3ZtX2V2ZW50LmggfCAgNiArLS0tLS0KIDMgZmlsZXMgY2hhbmdlZCwgMTgg
aW5zZXJ0aW9ucygrKSwgMjkgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2
L2h2bS9tb25pdG9yLmMgYi94ZW4vYXJjaC94ODYvaHZtL21vbml0b3IuYwppbmRleCA3ZmIxZTJj
MDRlLi4xZjIzZmUyNWU4IDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvaHZtL21vbml0b3IuYwor
KysgYi94ZW4vYXJjaC94ODYvaHZtL21vbml0b3IuYwpAQCAtMTEzLDEwICsxMTMsNiBAQCB2b2lk
IGh2bV9tb25pdG9yX2Rlc2NyaXB0b3JfYWNjZXNzKHVpbnQ2NF90IGV4aXRfaW5mbywKICAgICAg
ICAgcmVxLnUuZGVzY19hY2Nlc3MuYXJjaC52bXguaW5zdHJfaW5mbyA9IGV4aXRfaW5mbzsKICAg
ICAgICAgcmVxLnUuZGVzY19hY2Nlc3MuYXJjaC52bXguZXhpdF9xdWFsaWZpY2F0aW9uID0gdm14
X2V4aXRfcXVhbGlmaWNhdGlvbjsKICAgICB9Ci0gICAgZWxzZQotICAgIHsKLSAgICAgICAgcmVx
LnUuZGVzY19hY2Nlc3MuYXJjaC5zdm0uZXhpdGluZm8gPSBleGl0X2luZm87Ci0gICAgfQogCiAg
ICAgbW9uaXRvcl90cmFwcyhjdXJyZW50LCB0cnVlLCAmcmVxKTsKIH0KZGlmZiAtLWdpdCBhL3hl
bi9hcmNoL3g4Ni9odm0vc3ZtL3N2bS5jIGIveGVuL2FyY2gveDg2L2h2bS9zdm0vc3ZtLmMKaW5k
ZXggMGZiMTkwOGMxOC4uNzc2Y2YxMTQ1OSAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L2h2bS9z
dm0vc3ZtLmMKKysrIGIveGVuL2FyY2gveDg2L2h2bS9zdm0vc3ZtLmMKQEAgLTI5ODAsMjkgKzI5
ODAsMjYgQEAgdm9pZCBzdm1fdm1leGl0X2hhbmRsZXIoc3RydWN0IGNwdV91c2VyX3JlZ3MgKnJl
Z3MpCiAgICAgICAgIHN2bV92bWV4aXRfZG9fcGF1c2UocmVncyk7CiAgICAgICAgIGJyZWFrOwog
Ci0gICAgY2FzZSBWTUVYSVRfSURUUl9SRUFEOgotICAgIGNhc2UgVk1FWElUX0lEVFJfV1JJVEU6
Ci0gICAgICAgIGh2bV9kZXNjcmlwdG9yX2FjY2Vzc19pbnRlcmNlcHQodm1jYi0+ZXhpdGludGlu
Zm8uYnl0ZXMsIDAsCi0gICAgICAgICAgICBWTV9FVkVOVF9ERVNDX0lEVFIsIGV4aXRfcmVhc29u
ID09IFZNRVhJVF9JRFRSX1dSSVRFKTsKLSAgICAgICAgYnJlYWs7Ci0KLSAgICBjYXNlIFZNRVhJ
VF9HRFRSX1JFQUQ6Ci0gICAgY2FzZSBWTUVYSVRfR0RUUl9XUklURToKLSAgICAgICAgaHZtX2Rl
c2NyaXB0b3JfYWNjZXNzX2ludGVyY2VwdCh2bWNiLT5leGl0aW50aW5mby5ieXRlcywgMCwKLSAg
ICAgICAgICAgIFZNX0VWRU5UX0RFU0NfR0RUUiwgZXhpdF9yZWFzb24gPT0gVk1FWElUX0dEVFJf
V1JJVEUpOwotICAgICAgICBicmVhazsKKyAgICBjYXNlIFZNRVhJVF9JRFRSX1JFQUQgLi4uIFZN
RVhJVF9UUl9XUklURToKKyAgICB7CisgICAgICAgIC8qCisgICAgICAgICAqIENvbnNlY3V0aXZl
IGJsb2NrIG9mIDggZXhpdCBjb2RlcyAoc2FkbHkgbm90IGFsaWduZWQpLiAgVG9wIGJpdAorICAg
ICAgICAgKiBpbmRpY2F0ZXMgd3JpdGUgKHZzIHJlYWQpLCBib3R0b20gMiBiaXRzIG1hcCBsaW5l
YXJseSB0bworICAgICAgICAgKiBWTV9FVkVOVF9ERVNDXyogdmFsdWVzLgorICAgICAgICAgKi8K
KyNkZWZpbmUgRTJEKGUpICAgICAgKCgoKGUpICAgICAgICAgLSBWTUVYSVRfSURUUl9SRUFEKSAm
IDMpICsgMSkKKyAgICAgICAgYm9vbCB3cml0ZSA9ICgoZXhpdF9yZWFzb24gLSBWTUVYSVRfSURU
Ul9SRUFEKSAmIDQpOworICAgICAgICB1bnNpZ25lZCBpbnQgZGVzYyA9IEUyRChleGl0X3JlYXNv
bik7CiAKLSAgICBjYXNlIFZNRVhJVF9MRFRSX1JFQUQ6Ci0gICAgY2FzZSBWTUVYSVRfTERUUl9X
UklURToKLSAgICAgICAgaHZtX2Rlc2NyaXB0b3JfYWNjZXNzX2ludGVyY2VwdCh2bWNiLT5leGl0
aW50aW5mby5ieXRlcywgMCwKLSAgICAgICAgICAgIFZNX0VWRU5UX0RFU0NfTERUUiwgZXhpdF9y
ZWFzb24gPT0gVk1FWElUX0xEVFJfV1JJVEUpOwotICAgICAgICBicmVhazsKKyAgICAgICAgQlVJ
TERfQlVHX09OKEUyRChWTUVYSVRfSURUUl9SRUFEKSAhPSBWTV9FVkVOVF9ERVNDX0lEVFIpOwor
ICAgICAgICBCVUlMRF9CVUdfT04oRTJEKFZNRVhJVF9HRFRSX1JFQUQpICE9IFZNX0VWRU5UX0RF
U0NfR0RUUik7CisgICAgICAgIEJVSUxEX0JVR19PTihFMkQoVk1FWElUX0xEVFJfUkVBRCkgIT0g
Vk1fRVZFTlRfREVTQ19MRFRSKTsKKyAgICAgICAgQlVJTERfQlVHX09OKEUyRChWTUVYSVRfVFJf
UkVBRCkgICAhPSBWTV9FVkVOVF9ERVNDX1RSKTsKKyN1bmRlZiBFMkQKIAotICAgIGNhc2UgVk1F
WElUX1RSX1JFQUQ6Ci0gICAgY2FzZSBWTUVYSVRfVFJfV1JJVEU6Ci0gICAgICAgIGh2bV9kZXNj
cmlwdG9yX2FjY2Vzc19pbnRlcmNlcHQodm1jYi0+ZXhpdGludGluZm8uYnl0ZXMsIDAsCi0gICAg
ICAgICAgICBWTV9FVkVOVF9ERVNDX1RSLCBleGl0X3JlYXNvbiA9PSBWTUVYSVRfVFJfV1JJVEUp
OworICAgICAgICBodm1fZGVzY3JpcHRvcl9hY2Nlc3NfaW50ZXJjZXB0KDAsIDAsIGRlc2MsIHdy
aXRlKTsKICAgICAgICAgYnJlYWs7CisgICAgfQogCiAgICAgZGVmYXVsdDoKICAgICB1bmV4cGVj
dGVkX2V4aXRfdHlwZToKZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL3B1YmxpYy92bV9ldmVudC5o
IGIveGVuL2luY2x1ZGUvcHVibGljL3ZtX2V2ZW50LmgKaW5kZXggOTU5MDgzZDhjNC4uYWE1NGM4
NjMyNSAxMDA2NDQKLS0tIGEveGVuL2luY2x1ZGUvcHVibGljL3ZtX2V2ZW50LmgKKysrIGIveGVu
L2luY2x1ZGUvcHVibGljL3ZtX2V2ZW50LmgKQEAgLTI5LDcgKzI5LDcgQEAKIAogI2luY2x1ZGUg
Inhlbi5oIgogCi0jZGVmaW5lIFZNX0VWRU5UX0lOVEVSRkFDRV9WRVJTSU9OIDB4MDAwMDAwMDUK
KyNkZWZpbmUgVk1fRVZFTlRfSU5URVJGQUNFX1ZFUlNJT04gMHgwMDAwMDAwNgogCiAjaWYgZGVm
aW5lZChfX1hFTl9fKSB8fCBkZWZpbmVkKF9fWEVOX1RPT0xTX18pCiAKQEAgLTMwMSwxMCArMzAx
LDYgQEAgc3RydWN0IHZtX2V2ZW50X2Rlc2NfYWNjZXNzIHsKICAgICAgICAgICAgIHVpbnQzMl90
IF9wYWQxOwogICAgICAgICAgICAgdWludDY0X3QgZXhpdF9xdWFsaWZpY2F0aW9uOyAvKiBWTVg6
IFZNQ1MgRXhpdCBRdWFsaWZpY2F0aW9uICovCiAgICAgICAgIH0gdm14OwotICAgICAgICBzdHJ1
Y3QgewotICAgICAgICAgICAgdWludDY0X3QgZXhpdGluZm87ICAgICAgICAgICAvKiBTVk06IFZN
Q0IgRVhJVElORk8gKi8KLSAgICAgICAgICAgIHVpbnQ2NF90IF9wYWQyOwotICAgICAgICB9IHN2
bTsKICAgICB9IGFyY2g7CiAgICAgdWludDhfdCBkZXNjcmlwdG9yOyAgICAgICAgICAgICAgICAg
IC8qIFZNX0VWRU5UX0RFU0NfKiAqLwogICAgIHVpbnQ4X3QgaXNfd3JpdGU7Ci0tIAoyLjExLjAK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
