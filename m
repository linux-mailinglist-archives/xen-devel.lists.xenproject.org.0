Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 776B617E2BD
	for <lists+xen-devel@lfdr.de>; Mon,  9 Mar 2020 15:52:28 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jBJiw-0001Ry-KH; Mon, 09 Mar 2020 14:49:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=PQZd=42=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1jBJiv-0001Rs-9H
 for xen-devel@lists.xenproject.org; Mon, 09 Mar 2020 14:49:41 +0000
X-Inumbo-ID: 3397c660-6215-11ea-ac49-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3397c660-6215-11ea-ac49-12813bfff9fa;
 Mon, 09 Mar 2020 14:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1583765380;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=42V+1srRW6DzFgxz3u8XKRGvpHCCYEj+5GC8rHQ8j/k=;
 b=dqVIwkyadWnk5yRQjNez6+EMAl0wvE4foWuONK9yc+zW1gwFyrhLjcBn
 eN0bhKBqbComCTXls6KGYwmzOd6jVSe9Q7e/F0MGxrBNyJlD2q/ml796u
 6XxgJI1G3E3CxPmxtXjPXC+ePkUuvxfyoVP/P0ZLPN4vH5zXgSYZRwoet A=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=george.dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 george.dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="george.dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
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
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: VRKX9VabFnnXwPBjmcgTiPdhRVgh0c81WrGbjwTegbEHD/9aJpmn+8mZFI9XZDUKrviaadhr45
 g+l5UCDn1oC7U36aGHTeVMy0b/RGGIqpx9+8IkDY6jpqJyz9vgRojGiSwvqyTtHtPNdHRXgoG6
 uFz0gJ4U18fKChM9HelDnCbrS53qTTXV5TxS1YXzmK8KBglKzr+CWhORCBcbCkHRorptRmec30
 G4qppBEHHmoHd+t8bs35bQ/5kb5bRup/FLidfW4oLKHwlapT80RZtHz1wkzmf+k9TsVSX64QTd
 sRc=
X-SBRS: 2.7
X-MesageID: 13644932
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,533,1574139600"; d="scan'208";a="13644932"
From: George Dunlap <george.dunlap@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 9 Mar 2020 14:49:32 +0000
Message-ID: <20200309144932.866097-3-george.dunlap@citrix.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200309144932.866097-1-george.dunlap@citrix.com>
References: <20200309144932.866097-1-george.dunlap@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v4 3/3] golang/xenlight: Implement
 DomainCreateNew
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
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>,
 George Dunlap <george.dunlap@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBpbXBsZW1lbnRzIHRoZSB3cmFwcGVyIGFyb3VuZCBsaWJ4bF9kb21haW5fY3JlYXRlX25l
dygpLiAgV2l0aAp0aGUgcHJldmlvdXMgY2hhbmdlcywgaXQncyBub3cgcG9zc2libGUgdG8gY3Jl
YXRlIGEgZG9tYWluIHVzaW5nIHRoZQpnb2xhbmcgYmluZGluZ3MgKGFsdGhvdWdoIG5vdCB5ZXQg
dG8gdW5wYXVzZSBpdCBvciBoYXJ2ZXN0IGl0IGFmdGVyIGl0CnNodXRzIGRvd24pLgoKU2lnbmVk
LW9mZi1ieTogR2VvcmdlIER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPgotLS0KdjQ6
Ci0gUmVtb3ZlIGhhbmQtY3JhZnRlZCBjb25zdHJ1Y3RvciBjb2RlLCBtYWtlIG5vbi1SRkMKCkND
OiBOaWNrIFJvc2Jyb29rIDxyb3Nicm9va25AYWluZm9zZWMuY29tPgotLS0KIHRvb2xzL2dvbGFu
Zy94ZW5saWdodC94ZW5saWdodC5nbyB8IDIxICsrKysrKysrKysrKysrKysrKysrKwogMSBmaWxl
IGNoYW5nZWQsIDIxIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS90b29scy9nb2xhbmcveGVu
bGlnaHQveGVubGlnaHQuZ28gYi90b29scy9nb2xhbmcveGVubGlnaHQveGVubGlnaHQuZ28KaW5k
ZXggNTZmYTMxZmQ3Yi4uODA4YjRhMzI3YyAxMDA2NDQKLS0tIGEvdG9vbHMvZ29sYW5nL3hlbmxp
Z2h0L3hlbmxpZ2h0LmdvCisrKyBiL3Rvb2xzL2dvbGFuZy94ZW5saWdodC94ZW5saWdodC5nbwpA
QCAtMTExMSwzICsxMTExLDI0IEBAIGZ1bmMgKEN0eCAqQ29udGV4dCkgUHJpbWFyeUNvbnNvbGVH
ZXRUdHkoZG9taWQgdWludDMyKSAocGF0aCBzdHJpbmcsIGVyciBlcnJvcikKIAlwYXRoID0gQy5H
b1N0cmluZyhjcGF0aCkKIAlyZXR1cm4KIH0KKworLy8gaW50IGxpYnhsX2RvbWFpbl9jcmVhdGVf
bmV3KGxpYnhsX2N0eCAqY3R4LCBsaWJ4bF9kb21haW5fY29uZmlnICpkX2NvbmZpZywKKy8vICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICB1aW50MzJfdCAqZG9taWQsCisvLyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgY29uc3QgbGlieGxfYXN5bmNvcF9ob3cgKmFvX2hvdywKKy8vICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBsaWJ4bF9hc3luY3Byb2dyZXNzX2hvdyAq
YW9wX2NvbnNvbGVfaG93KQorZnVuYyAoQ3R4ICpDb250ZXh0KSBEb21haW5DcmVhdGVOZXcoY29u
ZmlnICpEb21haW5Db25maWcpIChEb21pZCwgZXJyb3IpIHsKKwl2YXIgY2RvbWlkIEMudWludDMy
X3QKKwl2YXIgY2NvbmZpZyBDLmxpYnhsX2RvbWFpbl9jb25maWcKKwllcnIgOj0gY29uZmlnLnRv
QygmY2NvbmZpZykKKwlpZiBlcnIgIT0gbmlsIHsKKwkJcmV0dXJuIERvbWlkKDApLCBmbXQuRXJy
b3JmKCJjb252ZXJ0aW5nIGRvbWFpbiBjb25maWcgdG8gQzogJXYiLCBlcnIpCisJfQorCWRlZmVy
IEMubGlieGxfZG9tYWluX2NvbmZpZ19kaXNwb3NlKCZjY29uZmlnKQorCisJcmV0IDo9IEMubGli
eGxfZG9tYWluX2NyZWF0ZV9uZXcoQ3R4LmN0eCwgJmNjb25maWcsICZjZG9taWQsIG5pbCwgbmls
KQorCWlmIHJldCAhPSAwIHsKKwkJcmV0dXJuIERvbWlkKDApLCBFcnJvcihyZXQpCisJfQorCisJ
cmV0dXJuIERvbWlkKGNkb21pZCksIG5pbAorfQotLSAKMi4yNS4xCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
