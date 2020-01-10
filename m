Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3980E136E19
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jan 2020 14:31:26 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipuLu-00024G-5d; Fri, 10 Jan 2020 13:29:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0O1r=27=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1ipuLs-00022a-EZ
 for xen-devel@lists.xenproject.org; Fri, 10 Jan 2020 13:29:24 +0000
X-Inumbo-ID: 2f2a09d1-33ad-11ea-bf0f-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2f2a09d1-33ad-11ea-bf0f-12813bfff9fa;
 Fri, 10 Jan 2020 13:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1578662951;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=EQKJVYRxuGecgkUPMzOczs+XFPoxrOfmNieB9m2Ck6c=;
 b=f7pT50aU3vDRJKUOyxgDj0V+DRcF54KAnqrMAgJ/NFU8XbAoZeTokHu0
 qU+HlW9HA2yYukeyRdEbnvdwCHloJRM+7x1NpnUOiJ21DlMvc8tfOgOHi
 QxVawo0xwgDIOZopRl6spR0s0vAJlvTRbI9u6xvVcWmxhw2C1MqVxKtRd A=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@eu.citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@eu.citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@eu.citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
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
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: /3Y4gLvuy/92Dv4CGu/0cx1Ik2zFrx69pbn95ugEw5OTYP/7WKyqVo+XFYI4efRG3J9xzvpLh7
 vhvgDArV4WQ3UqsyQnKKF5PZK3bI5A5kKZuiur0MMfC8KDmh0pgvyPSw/7MuPi+mrW29F+yuj6
 g6ZFNce3XbidnvL96GPs1YBk5lYyOyYwTfaEZaRk+cwD7JUq1FGB3v+o6FVYZwmVkBKS8ixM7I
 i376A+XKAwmMty8hXVGlxf+JlVB1uGf+spGbEfBdhwy4NoDHxqCIJMblSyFYl+uqbJqdwG7Txy
 XOI=
X-SBRS: 2.7
X-MesageID: 10756446
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,417,1571716800"; d="scan'208";a="10756446"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 10 Jan 2020 13:29:01 +0000
Message-ID: <20200110132902.29295-8-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200110132902.29295-1-ian.jackson@eu.citrix.com>
References: <20200110132902.29295-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 7/8] libxl: event: Fix possible hang with
 libxl_osevent_beforepoll
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

SWYgdGhlIGFwcGxpY2F0aW9uIHVzZXMgbGlieGxfb3NldmVudF9iZWZvcmVwb2xsLCBhIHNpbWls
YXIgaGFuZyBpcwpwb3NzaWJsZSB0byB0aGUgb25lIGRlc2NyaWJlZCBhbmQgZml4ZWQgaW4KICAg
bGlieGw6IGV2ZW50OiBGaXggaGFuZyB3aGVuIG1peGluZyBibG9ja2luZyBhbmQgZXZlbnR5IGNh
bGxzCkFwcGxpY2F0aW9uIGJlaGF2aW91ciB3b3VsZCBoYXZlIHRvIGJlIGZhaXJseSB1bnVzdWFs
LCBidXQgaXQKZG9lc24ndCBzZWVtIHNlbnNpYmxlIHRvIGp1c3QgbGVhdmUgdGhpcyBsYXRlbnQg
YnVnLgoKV2UgZml4IHRoZSBsYXRlbnQgYnVnIGJ5IHdha2luZyB1cCB0aGUgInBvbGxlcl9hcHAi
IHBpcGUgZXZlcnkgdGltZSB3ZQphZGQgb3NldmVudHMuICBJZiB0aGUgYXBwbGljYXRpb24gZG9l
cyBub3QgZXZlciBjYWxsIGJlZm9yZXBvbGwsIHdlCndyaXRlIG9uZSBieXRlIHRvIHRoZSBwaXBl
IGFuZCBzZXQgcGlwZV9ub25lbXB0eSBhbmQgdGhlbiB3ZSBpZ25vcmUKaXQuICBXZSBvbmx5IHdy
aXRlIGFub3RoZXIgYnl0ZSBpZiBiZWZvcmVwb2xsIGlzIGNhbGxlZCBhZ2Fpbi4KCk5vcm1hbGx5
IGluIGFuIGV2ZW50eSBwcm9ncmFtIHRoZXJlIHdvdWxkIG9ubHkgYmUgb25lIHRocmVhZCBjYWxs
aW5nCmxpYnhsX29zZXZlbnRfYmVmb3JlcG9sbC4gIFRoZSBlZmZlY3QgaW4gc3VjaCBhIHByb2dy
YW0gaXMgdG8Kc29tZXRpbWVzIG5lZWRsZXNzbHkgZ28gcm91bmQgdGhlIHBvbGwgbG9vcCBhZ2Fp
biBpZiBhIHRpbWVvdXQKY2FsbGJhY2sgYmVjb21lcyBpbnRlcmVzdGVkIGluIGEgbmV3IG9zZXZl
bnQuICBXZSdsbCBmaXggdGhhdCBpbiBhCm1vbWVudC4KClNpZ25lZC1vZmYtYnk6IElhbiBKYWNr
c29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgotLS0KIHRvb2xzL2xpYnhsL2xpYnhsX2V2
ZW50LmMgfCAzICsrKwogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdp
dCBhL3Rvb2xzL2xpYnhsL2xpYnhsX2V2ZW50LmMgYi90b29scy9saWJ4bC9saWJ4bF9ldmVudC5j
CmluZGV4IDRkNTc4NDNjY2UuLjQzMTQxOTFjM2IgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2xpYnhsL2xp
YnhsX2V2ZW50LmMKKysrIGIvdG9vbHMvbGlieGwvbGlieGxfZXZlbnQuYwpAQCAtNTksNiArNTks
OSBAQCB2b2lkIGxpYnhsX19lZ2NfY2xlYW51cF8xX2JhdG9uKGxpYnhsX19lZ2MgKmVnYykKICAg
ICBFR0NfR0M7CiAgICAgbGlieGxfX3BvbGxlciAqc2VhcmNoLCAqd2FrZT0wOwogCisgICAgaWYg
KENUWC0+cG9sbGVyX2FwcC0+b3NldmVudHNfYWRkZWQpCisgICAgICAgIGJhdG9uX3dha2UoZWdj
LCBDVFgtPnBvbGxlcl9hcHApOworCiAgICAgTElCWExfTElTVF9GT1JFQUNIKHNlYXJjaCwgJkNU
WC0+cG9sbGVyc19hY3RpdmUsIGFjdGl2ZV9lbnRyeSkgewogICAgICAgICBpZiAoc2VhcmNoID09
IENUWC0+cG9sbGVyX2FwcCkKICAgICAgICAgICAgIC8qIFRoaXMgb25lIGlzIHNwZWNpYWwuICBX
ZSBjYW4ndCBnaXZlIGl0IHRoZSBiYXRvbi4gKi8KLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
