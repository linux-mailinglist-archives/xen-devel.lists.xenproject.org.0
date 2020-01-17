Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F085140D03
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jan 2020 15:49:45 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1isSuS-0003TW-To; Fri, 17 Jan 2020 14:47:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zPxh=3G=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1isSuR-0003TR-O2
 for xen-devel@lists.xenproject.org; Fri, 17 Jan 2020 14:47:39 +0000
X-Inumbo-ID: 4b4f6b24-3938-11ea-b549-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4b4f6b24-3938-11ea-b549-12813bfff9fa;
 Fri, 17 Jan 2020 14:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579272454;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=OvQk6AzAhMJpVbm3kK2nooKXqh7MTITYD+jYcb8yzqw=;
 b=Z3Q0/ntMU1ROJuF7pwrkz4dM/qIPal5QkGqMoHDyJB7e1tIJOnXTNDMH
 i6zUgat7SrdYipNFo5+DMP9UNpwhneZnyeMRGuDPsspjN1eKK+yoWDRBc
 VrVQUgKdZUnCimDQIm5A29TSGiHybC8lrigrwAq93DLsXPIpRczEBJAQK 0=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: FGo5b86+kFpyu2fW9UerhDyt/pG4GHLprcvcp9FRbuhQXl2vhP8e1PRczuXgt7FphRREPOg8j+
 dZC8OySlWEClcCJnjKPQKE3DDm+1T9qW8J10u7khaJ53H01zsUAIVA6ZeC3pllqSQ73px1S+/K
 x5KWZvGMf0+RwevEN+WXnTG80iQ3Pyf6YQ1v9IMtT2JbfaDu0hWDA7ZEOtUwzPIbE4NluYddrO
 8kSkXzVLlX+Lowhw7UGDcvwh2h7CVBCtJIUHwz6JCC5f86Pk5Qlr/OMWLw+FhkLRSqU6hRMekU
 898=
X-SBRS: 2.7
X-MesageID: 11068798
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,330,1574139600"; d="scan'208";a="11068798"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 17 Jan 2020 14:47:16 +0000
Message-ID: <20200117144726.582-1-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 00/10] libxl: event: Fix hang for some
 applications
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
IGNhbGxzCgpUaGlzIGlzIGFsbCBub3cgUmV2aWV3ZWQtYnkgYW5kIFRlc3RlZC1ieSBHZW9yZ2Us
IHNvIGl0IGlzIHJlYWR5IHRvIGJlCmNvbW1pdHRlZC4gIEJ1dCBJIHdpbGwgYmUgYXdheSBmb3Ig
YSBiaXQgc29vbiBhbmQgcmV2ZXJ0aW5nIHNvbWV0aGluZwpvZiB0aGlzIGZvcm0gaXMgcHJvYmFi
bHkgdW5kZXNpcmFibGUuICBTbyBJIHdpbGwgY29tbWl0IHRoaXMgaW4Kc29tZXRoaW5nIG92ZXIg
YSB3ZWVrIChhc3N1bWluZyBubyBmdXJ0aGVyIGNvbW1lbnRzIGFyaXNlKS4KClRoZSBjaGFuZ2Vz
IGhlcmUgZnJvbSB2MiBhcmUgb25seSB0byB0d28gb2YgdGhlIGNvbW1pdCBtZXNzYWdlcwoobWFy
a2VkIG0gaW4gdGhlIGxpc3QgYmVsb3cpLgoKSSBhbSBub3Qgc3VyZSB3aGV0aGVyIHRoaXMgc2Vy
aWVzIGlzIGEgYmFja3BvcnQgY2FuZGlkYXRlLiAgSXQgaXMgbm90CmltcG9zc2libGUgdGhhdCB0
aGUgYnVnIHdlIGFyZSBmaXhpbmcgaGVyZSBpcyBhZmZlY3RpbmcgKHNheSkgbGlidmlydC4KQnV0
IGlmIHNvIHByZXN1bWFibHkgbm90IGluIGEgc2lnbmlmaWNhbnQgd2F5IGFzIHdlIGhhdmVuJ3Qg
c2VlbgpyZXBvcnRzLiAgU28gZXZlbiB0aG91Z2ggdGhpcyBpcyBhIGJ1Z2ZpeCwgSSdtIHNjZXB0
aWNhbC4KCklhbiBKYWNrc29uICgxMCk6CiAgIGxpYnhsOiBldmVudDogUmVuYW1lIHBvbGxlci5m
ZHNfY2hhbmdlZCB0byAuZmRzX2RlcmVnaXN0ZXJlZAogICBsaWJ4bDogZXZlbnQ6IFJlbmFtZSBj
dHgucG9sbGVyc19mZF9jaGFuZ2VkIHRvIC5wb2xsZXJzX2FjdGl2ZQogICBsaWJ4bDogZXZlbnQ6
IEludHJvZHVjZSBDVFhfVU5MT0NLX0VHQ19GUkVFCiAgIGxpYnhsOiBldmVudDogTWFrZSBMSUJY
TF9fRVZFTlRfRElTQVNURVIgdGFrZSBhIGdjLCBub3QgYW4gZWdjCiBtIGxpYnhsOiBldmVudDog
TWFrZSBsaWJ4bF9fcG9sbGVyX3dha2V1cCB0YWtlIGEgZ2MsIG5vdCBhbiBlZ2MKICAgbGlieGw6
IGV2ZW50OiBGaXggaGFuZyB3aGVuIG1peGluZyBibG9ja2luZyBhbmQgZXZlbnR5IGNhbGxzCiAg
IGxpYnhsOiBldmVudDogcG9sbGVyIHBpcGUgb3B0aW1pc2F0aW9uCiAgIGxpYnhsOiBldmVudDog
QnJlYWsgb3V0IGJhdG9uX3dha2UKICAgbGlieGw6IGV2ZW50OiBGaXggcG9zc2libGUgaGFuZyB3
aXRoIGxpYnhsX29zZXZlbnRfYmVmb3JlcG9sbAogbSBsaWJ4bDogZXZlbnQ6IE1vdmUgcG9sbGVy
IHBpcGUgZW1wdHlpbmcgdG8gdGhlIGVuZCBvZiBhZnRlcnBvbGwKCiB0b29scy9saWJ4bC9saWJ4
bC5jICAgICAgICAgIHwgICA0ICstCiB0b29scy9saWJ4bC9saWJ4bF9hb3V0aWxzLmMgIHwgICAy
ICstCiB0b29scy9saWJ4bC9saWJ4bF9kaXNrLmMgICAgIHwgICA0ICstCiB0b29scy9saWJ4bC9s
aWJ4bF9kb21haW4uYyAgIHwgICAyICstCiB0b29scy9saWJ4bC9saWJ4bF9ldmVudC5jICAgIHwg
Mjg2ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0KIHRvb2xzL2xp
YnhsL2xpYnhsX2ZvcmsuYyAgICAgfCAgMTcgKystCiB0b29scy9saWJ4bC9saWJ4bF9pbnRlcm5h
bC5oIHwgIDU0ICsrKysrLS0tCiA3IGZpbGVzIGNoYW5nZWQsIDI5MCBpbnNlcnRpb25zKCspLCA3
OSBkZWxldGlvbnMoLSkKCi0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
