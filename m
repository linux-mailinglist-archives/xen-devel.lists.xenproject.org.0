Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87EBF105622
	for <lists+xen-devel@lfdr.de>; Thu, 21 Nov 2019 16:56:06 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iXomq-0007No-5I; Thu, 21 Nov 2019 15:54:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0uFN=ZN=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iXomo-0007NH-8h
 for xen-devel@lists.xenproject.org; Thu, 21 Nov 2019 15:54:26 +0000
X-Inumbo-ID: 2ea9cb9c-0c77-11ea-9631-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2ea9cb9c-0c77-11ea-9631-bc764e2007e4;
 Thu, 21 Nov 2019 15:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1574351661;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JDwT4M3xxpK5idmTqO4NNf3501J90gXqRN6QCmLvuR4=;
 b=TJCdrUtlJriTGZT/Sr4vgqZiMlr7+lotC8P4cDqs8ztYk6hc55aFloMk
 qAFMxkfeVs9gINvvaijnjAMoelNB0LKYSo2bYFiym4FphqbhBoPCiw3hz
 r57HfHpQ+JwAbSvx6cs98I0F39uKB0tdjIu5o96GvsK5BEAwtOmvVb8i7 Q=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: R/2yAziJ4wFrsoOyaDMU9g6IefXn3HPNFcBsl9C6AtxSsrPYhbc1XV7clN2WwCHcqDveTMJJvs
 OZxK4qTRtSgZc/eEf5ZNsBarb8miF+pOdkEWuyOfDdN6Bn/4ISlItX3lITkB0/zjVae7f2MqVN
 GLCRQkrdkKYqeVN/PvQ8rKxpEh8msBwxAKPI1O/nYPXh8KlTw626nRchhmaB7gAYVXrluVUSti
 XLg0TO4+j1dfeqlV/Q3bSvtw5/XedCXOn++OBlz7QQXJuSp6Gq5ekntBCSJ4cZxPx5AvWaVLJM
 3Kg=
X-SBRS: 2.7
X-MesageID: 9206662
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,226,1571716800"; 
   d="scan'208";a="9206662"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 21 Nov 2019 16:54:09 +0100
