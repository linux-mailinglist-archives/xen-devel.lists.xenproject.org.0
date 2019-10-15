Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF457D7A6E
	for <lists+xen-devel@lfdr.de>; Tue, 15 Oct 2019 17:50:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iKP3i-0006uQ-Jp; Tue, 15 Oct 2019 15:48:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=JiiH=YI=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iKP3g-0006u8-Ua
 for xen-devel@lists.xenproject.org; Tue, 15 Oct 2019 15:48:24 +0000
X-Inumbo-ID: 338a037f-ef63-11e9-9396-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 338a037f-ef63-11e9-9396-12813bfff9fa;
 Tue, 15 Oct 2019 15:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1571154496;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CwG9FoDNNaNrnAzwi1LDXmD0Mhp0qmEEwxaNTwdnO6I=;
 b=hQhuFvy68vtkUXgmq94YW10qcmIJH1Hf5CP2rrMxDFHSl3DVDa+evBK/
 LmpSertAZEia9gM+/oDmSrD8NM7SVyKfEM1AT1unCGoYq6Wu1QA9BcTXE
 H2Y32XSzFJeUL3D+JK+fuxufU3n21K7Dcd+sXSXZ92Z7r+zv/EvUqxEAY E=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: CypyybIhGXy+DnSwugSYaLxDky0P8mB01N9i6dxeoE7/3NGpId1CEPIVq4wqWZJokYaECbKK2s
 J/Xi6Wg/wNr/896CsJU7LtfXqN7twarZeHTR9t+hjr6wGu84i9/S2ambYKmRr7t9/6R83ILse+
 hmFOVbIqLFCOJsASNO1wSYUs5WkrILYHfZ7iqOUkTNmzWgW+HoXBs1XhHsKXdJOqsceVsny6uV
 YZ80yqhhRws5WVXk7DRkYU53BtoPFmRncQ64RGlhkY5Lo+BaSKRqfY904gN2AubCRY1GvoE6SB
 rvM=
X-SBRS: 2.7
X-MesageID: 7228589
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,300,1566878400"; 
   d="scan'208";a="7228589"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 15 Oct 2019 17:47:34 +0200
Message-ID: <20191015154736.19882-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191015154736.19882-1-roger.pau@citrix.com>
References: <20191015154736.19882-1-roger.pau@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 2/4] x2APIC: simplify resume
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
Cc: Juergen Gross <jgross@suse.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Jan Beulich <jbeulich@suse.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlcmUncyBubyBuZWVkIHRvIHNhdmUgYW5kIHJlc3RvcmUgdGhlIElPLUFQSUMgZW50cmllcywg
dGhlIGVudHJpZXMKcHJpb3IgdG8gc3VzcGVuc2lvbiBoYXZlIGFscmVhZHkgYmVlbiBzYXZlZCBi
eSBpb2FwaWNfc3VzcGVuZCwgYW5kCndpbGwgYmUgcmVzdG9yZWQgYnkgaW9hcGljX3Jlc3VtZS4g
Tm90ZSB0aGF0IGF0IHRoZSBwb2ludCB3aGVyZQpyZXN1bWVfeDJhcGljIGdldHMgY2FsbGVkIHRo
ZSBJTy1BUElDIGhhcyBub3QgeWV0IHJlc3VtZWQsIGFuZCBoZW5jZQphbGwgZW50cmllcyBzaG91
bGQgYmUgbWFza2VkLgoKTm90ZSB0aGlzIHNob3VsZG4ndCBpbnRyb2R1Y2UgYW55IGZ1bmN0aW9u
YWwgY2hhbmdlLgoKU3VnZ2VzdGVkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+
ClNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgot
LS0KSSdtIENjaW5nIE1hcmVrIHNpbmNlIEkgdGhpbmsgaGUgdXN1YWxseSB0ZXN0cyBzdXNwZW5k
L3Jlc3VtZS4gQ291bGQKeW91IGdpdmUgdGhpcyBwYXRjaCBhIHRyeT8KLS0tCkNjOiBNYXJlayBN
YXJjenlrb3dza2ktR8OzcmVja2kgPG1hcm1hcmVrQGludmlzaWJsZXRoaW5nc2xhYi5jb20+CkNj
OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+Ci0tLQpDaGFuZ2VzIHNpbmNlIHYyOgog
LSBOZXcgaW4gdGhpcyB2ZXJzaW9uLgotLS0KIHhlbi9hcmNoL3g4Ni9hcGljLmMgfCAyNyAtLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAyNyBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvYXBpYy5jIGIveGVuL2FyY2gveDg2L2FwaWMuYwpp
bmRleCA2Y2RiNTBjZjQxLi4wNjA3ZWI5MmE4IDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvYXBp
Yy5jCisrKyBiL3hlbi9hcmNoL3g4Ni9hcGljLmMKQEAgLTQ5MiwzNSArNDkyLDggQEAgc3RhdGlj
IHZvaWQgX19lbmFibGVfeDJhcGljKHZvaWQpCiAKIHN0YXRpYyB2b2lkIHJlc3VtZV94MmFwaWMo
dm9pZCkKIHsKLSAgICBzdHJ1Y3QgSU9fQVBJQ19yb3V0ZV9lbnRyeSAqKmlvYXBpY19lbnRyaWVz
ID0gTlVMTDsKLQotICAgIEFTU0VSVCh4MmFwaWNfZW5hYmxlZCk7Ci0KLSAgICBpb2FwaWNfZW50
cmllcyA9IGFsbG9jX2lvYXBpY19lbnRyaWVzKCk7Ci0gICAgaWYgKCAhaW9hcGljX2VudHJpZXMg
KQotICAgIHsKLSAgICAgICAgcHJpbnRrKCJBbGxvY2F0ZSBpb2FwaWNfZW50cmllcyBmYWlsZWRc
biIpOwotICAgICAgICBnb3RvIG91dDsKLSAgICB9Ci0KLSAgICBpZiAoIHNhdmVfSU9fQVBJQ19z
ZXR1cChpb2FwaWNfZW50cmllcykgKQotICAgIHsKLSAgICAgICAgcHJpbnRrKCJTYXZpbmcgSU8t
QVBJQyBzdGF0ZSBmYWlsZWRcbiIpOwotICAgICAgICBnb3RvIG91dDsKLSAgICB9Ci0KLSAgICBt
YXNrXzgyNTlBKCk7Ci0gICAgbWFza19JT19BUElDX3NldHVwKGlvYXBpY19lbnRyaWVzKTsKLQog
ICAgIGlvbW11X2VuYWJsZV94MmFwaWMoKTsKICAgICBfX2VuYWJsZV94MmFwaWMoKTsKLQotICAg
IHJlc3RvcmVfSU9fQVBJQ19zZXR1cChpb2FwaWNfZW50cmllcyk7Ci0gICAgdW5tYXNrXzgyNTlB
KCk7Ci0KLW91dDoKLSAgICBpZiAoIGlvYXBpY19lbnRyaWVzICkKLSAgICAgICAgZnJlZV9pb2Fw
aWNfZW50cmllcyhpb2FwaWNfZW50cmllcyk7CiB9CiAKIHZvaWQgc2V0dXBfbG9jYWxfQVBJQyh2
b2lkKQotLSAKMi4yMy4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
