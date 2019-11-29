Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A572D10D4E6
	for <lists+xen-devel@lfdr.de>; Fri, 29 Nov 2019 12:32:30 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iaeT3-0006qp-Le; Fri, 29 Nov 2019 11:29:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=YUI4=ZV=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iaeT1-0006qe-MX
 for xen-devel@lists.xenproject.org; Fri, 29 Nov 2019 11:29:43 +0000
X-Inumbo-ID: 86dca29c-129b-11ea-a3e3-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 86dca29c-129b-11ea-a3e3-12813bfff9fa;
 Fri, 29 Nov 2019 11:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1575026978;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sQ0XLdjh/Fs15+1JwkEDWJDg2qfluPMHMfcwwCyy4mY=;
 b=bhwbMKrT4iVjKbjV0xXd29lolkUgWM+Tnrswl1LTpR4IJBLKn3BpksEu
 CPvu/c0CYYRC0a6ghIXcmGLygNE1G7K9439hleycWSahxx4HsWoeNUfil
 iSsxhz74iBlt2HWSeRJtqgLbUpmJgBlSJ5gPJEDciPEMruIczSjbEzGWz I=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: ZMGsBGbObLOagAGMhhjG7px077dS92xMJBYi92JzuOK4OptHn3Q8lwi6VPy7ZXOoIak6EjNdFP
 gna21/8r9t/prTk3E15+UTMJ3DD3hZAFnKn6tY6vAGZZyoorH6+xSjiXWqmF2F8aWHsMKN0HNx
 xj/Hc0QQFLJcJfBvh0EdBjhSKmiIFM1lz3jaL3n8dTOp877qkNIFJBWhiz3jooXKoBbzI4VU5h
 AefPx81BElZ2Qnc8PRbHvE63jMXXit79rhUTSIZYVogb8OVWGbk/Kia+uuUCyfG3PLH3A2pZLm
 epQ=
X-SBRS: 2.7
X-MesageID: 9338026
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,257,1571716800"; 
   d="scan'208";a="9338026"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 29 Nov 2019 12:28:49 +0100
Message-ID: <20191129112851.19273-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191129112851.19273-1-roger.pau@citrix.com>
References: <20191129112851.19273-1-roger.pau@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 2/4] x86/apic: force phys mode if interrupt
 remapping is disabled
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

Q2x1c3RlciBtb2RlIGNhbiBvbmx5IGJlIHVzZWQgd2l0aCBpbnRlcnJ1cHQgcmVtYXBwaW5nIHN1
cHBvcnQsIHNpbmNlCnRoZSB0b3AgMTZiaXRzIG9mIHRoZSBBUElDIElEIGFyZSBmaWxsZWQgd2l0
aCB0aGUgY2x1c3RlciBJRCwgYW5kCmhlbmNlIG9uIHN5c3RlbXMgd2hlcmUgdGhlIHBoeXNpY2Fs
IElEIGlzIHN0aWxsIHNtYWxsZXIgdGhhbiAyNTUgdGhlCmNsdXN0ZXIgSUQgaXMgbm90LiBGb3Jj
ZSB4MkFQSUMgdG8gdXNlIHBoeXNpY2FsIG1vZGUgaWYgdGhlcmUncyBubwppbnRlcnJ1cHQgcmVt
YXBwaW5nIHN1cHBvcnQuCgpOb3RlIHRoYXQgdGhpcyByZXF1aXJlcyBhIGZ1cnRoZXIgcGF0Y2gg
aW4gb3JkZXIgdG8gZW5hYmxlIHgyQVBJQwp3aXRob3V0IGludGVycnVwdCByZW1hcHBpbmcgc3Vw
cG9ydC4KClNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXgu
Y29tPgotLS0KQ2hhbmdlcyBzaW5jZSB2MToKIC0gTmV3IGluIHRoaXMgdmVyc2lvbi4KLS0tCiB4
ZW4vYXJjaC94ODYvZ2VuYXBpYy94MmFwaWMuYyB8IDggKysrKysrKysKIDEgZmlsZSBjaGFuZ2Vk
LCA4IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvZ2VuYXBpYy94MmFw
aWMuYyBiL3hlbi9hcmNoL3g4Ni9nZW5hcGljL3gyYXBpYy5jCmluZGV4IGQ1YTE3ZjEwZDUuLjdl
MzJlZTIyZmYgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9nZW5hcGljL3gyYXBpYy5jCisrKyBi
L3hlbi9hcmNoL3g4Ni9nZW5hcGljL3gyYXBpYy5jCkBAIC0yMjgsNiArMjI4LDE0IEBAIGNvbnN0
IHN0cnVjdCBnZW5hcGljICpfX2luaXQgYXBpY194MmFwaWNfcHJvYmUodm9pZCkKICAgICBpZiAo
IHgyYXBpY19waHlzIDwgMCApCiAgICAgICAgIHgyYXBpY19waHlzID0gISEoYWNwaV9nYmxfRkFE
VC5mbGFncyAmIEFDUElfRkFEVF9BUElDX1BIWVNJQ0FMKTsKIAorICAgIGlmICggIXgyYXBpY19w
aHlzICYmICFpb21tdV9pbnRyZW1hcCApCisgICAgICAgIC8qCisgICAgICAgICAqIEZvcmNlIHBo
eXNpY2FsIG1vZGUgaWYgdGhlcmUncyBubyBpbnRlcnJ1cHQgcmVtYXBwaW5nIHN1cHBvcnQ6IHRo
ZQorICAgICAgICAgKiBJRCBpbiBjbHVzdGVyZWQgbW9kZSByZXF1aXJlcyBhIDMyIGJpdCBkZXN0
aW5hdGlvbiBmaWVsZCBkdWUgdG8gdGhlCisgICAgICAgICAqIHVzYWdlIG9mIHRoZSBoaWdoIDE2
IGJpdHMgdG8gc3RvcmUgdGhlIGNsdXN0ZXIgSUQuCisgICAgICAgICAqLworICAgICAgICB4MmFw
aWNfcGh5cyA9IHRydWU7CisKICAgICBpZiAoIHgyYXBpY19waHlzICkKICAgICAgICAgcmV0dXJu
ICZhcGljX3gyYXBpY19waHlzOwogCi0tIAoyLjI0LjAKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
