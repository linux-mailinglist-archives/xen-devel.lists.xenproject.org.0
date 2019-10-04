Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E293CCBF00
	for <lists+xen-devel@lfdr.de>; Fri,  4 Oct 2019 17:20:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iGPKb-0001Po-CB; Fri, 04 Oct 2019 15:17:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=lQ+Z=X5=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iGPKZ-0001Pb-QP
 for xen-devel@lists.xenproject.org; Fri, 04 Oct 2019 15:17:19 +0000
X-Inumbo-ID: 0bbb1c7c-e6ba-11e9-80e3-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0bbb1c7c-e6ba-11e9-80e3-bc764e2007e4;
 Fri, 04 Oct 2019 15:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1570202235;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=DUhsCLEf0OcfIFOrzr5l33KzsS/q3Q913x3m3fxnA1k=;
 b=OGixZ3D18hqiLHA/q+VB44R4md6kzAnvRhVD6ScwxpWcV2qI6RIlj92z
 4I0pzOHcyqpGfe+D3GZtOc9G+Oz4LXvJXQc0Zw27DdjUplC+heqnMTPW8
 NCH8i6ModoQMX7Tv/YQGiL5pOIeFngifv957w5jY5729RpquaSuBC4YJF 0=;
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
IronPort-SDR: rdB4IcHyQ7iYJNdlwyI1pIOopXlv2x0lZ6UpKVre0KFgXJh4ijQSv8sZWMto5CfmVmp2W0fTEY
 9qRYwHCT0mPhnGN0Qpi0zclaivcgkO5Itc80VmIHDspevppO2ep9BNlsGryeVt3eUoNK5kp8qo
 97Q8GP+E5HGXqipWp3nh4NUEjDjyMkJ5C3BBkjc5ZvdATBHtFhCmG2COrqlOyifFavfKSrVbZy
 1T8g37Tygj65N+xlSw+skTeqqF2bTV3/X061IE0TfQLlNmeOrFdCUf1QL8TOIonz+hZTJXczVD
 9Hw=
X-SBRS: 2.7
X-MesageID: 6480726
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,256,1566878400"; 
   d="scan'208";a="6480726"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 4 Oct 2019 16:17:04 +0100
Message-ID: <20191004151707.24844-4-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20191004151707.24844-1-ian.jackson@eu.citrix.com>
References: <20191004151707.24844-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [XEN PATCH for-4.13 3/6] libxl:
 libxl__domain_config_setdefault: New function
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

