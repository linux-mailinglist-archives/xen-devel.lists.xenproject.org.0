Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EFF21736D7
	for <lists+xen-devel@lfdr.de>; Fri, 28 Feb 2020 13:10:58 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j7eRD-0006QE-WA; Fri, 28 Feb 2020 12:08:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=HvEU=4Q=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j7eRC-0006Q3-Ff
 for xen-devel@lists.xenproject.org; Fri, 28 Feb 2020 12:08:14 +0000
X-Inumbo-ID: fe6b76d4-5a22-11ea-b7e8-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fe6b76d4-5a22-11ea-b7e8-bc764e2007e4;
 Fri, 28 Feb 2020 12:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582891693;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wqOEWjoupZqj5EzPUH8qsfVbxUho33yiKRIgGC1ywtE=;
 b=AZL/cLOcQo5IPfmliDMumyimwm7s/pPHfPpP0/bMJmgQaQcZfmnOIKcX
 f6DCWqp8mlLzynfolrzTpUnG5E+YBQY+gZh/C0I1DehSZ8dQV3fAIUC6d
 DyYNGi1wbzf6Q7zMPnQtEcCvpskEVRJzvbp6C+L8vfLZMisoedJcRXTqS U=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
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
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: x+zukpqixKaY3v3m7PpWEKOZo5nLTZsS3q9QIp/HnWfOHD3taZ33kNt4p29ZID4cwwJY6yZMZi
 X20ZOSvqEapyhI9Vf10wF5DyrGbJXGXXD4K2x5r2Vih13JOhJ36nziHZ4pzA5dYeSsKZlvruta
 VcW0g9/4fldsndKw27yiiBwmW7jIKOBQDmMeT2u7siX3sKt5o5GsBtDkF/YOXdgJMDCGcBj7s8
 6adPF1ijrimP65WZz+0YJJy6md/WNiL/cZubHY4uf1c+ITWUhmmbBT9iq8Cf/P7UzKtM+gKhMf
 PgM=
X-SBRS: 2.7
X-MesageID: 13510566
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,496,1574139600"; d="scan'208";a="13510566"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 28 Feb 2020 13:07:52 +0100
Message-ID: <20200228120753.38036-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200228120753.38036-1-roger.pau@citrix.com>
References: <20200228120753.38036-1-roger.pau@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v5 1/2] x86/smp: use a dedicated CPU mask in
 send_IPI_mask
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

