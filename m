Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B56A7901D
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2019 18:00:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hs82N-0002us-NU; Mon, 29 Jul 2019 15:58:11 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Q6P6=V2=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hs82L-0002tC-Bn
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2019 15:58:09 +0000
X-Inumbo-ID: a852fe7e-b219-11e9-8980-bc764e045a96
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id a852fe7e-b219-11e9-8980-bc764e045a96;
 Mon, 29 Jul 2019 15:58:08 +0000 (UTC)
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
IronPort-SDR: kn7KdF7qyQZxc3NTFVbIXFNmLegg0x7rnlI6vAhvdU+xKpLAXs5BUVLPpfLr3YgPMS2Yg5Xmgp
 N2TTPEgPAdfbKCHjwiUYe5dC1nS/3fQxPCjuDYX7FE9A8tss79LxluTrimEvlIh9VJIsRrmR4J
 zd2Yz5B14qtpgXHxeJ3dZlO+LYt+kfwrt+SY0xZEKC6OELf1ASemNZzECD9JcT9jKh5Cn6e8c3
 ffelZjdhiW3ABhFUmnoaUrn+VJkCJgFXVgx2m+REFrjhqN8t8rx2ZIySJuNkYj4w8QAwbY3/WK
 j4w=
X-SBRS: 2.7
X-MesageID: 3579636
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,323,1559534400"; 
   d="scan'208";a="3579636"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <devel@edk2.groups.io>
Date: Mon, 29 Jul 2019 16:39:34 +0100
Message-ID: <20190729153944.24239-26-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190729153944.24239-1-anthony.perard@citrix.com>
References: <20190729153944.24239-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v4 25/35] OvmfPkg/XenPlatformPei: Ignore missing
 PCI Host Bridge on Xen PVH
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

V2hlbiB0aGUgZGV2aWNlIElEIG9mIHRoZSBob3N0IGJyaWRnZSBpcyB1bmtub3duLCBjaGVjayBp
ZiB3ZSBhcmUKcnVubmluZyBhcyBhIFBWSCBndWVzdCBhcyB0aGVyZSBpcyBubyBQQ0kgYnVzIGlu
IHRoYXQgY2FzZS4KClJlZjogaHR0cHM6Ly9idWd6aWxsYS50aWFub2NvcmUub3JnL3Nob3dfYnVn
LmNnaT9pZD0xNjg5ClNpZ25lZC1vZmYtYnk6IEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFy
ZEBjaXRyaXguY29tPgpBY2tlZC1ieTogTGFzemxvIEVyc2VrIDxsZXJzZWtAcmVkaGF0LmNvbT4K
LS0tCgpOb3RlczoKICAgIHYzOgogICAgLSBSZW1vdmUgdXNlIG9mIFhFTl9QVkhfUENJX0hPU1Rf
QlJJREdFX0RFVklDRV9JRCwgYW5kIHNpbXBseSBkb24ndCBzZXQKICAgICAgUGNkT3ZtZkhvc3RC
cmlkZ2VQY2lEZXZJZC4KICAgIAogICAgdjI6CiAgICAtIFVzZSBuZXcgWEVOX1BWSF9QQ0lfSE9T
VF9CUklER0VfREVWSUNFX0lEIG1hY3JvCgogT3ZtZlBrZy9YZW5QbGF0Zm9ybVBlaS9QbGF0Zm9y
bS5jIHwgNiArKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKykKCmRpZmYgLS1n
aXQgYS9Pdm1mUGtnL1hlblBsYXRmb3JtUGVpL1BsYXRmb3JtLmMgYi9Pdm1mUGtnL1hlblBsYXRm
b3JtUGVpL1BsYXRmb3JtLmMKaW5kZXggMmY0MmNhNmNjZC4uNzE3ZmQwYWIxYSAxMDA2NDQKLS0t
IGEvT3ZtZlBrZy9YZW5QbGF0Zm9ybVBlaS9QbGF0Zm9ybS5jCisrKyBiL092bWZQa2cvWGVuUGxh
dGZvcm1QZWkvUGxhdGZvcm0uYwpAQCAtMjgzLDYgKzI4MywxMiBAQCBNaXNjSW5pdGlhbGl6YXRp
b24gKAogICAgICAgQWNwaUVuQml0ICA9IElDSDlfQUNQSV9DTlRMX0FDUElfRU47DQogICAgICAg
YnJlYWs7DQogICAgIGRlZmF1bHQ6DQorICAgICAgaWYgKFhlblB2aERldGVjdGVkICgpKSB7DQor
ICAgICAgICAvLw0KKyAgICAgICAgLy8gVGhlcmUgaXMgbm8gUENJIGJ1cyBpbiB0aGlzIGNhc2UN
CisgICAgICAgIC8vDQorICAgICAgICByZXR1cm47DQorICAgICAgfQ0KICAgICAgIERFQlVHICgo
REVCVUdfRVJST1IsICIlYTogVW5rbm93biBIb3N0IEJyaWRnZSBEZXZpY2UgSUQ6IDB4JTA0eFxu
IiwNCiAgICAgICAgIF9fRlVOQ1RJT05fXywgbUhvc3RCcmlkZ2VEZXZJZCkpOw0KICAgICAgIEFT
U0VSVCAoRkFMU0UpOw0KLS0gCkFudGhvbnkgUEVSQVJECgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
