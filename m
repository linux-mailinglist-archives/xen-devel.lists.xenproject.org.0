Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58D7981E3F
	for <lists+xen-devel@lfdr.de>; Mon,  5 Aug 2019 15:56:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hudQn-00073B-0R; Mon, 05 Aug 2019 13:53:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6VNZ=WB=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hudQk-000736-W4
 for xen-devel@lists.xenproject.org; Mon, 05 Aug 2019 13:53:43 +0000
X-Inumbo-ID: 6d4f8f60-b788-11e9-bac7-f3c48a4821e8
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6d4f8f60-b788-11e9-bac7-f3c48a4821e8;
 Mon, 05 Aug 2019 13:53:39 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 6sahLZlhyflPxY4+HYUqIAkMvr2AqpQOfw3cmmyL7YQfO8Pt5+5m5g1qHSPubhBPmcj8eIa7Ek
 NMKsk8oPxGct+2Tbi4jMS1yFljWgyav8LeSwBWFruELH4Zhrb3ilcqIFql782neWfiBpdvvaFp
 nxBd5aO6A9Ok7GYI6upqcR8ojlvN8c1sxcSpZ++fKVwluZNwmJutEO8fi51MJScBofMppchNaY
 G4jc1WrvpzKBDUBzFRTOfeg3F8vu8QTIrihvCnyCncJCaruIkZGOHlf3wTbBU+bHhE+0y+Ie7q
 x10=
X-SBRS: 2.7
X-MesageID: 3907099
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,350,1559534400"; 
   d="scan'208";a="3907099"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Mon, 5 Aug 2019 14:53:35 +0100
Message-ID: <20190805135335.7812-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] x86/shim: Fix parallel build following c/s
 32b1d62887d0
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
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VW5mb3J0dW5hdGVseSwgYSBwYXJhbGxlbCBidWlsZCBmcm9tIGNsZWFuIGNhbiBmYWlsIGluIHRo
ZSBmb2xsb3dpbmcgbWFubmVyOgoKICB4ZW4uZ2l0JCBtYWtlIC1qNCAtQyB0b29scy9maXJtd2Fy
ZS94ZW4tZGlyLwogIG1ha2U6IEVudGVyaW5nIGRpcmVjdG9yeSAnL2xvY2FsL3hlbi5naXQvdG9v
bHMvZmlybXdhcmUveGVuLWRpcicKICBta2RpciAtcCB4ZW4tcm9vdAogIG1ha2U6ICoqKiBObyBy
dWxlIHRvIG1ha2UgdGFyZ2V0ICd4ZW4tcm9vdC94ZW4vYXJjaC94ODYvY29uZmlncy9wdnNoaW1f
ZGVmY29uZmlnJywgbmVlZGVkIGJ5ICd4ZW4tcm9vdC94ZW4vLmNvbmZpZycuICBTdG9wLgogIG1h
a2U6ICoqKiBXYWl0aW5nIGZvciB1bmZpbmlzaGVkIGpvYnMuLi4uCgpUaGUgcnVsZSBmb3IgcHZz
aGltX2RlZmNvbmZpZyBhbHNvIG5lZWQgdG8gZGVwZW5kIG9uIHRoZSBsaW5rZmFybSBiZWluZwpl
c3RhYmxpc2hlZCBmaXJzdC4KClNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5j
b29wZXIzQGNpdHJpeC5jb20+Ci0tLQpDQzogSmFuIEJldWxpY2ggPEpCZXVsaWNoQHN1c2UuY29t
PgpDQzogV2VpIExpdSA8d2xAeGVuLm9yZz4KQ0M6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBh
dUBjaXRyaXguY29tPgotLS0KIHRvb2xzL2Zpcm13YXJlL3hlbi1kaXIvTWFrZWZpbGUgfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1n
aXQgYS90b29scy9maXJtd2FyZS94ZW4tZGlyL01ha2VmaWxlIGIvdG9vbHMvZmlybXdhcmUveGVu
LWRpci9NYWtlZmlsZQppbmRleCA3NDM1NDIxMjUxLi42ZWQwY2I2ODg4IDEwMDY0NAotLS0gYS90
b29scy9maXJtd2FyZS94ZW4tZGlyL01ha2VmaWxlCisrKyBiL3Rvb2xzL2Zpcm13YXJlL3hlbi1k
aXIvTWFrZWZpbGUKQEAgLTM4LDcgKzM4LDcgQEAgbGlua2Zhcm0uc3RhbXA6ICQoREVQX0RJUlMp
ICQoREVQX0ZJTEVTKSBGT1JDRQogCQl9CiAKICMgQ29weSBlbm91Z2ggb2YgdGhlIHRyZWUgdG8g
YnVpbGQgdGhlIHNoaW0gaHlwZXJ2aXNvcgotJChEKTogbGlua2Zhcm0uc3RhbXAKKyQoRCkgJChE
KS94ZW4vYXJjaC94ODYvY29uZmlncy9wdnNoaW1fZGVmY29uZmlnOiBsaW5rZmFybS5zdGFtcAog
CSQoTUFLRSkgLUMgJChEKS94ZW4gZGlzdGNsZWFuCiAKICQoRCkveGVuLy5jb25maWc6ICQoRCkg
JChEKS94ZW4vYXJjaC94ODYvY29uZmlncy9wdnNoaW1fZGVmY29uZmlnCi0tIAoyLjExLjAKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
