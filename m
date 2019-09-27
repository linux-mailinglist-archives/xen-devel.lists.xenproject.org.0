Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39F64C08EB
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2019 17:51:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDsUq-0007Br-FH; Fri, 27 Sep 2019 15:49:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=nII6=XW=citrix.com=ross.lagerwall@srs-us1.protection.inumbo.net>)
 id 1iDsUo-0007Bm-Uf
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2019 15:49:26 +0000
X-Inumbo-ID: 61cf3782-e13e-11e9-97fb-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by localhost (Halon) with ESMTPS
 id 61cf3782-e13e-11e9-97fb-bc764e2007e4;
 Fri, 27 Sep 2019 15:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569599366;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=KGAQM1rZaCD4lEAxN7aY1t7+lO/IJReRIyP73x1F5VQ=;
 b=PlTedcWsrgbGjCTZqyxUk2xpZrxl9NZC/VPCD5GGa8DRwYgaQt1hH4CM
 E/oPiK+/F1NJmP9BX5NXyFjKOYltQ3neET1qo2avb26ALG950lN/92Sh/
 j5fB1vQzCFuSvOAU4HLUU013dgEkO1cQtP7JjLQSWeYX+2JD/0n6kbZy0 U=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ross.lagerwall@citrix.com;
 spf=Pass smtp.mailfrom=ross.lagerwall@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ross.lagerwall@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="ross.lagerwall@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 ross.lagerwall@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="ross.lagerwall@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: NshxXvfUVHf0jLp4BKw3wWEBxdkf4eIxOcSF5RU0FKTiI2jtqAwjUBXjCzVhSFMMZlq8yRC4RY
 eDLczpUKwSyiF1m4Qi12cQ3q/F5+pXMJqzmI7iXmkPkdZh6WQbE+t8TarfGlmZUTBuHD1sUGFF
 ijJNPli7xX3bp16ZnR7DTtY12iRSk70DBMPEIVrHEIUTEwPQt89Qa2h0iB8gniNZBy0MjiUngk
 6O5gJjtbxy4BZAt2VQRraLWjtJp9WFvGoXKCoTjGtvcBpR1UpvL2UuDWIayACrJ1NyB2U1KEHw
 8AU=
X-SBRS: 2.7
X-MesageID: 6179359
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,556,1559534400"; 
   d="scan'208";a="6179359"
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 27 Sep 2019 16:49:20 +0100
Message-ID: <20190927154920.13713-1-ross.lagerwall@citrix.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] xen/efi: Set nonblocking callbacks
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Russell King <linux@armlinux.org.uk>,
 Ross Lagerwall <ross.lagerwall@citrix.com>, Ingo
 Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 "H. Peter Anvin" <hpa@zytor.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T3RoZXIgcGFydHMgb2YgdGhlIGtlcm5lbCBleHBlY3QgdGhlc2Ugbm9uYmxvY2tpbmcgRUZJIGNh
