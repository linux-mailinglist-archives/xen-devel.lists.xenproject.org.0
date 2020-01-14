Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 032F013B1D9
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jan 2020 19:16:21 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1irQhl-00063h-SK; Tue, 14 Jan 2020 18:14:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=aAXM=3D=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1irQhj-00063V-Uz
 for xen-devel@lists.xenproject.org; Tue, 14 Jan 2020 18:14:15 +0000
X-Inumbo-ID: a85778cb-36f9-11ea-841f-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a85778cb-36f9-11ea-841f-12813bfff9fa;
 Tue, 14 Jan 2020 18:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579025649;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=F71AmoTdBipS6G0kM9p80fk7xVzzi/AMSt2cqLM8zyA=;
 b=ajtez9x09GDMiG+KN+hMoP9UAkzsxJEMGEX4qEAfsJ+So8MnfNuvi5EN
 JYrsJgSTZHMw3jhLiTr3Fnp1+nppZCugTKGkMhqP80fxbWpIMJ5zA8YA7
 1gWbA7SF9caV62O9pXa1jESeWwksLiaJrINht7QBbhMauK8WcR63UCQdD 0=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
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
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: lWvwvicNXMcC3Tj4Q5I0AzV5+nHcemSdDXPWh6cqEbWhCipIS8x8/+eui1qnGzyBql1RaR859l
 /oYKIUdusRPNcpdy4ClChphOSr2AyJGLZ98MmdvqWl6MQRGbFnMF89Jt/ongmYBXu9VE33EtEj
 /drg7bvN1/YWaneoMCR57okw7giY7QDnoPH43hRejkOAAUOqHKq1uUenF2jfA8WNuwb88MY2f3
 DmOuKsdtQL3KLeUZimAl8nNvefED2AFmYm21Eyhk7Px9czWCMCvRDlwo2zsC1FE8WFROaUd2vm
 tSQ=
X-SBRS: 2.7
X-MesageID: 10899659
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,319,1574139600"; d="scan'208";a="10899659"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 14 Jan 2020 19:13:45 +0100
Message-ID: <20200114181345.27565-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] x86/hvmloader: align BAR position to 4K
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2hlbiBwbGFjaW5nIEJBUnMgd2l0aCBzaXplcyBzbWFsbGVyIHRoYW4gNEsgbXVsdGlwbGUgQkFS
cyBjYW4gZW5kCnVwIG1hcHBlZCB0byB0aGUgc2FtZSBndWVzdCBwaHlzaWNhbCBhZGRyZXNzLCBh
bmQgdGh1cyB3b24ndCB3b3JrCmNvcnJlY3RseS4KCkFsaWduIGFsbCBCQVJzIHBsYWNlbWVudCB0
byA0SyBpbiBodm1sb2FkZXIgdG8gcHJldmVudCBzdWNoCm92ZXJsYXBwaW5nLgoKTm90ZSB0aGF0
IHRoZSBndWVzdCBjYW4gc3RpbGwgbW92ZSB0aGUgQkFScyBhcm91bmQgYW5kIGNyZWF0ZSB0aGlz
CmNvbGxpc2lvbnMsIGFuZCB0aGF0IEJBUnMgbm90IGZpbGxpbmcgdXAgYSBwaHlzaWNhbCBwYWdl
IG1pZ2h0IGxlYWsKYWNjZXNzIHRvIG90aGVyIE1NSU8gcmVnaW9ucyBwbGFjZWQgaW4gdGhlIHNh
bWUgaG9zdCBwaHlzaWNhbCBwYWdlLgoKVGhpcyBpcyBob3dldmVyIG5vIHdvcnNlIHRoYW4gd2hh
dCdzIGN1cnJlbnRseSBkb25lLCBhbmQgaGVuY2Ugc2hvdWxkCmJlIGNvbnNpZGVyZWQgYW4gaW1w
cm92ZW1lbnQgb3ZlciB0aGUgY3VycmVudCBzdGF0ZS4KClNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBh
dSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgotLS0KIHRvb2xzL2Zpcm13YXJlL2h2bWxv
YWRlci9wY2kuYyAgfCA0ICsrKysKIHRvb2xzL2Zpcm13YXJlL2h2bWxvYWRlci91dGlsLmggfCAy
ICsrCiAyIGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3Rvb2xz
L2Zpcm13YXJlL2h2bWxvYWRlci9wY2kuYyBiL3Rvb2xzL2Zpcm13YXJlL2h2bWxvYWRlci9wY2ku
YwppbmRleCAwYjcwOGJmNTc4Li5jNDMzYjM0Y2Q2IDEwMDY0NAotLS0gYS90b29scy9maXJtd2Fy
ZS9odm1sb2FkZXIvcGNpLmMKKysrIGIvdG9vbHMvZmlybXdhcmUvaHZtbG9hZGVyL3BjaS5jCkBA
IC00ODksNiArNDg5LDEwIEBAIHZvaWQgcGNpX3NldHVwKHZvaWQpCiAKICAgICAgICAgcmVzb3Vy
Y2UtPmJhc2UgPSBiYXNlOwogCisgICAgICAgIGlmICggKGJhcl9kYXRhICYgUENJX0JBU0VfQURE
UkVTU19TUEFDRSkgPT0KKyAgICAgICAgICAgICBQQ0lfQkFTRV9BRERSRVNTX1NQQUNFX01FTU9S
WSApCisgICAgICAgICAgICByZXNvdXJjZS0+YmFzZSA9IFJPVU5EVVAocmVzb3VyY2UtPmJhc2Us
IFBBR0VfU0laRSk7CisKICAgICAgICAgcGNpX3dyaXRlbChkZXZmbiwgYmFyX3JlZywgYmFyX2Rh
dGEpOwogICAgICAgICBpZiAodXNpbmdfNjRiYXIpCiAgICAgICAgICAgICBwY2lfd3JpdGVsKGRl
dmZuLCBiYXJfcmVnICsgNCwgYmFyX2RhdGFfdXBwZXIpOwpkaWZmIC0tZ2l0IGEvdG9vbHMvZmly
bXdhcmUvaHZtbG9hZGVyL3V0aWwuaCBiL3Rvb2xzL2Zpcm13YXJlL2h2bWxvYWRlci91dGlsLmgK
aW5kZXggN2JjYTY0MThkMi4uYjU1NTRiNTg0NCAxMDA2NDQKLS0tIGEvdG9vbHMvZmlybXdhcmUv
aHZtbG9hZGVyL3V0aWwuaAorKysgYi90b29scy9maXJtd2FyZS9odm1sb2FkZXIvdXRpbC5oCkBA
IC01MSw2ICs1MSw4IEBAIHZvaWQgX19idWcoY2hhciAqZmlsZSwgaW50IGxpbmUpIF9fYXR0cmli
dXRlX18oKG5vcmV0dXJuKSk7CiAjZGVmaW5lIE1CKG1iKSAobWIjI1VMTCA8PCAyMCkKICNkZWZp
bmUgR0IoZ2IpIChnYiMjVUxMIDw8IDMwKQogCisjZGVmaW5lIFJPVU5EVVAoeCwgYSkgKCgoeCkg
KyAoYSkgLSAxKSAmIH4oKGEpIC0gMSkpCisKIHN0YXRpYyBpbmxpbmUgaW50IHRlc3RfYml0KHVu
c2lnbmVkIGludCBiLCBjb25zdCB2b2lkICpwKQogewogICAgIHJldHVybiAhISgoKGNvbnN0IHVp
bnQ4X3QgKilwKVtiPj4zXSAmICgxdTw8KGImNykpKTsKLS0gCjIuMjQuMQoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
