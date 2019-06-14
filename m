Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 473A745B5F
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jun 2019 13:27:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hbkKG-0007RH-Qb; Fri, 14 Jun 2019 11:24:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Y8Mf=UN=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hbkKE-0007Qt-HT
 for xen-devel@lists.xenproject.org; Fri, 14 Jun 2019 11:24:54 +0000
X-Inumbo-ID: 06c96f32-8e97-11e9-ae50-7b47ac2747f6
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 06c96f32-8e97-11e9-ae50-7b47ac2747f6;
 Fri, 14 Jun 2019 11:24:51 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: GdyRQy5Cw6PNBe1MQRQOGxUvk1yu8teMECm/mqv3/nbPkV1L4Rg+Us2wvCWy/i0su6Vh2Ydlik
 xgw2/9RsOnVtbVvdrJ5D+ylJKXIssR24gkSvp1Z8yjceLEjgYzar135IvIx6/pMgEx3m7kvyMJ
 J+JMYgukn4eLVeQ13lB2WHbNRJsjtUhHm0lcKVUtPa9mk9S12jVTbYFEhFwm3m6GE3Hg6n19qO
 Vrvel0+7WCeDR4ciAKX/cz9mFKF8hX5rFGjMqNdJjc23hUjIPBMS/k6WiCideMziA+WQ7bGLTH
 yzQ=
X-SBRS: 2.7
X-MesageID: 1737463
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,373,1557201600"; 
   d="scan'208";a="1737463"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 14 Jun 2019 12:24:32 +0100
Message-ID: <20190614112444.29980-4-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190614112444.29980-1-anthony.perard@citrix.com>
References: <20190614112444.29980-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 03/15] libxl_pci: Make libxl__create_pci_backend
 static
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
Cc: Anthony
 PERARD <anthony.perard@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

bGlieGxfX2NyZWF0ZV9wY2lfYmFja2VuZCBpc24ndCBjYWxsZWQgZnJvbSBvdXRzaWRlIG9mIGxp
YnhsX3BjaQphbnltb3JlLCBhbmQgaXQncyBvbmx5IHVzZWZ1bCBhcyBwYXJ0IG9mIHRoZSBwY2lf
YWRkIHByb2Nlc3MsIHNvCnJlbW92ZSB0aGUgcHJvdG90eXBlIGZyb20gbGlieGxfaW50ZXJuYWwu
aC4KCk5vIGZ1bmN0aW9uYWwgY2hhbmdlcy4KClNpZ25lZC1vZmYtYnk6IEFudGhvbnkgUEVSQVJE
IDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPgotLS0KIHRvb2xzL2xpYnhsL2xpYnhsX2ludGVy
bmFsLmggfCAyIC0tCiB0b29scy9saWJ4bC9saWJ4bF9wY2kuYyAgICAgIHwgNCArKy0tCiAyIGZp
bGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS90b29scy9saWJ4bC9saWJ4bF9pbnRlcm5hbC5oIGIvdG9vbHMvbGlieGwvbGlieGxfaW50ZXJu
YWwuaAppbmRleCBhMjViYWNkN2FhLi4wMTQxMTM4MmZkIDEwMDY0NAotLS0gYS90b29scy9saWJ4
bC9saWJ4bF9pbnRlcm5hbC5oCisrKyBiL3Rvb2xzL2xpYnhsL2xpYnhsX2ludGVybmFsLmgKQEAg
LTE1NDEsOCArMTU0MSw2IEBAIF9oaWRkZW4gaW50IGxpYnhsX19wY2lfdG9wb2xvZ3lfaW5pdChs
aWJ4bF9fZ2MgKmdjLAogLyogZnJvbSBsaWJ4bF9wY2kgKi8KIAogX2hpZGRlbiBpbnQgbGlieGxf
X2RldmljZV9wY2lfYWRkKGxpYnhsX19nYyAqZ2MsIHVpbnQzMl90IGRvbWlkLCBsaWJ4bF9kZXZp
Y2VfcGNpICpwY2lkZXYsIGludCBzdGFydGluZyk7Ci1faGlkZGVuIGludCBsaWJ4bF9fY3JlYXRl
X3BjaV9iYWNrZW5kKGxpYnhsX19nYyAqZ2MsIHVpbnQzMl90IGRvbWlkLAotICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBsaWJ4bF9kZXZpY2VfcGNpICpwY2lkZXYsIGludCBu
dW0pOwogX2hpZGRlbiBpbnQgbGlieGxfX2RldmljZV9wY2lfZGVzdHJveV9hbGwobGlieGxfX2dj
ICpnYywgdWludDMyX3QgZG9taWQpOwogX2hpZGRlbiBib29sIGxpYnhsX19pc19pZ2RfdmdhX3Bh
c3N0aHJ1KGxpYnhsX19nYyAqZ2MsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgY29uc3QgbGlieGxfZG9tYWluX2NvbmZpZyAqZF9jb25maWcpOwpkaWZmIC0tZ2l0IGEv
dG9vbHMvbGlieGwvbGlieGxfcGNpLmMgYi90b29scy9saWJ4bC9saWJ4bF9wY2kuYwppbmRleCA2
NzY3N2Q3YjU1Li4wZTA3ZjcwZjI5IDEwMDY0NAotLS0gYS90b29scy9saWJ4bC9saWJ4bF9wY2ku
YworKysgYi90b29scy9saWJ4bC9saWJ4bF9wY2kuYwpAQCAtNzUsOCArNzUsOCBAQCBzdGF0aWMg
dm9pZCBsaWJ4bF9fZGV2aWNlX2Zyb21fcGNpZGV2KGxpYnhsX19nYyAqZ2MsIHVpbnQzMl90IGRv
bWlkLAogICAgIGRldmljZS0+a2luZCA9IExJQlhMX19ERVZJQ0VfS0lORF9QQ0k7CiB9CiAKLWlu
dCBsaWJ4bF9fY3JlYXRlX3BjaV9iYWNrZW5kKGxpYnhsX19nYyAqZ2MsIHVpbnQzMl90IGRvbWlk
LAotICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbGlieGxfZGV2aWNlX3BjaSAqcGNpZGV2
LCBpbnQgbnVtKQorc3RhdGljIGludCBsaWJ4bF9fY3JlYXRlX3BjaV9iYWNrZW5kKGxpYnhsX19n
YyAqZ2MsIHVpbnQzMl90IGRvbWlkLAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGxpYnhsX2RldmljZV9wY2kgKnBjaWRldiwgaW50IG51bSkKIHsKICAgICBmbGV4YXJyYXlf
dCAqZnJvbnQgPSBOVUxMOwogICAgIGZsZXhhcnJheV90ICpiYWNrID0gTlVMTDsKLS0gCkFudGhv
bnkgUEVSQVJECgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
