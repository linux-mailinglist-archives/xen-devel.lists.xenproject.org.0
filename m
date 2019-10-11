Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5257D461F
	for <lists+xen-devel@lfdr.de>; Fri, 11 Oct 2019 19:02:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iIyCs-0006Dz-20; Fri, 11 Oct 2019 16:55:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fsnF=YE=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iIyCq-0006Du-3W
 for xen-devel@lists.xenproject.org; Fri, 11 Oct 2019 16:55:56 +0000
X-Inumbo-ID: fd30360f-ec47-11e9-933c-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fd30360f-ec47-11e9-933c-12813bfff9fa;
 Fri, 11 Oct 2019 16:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1570812956;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=3T83u3cSEFF3YQT6EVN+9ncYDcNfwoQHtJR240P8Xf0=;
 b=Z9ox09nuW73POj6sOj4Rb2FWYaT5vH9JU5z0puzMZgP7uM5jCk0A5x/j
 zQejTCNtUg7sJiX3gsx7pPsf41qecQhdeghIW6Vsr0QlhUVB8+U3Y/84v
 t7acN7mDEhLl31VIshQbgx7cvmcSUXuDoI0hGW3IbI+7E5Kl4af8RY9hT E=;
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
IronPort-SDR: /4/eXkgRqMS0ozSdox9JP76NC3e4WPqVK5bEBKhNUVhP8ghKTZA9OSxqzBEfarhpxsg4w6tqpT
 rMbmBNpQtposAFopuRKAg1ya+eFon+/omfjYh5yO6zO/Z7cPBcPYCjxjhuEeTAMxVhxi/ClZel
 QeAdqO3SLrbi//Pv1ykQ7S5TO8zATUY6/AiVKWhBS2vq98GsUyrDDt4OMR2RRK6/oT4y5tWrE1
 I/OUrzIeS8vzKPOmssbOq0/ClskRgYAnbpLLrriFhXtmzI6cf/96oJ+MktrX2JWtH58jJnV1rF
 TsY=
X-SBRS: 2.7
X-MesageID: 6779036
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,284,1566878400"; 
   d="scan'208";a="6779036"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 11 Oct 2019 17:55:43 +0100
Message-ID: <20191011165549.21639-1-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [XEN PATCH for-4.13 v3 00/10] libxl memkb & pt
 defaulting
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

