Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48965B804D
	for <lists+xen-devel@lfdr.de>; Thu, 19 Sep 2019 19:44:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iB0QD-0004Ax-J8; Thu, 19 Sep 2019 17:40:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=vwgP=XO=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1iB0QC-0004Ac-4N
 for xen-devel@lists.xenproject.org; Thu, 19 Sep 2019 17:40:48 +0000
X-Inumbo-ID: 98c493f8-db04-11e9-b299-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 98c493f8-db04-11e9-b299-bc764e2007e4;
 Thu, 19 Sep 2019 17:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568914840;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=a9J09fdodeDSbFx/jslZyCcYyIiZk3yNPrVs1emhmHk=;
 b=Qxocw1Vmxaxxg7NnH6g5KoZLRtBgVCEiI9qRhX4dhVkG74+dmvbhKGrb
 Ei02G0zye4j3KMchFjvZKiXAFAC8rQ0trC/SViUdQfzjFE1TeHVKMfV47
 l6wiUCWSeesksTFyOiA/WfIDsbPYiMBTeVhe9nQyrC+4xRiZQuacAyLak c=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: fQ73rtjWQQcMhAZL/ih9nyDmAFf7j2gaEuyXRs+TKF+XPB3laAk0XE5zdALZGWzv72EkDajHOx
 5G/sakTXh/QjLtXCk8PHBFybYVSFtgKN/AF6CLHRTzoeN+/b8JHpOlzyxGQsb/rHDSPThPs2Tp
 pGuw3WDh/4W58RBj5/F45IeE+sNECOV7ajYxximJLXK9XE9B4Sh0oR505fYT/fN6DJb0MyDB5u
 Slxh7bX6YIDG/pFa2H82oiGKZewr6BCT2TH+EEEm1sUUlqYVZBbEqWTIiZEbx6pm8z9bePSyWF
 pCk=
X-SBRS: 2.7
X-MesageID: 5801743
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,524,1559534400"; 
   d="scan'208";a="5801743"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 19 Sep 2019 18:16:46 +0100
Message-ID: <20190919171656.899649-27-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190919171656.899649-1-anthony.perard@citrix.com>
References: <20190919171656.899649-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 26/35] libxl_pci: Only check if qemu-dm is
 running in qemu-trad case
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
Cc: Anthony PERARD <anthony.perard@citrix.com>, Ian
 Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UUVNVSB1cHN0cmVhbSAob3IgcWVtdS14ZW4pIG1heSBub3QgaGF2ZSBzZXQgInJ1bm5pbmciIHN0
