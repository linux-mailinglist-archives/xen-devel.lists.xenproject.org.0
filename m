Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 460D8B782D
	for <lists+xen-devel@lfdr.de>; Thu, 19 Sep 2019 13:07:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAuFE-0003Fb-Ew; Thu, 19 Sep 2019 11:05:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=vwgP=XO=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1iAuFC-0003E2-17
 for xen-devel@lists.xenproject.org; Thu, 19 Sep 2019 11:05:02 +0000
X-Inumbo-ID: 4ad7a34c-dacd-11e9-978d-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4ad7a34c-dacd-11e9-978d-bc764e2007e4;
 Thu, 19 Sep 2019 11:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568891088;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fHoVEVSkXhSzI0FXEPwiA7EymZytSRCNOJViXlquIBY=;
 b=MvGmJiCCV6+p1Wa2XM7im2A/U3ONJxkDD1ZzLu/cb8k8PIlca888oiFX
 TW0iEarSA9yTph+7viH9dHpkeHbUyDMYbVc16WzDcm6UYABuEWTGM3M21
 k1n1bn4L8Eo+w4fxiK7pSZ5ih8TiKetm7s6HA8qJlayJJTSQTmOhFhEYb 8=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: b3mOAUbssE1nLUrHlgC6tF3e/1GbGZYplUh1f5b2WAR6Etw1u6qOEqeNWfXgq57nyJGKN1NE9I
 KZb6ZTpQLrV5AZx/cszib1024+LXc9kjYWNUOz7ymHqRoiwtsIWBAvn9FN4aNwOICv9zzrz0XD
 vu0nXgiK8Vdu4eCNeJSCpPieyuUrgJue9kt2e9JDHONreA7tFLVCxbdVrxIEF0sRHWcBf4fpMf
 /MYfHT2RBLFHxLAj/tN8KiOoMf/GOAG6//9V05Vl/wN/AuizgSRwVmXzs3IvLgf7TBd1AK8N90
 6+A=
X-SBRS: 2.7
X-MesageID: 5840081
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,523,1559534400"; 
   d="scan'208";a="5840081"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 19 Sep 2019 12:04:38 +0100
