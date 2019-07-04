Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96F1A5FA6B
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jul 2019 17:00:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hj3Bf-00068L-Qk; Thu, 04 Jul 2019 14:58:15 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8gU+=VB=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hj3Be-000675-4P
 for xen-devel@lists.xenproject.org; Thu, 04 Jul 2019 14:58:14 +0000
X-Inumbo-ID: 250fbc5e-9e6c-11e9-8980-bc764e045a96
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 250fbc5e-9e6c-11e9-8980-bc764e045a96;
 Thu, 04 Jul 2019 14:58:12 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: gwsDPpViGch5vStX4AcR6FaqqiE2dxZy540jNtGzgt8C44aBA0xNTXDzhu/MsXjAje5krlkcgp
 9Yi813KAf9K767RapGKOP9lJZ7JdPo0mw3JePgspHF8Jni5ekRNtnft2tqlY2x/oCb5267RsMR
 PpqzO64HXbwiGyKIWcbAs1YXNhzdE2iNp78EER2Dm2+JFbHZkmJfFEuhFk0EXTBaDpHrAmZLy+
 yl2baQ+gAddvCwlu16xCeFwzLuiNrN3NshI9UlthMpuA86jn8HqxnpWFUqIi18fbrnpB5doN8K
 wNs=
X-SBRS: 2.7
X-MesageID: 2650932
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,451,1557201600"; 
   d="scan'208";a="2650932"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <devel@edk2.groups.io>
Date: Thu, 4 Jul 2019 15:42:24 +0100
Message-ID: <20190704144233.27968-27-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190704144233.27968-1-anthony.perard@citrix.com>
References: <20190704144233.27968-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 26/35] OvmfPkg/XenPlatformPei: Ignore missing
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
ZEBjaXRyaXguY29tPgotLS0KCk5vdGVzOgogICAgdjM6CiAgICAtIFJlbW92ZSB1c2Ugb2YgWEVO
X1BWSF9QQ0lfSE9TVF9CUklER0VfREVWSUNFX0lELCBhbmQgc2ltcGx5IGRvbid0IHNldAogICAg
ICBQY2RPdm1mSG9zdEJyaWRnZVBjaURldklkLgogICAgCiAgICB2MjoKICAgIC0gVXNlIG5ldyBY
RU5fUFZIX1BDSV9IT1NUX0JSSURHRV9ERVZJQ0VfSUQgbWFjcm8KCiBPdm1mUGtnL1hlblBsYXRm
b3JtUGVpL1BsYXRmb3JtLmMgfCA2ICsrKysrKwogMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9u
cygrKQoKZGlmZiAtLWdpdCBhL092bWZQa2cvWGVuUGxhdGZvcm1QZWkvUGxhdGZvcm0uYyBiL092
bWZQa2cvWGVuUGxhdGZvcm1QZWkvUGxhdGZvcm0uYwppbmRleCA1MmY2MDQ4Y2E0Li5iN2ZjMzBk
MmVlIDEwMDY0NAotLS0gYS9Pdm1mUGtnL1hlblBsYXRmb3JtUGVpL1BsYXRmb3JtLmMKKysrIGIv
T3ZtZlBrZy9YZW5QbGF0Zm9ybVBlaS9QbGF0Zm9ybS5jCkBAIC0yNzIsNiArMjcyLDEyIEBAIE1p
c2NJbml0aWFsaXphdGlvbiAoCiAgICAgICBBY3BpRW5CaXQgID0gSUNIOV9BQ1BJX0NOVExfQUNQ
SV9FTjsNCiAgICAgICBicmVhazsNCiAgICAgZGVmYXVsdDoNCisgICAgICBpZiAoWGVuUHZoRGV0
ZWN0ZWQgKCkpIHsNCisgICAgICAgIC8vDQorICAgICAgICAvLyBUaGVyZSBpcyBubyBQQ0kgYnVz
IGluIHRoaXMgY2FzZQ0KKyAgICAgICAgLy8NCisgICAgICAgIHJldHVybjsNCisgICAgICB9DQog
ICAgICAgREVCVUcgKChFRklfRF9FUlJPUiwgIiVhOiBVbmtub3duIEhvc3QgQnJpZGdlIERldmlj
ZSBJRDogMHglMDR4XG4iLA0KICAgICAgICAgX19GVU5DVElPTl9fLCBtSG9zdEJyaWRnZURldklk
KSk7DQogICAgICAgQVNTRVJUIChGQUxTRSk7DQotLSAKQW50aG9ueSBQRVJBUkQKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
