Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59C7711EAF4
	for <lists+xen-devel@lfdr.de>; Fri, 13 Dec 2019 20:08:16 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ifqFF-00008g-MA; Fri, 13 Dec 2019 19:04:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=B4Jk=2D=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ifqFD-000087-N7
 for xen-devel@lists.xenproject.org; Fri, 13 Dec 2019 19:04:55 +0000
X-Inumbo-ID: 6bd56556-1ddb-11ea-b6f1-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6bd56556-1ddb-11ea-b6f1-bc764e2007e4;
 Fri, 13 Dec 2019 19:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1576263883;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=v0wSirtyLeQ7dUEvDbrV4J90EInwLyDV68v47iceJpM=;
 b=Lg6mNc8+tgh2Z50ZVYfrudA45SFMeEyLsuuTttbCFp5zUNTIfZPWqcN7
 +E94aYXEhNEUczexY1AWu4cA7iLJ8/xIDprrInwCSm9fzG7313+/TvZi/
 p5MJf12z10IQh1dqVC4wkXDeIASGpcIPpG9gkFEye8dEeLQIGizuD7TG3 w=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
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
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: svensZ28/3DG1yttqvNRZuTwMrAB7vu9mGqJHOfbYN1rbURFOvCnhPX4Rpr6djt0q4EU8uDrTD
 ZgwspXmx2rsVFc1YSExL3PGtmswP2VxNIHEvzwpTPyzeEWRDdNsEg6DMUUTQyY+6A7PppeQhwC
 CdD7nk47zbbA2+w6sACT5L9vAIXlAjLDp2kc1XFM0CqRnnucsj3v21uMYk03HBKjjif4qIdLeC
 jUN/kZ5BSigDffFu009cpfR2wGveYWZPcUQJegMwn9sfZlDcbG3twQPNvN8DRn8nBwy+xZfzsg
 qy0=
X-SBRS: 2.7
X-MesageID: 10077314
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,309,1571716800"; d="scan'208";a="10077314"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Fri, 13 Dec 2019 19:04:35 +0000
Message-ID: <20191213190436.24475-6-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20191213190436.24475-1-andrew.cooper3@citrix.com>
References: <20191213190436.24475-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 5/6] x86/suspend: Expand macros in wakeup_prot.S
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

