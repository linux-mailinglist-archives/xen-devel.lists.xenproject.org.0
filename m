Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67D39139738
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jan 2020 18:12:00 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ir3Cz-0008Eq-NV; Mon, 13 Jan 2020 17:08:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=aHII=3C=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1ir3Cy-0008EJ-Ih
 for xen-devel@lists.xenproject.org; Mon, 13 Jan 2020 17:08:56 +0000
X-Inumbo-ID: 5c9ee418-3627-11ea-a2eb-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5c9ee418-3627-11ea-a2eb-bc764e2007e4;
 Mon, 13 Jan 2020 17:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1578935327;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=QeHPkOUBfk70JdbVTXptof0PmHLZHWYWptt6avVA7Sg=;
 b=fIlhzGao/DR48mEzXi0QPXGRtN5+ieIA0ordaVrzQonQYB7MA19ZuklP
 aTHRVZeoc6ZMoJWtZpE9om9PeQXdM6tNPrXn2xp7/Wr/b665NoBtwkblb
 XwpiDzaBC+BBrflJAkmSb75oqX5ZQLvSZYLwokTDtofn6HlmUITgThkPl A=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@eu.citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@eu.citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@eu.citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: FICjr7eLRS4XokLeFEdE6asDfkAHVzHp7LH1ajveyJTdB0hnhlfk40RhCO2b1a1jLGsaoKsqop
 L1aMzbs3OaCD3mPuEANeRG7xvT2EplVN016hFT8pRgep3c3y4vCbjnEu90AklQQDnqPiWagKQi
 Pvyzw50J5GzxQ1qpa0Js/hUbqSEEPXWzmZRI6xMLlpOOsdAIjXO9Ld+pi8qnJW18xy89p8wIKb
 uM0+B/C937WGGu1x4y6o+pNhvGp0/x4ZCyV3qn3Dw2VGm7ZG1n+hz4exnm4sbRniyxq3mCkCpm
 CTk=