YXRlIGluCnhlbnN0b3JlLiAicnVubmluZyIgd2l0aCBRRU1VIGRvZXNuJ3QgbWVhbiB0aGF0IHRo
ZSBiaW5hcnkgaXMKcnVubmluZywgaXQgbWVhbnMgdGhhdCB0aGUgZW11bGF0aW9uIGhhdmUgc3Rh
cnRlZC4gV2hlbiBhZGRpbmcgYQpwY2ktcGFzc3Rocm91Z2ggZGV2aWNlIHRvIFFFTVUsIHdlIGRv
IHNvIHZpYSBRTVAsIHdlIGhhdmUgYSBkaXJlY3QKYW5zd2VyIHRvIHdoZXRoZXIgUUVNVSBpcyBy
dW5uaW5nIG9yIG5vdCwgbm8gbmVlZCB0byBjaGVjayBhaGVhZC4KCk1vdmluZyB0aGUgY2hlY2sg
dG8gZG8gaXQgb25seSB3aXRoIHFlbXUtdHJhZCBtYWtlcyB1cGNvbWluZyBjaGFuZ2VzCnNpbXBs
ZXIuCgpTaWduZWQtb2ZmLWJ5OiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4
LmNvbT4KQWNrZWQtYnk6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgot
LS0KIHRvb2xzL2xpYnhsL2xpYnhsX3BjaS5jIHwgMTcgKysrKysrKystLS0tLS0tLS0KIDEgZmls
ZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
dG9vbHMvbGlieGwvbGlieGxfcGNpLmMgYi90b29scy9saWJ4bC9saWJ4bF9wY2kuYwppbmRleCBi
OWNhNjlmNWYwYjMuLjA3MTg4MGI4NTU2YiAxMDA2NDQKLS0tIGEvdG9vbHMvbGlieGwvbGlieGxf
cGNpLmMKKysrIGIvdG9vbHMvbGlieGwvbGlieGxfcGNpLmMKQEAgLTEwMDQsMTMgKzEwMDQsMTMg
QEAgc3RhdGljIGludCBkb19wY2lfYWRkKGxpYnhsX19nYyAqZ2MsIHVpbnQzMl90IGRvbWlkLAog
CiAgICAgaWYgKHR5cGUgPT0gTElCWExfRE9NQUlOX1RZUEVfSFZNKSB7CiAgICAgICAgIGh2bSA9
IDE7Ci0gICAgICAgIGlmIChsaWJ4bF9fd2FpdF9mb3JfZGV2aWNlX21vZGVsX2RlcHJlY2F0ZWQo
Z2MsIGRvbWlkLCAicnVubmluZyIsCi0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIE5VTEwsIE5VTEwsIE5VTEwpIDwgMCkgewotICAgICAgICAgICAgcmMgPSBFUlJPUl9G
QUlMOwotICAgICAgICAgICAgZ290byBvdXQ7Ci0gICAgICAgIH0KICAgICAgICAgc3dpdGNoIChs
aWJ4bF9fZGV2aWNlX21vZGVsX3ZlcnNpb25fcnVubmluZyhnYywgZG9taWQpKSB7CiAgICAgICAg
ICAgICBjYXNlIExJQlhMX0RFVklDRV9NT0RFTF9WRVJTSU9OX1FFTVVfWEVOX1RSQURJVElPTkFM
OgorICAgICAgICAgICAgICAgIGlmIChsaWJ4bF9fd2FpdF9mb3JfZGV2aWNlX21vZGVsX2RlcHJl
Y2F0ZWQoZ2MsIGRvbWlkLAorICAgICAgICAgICAgICAgICAgICAgICAgInJ1bm5pbmciLCBOVUxM
LCBOVUxMLCBOVUxMKSA8IDApIHsKKyAgICAgICAgICAgICAgICAgICAgcmMgPSBFUlJPUl9GQUlM
OworICAgICAgICAgICAgICAgICAgICBnb3RvIG91dDsKKyAgICAgICAgICAgICAgICB9CiAgICAg
ICAgICAgICAgICAgcmMgPSBxZW11X3BjaV9hZGRfeGVuc3RvcmUoZ2MsIGRvbWlkLCBwY2lkZXYp
OwogICAgICAgICAgICAgICAgIGJyZWFrOwogICAgICAgICAgICAgY2FzZSBMSUJYTF9ERVZJQ0Vf
TU9ERUxfVkVSU0lPTl9RRU1VX1hFTjoKQEAgLTEzOTUsMTIgKzEzOTUsMTEgQEAgc3RhdGljIGlu
dCBkb19wY2lfcmVtb3ZlKGxpYnhsX19nYyAqZ2MsIHVpbnQzMl90IGRvbWlkLAogICAgIHJjID0g
RVJST1JfRkFJTDsKICAgICBpZiAodHlwZSA9PSBMSUJYTF9ET01BSU5fVFlQRV9IVk0pIHsKICAg
ICAgICAgaHZtID0gMTsKLSAgICAgICAgaWYgKGxpYnhsX193YWl0X2Zvcl9kZXZpY2VfbW9kZWxf
ZGVwcmVjYXRlZChnYywgZG9taWQsICJydW5uaW5nIiwKLSAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgTlVMTCwgTlVMTCwgTlVMTCkgPCAwKQotICAgICAgICAgICAgZ290
byBvdXRfZmFpbDsKLQogICAgICAgICBzd2l0Y2ggKGxpYnhsX19kZXZpY2VfbW9kZWxfdmVyc2lv
bl9ydW5uaW5nKGdjLCBkb21pZCkpIHsKICAgICAgICAgY2FzZSBMSUJYTF9ERVZJQ0VfTU9ERUxf
VkVSU0lPTl9RRU1VX1hFTl9UUkFESVRJT05BTDoKKyAgICAgICAgICAgIGlmIChsaWJ4bF9fd2Fp
dF9mb3JfZGV2aWNlX21vZGVsX2RlcHJlY2F0ZWQoZ2MsIGRvbWlkLAorICAgICAgICAgICAgICAg
ICAgICAicnVubmluZyIsIE5VTEwsIE5VTEwsIE5VTEwpIDwgMCkKKyAgICAgICAgICAgICAgICBn
b3RvIG91dF9mYWlsOwogICAgICAgICAgICAgcmMgPSBxZW11X3BjaV9yZW1vdmVfeGVuc3RvcmUo
Z2MsIGRvbWlkLCBwY2lkZXYsIGZvcmNlKTsKICAgICAgICAgICAgIGJyZWFrOwogICAgICAgICBj
YXNlIExJQlhMX0RFVklDRV9NT0RFTF9WRVJTSU9OX1FFTVVfWEVOOgotLSAKQW50aG9ueSBQRVJB
UkQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
