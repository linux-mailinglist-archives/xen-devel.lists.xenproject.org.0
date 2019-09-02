Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1327A55B4
	for <lists+xen-devel@lfdr.de>; Mon,  2 Sep 2019 14:15:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i4lBd-0007LZ-MI; Mon, 02 Sep 2019 12:11:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jggy=W5=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1i4lBc-0007LP-AC
 for xen-devel@lists.xenproject.org; Mon, 02 Sep 2019 12:11:56 +0000
X-Inumbo-ID: d9b80081-cd7a-11e9-aea1-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d9b80081-cd7a-11e9-aea1-12813bfff9fa;
 Mon, 02 Sep 2019 12:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1567426316;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CqgR/RHdhNltlblA7nkz/ZnEPWCzyYZ4hsOB0ToZdVE=;
 b=VSu1xpakTmYN+rLf/ZV8iV7NwnmqR/t4w3MFqQd6f6SmfcRsGdPnKsm3
 lnP9/OzGqUIJkVR6EyTCRDwU98kg+I/g9j7JbyFAahpNsWuwxay52FlsO
 gBoaYXzgdguPfqa6n3LWRN3FFXv4/rn9NP+ZeyZsP/INKUkriRtOhM/3x 8=;
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
IronPort-SDR: bro0QrskLfeX/GqsCO+LDMZ89xz1HF+7pk80gs3KslECtevHUfIH9acPsMHARtM28adm1hO+Xp
 ogy7sUmgIR1Ae4qeYNFlAJGzqLSQZxavIY0q71/kh603vVklECFyY2lBgqlVt0R9IkYh9AXeFw
 gMONqd4Mk8pj7lCEnQgWqSDsEZZTH2HpwaIuERVqNYjKN/bwHqKoemQ4U6IgeZ3w+lUf0YD3QD
 jYoZiS9O2GeGrL7hKvqEzjSqF0Me/C7BiwzHoh7UQf8yZ+unAk7UCF+v+em0RC0rBa/hSr/n9n
 v/o=
X-SBRS: 2.7
X-MesageID: 5064152
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,459,1559534400"; 
   d="scan'208";a="5064152"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Mon, 2 Sep 2019 13:11:51 +0100
Message-ID: <20190902121151.11384-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190902121151.11384-1-andrew.cooper3@citrix.com>
References: <20190902121151.11384-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 2/2] x86/apci: Adjust command line parsing for
 "acpi_sleep"
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

