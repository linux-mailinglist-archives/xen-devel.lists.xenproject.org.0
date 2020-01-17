Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4319140D09
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jan 2020 15:50:17 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1isSuW-0003UW-7t; Fri, 17 Jan 2020 14:47:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zPxh=3G=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1isSuU-0003U8-Oy
 for xen-devel@lists.xenproject.org; Fri, 17 Jan 2020 14:47:42 +0000
X-Inumbo-ID: 4b703c8c-3938-11ea-9fd7-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4b703c8c-3938-11ea-9fd7-bc764e2007e4;
 Fri, 17 Jan 2020 14:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579272455;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=MuZOZ0sS2G2mGEuT1Z5jFZxPYJJsKyOfLSzMGJZQ0aE=;
 b=TKE9HIzKHCkERQfjiwx1pmCSFCtqUWrNO2EgArSNxz9ElEjbSveHEfsd
 /HiIv2ggHFd/blkvwfzth40Rv+AnQfcYJ7E5j1rVXmKv5rLrT7EXFSYzM
 iHP/xzJmhAWddH91TkMfbrJaYYa9vUEWsYHBdhR/b2zNsMeoNP/l9upK8 g=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@eu.citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@eu.citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@eu.citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
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
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: EHvub2B18WFoq/Q6/DEp1hKaQpQtx2QImZWBEXKPhbEBO2ejKCBSxRENO2qo64oDeNQ0TaUL55
 xWE4DZ4a7we8byjb2J6HF0CJZGXJaWmZJ2gw4N9edNj7aDdAyUl7bH84LGKrnQnsFJ2LBdj3am
 OT/r0InZDsI+2Lbl1NRXgLfBg9cMM4fa513TkXx0Hl7imGVFou4jtsyhXT+dMUmvE2hYtStrFT
 eCyM7bhIn7CUvuMwjKR21D7B10W6mS1KE8hKR2VAo297r4344q3g0fPNfrzaqbLSjsJZvcqk6T
 BSg=
