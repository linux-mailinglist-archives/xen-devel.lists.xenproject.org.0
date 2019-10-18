Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF478DC825
	for <lists+xen-devel@lfdr.de>; Fri, 18 Oct 2019 17:10:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iLTqG-00050X-GU; Fri, 18 Oct 2019 15:07:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/MKZ=YL=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iLTqF-00050R-OP
 for xen-devel@lists.xenproject.org; Fri, 18 Oct 2019 15:06:59 +0000
X-Inumbo-ID: ee20b8d4-f1b8-11e9-beca-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ee20b8d4-f1b8-11e9-beca-bc764e2007e4;
 Fri, 18 Oct 2019 15:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1571411218;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=wzOTt/41kodjjC+nFbmYFgCYo0D7gsNB7ll8l2QCDYg=;
 b=g4HRxO5Dxw5D8i+U9EuXlggyvxWMTtFjQC9j4XiRFwVbrvQGayAn93DI
 IRP7HwpPUKtzyvTwQjqA37ZgSYEyv8tYBk1dDKoDF7eElmYImQJ1Fp5BK
 O7aNU+eJBu67d7Y5RhL5EovEBSg89L9CQkuWcmqy38jRqbheLDzoOcXxD U=;
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
IronPort-SDR: tFIVp52ictwMw31eqr+gOimxAeXl/WkaY8t1Uk/B5ZKlZxGp3lPvKGUhZJQuXYcE1VA1UNQzeG
 VGryXDHkVMyDgPh+BE5StbKHDgbHH4OBu01/naCMalxLTbbAXgscDbZHIP89MemqPJXXtkWIiT
 YnWqp+F7M4M876eQbh5tYEoa88jmMfIxF7L28rUAziYEO7VwIsbWdBF8ZQOOE0eA33UWqPMvk9
 uRjvJvDbhaf0Vr6WHy2N/iZI/gLPQdjUPAmhNJ9jqUXry7FwG37S5rFuzuwR4s+u5f3O38Da8a
 wBQ=
X-SBRS: 2.7
X-MesageID: 7434352
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,312,1566878400"; 
   d="scan'208";a="7434352"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 18 Oct 2019 16:06:43 +0100
Message-ID: <20191018150653.24862-1-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [XEN PATCH for-4.13 v5 00/10] libxl memkb & pt
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

