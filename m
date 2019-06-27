Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9A5257F65
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jun 2019 11:35:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hgQms-0000jy-2s; Thu, 27 Jun 2019 09:33:50 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0PCY=U2=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hgQmq-0000jt-QR
 for xen-devel@lists.xenproject.org; Thu, 27 Jun 2019 09:33:48 +0000
X-Inumbo-ID: a957941d-98be-11e9-8980-bc764e045a96
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id a957941d-98be-11e9-8980-bc764e045a96;
 Thu, 27 Jun 2019 09:33:46 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: DJ9aFiRnadkG3RQhbPtXnl7yfqMrLKuQ23G1W2bceoZXKTBPmuRsP/odv3riprBqaaswsB314+
 6KNnJZajhbzRz6RbenGL8CqjKBEcpRJYHB/42nOQgKlohdpvJ+BHcmypmhq0VfkwRXaH5tiqOb
 gIzCazdKk0sKOp4XdSZAY50yYXCA8FLTOvOd60cu9IPChk32mOzWpC9bNWuI7V8dVHRwNEXbYo
 TZm4zONewq0rRg0rBm1P3ViyjPnrV0Kdor68uYgwTPNmrH2U7S0q033bbUlUnH0kBBfF6CP0Vk
 ZHc=
X-SBRS: 2.7
X-MesageID: 2304456
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,423,1557201600"; 
   d="scan'208";a="2304456"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 27 Jun 2019 11:33:33 +0200
Message-ID: <20190627093335.56355-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.20.1 (Apple Git-117)
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 1/3] x86/linker: add a reloc section to ELF
 linker script
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

aWYgdGhlIGh5cGVydmlzb3IgaGFzIGJlZW4gYnVpbHQgd2l0aCBFRkkgc3VwcG9ydCAoaWU6IG11
bHRpYm9vdDIpLgpUaGlzIGFsbG93cyB0byBwb3NpdGlvbiB0aGUgLnJlbG9jIHNlY3Rpb24gY29y
cmVjdGx5IGluIHRoZSBvdXRwdXQKYmluYXJ5LgoKTm90ZSB0aGF0IGZvciB0aGUgRUxGIG91dHB1
dCBmb3JtYXQgdGhlIC5yZWxvYyBzZWN0aW9uIGlzIG1vdmVkIGJlZm9yZQouYnNzIGJlY2F1c2Ug
dGhlIGRhdGEgaXQgY29udGFpbnMgaXMgcmVhZC1vbmx5LCBzbyBpdCBiZWxvbmdzIHdpdGggdGhl
Cm90aGVyIHNlY3Rpb25zIGNvbnRhaW5pbmcgcmVhZC1vbmx5IGRhdGEuCgpTaWduZWQtb2ZmLWJ5
OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KLS0tCkNjOiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+CkNjOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVy
M0BjaXRyaXguY29tPgpDYzogV2VpIExpdSA8d2xAeGVuLm9yZz4KLS0tCkNoYW5nZXMgc2luY2Ug
djI6CiAtIEZpeCBzdWJqZWN0IHRvIG1lbnRpb24gdGhlIHNlY3Rpb24gaXMgYWRkZWQgdG8gdGhl
IGxpbmtlciBzY3JpcHQuCiAtIEZpeCBjb21taXQgbWVzc2FnZSB0byBub3RlIC5yZWxvYyBpcyBh
ZGRlZCB0b2dldGhlciB3aXRoIHRoZSByZXN0CiAgIG9mIHRoZSByZWFkLW9ubHkgc2VjdGlvbnMu
CgpDaGFuZ2VzIHNpbmNlIHYxOgogLSBNb3ZlIHRoZSAucmVsb2Mgc2VjdGlvbiBwb3NpdGlvbiBp
biB0aGUgb3V0cHV0IGJpbmFyeSBvbmx5IGZvciB0aGUKICAgRUxGIG91dHB1dCBmb3JtYXQuCi0t
LQogeGVuL2FyY2gveDg2L3hlbi5sZHMuUyB8IDggKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA4
IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYveGVuLmxkcy5TIGIveGVu
L2FyY2gveDg2L3hlbi5sZHMuUwppbmRleCA5OGE5OTQ0NGMyLi4xOWFhNDMzMmNmIDEwMDY0NAot
LS0gYS94ZW4vYXJjaC94ODYveGVuLmxkcy5TCisrKyBiL3hlbi9hcmNoL3g4Ni94ZW4ubGRzLlMK
QEAgLTE3NSw2ICsxNzUsMTQgQEAgU0VDVElPTlMKICAgfSA6dGV4dAogI2VuZGlmCiAjZW5kaWYK
KworI2lmIGRlZmluZWQoWEVOX0JVSUxEX0VGSSkgJiYgIWRlZmluZWQoRUZJKQorICAuID0gQUxJ
R04oNCk7CisgIERFQ0xfU0VDVElPTigucmVsb2MpIHsKKyAgICAqKC5yZWxvYykKKyAgfSA6dGV4
dAorI2VuZGlmCisKICAgX2Vyb2RhdGEgPSAuOwogCiAgIC4gPSBBTElHTihTRUNUSU9OX0FMSUdO
KTsKLS0gCjIuMjAuMSAoQXBwbGUgR2l0LTExNykKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
