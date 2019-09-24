Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72D63BCA88
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2019 16:46:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCm1s-0001hx-0U; Tue, 24 Sep 2019 14:43:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Wx4c=XT=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iCm1q-0001hG-CU
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2019 14:42:58 +0000
X-Inumbo-ID: 961b4da8-ded9-11e9-b588-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by localhost (Halon) with ESMTPS
 id 961b4da8-ded9-11e9-b588-bc764e2007e4;
 Tue, 24 Sep 2019 14:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569336172;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=aMCBAm9A0qM+e1JTGOpKYvaGlIX9LSyQNYWrYt9GFO0=;
 b=NFNA776np8hEwdLWYCPkcJdpVAFeAtCdx6uyB5D9Tt5mD6VVMqDNJJJg
 Oey8sArDN+QPxgAVGcz8fixuft4Qi5HD1B0Wm/MHpwU+33yIiEPJg4qGR
 o0BeMIoEWGW1QB9B61jor4rrpyKjFmGVcgBKKLMMk8+F9K6JUd0equW7Y g=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@eu.citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@eu.citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@eu.citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: QrpoPEWHvKLPbxxwfq8gQ8cB64ToIhXeYCHREVQT1wD7mZWXMcHFXuo6uhJjQitNFan5TesNJG
 Z9zj/Y3jzb6YAyuZ0gGDa9NfJ8W6UeEmnMce8GPKQViNcA7Hg4pnla7wD31PC7FIsH3EzT/kNw
 hN+IkdvVgYwp4l7u1jbP1XPj3dKld1kz5GtcOlWhg3YffyOXhWRyvrkROLZhA4XszxTCuOY0+c
 8ljRb4gSRn+zKCt8fRW+aMt2mAsMnZZX+d+kojMbSNh7NBAU95scXMRnyOzPJN3O5V9ZxwoF3I
 6Ec=
X-SBRS: 2.7
X-MesageID: 6059112
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,544,1559534400"; 
   d="scan'208";a="6059112"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 24 Sep 2019 15:42:43 +0100
Message-ID: <20190924144244.7940-3-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190924144244.7940-1-ian.jackson@eu.citrix.com>
References: <20190924144244.7940-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH 3/4] ts-*-build: Save the .config (as
 <host>--kconfig)
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
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBpcyBzYXZlZCBhZnRlciB0aGUgYnVpbGQgYnV0IHdlIHdhbnQgaXQgZXZlbiBpZiB0aGVy
ZSBpcyBhIGJ1aWxkCmZhaWx1cmUsIHNvIHNhdmUgaXQgYWZ0ZXIgaXQgaXMgZ2VuZXJhdGVkIGFu
ZCBiZWZvcmUgd2Ugc3RhcnQgdGhlCmJ1aWxkLgoKU2lnbmVkLW9mZi1ieTogSWFuIEphY2tzb24g
PGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+Ci0tLQogdHMta2VybmVsLWJ1aWxkIHwgMSArCiB0
cy14ZW4tYnVpbGQgICAgfCAyICsrCiAyIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQoK
ZGlmZiAtLWdpdCBhL3RzLWtlcm5lbC1idWlsZCBiL3RzLWtlcm5lbC1idWlsZAppbmRleCA1NTM2
NTg2Zi4uNTZmZjc5OTQgMTAwNzU1Ci0tLSBhL3RzLWtlcm5lbC1idWlsZAorKysgYi90cy1rZXJu
ZWwtYnVpbGQKQEAgLTQwNCw2ICs0MDQsNyBAQCBzdWIgY29uZmlnICgpIHsKICAgICBteSAkY29u
ZmlnaG93PSAkcntrY29uZmlnaG93fTsKICAgICAkY29uZmlnaG93ID1+IHMvXFcvXy9nOwogICAg
ICZ7ICJjb25maWdfJGNvbmZpZ2hvdyIgfSgpOworICAgIHRhcmdldF9nZXRmaWxlX3N0YXNoKCRo
bywzMCwiJGJ1aWxkZGlyL2xpbnV4Ly5jb25maWciLCJrY29uZmlnIik7CiB9CiAKIHN1YiBidWls
ZCAoKSB7CmRpZmYgLS1naXQgYS90cy14ZW4tYnVpbGQgYi90cy14ZW4tYnVpbGQKaW5kZXggMTc2
MmNkNjEuLmRlZWM1MmIyIDEwMDc1NQotLS0gYS90cy14ZW4tYnVpbGQKKysrIGIvdHMteGVuLWJ1
aWxkCkBAIC0xNjYsNiArMTY2LDggQEAgRU5ECiAgICAgICAgICAgICBmaQogRU5ECiAKKyAgICB0
YXJnZXRfZ2V0ZmlsZV9zdGFzaCgkaG8sMzAsICIkYnVpbGRkaXIveGVuLy5jb25maWciLCJrY29u
ZmlnIik7CisKICAgICBpZiAoIUBtYWtlX2FyZ3MpIHsKIAlidWlsZGNtZF9zdGFtcGVkX2xvZ2dl
ZCg5MDAwLCAneGVuJywgJ2J1aWxkJywgJycsPDxFTkQsJycpOwogICAgICAgICAgICAgJG1ha2Vf
cHJlZml4ICRtYWtlICRtYWtlZmxhZ3MgYnVpbGQKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
