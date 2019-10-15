Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7DAED7A73
	for <lists+xen-devel@lfdr.de>; Tue, 15 Oct 2019 17:51:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iKP3W-0006sB-P3; Tue, 15 Oct 2019 15:48:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=JiiH=YI=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iKP3V-0006s6-Un
 for xen-devel@lists.xenproject.org; Tue, 15 Oct 2019 15:48:13 +0000
X-Inumbo-ID: 31c27ef4-ef63-11e9-beca-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 31c27ef4-ef63-11e9-beca-bc764e2007e4;
 Tue, 15 Oct 2019 15:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1571154493;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=x1no3X72KcJS6AC/cBY+x7UQhXzB3xa9g/DTmKGz+5c=;
 b=cnsAl3w4Apfj7rtgsuqHyd2QF7G8k8JybIYSbf0PaTPqo+i2EmOOF//P
 3h665bTmSyICyFt1QvwOdM0JBdVLwjTdZFLQF6JblNm+KC2pD9gu4Ln+0
 C2oOXK+zwqBPhwOpm23uGEaBdEH0d5GU3J6y2bTdcHKkifk95s5cugmkD k=;
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
IronPort-SDR: FiFvliw5HGj/kFNesJcjncEM94Pjt+Zv9hl/nTfMd4wzbSvr0+1XUaqDJRnzhF0zcUz77xPC/z
 8iDwW2jGq21ovCONJdU+2goL62wRlSwaEfiS2a6q7U+tgdxa9MIccU8T12khieGc1Uq5OlShX2
 TsEq5lARscyBecUaZYgxqeoySVcPRtdv8i0blnJJnLkQ6gysTilIGjvz+G/0SEsXle2KRdTXqv
 SlS2MEyw4v8mchaY16Iyo0PxArjcBYjNa+Vwx7Fl36mXvG5vfdEBMENqdray44OIjonRkosarp
 BAk=
X-SBRS: 2.7
X-MesageID: 6908372
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,300,1566878400"; 
   d="scan'208";a="6908372"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 15 Oct 2019 17:47:32 +0200
Message-ID: <20191015154736.19882-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 0/4] iommu: fixes for interrupt remapping
 enabling
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
Cc: Juergen Gross <jgross@suse.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Jan Beulich <jbeulich@suse.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGVsbG8sCgpUaGUgZm9sbG93aW5nIHNlcmllcyBjb250YWluIGZpeGVzIGZvciBpc3N1ZXMgZm91
bmQgd2hlbiBlbmFibGluZwppbnRlcnJ1cHQgcmVtYXBwaW5nIGFuZCB0aGUgSU8tQVBJQyBhbHJl
YWR5IGhhcyB1bm1hc2tlZCBwaW5zLiBXaGlsZSBJJ20Kbm90IGF3YXJlIG9mIGFueSBzeXN0ZW0g
bWFsZnVuY3Rpb25pbmcgKGFwYXJ0IGZyb20gcmVwb3J0aW5nIElPTU1VCmludGVycnVwdCByZW1h
cHBpbmcgZmF1bHRzKSBJIHRoaW5rIGl0IHdvdWxkIGJlIG5pY2UgdG8gaGF2ZSB0aG9zZSBpbgo0
LjEzLgoKVGhlIHNlcmllcyBjYW4gYWxzbyBiZSBmb3VuZCBhdDoKCmdpdDovL3hlbmJpdHMueGVu
Lm9yZy9wZW9wbGUvcm95Z2VyL3hlbi5naXQgaW9tbXVfaW50cl92MwoKVGhhbmtzLCBSb2dlci4K
ClJvZ2VyIFBhdSBNb25uZSAoNCk6CiAgaW9tbXUvYW1kOiBzdXBwb3J0IGFsbCBkZWxpdmVyeSBt
b2RlcyB3aXRoIHgyQVBJQwogIHgyQVBJQzogc2ltcGxpZnkgcmVzdW1lCiAgeDJBUElDOiB0cmFu
c2xhdGUgSU8tQVBJQyBlbnRyaWVzIHdoZW4gZW5hYmxpbmcgdGhlIElPTU1VCiAgaW9tbXU6IHRy
YW5zbGF0ZSBJTy1BUElDIHBpbnMgd2hlbiBlbmFibGluZyBpbnRlcnJ1cHQgcmVtYXBwaW5nCgog
eGVuL2FyY2gveDg2L2FwaWMuYyAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDM4ICsrLS0t
CiB4ZW4vYXJjaC94ODYvaW9fYXBpYy5jICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDUgKy0K
IHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FtZC9pb21tdV9pbml0LmMgICAgICB8ICAxMSArLQog
eGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1kL2lvbW11X2ludHIuYyAgICAgIHwgMTQxICsrKysr
KysrKy0tLS0tLS0tLQogeGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gveDg2L2lvbW11LmMgICAgICAg
ICAgIHwgIDM0ICsrKystCiB4ZW4vaW5jbHVkZS9hc20teDg2L2h2bS9zdm0vYW1kLWlvbW11LXBy
b3RvLmggfCAgIDEgKwogeGVuL2luY2x1ZGUvYXNtLXg4Ni9pb19hcGljLmggICAgICAgICAgICAg
ICAgIHwgICAzICstCiA3IGZpbGVzIGNoYW5nZWQsIDEyMSBpbnNlcnRpb25zKCspLCAxMTIgZGVs
ZXRpb25zKC0pCgotLSAKMi4yMy4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
