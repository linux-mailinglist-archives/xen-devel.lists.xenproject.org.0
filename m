Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF814E1BB7
	for <lists+xen-devel@lfdr.de>; Wed, 23 Oct 2019 15:04:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNGFy-0006Ai-AC; Wed, 23 Oct 2019 13:00:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=l49O=YQ=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iNGFw-00069a-Vk
 for xen-devel@lists.xenproject.org; Wed, 23 Oct 2019 13:00:53 +0000
X-Inumbo-ID: 1471570c-f595-11e9-a531-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1471570c-f595-11e9-a531-bc764e2007e4;
 Wed, 23 Oct 2019 13:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1571835626;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=CGsCVvA9C5CHOtZ4CTQQ9jiw/fTOwqzG4idefXSC/GY=;
 b=au1rGKfHQBxGj6116AHfOJ+p0jrDGhR0Q8AI2+kvC8L2FYBXU3trDigv
 5z2fkCqJgfVagJF2BC9MlkJybnzuPKj3xhO08lGyXIedIMOKFX8caLe6n
 I6KqLjKAaCjkbPVVQeXLxXOMgJz7wTLEiwZ9EljYsfL1UWbYmeLBD7l+R k=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@eu.citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@eu.citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@eu.citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: YchAr3PRPOCa9veYsbc4nSzMt4PdAOGMZlx+gjGaeTbJAxRsHgnd7fUH9zHNCfcMfXdl3jV6sX
 CW+FBckJBBH++RabRS+0Sj/1fPK4m7Ho8uKoDWa/j2+66Gom1uk3CaQmd8mIp7yuJIBq6ygK2o
 m4ik2RRZ7BqqF6M0tc0JKOqtrzp20MvbUUNu2gmRiKSE07FIEnv58qLSorVVU8IJh3xHqHKSkV
 gdikwmOODk4jprZXpv5a3V9q0QqcGBZw90JIWI82THghbStn1UuZwbY5AmQPtCBk7Q/SFxvf0N
 NOo=
X-SBRS: 2.7
X-MesageID: 7411227
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,220,1569297600"; 
   d="scan'208";a="7411227"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 23 Oct 2019 14:00:08 +0100
Message-ID: <20191023130013.32382-7-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20191023130013.32382-1-ian.jackson@eu.citrix.com>
References: <20191023130013.32382-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [XEN PATCH for-4.13 v7 06/11] libxl: Remove/deprecate
 libxl_get_required_*_memory from the API
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