QnJlYWsgb3V0IHRoaXMgaW50byBhIG5ldyBmdW5jdGlvbi4gIFdlIGFyZSBnb2luZyB0byB3YW50
IHRvIGNhbGwgaXQKZnJvbSBhIG5ldyBjYWxsIHNpdGUuCgpVbmZvcnR1bmF0ZWx5IG5vdCBhbGwg
b2YgdGhlIGRlZmF1bHRzIGNhbiBiZSBtb3ZlZCBpbnRvIHRoZSBuZXcKZnVuY3Rpb24gd2l0aG91
dCBjaGFuZ2luZyB0aGUgb3JkZXIgaW4gd2hpY2ggdGhpbmdzIGFyZSBkb25lLiAgVGhhdApkb2Vz
IG5vdCBzZWVtIHdpc2UgYXQgdGhpcyBzdGFnZSBvZiB0aGUgcmVsZWFzZS4gIFRoZSBlZmZlY3Qg
aXMgdGhhdAphZGRpdGlvbmFsIGNhbGxzIHRvIGxpYnhsX19kb21haW5fY29uZmlnX3NldGRlZmF1
bHQgKHdoaWNoIGFyZSBnb2luZwp0byBiZSBpbnRyb2R1Y2VkKSBkbyBub3QgcXVpdGUgc2V0IGV2
ZXJ5dGhpbmcuICBCdXQgdGhleSB3aWxsIGRvIHdoYXQKaXMgbmVlZGVkLiAgQWZ0ZXIgWGVuIDQu
MTMgaXMgZG9uZSwgd2Ugc2hvdWxkIG1vdmUgdGhvc2Ugc2V0dGluZ3MgaW50bwp0aGUgcmlnaHQg
b3JkZXIuCgpObyBmdW5jdGlvbmFsIGNoYW5nZS4KClNpZ25lZC1vZmYtYnk6IElhbiBKYWNrc29u
IDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgotLS0KIHRvb2xzL2xpYnhsL2xpYnhsX2NyZWF0
ZS5jICAgfCA0MCArKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tCiB0b29s
cy9saWJ4bC9saWJ4bF9pbnRlcm5hbC5oIHwgIDMgKysrCiAyIGZpbGVzIGNoYW5nZWQsIDMxIGlu
c2VydGlvbnMoKyksIDEyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnhsL2xp
YnhsX2NyZWF0ZS5jIGIvdG9vbHMvbGlieGwvbGlieGxfY3JlYXRlLmMKaW5kZXggMDk5NzYxYTJk
Ny4uNDU3YmViNjQ2MiAxMDA2NDQKLS0tIGEvdG9vbHMvbGlieGwvbGlieGxfY3JlYXRlLmMKKysr
IGIvdG9vbHMvbGlieGwvbGlieGxfY3JlYXRlLmMKQEAgLTg2MiwyMiArODYyLDE0IEBAIHN0YXRp
YyB2b2lkIGRvbWNyZWF0ZV9kZXN0cnVjdGlvbl9jYihsaWJ4bF9fZWdjICplZ2MsCiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbGlieGxfX2RvbWFpbl9kZXN0cm95X3N0YXRl
ICpkZHMsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaW50IHJjKTsKIAot
c3RhdGljIHZvaWQgaW5pdGlhdGVfZG9tYWluX2NyZWF0ZShsaWJ4bF9fZWdjICplZ2MsCi0gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGxpYnhsX19kb21haW5fY3JlYXRlX3N0YXRl
ICpkY3MpCitpbnQgbGlieGxfX2RvbWFpbl9jb25maWdfc2V0ZGVmYXVsdChsaWJ4bF9fZ2MgKmdj
LAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbGlieGxfZG9tYWluX2NvbmZp
ZyAqZF9jb25maWcsCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1aW50MzJf
dCBkb21pZCkKIHsKLSAgICBTVEFURV9BT19HQyhkY3MtPmFvKTsKICAgICBsaWJ4bF9jdHggKmN0
eCA9IGxpYnhsX19nY19vd25lcihnYyk7Ci0gICAgdWludDMyX3QgZG9taWQ7Ci0gICAgaW50IGks
IHJldDsKKyAgICBpbnQgcmV0OwogICAgIGJvb2wgcG9kX2VuYWJsZWQgPSBmYWxzZTsKIAotICAg
IC8qIGNvbnZlbmllbmNlIGFsaWFzZXMgKi8KLSAgICBsaWJ4bF9kb21haW5fY29uZmlnICpjb25z
dCBkX2NvbmZpZyA9IGRjcy0+Z3Vlc3RfY29uZmlnOwotICAgIGNvbnN0IGludCByZXN0b3JlX2Zk
ID0gZGNzLT5yZXN0b3JlX2ZkOwotCi0gICAgZG9taWQgPSBkY3MtPmRvbWlkX3NvZnRfcmVzZXQ7
Ci0gICAgbGlieGxfX2RvbWFpbl9idWlsZF9zdGF0ZV9pbml0KCZkY3MtPmJ1aWxkX3N0YXRlKTsK
LQogICAgIGlmIChkX2NvbmZpZy0+Y19pbmZvLnNzaWRfbGFiZWwpIHsKICAgICAgICAgY2hhciAq
cyA9IGRfY29uZmlnLT5jX2luZm8uc3NpZF9sYWJlbDsKICAgICAgICAgcmV0ID0gbGlieGxfZmxh
c2tfY29udGV4dF90b19zaWQoY3R4LCBzLCBzdHJsZW4ocyksCkBAIC0xMDA4LDYgKzEwMDAsMjcg
QEAgc3RhdGljIHZvaWQgaW5pdGlhdGVfZG9tYWluX2NyZWF0ZShsaWJ4bF9fZWdjICplZ2MsCiAg
ICAgICAgIGdvdG8gZXJyb3Jfb3V0OwogICAgIH0KIAorICAgIHJldCA9IDA7CisgZXJyb3Jfb3V0
OgorICAgIHJldHVybiByZXQ7Cit9CisKK3N0YXRpYyB2b2lkIGluaXRpYXRlX2RvbWFpbl9jcmVh
dGUobGlieGxfX2VnYyAqZWdjLAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBs
aWJ4bF9fZG9tYWluX2NyZWF0ZV9zdGF0ZSAqZGNzKQoreworICAgIFNUQVRFX0FPX0dDKGRjcy0+
YW8pOworICAgIHVpbnQzMl90IGRvbWlkOworICAgIGludCBpLCByZXQ7CisKKyAgICAvKiBjb252
ZW5pZW5jZSBhbGlhc2VzICovCisgICAgbGlieGxfZG9tYWluX2NvbmZpZyAqY29uc3QgZF9jb25m
aWcgPSBkY3MtPmd1ZXN0X2NvbmZpZzsKKyAgICBjb25zdCBpbnQgcmVzdG9yZV9mZCA9IGRjcy0+
cmVzdG9yZV9mZDsKKworICAgIGRvbWlkID0gZGNzLT5kb21pZF9zb2Z0X3Jlc2V0OworICAgIGxp
YnhsX19kb21haW5fYnVpbGRfc3RhdGVfaW5pdCgmZGNzLT5idWlsZF9zdGF0ZSk7CisKKyAgICBs
aWJ4bF9fZG9tYWluX2NvbmZpZ19zZXRkZWZhdWx0KGdjLGRfY29uZmlnLGRvbWlkKTsKKwogICAg
IHJldCA9IGxpYnhsX19kb21haW5fbWFrZShnYywgZF9jb25maWcsICZkY3MtPmJ1aWxkX3N0YXRl
LCAmZG9taWQpOwogICAgIGlmIChyZXQpIHsKICAgICAgICAgTE9HRChFUlJPUiwgZG9taWQsICJj
YW5ub3QgbWFrZSBkb21haW46ICVkIiwgcmV0KTsKQEAgLTEwMTksNiArMTAzMiw5IEBAIHN0YXRp
YyB2b2lkIGluaXRpYXRlX2RvbWFpbl9jcmVhdGUobGlieGxfX2VnYyAqZWdjLAogICAgIGRjcy0+
Z3Vlc3RfZG9taWQgPSBkb21pZDsKICAgICBkY3MtPnNkc3MuZG0uZ3Vlc3RfZG9taWQgPSAwOyAv
KiBtZWFucyB3ZSBoYXZlbid0IHNwYXduZWQgKi8KIAorICAgIC8qIHBvc3QtNC4xMyB0b2RvOiBt
b3ZlIHRoZXNlIG5leHQgYml0cyBvZiBkZWZhdWx0aW5nIHRvCisgICAgICogbGlieGxfX2RvbWFp
bl9jb25maWdfc2V0ZGVmYXVsdCAqLworCiAgICAgLyoKICAgICAgKiBTZXQgdGhlIGRtIHZlcnNp
b24gcXVpdGUgZWFybHkgc28gdGhhdCBsaWJ4bCBkb2Vzbid0IGhhdmUgdG8gcGFzcyB0aGUKICAg
ICAgKiBidWlsZCBpbmZvIGFyb3VuZCBqdXN0IHRvIGtub3cgaWYgdGhlIGRvbWFpbiBoYXMgYSBk
ZXZpY2UgbW9kZWwgb3Igbm90LgpkaWZmIC0tZ2l0IGEvdG9vbHMvbGlieGwvbGlieGxfaW50ZXJu
YWwuaCBiL3Rvb2xzL2xpYnhsL2xpYnhsX2ludGVybmFsLmgKaW5kZXggZDJkNWFmNzQ2Yi4uNTBh
YzdiNjRlZCAxMDA2NDQKLS0tIGEvdG9vbHMvbGlieGwvbGlieGxfaW50ZXJuYWwuaAorKysgYi90
b29scy9saWJ4bC9saWJ4bF9pbnRlcm5hbC5oCkBAIC0xNDQwLDYgKzE0NDAsOSBAQCBfaGlkZGVu
IGludCBsaWJ4bF9fcmVzb2x2ZV9kb21pZChsaWJ4bF9fZ2MgKmdjLCBjb25zdCBjaGFyICpuYW1l
LAogICogICAgIEFsbCBsaWJ4bCBBUEkgZnVuY3Rpb25zIGFyZSBleHBlY3RlZCB0byBoYXZlIGFy
cmFuZ2VkIGZvciB0aGlzCiAgKiAgICAgdG8gYmUgY2FsbGVkIGJlZm9yZSB1c2luZyBhbnkgdmFs
dWVzIHdpdGhpbiB0aGVzZSBzdHJ1Y3R1cmVzLgogICovCitfaGlkZGVuIGludCBsaWJ4bF9fZG9t
YWluX2NvbmZpZ19zZXRkZWZhdWx0KGxpYnhsX19nYyAqZ2MsCisgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGxpYnhsX2RvbWFpbl9jb25maWcgKmRfY29uZmlnLAor
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1aW50MzJfdCBkb21p
ZCAvKiBsb2dnaW5nIG9ubHkgKi8pOwogX2hpZGRlbiBpbnQgbGlieGxfX2RvbWFpbl9jcmVhdGVf
aW5mb19zZXRkZWZhdWx0KGxpYnhsX19nYyAqZ2MsCiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgbGlieGxfZG9tYWluX2NyZWF0ZV9pbmZvICpjX2luZm8pOwogX2hpZGRl
biBpbnQgbGlieGxfX2RvbWFpbl9idWlsZF9pbmZvX3NldGRlZmF1bHQobGlieGxfX2djICpnYywK
LS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
