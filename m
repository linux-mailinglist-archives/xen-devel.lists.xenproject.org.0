Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3AA5F682A
	for <lists+xen-devel@lfdr.de>; Sun, 10 Nov 2019 10:28:51 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iTjTQ-0004Sn-KG; Sun, 10 Nov 2019 09:25:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=nPAK=ZC=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iTjTO-0004SW-Rn
 for xen-devel@lists.xenproject.org; Sun, 10 Nov 2019 09:25:30 +0000
X-Inumbo-ID: 0890c7dc-039c-11ea-b678-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0890c7dc-039c-11ea-b678-bc764e2007e4;
 Sun, 10 Nov 2019 09:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1573377928;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Vy946q6ELv6+e6EM5/tRPQSTbaba2GB+GQ1rRw6WjYI=;
 b=R80TPtydFIYyEQB9xkhIg4ipoD2Zn/ZXU/M5z91f3TnvRY9+yM2f05YZ
 bQTvaN26YOU8TQ9JvvjfOUcF7iLItRp+6dnkPdKzfoW08g+OTF9DnvOET
 SLv0kaY1lpzcwtCCqupI6dWm7nAAK0nkSHoyeXjvSUAG2eb8sSxyRKh39 I=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
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
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: E4XLLWzsG9OhkU5fCOohe78rDoOHxnWRLLhz/Q7Lo1+GbLF6QcmSyWLifVXvJ19qaH5lHUeH81
 xbzuSKaTQxPpiVcICgvlf+3s/gfV6Lks4ZGNgWoJ9J0cIpL6wgumII4qJkgRfRQP+/g4w24T2S
 OKxdsCH+oTZOhqN2w98Ssvu6R7s5beZKQ86Rr+a5BkB8T2Ti6UBXfceRO43xEHY/F0HiCU/KG9
 vd5I/KqT0ckf1XcKHVr/dI9JuHN+QaK+ukEyWC1gM0pEll+v/7B0OvRNipQNoizd84azdGy9CJ
 du0=
X-SBRS: 2.7
X-MesageID: 8515884
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,288,1569297600"; 
   d="scan'208";a="8515884"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Sun, 10 Nov 2019 10:25:06 +0100
Message-ID: <20191110092506.98925-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191110092506.98925-1-roger.pau@citrix.com>
References: <20191110092506.98925-1-roger.pau@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH for-4.13 v2 2/2] x86/ioapic: fix
 clear_IO_APIC_pin write of raw entries
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
Cc: Juergen Gross <jgross@suse.com>, Sergey
 Dyasli <sergey.dyasli@citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Y2xlYXJfSU9fQVBJQ19waW4gY2FuIGJlIGNhbGxlZCBhZnRlciB0aGUgaW9tbXUgaGFzIGJlZW4g
