Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E748140D08
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jan 2020 15:50:17 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1isSuO-0003TH-KT; Fri, 17 Jan 2020 14:47:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zPxh=3G=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1isSuM-0003TC-QR
 for xen-devel@lists.xenproject.org; Fri, 17 Jan 2020 14:47:34 +0000
X-Inumbo-ID: 4b7c9c34-3938-11ea-b549-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4b7c9c34-3938-11ea-b549-12813bfff9fa;
 Fri, 17 Jan 2020 14:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579272453;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=p6o3yKbKXFln63k2f1nWCXxyRUomxX8MFFZBVJmH21U=;
 b=QXjLZHp1zoraEJJJAKG5aI66vMXefKyuVoSDx/tzxexu5AYeJerVae33
 w03RMETRpZY0Xqh/zHIX66rLDZocoejtsWEHFOjPlIwTn8IBLoHh3o7fr
 TjFwM9aSbZgZZpui+wrt2V5oCJU7l9S/JaR3GeYwa4hf0cBSEefElSaZ8 M=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@eu.citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@eu.citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@eu.citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
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
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: K+UYM+Wc8A/IPUzph97K6GM8eZ3XYoDW3xrjW+ctg3NvXV40XDRiL6qyOjI5tCpFEFhccQDvbu
 WT/9G45ns7xmGWGo6+lZ9hX3d0qTUXHrafyKOAheUGV+Q80pRtLR8YiNwX+MOuhftmCYyMfEBQ
 i08/XWRTT/fvwQ/BdmK0akIz35sULZ+fhqbsU7aF9PK26miPLORlqSMZGEQKH6RLotR1RHpne4
 hoj2Nh5cj06+3+Tpf6ohpQFAKLeEQWKael1PVJeizsQ2dwZJS6aLEhYeSjxMTqjkbkQ3S8EHue
 POw=
X-SBRS: 2.7
X-MesageID: 11441865
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,330,1574139600"; d="scan'208";a="11441865"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 17 Jan 2020 14:47:18 +0000
Message-ID: <20200117144726.582-3-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200117144726.582-1-ian.jackson@eu.citrix.com>
References: <20200117144726.582-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 02/10] libxl: event: Rename
 ctx.pollers_fd_changed to .pollers_active
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

