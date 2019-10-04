Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EB8BCBEFD
	for <lists+xen-devel@lfdr.de>; Fri,  4 Oct 2019 17:20:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iGPKW-0001PI-Oq; Fri, 04 Oct 2019 15:17:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=lQ+Z=X5=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iGPKU-0001P8-V8
 for xen-devel@lists.xenproject.org; Fri, 04 Oct 2019 15:17:14 +0000
X-Inumbo-ID: 0af3f0f2-e6ba-11e9-80e3-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0af3f0f2-e6ba-11e9-80e3-bc764e2007e4;
 Fri, 04 Oct 2019 15:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1570202234;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=tgnhWcxM5ESolUiPhUo0onaX8pRurpQ/0UDGlHcz97M=;
 b=ddCwaOtpdqQCPDRwrd3G1ZoF3Iq6UNY+XqpRvQ3ub0VznpMatWM9CSWc
 RPuMNkbyVi+sMluiyJw7CzCMG16bz7Szw+g41HhrmPInDynMPVYfak4tG
 Yg6hqAwBt+5Fm2bsDaxdOUP0hjcgxgvqjvA4o+0oJ8XgwGKbX0Q72GpBb k=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: NJmLl3MY9tCNkx0kQSedV9PEvsjxEXG+mYLnIov6LhZhx9YfckmkqwcKJLrmfO74I/eJjPwMG1
 KWd1sMTNI0j441KdMOjO8zvbGtiSDdzEWTegu60mzL5lJQmrM3whz1/evxNSltZJdQiK6H9PRT
 6XjjVrT5GEHxO78+Z3114MEwB7SI8SrSQ0jmZ95ulKJyeENqZ0S1J2rhxm4SMwCU7bVEulk/J/
 T9RrKJCNmRTdFEgZm7UZE9yH9z93ZhYwqK+ejRgtYcUJflACT+vWhOJmjcTFC0B5oX5MHxCllb
 92E=
X-SBRS: 2.7
X-MesageID: 6480723
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,256,1566878400"; 
   d="scan'208";a="6480723"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 4 Oct 2019 16:17:01 +0100
Message-ID: <20191004151707.24844-1-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [XEN PATCH for-4.13 0/6] Drop/deprecate
 libxl_get_required_*_memory
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
 =?UTF-8?q?J=C3=BCrgen=20Gro=C3=9F?= <jgross@suse.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

bGlieGxfZ2V0X3JlcXVpcmVkX3NoYWRvd19tZW1vcnkgaGFzIGFsd2F5cyBiZWVuIGFub21hbG91
cy4gIGxpYnhsCm91Z2h0IHRvIGRlZmF1bHQgdGhlc2UgdGhpbmdzIGl0c2VsZi4gIFJlY2VudGx5
LCBhbm90aGVyIGFuYWxvZ291cwpzZXR0aW5nLCBpb21tdV9tZW1rYiwgd2FzIGludHJvZHVjZWQs
IGFsb25nIHdpdGggYW5vdGhlciBmdW5jdGlvbgphbG9uZyB0aGUgc2FtZSBsaW5lcy4KClRoaXMg
QVBJIGlzIG5vdCB2ZXJ5IGdvb2QuICBGaXhpbmcgaXQgd2FzIG5vdCBlbnRpcmVseSB0cml2aWFs
LgooVGhhbmtzIHRvIFBhdWwgZm9yIGV4cGxhaW5pbmcgc29tZSBvZiB0aGUgZGlmZmljdWx0aWVz
IGFuZCBBbnRob255CmZvciBpbi1wcmluY2lwbGUgcmV2aWV3IG9mIG15IHByb3Bvc2FsLikKCklh
biBKYWNrc29uICg2KToKICBsaWJ4bDogT2ZmZXIgQVBJIHZlcnNpb25zIDB4MDQwNzAwIGFuZCAw
eDA0MDgwMAogIHhsOiBQYXNzIGxpYnhsX2RvbWFpbl9jb25maWcgdG8gZnJlZW1lbSgpLCBpbnN0
ZWFkIG9mIGJfaW5mbwogIGxpYnhsOiBsaWJ4bF9fZG9tYWluX2NvbmZpZ19zZXRkZWZhdWx0OiBO
ZXcgZnVuY3Rpb24KICBsaWJ4bDogbGlieGxfZG9tYWluX25lZWRfbWVtb3J5OiBNYWtlIGl0IHRh
a2UgYSBkb21haW5fY29uZmlnCiAgbGlieGw6IE1vdmUgc2hhZG93X21lbWtiIGFuZCBpb21tdV9t
ZW1rYiBkZWZhdWx0aW5nIGludG8gbGlieGwKICBsaWJ4bDogUmVtb3ZlL2RlcHJlY2F0ZSBsaWJ4
bF9nZXRfcmVxdWlyZWRfKl9tZW1vcnkgZnJvbSB0aGUgQVBJCgogdG9vbHMvbGlieGwvbGlieGwu
aCAgICAgICAgICB8IDI0ICsrKysrKysrKystCiB0b29scy9saWJ4bC9saWJ4bF9jcmVhdGUuYyAg
IHwgOTUgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0KIHRvb2xz
L2xpYnhsL2xpYnhsX2RvbS5jICAgICAgfCAgNyArKy0tCiB0b29scy9saWJ4bC9saWJ4bF9pbnRl
cm5hbC5oIHwgMTAgKysrKysKIHRvb2xzL2xpYnhsL2xpYnhsX21lbS5jICAgICAgfCA3MCArKysr
KysrKysrKysrKysrKysrKysrKysrKy0tLS0tLQogdG9vbHMvbGlieGwvbGlieGxfdXRpbHMuYyAg
ICB8IDE1IC0tLS0tLS0KIHRvb2xzL2xpYnhsL2xpYnhsX3V0aWxzLmggICAgfCAgMiArLQogdG9v
bHMveGwveGxfcGFyc2UuYyAgICAgICAgICB8IDE1ICstLS0tLS0KIHRvb2xzL3hsL3hsX3ZtY29u
dHJvbC5jICAgICAgfCAgNiArLS0KIDkgZmlsZXMgY2hhbmdlZCwgMTgzIGluc2VydGlvbnMoKyks
IDYxIGRlbGV0aW9ucygtKQoKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
