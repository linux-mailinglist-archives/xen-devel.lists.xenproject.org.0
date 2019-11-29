Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0B6E10DA5F
	for <lists+xen-devel@lfdr.de>; Fri, 29 Nov 2019 21:03:35 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iamSB-0002Vb-Ev; Fri, 29 Nov 2019 20:01:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4Q2x=ZV=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1iamSA-0002VW-Hz
 for xen-devel@lists.xenproject.org; Fri, 29 Nov 2019 20:01:22 +0000
X-Inumbo-ID: 03880c86-12e3-11ea-a55d-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 03880c86-12e3-11ea-a55d-bc764e2007e4;
 Fri, 29 Nov 2019 20:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1575057682;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=HgyJk9By60I2lh833fhbGT9skP9PuWf811Ol7OJTQrE=;
 b=YCt+eJCL7dG1tVZi23dqPZb2FIPy7UPHgqKcIoFH4RUJzD+wk+wjwKgE
 iIlAgm+PzT4s+TOe5R+wWeUWIZZv+A92leivCnd0y+udhjkmcQvg2VO/L
 Z1v2daD/gXljASW2gMvpd7syRyVaja7PdjkiL8XYfw30j2mmxPw4va8hd E=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=igor.druzhinin@citrix.com;
 spf=Pass smtp.mailfrom=igor.druzhinin@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 igor.druzhinin@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 igor.druzhinin@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: vqgyLTwq8/8xw6GwI4CXnjyldr4kODJ3RoB/jdyaM2O7Vl+xoKwwLMlwPtQ2BPmDOFnPlsRivF
 23oAg5D63uaUcUonBOow481urlojM4jblGC50VRAk6uNVYyeuLdU0/T7duQI32sz8tnS14RMnO
 2yu6bKzxu/q9KRn1QRmYLMefEGaCIiDi4hhgL2rFNJo6IMzYdG93W4owWQCWon5TUg12WP+SBZ
 oroC9Gn/k+3MuDowQF2qgmo2NAY2ka9KNxRLmBCWcF8mK1HY8y2EW+pkS+Z6Geb4JPQTwqul6O
 7Q4=
X-SBRS: 2.7
X-MesageID: 9001948
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,258,1571716800"; 
   d="scan'208";a="9001948"
From: Igor Druzhinin <igor.druzhinin@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 29 Nov 2019 20:01:17 +0000
Message-ID: <1575057677-13839-1-git-send-email-igor.druzhinin@citrix.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH for-4.13] x86/AMD: unbreak CPU hotplug on AMD
 systems without RstrFpErrPtrs
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
Cc: andrew.cooper3@citrix.com, Igor Druzhinin <igor.druzhinin@citrix.com>,
 wl@xen.org, jbeulich@suse.com, roger.pau@citrix.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SWYgdGhlIGZlYXR1cmUgaXMgbm90IHByZXNlbnQgWGVuIHdpbGwgdHJ5IHRvIGZvcmNlIFg4Nl9C
VUdfRlBVX1BUUlMKZmVhdHVyZSBhdCBDUFUgaWRlbnRpZmljYXRpb24gdGltZS4gVGhpcyBpcyBl
c3BlY2lhbGx5IG5vdGljZWFibGUgaW4KUFYtc2hpbSB0aGF0IHVzdWFsbHkgaG90cGx1Z3MgaXRz
IHZDUFVzLiBXZSBlaXRoZXIgbmVlZCB0byByZXN0cmljdCB0aGlzCmFjdGlvbiBmb3IgYm9vdCBD
UFUgb25seSBvciBhbGxvdyBzZWNvbmRhcnkgQ1BVcyB0byBtb2RpZnkKZm9yY2VkIENQVSBjYXBh
YmlsaXRpZXMgYXQgcnVudGltZS4gQ2hvb3NlIHRoZSBsYXR0ZXIgYWNjb3VudGluZwpmb3IgcG90
ZW50aWFsIG1pY3JvY29kZSBhc3ltbWV0cnkgYmV0d2VlbiB0aGUgYm9vdCBhbmQgc2Vjb25kYXJ5
IENQVXMuCgpTaWduZWQtb2ZmLWJ5OiBJZ29yIERydXpoaW5pbiA8aWdvci5kcnV6aGluaW5AY2l0
cml4LmNvbT4KLS0tCkp1c3RpZmljYXRpb24gZm9yIDQuMTMgLSBQVi1zaGltIGlzIGVmZmVjdGl2
ZWx5IGJyb2tlbiBvbiBzdWNoIGEgc3lzdGVtLgotLS0KIHhlbi9hcmNoL3g4Ni9jcHUvY29tbW9u
LmMgfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2NwdS9jb21tb24uYyBiL3hlbi9hcmNoL3g4
Ni9jcHUvY29tbW9uLmMKaW5kZXggZTVhZDE3ZC4uNDI5MzA3NSAxMDA2NDQKLS0tIGEveGVuL2Fy
Y2gveDg2L2NwdS9jb21tb24uYworKysgYi94ZW4vYXJjaC94ODYvY3B1L2NvbW1vbi5jCkBAIC01
NCw3ICs1NCw3IEBAIHN0YXRpYyB1bnNpZ25lZCBpbnQgZm9yY2VkX2NhcHNbTkNBUElOVFNdOwog
CiBERUZJTkVfUEVSX0NQVShib29sLCBmdWxsX2dkdF9sb2FkZWQpOwogCi12b2lkIF9faW5pdCBz
ZXR1cF9jbGVhcl9jcHVfY2FwKHVuc2lnbmVkIGludCBjYXApCit2b2lkIHNldHVwX2NsZWFyX2Nw
dV9jYXAodW5zaWduZWQgaW50IGNhcCkKIHsKIAljb25zdCB1aW50MzJfdCAqZGZzOwogCXVuc2ln
bmVkIGludCBpOwpAQCAtODMsNyArODMsNyBAQCB2b2lkIF9faW5pdCBzZXR1cF9jbGVhcl9jcHVf
Y2FwKHVuc2lnbmVkIGludCBjYXApCiAJfQogfQogCi12b2lkIF9faW5pdCBzZXR1cF9mb3JjZV9j
cHVfY2FwKHVuc2lnbmVkIGludCBjYXApCit2b2lkIHNldHVwX2ZvcmNlX2NwdV9jYXAodW5zaWdu
ZWQgaW50IGNhcCkKIHsKIAlpZiAoX190ZXN0X2FuZF9zZXRfYml0KGNhcCwgZm9yY2VkX2NhcHMp
KQogCQlyZXR1cm47Ci0tIAoyLjcuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
