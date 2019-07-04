Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85A0F5FA7C
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jul 2019 17:01:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hj3CD-0006nQ-CK; Thu, 04 Jul 2019 14:58:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8gU+=VB=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hj3CB-0006kW-3u
 for xen-devel@lists.xenproject.org; Thu, 04 Jul 2019 14:58:47 +0000
X-Inumbo-ID: 37edd6d6-9e6c-11e9-8963-17ec8d166be3
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 37edd6d6-9e6c-11e9-8963-17ec8d166be3;
 Thu, 04 Jul 2019 14:58:44 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: +ufcpXGKuOIAhwBVN8n+e+XwE+Jc3R4gg+tfjB+Akr/LSvMyJV+SUz/zkSkwXs2H/r7DrlA4KL
 udQLflm8eNK2pNi8U1MBw+7CQ2QxZxWl72fdORtBXi6ETC0+QuYDHvpBaLONlOArKQBnPDjQyl
 89EHU2d/pf07AzMRVJ3REGzZ8KLQNPppvzloNYuR5C33Q98qmNMIHhCQHH4FRnNFAs/7AFHy4Y
 J3dSbEhXW27T9jFfRFpHUxq9MJWm944OZ024SRxfE953QSrKrd4qAoEhzUxAKscxGufZV6JkKd
 jbQ=
X-SBRS: 2.7
X-MesageID: 2623861
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,451,1557201600"; 
   d="scan'208";a="2623861"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <devel@edk2.groups.io>
Date: Thu, 4 Jul 2019 15:42:27 +0100
Message-ID: <20190704144233.27968-30-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190704144233.27968-1-anthony.perard@citrix.com>
References: <20190704144233.27968-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 29/35] OvmfPkg/PlatformBootManagerLib: Handle
 the absence of PCI bus on Xen PVH
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
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Jordan Justen <jordan.l.justen@intel.com>, Julien Grall <julien.grall@arm.com>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Laszlo Ersek <lersek@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2hlbiBydW5uaW5nIGluIGEgWGVuIFBWSCBndWVzdCwgdGhlcmUncyBub3RoaW5nIHRvIGRvIGlu
ClBjaUFjcGlJbml0aWFsaXphdGlvbigpIGJlY2F1c2UgdGhlcmUgaXNuJ3QgYW55IFBDSSBidXMu
IFdoZW4gdGhlIEhvc3QKQnJpZGdlIERJRCBpc24ndCByZWNvZ25pc2VkLCBzaW1wbHkgY29udGlu
dWUuIChUaGUgdmFsdWUgb2YKUGNkT3ZtZkhvc3RCcmlkZ2VQY2lEZXZJZCB3b3VsZCBiZSAwIGJl
Y2F1c2UgaXQgaXNuJ3Qgc2V0LikKClJlZjogaHR0cHM6Ly9idWd6aWxsYS50aWFub2NvcmUub3Jn
L3Nob3dfYnVnLmNnaT9pZD0xNjg5ClNpZ25lZC1vZmYtYnk6IEFudGhvbnkgUEVSQVJEIDxhbnRo
b255LnBlcmFyZEBjaXRyaXguY29tPgotLS0KCk5vdGVzOgogICAgdjM6CiAgICAtIEluc3RlYWQg
b2YgY2hlY2tpbmcgZm9yIGEgZmFsc2UgdmFsdWUsCiAgICAgIFhFTl9QVkhfUENJX0hPU1RfQlJJ
REdFX0RFVklDRV9JRCwgc2ltcGx5IGNoZWNrIGlmIHdlIGFyZSBydW5uaW5nIHhlbgogICAgICB3
aGVuIHRoZSBIb3N0QnJpZGdlIGRldmljZSBJRCBpc24ndCByZWNvZ25pc2VkLgoKIE92bWZQa2cv
TGlicmFyeS9QbGF0Zm9ybUJvb3RNYW5hZ2VyTGliL0Jkc1BsYXRmb3JtLmMgfCA2ICsrKysrKwog
MSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL092bWZQa2cvTGli
cmFyeS9QbGF0Zm9ybUJvb3RNYW5hZ2VyTGliL0Jkc1BsYXRmb3JtLmMgYi9Pdm1mUGtnL0xpYnJh
cnkvUGxhdGZvcm1Cb290TWFuYWdlckxpYi9CZHNQbGF0Zm9ybS5jCmluZGV4IGUzMjk2OWU2M2Uu
LjlhZTU5MDI5M2EgMTAwNjQ0Ci0tLSBhL092bWZQa2cvTGlicmFyeS9QbGF0Zm9ybUJvb3RNYW5h
Z2VyTGliL0Jkc1BsYXRmb3JtLmMKKysrIGIvT3ZtZlBrZy9MaWJyYXJ5L1BsYXRmb3JtQm9vdE1h
bmFnZXJMaWIvQmRzUGxhdGZvcm0uYwpAQCAtMTIwOSw2ICsxMjA5LDEyIEBAIFBjaUFjcGlJbml0
aWFsaXphdGlvbiAoCiAgICAgICBQY2lXcml0ZTggKFBDSV9MSUJfQUREUkVTUyAoMCwgMHgxZiwg
MCwgMHg2YiksIDB4MGIpOyAvLyBIDQogICAgICAgYnJlYWs7DQogICAgIGRlZmF1bHQ6DQorICAg
ICAgaWYgKFhlbkRldGVjdGVkICgpKSB7DQorICAgICAgICAvLw0KKyAgICAgICAgLy8gVGhlcmUg
aXMgbm8gUENJIGJ1cyBpbiB0aGlzIGNhc2UuDQorICAgICAgICAvLw0KKyAgICAgICAgcmV0dXJu
Ow0KKyAgICAgIH0NCiAgICAgICBERUJVRyAoKEVGSV9EX0VSUk9SLCAiJWE6IFVua25vd24gSG9z
dCBCcmlkZ2UgRGV2aWNlIElEOiAweCUwNHhcbiIsDQogICAgICAgICBfX0ZVTkNUSU9OX18sIG1I
b3N0QnJpZGdlRGV2SWQpKTsNCiAgICAgICBBU1NFUlQgKEZBTFNFKTsNCi0tIApBbnRob255IFBF
UkFSRAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