bGxiYWNrcyB0bwpleGlzdCBhbmQgY3Jhc2ggd2hlbiBydW5uaW5nIHVuZGVyIFhlbi4gU2luY2Ug
dGhlIGltcGxlbWVudGF0aW9ucyBvZgp4ZW5fZWZpX3NldF92YXJpYWJsZSgpIGFuZCB4ZW5fZWZp
X3F1ZXJ5X3ZhcmlhYmxlX2luZm8oKSBkbyBub3QgdGFrZSBhbnkKbG9ja3MsIHVzZSB0aGVtIGZv
ciB0aGUgbm9uYmxvY2tpbmcgY2FsbGJhY2tzIHRvby4KClNpZ25lZC1vZmYtYnk6IFJvc3MgTGFn
ZXJ3YWxsIDxyb3NzLmxhZ2Vyd2FsbEBjaXRyaXguY29tPgotLS0KIGFyY2gvYXJtL3hlbi9lZmku
YyB8IDIgKysKIGFyY2gveDg2L3hlbi9lZmkuYyB8IDIgKysKIDIgZmlsZXMgY2hhbmdlZCwgNCBp
bnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm0veGVuL2VmaS5jIGIvYXJjaC9hcm0v
eGVuL2VmaS5jCmluZGV4IGQ2ODdhNzMwNDRiZi4uY2IyYWFmOThlMjQzIDEwMDY0NAotLS0gYS9h
cmNoL2FybS94ZW4vZWZpLmMKKysrIGIvYXJjaC9hcm0veGVuL2VmaS5jCkBAIC0xOSw3ICsxOSw5
IEBAIHZvaWQgX19pbml0IHhlbl9lZmlfcnVudGltZV9zZXR1cCh2b2lkKQogCWVmaS5nZXRfdmFy
aWFibGUgICAgICAgICAgICAgPSB4ZW5fZWZpX2dldF92YXJpYWJsZTsKIAllZmkuZ2V0X25leHRf
dmFyaWFibGUgICAgICAgID0geGVuX2VmaV9nZXRfbmV4dF92YXJpYWJsZTsKIAllZmkuc2V0X3Zh
cmlhYmxlICAgICAgICAgICAgID0geGVuX2VmaV9zZXRfdmFyaWFibGU7CisJZWZpLnNldF92YXJp
YWJsZV9ub25ibG9ja2luZyA9IHhlbl9lZmlfc2V0X3ZhcmlhYmxlOwogCWVmaS5xdWVyeV92YXJp
YWJsZV9pbmZvICAgICAgPSB4ZW5fZWZpX3F1ZXJ5X3ZhcmlhYmxlX2luZm87CisJZWZpLnF1ZXJ5
X3ZhcmlhYmxlX2luZm9fbm9uYmxvY2tpbmcgPSB4ZW5fZWZpX3F1ZXJ5X3ZhcmlhYmxlX2luZm87
CiAJZWZpLnVwZGF0ZV9jYXBzdWxlICAgICAgICAgICA9IHhlbl9lZmlfdXBkYXRlX2NhcHN1bGU7
CiAJZWZpLnF1ZXJ5X2NhcHN1bGVfY2FwcyAgICAgICA9IHhlbl9lZmlfcXVlcnlfY2Fwc3VsZV9j
YXBzOwogCWVmaS5nZXRfbmV4dF9oaWdoX21vbm9fY291bnQgPSB4ZW5fZWZpX2dldF9uZXh0X2hp
Z2hfbW9ub19jb3VudDsKZGlmZiAtLWdpdCBhL2FyY2gveDg2L3hlbi9lZmkuYyBiL2FyY2gveDg2
L3hlbi9lZmkuYwppbmRleCAwZDMzNjVjYjY0ZGUuLjdlM2ViNzBmNDExYSAxMDA2NDQKLS0tIGEv
YXJjaC94ODYveGVuL2VmaS5jCisrKyBiL2FyY2gveDg2L3hlbi9lZmkuYwpAQCAtNjUsNyArNjUs
OSBAQCBzdGF0aWMgZWZpX3N5c3RlbV90YWJsZV90IF9faW5pdCAqeGVuX2VmaV9wcm9iZSh2b2lk
KQogCWVmaS5nZXRfdmFyaWFibGUgICAgICAgICAgICAgPSB4ZW5fZWZpX2dldF92YXJpYWJsZTsK
IAllZmkuZ2V0X25leHRfdmFyaWFibGUgICAgICAgID0geGVuX2VmaV9nZXRfbmV4dF92YXJpYWJs
ZTsKIAllZmkuc2V0X3ZhcmlhYmxlICAgICAgICAgICAgID0geGVuX2VmaV9zZXRfdmFyaWFibGU7
CisJZWZpLnNldF92YXJpYWJsZV9ub25ibG9ja2luZyA9IHhlbl9lZmlfc2V0X3ZhcmlhYmxlOwog
CWVmaS5xdWVyeV92YXJpYWJsZV9pbmZvICAgICAgPSB4ZW5fZWZpX3F1ZXJ5X3ZhcmlhYmxlX2lu
Zm87CisJZWZpLnF1ZXJ5X3ZhcmlhYmxlX2luZm9fbm9uYmxvY2tpbmcgPSB4ZW5fZWZpX3F1ZXJ5
X3ZhcmlhYmxlX2luZm87CiAJZWZpLnVwZGF0ZV9jYXBzdWxlICAgICAgICAgICA9IHhlbl9lZmlf
dXBkYXRlX2NhcHN1bGU7CiAJZWZpLnF1ZXJ5X2NhcHN1bGVfY2FwcyAgICAgICA9IHhlbl9lZmlf
cXVlcnlfY2Fwc3VsZV9jYXBzOwogCWVmaS5nZXRfbmV4dF9oaWdoX21vbm9fY291bnQgPSB4ZW5f
ZWZpX2dldF9uZXh0X2hpZ2hfbW9ub19jb3VudDsKLS0gCjIuMjEuMAoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
