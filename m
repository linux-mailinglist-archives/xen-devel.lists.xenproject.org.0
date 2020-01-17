Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AC24140D06
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jan 2020 15:49:53 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1isSug-0003aH-I7; Fri, 17 Jan 2020 14:47:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zPxh=3G=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1isSue-0003ZN-Kp
 for xen-devel@lists.xenproject.org; Fri, 17 Jan 2020 14:47:52 +0000
X-Inumbo-ID: 4c3322a6-3938-11ea-aecd-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4c3322a6-3938-11ea-aecd-bc764e2007e4;
 Fri, 17 Jan 2020 14:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579272456;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=anYoB6pFS9Z9a8b7ykBkrtTroqhT10Oxxv3060dH6Ok=;
 b=WDpzrenSaTFtagfKFW+TzBn8hJt2MZ75KpGvSj85y+5Eff2j8yRKNHgk
 OsyG/xsHSr/qIoOygfg/XdHhIIRFn89MqLovNs4Qf4sHIcwozZxWmShmi
 ioPXgXGB5dxxwKVLr6SNt1UXmMLA479++knEaP/3wFIvhqdVhJpocfZaw c=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@eu.citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@eu.citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@eu.citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: HDhMtDLUnEL9bkYRYhIpetV3hVMWRU3FlWsmuZ61/HBINZFy2ifTrUi9hqMrvcIlYm91iyylti
 w1ZotXYOGKmmouf1cMo/7qrQ+AvyMAj0SSi61VbQBILVh75yMq/f5Zi2c2HlfHrkrlj/bdgNZl
 Fi6k09jbMScOynB0tgx1U6jVfBW0l9LrlN7jXUOpakfAZduxWe6jgDlpimSAwQC9hiFjw4YI1d
 emR/FRIo8ThnIkE3lden3UDS7PQyHPJAiVfSb0ls64BaSN389YFfSmRlmaRg/U1YPAjP/xD7QN
 yGQ=
