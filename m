Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DDDDD4620
	for <lists+xen-devel@lfdr.de>; Fri, 11 Oct 2019 19:02:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iIyDH-0006MF-20; Fri, 11 Oct 2019 16:56:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fsnF=YE=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iIyDF-0006LW-4w
 for xen-devel@lists.xenproject.org; Fri, 11 Oct 2019 16:56:21 +0000
X-Inumbo-ID: ff73a2d4-ec47-11e9-933c-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ff73a2d4-ec47-11e9-933c-12813bfff9fa;
 Fri, 11 Oct 2019 16:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1570812959;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=OgzbZH95ciyfIk2ztgZshHWQQpChpylpiJYq0C3B7KY=;
 b=fccSfqGG8SHw83rGws1UY4vtWbjzqE3QrnBfToZ89sR+ua7yQ9brOZUe
 VNSkrtCQciBtcz5csYadJXLQdnqyUI2gJ4HUwDFPkXGhTE4jV8rtfwWLY
 hRlnEdrrj33Wy2phj23pFgvGF0xLSshWfC96lMzYaFtBO5QcjVGhis2jo E=;
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
IronPort-SDR: 1K31IN2XWGYrsP9Sw2JZvdZmA9xokFMlech4YQ5MXkCs0+YLXNuADca84ARQyv4fpWAgKxKr4N
 6TSopD8Ljr4boRGP/agddo2Rr3CHMMxmTlF4M6MAZPmgKWQoFj6LaFBmTV1qAS4Lpdly/BaJPP
 PtkDyph69YaySp1f5MrVjjjxBens4vOQXdYd+vvPV7LnYzLpQ4bkwUtPneGMHpCZ5FEYMYV/q8
 zrOywXAcVeUxXdmLI+HnItblX+f27nNh74Azyt1wcSW/i2dj749Dj82x6aaYXdlHyPK0gjmYUS
 lX0=
X-SBRS: 2.7
X-MesageID: 6779038
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,284,1566878400"; 
   d="scan'208";a="6779038"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 11 Oct 2019 17:55:48 +0100
