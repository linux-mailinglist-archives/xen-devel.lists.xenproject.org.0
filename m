Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB118E8C3C
	for <lists+xen-devel@lfdr.de>; Tue, 29 Oct 2019 16:57:40 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iPTpb-0007sr-0m; Tue, 29 Oct 2019 15:54:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BagA=YW=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iPTpY-0007rm-T0
 for xen-devel@lists.xenproject.org; Tue, 29 Oct 2019 15:54:48 +0000
X-Inumbo-ID: 6ef54372-fa64-11e9-beca-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6ef54372-fa64-11e9-beca-bc764e2007e4;
 Tue, 29 Oct 2019 15:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1572364488;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=wnhimyTGR8ZtqiOmlu0evd1xdheOR6gnfxBBPPW4lmI=;
 b=B2gWL9wM6S3nShHKbv2vA5DFpUf0Muhns4jWxlCxOMC6aQb4QHykv3dy
 oL1XZgydADn4e7IH3w73HqOuSbauhNvSYAyyAi9TqKMAEEPmGU2UtZfNk
 lowGC7EZfuag3BXKJOy2poFj0LKEAkfCZgL2OKjkx/MI8ahZXr9Dz+vdI Y=;
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
IronPort-SDR: CMHLDN0iyZ+JHiXJz17iiRcu8O0WilsS5I7Cbmhi8sxQR1sjFIEWjcYcafCaPQFaNnBa5kB7ge
 kazJ1UWmNryxUbPmY9abd+iJXVP8HEeFYcFZaeLSyHKkA9bqtwTJjQ1GD0PYXujPkLwAu8V3K9
 tNlFNjyklaxLLw0jgLHj5ew7umoTZgP/pWtXWL5TV1SKvifxYdHVIew7X8dgrm50n1rfK+a2eM
 UDfbamaOeFa9KjsqoqUIGDfz+oN3rnpq5/aqXIzZA1HKFan3RUKi+XKjvvY5wiDD1yVkdzcSmX
 7UY=
X-SBRS: 2.7
X-MesageID: 7890846
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,244,1569297600"; 
   d="scan'208";a="7890846"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 29 Oct 2019 15:54:36 +0000