X-SBRS: 2.7
X-MesageID: 11089537
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,330,1574139600"; d="scan'208";a="11089537"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 17 Jan 2020 14:47:17 +0000
Message-ID: <20200117144726.582-2-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200117144726.582-1-ian.jackson@eu.citrix.com>
References: <20200117144726.582-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 01/10] libxl: event: Rename
 poller.fds_changed to .fds_deregistered
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
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBpcyBvbmx5IGZvciBkZXJlZ2lzdHJhdGlvbi4gIFdlIGFyZSBnb2luZyB0byBhZGQgYW5v
dGhlciB2YXJpYWJsZQpmb3IgbmV3IGV2ZW50cywgd2l0aCBkaWZmZXJlbnQgc2VtYW50aWNzLCBh
bmQgdGhpcyBvdmVybHktZ2VuZXJhbCBuYW1lCndpbGwgYmVjb21lIGNvbmZ1c2luZy4KClNpZ25l
ZC1vZmYtYnk6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgpSZXZpZXdl
ZC1ieTogR2VvcmdlIER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPgpUZXN0ZWQtYnk6
IEdlb3JnZSBEdW5sYXAgPGdlb3JnZS5kdW5sYXBAY2l0cml4LmNvbT4KLS0tCiB0b29scy9saWJ4
bC9saWJ4bF9ldmVudC5jICAgIHwgOCArKysrLS0tLQogdG9vbHMvbGlieGwvbGlieGxfaW50ZXJu
YWwuaCB8IDYgKysrLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgNyBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS90b29scy9saWJ4bC9saWJ4bF9ldmVudC5jIGIvdG9vbHMv
bGlieGwvbGlieGxfZXZlbnQuYwppbmRleCBhYThiN2QxOTQ1Li4xMjEwYzFiZmIzIDEwMDY0NAot
LS0gYS90b29scy9saWJ4bC9saWJ4bF9ldmVudC5jCisrKyBiL3Rvb2xzL2xpYnhsL2xpYnhsX2V2
ZW50LmMKQEAgLTIzOSw3ICsyMzksNyBAQCB2b2lkIGxpYnhsX19ldl9mZF9kZXJlZ2lzdGVyKGxp
YnhsX19nYyAqZ2MsIGxpYnhsX19ldl9mZCAqZXYpCiAgICAgZXYtPmZkID0gLTE7CiAKICAgICBM
SUJYTF9MSVNUX0ZPUkVBQ0gocG9sbGVyLCAmQ1RYLT5wb2xsZXJzX2Zkc19jaGFuZ2VkLCBmZHNf
Y2hhbmdlZF9lbnRyeSkKLSAgICAgICAgcG9sbGVyLT5mZHNfY2hhbmdlZCA9IDE7CisgICAgICAg
IHBvbGxlci0+ZmRzX2RlcmVnaXN0ZXJlZCA9IDE7CiAKICBvdXQ6CiAgICAgQ1RYX1VOTE9DSzsK
QEAgLTExMjAsNyArMTEyMCw3IEBAIHN0YXRpYyBpbnQgYmVmb3JlcG9sbF9pbnRlcm5hbChsaWJ4
bF9fZ2MgKmdjLCBsaWJ4bF9fcG9sbGVyICpwb2xsZXIsCiAKICAgICAqbmZkc19pbyA9IHVzZWQ7
CiAKLSAgICBwb2xsZXItPmZkc19jaGFuZ2VkID0gMDsKKyAgICBwb2xsZXItPmZkc19kZXJlZ2lz
dGVyZWQgPSAwOwogCiAgICAgbGlieGxfX2V2X3RpbWUgKmV0aW1lID0gTElCWExfVEFJTFFfRklS
U1QoJkNUWC0+ZXRpbWVzKTsKICAgICBpZiAoZXRpbWUpIHsKQEAgLTExODYsNyArMTE4Niw3IEBA
IHN0YXRpYyBpbnQgYWZ0ZXJwb2xsX2NoZWNrX2ZkKGxpYnhsX19wb2xsZXIgKnBvbGxlciwKICAg
ICAgICAgICAgIC8qIGFnYWluLCBzdGFsZSBzbG90IGVudHJ5ICovCiAgICAgICAgICAgICBjb250
aW51ZTsKIAotICAgICAgICBhc3NlcnQocG9sbGVyLT5mZHNfY2hhbmdlZCB8fCAhKGZkc1tzbG90
XS5yZXZlbnRzICYgUE9MTE5WQUwpKTsKKyAgICAgICAgYXNzZXJ0KHBvbGxlci0+ZmRzX2RlcmVn
aXN0ZXJlZCB8fCAhKGZkc1tzbG90XS5yZXZlbnRzICYgUE9MTE5WQUwpKTsKIAogICAgICAgICAv
KiB3ZSBtYXNrIGluIGNhc2UgcmVxdWVzdGVkIGV2ZW50cyBoYXZlIGNoYW5nZWQgKi8KICAgICAg
ICAgaW50IHNsb3RfcmV2ZW50cyA9IGZkc1tzbG90XS5yZXZlbnRzICYgZXZlbnRzOwpAQCAtMTYy
Niw3ICsxNjI2LDcgQEAgaW50IGxpYnhsX19wb2xsZXJfaW5pdChsaWJ4bF9fZ2MgKmdjLCBsaWJ4
bF9fcG9sbGVyICpwKQogICAgIGludCByYzsKICAgICBwLT5mZF9wb2xscyA9IDA7CiAgICAgcC0+
ZmRfcmluZGljZXMgPSAwOwotICAgIHAtPmZkc19jaGFuZ2VkID0gMDsKKyAgICBwLT5mZHNfZGVy
ZWdpc3RlcmVkID0gMDsKIAogICAgIHJjID0gbGlieGxfX3BpcGVfbm9uYmxvY2soQ1RYLCBwLT53
YWtldXBfcGlwZSk7CiAgICAgaWYgKHJjKSBnb3RvIG91dDsKZGlmZiAtLWdpdCBhL3Rvb2xzL2xp
YnhsL2xpYnhsX2ludGVybmFsLmggYi90b29scy9saWJ4bC9saWJ4bF9pbnRlcm5hbC5oCmluZGV4
IGJhOGM5YjQxYWIuLmM1YjcxZDE1ZjAgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2xpYnhsL2xpYnhsX2lu
dGVybmFsLmgKKysrIGIvdG9vbHMvbGlieGwvbGlieGxfaW50ZXJuYWwuaApAQCAtNjI5LDE0ICs2
MjksMTQgQEAgc3RydWN0IGxpYnhsX19wb2xsZXIgewogICAgIC8qCiAgICAgICogV2UgYWxzbyB1
c2UgdGhlIHBvbGxlciB0byByZWNvcmQgd2hldGhlciBhbnkgZmRzIGhhdmUgYmVlbgogICAgICAq
IGRlcmVnaXN0ZXJlZCBzaW5jZSB3ZSBlbnRlcmVkIHBvbGwuICBFYWNoIHBvbGxlciB3aGljaCBp
cyBub3QKLSAgICAgKiBpZGxlIGlzIG9uIHRoZSBsaXN0IHBvbGxlcnNfZmRzX2NoYW5nZWQuICBm
ZHNfY2hhbmdlZCBpcworICAgICAqIGlkbGUgaXMgb24gdGhlIGxpc3QgcG9sbGVyc19mZHNfY2hh
bmdlZC4gIGZkc19kZXJlZ2lzdGVyZWQgaXMKICAgICAgKiBjbGVhcmVkIGJ5IGJlZm9yZXBvbGws
IGFuZCB0ZXN0ZWQgYnkgYWZ0ZXJwb2xsLiAgV2hlbmV2ZXIgYW4gZmQKLSAgICAgKiBldmVudCBp
cyBkZXJlZ2lzdGVyZWQsIHdlIHNldCB0aGUgZmRzX2NoYW5nZWQgb2YgYWxsIG5vbi1pZGxlCisg
ICAgICogZXZlbnQgaXMgZGVyZWdpc3RlcmVkLCB3ZSBzZXQgdGhlIGZkc19kZXJlZ2lzdGVyZWQg
b2YgYWxsIG5vbi1pZGxlCiAgICAgICogcG9sbGVycy4gIFNvIGFmdGVycG9sbCBjYW4gdGVsbCB3
aGV0aGVyIGFueSBQT0xMTlZBTCBpcwogICAgICAqIHBsYXVzaWJseSBkdWUgdG8gYW4gZmQgYmVp
bmcgY2xvc2VkIGFuZCByZW9wZW5lZC4KICAgICAgKi8KICAgICBMSUJYTF9MSVNUX0VOVFJZKGxp
YnhsX19wb2xsZXIpIGZkc19jaGFuZ2VkX2VudHJ5OwotICAgIGJvb2wgZmRzX2NoYW5nZWQ7Cisg
ICAgYm9vbCBmZHNfZGVyZWdpc3RlcmVkOwogfTsKIAogc3RydWN0IGxpYnhsX19nYyB7Ci0tIAoy
LjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
