Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 739E810D4E7
	for <lists+xen-devel@lfdr.de>; Fri, 29 Nov 2019 12:32:35 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iaeSy-0006qN-51; Fri, 29 Nov 2019 11:29:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=YUI4=ZV=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iaeSw-0006qG-Rk
 for xen-devel@lists.xenproject.org; Fri, 29 Nov 2019 11:29:38 +0000
X-Inumbo-ID: 8615b07e-129b-11ea-a3e3-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8615b07e-129b-11ea-a3e3-12813bfff9fa;
 Fri, 29 Nov 2019 11:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1575026978;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XUYFi2R2qXQsUBynqEbA0UN2CXp44zL7+ww6QKkSEyY=;
 b=FXKvS/emJXthtKGMyAGAndxvP7PM6zmozaq0d75gt6yeFPMlFcc0mj9q
 vipUCW4SaRAMLM3CdTQkah5reDXm1dQmMd9dod0btmExiUkoUuB32nRh1
 bqFnZ2D6yZ/Y1XkHFh1qvvU8R6zMwFLIjVBOhe9l1WjmbopU1PWw9ETtb 4=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: zrdiOabcACzS85etsYCph7G63eKZAhY37Mh05bDtkSNhvDVpfeODCdiL5PFQMGln5/Dj/2toBU
 RmKlGtY56Ax9TN6+oLIm6JPTq5ou1WekGWi8/TnB7lB5xl2fxfndSjsnvzvMlog+Yh4fJavzI9
 Zaya4HabWD39jAJGoAT+oOunvHFygja3y8DVHI7G1eZe/JIvKlPmOmrzA/8/MXEaUPxNHt5lrK
 DR76uzA4jYEFlHI23QAG10Ux1oIKFWcHqhI83Ubhrf32M6H/pB7+rw125RECrmgRLfQQVZqN7H
 XEM=
X-SBRS: 2.7
X-MesageID: 9108564
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,257,1571716800"; 
   d="scan'208";a="9108564"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 29 Nov 2019 12:28:48 +0100
