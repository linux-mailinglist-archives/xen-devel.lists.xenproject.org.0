Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4080B10D4EA
	for <lists+xen-devel@lfdr.de>; Fri, 29 Nov 2019 12:33:04 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iaeT7-0006r6-Uu; Fri, 29 Nov 2019 11:29:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=YUI4=ZV=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iaeT6-0006r1-Lv
 for xen-devel@lists.xenproject.org; Fri, 29 Nov 2019 11:29:48 +0000
X-Inumbo-ID: 85227350-129b-11ea-a3e3-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 85227350-129b-11ea-a3e3-12813bfff9fa;
 Fri, 29 Nov 2019 11:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1575026976;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=n58ZH7BJhcXQ9fDzP+SZG3XJUI7W0AauLpi2KTYwjkA=;
 b=JW7JD7YX+ZX4pXwSLPG82XlOOWKDuFwxwaNV1xSDE9HuVFLKq7Y9TTqQ
 40/DCyw1BkjH7yEobH4wHv8OhMtoaO7ehcL4wXcyWe5cBaE7TaRqMBNHD
 q8VdtNclYfpuDKpSWFwnceqNGZ794c5Cjw9Z1pD2ICKe2erJ4JylIPOt0 g=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
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
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 12PNvtazQq1ed3LC02wgkrCrhmSK8bripqibo/z2VG9kwgN5PAeZg6sGoZEbBJr9d+vUL9Ff4Z
 OlLy5hrLZKCkmYOCfFEZ44XvTUT+xRHGOLaqGqR8CBCbgb/6NwYlSteQ9GXG/A+djW9vOGZcn5
 N9w+Dka9y0m0l0v54u5lfU2KsjOdgy5Sw8R7Va2aoxPbJG1MjJTXRmeajO3q0lvhEJxLpzJvWT
 LTr5tnmHVBM9PuHi/RtxHleWjtNXR+N9xX7RBuB4PACcPpOBgslOE7MGGmB2m2iv0gxk0sAuI7
 gTc=
X-SBRS: 2.7
X-MesageID: 8987261
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,257,1571716800"; 
   d="scan'208";a="8987261"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 29 Nov 2019 12:28:47 +0100
Message-ID: <20191129112851.19273-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 0/4] x86: enable x2APIC mode regardless of
 interrupt remapping support
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

SGVsbG8sCgpUaGUgZm9sbG93aW5nIHNlcmllcyBhaW1zIHRvIGFsbG93IGVuYWJsaW5nIHgyQVBJ
QyBtb2RlIHdpdGhvdXQKaW50ZXJydXB0IHJlbWFwcGluZyBzdXBwb3J0LiBUaGUgbWFpbiB1c2Fn
ZSBvZiB0aGlzIHdvdWxkIGJlIGluCnZpcnR1YWxpemVkIGVudmlyb25tZW50cywgdGhhdCB1c3Vh
bGx5IHByb3ZpZGUgeDJBUElDIHN1cHBvcnQgYnV0IG5vdAppbnRlcnJ1cHQgcmVtYXBwaW5nLgoK
U2VlIHRoZSBsYXN0IHBhdGNoIGZvciBzb21lIHBlcmZvcm1hbmNlIG51bWJlcnMgb2YgdXNpbmcg
eDJBUElDIG92ZXIKeEFQSUMgd2hlbiBydW5uaW5nIFhlbiBpbiBwdnNoaW0gbW9kZS4KClRoYW5r
cywgUm9nZXIuCgpSb2dlciBQYXUgTW9ubmUgKDQpOgogIHg4Ni9pb2FwaWM6IG9ubHkgdXNlIGRl
c3QzMiB3aXRoIHgyYXBpYyBhbmQgaW50ZXJydXB0IHJlbWFwcGluZwogICAgZW5hYmxlZAogIHg4
Ni9hcGljOiBmb3JjZSBwaHlzIG1vZGUgaWYgaW50ZXJydXB0IHJlbWFwcGluZyBpcyBkaXNhYmxl
ZAogIHg4Ni9zbXA6IGNoZWNrIEFQSUMgSUQgb24gQVAgYnJpbmd1cAogIHg4Ni9hcGljOiBhbGxv
dyBlbmFibGluZyB4MkFQSUMgbW9kZSByZWdhcmRsZXNzIG9mIGludGVycnVwdCByZW1hcHBpbmcK
CiB4ZW4vYXJjaC94ODYvYXBpYy5jICAgICAgICAgICB8IDg5ICsrKysrKysrKysrKysrKysrLS0t
LS0tLS0tLS0tLS0tLS0tCiB4ZW4vYXJjaC94ODYvZ2VuYXBpYy94MmFwaWMuYyB8ICA4ICsrKysK
IHhlbi9hcmNoL3g4Ni9pb19hcGljLmMgICAgICAgIHwgMTQgKysrLS0tCiB4ZW4vYXJjaC94ODYv
c21wYm9vdC5jICAgICAgICB8ICA3ICsrKwogNCBmaWxlcyBjaGFuZ2VkLCA2NCBpbnNlcnRpb25z
KCspLCA1NCBkZWxldGlvbnMoLSkKCi0tIAoyLjI0LjAKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