ZW5hYmxlZCwgYW5kCnVzaW5nIHJhdyByZWFkcyBhbmQgd3JpdGVzIHRvIG1vZGlmeSBJTy1BUElD
IGVudHJpZXMgdGhhdCBoYXZlIGJlZW4Kc2V0dXAgdG8gdXNlIGludGVycnVwdCByZW1hcHBpbmcg
Y2FuIGxlYWQgdG8gaXNzdWVzIGFzIHNvbWUgb2YgdGhlCmZpZWxkcyBoYXZlIGRpZmZlcmVudCBt
ZWFuaW5nIHdoZW4gdGhlIElPLUFQSUMgZW50cnkgaXMgc2V0dXAgdG8gcG9pbnQKdG8gYW4gaW50
ZXJydXB0IHJlbWFwcGluZyB0YWJsZSBlbnRyeS4KClRoZSBmb2xsb3dpbmcgQVNTRVJUIGluIEFN
RCBJT01NVSBjb2RlIHRyaWdnZXJzIGFmdGVyd2FyZHMgYXMgYSByZXN1bHQKb2YgdGhlIHJhdyBj
aGFuZ2VzIHRvIElPLUFQSUMgZW50cmllcyBwZXJmb3JtZWQgYnkgY2xlYXJfSU9fQVBJQ19waW4u
CgooWEVOKSBbICAgMTAuMDgyMTU0XSBFTkFCTElORyBJTy1BUElDIElSUXMKKFhFTikgWyAgIDEw
LjA4Nzc4OV0gIC0+IFVzaW5nIG5ldyBBQ0sgbWV0aG9kCihYRU4pIFsgICAxMC4wOTM3MzhdIEFz
c2VydGlvbiAnZ2V0X3J0ZV9pbmRleChydGUpID09IG9mZnNldCcgZmFpbGVkIGF0IGlvbW11X2lu
dHIuYzozMjgKCkZpeCB0aGlzIGJ5IG1ha2luZyBzdXJlIHRoYXQgbW9kaWZpY2F0aW9ucyB0byBl
bnRyaWVzIGFyZSBwZXJmb3JtZWQgaW4Kbm9uIHJhdyBtb2RlLgoKUmVwb3J0ZWQtYnk6IFNlcmdl
eSBEeWFzbGkgPHNlcmdleS5keWFzbGlAY2l0cml4LmNvbT4KU2lnbmVkLW9mZi1ieTogUm9nZXIg
UGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Ci0tLQpDYzogSnVlcmdlbiBHcm9zcyA8
amdyb3NzQHN1c2UuY29tPgotLS0KQ2hhbmdlcyBzaW5jZSB2MToKIC0gRG8gbm90IGNoYW5nZSBh
bGwgaW5zdGFuY2VzIG9mIHJhdyByZWFkcy4KIC0gRml4IGNvbW1pdCBtZXNzYWdlCi0tLQogeGVu
L2FyY2gveDg2L2lvX2FwaWMuYyB8IDUgKysrLS0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlv
bnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2lvX2FwaWMu
YyBiL3hlbi9hcmNoL3g4Ni9pb19hcGljLmMKaW5kZXggYjljNjZhY2RiMy4uNzMyYjU3OTk1YyAx
MDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L2lvX2FwaWMuYworKysgYi94ZW4vYXJjaC94ODYvaW9f
YXBpYy5jCkBAIC01MTksOCArNTE5LDkgQEAgc3RhdGljIHZvaWQgY2xlYXJfSU9fQVBJQ19waW4o
dW5zaWduZWQgaW50IGFwaWMsIHVuc2lnbmVkIGludCBwaW4pCiAgICAgaWYgKGVudHJ5Lmlycikg
ewogICAgICAgICAvKiBNYWtlIHN1cmUgdGhlIHRyaWdnZXIgbW9kZSBpcyBzZXQgdG8gbGV2ZWwu
ICovCiAgICAgICAgIGlmICghZW50cnkudHJpZ2dlcikgeworICAgICAgICAgICAgZW50cnkgPSBf
X2lvYXBpY19yZWFkX2VudHJ5KGFwaWMsIHBpbiwgZmFsc2UpOwogICAgICAgICAgICAgZW50cnku
dHJpZ2dlciA9IDE7Ci0gICAgICAgICAgICBfX2lvYXBpY193cml0ZV9lbnRyeShhcGljLCBwaW4s
IHRydWUsIGVudHJ5KTsKKyAgICAgICAgICAgIF9faW9hcGljX3dyaXRlX2VudHJ5KGFwaWMsIHBp
biwgZmFsc2UsIGVudHJ5KTsKICAgICAgICAgfQogICAgICAgICBfX2lvX2FwaWNfZW9pKGFwaWMs
IGVudHJ5LnZlY3RvciwgcGluKTsKICAgICB9CkBAIC01MzAsNyArNTMxLDcgQEAgc3RhdGljIHZv
aWQgY2xlYXJfSU9fQVBJQ19waW4odW5zaWduZWQgaW50IGFwaWMsIHVuc2lnbmVkIGludCBwaW4p
CiAgICAgICovCiAgICAgbWVtc2V0KCZlbnRyeSwgMCwgc2l6ZW9mKGVudHJ5KSk7CiAgICAgZW50
cnkubWFzayA9IDE7Ci0gICAgX19pb2FwaWNfd3JpdGVfZW50cnkoYXBpYywgcGluLCB0cnVlLCBl
bnRyeSk7CisgICAgX19pb2FwaWNfd3JpdGVfZW50cnkoYXBpYywgcGluLCBmYWxzZSwgZW50cnkp
OwogCiAgICAgZW50cnkgPSBfX2lvYXBpY19yZWFkX2VudHJ5KGFwaWMsIHBpbiwgdHJ1ZSk7CiAg
ICAgaWYgKGVudHJ5LmlycikKLS0gCjIuMjMuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
