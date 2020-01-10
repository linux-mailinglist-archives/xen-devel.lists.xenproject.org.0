Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 677CA136E1A
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jan 2020 14:31:26 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipuLf-0001yM-9H; Fri, 10 Jan 2020 13:29:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0O1r=27=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1ipuLd-0001yH-Jd
 for xen-devel@lists.xenproject.org; Fri, 10 Jan 2020 13:29:09 +0000
X-Inumbo-ID: 2de1f9fc-33ad-11ea-bf0f-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2de1f9fc-33ad-11ea-bf0f-12813bfff9fa;
 Fri, 10 Jan 2020 13:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1578662949;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=6G7vPLriAedPyky35mv96xuKS66vJfO52LVZrQ4s+M4=;
 b=Bzc3ZpIvJztUYP4sDP3M3030vPkMua339gA8NhvWX5kQ1/BlgOfFSxB8
 SSFNC25WQpzf99j0ONBFA5x1AenuYRI/ubhr3OnCCjCkr9lgIQwbsnEKU
 tZB8weMqzAZRr+KZhkTAZDOfeIVt/MfrWDdoezlmDBhNlfY5yYpC6YmXB s=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@eu.citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@eu.citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@eu.citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
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
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: rM29Q5+EKNxx02t9qlKNzFLwR9xPqzoDRHqZj4bWYfpdQBPiwrGMWcbmVxametdqpKVdRsa91i
 UaMABYv8w/W2byq5uxCvTcy7rqXHkjjnGleGDhGxyLmIHYoMCO/RYI15SF6EHXBZpfpUUjGwke
 RIzm0vzDN//gLiKGXC5w4KW8/NLma7tngWaApfZoM9fxX14zeUyiAP4cmw9Q2UkdIJS1E//SUS
 bltY8J8l57lYMC8UTvzIA74s+nIsGG+GOQZVqd7FMQi4xwJOnivvYBQIll0jihfrZCjntTY1NG
 A9o=
X-SBRS: 2.7
X-MesageID: 10756440
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,417,1571716800"; d="scan'208";a="10756440"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 10 Jan 2020 13:28:54 +0000
Message-ID: <20200110132902.29295-1-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 0/8] libxl: event: Fix hang for some applications
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
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIG1lYXQgaGVyZSwgaW5jbHVkaW5nIGEgZGVzY3JpcHRpb24gb2YgdGhlIGJ1ZywgaXMgaW46
CiAgbGlieGw6IGV2ZW50OiBGaXggaGFuZyB3aGVuIG1peGluZyBibG9ja2luZyBhbmQgZXZlbnR5
IGNhbGxzCgpJIGhhdmUgY29tcGlsZWQgdGhpcyBidXQgbm90IHRlc3RlZCBpdC4gIFdlIGRvIG5v
dCBoYXZlIGEgZ29vZCB0ZXN0CnN1aXRlIGZvciB0aGlzIGV2ZW50IHN0dWZmLiAgKEFuZCByYWNl
cyBldGMgYXJlIGhhcmQgdG8gdGVzdC4pCkdlb3JnZSwgY2FuIHlvdSBjaGVjayB0byBzZWUgd2hl
dGhlciBpdCBmaXhlcyB0aGUgaXNzdWUgeW91IHNhdyA/CgpJZiBzbyB0aGVuIEkgc3VnZ2VzdCB3
ZSB0cnkgdG8gY29udmluY2Ugb3Vyc2VsdmVzIG9mIGl0cyBjb3JyZWN0bmVzcwp2aWEgYSBzZWNv
bmQgcm91bmQgb2YgY29kZSByZXZpZXcuICBJIHdpbGwgY2VydGFpbmx5IHdhbnQgdG8gcmVhZCBp
dAphbGwgYWdhaW4gYWZ0ZXIgdGhlIHdlZWtlbmQsIHNpbmNlIHRoZW4gSSB3aWxsIGhvcGVmdWxs
eSBoYXZlCmZvcmdvdHRlbiBlbm91Z2ggYWJvdXQgdGhpcyB0byBtYWtlIHRoYXQgYSB3b3J0aHdo
aWxlIGV4ZXJjaXNlLgoKSWFuIEphY2tzb24gKDgpOgogIGxpYnhsOiBldmVudDogUmVuYW1lIHBv
bGxlci5mZHNfY2hhbmdlZCB0byAuZmRzX2RlcmVnaXN0ZXJlZAogIGxpYnhsOiBldmVudDogUmVu
YW1lIGN0eC5wb2xsZXJzX2ZkX2NoYW5nZWQgdG8gLnBvbGxlcnNfYWN0aXZlCiAgbGlieGw6IGV2
ZW50OiBJbnRyb2R1Y2UgQ1RYX1VOTE9DS19FR0NfRlJFRQogIGxpYnhsOiBldmVudDogRml4IGhh
bmcgd2hlbiBtaXhpbmcgYmxvY2tpbmcgYW5kIGV2ZW50eSBjYWxscwogIGxpYnhsOiBldmVudDog
cG9sbGVyIHBpcGUgb3B0aW1pc2F0aW9uCiAgbGlieGw6IGV2ZW50OiBCcmVhayBvdXQgYmF0b25f
d2FrZQogIGxpYnhsOiBldmVudDogRml4IHBvc3NpYmxlIGhhbmcgd2l0aCBsaWJ4bF9vc2V2ZW50
X2JlZm9yZXBvbGwKICBsaWJ4bDogZXZlbnQ6IE1vdmUgcG9sbGVyIHBpcGUgZW1wdHlpbmcgdG8g
dGhlIGVuZCBvZiBhZnRlcnBvbGwKCiB0b29scy9saWJ4bC9saWJ4bC5jICAgICAgICAgIHwgICA0
ICstCiB0b29scy9saWJ4bC9saWJ4bF9ldmVudC5jICAgIHwgMTI2ICsrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0KIHRvb2xzL2xpYnhsL2xpYnhsX2ZvcmsuYyAgICAg
fCAgIDYgKy0tCiB0b29scy9saWJ4bC9saWJ4bF9pbnRlcm5hbC5oIHwgIDQyICsrKysrKysrKysr
LS0tLQogNCBmaWxlcyBjaGFuZ2VkLCAxMjcgaW5zZXJ0aW9ucygrKSwgNTEgZGVsZXRpb25zKC0p
CgotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
