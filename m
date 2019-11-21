Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EEF74105632
	for <lists+xen-devel@lfdr.de>; Thu, 21 Nov 2019 16:56:48 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iXomn-0007Mq-SE; Thu, 21 Nov 2019 15:54:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0uFN=ZN=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iXomm-0007Md-HM
 for xen-devel@lists.xenproject.org; Thu, 21 Nov 2019 15:54:24 +0000
X-Inumbo-ID: 2fecc9aa-0c77-11ea-a33c-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2fecc9aa-0c77-11ea-a33c-12813bfff9fa;
 Thu, 21 Nov 2019 15:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1574351663;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ni72YK4MQ3tW3zR5VLAk3DqhGd0LLmGdxnb57VoU8vc=;
 b=hkzZgbdGlz4ihJDLOQ1L5uxu/TElH+5So3rgGxhrDKGT6Md1z1vVNJHT
 ImNWNtP6R/I6wtRbPVfV2OwMzgB40tLmDYMwOHTEGIIDMDPZFN3cQrADO
 FxqozeThHN8CMfzd/dGy/m8nQEwaVMuL6odc7cZSBXFF8oRIfFfUcgd9B U=;
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
IronPort-SDR: 4zu0VCs2s2QXTatdlqnu7bLiRuguGvbbG13Gmc3um6HIFl2QAtukvTYP8RLL9f5XFDzIOK2PqF
 vdRVC7bR3+IBHaFnZp/sB1tMuKE2/LFdn2bGuA50FjLowRPDmI0AEtrZLDO+RkblNqRlUXuAco
 1hBh1BHnx6HHCoibsp/dnB+Q6e+nuASRqFQhwARyHSBoF5fbIFo7w3qzi7UnhBz7BqJDWxj0uh
 r5mf/88y/Mw6fzkswWXdibL/D4gao+cH94/tpMjt9zTnRtbZe+nJ4HkM0eIjZi5yTJ3PnQtZi/
 cXI=
X-SBRS: 2.7
X-MesageID: 8668388
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,226,1571716800"; 
   d="scan'208";a="8668388"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 21 Nov 2019 16:54:10 +0100
Message-ID: <20191121155411.13250-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191121155411.13250-1-roger.pau@citrix.com>
References: <20191121155411.13250-1-roger.pau@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 2/3] x86/smp: check APIC ID on AP bringup
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
L3hlbi9hcmNoL3g4Ni9zbXBib290LmMKaW5kZXggZjg2YzE1YmRlMy4uNGU5ZmU3ZTAzZSAxMDA2
NDQKLS0tIGEveGVuL2FyY2gveDg2L3NtcGJvb3QuYworKysgYi94ZW4vYXJjaC94ODYvc21wYm9v
dC5jCkBAIC0xMzE1LDYgKzEzMTUsMTMgQEAgaW50IF9fY3B1X3VwKHVuc2lnbmVkIGludCBjcHUp
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
