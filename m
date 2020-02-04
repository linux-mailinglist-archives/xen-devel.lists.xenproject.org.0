Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 822BB1517FC
	for <lists+xen-devel@lfdr.de>; Tue,  4 Feb 2020 10:37:27 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iyubK-0001IQ-SN; Tue, 04 Feb 2020 09:34:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5+CW=3Y=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iyubK-0001IC-7T
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2020 09:34:34 +0000
X-Inumbo-ID: 8c5e15aa-4731-11ea-8ef9-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8c5e15aa-4731-11ea-8ef9-12813bfff9fa;
 Tue, 04 Feb 2020 09:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580808872;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=jUK17J4eO+p4Fz537wu3z9hWwshet2MBtLbzWjrF81w=;
 b=RIpcfeM3LY2kOnwAMfINVyUATZm3sQFy+q33113Q77pVqzAE6Vq3BRLU
 nBrGNoyBIO5XLY2h/07vdFh2oyRz5jM93G6wEPSB1nftcrBDuOVXzShlV
 M1Y9b1WqpI+9td92MuJBCYIwnnfMsNdF+xQSV6d1s37WH3WZm8+V8cgrH Y=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@eu.citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@eu.citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@eu.citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Wko3cy8X//+4zkmI8+eidhJZQnFSFXBiPOXrAvYK6k6rfCXKRnZzqOpDh4NR2XCsk2fjM5oySl
 3gPz8/55ve5f+XUUj/IdCO6CBBrz0H2+7rxVl5QibRpOp3fH32B0NuNWOSPh3j3G5QIK5jfPve
 ZWAGJpJc0kdCucHjV64ziO6p72PXN5YnqWAmI+O0Ge5tnciI6BfWHsrgl6F1u/8Qkn175I/9kw
 oULbGGSF88zxCMNtO0ZZ+z3Q/7EIGl+4Y4ksb52cUNhwBDd5Pj3Z/VBhxWfzqwF9ajEr+P7nse
 AGQ=
X-SBRS: 2.7
X-MesageID: 12517737
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,401,1574139600"; d="scan'208";a="12517737"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 4 Feb 2020 09:34:22 +0000
Message-ID: <20200204093424.10159-1-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 0/2] Two upstream fixes from Debian
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlc2Ugd2VyZSBwb3N0ZWQgYmVmb3JlIGluIE9jdG9iZXIgMjAxOCBidXQgbmV2ZXIgbWFkZSBp
dCB1cHN0cmVhbQpmb3Igc29tZSByZWFzb24uICBUaGV5IHNlZW0gdG8gaGF2ZSBiZWVuIHN1ZmZp
Y2llbnRseSByZXZpZXdlZCwgYW5kIEkKaW50ZW5kIHRvIGNvbW1pdCB0aGVtIHNvb24uICBJJ20g
cmVwb3N0aW5nIG5vdywgd2l0aCBubyBjaGFuZ2VzLAppbiBjYXNlIGFueW9uZSB3YW50cyB0byBv
YmplY3QuCgpJYW4gSmFja3NvbiAoMSk6CiAgSU5TVEFMTDogTWVudGlvbiBrY29uZmlnCgpTdGVm
YW4gQmFkZXIgKDEpOgogIHRvb2xzL3hlbnN0b3JlOiBSZS1pbnRyb2R1Y2UgKGZha2UpIHhzX3Jl
c3RyaWN0IGNhbGwgdG8gcHJlc2VydmUgQUJJCgogSU5TVEFMTCAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHwgMjAgKysrKysrKysrKysrKysrKysrKysKIHRvb2xzL3hlbnN0b3JlL2luY2x1ZGUv
eGVuc3RvcmUuaCB8ICA1ICsrKysrCiB0b29scy94ZW5zdG9yZS94cy5jICAgICAgICAgICAgICAg
fCAgNiArKysrKysKIDMgZmlsZXMgY2hhbmdlZCwgMzEgaW5zZXJ0aW9ucygrKQoKLS0gCjIuMTEu
MAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
