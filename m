Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E7C710D4E9
	for <lists+xen-devel@lfdr.de>; Fri, 29 Nov 2019 12:32:56 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iaeT0-0006qY-D3; Fri, 29 Nov 2019 11:29:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=YUI4=ZV=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iaeSy-0006qT-RP
 for xen-devel@lists.xenproject.org; Fri, 29 Nov 2019 11:29:40 +0000
X-Inumbo-ID: 87c2042c-129b-11ea-b155-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 87c2042c-129b-11ea-b155-bc764e2007e4;
 Fri, 29 Nov 2019 11:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1575026981;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=M6WVb9qVoCWSq+IksgaLNw4MVZZQraMScTx5Z7NZA6E=;
 b=WXhEDyoEFzoaKW9wPKo5DbkBw7fPaaYyVwlX38Sc30fKleBSx+S7oR3U
 NZ2hvZtLmYl+09QOtGh3EFcOewazKilBjcyfG8PRaZlrFgW9rylL6fVNA
 OHOgROQ8hL1bn/UJcav5SXIewPhzDgK7V96K4besqDNFFMqK80mtQM7el U=;
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
IronPort-SDR: doxhNnF1hksrFHfv1jmCQBG25XC1DX4KXwADCDy2OtipLAWGnrSfDw4D5ZbSvOFa0fXl8rF+/3
 as2+F+NqOxhLxLc6iINiW3LpXeZUI9i0AGW2nzZOTg6oGGXyTJrRd7l/wqdtJN2MKKsoeKUciZ
 wDJvcHsSIeJzOQh6Dtgr5OMe7XMUGW31e+AUma2BpM1KfvkLwIZowxCM6V2IjwO96k2f2vXym7
 /VHGW642PV9RWZ+BD6dY2/Wc4XiG9iQ2T6rjz1M76Wm+uXBwMrR7EKk2ZN/lhRFWkxNPyoGnIe
 ZMs=
X-SBRS: 2.7
X-MesageID: 8987262
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,257,1571716800"; 
   d="scan'208";a="8987262"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 29 Nov 2019 12:28:50 +0100
Message-ID: <20191129112851.19273-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191129112851.19273-1-roger.pau@citrix.com>
References: <20191129112851.19273-1-roger.pau@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 3/4] x86/smp: check APIC ID on AP bringup
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

Q2hlY2sgdGhhdCB0aGUgcHJvY2Vzc29yIHRvIGJlIHdva2VuIHVwIEFQSUMgSUQgaXMgYWRkcmVz
c2FibGUgaW4gdGhlCmN1cnJlbnQgQVBJQyBtb2RlLgoKTm90ZSB0aGF0IGluIHByYWN0aWNlIHN5
c3RlbXMgd2l0aCBBUElDIElEcyA+IDI1NSBzaG91bGQgYWxyZWFkeSBoYXZlCngyQVBJQyBlbmFi
bGVkIGJ5IHRoZSBmaXJtd2FyZSwgYW5kIGhlbmNlIHRoaXMgaXMgbW9zdGx5IGEgc2FmZXR5CmJl
bHQuCgpTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNv
bT4KLS0tCiB4ZW4vYXJjaC94ODYvc21wYm9vdC5jIHwgNyArKysrKysrCiAxIGZpbGUgY2hhbmdl
ZCwgNyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L3NtcGJvb3QuYyBi
L3hlbi9hcmNoL3g4Ni9zbXBib290LmMKaW5kZXggZmE2OTFiNmJhMC4uNDg0ZDM0NGM0NCAxMDA2
NDQKLS0tIGEveGVuL2FyY2gveDg2L3NtcGJvb3QuYworKysgYi94ZW4vYXJjaC94ODYvc21wYm9v
dC5jCkBAIC0xMzE3LDYgKzEzMTcsMTMgQEAgaW50IF9fY3B1X3VwKHVuc2lnbmVkIGludCBjcHUp
CiAgICAgaWYgKCAoYXBpY2lkID0geDg2X2NwdV90b19hcGljaWRbY3B1XSkgPT0gQkFEX0FQSUNJ
RCApCiAgICAgICAgIHJldHVybiAtRU5PREVWOwogCisgICAgaWYgKCAoIXgyYXBpY19lbmFibGVk
IHx8ICFpb21tdV9pbnRyZW1hcCkgJiYgKGFwaWNpZCA+PiA4KSApCisgICAgeworICAgICAgICBw
cmludGsoIlByb2Nlc3NvciB3aXRoIEFQSUMgSUQgJXUgY2Fubm90IGJlIG9ubGluZWQgaW4geEFQ
SUMgbW9kZSAiCisgICAgICAgICAgICAgICAib3Igd2l0aG91dCBpbnRlcnJ1cHQgcmVtYXBwaW5n
XG4iLCBhcGljaWQpOworICAgICAgICByZXR1cm4gLUVJTlZBTDsKKyAgICB9CisKICAgICBpZiAo
IChyZXQgPSBkb19ib290X2NwdShhcGljaWQsIGNwdSkpICE9IDAgKQogICAgICAgICByZXR1cm4g
cmV0OwogCi0tIAoyLjI0LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
