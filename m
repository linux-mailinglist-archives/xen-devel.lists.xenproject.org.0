Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F17A4105620
	for <lists+xen-devel@lfdr.de>; Thu, 21 Nov 2019 16:56:01 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iXomk-0007ME-KG; Thu, 21 Nov 2019 15:54:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0uFN=ZN=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iXomj-0007M9-81
 for xen-devel@lists.xenproject.org; Thu, 21 Nov 2019 15:54:21 +0000
X-Inumbo-ID: 2de76bba-0c77-11ea-b678-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2de76bba-0c77-11ea-b678-bc764e2007e4;
 Thu, 21 Nov 2019 15:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1574351661;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=H67/YF1ZykeX+fZZnOwLTmBpgHBZwQpfMP/rriLJogI=;
 b=UwEc5sgCOuQj2kjiuvG/b/lCd9n0cYtW/XBsLuxY6R0AIFYf01VZkQnO
 9W0WGvm/NMQKrusWaobY4s8/CMV7ITryQbPJEEyI8s6ehkmvwVsbmjAXt
 8oshOwQtZeXFQEgGj5F65gE5C/Izf6efP7bZ3MUfAHV2QD1uZy7lDi/Q1 0=;
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
IronPort-SDR: ov6UW4/oo03yd841Q23Af+1MsfwOK3+wdDUaLKwM3MtwjXe9ajauARJjfoH8BZTxNpOzum5Ejq
 cAsCbb8yZQ6tFYUcR+nGVS6IU2i+fFKXZ3QdixdeSmHoRr64Mvje87J44Qg7Bb6XmDz/fkLWUc
 Lpb1kmPSzwkiE/xT7mUsRsVaAzhXmYyQnq0L2JZfYrcwyU576PhptzFuKbqaWK4GEOSvLPmxt6
 Lnl4IbG1c7LbNMJqw9SqXQBhOABqSOIhMV7hgp/GiEh8n95jjCMMIYoh0I7BNznlplU7Z1wg0D
 gg0=
X-SBRS: 2.7
X-MesageID: 8779186
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,226,1571716800"; 
   d="scan'208";a="8779186"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 21 Nov 2019 16:54:08 +0100
Message-ID: <20191121155411.13250-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 0/3] x86: enable x2APIC mode regardless of
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
cywgUm9nZXIuCgpSb2dlciBQYXUgTW9ubmUgKDMpOgogIHg4Ni9pb2FwaWM6IG9ubHkgdXNlIGRl
c3QzMiB3aXRoIHgyYXBpYyBhbmQgaW50ZXJydXB0IHJlbWFwcGluZwogICAgZW5hYmxlZAogIHg4
Ni9zbXA6IGNoZWNrIEFQSUMgSUQgb24gQVAgYnJpbmd1cAogIHg4Ni9hcGljOiBhbGxvdyBlbmFi
bGluZyB4MkFQSUMgbW9kZSByZWdhcmRsZXNzIG9mIGludGVycnVwdCByZW1hcHBpbmcKCiB4ZW4v
YXJjaC94ODYvYXBpYy5jICAgIHwgOTQgKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0t
LS0tLS0tLS0tCiB4ZW4vYXJjaC94ODYvaW9fYXBpYy5jIHwgMTIgKysrLS0tCiB4ZW4vYXJjaC94
ODYvc21wYm9vdC5jIHwgIDcgKysrKwogMyBmaWxlcyBjaGFuZ2VkLCA1OSBpbnNlcnRpb25zKCsp
LCA1NCBkZWxldGlvbnMoLSkKCi0tIAoyLjI0LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
