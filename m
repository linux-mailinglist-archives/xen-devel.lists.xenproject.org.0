Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0DFCF0636
	for <lists+xen-devel@lfdr.de>; Tue,  5 Nov 2019 20:45:34 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iS4je-0005fi-54; Tue, 05 Nov 2019 19:43:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rgKV=Y5=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iS4jc-0005fd-Oq
 for xen-devel@lists.xenproject.org; Tue, 05 Nov 2019 19:43:24 +0000
X-Inumbo-ID: 86a3437a-0004-11ea-9631-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 86a3437a-0004-11ea-9631-bc764e2007e4;
 Tue, 05 Nov 2019 19:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1572983004;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=pg9LnM3vDBWcbZ7fn/wdpg9d2Atj7hqpaobt4PFfn+0=;
 b=C4AC8Iv8pXi/JeeLVab3OVeYSYtbR067bLUfJqIuy9NukJDF1EDrDQRZ
 UlKjvtio8M6RchYurtrMvdXgT3C1/cuTk6okqrtL2H9QXg2sUFD5g4hZi
 57VcIjjiNf9Q+9mjAPLI3338X/IrqCDxtlj0SfAXSUD3DI08s/9fZUF6R A=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
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
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: szbJ34uz7vhR3MmKLoNtIfrYNHmZcfZ4w266EgUwpzca0iUfjI4FRnF2OLmTlp7eCMvsep0TXh
 6m2Yq2Ecnl3cLeyF8IeTvp6DVYx2sCFSB6M4nXj6Jn7Ms7No3I+hsHz6J3jsbsEz/uI//Cbjdt
 IM+UJ7nFUOOBg4m8ysJJdxsGuHT42CZwqLecL4k4n8A/ASnL2QeitRDjaNKVja3KdOpP4Ef1Pq
 qR1GvQxFDMOtqmkyKzxOHWGKF33n7XHjaX+K+laYzfbHq/pArJlO7HrWU91ZCRrPIk2/s7+Usr
 POo=
X-SBRS: 2.7
X-MesageID: 7892185
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,271,1569297600"; 
   d="scan'208";a="7892185"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Tue, 5 Nov 2019 19:43:15 +0000
Message-ID: <20191105194317.16232-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH for-4.13 0/2] xen/livepatch: Safety fixes
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
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBwYWlyIG9mIHBhdGNoZXMgaXMgbG9uZyBvdmVyZHVlIGJlaW5nIHBvc3RlZCB1cHN0cmVh
bS4gIEZvciBzZXZlcmFsIHllYXJzCm5vdywgWGVuU2VydmVyIGhhcyBzaGlwcGVkIHRoZSAybmQg
cGF0Y2ggYXMgYSBzYWZldHkgY2hlY2sgKHNlZWluZyBhcyB3ZSBoYXZlCmJvdGggbGl2ZXBhdGNo
aW5nIGFuZCBpbnRyb3NwZWN0aW9uKSwgaW1wbGVtZW50ZWQgd2l0aCBzb21lIHJldHVybiBhZGRy
ZXNzCm1hbmlwdWxhdGlvbiB0byB0dXJuIGEgdm9pZCBsb2FkIGhvb2sgaW50byBvbmUgd2hpY2gg
Y2FuIHJldHVybiAtRUJVU1kuCgpBbmRyZXcgQ29vcGVyICgyKToKICB4ZW4vbGl2ZXBhdGNoOiBB
ZGQgYSByZXR1cm4gdmFsdWUgdG8gbG9hZCBob29rcwogIHg4Ni9saXZlcGF0Y2g6IFByZXZlbnQg
cGF0Y2hpbmcgd2l0aCBhY3RpdmUgd2FpdHF1ZXVlcwoKIHhlbi9hcmNoL2FybS9saXZlcGF0Y2gu
YyAgICAgICAgICAgICB8ICA1ICsrKysrCiB4ZW4vYXJjaC94ODYvbGl2ZXBhdGNoLmMgICAgICAg
ICAgICAgfCAzOSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKIHhlbi9jb21t
b24vbGl2ZXBhdGNoLmMgICAgICAgICAgICAgICB8IDM3ICsrKysrKysrKysrKysrKysrKysrKysr
Ky0tLS0tLS0tLS0KIHhlbi9pbmNsdWRlL3hlbi9saXZlcGF0Y2guaCAgICAgICAgICB8ICAxICsK
IHhlbi9pbmNsdWRlL3hlbi9saXZlcGF0Y2hfcGF5bG9hZC5oICB8ICAyICstCiB4ZW4vdGVzdC9s
aXZlcGF0Y2gveGVuX2hlbGxvX3dvcmxkLmMgfCAxMiArKysrKysrKy0tLQogNiBmaWxlcyBjaGFu
Z2VkLCA4MSBpbnNlcnRpb25zKCspLCAxNSBkZWxldGlvbnMoLSkKCi0tIAoyLjExLjAKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