VGhlc2UgYXJlIG5vdyByZWR1bmRhbnQgYmVjYXVzZSBzaGFkb3dfbWVta2IgYW5kIGlvbW11X21l
bWtiIGFyZSBub3cKZGVmYXVsdGVkIGF1dG9tYXRpY2FsbHkgYnkgbGlieGxfZG9tYWluX25lZWRf
bWVtb3J5IGFuZApsaWJ4bF9kb21haW5fY3JlYXRlIGV0Yy4gIENhbGxlcnMgc2hvdWxkIG5vdCBu
b3cgY2FsbCB0aGVzZTsgaW5zdGVhZCwKdGhleSBzaG91bGQganVzdCBsZXQgbGlieGwgdGFrZSBj
YXJlIG9mIGl0LgoKbGlieGxfZ2V0X3JlcXVpcmVkX3NoYWRvd19tZW1vcnkgd2FzIGludHJvZHVj
ZWQgaW4gZjg5ZjU1NTgyN2E2CiAgInJlbW92ZSBsYXRlIChvbi1kZW1hbmQpIGNvbnN0cnVjdGlv
biBvZiBJT01NVSBwYWdlIHRhYmxlcyIKV2UgY2FuIGZyZWVseSByZW1vdmUgaXQgYmVjYXVzZSBp
dCB3YXMgbmV2ZXIgaW4gYW55IHJlbGVhc2UuCgpsaWJ4bF9nZXRfcmVxdWlyZWRfc2hhZG93X21l
bW9yeSBoYXMgYmVlbiBpbiBsaWJ4bCBhcHByb3hpbWF0ZWx5CmZvcmV2ZXIuICBJdCBzaG91bGQg
cHJvYmFibHkgbm90IGhhdmUgc3Vydml2ZWQgdGhlIGNyZWF0aW9uIG9mCmxpYnhsX2RvbWFpbl9j
cmVhdGUsIGJ1dCBpdCBzZWVtcyB0aGUgQVBJIGF3a3dhcmRuZXNzZXMgd2Ugc2VlIGluCnJlY2Vu
dCBjb21taXRzIHByZXZlbnRlZCB0aGlzLiAgU28gd2UgaGF2ZSB0byBrZWVwIGl0LiAgSXQgcmVt
YWlucwpmdW5jdGlvbmFsIGJ1dCB3ZSBjYW4gZGVwcmVjYXRlIGl0LiAgSG9wZWZ1bGx5IHdlIGNh
biBnZXQgcmlkIG9mIGl0CmNvbXBsZXRlbHkgYmVmb3JlIHdlIGZpbmQgdGhlIG5lZWQgdG8gY2hh
bmdlIHRoZSBjYWxjdWxhdGlvbiB0byB1c2UKYWRkaXRpb25hbCBpbmZvcm1hdGlvbiB3aGljaCBp
dHMgYXJndW1lbnRzIGRvIG5vdCBjdXJyZW50bHkgc3VwcGx5LgoKU2lnbmVkLW9mZi1ieTogSWFu
IEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+CkFja2VkLWJ5OiBBbnRob255IFBF
UkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4KLS0tCiB0b29scy9saWJ4bC9saWJ4bF9j
cmVhdGUuYyB8IDE3ICsrKysrKysrKysrKysrKystCiB0b29scy9saWJ4bC9saWJ4bF91dGlscy5j
ICB8IDE1IC0tLS0tLS0tLS0tLS0tLQogdG9vbHMvbGlieGwvbGlieGxfdXRpbHMuaCAgfCAgMiAr
LQogMyBmaWxlcyBjaGFuZ2VkLCAxNyBpbnNlcnRpb25zKCspLCAxNyBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS90b29scy9saWJ4bC9saWJ4bF9jcmVhdGUuYyBiL3Rvb2xzL2xpYnhsL2xpYnhs
X2NyZWF0ZS5jCmluZGV4IDNiM2I2ZWMzODEuLmU0ZGRmZDA2N2YgMTAwNjQ0Ci0tLSBhL3Rvb2xz
L2xpYnhsL2xpYnhsX2NyZWF0ZS5jCisrKyBiL3Rvb2xzL2xpYnhsL2xpYnhsX2NyZWF0ZS5jCkBA
IC04OTIsNiArODkyLDIxIEBAIHN0YXRpYyBib29sIG9rX3RvX2RlZmF1bHRfbWVta2JfaW5fY3Jl
YXRlKGxpYnhsX19nYyAqZ2MpCiAgICAgICovCiB9CiAKK3N0YXRpYyB1bnNpZ25lZCBsb25nIGxp
YnhsX19nZXRfcmVxdWlyZWRfaW9tbXVfbWVtb3J5KHVuc2lnbmVkIGxvbmcgbWF4bWVtX2tiKQor
eworICAgIHVuc2lnbmVkIGxvbmcgaW9tbXVfcGFnZXMgPSAwLCBtZW1fcGFnZXMgPSBtYXhtZW1f
a2IgLyA0OworICAgIHVuc2lnbmVkIGludCBsZXZlbDsKKworICAgIC8qIEFzc3VtZSBhIDQgbGV2
ZWwgcGFnZSB0YWJsZSB3aXRoIDUxMiBlbnRyaWVzIHBlciBsZXZlbCAqLworICAgIGZvciAobGV2
ZWwgPSAwOyBsZXZlbCA8IDQ7IGxldmVsKyspCisgICAgeworICAgICAgICBtZW1fcGFnZXMgPSBE
SVZfUk9VTkRVUChtZW1fcGFnZXMsIDUxMik7CisgICAgICAgIGlvbW11X3BhZ2VzICs9IG1lbV9w
YWdlczsKKyAgICB9CisKKyAgICByZXR1cm4gaW9tbXVfcGFnZXMgKiA0OworfQorCiBpbnQgbGli
eGxfX2RvbWFpbl9jb25maWdfc2V0ZGVmYXVsdChsaWJ4bF9fZ2MgKmdjLAogICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgbGlieGxfZG9tYWluX2NvbmZpZyAqZF9jb25maWcsCiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1aW50MzJfdCBkb21pZCkKQEAgLTEw
MTUsNyArMTAzMCw3IEBAIGludCBsaWJ4bF9fZG9tYWluX2NvbmZpZ19zZXRkZWZhdWx0KGxpYnhs
X19nYyAqZ2MsCiAgICAgICAgICYmIG9rX3RvX2RlZmF1bHRfbWVta2JfaW5fY3JlYXRlKGdjKSkK
ICAgICAgICAgZF9jb25maWctPmJfaW5mby5pb21tdV9tZW1rYiA9CiAgICAgICAgICAgICAoZF9j
b25maWctPmNfaW5mby5wYXNzdGhyb3VnaCA9PSBMSUJYTF9QQVNTVEhST1VHSF9TWU5DX1BUKQot
ICAgICAgICAgICAgPyBsaWJ4bF9nZXRfcmVxdWlyZWRfaW9tbXVfbWVtb3J5KGRfY29uZmlnLT5i
X2luZm8ubWF4X21lbWtiKQorICAgICAgICAgICAgPyBsaWJ4bF9fZ2V0X3JlcXVpcmVkX2lvbW11
X21lbW9yeShkX2NvbmZpZy0+Yl9pbmZvLm1heF9tZW1rYikKICAgICAgICAgICAgIDogMDsKIAog
ICAgIHJldCA9IGxpYnhsX19kb21haW5fYnVpbGRfaW5mb19zZXRkZWZhdWx0KGdjLCAmZF9jb25m
aWctPmJfaW5mbyk7CmRpZmYgLS1naXQgYS90b29scy9saWJ4bC9saWJ4bF91dGlscy5jIGIvdG9v
bHMvbGlieGwvbGlieGxfdXRpbHMuYwppbmRleCA0MDU3MzNiN2UxLi5mMzYwZjVlMjI4IDEwMDY0
NAotLS0gYS90b29scy9saWJ4bC9saWJ4bF91dGlscy5jCisrKyBiL3Rvb2xzL2xpYnhsL2xpYnhs
X3V0aWxzLmMKQEAgLTQ4LDIxICs0OCw2IEBAIHVuc2lnbmVkIGxvbmcgbGlieGxfZ2V0X3JlcXVp
cmVkX3NoYWRvd19tZW1vcnkodW5zaWduZWQgbG9uZyBtYXhtZW1fa2IsIHVuc2lnbmVkCiAgICAg
cmV0dXJuIDQgKiAoMjU2ICogc21wX2NwdXMgKyAyICogKG1heG1lbV9rYiAvIDEwMjQpKTsKIH0K
IAotdW5zaWduZWQgbG9uZyBsaWJ4bF9nZXRfcmVxdWlyZWRfaW9tbXVfbWVtb3J5KHVuc2lnbmVk
IGxvbmcgbWF4bWVtX2tiKQotewotICAgIHVuc2lnbmVkIGxvbmcgaW9tbXVfcGFnZXMgPSAwLCBt
ZW1fcGFnZXMgPSBtYXhtZW1fa2IgLyA0OwotICAgIHVuc2lnbmVkIGludCBsZXZlbDsKLQotICAg
IC8qIEFzc3VtZSBhIDQgbGV2ZWwgcGFnZSB0YWJsZSB3aXRoIDUxMiBlbnRyaWVzIHBlciBsZXZl
bCAqLwotICAgIGZvciAobGV2ZWwgPSAwOyBsZXZlbCA8IDQ7IGxldmVsKyspCi0gICAgewotICAg
ICAgICBtZW1fcGFnZXMgPSBESVZfUk9VTkRVUChtZW1fcGFnZXMsIDUxMik7Ci0gICAgICAgIGlv
bW11X3BhZ2VzICs9IG1lbV9wYWdlczsKLSAgICB9Ci0KLSAgICByZXR1cm4gaW9tbXVfcGFnZXMg
KiA0OwotfQotCiBjaGFyICpsaWJ4bF9kb21pZF90b19uYW1lKGxpYnhsX2N0eCAqY3R4LCB1aW50
MzJfdCBkb21pZCkKIHsKICAgICB1bnNpZ25lZCBpbnQgbGVuOwpkaWZmIC0tZ2l0IGEvdG9vbHMv
bGlieGwvbGlieGxfdXRpbHMuaCBiL3Rvb2xzL2xpYnhsL2xpYnhsX3V0aWxzLmgKaW5kZXggNjMw
Y2NiZTI4YS4uNDY5MThhZWE4NCAxMDA2NDQKLS0tIGEvdG9vbHMvbGlieGwvbGlieGxfdXRpbHMu
aAorKysgYi90b29scy9saWJ4bC9saWJ4bF91dGlscy5oCkBAIC0yNCw3ICsyNCw3IEBAIGNvbnN0
CiBjaGFyICpsaWJ4bF9iYXNlbmFtZShjb25zdCBjaGFyICpuYW1lKTsgLyogcmV0dXJucyBzdHJp
bmcgZnJvbSBzdHJkdXAgKi8KIAogdW5zaWduZWQgbG9uZyBsaWJ4bF9nZXRfcmVxdWlyZWRfc2hh
ZG93X21lbW9yeSh1bnNpZ25lZCBsb25nIG1heG1lbV9rYiwgdW5zaWduZWQgaW50IHNtcF9jcHVz
KTsKLXVuc2lnbmVkIGxvbmcgbGlieGxfZ2V0X3JlcXVpcmVkX2lvbW11X21lbW9yeSh1bnNpZ25l
ZCBsb25nIG1heG1lbV9rYik7CisgIC8qIGRlcHJlY2F0ZWQ7IHNlZSBMSUJYTF9IQVZFX0RPTUFJ
Tl9ORUVEX01FTU9SWV9DT05GSUcgaW4gbGlieGwuaCAqLwogaW50IGxpYnhsX25hbWVfdG9fZG9t
aWQobGlieGxfY3R4ICpjdHgsIGNvbnN0IGNoYXIgKm5hbWUsIHVpbnQzMl90ICpkb21pZCk7CiBp
bnQgbGlieGxfZG9tYWluX3F1YWxpZmllcl90b19kb21pZChsaWJ4bF9jdHggKmN0eCwgY29uc3Qg
Y2hhciAqbmFtZSwgdWludDMyX3QgKmRvbWlkKTsKIGNoYXIgKmxpYnhsX2RvbWlkX3RvX25hbWUo
bGlieGxfY3R4ICpjdHgsIHVpbnQzMl90IGRvbWlkKTsKLS0gCjIuMTEuMAoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