Message-ID: <20191029155436.14376-5-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <23992.24295.523533.643279@mariner.uk.xensource.com>
References: <23992.24295.523533.643279@mariner.uk.xensource.com>
MIME-Version: 1.0
Subject: [Xen-devel] [XEN PATCH for-4.13 v2 4/4] libxl: gentypes: initialise
 array elements in json
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
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Oleksandr Grytsov <oleksandr_grytsov@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogT2xla3NhbmRyIEdyeXRzb3YgPG9sZWtzYW5kcl9ncnl0c292QGVwYW0uY29tPgoKQ3Vy
cmVudGx5LCBhcnJheSBlbGVtZW50cyBhcmUgaW5pdGlhbGl6ZWQgd2l0aCBjYWxsb2MuICBXaGlj
aCBtZWFucwppbml0aWFsaXplIGFsbCBlbGVtZW50IGZpZWxkcyB3aXRoIHplcm8gdmFsdWVzLiAg
SWYgYW4gZW50cnkgaXMgbm90CnByZXNlbnQgaW4gdGhlIGpzb24gKHdoaWNoIGlzIGVudGlyZWx5
IHBlcm1pdHRlZCksIHRoZSBlbGVtZW50IHdpbGwgYmUKYWxsLWJpdHMtemVybyBpbnN0ZWFkIG9m
IHRoZSBkZWZhdWx0IHZhbHVlICh3aGljaCBpcyB3cm9uZykuCgpUaGUgZml4IGlzIHRvIGluaXRh
bGlzZSBlYWNoIGFycmF5IGVsZW1lbnQgYmVmb3JlIHBhcnNpbmcgaXQsIHVzaW5nCnRoZSBuZXcg
bGlieGxfQ190eXBlX2RvX2luaXQgZnVuY3Rpb24uCgpXaXRoIGV4aXN0aW5nIHR5cGVzIHRoaXMg
cmVzdWx0cyBpbiBhIGxvdCBvZiBuZXcgY2FsbHMgbGlrZSB0aGlzOgoKICAgICAgZm9yIChpPTA7
ICh0PWxpYnhsX19qc29uX2FycmF5X2dldCh4LGkpKTsgaSsrKSB7CiArICAgICAgICAgICAgbGli
eGxfc2NoZWRfcGFyYW1zX2luaXQoJnAtPnZjcHVzW2ldKTsKICAgICAgICAgICAgICByYyA9IGxp
YnhsX19zY2hlZF9wYXJhbXNfcGFyc2VfanNvbihnYywgdCwgJnAtPnZjcHVzW2ldKTsKCihpbmRl
bnRhdGlvbiBhZGp1c3RlZCkuICBUaGlzIGxvb2tzIHJpZ2h0LiAgVG8gY2hlY2sgd2hhdCBoYXBw
ZW5zIHdpdGgKdHlwZXMgd2hpY2ggaGF2ZSBub250cml2aWFsIGRlZmF1bHRzIGJ1dCBkb24ndCBo
YXZlIGluaXQgZnVuY3Rpb25zIChvZgp3aGljaCB3ZSBjdXJyZW50bHkgaGF2ZSBub25lIGluIGFy
cmF5cyksIEkgKElhbikgZXhwZXJpbWVudGFsbHkgYWRkZWQ6CgogICAgICAoInBub2RlIiwgdWlu
dDMyKSwgIyBwaHlzaWNhbCBub2RlIG9mIHRoaXMgbm9kZQogICAgICAoInZjcHVzIiwgbGlieGxf
Yml0bWFwKSwgIyB2Y3B1cyBpbiB0aGlzIG5vZGUKICsgICAgKCJzcG9ya3MiLCBBcnJheShNZW1L
QiwgIm51bV9zcG9ya3MiKSksCiAgICAgIF0pCgpUaGUgcmVzdWx0IHdhcyB0aGlzOgoKICAgICAg
ICAgIGZvciAoaT0wOyAodD1saWJ4bF9fanNvbl9hcnJheV9nZXQoeCxpKSk7IGkrKykgewogKyAg
ICAgICAgICAgICAgICBwLT5zcG9ya3NbaV0gPSBMSUJYTF9NRU1LQl9ERUZBVUxUOwogICAgICAg
ICAgICAgICAgICByYyA9IGxpYnhsX191aW50NjRfcGFyc2VfanNvbihnYywgdCwgJnAtPnNwb3Jr
c1tpXSk7Cgp3aGVyZSB0aGUgY29udGV4dCB3YXMgYWRkZWQgYnkgYWRkaW5nICJzcG9ya3MiIGFu
ZCAiKyIgaW5kaWNhdGVzIGEKbGluZSBhZGRlZCBieSB0aGlzIHBhdGNoLCAiaW5pdGlhbGlzZSBh
cnJheSBlbGVtZW50cyBpbiBqc29uIi4KClNpZ25lZC1vZmYtYnk6IE9sZWtzYW5kciBHcnl0c292
IDxvbGVrc2FuZHJfZ3J5dHNvdkBlcGFtLmNvbT4KU2lnbmVkLW9mZi1ieTogSWFuIEphY2tzb24g
PGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+Ci0tLQp2MiBbaXdqXTogVXNlIGxpYnhsX0NfdHlw
ZV9kb19pbml0LgogICAgICAgICAgUmV3b3JkIGNvbW1pdCBtZXNzYWdlIGFuZCBkaXNjdXNzIHNw
b3JrIHRlc3RpbmcuCi0tLQogdG9vbHMvbGlieGwvZ2VudHlwZXMucHkgfCA0ICsrKysKIDEgZmls
ZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS90b29scy9saWJ4bC9nZW50
eXBlcy5weSBiL3Rvb2xzL2xpYnhsL2dlbnR5cGVzLnB5CmluZGV4IDEyNDI4NWNkNjYuLmM3NDQ0
NWYxNmUgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2xpYnhsL2dlbnR5cGVzLnB5CisrKyBiL3Rvb2xzL2xp
YnhsL2dlbnR5cGVzLnB5CkBAIC00NjEsNiArNDYxLDEwIEBAIGRlZiBsaWJ4bF9DX3R5cGVfcGFy
c2VfanNvbih0eSwgdywgdiwgaW5kZW50ID0gIiAgICAiLCBwYXJlbnQgPSBOb25lLCBkaXNjcmlt
aW5hCiAgICAgICAgIHMgKz0gIiAgICAgICAgZ290byBvdXQ7XG4iCiAgICAgICAgIHMgKz0gIiAg
ICB9XG4iCiAgICAgICAgIHMgKz0gIiAgICBmb3IgKGk9MDsgKHQ9bGlieGxfX2pzb25fYXJyYXlf
Z2V0KHgsaSkpOyBpKyspIHtcbiIKKyAgICAgICAgcyArPSBsaWJ4bF9DX3R5cGVfZG9faW5pdCh0
eS5lbGVtX3R5cGUsCisgICAgICAgICAgICAgICAgICAgIGxhbWJkYShieSk6ICgiJiIgaWYgYnkg
PT0gaWRsLlBBU1NfQllfUkVGRVJFTkNFIGVsc2UgIiIpKworICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAoIiVzW2ldIiAlIHYpLAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIG5lZWRfemVybz1GYWxzZSwgaW5kZW50PWluZGVudCsiICAgICIpCiAgICAgICAgIHMgKz0g
bGlieGxfQ190eXBlX3BhcnNlX2pzb24odHkuZWxlbV90eXBlLCAidCIsIHYrIltpXSIsCiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaW5kZW50ICsgIiAgICAiLCBwYXJlbnQp
CiAgICAgICAgIHMgKz0gIiAgICB9XG4iCi0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
