Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BB19140D0B
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jan 2020 15:50:29 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1isSul-0003e4-Ur; Fri, 17 Jan 2020 14:47:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zPxh=3G=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1isSuj-0003cw-Lb
 for xen-devel@lists.xenproject.org; Fri, 17 Jan 2020 14:47:57 +0000
X-Inumbo-ID: 4c53a5da-3938-11ea-b833-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4c53a5da-3938-11ea-b833-bc764e2007e4;
 Fri, 17 Jan 2020 14:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579272455;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=DWW+Ko5eE1r5vheDQU9+tftd23eGHkSRMJ/mb7bsA6s=;
 b=FPgEFP+p+OM9OZYRzBXj+X4SAjbo9FWOxjpCR8SCuDAlTiJIHRxhAYAA
 pfV2+tw+ABrn9qjiPkwtZhUVAayxeosmVQJtmiw/oECoPbDt1yFf9DUzz
 b+P7d3x0FD6Js0pSjKVvD9s5n2Vw+IThs/LLye/vCbMgRKqQ+RGpX8yLq 0=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@eu.citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@eu.citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@eu.citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
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
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: eCxWcZDEcrwhw82jhiS5olTmsW2VJACExjSAsqR84L0nlmLtpARmM1+hSAahhloiJvQa1cTs2k
 cPAiDAls6BLIZe3yVvu/QkuSl3MY7nomYKpVXalJlDc2b/dF4k5MF1UkMr7hUiiHIwRi+V0Krn
 hDF+KRCmb11VZRgg7UIMuYW94off5eBTv/XdTBPvdyhkxTqlgqP21DjabZi5HOQgCt3pvP4HRE
 C0V1M2V1KuIBQZ42os/l03fOgn8q81pi+HE/m8lc1F3o24ittYVeNEUlQZ06ypDwZY9+zvEGBK
 FjA=
X-SBRS: 2.7
X-MesageID: 11507689
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,330,1574139600"; d="scan'208";a="11507689"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 17 Jan 2020 14:47:23 +0000
Message-ID: <20200117144726.582-8-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200117144726.582-1-ian.jackson@eu.citrix.com>
References: <20200117144726.582-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 07/10] libxl: event: poller pipe optimisation
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