SSBzdGlsbCB3YW50IHRvIHNvcnQgb3V0IHRoZSBzaGFkb3cvaW9tbXUgbWVtb3J5IGFuZCBwY2kg
cGFzc3Rocm91Z2gKc2l0dWF0aW9uIGluIDQuMTMsIHRvIGF2b2lkIHByb211bGdhdGluZyBhIHdy
b25nIGxpYnhsIEFQSSBpbiBhIHN0YWJsZQpyZWxlYXNlLgoKVGhlIG9ubHkgY2hhbmdlIHNpbmNl
IHY0IGlzIHRvIGNoYW5nZSB0aGUgZGVmYXVsdCB2YWx1ZSBuYW1lIGZvciB0aGUKInBhc3N0aHJv
dWdoIiBjb25maWcgc2V0dGluZyB0byAiZGVmYXVsdCIsIGFwcm9wb3Mgb2YgdGhlIGRpc2N1c3Np
b24uClRoYXQgaXMgYWxzbyB0aGUgb25seSBwYXRjaCB3aXRob3V0IGFuIGFwcHJvcHJpYXRlIGFj
ay9yZXZpZXcuCgpUaGlzIGlzIGFsc28gYXZhaWxhYmxlIGhlcmU6CiAgIGh0dHBzOi8veGVuYml0
cy54ZW4ub3JnL2dpdHdlYi8/cD1wZW9wbGUvaXdqL3hlbi5naXQ7YT1zdW1tYXJ5CiAgIHdpcC5s
aWJ4bC1tZW1rYi1wdGNmZy52NQoKSWFuIEphY2tzb24gKDEwKToKICBhICAwMSBsaWJ4bDogT2Zm
ZXIgQVBJIHZlcnNpb25zIDB4MDQwNzAwIGFuZCAweDA0MDgwMAogIHIgIDAyIHhsOiBQYXNzIGxp
YnhsX2RvbWFpbl9jb25maWcgdG8gZnJlZW1lbSgpLCBpbnN0ZWFkIG9mIGJfaW5mbwogIHIgIDAz
IGxpYnhsOiBsaWJ4bF9fZG9tYWluX2NvbmZpZ19zZXRkZWZhdWx0OiBOZXcgZnVuY3Rpb24KICBy
ICAwNCBsaWJ4bDogbGlieGxfZG9tYWluX25lZWRfbWVtb3J5OiBNYWtlIGl0IHRha2UgYSBkb21h
aW5fY29uZmlnCiAgciAgMDUgbGlieGw6IE1vdmUgc2hhZG93X21lbWtiIGFuZCBpb21tdV9tZW1r
YiBkZWZhdWx0aW5nIGludG8gbGlieGwKICBhICAwNiBsaWJ4bDogUmVtb3ZlL2RlcHJlY2F0ZSBs
aWJ4bF9nZXRfcmVxdWlyZWRfKl9tZW1vcnkgZnJvbSB0aGUgQVBJCiAgYSAgMDcgbGlieGw6IGNy
ZWF0ZTogc2V0ZGVmYXVsdDogTWFrZSBsaWJ4bF9waHlzaW5mbyBpbmZvWzFdCiAgYSAgMDggbGli
eGw6IGNyZWF0ZTogc2V0ZGVmYXVsdDogTW92ZSBwaHlzaW5mbyBpbnRvIGNvbmZpZ19zZXRkZWZh
dWx0CiAgYSAgMDkgbGlieGw6IE1vdmUgZG9tYWluX2NyZWF0ZV9pbmZvX3NldGRlZmF1bHQgZWFy
bGllcgogICAqIDEwIGxpYnhsL3hsOiBPdmVyaGF1bCBwYXNzdGhyb3VnaCBzZXR0aW5nIGxvZ2lj
CgphPWFja2VkOyByPXJldmlld2VkOyAqPXBhdGNoIGNoYW5nZWQKCiBkb2NzL21hbi94bC5jZmcu
NS5wb2QuaW4gICAgIHwgICA2ICsrCiB0b29scy9saWJ4bC9saWJ4bC5oICAgICAgICAgIHwgIDI0
ICsrKysrLQogdG9vbHMvbGlieGwvbGlieGxfYXJjaC5oICAgICB8ICAgNiArKwogdG9vbHMvbGli
eGwvbGlieGxfYXJtLmMgICAgICB8ICAyNCArKysrKysKIHRvb2xzL2xpYnhsL2xpYnhsX2NyZWF0
ZS5jICAgfCAxNzIgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLQog
dG9vbHMvbGlieGwvbGlieGxfZG0uYyAgICAgICB8ICAgNyArLQogdG9vbHMvbGlieGwvbGlieGxf
ZG9tLmMgICAgICB8ICAgNyArLQogdG9vbHMvbGlieGwvbGlieGxfaW50ZXJuYWwuaCB8ICAxMyAr
KystCiB0b29scy9saWJ4bC9saWJ4bF9tZW0uYyAgICAgIHwgIDY5ICsrKysrKysrKysrKystLS0t
CiB0b29scy9saWJ4bC9saWJ4bF90eXBlcy5pZGwgIHwgICA3ICstCiB0b29scy9saWJ4bC9saWJ4
bF91dGlscy5jICAgIHwgIDE1IC0tLS0KIHRvb2xzL2xpYnhsL2xpYnhsX3V0aWxzLmggICAgfCAg
IDIgKy0KIHRvb2xzL2xpYnhsL2xpYnhsX3g4Ni5jICAgICAgfCAgNDEgKysrKysrKysrKysKIHRv
b2xzL3hsL3hsX3BhcnNlLmMgICAgICAgICAgfCAgODIgKystLS0tLS0tLS0tLS0tLS0tLS0tCiB0
b29scy94bC94bF92bWNvbnRyb2wuYyAgICAgIHwgICA2ICstCiAxNSBmaWxlcyBjaGFuZ2VkLCAz
MjUgaW5zZXJ0aW9ucygrKSwgMTU2IGRlbGV0aW9ucygtKQoKLS0gCjIuMTEuMAoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