UGVyZm9ybSBwYXJzaW5nIGluIGEgY3VzdG9tX3BhcmFtLCByYXRoZXIgdGhhbiBzdGFzaGluZyB0
aGUgY29udGVudCBpbiBhCnN0cmluZyBhbmQgcGFyc2luZyBpbiBhbiBpbml0Y2FsbC4gIEFkanVz
dCB0aGUgcGFyc2luZyB0byBjb25mb3JtIHRvIGN1cnJlbnQKc3RhbmRhcmRzLgoKTm8gcHJhY3Rp
Y2FsIGNoYW5nZS4KClNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIz
QGNpdHJpeC5jb20+Ci0tLQpDQzogSmFuIEJldWxpY2ggPEpCZXVsaWNoQHN1c2UuY29tPgpDQzog
V2VpIExpdSA8d2xAeGVuLm9yZz4KQ0M6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRy
aXguY29tPgoKVGhlIHJlYXNvbiB0aGF0IGZsYWdzIGlzIHB1bGxlZCBpbnRvIGEgbG9jYWwgdmFy
aWFibGUgaXMgdGhhdCB0aGUgY29kZWdlbiBmb3IKYWNwaV92aWRlb19mbGFncyBpcyBhdHRyb2Np
b3VzLCAyNjAgYnl0ZXMhLCBhbmQgZG91YmxlcyB1cCB3aGVuIHVzZWQgdHdpY2UuCi0tLQogeGVu
L2FyY2gveDg2L2FjcGkvcG93ZXIuYyB8IDQ3ICsrKysrKysrKysrKysrKysrKysrKysrKysrLS0t
LS0tLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMjYgaW5zZXJ0aW9ucygrKSwgMjEg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2FjcGkvcG93ZXIuYyBiL3hl
bi9hcmNoL3g4Ni9hY3BpL3Bvd2VyLmMKaW5kZXggNmFlOWUyOTIyOS4uMWNlNWRlMjIxZSAxMDA2
NDQKLS0tIGEveGVuL2FyY2gveDg2L2FjcGkvcG93ZXIuYworKysgYi94ZW4vYXJjaC94ODYvYWNw
aS9wb3dlci5jCkBAIC0zMyw4ICszMywzMiBAQAogCiB1aW50MzJfdCBzeXN0ZW1fcmVzZXRfY291
bnRlciA9IDE7CiAKLXN0YXRpYyBjaGFyIF9faW5pdGRhdGEgb3B0X2FjcGlfc2xlZXBbMjBdOwot
c3RyaW5nX3BhcmFtKCJhY3BpX3NsZWVwIiwgb3B0X2FjcGlfc2xlZXApOworc3RhdGljIGludCBw
YXJzZV9hY3BpX3NsZWVwKGNvbnN0IGNoYXIgKnMpCit7CisgICAgY29uc3QgY2hhciAqc3M7Cisg
ICAgdW5zaWduZWQgaW50IGZsYWcgPSAwOworICAgIGludCByYyA9IDA7CisKKyAgICBkbyB7Cisg
ICAgICAgIHNzID0gc3RyY2hyKHMsICcsJyk7CisgICAgICAgIGlmICggIXNzICkKKyAgICAgICAg
ICAgIHNzID0gc3RyY2hyKHMsICdcMCcpOworCisgICAgICAgIGlmICggIWNtZGxpbmVfc3RyY21w
KHMsICJzM19iaW9zIikgKQorICAgICAgICAgICAgZmxhZyB8PSAxOworICAgICAgICBlbHNlIGlm
ICggIWNtZGxpbmVfc3RyY21wKHMsICJzM19tb2RlIikgKQorICAgICAgICAgICAgZmxhZyB8PSAy
OworICAgICAgICBlbHNlCisgICAgICAgICAgICByYyA9IC1FSU5WQUw7CisKKyAgICAgICAgcyA9
IHNzICsgMTsKKyAgICB9IHdoaWxlICggKnNzICk7CisKKyAgICBhY3BpX3ZpZGVvX2ZsYWdzID0g
ZmxhZzsKKworICAgIHJldHVybiAwOworfQorY3VzdG9tX3J1bnRpbWVfcGFyYW0oImFjcGlfc2xl
ZXAiLCBwYXJzZV9hY3BpX3NsZWVwKTsKIAogc3RhdGljIERFRklORV9TUElOTE9DSyhwbV9sb2Nr
KTsKIApAQCAtNDU2LDIyICs0ODAsMyBAQCBhY3BpX3N0YXR1cyBhY3BpX2VudGVyX3NsZWVwX3N0
YXRlKHU4IHNsZWVwX3N0YXRlKQogCiAgICAgcmV0dXJuX0FDUElfU1RBVFVTKEFFX09LKTsKIH0K
LQotc3RhdGljIGludCBfX2luaXQgYWNwaV9zbGVlcF9pbml0KHZvaWQpCi17Ci0gICAgY2hhciAq
cCA9IG9wdF9hY3BpX3NsZWVwOwotCi0gICAgd2hpbGUgKCAocCAhPSBOVUxMKSAmJiAoKnAgIT0g
J1wwJykgKQotICAgIHsKLSAgICAgICAgaWYgKCAhc3RybmNtcChwLCAiczNfYmlvcyIsIDcpICkK
LSAgICAgICAgICAgIGFjcGlfdmlkZW9fZmxhZ3MgfD0gMTsKLSAgICAgICAgaWYgKCAhc3RybmNt
cChwLCAiczNfbW9kZSIsIDcpICkKLSAgICAgICAgICAgIGFjcGlfdmlkZW9fZmxhZ3MgfD0gMjsK
LSAgICAgICAgcCA9IHN0cmNocihwLCAnLCcpOwotICAgICAgICBpZiAoIHAgIT0gTlVMTCApCi0g
ICAgICAgICAgICBwICs9IHN0cnNwbihwLCAiLCBcdCIpOwotICAgIH0KLQotICAgIHJldHVybiAw
OwotfQotX19pbml0Y2FsbChhY3BpX3NsZWVwX2luaXQpOwotLSAKMi4xMS4wCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
