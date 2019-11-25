Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A0351092BA
	for <lists+xen-devel@lfdr.de>; Mon, 25 Nov 2019 18:24:44 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZI4M-0002O6-5u; Mon, 25 Nov 2019 17:22:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cgds=ZR=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iZI4K-0002Nv-Fg
 for xen-devel@lists.xenproject.org; Mon, 25 Nov 2019 17:22:36 +0000
X-Inumbo-ID: 29dcc89d-0fa8-11ea-a393-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 29dcc89d-0fa8-11ea-a393-12813bfff9fa;
 Mon, 25 Nov 2019 17:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1574702552;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yDVp1LL0C3gqIApehOZdbVQocO/+1vjgC5EWplLyS+g=;
 b=ZJwzFOOdgCP/TOp2L6RmUfkULNI5IPJqmB/h+MD6X3NS62FbpbwJOflF
 TPe9jL8TPiz1ToohkDo16D0Y6js9Xgl3G6CATMYgzU5f1WOo4X/lrOj7s
 i5ILBXsJpGNcYwccb+o9E/rixpSc1Q9/FxgyLFoMoa3/aJjvBd5aB/gnB A=;
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
IronPort-SDR: iPksKnYeTMhYWE/QZoznU8HotAXdvRMmeE3koLD2pULWUZGrtZQrLJtQK2HzB0al299lrqNFnL
 WsVBEr6linaRf9lNboSwI+w4D+xz2OUbN7/bLft0jQ5iZFkdLJEwHp5+TBVzf9BGeGBAJ0TC4o
 NniGPtufpkyZIrNv+AxCivhZaFybHPXh/QCh48RbVAHS50Iad7r8d0KWTLfFwKEtA+mcDPgcij
 sVfBG8lp1HIjlJvnpjFrvFeE98Goqhv6EMGXxCFJRkz8x/7jwSY0qCMysswkzeHSQcNpux4Y9l
 x04=
X-SBRS: 2.7
X-MesageID: 8801970
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,242,1571716800"; 
   d="scan'208";a="8801970"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 25 Nov 2019 18:22:12 +0100
Message-ID: <20191125172213.1904-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191125172213.1904-1-roger.pau@citrix.com>
References: <20191125172213.1904-1-roger.pau@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 1/2] x86/tlbflush: do not toggle the PGE CR4 bit
 unless necessary
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

V2hlbiBQQ0lEIGlzIG5vdCBhdmFpbGFibGUgWGVuIGRvZXMgYSBmdWxsIHRsYmZsdXNoIGJ5IHRv
Z2dsaW5nIHRoZQpQR0UgYml0IGluIENSNC4gVGhpcyBpcyBub3QgbmVjZXNzYXJ5IGlmIFBHRSBp
cyBub3QgZW5hYmxlZCwgc2luY2UgYQpmbHVzaCBjYW4gYmUgcGVyZm9ybWVkIGJ5IHdyaXRpbmcg
dG8gQ1IzIGluIHRoYXQgY2FzZS4KCkNoYW5nZSB0aGUgY29kZSBpbiBkb190bGJfZmx1c2ggdG8g
b25seSB0b2dnbGUgdGhlIFBHRSBiaXQgaW4gQ1I0IGlmCml0J3MgYWxyZWFkeSBlbmFibGVkLCBv
dGhlcndpc2UgZG8gdGhlIHRsYiBmbHVzaCBieSB3cml0aW5nIHRvIENSMy4KVGhpcyBpcyByZWxl
dmFudCB3aGVuIHJ1bm5pbmcgdmlydHVhbGl6ZWQsIHNpbmNlIGh5cGVydmlzb3JzIGRvbid0CnVz
dWFsbHkgdHJhcCBhY2Nlc3NlcyB0byBDUjMgd2hlbiB1c2luZyBoYXJkd2FyZSBhc3Npc3RlZCBw
YWdpbmcsIGJ1dApkbyB0cmFwIGFjY2Vzc2VzIHRvIENSNCBzcGVjaWFsbHkgb24gQU1EIGhhcmR3
YXJlLCB3aGljaCBtYWtlcyBzdWNoCmFjY2Vzc2VzIG11Y2ggbW9yZSBleHBlbnNpdmUuCgpTaWdu
ZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KLS0tCiB4
ZW4vYXJjaC94ODYvZmx1c2h0bGIuYyB8IDkgKysrKystLS0tCiAxIGZpbGUgY2hhbmdlZCwgNSBp
bnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9m
bHVzaHRsYi5jIGIveGVuL2FyY2gveDg2L2ZsdXNodGxiLmMKaW5kZXggYzFhZTBkOTQ2Ny4uNTQw
MjA5Yzg1NiAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L2ZsdXNodGxiLmMKKysrIGIveGVuL2Fy
Y2gveDg2L2ZsdXNodGxiLmMKQEAgLTg0LDYgKzg0LDcgQEAgc3RhdGljIHZvaWQgcG9zdF9mbHVz
aCh1MzIgdCkKIHN0YXRpYyB2b2lkIGRvX3RsYl9mbHVzaCh2b2lkKQogewogICAgIHVuc2lnbmVk
IGxvbmcgZmxhZ3M7CisgICAgdW5zaWduZWQgbG9uZyBjcjQ7CiAgICAgdTMyIHQ7CiAKICAgICAv
KiBUaGlzIG5vbi1yZWVudHJhbnQgZnVuY3Rpb24gaXMgc29tZXRpbWVzIGNhbGxlZCBpbiBpbnRl
cnJ1cHQgY29udGV4dC4gKi8KQEAgLTkzLDEzICs5NCwxMyBAQCBzdGF0aWMgdm9pZCBkb190bGJf
Zmx1c2godm9pZCkKIAogICAgIGlmICggdXNlX2ludnBjaWQgKQogICAgICAgICBpbnZwY2lkX2Zs
dXNoX2FsbCgpOwotICAgIGVsc2UKKyAgICBlbHNlIGlmICggKGNyNCA9IHJlYWRfY3I0KCkpICYg
WDg2X0NSNF9QR0UgKQogICAgIHsKLSAgICAgICAgdW5zaWduZWQgbG9uZyBjcjQgPSByZWFkX2Ny
NCgpOwotCi0gICAgICAgIHdyaXRlX2NyNChjcjQgXiBYODZfQ1I0X1BHRSk7CisgICAgICAgIHdy
aXRlX2NyNChjcjQgJiB+WDg2X0NSNF9QR0UpOwogICAgICAgICB3cml0ZV9jcjQoY3I0KTsKICAg
ICB9CisgICAgZWxzZQorICAgICAgICB3cml0ZV9jcjMocmVhZF9jcjMoKSk7CiAKICAgICBwb3N0
X2ZsdXNoKHQpOwogCi0tIAoyLjI0LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