V2UgYXJlIGdvaW5nIHRvIHVzZSB0aGlzIGEgYml0IG1vcmUgd2lkZWx5LiAgTWFrZSB0aGUgbmFt
ZSBtb3JlCmdlbmVyYWwuCgpTaWduZWQtb2ZmLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25A
ZXUuY2l0cml4LmNvbT4KUmV2aWV3ZWQtYnk6IEdlb3JnZSBEdW5sYXAgPGdlb3JnZS5kdW5sYXBA
Y2l0cml4LmNvbT4KVGVzdGVkLWJ5OiBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJp
eC5jb20+Ci0tLQogdG9vbHMvbGlieGwvbGlieGwuYyAgICAgICAgICB8IDQgKystLQogdG9vbHMv
bGlieGwvbGlieGxfZXZlbnQuYyAgICB8IDggKysrKy0tLS0KIHRvb2xzL2xpYnhsL2xpYnhsX2lu
dGVybmFsLmggfCA2ICsrKy0tLQogMyBmaWxlcyBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDkg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdG9vbHMvbGlieGwvbGlieGwuYyBiL3Rvb2xzL2xp
YnhsL2xpYnhsLmMKaW5kZXggYTBkODQyODFkMC4uZjYwZmQzZTRmZCAxMDA2NDQKLS0tIGEvdG9v
bHMvbGlieGwvbGlieGwuYworKysgYi90b29scy9saWJ4bC9saWJ4bC5jCkBAIC00OCw3ICs0OCw3
IEBAIGludCBsaWJ4bF9jdHhfYWxsb2MobGlieGxfY3R4ICoqcGN0eCwgaW50IHZlcnNpb24sCiAg
ICAgY3R4LT5wb2xsZXJfYXBwID0gMDsKICAgICBMSUJYTF9MSVNUX0lOSVQoJmN0eC0+cG9sbGVy
c19ldmVudCk7CiAgICAgTElCWExfTElTVF9JTklUKCZjdHgtPnBvbGxlcnNfaWRsZSk7Ci0gICAg
TElCWExfTElTVF9JTklUKCZjdHgtPnBvbGxlcnNfZmRzX2NoYW5nZWQpOworICAgIExJQlhMX0xJ
U1RfSU5JVCgmY3R4LT5wb2xsZXJzX2FjdGl2ZSk7CiAKICAgICBMSUJYTF9MSVNUX0lOSVQoJmN0
eC0+ZWZkcyk7CiAgICAgTElCWExfVEFJTFFfSU5JVCgmY3R4LT5ldGltZXMpOwpAQCAtMTc3LDcg
KzE3Nyw3IEBAIGludCBsaWJ4bF9jdHhfZnJlZShsaWJ4bF9jdHggKmN0eCkKICAgICBsaWJ4bF9f
cG9sbGVyX3B1dChjdHgsIGN0eC0+cG9sbGVyX2FwcCk7CiAgICAgY3R4LT5wb2xsZXJfYXBwID0g
TlVMTDsKICAgICBhc3NlcnQoTElCWExfTElTVF9FTVBUWSgmY3R4LT5wb2xsZXJzX2V2ZW50KSk7
Ci0gICAgYXNzZXJ0KExJQlhMX0xJU1RfRU1QVFkoJmN0eC0+cG9sbGVyc19mZHNfY2hhbmdlZCkp
OworICAgIGFzc2VydChMSUJYTF9MSVNUX0VNUFRZKCZjdHgtPnBvbGxlcnNfYWN0aXZlKSk7CiAg
ICAgbGlieGxfX3BvbGxlciAqcG9sbGVyLCAqcG9sbGVyX3RtcDsKICAgICBMSUJYTF9MSVNUX0ZP
UkVBQ0hfU0FGRShwb2xsZXIsICZjdHgtPnBvbGxlcnNfaWRsZSwgZW50cnksIHBvbGxlcl90bXAp
IHsKICAgICAgICAgbGlieGxfX3BvbGxlcl9kaXNwb3NlKHBvbGxlcik7CmRpZmYgLS1naXQgYS90
b29scy9saWJ4bC9saWJ4bF9ldmVudC5jIGIvdG9vbHMvbGlieGwvbGlieGxfZXZlbnQuYwppbmRl
eCAxMjEwYzFiZmIzLi41YjEyYTQ1ZTcwIDEwMDY0NAotLS0gYS90b29scy9saWJ4bC9saWJ4bF9l
dmVudC5jCisrKyBiL3Rvb2xzL2xpYnhsL2xpYnhsX2V2ZW50LmMKQEAgLTIzOCw3ICsyMzgsNyBA
QCB2b2lkIGxpYnhsX19ldl9mZF9kZXJlZ2lzdGVyKGxpYnhsX19nYyAqZ2MsIGxpYnhsX19ldl9m
ZCAqZXYpCiAgICAgTElCWExfTElTVF9SRU1PVkUoZXYsIGVudHJ5KTsKICAgICBldi0+ZmQgPSAt
MTsKIAotICAgIExJQlhMX0xJU1RfRk9SRUFDSChwb2xsZXIsICZDVFgtPnBvbGxlcnNfZmRzX2No
YW5nZWQsIGZkc19jaGFuZ2VkX2VudHJ5KQorICAgIExJQlhMX0xJU1RfRk9SRUFDSChwb2xsZXIs
ICZDVFgtPnBvbGxlcnNfYWN0aXZlLCBhY3RpdmVfZW50cnkpCiAgICAgICAgIHBvbGxlci0+ZmRz
X2RlcmVnaXN0ZXJlZCA9IDE7CiAKICBvdXQ6CkBAIC0xNjYzLDE1ICsxNjYzLDE1IEBAIGxpYnhs
X19wb2xsZXIgKmxpYnhsX19wb2xsZXJfZ2V0KGxpYnhsX19nYyAqZ2MpCiAgICAgICAgIH0KICAg
ICB9CiAKLSAgICBMSUJYTF9MSVNUX0lOU0VSVF9IRUFEKCZDVFgtPnBvbGxlcnNfZmRzX2NoYW5n
ZWQsIHAsCi0gICAgICAgICAgICAgICAgICAgICAgICAgICBmZHNfY2hhbmdlZF9lbnRyeSk7Cisg
ICAgTElCWExfTElTVF9JTlNFUlRfSEVBRCgmQ1RYLT5wb2xsZXJzX2FjdGl2ZSwgcCwKKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgIGFjdGl2ZV9lbnRyeSk7CiAgICAgcmV0dXJuIHA7CiB9CiAK
IHZvaWQgbGlieGxfX3BvbGxlcl9wdXQobGlieGxfY3R4ICpjdHgsIGxpYnhsX19wb2xsZXIgKnAp
CiB7CiAgICAgaWYgKCFwKSByZXR1cm47Ci0gICAgTElCWExfTElTVF9SRU1PVkUocCwgZmRzX2No
YW5nZWRfZW50cnkpOworICAgIExJQlhMX0xJU1RfUkVNT1ZFKHAsIGFjdGl2ZV9lbnRyeSk7CiAg
ICAgTElCWExfTElTVF9JTlNFUlRfSEVBRCgmY3R4LT5wb2xsZXJzX2lkbGUsIHAsIGVudHJ5KTsK
IH0KIApkaWZmIC0tZ2l0IGEvdG9vbHMvbGlieGwvbGlieGxfaW50ZXJuYWwuaCBiL3Rvb2xzL2xp
YnhsL2xpYnhsX2ludGVybmFsLmgKaW5kZXggYzViNzFkMTVmMC4uNTgxZDY0Yjk5YyAxMDA2NDQK
LS0tIGEvdG9vbHMvbGlieGwvbGlieGxfaW50ZXJuYWwuaAorKysgYi90b29scy9saWJ4bC9saWJ4
bF9pbnRlcm5hbC5oCkBAIC02MjksMTMgKzYyOSwxMyBAQCBzdHJ1Y3QgbGlieGxfX3BvbGxlciB7
CiAgICAgLyoKICAgICAgKiBXZSBhbHNvIHVzZSB0aGUgcG9sbGVyIHRvIHJlY29yZCB3aGV0aGVy
IGFueSBmZHMgaGF2ZSBiZWVuCiAgICAgICogZGVyZWdpc3RlcmVkIHNpbmNlIHdlIGVudGVyZWQg
cG9sbC4gIEVhY2ggcG9sbGVyIHdoaWNoIGlzIG5vdAotICAgICAqIGlkbGUgaXMgb24gdGhlIGxp
c3QgcG9sbGVyc19mZHNfY2hhbmdlZC4gIGZkc19kZXJlZ2lzdGVyZWQgaXMKKyAgICAgKiBpZGxl
IGlzIG9uIHRoZSBsaXN0IHBvbGxlcnNfYWN0aXZlLiAgZmRzX2RlcmVnaXN0ZXJlZCBpcwogICAg
ICAqIGNsZWFyZWQgYnkgYmVmb3JlcG9sbCwgYW5kIHRlc3RlZCBieSBhZnRlcnBvbGwuICBXaGVu
ZXZlciBhbiBmZAogICAgICAqIGV2ZW50IGlzIGRlcmVnaXN0ZXJlZCwgd2Ugc2V0IHRoZSBmZHNf
ZGVyZWdpc3RlcmVkIG9mIGFsbCBub24taWRsZQogICAgICAqIHBvbGxlcnMuICBTbyBhZnRlcnBv
bGwgY2FuIHRlbGwgd2hldGhlciBhbnkgUE9MTE5WQUwgaXMKICAgICAgKiBwbGF1c2libHkgZHVl
IHRvIGFuIGZkIGJlaW5nIGNsb3NlZCBhbmQgcmVvcGVuZWQuCiAgICAgICovCi0gICAgTElCWExf
TElTVF9FTlRSWShsaWJ4bF9fcG9sbGVyKSBmZHNfY2hhbmdlZF9lbnRyeTsKKyAgICBMSUJYTF9M
SVNUX0VOVFJZKGxpYnhsX19wb2xsZXIpIGFjdGl2ZV9lbnRyeTsKICAgICBib29sIGZkc19kZXJl
Z2lzdGVyZWQ7CiB9OwogCkBAIC02NzgsNyArNjc4LDcgQEAgc3RydWN0IGxpYnhsX19jdHggewog
CiAgICAgbGlieGxfX3BvbGxlciAqcG9sbGVyX2FwcDsgLyogbGlieGxfb3NldmVudF9iZWZvcmVw
b2xsIGFuZCBfYWZ0ZXJwb2xsICovCiAgICAgTElCWExfTElTVF9IRUFEKCwgbGlieGxfX3BvbGxl
cikgcG9sbGVyc19ldmVudCwgcG9sbGVyc19pZGxlOwotICAgIExJQlhMX0xJU1RfSEVBRCgsIGxp
YnhsX19wb2xsZXIpIHBvbGxlcnNfZmRzX2NoYW5nZWQ7CisgICAgTElCWExfTElTVF9IRUFEKCwg
bGlieGxfX3BvbGxlcikgcG9sbGVyc19hY3RpdmU7CiAKICAgICBMSUJYTF9TTElTVF9IRUFEKGxp
YnhsX19vc2V2ZW50X2hvb2tfbmV4aSwgbGlieGxfX29zZXZlbnRfaG9va19uZXh1cykKICAgICAg
ICAgaG9va19mZF9uZXhpX2lkbGUsIGhvb2tfdGltZW91dF9uZXhpX2lkbGU7Ci0tIAoyLjExLjAK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