Message-ID: <20190919110443.817594-5-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190919110443.817594-1-anthony.perard@citrix.com>
References: <20190919110443.817594-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 4/9] libxl: Add optimisation to ev_lock
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
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SXQgd2lsbCBvZnRlbiBiZSB0aGUgY2FzZSB0aGF0IHRoZSBsb2NrIGlzIGZyZWUgdG8gZ3JhYi4g
U28gd2UgZmlyc3QKdHJ5IHRvIGdyYWIgaXQgYmVmb3JlIHdlIGhhdmUgdG8gZm9yay4gRXZlbiB0
aG91Z2ggaW4gdGhpcyBjYXNlIHRoZQpsb2NrcyBhcmUgZ3JhYmJlZCBpbiB0aGUgd3Jvbmcgb3Jk
ZXIgaW4gdGhlIGxvY2sgaGllcmFyY2h5IChldl9sb2NrCnNob3VsZCBiZSBvdXRzaWRlIG9mIENU
WF9MT0NLKSwgaXQgaXMgZmluZSB0byB0cnkgd2l0aG91dCBibG9ja2luZy4gSWYKdGhhdCBmYWls
ZWQsIHdlIHdpbGwgcmVsZWFzZSBDVFhfTE9DSyBhbmQgdHJ5IHRvIGdyYWIgYm90aCBsb2NrIGFn
YWluCmluIHRoZSByaWdodCBvcmRlci4KClRoYXQgb3B0aW1pc2F0aW9uIGlzIG9ubHkgZW5hYmxl
ZCBpbiByZWxlYXNlcyAoZGVidWc9bikgc28gdGhlIG1vcmUKY29tcGxpY2F0ZWQgY29kZSB3aXRo
IGZvcmsgaXMgYWN0dWFsbHkgZXhlcmNpc2VkLgoKU2lnbmVkLW9mZi1ieTogQW50aG9ueSBQRVJB
UkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+CkFja2VkLWJ5OiBJYW4gSmFja3NvbiA8aWFu
LmphY2tzb25AZXUuY2l0cml4LmNvbT4KLS0tCgpOb3RlczoKICAgIHYyOgogICAgLSBuZXcgcGF0
Y2gKCiB0b29scy9saWJ4bC9NYWtlZmlsZSAgICAgICAgIHwgIDMgKysrCiB0b29scy9saWJ4bC9s
aWJ4bF9pbnRlcm5hbC5jIHwgMTkgKysrKysrKysrKysrKysrKysrKwogMiBmaWxlcyBjaGFuZ2Vk
LCAyMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvdG9vbHMvbGlieGwvTWFrZWZpbGUgYi90
b29scy9saWJ4bC9NYWtlZmlsZQppbmRleCA2ZmRjYmJkZGQ2YjYuLjQ1ODdhNmZjOWM2NSAxMDA2
NDQKLS0tIGEvdG9vbHMvbGlieGwvTWFrZWZpbGUKKysrIGIvdG9vbHMvbGlieGwvTWFrZWZpbGUK
QEAgLTM1LDYgKzM1LDkgQEAgaWZlcSAoJChDT05GSUdfTElCTkwpLHkpCiBDRkxBR1NfTElCWEwg
Kz0gJChMSUJOTDNfQ0ZMQUdTKQogZW5kaWYKIENGTEFHU19MSUJYTCArPSAtV3NoYWRvdworaWZl
cSAoJChkZWJ1ZykseSkKK0NGTEFHU19MSUJYTCArPSAtRENPTkZJR19ERUJVRworZW5kaWYKIAog
TElCWExfTElCUy0kKENPTkZJR19BUk0pICs9IC1sZmR0CiAKZGlmZiAtLWdpdCBhL3Rvb2xzL2xp
YnhsL2xpYnhsX2ludGVybmFsLmMgYi90b29scy9saWJ4bC9saWJ4bF9pbnRlcm5hbC5jCmluZGV4
IDI4YTEyNmNjYzM0Mi4uYTdhNGQ1NDZjNDdhIDEwMDY0NAotLS0gYS90b29scy9saWJ4bC9saWJ4
bF9pbnRlcm5hbC5jCisrKyBiL3Rvb2xzL2xpYnhsL2xpYnhsX2ludGVybmFsLmMKQEAgLTYyMCw2
ICs2MjAsMjUgQEAgc3RhdGljIHZvaWQgZXZfbG9ja19wcmVwYXJlX2ZvcmsobGlieGxfX2VnYyAq
ZWdjLCBsaWJ4bF9fZXZfZGV2bG9jayAqbG9jaykKICAgICB9CiAgICAgZmQgPSBsb2NrLT5mZDsK
IAorICAgIC8qIEVuYWJsZSB0aGlzIG9wdGltaXNhdGlvbiBvbmx5IGluIHJlbGVhc2VzLCBzbyB0
aGUgZm9yayBjb2RlIGlzCisgICAgICogZXhlcmNpc2VkIHdoaWxlIGxpYnhsIGlzIGJ1aWx0IHdp
dGggZGVidWc9eS4gKi8KKyNpZm5kZWYgQ09ORklHX0RFQlVHCisgICAgLyoKKyAgICAgKiBXZSB0
cnkgdG8gZ3JhYiB0aGUgbG9jayBiZWZvcmUgZm9ya2luZyBhcyBpdCBpcyBsaWtlbHkgdG8gYmUg
ZnJlZS4KKyAgICAgKiBFdmVuIHRob3VnaCB3ZSBhcmUgc3VwcG9zZWQgdG8gQ1RYX1VOTE9DSyBi
ZWZvcmUgYXR0ZW1wdGluZyB0byBncmFiCisgICAgICogdGhlIGV2X2xvY2ssIGl0IGlzIGZpbmUg
dG8gZG8gYSBub24tYmxvY2tpbmcgcmVxdWVzdCBub3cgd2l0aCB0aGUKKyAgICAgKiBDVFhfTE9D
SyBoZWxkIGFzIGlmIHRoYXQgZmFpbHMgd2UnbGwgdHJ5IGFnYWluIGluIGEgZm9yayAoQ1RYX1VO
TE9DSworICAgICAqIHdpbGwgYmUgY2FsbGVkIGluIGxpYnhsKSwgdGhhdCB3aWxsIGF2b2lkIGRl
YWRsb2Nrcy4KKyAgICAgKi8KKyAgICBpbnQgciA9IGZsb2NrKGZkLCBMT0NLX0VYIHwgTE9DS19O
Qik7CisgICAgaWYgKCFyKSB7CisgICAgICAgIGxpYnhsX2ZkX3NldF9jbG9leGVjKENUWCwgZmQs
IDEpOworICAgICAgICAvKiBXZSBoZWxkIGEgbG9jaywgbm8gbmVlZCB0byBmb3JrIGJ1dCB3ZSBu
ZWVkIHRvIGNoZWNrIGl0LiAqLworICAgICAgICBldl9sb2NrX2NoaWxkX2NhbGxiYWNrKGVnYywg
JmxvY2stPmNoaWxkLCAwLCAwKTsKKyAgICAgICAgcmV0dXJuOworICAgIH0KKyNlbmRpZgorCiAg
ICAgcGlkID0gbGlieGxfX2V2X2NoaWxkX2ZvcmsoZ2MsICZsb2NrLT5jaGlsZCwgZXZfbG9ja19j
aGlsZF9jYWxsYmFjayk7CiAgICAgaWYgKHBpZCA8IDApCiAgICAgICAgIGdvdG8gb3V0OwotLSAK
QW50aG9ueSBQRVJBUkQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
