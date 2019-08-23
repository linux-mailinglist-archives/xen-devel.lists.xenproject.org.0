Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 922179ACF8
	for <lists+xen-devel@lfdr.de>; Fri, 23 Aug 2019 12:18:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i16bh-0004LN-9d; Fri, 23 Aug 2019 10:15:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=N7YS=WT=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1i16bg-0004LC-5D
 for xen-devel@lists.xenproject.org; Fri, 23 Aug 2019 10:15:44 +0000
X-Inumbo-ID: f5d7b4c2-c58e-11e9-ade4-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f5d7b4c2-c58e-11e9-ade4-12813bfff9fa;
 Fri, 23 Aug 2019 10:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1566555343;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=X1XvM8CMt3Oe1WMwqnuj+nuos2M8xn2yAGimqZ6nzIE=;
 b=gRGNoskI4kUyNpDFS1k46JSHrXmv2qB8b1MYFsAmRWBmA9kI8QdvB6s1
 f2f1L4RmwJzPBd/ENxceYfG4jefYZECFEx/B0A+ZroWIJotqIp4H47yDc
 v4DqkNjZBbtHkPm/nFxjlQuyGFzQsN9P31D0+B/sXBIdVaIhFBzAjZixY o=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: NWMLEnhoWu1IGDRVUxUzlhnxVQXUUvE0LXTYSHLVN2dfjQGP8cAZrA8Z/TMkiFe9+qvAxxwuDh
 GVBZJchi8a1f/hL98sIzSu853Sn8XzdzuO+Q+dHVIlYqFXrXM8uqSncWNxJ1I4NmjUnmoV/u9c
 uY52GiGvycKH6fQkM/Lc6Xyp9sWRhAdt+h9fXfZLvjhEPzRLSyOROMkqNyi4eOxSyB9FYTRerc
 mWY5ZsTjqOJmSqfgV0bF50b2xglWligVaJIvxN6BQku8+Kl3b5MkCapEV27paO5z3ASXl6q28f
 VKk=
X-SBRS: 2.7
X-MesageID: 4640483
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,420,1559534400"; 
   d="scan'208";a="4640483"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <qemu-devel@nongnu.org>
Date: Fri, 23 Aug 2019 11:15:33 +0100
Message-ID: <20190823101534.465-2-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190823101534.465-1-anthony.perard@citrix.com>
References: <20190823101534.465-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 1/2] xen-bus: Fix backend state transition on
 device reset
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
Cc: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>, qemu-stable@nongnu.org,
 Paul Durrant <paul.durrant@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2hlbiBhIGZyb250ZW5kIHdhbnRzIHRvIHJlc2V0IGl0cyBzdGF0ZSBhbmQgdGhlIGJhY2tlbmQg
