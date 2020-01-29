Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC3A814CA9A
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jan 2020 13:15:18 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwmD4-0007nX-4v; Wed, 29 Jan 2020 12:12:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wV5r=3S=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1iwmD1-0007nI-PQ
 for xen-devel@lists.xenproject.org; Wed, 29 Jan 2020 12:12:39 +0000
X-Inumbo-ID: a3fd9ee2-4290-11ea-a933-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a3fd9ee2-4290-11ea-a933-bc764e2007e4;
 Wed, 29 Jan 2020 12:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580299960;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5A+XmPCalbcBox+WyAsEdCt6PwP9Kaft4Xz46mpZQ3s=;
 b=FlPu+noOjulSbDPWtOjG6Jhvr4Jf4g9CmT6gTJB/W0kLKofuPzdgUFUV
 4fYyDs8jdpIMScqWBg5KKSD8VwCNX/aTwHZ8KB7R/u+KEASVm1wbmgvYl
 p9Tx9XwXAimVWdYxkpFFUbcQ+ia9Zm/Uq/786AXcaf+k1VMNjIGM5mcNa Q=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: FOmBeKztIZ10kCjGV8zrjiwChUk6FOYkd8pxYolMEiyoSyYsRNc/c5gO8dKS8miZPFWiA7wYZO
 1mFKrwXfyivbplbJFq7FnV9k2uI9BUSSdzAU5Y7xrzjCujdDIMpFgk/sTW+tZsKI+a6H0zr8Ih
 ji1Vn+S8E5QCrbyKfrQDGFThbNrIyQ25cXK7QQi/59iDNb/kSxXij0fITF5jI+NezqEinrJHrc
 OiLRDTM+B0b774vm26ZgdxZMUXgH//UPaTGmxn30JWoH2j64eSDIqkOHZ9l3645TcA92qwZjFb
 ypY=
X-SBRS: 2.7
X-MesageID: 11606515
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,377,1574139600"; d="scan'208";a="11606515"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <devel@edk2.groups.io>
Date: Wed, 29 Jan 2020 12:12:31 +0000
Message-ID: <20200129121235.1814563-2-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200129121235.1814563-1-anthony.perard@citrix.com>
References: <20200129121235.1814563-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 1/5] OvmfPkg/XenResetVector: Silent a warning
 from nasm
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
Cc: Julien Grall <julien@xen.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Jordan Justen <jordan.l.justen@intel.com>, Liming
 Gao <liming.gao@intel.com>, Anthony Perard <anthony.perard@citrix.com>,
 Michael D Kinney <michael.d.kinney@intel.com>, xen-devel@lists.xenproject.org,
 Laszlo Ersek <lersek@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VG8gYXZvaWQgbmFzbSBnZW5lcmF0aW5nIGEgd2FybmluZywgcmVwbGFjZSB0aGUgbWFjcm8gYnkg
dGhlIHZhbHVlCmV4cGVjdGVkIHRvIGJlIHN0b3JlZCBpbiBlYXguCiAgSWEzMi9YZW5QVkhNYWlu
LmFzbTo3Njogd2FybmluZzogZHdvcmQgZGF0YSBleGNlZWRzIGJvdW5kcwoKUmVwb3J0ZWQtYnk6
IExhc3psbyBFcnNlayA8bGVyc2VrQHJlZGhhdC5jb20+ClNpZ25lZC1vZmYtYnk6IEFudGhvbnkg
UEVSQVJEIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPgotLS0KIE92bWZQa2cvWGVuUmVzZXRW
ZWN0b3IvSWEzMi9YZW5QVkhNYWluLmFzbSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL092bWZQa2cvWGVuUmVzZXRWZWN0
b3IvSWEzMi9YZW5QVkhNYWluLmFzbSBiL092bWZQa2cvWGVuUmVzZXRWZWN0b3IvSWEzMi9YZW5Q
VkhNYWluLmFzbQppbmRleCAyZGYwZjEyZTE4Y2IuLmM3NjFlOWQzMDcyOSAxMDA2NDQKLS0tIGEv
T3ZtZlBrZy9YZW5SZXNldFZlY3Rvci9JYTMyL1hlblBWSE1haW4uYXNtCisrKyBiL092bWZQa2cv
WGVuUmVzZXRWZWN0b3IvSWEzMi9YZW5QVkhNYWluLmFzbQpAQCAtNzMsNyArNzMsNyBAQCB4ZW5Q
VkhNYWluOgogICAgIDsNCiAgICAgOyBwYXJhbWV0ZXIgZm9yIEZsYXQzMlNlYXJjaEZvckJmdkJh
c2UNCiAgICAgOw0KLSAgICBtb3YgICAgIGVheCwgQUREUl9PRihmb3VyR2lnYWJ5dGVzKQ0KKyAg
ICBtb3YgICAgIGVheCwgMCAgIDsgQUREUl9PRihmb3VyR2lnYWJ5dGVzKQ0KICAgICBhZGQgICAg
IGVheCwgZWR4IDsgYWRkIGRlbHRhDQogDQogICAgIDsNCi0tIApBbnRob255IFBFUkFSRAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