VGhpcyBpcyB2MyBvZiBteSBzZXJpZXMgdG8gc29ydCBvdXQgdGhlIHNoYWRvdy9pb21tdSBtZW1v
cnkgYW5kIHBjaQpwYXNzdGhyb3VnaCBzaXR1YXRpb24uICBJdCBpcyBhbHNvIGF2YWlsYWJsZSBo
ZXJlOgogICBodHRwczovL3hlbmJpdHMueGVuLm9yZy9naXR3ZWIvP3A9cGVvcGxlL2l3ai94ZW4u
Z2l0O2E9c3VtbWFyeQogICB3aXAubGlieGwtbWVta2ItcHRjZmcudjMKClRoYW5rcyB0byBBbmRy
ZXcgQ29vcGVyIGFuZCBKdWxpZW4gR3JhbGwgZm9yIGNvbW1lbnRzIGFib3V0IHRoZSBQVAptb2Rl
IHNldHRpbmcsIHdoaWNoIEkgdGhpbmsgSSBoYXZlIHRha2VuIGludG8gYWNjb3VudC4KCiAjYSAg
MDEgbGlieGw6IE9mZmVyIEFQSSB2ZXJzaW9ucyAweDA0MDcwMCBhbmQgMHgwNDA4MDAKICNyICAw
MiB4bDogUGFzcyBsaWJ4bF9kb21haW5fY29uZmlnIHRvIGZyZWVtZW0oKSwgaW5zdGVhZCBvZiBi
X2luZm8KICNyICAwMyBsaWJ4bDogbGlieGxfX2RvbWFpbl9jb25maWdfc2V0ZGVmYXVsdDogTmV3
IGZ1bmN0aW9uCiAjciAgMDQgbGlieGw6IGxpYnhsX2RvbWFpbl9uZWVkX21lbW9yeTogTWFrZSBp
dCB0YWtlIGEgZG9tYWluX2NvbmZpZwogICAgIDA1IGxpYnhsOiBNb3ZlIHNoYWRvd19tZW1rYiBh
bmQgaW9tbXVfbWVta2IgZGVmYXVsdGluZyBpbnRvIGxpYnhsCiAgYSAgMDYgbGlieGw6IFJlbW92
ZS9kZXByZWNhdGUgbGlieGxfZ2V0X3JlcXVpcmVkXypfbWVtb3J5IGZyb20gdGhlIEFQSQogIGEg
IDA3IGxpYnhsOiBjcmVhdGU6IHNldGRlZmF1bHQ6IE1ha2UgbGlieGxfcGh5c2luZm8gaW5mb1sx
XQogIGEgIDA4IGxpYnhsOiBjcmVhdGU6IHNldGRlZmF1bHQ6IE1vdmUgcGh5c2luZm8gaW50byBj
b25maWdfc2V0ZGVmYXVsdAogICArIDA5IGxpYnhsOiBNb3ZlIGRvbWFpbl9jcmVhdGVfaW5mb19z
ZXRkZWZhdWx0IGVhcmxpZXIKICAgKiAxMCBsaWJ4bC94bDogT3ZlcmhhdWwgcGFzc3Rocm91Z2gg
c2V0dGluZyBsb2dpYwoKICMgPSBub3QgYWN0dWFsbHkgcmVwb3N0ZWQgc28gYXMgdG8gc2hyaW5r
IHRoZSBwYXRjaGJvbWI7CiAgICAgIHVuY2hhbmdlZCBmcm9tIHByZXZpb3VzIHBvc3RpbmcKIGEg
PSBhY2tlZDsgciA9IHJldmlld2VkCiAqID0gcGF0Y2ggY2hhbmdlZDsgbSA9IG1lc3NhZ2UgY2hh
bmdlZDsgKyA9IG5ldyBwYXRjaAoKIGRvY3MvbWFuL3hsLmNmZy41LnBvZC5pbiAgICAgfCAgIDYg
KysKIHRvb2xzL2xpYnhsL2xpYnhsLmggICAgICAgICAgfCAgMjQgKysrKysrLQogdG9vbHMvbGli
eGwvbGlieGxfYXJjaC5oICAgICB8ICAgNiArKwogdG9vbHMvbGlieGwvbGlieGxfYXJtLmMgICAg
ICB8ICAyNCArKysrKysrCiB0b29scy9saWJ4bC9saWJ4bF9jcmVhdGUuYyAgIHwgMTY4ICsrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0KIHRvb2xzL2xpYnhsL2xpYnhs
X2RtLmMgICAgICAgfCAgIDcgKy0KIHRvb2xzL2xpYnhsL2xpYnhsX2RvbS5jICAgICAgfCAgIDcg
Ky0KIHRvb2xzL2xpYnhsL2xpYnhsX2ludGVybmFsLmggfCAgMTMgKysrLQogdG9vbHMvbGlieGwv
bGlieGxfbWVtLmMgICAgICB8ICA2OSArKysrKysrKysrKysrKy0tLS0KIHRvb2xzL2xpYnhsL2xp
YnhsX3R5cGVzLmlkbCAgfCAgIDcgKy0KIHRvb2xzL2xpYnhsL2xpYnhsX3V0aWxzLmMgICAgfCAg
MTUgLS0tLQogdG9vbHMvbGlieGwvbGlieGxfdXRpbHMuaCAgICB8ICAgMiArLQogdG9vbHMvbGli
eGwvbGlieGxfeDg2LmMgICAgICB8ICA0MSArKysrKysrKysrKwogdG9vbHMveGwveGxfcGFyc2Uu
YyAgICAgICAgICB8ICA4MiArKy0tLS0tLS0tLS0tLS0tLS0tLS0KIHRvb2xzL3hsL3hsX3ZtY29u
dHJvbC5jICAgICAgfCAgIDYgKy0KIDE1IGZpbGVzIGNoYW5nZWQsIDMyMSBpbnNlcnRpb25zKCsp
LCAxNTYgZGVsZXRpb25zKC0pCgotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