VHJhY2sgaW4gdXNlcmxhbmQgd2hldGhlciB0aGUgcG9sbGVyIHBpcGUgaXMgbm9uZW1wdHkuICBU
aGlzIHNhdmVzIHVzCndyaXRpbmcgbWFueSBtYW55IGJ5dGVzIHRvIHRoZSBwaXBlIGlmIG5vdGhp
bmcgZXZlciByZWFkcyB0aGVtLgoKVGhpcyBpcyBnb2luZyB0byBiZSByZWxldmFudCBpbiBhIG1v
bWVudCwgd2hlcmUgd2UgYXJlIGdvaW5nIHRvIGNyZWF0ZQphIHNpdHVhdGlvbiB3aGVyZSB0aGlz
IHdpbGwgaGFwcGVuIHF1aXRlIGEgbG90LgoKU2lnbmVkLW9mZi1ieTogSWFuIEphY2tzb24gPGlh
bi5qYWNrc29uQGV1LmNpdHJpeC5jb20+ClJldmlld2VkLWJ5OiBHZW9yZ2UgRHVubGFwIDxnZW9y
Z2UuZHVubGFwQGNpdHJpeC5jb20+ClRlc3RlZC1ieTogR2VvcmdlIER1bmxhcCA8Z2VvcmdlLmR1
bmxhcEBjaXRyaXguY29tPgotLS0KIHRvb2xzL2xpYnhsL2xpYnhsX2V2ZW50LmMgICAgfCAzICsr
KwogdG9vbHMvbGlieGwvbGlieGxfaW50ZXJuYWwuaCB8IDEgKwogMiBmaWxlcyBjaGFuZ2VkLCA0
IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS90b29scy9saWJ4bC9saWJ4bF9ldmVudC5jIGIv
dG9vbHMvbGlieGwvbGlieGxfZXZlbnQuYwppbmRleCBiNTBkNGU1MDc0Li4zZTc2ZmE1YWY1IDEw
MDY0NAotLS0gYS90b29scy9saWJ4bC9saWJ4bF9ldmVudC5jCisrKyBiL3Rvb2xzL2xpYnhsL2xp
YnhsX2V2ZW50LmMKQEAgLTE0MTcsNiArMTQxNyw3IEBAIHN0YXRpYyB2b2lkIGFmdGVycG9sbF9p
bnRlcm5hbChsaWJ4bF9fZWdjICplZ2MsIGxpYnhsX19wb2xsZXIgKnBvbGxlciwKICAgICB9CiAK
ICAgICBpZiAoYWZ0ZXJwb2xsX2NoZWNrX2ZkKHBvbGxlcixmZHMsbmZkcywgcG9sbGVyLT53YWtl
dXBfcGlwZVswXSxQT0xMSU4pKSB7CisgICAgICAgIHBvbGxlci0+cGlwZV9ub25lbXB0eSA9IDA7
CiAgICAgICAgIGludCBlID0gbGlieGxfX3NlbGZfcGlwZV9lYXRhbGwocG9sbGVyLT53YWtldXBf
cGlwZVswXSk7CiAgICAgICAgIGlmIChlKSBMSUJYTF9fRVZFTlRfRElTQVNURVIoZ2MsICJyZWFk
IHdha2V1cCIsIGUsIDApOwogICAgIH0KQEAgLTE4MDksNiArMTgxMCw4IEBAIHZvaWQgbGlieGxf
X3BvbGxlcl9wdXQobGlieGxfY3R4ICpjdHgsIGxpYnhsX19wb2xsZXIgKnApCiAKIHZvaWQgbGli
eGxfX3BvbGxlcl93YWtldXAobGlieGxfX2djICpnYywgbGlieGxfX3BvbGxlciAqcCkKIHsKKyAg
ICBpZiAocC0+cGlwZV9ub25lbXB0eSkgcmV0dXJuOworICAgIHAtPnBpcGVfbm9uZW1wdHkgPSAx
OwogICAgIGludCBlID0gbGlieGxfX3NlbGZfcGlwZV93YWtldXAocC0+d2FrZXVwX3BpcGVbMV0p
OwogICAgIGlmIChlKSBMSUJYTF9fRVZFTlRfRElTQVNURVIoZ2MsICJjYW5ub3QgcG9rZSB3YXRj
aCBwaXBlIiwgZSwgMCk7CiB9CmRpZmYgLS1naXQgYS90b29scy9saWJ4bC9saWJ4bF9pbnRlcm5h
bC5oIGIvdG9vbHMvbGlieGwvbGlieGxfaW50ZXJuYWwuaAppbmRleCBlZWM0YmY3NjdkLi4wYWIz
MjQxMDJiIDEwMDY0NAotLS0gYS90b29scy9saWJ4bC9saWJ4bF9pbnRlcm5hbC5oCisrKyBiL3Rv
b2xzL2xpYnhsL2xpYnhsX2ludGVybmFsLmgKQEAgLTYyNSw2ICs2MjUsNyBAQCBzdHJ1Y3QgbGli
eGxfX3BvbGxlciB7CiAgICAgaW50ICgqZmRfcmluZGljZXMpWzNdOyAvKiBzZWUgbGlieGxfZXZl
bnQuYzpiZWZvcmVwb2xsX2ludGVybmFsICovCiAKICAgICBpbnQgd2FrZXVwX3BpcGVbMl07IC8q
IDAgbWVhbnMgbm8gZmQgYWxsb2NhdGVkICovCisgICAgYm9vbCBwaXBlX25vbmVtcHR5OwogCiAg
ICAgLyoKICAgICAgKiBXZSBhbHNvIHVzZSB0aGUgcG9sbGVyIHRvIHJlY29yZCB3aGV0aGVyIGFu
eSBmZHMgaGF2ZSBiZWVuCi0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