X-SBRS: 2.7
X-MesageID: 11068800
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,330,1574139600"; d="scan'208";a="11068800"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 17 Jan 2020 14:47:21 +0000
Message-ID: <20200117144726.582-6-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200117144726.582-1-ian.jackson@eu.citrix.com>
References: <20200117144726.582-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 05/10] libxl: event: Make
 libxl__poller_wakeup take a gc, not an egc
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
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2UgYXJlIGdvaW5nIHRvIHdhbnQgdG8gY2FsbCB0aGlzIGluIHRoZSBmb2xsb3dpbmcgc2l0dWF0
aW9uOgoKICogV2UgaGF2ZSBqdXN0IHNldCB1cCBhbiBhbywgd2hpY2ggaXMgdG8gY2FsbCBiYWNr
IC0gc28gYQogICBub24tc3luY2hyb25vdXMgb25lLiAgSXQgb3VnaHQgbm90IHRvIGNhbGwgdGhl
IGFwcGxpY2F0aW9uCiAgIGJhY2sgcmlnaHQgYXdheSwgc28gbm8gZWdjLgoKICogVGhlcmUgaXMg
YSBsaWJ4bCB0aHJlYWQgYmxvY2tpbmcgc29tZXdoZXJlIGJ1dCBpdCBpcyB1c2luZwogICB1c2lu
ZyBhbiBvdXQgb2YgZGF0ZSBmZCBvciB0aW1lb3V0IHNldCwgd2hpY2ggZG9lcyBub3QgdGFrZSBp
bnRvCiAgIGFjY291bnQgdGhlIGFvIHdlIGhhdmUganVzdCBzdGFydGVkLgoKICogV2UgdHJ5IHRv
IHdha2UgdGhhdCB0aHJlYWQgdXAsIGJ1dCBsaWJ4bF9fcG9sbGVyX3dha2V1cCBmYWlscy4KCklu
IG1vcmUgZGV0YWlsOgoKVGhlIGlkZWEgYmVmb3JlIHdhcyB0aGF0IHRoZXNlIHR3byBmdW5jdGlv
bnMgdGFrZSBhbiBlZ2MsIG5vdCBzbyBtdWNoCmJlY2F1c2UgaXQgYWN0dWFsbHkgdXNlcyB0aGUg
ZWdjLCBidXQgdG8gbWFrZSBzdXJlIGl0J3Mgb25seSBjYWxsZWQgaW4gYQpyZXN0cmljdGVkIHNl
dCBvZiBjb25kaXRpb25zOyBhbmQgbm93IHdlJ3JlIHJlbGF4aW5nIHRob3NlIGNvbmRpdGlvbnMu
CgpTcGVjaWZpY2FsbHksIHdlIG5lZWQgdG8gbWFrZSBvbmUgZXhjZXB0aW9uLCByZWxhdGluZyB0
byBhbydzLgoKSW4gdGhlIHNpdHVhdGlvbiBkZXNjcmliZWQgYWJvdmUsIHRoZXJlIGlzIG5vIGVn
YywgYnV0IHdlIG5lZWQgdG8gY2FsbApsaWJ4bF9fcG9sbGVyX3dha2V1cC4gIEludHJvZHVjaW5n
IGFuIGVnYyBpcyB3cm9uZyBiZWNhdXNlIHRoYXQgd291bGQKaW1wbHkgdGhhdCB0aGlzIHNpdHVh
dGlvbiBtaWdodCByZXN1bHQgaW4gYXBwbGljYXRpb24gY2FsbGJhY2tzLCBidXQKaXQgc2hvdWxk
bid0IChhbmQgbm90IGhhdmluZyBhbiBlZ2MgcHJldmVudHMgdGhhdCkuCgpsaWJ4bF9fcG9sbGVy
X3dha2V1cCBhbmQgTElCWExfX0VWRU5UX0RJU0FTVEVSIG9ubHkgdGFrZSBhbiBlZ2MgZm9yCmZv
cm0ncyBzYWtlOyB0aGV5IGRvbid0IHVzZSBhbnkgcGFydCBvZiBpdCBvdGhlciB0aGFuIHRoZSBn
Yy4gIFRoZQoiZm9ybSdzIHNha2UiIGlzIHRvIHN0b3AgdGhlbSBiZWluZyBjYWxsZWQgZnJvbSBs
aWJ4bCBlbnRyeXBvaW50cyB0aGF0CmFyZSBub3QgaW52b2x2ZWQgaW4gZXZlbnQgZ2VuZXJhdGlv
bi4KCkJlZm9yZSB0aGlzIHBhdGNoIHRoaXMgaXMgZW5mb3JjZWQgYnkgdGhlIHR5cGVzOiB5b3Ug
Y2FuJ3QgY2FsbCBpdCBpbgp0aGUgd3JvbmcgcGxhY2UgYmVjYXVzZSBpdCB3YW50cyBhbiBlZ2Mg
d2hpY2ggeW91IGRvbid0IGhhdmUuCgpBZnRlciB0aGlzIHBhdGNoIHRoaXMgaXMgbm8gbG9uZ2Vy
IGVuZm9yY2VkLiAgQnV0IHRoZSBtaXN0YWtlCihwcmluY2lwYWxseSwgY2FsbGluZyBfRElTQVNU
RVIpIHNlZW1zIHVubGlrZWx5LiAgVGhlIHR5cGUgZW5mb3JjZW1lbnQKSSBtZW50aW9uIGFib3Zl
IHdhcyBkb25lIGJlY2F1c2UgaXQgd2FzIHBvc3NpYmxlIGFuZCBlYXN5LCBub3QgYmVjYXVzZQpp
dCB3YXMgaW1wb3J0YW50LgoKU2lnbmVkLW9mZi1ieTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29u
QGV1LmNpdHJpeC5jb20+ClJldmlld2VkLWJ5OiBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFw
QGNpdHJpeC5jb20+ClRlc3RlZC1ieTogR2VvcmdlIER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBjaXRy
aXguY29tPgotLS0KdjM6IFNpZ25pZmljYW50bHkgZXhwYW5kZWQgY29tbWl0IG1lc3NhZ2UgYmFz
ZWQgb24gaXJjIGNvbW1lbnRzCnYyOiBOZXcgcGF0Y2gKLS0tCiB0b29scy9saWJ4bC9saWJ4bF9l
dmVudC5jICAgIHwgNyArKystLS0tCiB0b29scy9saWJ4bC9saWJ4bF9pbnRlcm5hbC5oIHwgMiAr
LQogMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvdG9vbHMvbGlieGwvbGlieGxfZXZlbnQuYyBiL3Rvb2xzL2xpYnhsL2xpYnhsX2V2
ZW50LmMKaW5kZXggMTZlNjc4Njg4OS4uMjY4YTVkYTEyMCAxMDA2NDQKLS0tIGEvdG9vbHMvbGli
eGwvbGlieGxfZXZlbnQuYworKysgYi90b29scy9saWJ4bC9saWJ4bF9ldmVudC5jCkBAIC0xNDc3
LDcgKzE0NzcsNyBAQCB2b2lkIGxpYnhsX19ldmVudF9vY2N1cnJlZChsaWJ4bF9fZWdjICplZ2Ms
IGxpYnhsX2V2ZW50ICpldmVudCkKICAgICAgICAgbGlieGxfX3BvbGxlciAqcG9sbGVyOwogICAg
ICAgICBMSUJYTF9UQUlMUV9JTlNFUlRfVEFJTCgmQ1RYLT5vY2N1cnJlZCwgZXZlbnQsIGxpbmsp
OwogICAgICAgICBMSUJYTF9MSVNUX0ZPUkVBQ0gocG9sbGVyLCAmQ1RYLT5wb2xsZXJzX2V2ZW50
LCBlbnRyeSkKLSAgICAgICAgICAgIGxpYnhsX19wb2xsZXJfd2FrZXVwKGVnYywgcG9sbGVyKTsK
KyAgICAgICAgICAgIGxpYnhsX19wb2xsZXJfd2FrZXVwKGdjLCBwb2xsZXIpOwogICAgIH0KIH0K
IApAQCAtMTY2OCw5ICsxNjY4LDggQEAgdm9pZCBsaWJ4bF9fcG9sbGVyX3B1dChsaWJ4bF9jdHgg
KmN0eCwgbGlieGxfX3BvbGxlciAqcCkKICAgICBMSUJYTF9MSVNUX0lOU0VSVF9IRUFEKCZjdHgt
PnBvbGxlcnNfaWRsZSwgcCwgZW50cnkpOwogfQogCi12b2lkIGxpYnhsX19wb2xsZXJfd2FrZXVw
KGxpYnhsX19lZ2MgKmVnYywgbGlieGxfX3BvbGxlciAqcCkKK3ZvaWQgbGlieGxfX3BvbGxlcl93
YWtldXAobGlieGxfX2djICpnYywgbGlieGxfX3BvbGxlciAqcCkKIHsKLSAgICBFR0NfR0M7CiAg
ICAgaW50IGUgPSBsaWJ4bF9fc2VsZl9waXBlX3dha2V1cChwLT53YWtldXBfcGlwZVsxXSk7CiAg
ICAgaWYgKGUpIExJQlhMX19FVkVOVF9ESVNBU1RFUihnYywgImNhbm5vdCBwb2tlIHdhdGNoIHBp
cGUiLCBlLCAwKTsKIH0KQEAgLTE5MjQsNyArMTkyMyw3IEBAIHZvaWQgbGlieGxfX2FvX2NvbXBs
ZXRlX2NoZWNrX3Byb2dyZXNzX3JlcG9ydHMobGlieGxfX2VnYyAqZWdjLCBsaWJ4bF9fYW8gKmFv
KQogICAgICAgICBhc3NlcnQoYW8tPmluX2luaXRpYXRvcik7CiAgICAgICAgIGlmICghYW8tPmNv
bnN0cnVjdGluZykKICAgICAgICAgICAgIC8qIGRvbid0IGJvdGhlciB3aXRoIHRoaXMgaWYgd2Un
cmUgbm90IGluIHRoZSBldmVudCBsb29wICovCi0gICAgICAgICAgICBsaWJ4bF9fcG9sbGVyX3dh
a2V1cChlZ2MsIGFvLT5wb2xsZXIpOworICAgICAgICAgICAgbGlieGxfX3BvbGxlcl93YWtldXAo
Z2MsIGFvLT5wb2xsZXIpOwogICAgIH0gZWxzZSBpZiAoYW8tPmhvdy5jYWxsYmFjaykgewogICAg
ICAgICBMT0coREVCVUcsICJhbyAlcDogY29tcGxldGUgZm9yIGNhbGxiYWNrIiwgYW8pOwogICAg
ICAgICBMSUJYTF9UQUlMUV9JTlNFUlRfVEFJTCgmZWdjLT5hb3NfZm9yX2NhbGxiYWNrLCBhbywg
ZW50cnlfZm9yX2NhbGxiYWNrKTsKZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnhsL2xpYnhsX2ludGVy
bmFsLmggYi90b29scy9saWJ4bC9saWJ4bF9pbnRlcm5hbC5oCmluZGV4IDMyOGVjZjNlMWUuLmI2
OGFiMjE4YjYgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2xpYnhsL2xpYnhsX2ludGVybmFsLmgKKysrIGIv
dG9vbHMvbGlieGwvbGlieGxfaW50ZXJuYWwuaApAQCAtMTMxMSw3ICsxMzExLDcgQEAgX2hpZGRl
biB2b2lkIGxpYnhsX19wb2xsZXJfcHV0KGxpYnhsX2N0eCosIGxpYnhsX19wb2xsZXIgKnAgLyog
bWF5IGJlIE5VTEwgKi8pOwogCiAvKiBOb3RpZmllcyB3aG9ldmVyIGlzIHBvbGxpbmcgdXNpbmcg
cCB0aGF0IHRoZXkgc2hvdWxkIHdha2UgdXAuCiAgKiBjdHggbXVzdCBiZSBsb2NrZWQuICovCi1f
aGlkZGVuIHZvaWQgbGlieGxfX3BvbGxlcl93YWtldXAobGlieGxfX2VnYyAqZWdjLCBsaWJ4bF9f
cG9sbGVyICpwKTsKK19oaWRkZW4gdm9pZCBsaWJ4bF9fcG9sbGVyX3dha2V1cChsaWJ4bF9fZ2Mg
KmVnYywgbGlieGxfX3BvbGxlciAqcCk7CiAKIC8qIEludGVybmFsIHRvIGZvcmsgYW5kIGNoaWxk
IHJlYXBpbmcgbWFjaGluZXJ5ICovCiBleHRlcm4gY29uc3QgbGlieGxfY2hpbGRwcm9jX2hvb2tz
IGxpYnhsX19jaGlsZHByb2NfZGVmYXVsdF9ob29rczsKLS0gCjIuMTEuMAoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