Message-ID: <20191121155411.13250-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191121155411.13250-1-roger.pau@citrix.com>
References: <20191121155411.13250-1-roger.pau@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 1/3] x86/ioapic: only use dest32 with x2apic and
 interrupt remapping enabled
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
LW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Ci0tLQogeGVu
L2FyY2gveDg2L2lvX2FwaWMuYyB8IDEyICsrKysrKy0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDYg
aW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYv
aW9fYXBpYy5jIGIveGVuL2FyY2gveDg2L2lvX2FwaWMuYwppbmRleCA3MzJiNTc5OTVjLi45ZDM4
NTY4ZmJhIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvaW9fYXBpYy5jCisrKyBiL3hlbi9hcmNo
L3g4Ni9pb19hcGljLmMKQEAgLTk2NCw3ICs5NjQsNyBAQCBzdGF0aWMgaHdfaXJxX2NvbnRyb2xs
ZXIgaW9hcGljX2VkZ2VfdHlwZTsKICNkZWZpbmUgSU9BUElDX0xFVkVMCTEKIAogI2RlZmluZSBT
RVRfREVTVChlbnQsIG1vZGUsIHZhbCkgZG8geyBcCi0gICAgaWYgKHgyYXBpY19lbmFibGVkKSBc
CisgICAgaWYgKHgyYXBpY19lbmFibGVkICYmIGlvbW11X2ludHJlbWFwKSBcCiAgICAgICAgIChl
bnQpLmRlc3QuZGVzdDMyID0gKHZhbCk7IFwKICAgICBlbHNlIFwKICAgICAgICAgKGVudCkuZGVz
dC5tb2RlLm1vZGUjI19kZXN0ID0gKHZhbCk7IFwKQEAgLTExOTQsMTQgKzExOTQsMTQgQEAgc3Rh
dGljIHZvaWQgLypfX2luaXQqLyBfX3ByaW50X0lPX0FQSUMoYm9vbCBib290KQogCXByaW50ayhL
RVJOX0RFQlVHICIuLi4uIElSUSByZWRpcmVjdGlvbiB0YWJsZTpcbiIpOwogCiAJcHJpbnRrKEtF
Uk5fREVCVUcgIiBOUiAlcyBNc2sgVHJnIElSUiBQb2wgU3RhdCBEc3RNIERlbE0gVmVjXG4iLAot
ICAgICAgICAgICAgICAgeDJhcGljX2VuYWJsZWQgPyAiIERlc3RJRCIgOiAiRHN0Iik7CisgICAg
ICAgICAgICAgICAoeDJhcGljX2VuYWJsZWQgJiYgaW9tbXVfaW50cmVtYXApID8gIiBEZXN0SUQi
IDogIkRzdCIpOwogCiAJZm9yIChpID0gMDsgaSA8PSByZWdfMDEuYml0cy5lbnRyaWVzOyBpKysp
IHsKICAgICAgICAgICAgIHN0cnVjdCBJT19BUElDX3JvdXRlX2VudHJ5IGVudHJ5OwogCiAgICAg
ICAgICAgICBlbnRyeSA9IGlvYXBpY19yZWFkX2VudHJ5KGFwaWMsIGksIDApOwogCi0gICAgICAg
ICAgICBpZiAoIHgyYXBpY19lbmFibGVkICkKKyAgICAgICAgICAgIGlmICggeDJhcGljX2VuYWJs
ZWQgJiYgaW9tbXVfaW50cmVtYXAgKQogICAgICAgICAgICAgICAgIHByaW50ayhLRVJOX0RFQlVH
ICIgJTAyeCAlMDh4IiwgaSwgZW50cnkuZGVzdC5kZXN0MzIpOwogICAgICAgICAgICAgZWxzZQog
ICAgICAgICAgICAgICAgIHByaW50ayhLRVJOX0RFQlVHICIgJTAyeCAgJTAyeCAiLCBpLApAQCAt
MjUwNCw5ICsyNTA0LDkgQEAgdm9pZCBkdW1wX2lvYXBpY19pcnFfaW5mbyh2b2lkKQogICAgICAg
ICAgICAgICAgICAgIHJ0ZS5kZXN0X21vZGUgPyAnTCcgOiAnUCcsCiAgICAgICAgICAgICAgICAg
ICAgcnRlLmRlbGl2ZXJ5X3N0YXR1cywgcnRlLnBvbGFyaXR5LCBydGUuaXJyLAogICAgICAgICAg
ICAgICAgICAgIHJ0ZS50cmlnZ2VyID8gJ0wnIDogJ0UnLCBydGUubWFzaywKLSAgICAgICAgICAg
ICAgICAgICB4MmFwaWNfZW5hYmxlZCA/IDggOiAyLAotICAgICAgICAgICAgICAgICAgIHgyYXBp
Y19lbmFibGVkID8gcnRlLmRlc3QuZGVzdDMyCi0gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgOiBydGUuZGVzdC5sb2dpY2FsLmxvZ2ljYWxfZGVzdCk7CisgICAgICAgICAgICAgICAg
ICAgKHgyYXBpY19lbmFibGVkICYmIGlvbW11X2ludHJlbWFwKSA/IDggOiAyLAorICAgICAgICAg
ICAgICAgICAgICh4MmFwaWNfZW5hYmxlZCAmJiBpb21tdV9pbnRyZW1hcCkgPworICAgICAgICAg
ICAgICAgICAgICAgICBydGUuZGVzdC5kZXN0MzIgOiBydGUuZGVzdC5sb2dpY2FsLmxvZ2ljYWxf
ZGVzdCk7CiAKICAgICAgICAgICAgIGlmICggZW50cnktPm5leHQgPT0gMCApCiAgICAgICAgICAg
ICAgICAgYnJlYWs7Ci0tIAoyLjI0LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