Message-ID: <20191129112851.19273-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191129112851.19273-1-roger.pau@citrix.com>
References: <20191129112851.19273-1-roger.pau@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 1/4] x86/ioapic: only use dest32 with x2apic
 and interrupt remapping enabled
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIElPLUFQSUMgY29kZSBhc3N1bWVzIHRoYXQgeDJhcGljIGJlaW5nIGVuYWJsZWQgYWxzbyBp
bXBsaWVzCmludGVycnVwdCByZW1hcHBpbmcgYmVpbmcgZW5hYmxlZCwgYW5kIGhlbmNlIHdpbGwg
dXNlIHRoZSAzMmJpdApkZXN0aW5hdGlvbiBmaWVsZCBpbiB0aGUgSU8tQVBJQyBlbnRyeS4KClRo
aXMgaXMgc2FmZSBub3csIGJ1dCB0aGVyZSdzIG5vIHJlYXNvbiB0byBub3QgZW5hYmxlIHgyQVBJ
QyBldmVuCndpdGhvdXQgaW50ZXJydXB0IHJlbWFwcGluZywgYW5kIGhlbmNlIHRoZSBJTy1BUElD
IGNvZGUgbmVlZHMgdG8gdXNlCnRoZSAzMiBiaXQgZGVzdGluYXRpb24gZmllbGQgb25seSB3aGVu
IGJvdGggaW50ZXJydXB0IHJlbWFwcGluZyBhbmQKeDJBUElDIGFyZSBlbmFibGVkLgoKU2lnbmVk
LW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Ci0tLQpDaGFu
Z2VzIHNpbmNlIHYxOgogLSBGaXggc2V0X2lvYXBpY19hZmZpbml0eV9pcnEuCi0tLQogeGVuL2Fy
Y2gveDg2L2lvX2FwaWMuYyB8IDE0ICsrKysrKystLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNyBp
bnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9p
b19hcGljLmMgYi94ZW4vYXJjaC94ODYvaW9fYXBpYy5jCmluZGV4IDk3Y2IyZDE1NGEuLmJlMGIw
ODU1MTMgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9pb19hcGljLmMKKysrIGIveGVuL2FyY2gv
eDg2L2lvX2FwaWMuYwpAQCAtNTYyLDcgKzU2Miw3IEBAIHNldF9pb2FwaWNfYWZmaW5pdHlfaXJx
KHN0cnVjdCBpcnFfZGVzYyAqZGVzYywgY29uc3QgY3B1bWFza190ICptYXNrKQogCiAgICAgZGVz
dCA9IHNldF9kZXNjX2FmZmluaXR5KGRlc2MsIG1hc2spOwogICAgIGlmIChkZXN0ICE9IEJBRF9B
UElDSUQpIHsKLSAgICAgICAgaWYgKCAheDJhcGljX2VuYWJsZWQgKQorICAgICAgICBpZiAoICFp
b21tdV9pbnRyZW1hcCApCiAgICAgICAgICAgICBkZXN0ID0gU0VUX0FQSUNfTE9HSUNBTF9JRChk
ZXN0KTsKICAgICAgICAgZW50cnkgPSBpcnFfMl9waW4gKyBpcnE7CiAgICAgICAgIGZvciAoOzsp
IHsKQEAgLTk2NCw3ICs5NjQsNyBAQCBzdGF0aWMgaHdfaXJxX2NvbnRyb2xsZXIgaW9hcGljX2Vk
Z2VfdHlwZTsKICNkZWZpbmUgSU9BUElDX0xFVkVMCTEKIAogI2RlZmluZSBTRVRfREVTVChlbnQs
IG1vZGUsIHZhbCkgZG8geyBcCi0gICAgaWYgKHgyYXBpY19lbmFibGVkKSBcCisgICAgaWYgKHgy
YXBpY19lbmFibGVkICYmIGlvbW11X2ludHJlbWFwKSBcCiAgICAgICAgIChlbnQpLmRlc3QuZGVz
dDMyID0gKHZhbCk7IFwKICAgICBlbHNlIFwKICAgICAgICAgKGVudCkuZGVzdC5tb2RlLm1vZGUj
I19kZXN0ID0gKHZhbCk7IFwKQEAgLTExOTQsMTQgKzExOTQsMTQgQEAgc3RhdGljIHZvaWQgLypf
X2luaXQqLyBfX3ByaW50X0lPX0FQSUMoYm9vbCBib290KQogCXByaW50ayhLRVJOX0RFQlVHICIu
Li4uIElSUSByZWRpcmVjdGlvbiB0YWJsZTpcbiIpOwogCiAJcHJpbnRrKEtFUk5fREVCVUcgIiBO
UiAlcyBNc2sgVHJnIElSUiBQb2wgU3RhdCBEc3RNIERlbE0gVmVjXG4iLAotICAgICAgICAgICAg
ICAgeDJhcGljX2VuYWJsZWQgPyAiIERlc3RJRCIgOiAiRHN0Iik7CisgICAgICAgICAgICAgICAo
eDJhcGljX2VuYWJsZWQgJiYgaW9tbXVfaW50cmVtYXApID8gIiBEZXN0SUQiIDogIkRzdCIpOwog
CiAJZm9yIChpID0gMDsgaSA8PSByZWdfMDEuYml0cy5lbnRyaWVzOyBpKyspIHsKICAgICAgICAg
ICAgIHN0cnVjdCBJT19BUElDX3JvdXRlX2VudHJ5IGVudHJ5OwogCiAgICAgICAgICAgICBlbnRy
eSA9IGlvYXBpY19yZWFkX2VudHJ5KGFwaWMsIGksIDApOwogCi0gICAgICAgICAgICBpZiAoIHgy
YXBpY19lbmFibGVkICkKKyAgICAgICAgICAgIGlmICggeDJhcGljX2VuYWJsZWQgJiYgaW9tbXVf
aW50cmVtYXAgKQogICAgICAgICAgICAgICAgIHByaW50ayhLRVJOX0RFQlVHICIgJTAyeCAlMDh4
IiwgaSwgZW50cnkuZGVzdC5kZXN0MzIpOwogICAgICAgICAgICAgZWxzZQogICAgICAgICAgICAg
ICAgIHByaW50ayhLRVJOX0RFQlVHICIgJTAyeCAgJTAyeCAiLCBpLApAQCAtMjUwNCw5ICsyNTA0
LDkgQEAgdm9pZCBkdW1wX2lvYXBpY19pcnFfaW5mbyh2b2lkKQogICAgICAgICAgICAgICAgICAg
IHJ0ZS5kZXN0X21vZGUgPyAnTCcgOiAnUCcsCiAgICAgICAgICAgICAgICAgICAgcnRlLmRlbGl2
ZXJ5X3N0YXR1cywgcnRlLnBvbGFyaXR5LCBydGUuaXJyLAogICAgICAgICAgICAgICAgICAgIHJ0
ZS50cmlnZ2VyID8gJ0wnIDogJ0UnLCBydGUubWFzaywKLSAgICAgICAgICAgICAgICAgICB4MmFw
aWNfZW5hYmxlZCA/IDggOiAyLAotICAgICAgICAgICAgICAgICAgIHgyYXBpY19lbmFibGVkID8g
cnRlLmRlc3QuZGVzdDMyCi0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgOiBydGUu
ZGVzdC5sb2dpY2FsLmxvZ2ljYWxfZGVzdCk7CisgICAgICAgICAgICAgICAgICAgKHgyYXBpY19l
bmFibGVkICYmIGlvbW11X2ludHJlbWFwKSA/IDggOiAyLAorICAgICAgICAgICAgICAgICAgICh4
MmFwaWNfZW5hYmxlZCAmJiBpb21tdV9pbnRyZW1hcCkgPworICAgICAgICAgICAgICAgICAgICAg
ICBydGUuZGVzdC5kZXN0MzIgOiBydGUuZGVzdC5sb2dpY2FsLmxvZ2ljYWxfZGVzdCk7CiAKICAg
ICAgICAgICAgIGlmICggZW50cnktPm5leHQgPT0gMCApCiAgICAgICAgICAgICAgICAgYnJlYWs7
Ci0tIAoyLjI0LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