b25lLCBpdApzdGFydHMgd2l0aCBzZXR0aW5nICJDbG9zaW5nIiwgdGhlbiB3YWl0cyBmb3IgdGhl
IGJhY2tlbmQgKFFFTVUpIHRvIGRvCnRoZSBzYW1lLgoKQnV0IHdoZW4gUUVNVSBpcyBzZXR0aW5n
ICJDbG9zaW5nIiB0byBpdHMgc3RhdGUsIGl0IHRyaWdnZXJzIGFuIGV2ZW50Cih4ZW5zdG9yZSB3
YXRjaCkgdGhhdCByZS1leGVjdXRlIHhlbl9kZXZpY2VfYmFja2VuZF9jaGFuZ2VkKCkgYW5kIHNl
dAp0aGUgYmFja2VuZCBzdGF0ZSB0byAiQ2xvc2VkIi4gUUVNVSBzaG91bGQgd2FpdCBmb3IgdGhl
IGZyb250ZW5kIHRvCnNldCAiQ2xvc2VkIiBiZWZvcmUgZG9pbmcgdGhlIHNhbWUuCgpCZWZvcmUg
c2V0dGluZyAiQ2xvc2VkIiB0byB0aGUgYmFja2VuZF9zdGF0ZSwgd2UgYXJlIGFsc28gZ29pbmcg
dG8KY2hlY2sgaWYgdGhlcmUgaXMgYSBmcm9udGVuZC4gSWYgdGhhdCB0aGUgY2FzZSwgd2hlbiB0
aGUgYmFja2VuZCBzdGF0ZQppcyBzZXQgdG8gIkNsb3NpbmciIHRoZSBmcm9udGVuZCBzaG91bGQg
cmVhY3QgYW5kIHNldHMgaXRzIHN0YXRlIHRvCiJDbG9zaW5nIiB0aGVuICJDbG9zZWQiLiBUaGUg
YmFja2VuZCBzaG91bGQgd2FpdCBmb3IgdGhhdCB0byBoYXBwZW4uCgpGaXhlczogYjZhZjg5MjZm
Yjg1OGM0ZjE0MjZlNWFjYjJjZmMxZjA1ODBlYzk4YQpTaWduZWQtb2ZmLWJ5OiBBbnRob255IFBF
UkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4KLS0tCkNjOiBxZW11LXN0YWJsZUBub25n
bnUub3JnCi0tLQoKTm90ZXM6CiAgICB2MjoKICAgIC0gdXNlIGEgaGVscGVyCiAgICAtIEFkZCBJ
bml0V2FpdCBhbmQgSW5pdGlhbGlzZWQgdG8gdGhlIGxpc3Qgb2YgYWN0aXZlIHN0YXRlCgogaHcv
eGVuL3hlbi1idXMuYyB8IDIzICsrKysrKysrKysrKysrKysrKysrLS0tCiAxIGZpbGUgY2hhbmdl
ZCwgMjAgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9ody94ZW4v
eGVuLWJ1cy5jIGIvaHcveGVuL3hlbi1idXMuYwppbmRleCBlNDA1MDAyNDJkLi42MmMxMjdiOTI2
IDEwMDY0NAotLS0gYS9ody94ZW4veGVuLWJ1cy5jCisrKyBiL2h3L3hlbi94ZW4tYnVzLmMKQEAg
LTUxNiw2ICs1MTYsMjMgQEAgc3RhdGljIHZvaWQgeGVuX2RldmljZV9iYWNrZW5kX3NldF9vbmxp
bmUoWGVuRGV2aWNlICp4ZW5kZXYsIGJvb2wgb25saW5lKQogICAgIHhlbl9kZXZpY2VfYmFja2Vu
ZF9wcmludGYoeGVuZGV2LCAib25saW5lIiwgIiV1Iiwgb25saW5lKTsKIH0KIAorLyoKKyAqIFRl
bGwgZnJvbSB0aGUgc3RhdGUgd2hldGhlciB0aGUgZnJvbnRlbmQgaXMgbGlrZWx5IGFsaXZlLAor
ICogaS5lLiBpdCB3aWxsIHJlYWN0IHRvIGEgY2hhbmdlIG9mIHN0YXRlIG9mIHRoZSBiYWNrZW5k
LgorICovCitzdGF0aWMgYm9vbCB4ZW5fZGV2aWNlX3N0YXRlX2lzX2FjdGl2ZShlbnVtIHhlbmJ1
c19zdGF0ZSBzdGF0ZSkKK3sKKyAgICBzd2l0Y2ggKHN0YXRlKSB7CisgICAgY2FzZSBYZW5idXNT
dGF0ZUluaXRXYWl0OgorICAgIGNhc2UgWGVuYnVzU3RhdGVJbml0aWFsaXNlZDoKKyAgICBjYXNl
IFhlbmJ1c1N0YXRlQ29ubmVjdGVkOgorICAgIGNhc2UgWGVuYnVzU3RhdGVDbG9zaW5nOgorICAg
ICAgICByZXR1cm4gdHJ1ZTsKKyAgICBkZWZhdWx0OgorICAgICAgICByZXR1cm4gZmFsc2U7Cisg
ICAgfQorfQorCiBzdGF0aWMgdm9pZCB4ZW5fZGV2aWNlX2JhY2tlbmRfY2hhbmdlZCh2b2lkICpv
cGFxdWUpCiB7CiAgICAgWGVuRGV2aWNlICp4ZW5kZXYgPSBvcGFxdWU7CkBAIC01MzksMTEgKzU1
NiwxMSBAQCBzdGF0aWMgdm9pZCB4ZW5fZGV2aWNlX2JhY2tlbmRfY2hhbmdlZCh2b2lkICpvcGFx
dWUpCiAKICAgICAvKgogICAgICAqIElmIHRoZSB0b29sc3RhY2sgKG9yIHVucGx1ZyByZXF1ZXN0
IGNhbGxiYWNrKSBoYXMgc2V0IHRoZSBiYWNrZW5kCi0gICAgICogc3RhdGUgdG8gQ2xvc2luZywg
YnV0IHRoZXJlIGlzIG5vIGFjdGl2ZSBmcm9udGVuZCAoaS5lLiB0aGUKLSAgICAgKiBzdGF0ZSBp
cyBub3QgQ29ubmVjdGVkKSB0aGVuIHNldCB0aGUgYmFja2VuZCBzdGF0ZSB0byBDbG9zZWQuCisg
ICAgICogc3RhdGUgdG8gQ2xvc2luZywgYnV0IHRoZXJlIGlzIG5vIGFjdGl2ZSBmcm9udGVuZCB0
aGVuIHNldCB0aGUKKyAgICAgKiBiYWNrZW5kIHN0YXRlIHRvIENsb3NlZC4KICAgICAgKi8KICAg
ICBpZiAoeGVuZGV2LT5iYWNrZW5kX3N0YXRlID09IFhlbmJ1c1N0YXRlQ2xvc2luZyAmJgotICAg
ICAgICB4ZW5kZXYtPmZyb250ZW5kX3N0YXRlICE9IFhlbmJ1c1N0YXRlQ29ubmVjdGVkKSB7Cisg
ICAgICAgICF4ZW5fZGV2aWNlX3N0YXRlX2lzX2FjdGl2ZShzdGF0ZSkpIHsKICAgICAgICAgeGVu
X2RldmljZV9iYWNrZW5kX3NldF9zdGF0ZSh4ZW5kZXYsIFhlbmJ1c1N0YXRlQ2xvc2VkKTsKICAg
ICB9CiAKLS0gCkFudGhvbnkgUEVSQVJECgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
