Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A92E97DFD
	for <lists+xen-devel@lfdr.de>; Wed, 21 Aug 2019 17:02:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i0S5N-00007h-RS; Wed, 21 Aug 2019 14:59:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SZvr=WR=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1i0S5M-00007W-JO
 for xen-devel@lists.xenproject.org; Wed, 21 Aug 2019 14:59:40 +0000
X-Inumbo-ID: 499bd289-c424-11e9-adc7-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 499bd289-c424-11e9-adc7-12813bfff9fa;
 Wed, 21 Aug 2019 14:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1566399574;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=uEQSlx2svMIzgTVgPbHTmmnYMgFonWZGwKFXaPfsVBc=;
 b=Q1ybVGwgcyvudgaDgxC2t4AgvFJk2uTSg0v3QP6Q2S8Bg/QQUjezXukZ
 i9FnHNblOTSW1Kb0xOvxopNp+TobSPFvAWNNkS2r1rjEYnKKnaX8jjuUb
 1QkczR1gfqLf5XcPxUOH+B9rmuvDYdyxBEI89g2gMh48qRuIPWKEyv7XN s=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Pamu2Zx+IvydNbSNY+ZQ73QVCAUQpzizTweWC1dKpyu+GFf2tXjCpazTHhTvUw38ZjuGjyqe2d
 WCd9DZKxFvF/1q+q9DhH2h+7jzLlLNgFMq1XHfwv/CqepRwlBfWAxIfmpTPEqmv6j8p8LM9/1f
 BtMY87LE1I7KogY+2lVcQvO/J5eWuZzSskP/ytRQVJbes61UGl9gkRJRrejytBu3sZ1xhGLqNa
 KUNrC9R+hoRaltWBK4jSQqW6isQ6flo4yV02z+Mi5ckpEx0OT4ZJNxnln6NUt4gsauVtNQcs4J
 jGo=
X-SBRS: 2.7
X-MesageID: 4782698
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,412,1559534400"; 
   d="scan'208";a="4782698"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 21 Aug 2019 16:58:56 +0200
Message-ID: <20190821145903.45934-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 0/7] ioreq: add support for internal servers
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Ian
 Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

U3VjaCBpbnRlcm5hbCBzZXJ2ZXJzIGFyZSBpbXBsZW1lbnRlZCBieSBhIHNpbmdsZSBmdW5jdGlv
biB0aGF0IGhhbmRsZXMKaW9yZXFzIGluc2lkZSB0aGUgaHlwZXJ2aXNvci4KClRoZSBtb3RpdmF0
aW9uIGJlaGluZCB0aGlzIGNoYW5nZSBpcyB0byBzd2l0Y2ggdlBDSSB0byBiZWNvbWUgYW4KaW50
ZXJuYWwgaW9yZXEgc2VydmVyLCBzbyB0aGF0IGFjY2Vzc2VzIHRvIHRoZSBQQ0kgY29uZmlnIHNw
YWNlIGNhbiBiZQptdWx0aXBsZXhlZCBiZXR3ZWVuIGRldmljZXMgaGFuZGxlZCBieSB2UENJIGFu
ZCBkZXZpY2VzIGhhbmRsZWQgYnkgb3RoZXIKaW9yZXEgc2VydmVycy4KClRoZSBpbXBsZW1lbnRh
dGlvbiBpcyBmYWlybHkgc2ltcGxlIGFuZCBsaW1pdGVkIHRvIHdoYXQncyBuZWVkZWQgYnkKdlBD
SSwgYnV0IGNhbiBiZSBleHBhbmRlZCBpbiB0aGUgZnV0dXJlIGlmIG90aGVyIG1vcmUgY29tcGxl
eCB1c2VycwphcHBlYXIuCgpUaGUgc2VyaWVzIGNhbiBhbHNvIGJlIGZvdW5kIGF0OgoKZ2l0Oi8v
eGVuYml0cy54ZW4ub3JnL3Blb3BsZS9yb3lnZXIveGVuLmdpdCBpb3JlcV92cGNpX3YxCgpUaGFu
a3MsIFJvZ2VyLgoKUm9nZXIgUGF1IE1vbm5lICg3KToKICBpb3JlcTogYWRkIGZpZWxkcyB0byBh
bGxvdyBpbnRlcm5hbCBpb3JlcSBzZXJ2ZXJzCiAgaW9yZXE6IGFkZCBpbnRlcm5hbCBpb3JlcSBp
bml0aWFsaXphdGlvbiBzdXBwb3J0CiAgaW9yZXE6IGFsbG93IGRpc3BhdGNoaW5nIGlvcmVxcyB0
byBpbnRlcm5hbCBzZXJ2ZXJzCiAgaW9yZXE6IGFsbG93IHJlZ2lzdGVyaW5nIGludGVybmFsIGlv
cmVxIHNlcnZlciBoYW5kbGVyCiAgaW9yZXE6IGFsbG93IGRlY29kaW5nIGFjY2Vzc2VzIHRvIE1N
Q0ZHIHJlZ2lvbnMKICB2cGNpOiByZWdpc3RlciBhcyBhbiBpbnRlcm5hbCBpb3JlcSBzZXJ2ZXIK
ICBpb3JlcTogcHJvdmlkZSBzdXBwb3J0IGZvciBsb25nLXJ1bm5pbmcgb3BlcmF0aW9ucy4uLgoK
IHhlbi9hcmNoL3g4Ni9odm0vZG0uYyAgICAgICAgICAgICAgIHwgICA5ICstCiB4ZW4vYXJjaC94
ODYvaHZtL2RvbTBfYnVpbGQuYyAgICAgICB8ICAgOSArLQogeGVuL2FyY2gveDg2L2h2bS9odm0u
YyAgICAgICAgICAgICAgfCAgIDcgKy0KIHhlbi9hcmNoL3g4Ni9odm0vaW8uYyAgICAgICAgICAg
ICAgIHwgMjg4ICstLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiB4ZW4vYXJjaC94ODYvaHZtL2lvcmVx
LmMgICAgICAgICAgICB8IDM0OSArKysrKysrKysrKysrKysrKysrKysrKy0tLS0tCiB4ZW4vYXJj
aC94ODYvcGh5c2Rldi5jICAgICAgICAgICAgICB8ICAgNyArLQogeGVuL2RyaXZlcnMvcGFzc3Ro
cm91Z2gveDg2L2lvbW11LmMgfCAgIDIgKy0KIHhlbi9kcml2ZXJzL3ZwY2kvdnBjaS5jICAgICAg
ICAgICAgIHwgIDU3ICsrKysrCiB4ZW4vaW5jbHVkZS9hc20teDg2L2h2bS9kb21haW4uaCAgICB8
ICAzMSArKy0KIHhlbi9pbmNsdWRlL2FzbS14ODYvaHZtL2lvLmggICAgICAgIHwgIDE0ICstCiB4
ZW4vaW5jbHVkZS9hc20teDg2L2h2bS9pb3JlcS5oICAgICB8ICAxOSArLQogeGVuL2luY2x1ZGUv
eGVuL3ZwY2kuaCAgICAgICAgICAgICAgfCAgIDMgKwogMTIgZmlsZXMgY2hhbmdlZCwgNDE1IGlu
c2VydGlvbnMoKyksIDM4MCBkZWxldGlvbnMoLSkKCi0tIAoyLjIyLjAKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
