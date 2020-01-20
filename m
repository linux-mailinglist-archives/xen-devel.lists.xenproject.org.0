Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A61A41429E2
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jan 2020 12:53:55 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1itVaF-0006DY-5K; Mon, 20 Jan 2020 11:51:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=YHbP=3J=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1itVaD-0006DC-Ha
 for xen-devel@lists.xenproject.org; Mon, 20 Jan 2020 11:51:05 +0000
X-Inumbo-ID: 1dccbd2e-3b7b-11ea-aecd-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1dccbd2e-3b7b-11ea-aecd-bc764e2007e4;
 Mon, 20 Jan 2020 11:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579521055;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2aLzFEyKGOF7jIxMSiC6D3pQ4K6yohUqSrth9wQavpA=;
 b=Ji8KvRYeNb6k4OjKliFekJ1Dry5HJhMM3Pr6U64xjJU68biVOCxWMfsH
 lZ1FgWYL6i1+Kfet+EVpQVUZE4gHl9WbSdbKloYSoxWCPzNCzpgAvYvN0
 n8pXAbOBpbzdO/SpoWeJjdYbgVjm+Q896x2rquo1pOy2n4mwVSWU/1klu I=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
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
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: eZJOk88OnqRn8epZJm5bSSvkDau8hARo8V9wSCwv5rthZ87GyBg0IveW1hgMpyRyWb4KxMY5rg
 /yIXbCLY1kGsJB7dQJq2dOripTq2Wj4ul42DJsgCgLBry6kbsEvhgVm+vpOFlG7MAi9GeeM0Zp
 itCM/p4zPyImzndDLx7mokv3sCabYl4FgosHB0WjijVObFCWgpdLJmRkrBVqp6SMpZKT0szATr
 7K7FRqzGFvX0p/NKxLjdwC9VY+efE0zOLOaDBIqSOdaOGAMMygHZWFDGXhZuJjwRZJzN+ujAYJ
 ZPo=
X-SBRS: 2.7
X-MesageID: 11587419
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,341,1574139600"; d="scan'208";a="11587419"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 20 Jan 2020 11:50:51 +0000
Message-ID: <20200120115053.1010739-2-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200120115053.1010739-1-anthony.perard@citrix.com>
References: <20200120115053.1010739-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [XEN PATCH 1/3] automation: Only build QEMU if Python
 >= 3.5
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
 Doug Goldstein <cardoe@cardoe.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UmVjZW50IHZlcnNpb24gb2YgUUVNVSB3aWxsIG5vdCBidWlsZCBhbnltb3JlIGlmIFB5dGhvbiA8
IDMuNS4KVGhhdCBpcywgUUVNVSA0LjMgbm90IHJlbGVhc2VkIHlldC4KClRoYXQgY2hlY2sgd291
bGQgYWxzbyBwcmV2ZW50IHRoZSBHaXRMYWIgQ0kgZnJvbSBidWlsZGluZyBRRU1VIGlmCnB5dGhv
bjMgYmluYXJ5IGlzbid0IHByZXNlbnQuCgpTaWduZWQtb2ZmLWJ5OiBBbnRob255IFBFUkFSRCA8
YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4KLS0tCiBhdXRvbWF0aW9uL3NjcmlwdHMvYnVpbGQg
fCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEvYXV0b21hdGlvbi9zY3JpcHRzL2J1aWxkIGIvYXV0b21hdGlvbi9zY3Jp
cHRzL2J1aWxkCmluZGV4IDgzYzQ0ZTZjZTc1OC4uMGNkMGYzOTcxZGU1IDEwMDc1NQotLS0gYS9h
dXRvbWF0aW9uL3NjcmlwdHMvYnVpbGQKKysrIGIvYXV0b21hdGlvbi9zY3JpcHRzL2J1aWxkCkBA
IC0yOCw4ICsyOCw4IEBAIGlmIFtbICIke0NDfSIgPT0gImNsYW5nIiogXV07IHRoZW4KICAgICBj
ZmdhcmdzKz0oIi0tZGlzYWJsZS1zdHViZG9tIikKIGZpCiAKLSMgUWVtdSByZXF1aXJlcyBQeXRo
b24gMi43IG9yIGxhdGVyCi1pZiBweXRob24gLWMgImltcG9ydCBzeXM7IHJlcyA9IHN5cy52ZXJz
aW9uX2luZm8gPCAoMiwgNyk7IGV4aXQobm90KHJlcykpIjsgdGhlbgorIyBRZW11IHJlcXVpcmVz
IFB5dGhvbiAzLjUgb3IgbGF0ZXIKK2lmICEgdHlwZSBweXRob24zIHx8IHB5dGhvbjMgLWMgImlt
cG9ydCBzeXM7IHJlcyA9IHN5cy52ZXJzaW9uX2luZm8gPCAoMywgNSk7IGV4aXQobm90KHJlcykp
IjsgdGhlbgogICAgIGNmZ2FyZ3MrPSgiLS13aXRoLXN5c3RlbS1xZW11PS9iaW4vZmFsc2UiKQog
ZmkKIAotLSAKQW50aG9ueSBQRVJBUkQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
