Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D88DE8C33
	for <lists+xen-devel@lfdr.de>; Tue, 29 Oct 2019 16:56:56 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iPTpe-0007uR-BD; Tue, 29 Oct 2019 15:54:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BagA=YW=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iPTpd-0007u6-AZ
 for xen-devel@lists.xenproject.org; Tue, 29 Oct 2019 15:54:53 +0000
X-Inumbo-ID: 6bc31438-fa64-11e9-9515-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6bc31438-fa64-11e9-9515-12813bfff9fa;
 Tue, 29 Oct 2019 15:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1572364483;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=MS3PxPvNAi++dU9aFtTfVj9cjlkNFS2jOHH5q7cH4J4=;
 b=HfSnAO7vDpJZR/k7v8KMer4mt1HFJlyYT9RjPmMwf9S7lP2aB7yjsUlI
 GRrkmp3ntjgVH+Orak/LXpXjvxGtM3z7/TbOh0V3ALsSCucQbXuZItEj7
 RFkipiOX5W85/FhlfgtnCX/PHti6LKQkdWL8AH7ilppM7E0RUEC+h1u9E Y=;
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
IronPort-SDR: kZQHK4Fg/REBOKWpp9fCJVjiShjpzqupChtCGODR/Gd17ds8+YO3srk8AQkPQzkfrk97q4ypv6
 z3uhHQaywKq3iifnBR/yymAwHh2lp21Pem7iJc8ZiuXO+zxXDZSwMGGy0XneutYjP7reacT0Dz
 YRxwiLoTe2iF/Vr1GXFUV+9zgveVPhIohOZaDE+7Q7OxMPFpPzRxKcJvjQL1vpADtNoRTZUZ9c
 eFNLpPwtAnEodK+/vvn7+kLbiICUSg5aUdRnYz2GRUiUMV91cQm1HmEDJkMdIjiHempOeDkY2a
 KdY=
X-SBRS: 2.7
X-MesageID: 7935322
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,244,1569297600"; 
   d="scan'208";a="7935322"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 29 Oct 2019 15:54:33 +0000
Message-ID: <20191029155436.14376-2-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <23992.24295.523533.643279@mariner.uk.xensource.com>
References: <23992.24295.523533.643279@mariner.uk.xensource.com>
MIME-Version: 1.0
Subject: [Xen-devel] [XEN PATCH for-4.13 v2 1/4] tools/libxl: gentypes.py:
 Prefer init_val to init_fn
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
Cc: =?UTF-8?q?J=C3=BCrgen=20Gro=C3=9F?= <jgross@suse.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2hlbiBib3RoIGFyZSBwcm92aWRlZCwgaW5pdF92YWwgaXMgbGlrZWx5IHRvIGJlIG1vcmUgZGly
ZWN0LgoKTm8gZnVuY3Rpb25hbCBjaGFuZ2Ugd2l0aCBleGlzdGluZyB0eXBlczogQyBvdXRwdXQg
aXMgaWRlbnRpY2FsLgoKU2lnbmVkLW9mZi1ieTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1
LmNpdHJpeC5jb20+Ci0tLQogdG9vbHMvbGlieGwvZ2VudHlwZXMucHkgfCA2ICsrKy0tLQogMSBm
aWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS90b29scy9saWJ4bC9nZW50eXBlcy5weSBiL3Rvb2xzL2xpYnhsL2dlbnR5cGVzLnB5CmluZGV4
IDY0MTdjOWRkOGMuLjE3NjkxMjE0NjggMTAwNjQ0Ci0tLSBhL3Rvb2xzL2xpYnhsL2dlbnR5cGVz
LnB5CisrKyBiL3Rvb2xzL2xpYnhsL2dlbnR5cGVzLnB5CkBAIC0zMTEsMTAgKzMxMSwxMCBAQCBk
ZWYgbGlieGxfQ190eXBlX2NvcHlfZGVwcmVjYXRlZChmaWVsZCwgdiwgaW5kZW50ID0gIiAgICAi
LCB2cGFyZW50ID0gTm9uZSk6CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGZp
ZWxkLnR5cGUucGFzc19hcmcodiwgdnBhcmVudCBpcyBOb25lKSkKIAogICAgICAgICBzKz0gIiAg
ICAiCi0gICAgICAgIGlmIGZpZWxkLnR5cGUuaW5pdF9mbiBpcyBub3QgTm9uZToKLSAgICAgICAg
ICAgIHMrPSAiJXMoJXMpO1xuIiAlIChmaWVsZC50eXBlLmluaXRfZm4sIGZpZWxkX3B0cikKLSAg
ICAgICAgZWxpZiBmaWVsZC50eXBlLmluaXRfdmFsIGlzIG5vdCBOb25lOgorICAgICAgICBpZiBm
aWVsZC50eXBlLmluaXRfdmFsIGlzIG5vdCBOb25lOgogICAgICAgICAgICAgcys9ICIlcyA9ICVz
O1xuIiAlIChmaWVsZF92YWwsIGZpZWxkLnR5cGUuaW5pdF92YWwpCisgICAgICAgIGVsaWYgZmll
bGQudHlwZS5pbml0X2ZuIGlzIG5vdCBOb25lOgorICAgICAgICAgICAgcys9ICIlcyglcyk7XG4i
ICUgKGZpZWxkLnR5cGUuaW5pdF9mbiwgZmllbGRfcHRyKQogICAgICAgICBlbHNlOgogICAgICAg
ICAgICAgcys9ICJtZW1zZXQoJXMsIDAsIHNpemVvZigqJXMpKTtcbiIgJSAoZmllbGRfcHRyLCBm
aWVsZF9wdHIpCiAKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