TW9zdCB1c2VycyBoYXZlIGJlZW4gZHJvcHBlZCwgYW5kIHRoZXkgZG8gbm90aGluZyBidXQgb2Jm
dXNjYXRlIHRoZSBhc3NlbWJseS4KClNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJl
dy5jb29wZXIzQGNpdHJpeC5jb20+Ci0tLQpDQzogSmFuIEJldWxpY2ggPEpCZXVsaWNoQHN1c2Uu
Y29tPgpDQzogV2VpIExpdSA8d2xAeGVuLm9yZz4KQ0M6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2Vy
LnBhdUBjaXRyaXguY29tPgotLS0KIHhlbi9hcmNoL3g4Ni9hY3BpL3dha2V1cF9wcm90LlMgfCAy
OCArKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRp
b25zKCspLCAxOSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvYWNwaS93
YWtldXBfcHJvdC5TIGIveGVuL2FyY2gveDg2L2FjcGkvd2FrZXVwX3Byb3QuUwppbmRleCBhODE4
NDlmZDJiLi4wY2U5NmUyNmE5IDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvYWNwaS93YWtldXBf
cHJvdC5TCisrKyBiL3hlbi9hcmNoL3g4Ni9hY3BpL3dha2V1cF9wcm90LlMKQEAgLTIsMTQgKzIs
NiBAQAogICAgICAgICAudGV4dAogICAgICAgICAuY29kZTY0CiAKLSNkZWZpbmUgR1JFRyh4KSAg
ICAgICAgICVyIyN4Ci0jZGVmaW5lIFNBVkVEX0dSRUcoeCkgICBzYXZlZF9yIyN4KCVyaXApCi0j
ZGVmaW5lIERFQ0xBUkVfR1JFRyh4KSBzYXZlZF9yIyN4OiAgICAgLnF1YWQgICAwCi0jZGVmaW5l
IFNBVkVfR1JFRyh4KSAgICBtb3ZxIEdSRUcoeCksIFNBVkVEX0dSRUcoeCkKLSNkZWZpbmUgTE9B
RF9HUkVHKHgpICAgIG1vdnEgU0FWRURfR1JFRyh4KSwgR1JFRyh4KQotCi0jZGVmaW5lIFJFRih4
KSAgICAgICAgICB4KCVyaXApCi0KIEVOVFJZKGRvX3N1c3BlbmRfbG93bGV2ZWwpCiAgICAgICAg
IHB1c2ggICAgJXJicAogICAgICAgICBwdXNoICAgICVyYngKQEAgLTE4LDEwICsxMCwxMCBAQCBF
TlRSWShkb19zdXNwZW5kX2xvd2xldmVsKQogICAgICAgICBwdXNoICAgICVyMTQKICAgICAgICAg
cHVzaCAgICAlcjE1CiAKLSAgICAgICAgU0FWRV9HUkVHKHNwKQorICAgICAgICBtb3YgICAgICVy
c3AsIHNhdmVkX3JzcCglcmlwKQogCi0gICAgICAgIG1vdiAgICAgJWNyMCwgR1JFRyhheCkKLSAg
ICAgICAgbW92ICAgICBHUkVHKGF4KSwgUkVGKHNhdmVkX2NyMCkKKyAgICAgICAgbW92ICAgICAl
Y3IwLCAlcmF4CisgICAgICAgIG1vdiAgICAgJXJheCwgc2F2ZWRfY3IwKCVyaXApCiAKICAgICAg
ICAgY2FsbCAgICBzYXZlX3Jlc3RfcHJvY2Vzc29yX3N0YXRlCiAKQEAgLTQ1LDEyICszNywxMiBA
QCBFTlRSWShkb19zdXNwZW5kX2xvd2xldmVsKQogRU5UUlkoczNfcmVzdW1lKQogICAgICAgICBs
Z2R0ICAgIGJvb3RfZ2R0ciglcmlwKQogCi0gICAgICAgIG1vdiAgICAgUkVGKHNhdmVkX2NyMCks
IEdSRUcoYXgpCi0gICAgICAgIG1vdiAgICAgR1JFRyhheCksICVjcjAKKyAgICAgICAgbW92ICAg
ICBzYXZlZF9jcjAoJXJpcCksICVyYXgKKyAgICAgICAgbW92ICAgICAlcmF4LCAlY3IwCiAKICAg
ICAgICAgbW92ICAgICAkX19IWVBFUlZJU09SX0RTNjQsICVlYXgKICAgICAgICAgbW92ICAgICAl
ZWF4LCAlc3MKLSAgICAgICAgTE9BRF9HUkVHKHNwKQorICAgICAgICBtb3YgICAgIHNhdmVkX3Jz
cCglcmlwKSwgJXJzcAogCiAgICAgICAgIC8qIFJlbG9hZCBjb2RlIHNlbGVjdG9yICovCiAgICAg
ICAgIHB1c2hxICAgJF9fSFlQRVJWSVNPUl9DUwpAQCAtNzMsMTAgKzY1LDggQEAgRU5UUlkoczNf
cmVzdW1lKQogLmRhdGEKICAgICAgICAgLmFsaWduIDE2CiAKK3NhdmVkX3JzcDogICAgICAucXVh
ZCAgIDAKK3NhdmVkX2NyMDogICAgICAucXVhZCAgIDAKKwogR0xPQkFMKHNhdmVkX21hZ2ljKQog
ICAgICAgICAubG9uZyAgIDB4OWFiY2RlZjAKLQotICAgICAgICAuYWxpZ24gOAotREVDTEFSRV9H
UkVHKHNwKQotCi1zYXZlZF9jcjA6ICAgICAgLnF1YWQgICAwCi0tIAoyLjExLjAKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