X-SBRS: 2.7
X-MesageID: 11275255
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,429,1571716800"; d="scan'208";a="11275255"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 13 Jan 2020 17:08:34 +0000
Message-ID: <20200113170843.21332-2-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200113170843.21332-1-ian.jackson@eu.citrix.com>
References: <20200113170843.21332-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 01/10] libxl: event: Rename
 poller.fds_changed to .fds_deregistered
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
Cc: Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBpcyBvbmx5IGZvciBkZXJlZ2lzdHJhdGlvbi4gIFdlIGFyZSBnb2luZyB0byBhZGQgYW5v
dGhlciB2YXJpYWJsZQpmb3IgbmV3IGV2ZW50cywgd2l0aCBkaWZmZXJlbnQgc2VtYW50aWNzLCBh
bmQgdGhpcyBvdmVybHktZ2VuZXJhbCBuYW1lCndpbGwgYmVjb21lIGNvbmZ1c2luZy4KClNpZ25l
ZC1vZmYtYnk6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgotLS0KIHRv
b2xzL2xpYnhsL2xpYnhsX2V2ZW50LmMgICAgfCA4ICsrKystLS0tCiB0b29scy9saWJ4bC9saWJ4
bF9pbnRlcm5hbC5oIHwgNiArKystLS0KIDIgZmlsZXMgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCsp
LCA3IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnhsL2xpYnhsX2V2ZW50LmMg
Yi90b29scy9saWJ4bC9saWJ4bF9ldmVudC5jCmluZGV4IGFhOGI3ZDE5NDUuLjEyMTBjMWJmYjMg
MTAwNjQ0Ci0tLSBhL3Rvb2xzL2xpYnhsL2xpYnhsX2V2ZW50LmMKKysrIGIvdG9vbHMvbGlieGwv
bGlieGxfZXZlbnQuYwpAQCAtMjM5LDcgKzIzOSw3IEBAIHZvaWQgbGlieGxfX2V2X2ZkX2RlcmVn
aXN0ZXIobGlieGxfX2djICpnYywgbGlieGxfX2V2X2ZkICpldikKICAgICBldi0+ZmQgPSAtMTsK
IAogICAgIExJQlhMX0xJU1RfRk9SRUFDSChwb2xsZXIsICZDVFgtPnBvbGxlcnNfZmRzX2NoYW5n
ZWQsIGZkc19jaGFuZ2VkX2VudHJ5KQotICAgICAgICBwb2xsZXItPmZkc19jaGFuZ2VkID0gMTsK
KyAgICAgICAgcG9sbGVyLT5mZHNfZGVyZWdpc3RlcmVkID0gMTsKIAogIG91dDoKICAgICBDVFhf
VU5MT0NLOwpAQCAtMTEyMCw3ICsxMTIwLDcgQEAgc3RhdGljIGludCBiZWZvcmVwb2xsX2ludGVy
bmFsKGxpYnhsX19nYyAqZ2MsIGxpYnhsX19wb2xsZXIgKnBvbGxlciwKIAogICAgICpuZmRzX2lv
ID0gdXNlZDsKIAotICAgIHBvbGxlci0+ZmRzX2NoYW5nZWQgPSAwOworICAgIHBvbGxlci0+ZmRz
X2RlcmVnaXN0ZXJlZCA9IDA7CiAKICAgICBsaWJ4bF9fZXZfdGltZSAqZXRpbWUgPSBMSUJYTF9U
QUlMUV9GSVJTVCgmQ1RYLT5ldGltZXMpOwogICAgIGlmIChldGltZSkgewpAQCAtMTE4Niw3ICsx
MTg2LDcgQEAgc3RhdGljIGludCBhZnRlcnBvbGxfY2hlY2tfZmQobGlieGxfX3BvbGxlciAqcG9s
bGVyLAogICAgICAgICAgICAgLyogYWdhaW4sIHN0YWxlIHNsb3QgZW50cnkgKi8KICAgICAgICAg
ICAgIGNvbnRpbnVlOwogCi0gICAgICAgIGFzc2VydChwb2xsZXItPmZkc19jaGFuZ2VkIHx8ICEo
ZmRzW3Nsb3RdLnJldmVudHMgJiBQT0xMTlZBTCkpOworICAgICAgICBhc3NlcnQocG9sbGVyLT5m
ZHNfZGVyZWdpc3RlcmVkIHx8ICEoZmRzW3Nsb3RdLnJldmVudHMgJiBQT0xMTlZBTCkpOwogCiAg
ICAgICAgIC8qIHdlIG1hc2sgaW4gY2FzZSByZXF1ZXN0ZWQgZXZlbnRzIGhhdmUgY2hhbmdlZCAq
LwogICAgICAgICBpbnQgc2xvdF9yZXZlbnRzID0gZmRzW3Nsb3RdLnJldmVudHMgJiBldmVudHM7
CkBAIC0xNjI2LDcgKzE2MjYsNyBAQCBpbnQgbGlieGxfX3BvbGxlcl9pbml0KGxpYnhsX19nYyAq
Z2MsIGxpYnhsX19wb2xsZXIgKnApCiAgICAgaW50IHJjOwogICAgIHAtPmZkX3BvbGxzID0gMDsK
ICAgICBwLT5mZF9yaW5kaWNlcyA9IDA7Ci0gICAgcC0+ZmRzX2NoYW5nZWQgPSAwOworICAgIHAt
PmZkc19kZXJlZ2lzdGVyZWQgPSAwOwogCiAgICAgcmMgPSBsaWJ4bF9fcGlwZV9ub25ibG9jayhD
VFgsIHAtPndha2V1cF9waXBlKTsKICAgICBpZiAocmMpIGdvdG8gb3V0OwpkaWZmIC0tZ2l0IGEv
dG9vbHMvbGlieGwvbGlieGxfaW50ZXJuYWwuaCBiL3Rvb2xzL2xpYnhsL2xpYnhsX2ludGVybmFs
LmgKaW5kZXggYmE4YzliNDFhYi4uYzViNzFkMTVmMCAxMDA2NDQKLS0tIGEvdG9vbHMvbGlieGwv
bGlieGxfaW50ZXJuYWwuaAorKysgYi90b29scy9saWJ4bC9saWJ4bF9pbnRlcm5hbC5oCkBAIC02
MjksMTQgKzYyOSwxNCBAQCBzdHJ1Y3QgbGlieGxfX3BvbGxlciB7CiAgICAgLyoKICAgICAgKiBX
ZSBhbHNvIHVzZSB0aGUgcG9sbGVyIHRvIHJlY29yZCB3aGV0aGVyIGFueSBmZHMgaGF2ZSBiZWVu
CiAgICAgICogZGVyZWdpc3RlcmVkIHNpbmNlIHdlIGVudGVyZWQgcG9sbC4gIEVhY2ggcG9sbGVy
IHdoaWNoIGlzIG5vdAotICAgICAqIGlkbGUgaXMgb24gdGhlIGxpc3QgcG9sbGVyc19mZHNfY2hh
bmdlZC4gIGZkc19jaGFuZ2VkIGlzCisgICAgICogaWRsZSBpcyBvbiB0aGUgbGlzdCBwb2xsZXJz
X2Zkc19jaGFuZ2VkLiAgZmRzX2RlcmVnaXN0ZXJlZCBpcwogICAgICAqIGNsZWFyZWQgYnkgYmVm
b3JlcG9sbCwgYW5kIHRlc3RlZCBieSBhZnRlcnBvbGwuICBXaGVuZXZlciBhbiBmZAotICAgICAq
IGV2ZW50IGlzIGRlcmVnaXN0ZXJlZCwgd2Ugc2V0IHRoZSBmZHNfY2hhbmdlZCBvZiBhbGwgbm9u
LWlkbGUKKyAgICAgKiBldmVudCBpcyBkZXJlZ2lzdGVyZWQsIHdlIHNldCB0aGUgZmRzX2RlcmVn
aXN0ZXJlZCBvZiBhbGwgbm9uLWlkbGUKICAgICAgKiBwb2xsZXJzLiAgU28gYWZ0ZXJwb2xsIGNh
biB0ZWxsIHdoZXRoZXIgYW55IFBPTExOVkFMIGlzCiAgICAgICogcGxhdXNpYmx5IGR1ZSB0byBh
biBmZCBiZWluZyBjbG9zZWQgYW5kIHJlb3BlbmVkLgogICAgICAqLwogICAgIExJQlhMX0xJU1Rf
RU5UUlkobGlieGxfX3BvbGxlcikgZmRzX2NoYW5nZWRfZW50cnk7Ci0gICAgYm9vbCBmZHNfY2hh
bmdlZDsKKyAgICBib29sIGZkc19kZXJlZ2lzdGVyZWQ7CiB9OwogCiBzdHJ1Y3QgbGlieGxfX2dj
IHsKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