Message-ID: <20191011165549.21639-6-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20191011165549.21639-1-ian.jackson@eu.citrix.com>
References: <20191011165549.21639-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [XEN PATCH for-4.13 v3 09/10] libxl: Move
 domain_create_info_setdefault earlier
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
Cc: Paul Durrant <pdurrant@gmail.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2UgbmVlZCB0aGlzIGJlZm9yZSB3ZSBzdGFydCB0byBmaWd1cmUgb3V0IHRoZSBwYXNzdGhyb3Vn
aCBtb2RlLgoKSSBoYXZlIGNoZWNrZWQgdGhhdCBub3RoaW5nIGluIGxpYnhsX19kb21haW5fY3Jl
YXRlX2luZm9fc2V0ZGVmYXVsdApub3IgdGhlIHR3byBpbXBsZW1lbnRhdGlvbnMgb2YgLi4uX2Fy
Y2hfLi4uIGFjY2Vzc2VzIGFueXRoaW5nIGVsc2UsCm90aGVyIHRoYW4gKGkpIHRoZSBkb21haW4g
dHlwZSAod2hpY2ggdGhpcyBmdW5jdGlvbiBpcyByZXNwb25zaWJsZSBmb3IKc2V0dGluZyBhbmQg
bm90aGluZyBiZWZvcmUgaXQgbG9va3MgYXQpIChpaSkgY19pbmZvLT5zc2lkcmVmICh3aGljaCBp
cwpkZWZhdWx0ZWQgYnkgZmxhc2sgY29kZSBuZWFyIHRoZSB0b3Agb2YKbGlieGxfX2RvbWFpbl9j
b25maWdfc2V0ZGVmYXVsdCBhbmQgbm90IGFjY2Vzc2VkIGFmdGVyd2FyZHMpLgoKU28gbm8gZnVu
Y3Rpb25hbCBjaGFuZ2UuCgpTaWduZWQtb2ZmLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25A
ZXUuY2l0cml4LmNvbT4KLS0tCnYzOiBOZXcgcGF0Y2ggaW4gdGhpcyB2ZXJzaW9uIG9mIHRoZSBz
ZXJpZXMuCi0tLQogdG9vbHMvbGlieGwvbGlieGxfY3JlYXRlLmMgfCAxNCArKysrKysrLS0tLS0t
LQogMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS90b29scy9saWJ4bC9saWJ4bF9jcmVhdGUuYyBiL3Rvb2xzL2xpYnhsL2xpYnhsX2Ny
ZWF0ZS5jCmluZGV4IDY5OTcxYzk3YjYuLjNkMmNiNTJiZjcgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2xp
YnhsL2xpYnhsX2NyZWF0ZS5jCisrKyBiL3Rvb2xzL2xpYnhsL2xpYnhsX2NyZWF0ZS5jCkBAIC05
NjgsNiArOTY4LDEzIEBAIGludCBsaWJ4bF9fZG9tYWluX2NvbmZpZ19zZXRkZWZhdWx0KGxpYnhs
X19nYyAqZ2MsCiAgICAgICAgIGdvdG8gZXJyb3Jfb3V0OwogICAgIH0KIAorICAgIHJldCA9IGxp
YnhsX19kb21haW5fY3JlYXRlX2luZm9fc2V0ZGVmYXVsdChnYywgJmRfY29uZmlnLT5jX2luZm8s
CisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICZwaHlzaW5m
byk7CisgICAgaWYgKHJldCkgeworICAgICAgICBMT0dEKEVSUk9SLCBkb21pZCwgIlVuYWJsZSB0
byBzZXQgZG9tYWluIGNyZWF0ZSBpbmZvIGRlZmF1bHRzIik7CisgICAgICAgIGdvdG8gZXJyb3Jf
b3V0OworICAgIH0KKwogICAgIC8qIElmIHRhcmdldF9tZW1rYiBpcyBzbWFsbGVyIHRoYW4gbWF4
X21lbWtiLCB0aGUgc3Vic2VxdWVudCBjYWxsCiAgICAgICogdG8gbGlieGMgd2hlbiBidWlsZGlu
ZyBIVk0gZG9tYWluIHdpbGwgZW5hYmxlIFBvRCBtb2RlLgogICAgICAqLwpAQCAtMTAwNywxMyAr
MTAxNCw2IEBAIGludCBsaWJ4bF9fZG9tYWluX2NvbmZpZ19zZXRkZWZhdWx0KGxpYnhsX19nYyAq
Z2MsCiAgICAgICAgIGdvdG8gZXJyb3Jfb3V0OwogICAgIH0KIAotICAgIHJldCA9IGxpYnhsX19k
b21haW5fY3JlYXRlX2luZm9fc2V0ZGVmYXVsdChnYywgJmRfY29uZmlnLT5jX2luZm8sCi0gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICZwaHlzaW5mbyk7Ci0g
ICAgaWYgKHJldCkgewotICAgICAgICBMT0dEKEVSUk9SLCBkb21pZCwgIlVuYWJsZSB0byBzZXQg
ZG9tYWluIGNyZWF0ZSBpbmZvIGRlZmF1bHRzIik7Ci0gICAgICAgIGdvdG8gZXJyb3Jfb3V0Owot
ICAgIH0KLQogICAgIGlmIChkX2NvbmZpZy0+Yl9pbmZvLnNoYWRvd19tZW1rYiA9PSBMSUJYTF9N
RU1LQl9ERUZBVUxUCiAgICAgICAgICYmIG9rX3RvX2RlZmF1bHRfbWVta2JfaW5fY3JlYXRlKGdj
KSkKICAgICAgICAgZF9jb25maWctPmJfaW5mby5zaGFkb3dfbWVta2IgPQotLSAKMi4xMS4wCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
