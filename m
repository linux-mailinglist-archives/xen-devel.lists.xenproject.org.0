Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2EA5136E1D
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jan 2020 14:32:04 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipuM8-0002Fr-6U; Fri, 10 Jan 2020 13:29:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0O1r=27=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1ipuM5-0002EJ-Uf
 for xen-devel@lists.xenproject.org; Fri, 10 Jan 2020 13:29:37 +0000
X-Inumbo-ID: 34809728-33ad-11ea-b89f-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 34809728-33ad-11ea-b89f-bc764e2007e4;
 Fri, 10 Jan 2020 13:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1578662959;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=P6HFqP1Bjv37yEk837tA9BxuNXZT5/Uewndbv9FiUBA=;
 b=CoOxXmgy3N+GVsjQefNZaru6CckksUWhAqfRpZ9Cm5vIn+7opsZDH5uU
 EMtkLn/V0xjZOgFX5HxwIjKunLHq84Kwf27Yy4M0ofQ3466rshrrLRrIt
 baEvLJp7AWf+aPCGzB/6rel2cvdVm/oc9JQYwJMcsBCUrw5ezEOzDzBBQ A=;
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
IronPort-SDR: 6yvIYErgDqYk+bCXVG9HVDbE0PX44AWuDemAkyHO3KUcPuPyAF6H1zyDOnoVwV3nmLWcLTQCsR
 U9YFXIGzjNkl8NykNFZEy9dbOBbEG7XuJgJwdz2ghRHggH6TyQuiem0xcvfILBX1FWd8/py9I5
 S1VHybxqy1FauJStlzqwzhpMVcIaIkOCurnoeh4GMWdtAUO/zFx8flk8PhQzPosyE8m2NS0VZ+
 Eb3V5YkLHk1PCDeiv8yGcSP0R7qblwXnvA8QwueIKnKtVXn8vWz/FrUJaQH1JqOsQge3tUM743
 avo=
X-SBRS: 2.7
X-MesageID: 10724856
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,417,1571716800"; d="scan'208";a="10724856"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 10 Jan 2020 13:28:59 +0000
Message-ID: <20200110132902.29295-6-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200110132902.29295-1-ian.jackson@eu.citrix.com>
References: <20200110132902.29295-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 5/8] libxl: event: poller pipe optimisation
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
bi5qYWNrc29uQGV1LmNpdHJpeC5jb20+Ci0tLQogdG9vbHMvbGlieGwvbGlieGxfZXZlbnQuYyAg
ICB8IDIgKysKIHRvb2xzL2xpYnhsL2xpYnhsX2ludGVybmFsLmggfCAxICsKIDIgZmlsZXMgY2hh
bmdlZCwgMyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvdG9vbHMvbGlieGwvbGlieGxfZXZl
bnQuYyBiL3Rvb2xzL2xpYnhsL2xpYnhsX2V2ZW50LmMKaW5kZXggMThkYjA5MWE2ZS4uMDU1NTlj
YWQ5YSAxMDA2NDQKLS0tIGEvdG9vbHMvbGlieGwvbGlieGxfZXZlbnQuYworKysgYi90b29scy9s
aWJ4bC9saWJ4bF9ldmVudC5jCkBAIC0xMzE5LDYgKzEzMTksNyBAQCBzdGF0aWMgdm9pZCBhZnRl
cnBvbGxfaW50ZXJuYWwobGlieGxfX2VnYyAqZWdjLCBsaWJ4bF9fcG9sbGVyICpwb2xsZXIsCiAg
ICAgfQogCiAgICAgaWYgKGFmdGVycG9sbF9jaGVja19mZChwb2xsZXIsZmRzLG5mZHMsIHBvbGxl
ci0+d2FrZXVwX3BpcGVbMF0sUE9MTElOKSkgeworICAgICAgICBwb2xsZXItPnBpcGVfbm9uZW1w
dHkgPSAwOwogICAgICAgICBpbnQgZSA9IGxpYnhsX19zZWxmX3BpcGVfZWF0YWxsKHBvbGxlci0+
d2FrZXVwX3BpcGVbMF0pOwogICAgICAgICBpZiAoZSkgTElCWExfX0VWRU5UX0RJU0FTVEVSKGVn
YywgInJlYWQgd2FrZXVwIiwgZSwgMCk7CiAgICAgfQpAQCAtMTcxMyw2ICsxNzE0LDcgQEAgdm9p
ZCBsaWJ4bF9fcG9sbGVyX3B1dChsaWJ4bF9jdHggKmN0eCwgbGlieGxfX3BvbGxlciAqcCkKIAog
dm9pZCBsaWJ4bF9fcG9sbGVyX3dha2V1cChsaWJ4bF9fZWdjICplZ2MsIGxpYnhsX19wb2xsZXIg
KnApCiB7CisgICAgaWYgKHAtPnBpcGVfbm9uZW1wdHkrKykgcmV0dXJuOwogICAgIGludCBlID0g
bGlieGxfX3NlbGZfcGlwZV93YWtldXAocC0+d2FrZXVwX3BpcGVbMV0pOwogICAgIGlmIChlKSBM
SUJYTF9fRVZFTlRfRElTQVNURVIoZWdjLCAiY2Fubm90IHBva2Ugd2F0Y2ggcGlwZSIsIGUsIDAp
OwogfQpkaWZmIC0tZ2l0IGEvdG9vbHMvbGlieGwvbGlieGxfaW50ZXJuYWwuaCBiL3Rvb2xzL2xp
YnhsL2xpYnhsX2ludGVybmFsLmgKaW5kZXggYjljNDAzMTg2My4uYmFmNzUwOWIxZSAxMDA2NDQK
LS0tIGEvdG9vbHMvbGlieGwvbGlieGxfaW50ZXJuYWwuaAorKysgYi90b29scy9saWJ4bC9saWJ4
bF9pbnRlcm5hbC5oCkBAIC02MjUsNiArNjI1LDcgQEAgc3RydWN0IGxpYnhsX19wb2xsZXIgewog
ICAgIGludCAoKmZkX3JpbmRpY2VzKVszXTsgLyogc2VlIGxpYnhsX2V2ZW50LmM6YmVmb3JlcG9s
bF9pbnRlcm5hbCAqLwogCiAgICAgaW50IHdha2V1cF9waXBlWzJdOyAvKiAwIG1lYW5zIG5vIGZk
IGFsbG9jYXRlZCAqLworICAgIGJvb2wgcGlwZV9ub25lbXB0eTsKIAogICAgIC8qCiAgICAgICog
V2UgYWxzbyB1c2UgdGhlIHBvbGxlciB0byByZWNvcmQgd2hldGhlciBhbnkgZmRzIGhhdmUgYmVl
bgotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