U29tZSBjYWxsZXJzIG9mIHNlbmRfSVBJX21hc2sgcGFzcyB0aGUgc2NyYXRjaCBjcHVtYXNrIGFz
IHRoZSBtYXNrCnBhcmFtZXRlciBvZiBzZW5kX0lQSV9tYXNrLCBzbyB0aGUgc2NyYXRjaCBjcHVt
YXNrIGNhbm5vdCBiZSB1c2VkIGJ5CnRoZSBmdW5jdGlvbi4gVGhlIGZvbGxvd2luZyB0cmFjZSBo
YXMgYmVlbiBvYnRhaW5lZCB3aXRoIGEgZGVidWcgcGF0Y2gKYW5kIHNob3dzIG9uZSBvZiB0aG9z
ZSBjYWxsZXJzOgoKKFhFTikgc2NyYXRjaCBDUFUgbWFzayBhbHJlYWR5IGluIHVzZSBieSBhcmNo
L3g4Ni9tbS5jI19nZXRfcGFnZV90eXBlKzB4MWY5LzB4MWFiZgooWEVOKSBYZW4gQlVHIGF0IHNt
cC5jOjQ1ClsuLi5dCihYRU4pIFhlbiBjYWxsIHRyYWNlOgooWEVOKSAgICBbPGZmZmY4MmQwODAy
YWJiNTM+XSBSIHNjcmF0Y2hfY3B1bWFzaysweGQzLzB4ZjkKKFhFTikgICAgWzxmZmZmODJkMDgw
MmFiYzIxPl0gRiBzZW5kX0lQSV9tYXNrKzB4NzIvMHgxY2EKKFhFTikgICAgWzxmZmZmODJkMDgw
MmFjMTNlPl0gRiBmbHVzaF9hcmVhX21hc2srMHgxMGMvMHgxNmMKKFhFTikgICAgWzxmZmZmODJk
MDgwMjk2YzU2Pl0gRiBhcmNoL3g4Ni9tbS5jI19nZXRfcGFnZV90eXBlKzB4M2ZmLzB4MWFiZgoo
WEVOKSAgICBbPGZmZmY4MmQwODAyOTgzMjQ+XSBGIGdldF9wYWdlX3R5cGUrMHhlLzB4MmMKKFhF
TikgICAgWzxmZmZmODJkMDgwMzg2MjRmPl0gRiBwdl9zZXRfZ2R0KzB4YTEvMHgyYWEKKFhFTikg
ICAgWzxmZmZmODJkMDgwMjdkZmQ2Pl0gRiBhcmNoX3NldF9pbmZvX2d1ZXN0KzB4MTE5Ni8weDE2
YmEKKFhFTikgICAgWzxmZmZmODJkMDgwMjA3YTU1Pl0gRiBkZWZhdWx0X2luaXRpYWxpc2VfdmNw
dSsweGM3LzB4ZDQKKFhFTikgICAgWzxmZmZmODJkMDgwMjdlNTViPl0gRiBhcmNoX2luaXRpYWxp
c2VfdmNwdSsweDYxLzB4Y2QKKFhFTikgICAgWzxmZmZmODJkMDgwMjA3ZTc4Pl0gRiBkb192Y3B1
X29wKzB4MjE5LzB4NjkwCihYRU4pICAgIFs8ZmZmZjgyZDA4MDM4YmUxNj5dIEYgcHZfaHlwZXJj
YWxsKzB4MmY2LzB4NTkzCihYRU4pICAgIFs8ZmZmZjgyZDA4MDM5NjQzMj5dIEYgbHN0YXJfZW50
ZXIrMHgxMTIvMHgxMjAKCl9nZXRfcGFnZV90eXBlIHdpbGwgdXNlIHRoZSBzY3JhdGNoIGNwdW1h
c2sgdG8gY2FsbCBmbHVzaF90bGJfbWFzaywKd2hpY2ggaW4gdHVybiBjYWxscyBzZW5kX0lQSV9t
YXNrLgoKRml4IHRoaXMgYnkgdXNpbmcgYSBkZWRpY2F0ZWQgcGVyIENQVSBjcHVtYXNrIGluIHNl
bmRfSVBJX21hc2suCgpGaXhlczogNTUwMGQyNjVhMmE4ICgneDg2L3NtcDogdXNlIEFQSUMgQUxM
QlVUIGRlc3RpbmF0aW9uIHNob3J0aGFuZCB3aGVuIHBvc3NpYmxlJykKU2lnbmVkLW9mZi1ieTog
Um9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Ci0tLQpDaGFuZ2VzIHNpbmNl
IHY0OgogLSBQbGFjZSB0aGUgZGVjbGFyYXRpb24gb2Ygc2VuZF9pcGlfY3B1bWFzayBpbiBzbXAu
aC4KLS0tCiB4ZW4vYXJjaC94ODYvc21wLmMgICAgICAgIHwgMiArLQogeGVuL2FyY2gveDg2L3Nt
cGJvb3QuYyAgICB8IDkgKysrKysrKystCiB4ZW4vaW5jbHVkZS9hc20teDg2L3NtcC5oIHwgMSAr
CiAzIGZpbGVzIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEveGVuL2FyY2gveDg2L3NtcC5jIGIveGVuL2FyY2gveDg2L3NtcC5jCmluZGV4IDA0
NjE4MTJjZjYuLmRkMGI0OWQ3MzEgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9zbXAuYworKysg
Yi94ZW4vYXJjaC94ODYvc21wLmMKQEAgLTY3LDcgKzY3LDcgQEAgc3RhdGljIHZvaWQgc2VuZF9J
UElfc2hvcnRjdXQodW5zaWduZWQgaW50IHNob3J0Y3V0LCBpbnQgdmVjdG9yLAogdm9pZCBzZW5k
X0lQSV9tYXNrKGNvbnN0IGNwdW1hc2tfdCAqbWFzaywgaW50IHZlY3RvcikKIHsKICAgICBib29s
IGNwdXNfbG9ja2VkID0gZmFsc2U7Ci0gICAgY3B1bWFza190ICpzY3JhdGNoID0gdGhpc19jcHUo
c2NyYXRjaF9jcHVtYXNrKTsKKyAgICBjcHVtYXNrX3QgKnNjcmF0Y2ggPSB0aGlzX2NwdShzZW5k
X2lwaV9jcHVtYXNrKTsKIAogICAgIGlmICggaW5faXJxKCkgfHwgaW5fbWNlX2hhbmRsZXIoKSB8
fCBpbl9ubWlfaGFuZGxlcigpICkKICAgICB7CmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvc21w
Ym9vdC5jIGIveGVuL2FyY2gveDg2L3NtcGJvb3QuYwppbmRleCBhZDQ5ZjJkY2Q3Li42YzU0OGIw
YjUzIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvc21wYm9vdC5jCisrKyBiL3hlbi9hcmNoL3g4
Ni9zbXBib290LmMKQEAgLTU3LDYgKzU3LDkgQEAgREVGSU5FX1BFUl9DUFVfUkVBRF9NT1NUTFko
Y3B1bWFza192YXJfdCwgY3B1X2NvcmVfbWFzayk7CiBERUZJTkVfUEVSX0NQVV9SRUFEX01PU1RM
WShjcHVtYXNrX3Zhcl90LCBzY3JhdGNoX2NwdW1hc2spOwogc3RhdGljIGNwdW1hc2tfdCBzY3Jh
dGNoX2NwdTBtYXNrOwogCitERUZJTkVfUEVSX0NQVV9SRUFEX01PU1RMWShjcHVtYXNrX3Zhcl90
LCBzZW5kX2lwaV9jcHVtYXNrKTsKK3N0YXRpYyBjcHVtYXNrX3Qgc2VuZF9pcGlfY3B1MG1hc2s7
CisKIGNwdW1hc2tfdCBjcHVfb25saW5lX21hcCBfX3JlYWRfbW9zdGx5OwogRVhQT1JUX1NZTUJP
TChjcHVfb25saW5lX21hcCk7CiAKQEAgLTkzMCw2ICs5MzMsOCBAQCBzdGF0aWMgdm9pZCBjcHVf
c21wYm9vdF9mcmVlKHVuc2lnbmVkIGludCBjcHUsIGJvb2wgcmVtb3ZlKQogICAgICAgICBGUkVF
X0NQVU1BU0tfVkFSKHBlcl9jcHUoY3B1X2NvcmVfbWFzaywgY3B1KSk7CiAgICAgICAgIGlmICgg
cGVyX2NwdShzY3JhdGNoX2NwdW1hc2ssIGNwdSkgIT0gJnNjcmF0Y2hfY3B1MG1hc2sgKQogICAg
ICAgICAgICAgRlJFRV9DUFVNQVNLX1ZBUihwZXJfY3B1KHNjcmF0Y2hfY3B1bWFzaywgY3B1KSk7
CisgICAgICAgIGlmICggcGVyX2NwdShzZW5kX2lwaV9jcHVtYXNrLCBjcHUpICE9ICZzZW5kX2lw
aV9jcHUwbWFzayApCisgICAgICAgICAgICBGUkVFX0NQVU1BU0tfVkFSKHBlcl9jcHUoc2VuZF9p
cGlfY3B1bWFzaywgY3B1KSk7CiAgICAgfQogCiAgICAgY2xlYW51cF9jcHVfcm9vdF9wZ3QoY3B1
KTsKQEAgLTEwMzQsNyArMTAzOSw4IEBAIHN0YXRpYyBpbnQgY3B1X3NtcGJvb3RfYWxsb2ModW5z
aWduZWQgaW50IGNwdSkKIAogICAgIGlmICggIShjb25kX3phbGxvY19jcHVtYXNrX3ZhcigmcGVy
X2NwdShjcHVfc2libGluZ19tYXNrLCBjcHUpKSAmJgogICAgICAgICAgICBjb25kX3phbGxvY19j
cHVtYXNrX3ZhcigmcGVyX2NwdShjcHVfY29yZV9tYXNrLCBjcHUpKSAmJgotICAgICAgICAgICBj
b25kX2FsbG9jX2NwdW1hc2tfdmFyKCZwZXJfY3B1KHNjcmF0Y2hfY3B1bWFzaywgY3B1KSkpICkK
KyAgICAgICAgICAgY29uZF9hbGxvY19jcHVtYXNrX3ZhcigmcGVyX2NwdShzY3JhdGNoX2NwdW1h
c2ssIGNwdSkpICYmCisgICAgICAgICAgIGNvbmRfYWxsb2NfY3B1bWFza192YXIoJnBlcl9jcHUo
c2VuZF9pcGlfY3B1bWFzaywgY3B1KSkpICkKICAgICAgICAgZ290byBvdXQ7CiAKICAgICByYyA9
IDA7CkBAIC0xMTc1LDYgKzExODEsNyBAQCB2b2lkIF9faW5pdCBzbXBfcHJlcGFyZV9ib290X2Nw
dSh2b2lkKQogICAgIGNwdW1hc2tfc2V0X2NwdShjcHUsICZjcHVfcHJlc2VudF9tYXApOwogI2lm
IE5SX0NQVVMgPiAyICogQklUU19QRVJfTE9ORwogICAgIHBlcl9jcHUoc2NyYXRjaF9jcHVtYXNr
LCBjcHUpID0gJnNjcmF0Y2hfY3B1MG1hc2s7CisgICAgcGVyX2NwdShzZW5kX2lwaV9jcHVtYXNr
LCBjcHUpID0gJnNlbmRfaXBpX2NwdTBtYXNrOwogI2VuZGlmCiAKICAgICBnZXRfY3B1X2luZm8o
KS0+dXNlX3B2X2NyMyA9IGZhbHNlOwpkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9z
bXAuaCBiL3hlbi9pbmNsdWRlL2FzbS14ODYvc21wLmgKaW5kZXggOTJkNjlhNWVhMC4uNjE1MDM2
MzY1NSAxMDA2NDQKLS0tIGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9zbXAuaAorKysgYi94ZW4vaW5j
bHVkZS9hc20teDg2L3NtcC5oCkBAIC0yMiw2ICsyMiw3IEBACiBERUNMQVJFX1BFUl9DUFUoY3B1
bWFza192YXJfdCwgY3B1X3NpYmxpbmdfbWFzayk7CiBERUNMQVJFX1BFUl9DUFUoY3B1bWFza192
YXJfdCwgY3B1X2NvcmVfbWFzayk7CiBERUNMQVJFX1BFUl9DUFUoY3B1bWFza192YXJfdCwgc2Ny
YXRjaF9jcHVtYXNrKTsKK0RFQ0xBUkVfUEVSX0NQVShjcHVtYXNrX3Zhcl90LCBzZW5kX2lwaV9j
cHVtYXNrKTsKIAogLyoKICAqIERvIHdlLCBmb3IgcGxhdGZvcm0gcmVhc29ucywgbmVlZCB0byBh
Y3R1YWxseSBrZWVwIENQVXMgb25saW5lIHdoZW4gd2UKLS0gCjIuMjUuMAoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
