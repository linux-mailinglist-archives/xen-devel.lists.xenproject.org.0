Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8698D6D6B1
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jul 2019 23:57:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hoEMJ-0008K3-8m; Thu, 18 Jul 2019 21:54:39 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=y+p/=VP=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1hoEMI-0008Jy-3g
 for xen-devel@lists.xenproject.org; Thu, 18 Jul 2019 21:54:38 +0000
X-Inumbo-ID: a17fa1f0-a9a6-11e9-8980-bc764e045a96
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id a17fa1f0-a9a6-11e9-8980-bc764e045a96;
 Thu, 18 Jul 2019 21:54:35 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=george.dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 george.dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="george.dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: X4+k/xRpuHGq9R5P3GnSsVj10d3uaWof1fBoA9t5/QeSDKOfbmMk7KzBCPp34mslop5XHzYmc+
 /z5ebsnZc+5HLtRjq8w7n3WgXUdmjvPP9OJo7kjcT2cJHDYsbZKMMWeOckBAuKyM4h6TZxue0j
 QWPFLpUuax+vgV8yebA48AaeGi9gMMNNCQF3TSBF6i3ZNGebtTAZg/hv/u1pcLEOo2qmrAksSG
 wu1o2TfdNql9lhbflwIKHdwlaO528Iwqy0Wrxjut3aHfoMdGZoLnyojR0p7kapoYjWR19jj+cY
 lDI=
X-SBRS: 2.7
X-MesageID: 3241739
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,279,1559534400"; 
   d="scan'208";a="3241739"
From: George Dunlap <george.dunlap@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 18 Jul 2019 22:54:28 +0100
Message-ID: <20190718215428.6727-1-george.dunlap@citrix.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] golang/xenlight: Add libxl_utils support
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
Cc: Ian Jackson <ian.jackson@citrix.com>,
 Nicolas Belouin <nicolas.belouin@gandi.net>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIEdvIGJpbmRpbmdzIGZvciBsaWJ4bCBtaXNzIGZ1bmN0aW9ucyBmcm9tIGxpYnhsX3V0aWxz
LCBsZXQncyBzdGFydAp3aXRoIHRoZSBzaW1wbGUgbGlieGxfZG9taWRfdG9fbmFtZSBhbmQgaXRz
IGNvdW50ZXJwYXJ0CmxpYnhsX25hbWVfdG9fZG9taWQuCgpOQiB0aGF0IEMuR29TdHJpbmcoKSB3
aWxsIHJldHVybiAiIiBpZiBpdCdzIHBhc3NlZCBhIE5VTEw7IHNlZQpodHRwczovL2dpdGh1Yi5j
b20vZ29sYW5nL2dvL2lzc3Vlcy8zMjczNCNpc3N1ZWNvbW1lbnQtNTA2ODM1NDMyCgpTaWduZWQt
b2ZmLWJ5OiBOaWNvbGFzIEJlbG91aW4gPG5pY29sYXMuYmVsb3VpbkBnYW5kaS5uZXQ+ClNpZ25l
ZC1vZmYtYnk6IEdlb3JnZSBEdW5sYXAgPGdlb3JnZS5kdW5sYXBAY2l0cml4LmNvbT4KLS0tCnYz
OgogLSBXaXJlIGludG8gYnVpbGQgc3lzdGVtCiAtIEFkZCByZWZlcmVuY2UgdG8gQy5Hb1N0cmlu
ZygpIGhhbmRsaW5nIE5VTEwgdG8gY29tbWl0IG1lc3NhZ2UKCk5pY29sYXMsIGNvdWxkIHlvdSB0
ZXN0IHRvIHNlZSBpZiB0aGlzIGFjdHVhbGx5IHdvcmtzIGZvciB5b3U/CgpJdCB3b3VsZCBiZSBy
ZWFsbHkgZ29vZCBhbHNvIGlmIHdlIGNvdWxkIGdldCBzb21ldGhpbmcgdGhhdCB3b3VsZCBkbwpi
YXNpYyB1bml0IHRlc3Rpbmcgb24gYSBsaXZlIHN5c3RlbSwgYW5kIGdldCB0aGF0IHJ1bm5pbmcg
aW4gb3NzdGVzdC4KCkNDOiBOaWNvbGFzIEJlbG91aW4gPG5pY29sYXMuYmVsb3VpbkBnYW5kaS5u
ZXQ+CkNDOiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AY2l0cml4LmNvbT4KQ0M6IFdlaSBMaXUg
PHdsQHhlbi5vcmc+Ci0tLQogdG9vbHMvZ29sYW5nL3hlbmxpZ2h0L01ha2VmaWxlICAgICAgICAg
IHwgIDIgKy0KIHRvb2xzL2dvbGFuZy94ZW5saWdodC94ZW5saWdodF91dGlscy5nbyB8IDU1ICsr
KysrKysrKysrKysrKysrKysrKysrKysKIDIgZmlsZXMgY2hhbmdlZCwgNTYgaW5zZXJ0aW9ucygr
KSwgMSBkZWxldGlvbigtKQogY3JlYXRlIG1vZGUgMTAwNjQ0IHRvb2xzL2dvbGFuZy94ZW5saWdo
dC94ZW5saWdodF91dGlscy5nbwoKZGlmZiAtLWdpdCBhL3Rvb2xzL2dvbGFuZy94ZW5saWdodC9N
YWtlZmlsZSBiL3Rvb2xzL2dvbGFuZy94ZW5saWdodC9NYWtlZmlsZQppbmRleCAwOTg3MzA1MjI0
Li42NTkyM2RmNTlhIDEwMDY0NAotLS0gYS90b29scy9nb2xhbmcveGVubGlnaHQvTWFrZWZpbGUK
KysrIGIvdG9vbHMvZ29sYW5nL3hlbmxpZ2h0L01ha2VmaWxlCkBAIC04LDcgKzgsNyBAQCBHT1hM
X1BLR19ESVIgPSAvc3JjLyQoWEVOX0dPQ09ERV9VUkwpL3hlbmxpZ2h0LwogR09YTF9JTlNUQUxM
X0RJUiA9ICQoR09DT0RFX0RJUikkKEdPWExfUEtHX0RJUikKIAogIyBQS0dTT1VSQ0VTOiBGaWxl
cyB3aGljaCBjb21wcmlzZSB0aGUgZGlzdHJpYnV0ZWQgc291cmNlIHBhY2thZ2UKLVBLR1NPVVJD
RVMgPSB4ZW5saWdodC5nbworUEtHU09VUkNFUyA9IHhlbmxpZ2h0LmdvIHhlbmxpZ2h0X3V0aWxz
LmdvCiAKIEdPID89IGdvCiAKZGlmZiAtLWdpdCBhL3Rvb2xzL2dvbGFuZy94ZW5saWdodC94ZW5s
aWdodF91dGlscy5nbyBiL3Rvb2xzL2dvbGFuZy94ZW5saWdodC94ZW5saWdodF91dGlscy5nbwpu
ZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi5kYTE2MzY4NDJkCi0tLSAvZGV2
L251bGwKKysrIGIvdG9vbHMvZ29sYW5nL3hlbmxpZ2h0L3hlbmxpZ2h0X3V0aWxzLmdvCkBAIC0w
LDAgKzEsNTUgQEAKKy8qCisgKiBDb3B5cmlnaHQgKEMpIDIwMTkgTmljb2xhcyBCZWxvdWluLCBH
YW5kaSBTQVMKKyAqCisgKiBUaGlzIGxpYnJhcnkgaXMgZnJlZSBzb2Z0d2FyZTsgeW91IGNhbiBy
ZWRpc3RyaWJ1dGUgaXQgYW5kL29yCisgKiBtb2RpZnkgaXQgdW5kZXIgdGhlIHRlcm1zIG9mIHRo
ZSBHTlUgTGVzc2VyIEdlbmVyYWwgUHVibGljCisgKiBMaWNlbnNlIGFzIHB1Ymxpc2hlZCBieSB0
aGUgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uOworICogdmVyc2lvbiAyLjEgb2YgdGhlIExpY2Vu
c2UuCisgKgorICogVGhpcyBsaWJyYXJ5IGlzIGRpc3RyaWJ1dGVkIGluIHRoZSBob3BlIHRoYXQg
aXQgd2lsbCBiZSB1c2VmdWwsCisgKiBidXQgV0lUSE9VVCBBTlkgV0FSUkFOVFk7IHdpdGhvdXQg
ZXZlbiB0aGUgaW1wbGllZCB3YXJyYW50eSBvZgorICogTUVSQ0hBTlRBQklMSVRZIG9yIEZJVE5F
U1MgRk9SIEEgUEFSVElDVUxBUiBQVVJQT1NFLiAgU2VlIHRoZSBHTlUKKyAqIExlc3NlciBHZW5l
cmFsIFB1YmxpYyBMaWNlbnNlIGZvciBtb3JlIGRldGFpbHMuCisgKgorICogWW91IHNob3VsZCBo
YXZlIHJlY2VpdmVkIGEgY29weSBvZiB0aGUgR05VIExlc3NlciBHZW5lcmFsIFB1YmxpYworICog
TGljZW5zZSBhbG9uZyB3aXRoIHRoaXMgbGlicmFyeTsgSWYgbm90LCBzZWUgPGh0dHA6Ly93d3cu
Z251Lm9yZy9saWNlbnNlcy8+LgorICovCitwYWNrYWdlIHhlbmxpZ2h0CisKKy8qCisjY2dvIExE
RkxBR1M6IC1seGVubGlnaHQgLWx5YWpsIC1seGVudG9vbGxvZworI2luY2x1ZGUgPHN0ZGxpYi5o
PgorI2luY2x1ZGUgPGxpYnhsX3V0aWxzLmg+CisqLworaW1wb3J0ICJDIgorCitpbXBvcnQgKAor
CSJ1bnNhZmUiCispCisKKy8vY2hhciogbGlieGxfZG9taWRfdG9fbmFtZShsaWJ4bF9jdHggKmN0
eCwgdWludDMyX3QgZG9taWQpOworZnVuYyAoQ3R4ICpDb250ZXh0KSBEb21pZFRvTmFtZShpZCBE
b21pZCkgKG5hbWUgc3RyaW5nKSB7CisJY0RvbU5hbWUgOj0gQy5saWJ4bF9kb21pZF90b19uYW1l
KEN0eC5jdHgsIEMudWludDMyX3QoaWQpKQorCWRlZmVyIEMuZnJlZSh1bnNhZmUuUG9pbnRlcihj
RG9tTmFtZSkpCisKKwluYW1lID0gQy5Hb1N0cmluZyhjRG9tTmFtZSkKKwlyZXR1cm4KK30KKwor
Ly9pbnQgbGlieGxfbmFtZV90b19kb21pZChsaWJ4bF9jdCAqY3R4LCBjb25zdCBjaGFyICpuYW1l
LCB1aW50MzJfdCAqZG9taWQpCitmdW5jIChDdHggKkNvbnRleHQpIE5hbWVUb0RvbWlkKG5hbWUg
c3RyaW5nKSAoaWQgRG9taWQsIGVyciBlcnJvcikgeworCWNuYW1lIDo9IEMuQ1N0cmluZyhuYW1l
KQorCWRlZmVyIEMuZnJlZSh1bnNhZmUuUG9pbnRlcihjbmFtZSkpCisKKwl2YXIgY0RvbUlkIEMu
dWludDMyX3QKKworCXJldCA6PSBDLmxpYnhsX25hbWVfdG9fZG9taWQoQ3R4LmN0eCwgY25hbWUs
ICZjRG9tSWQpCisJaWYgcmV0ICE9IDAgeworCQllcnIgPSBFcnJvcigtcmV0KQorCQlyZXR1cm4K
Kwl9CisKKwlpZCA9IERvbWlkKGNEb21JZCkKKworCXJldHVybgorfQotLSAKMi4yMC4xCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
