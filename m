Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9975C161109
	for <lists+xen-devel@lfdr.de>; Mon, 17 Feb 2020 12:20:45 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j3ePZ-0006gO-GE; Mon, 17 Feb 2020 11:18:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ATlc=4F=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1j3ePY-0006fy-4o
 for xen-devel@lists.xenproject.org; Mon, 17 Feb 2020 11:18:00 +0000
X-Inumbo-ID: 20c69b47-5177-11ea-bfcd-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 20c69b47-5177-11ea-bfcd-12813bfff9fa;
 Mon, 17 Feb 2020 11:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1581938268;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vUAJ1LxEcICWt46MAuarTVfC93cKWIoFfdgBO656hac=;
 b=ItitcpEGuJZtQ1h4llEOBN0MjqtHht6GVNWlGQepAek82/a1h7f+rqVr
 VJlyDEMD51Km/TmjMV6oRBOuBF4DYg/GpujOuBjA35fF+DEfNomJvJORV
 mL/wTjZJyTx+/Ao+ATViSlugUkP2w8ZVVDu6RCR+3j35vSxMQpyJc2R9P w=;
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
IronPort-SDR: EDHcbNjDY+b+DCEd1w7R0Sh6fVWc/dcmQU1FsDuHvBmV7/e8gJzt6feIgB5D17WIBK38+Ez1Vq
 WNczp3FlmAWTwAOGtWTc5xxtZf1uMyRc4799RlckrOTdkbUHyMFii6myxdugNYWD8ffPvMAVPF
 K7cRjAub0EeG3aKrHYAkSHj9jVzeMaiNlahydWhm60WYcnVYCBDQxEf5vC29/s39F4EZB8ttXE
 QrCu+0BKc1HJqouRPHijUdRGnEpE0Nm73HADUhcuXyW18p+CXM0ezGB/L7nbbVxFyPOgeBgtMX
 gnI=
X-SBRS: 2.7
X-MesageID: 12990896
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,452,1574139600"; d="scan'208";a="12990896"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Mon, 17 Feb 2020 11:17:37 +0000
Message-ID: <20200217111740.7298-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 0/3] xen: async_exception_* cleanup
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
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Jan Beulich <JBeulich@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBpbmZyYXN0cnVjdHVyZSBpcyBvbmx5IGNvbXBpbGVkIGZvciB4ODYsIHZlcnkgeDg2IHNw
ZWNpZmljIChzbyBvZiBubwppbnRlcmVzdCB0byBvdGhlciBhcmNoaXRlY3R1cmVzKSwgYW5kIHZl
cnkgYnJva2VuLgoKQW1vbmdzdCBvdGhlciB0aGluZ3MsIE1DRXMgaGF2ZSBhIGhpZ2hlciBwcmlv
cml0eSB0aGFuIE5NSXMsIGFuZCB0aGVyZSBpcyBubwpzdWNoIHRoaW5nIGFzIG1hc2tpbmcgYW4g
TUNFLiAgSW4gb3JkZXIgdG8gYWRkcmVzcyB0aGVzZSBidWdzICh3aGljaCB3aWxsCmNvbXBsZXRl
bHkgY2hhbmdlIHRoZSBpbmZyYXN0cnVjdHVyZSksIHN0YXJ0IGJ5IG1vdmluZyBpdCBhbGwgb3V0
IG9mIGNvbW1vbgpjb2RlLgoKQW5kcmV3IENvb3BlciAoMyk6CiAgeDg2L25taTogQ29ycmVjdGlv
bnMgYW5kIGltcHJvdmVtZW50cyB0byBkb19ubWlfc3RhdHMoKQogIHhlbjogTW92ZSBhc3luY19l
eGNlcHRpb25fKiBpbmZyYXN0cnVjdHVyZSBpbnRvIHg4NgogIHhlbi94ODY6IFJlbmFtZSBhbmQg
c2ltcGxpZnkgYXN5bmNfZXZlbnRfKiBpbmZyYXN0cnVjdHVyZQoKIHhlbi9hcmNoL3g4Ni9jcHUv
bWNoZWNrL3ZtY2UuYyAgICAgfCAgMiArLQogeGVuL2FyY2gveDg2L2NwdS92cG11LmMgICAgICAg
ICAgICB8ICAyICstCiB4ZW4vYXJjaC94ODYvZG9tYWluLmMgICAgICAgICAgICAgIHwgMTEgKysr
KysrKysrKysKIHhlbi9hcmNoL3g4Ni9kb21jdGwuYyAgICAgICAgICAgICAgfCAgMiArLQogeGVu
L2FyY2gveDg2L2h2bS9pcnEuYyAgICAgICAgICAgICB8ICA4ICsrKystLS0tCiB4ZW4vYXJjaC94
ODYvaHZtL3Zpb2FwaWMuYyAgICAgICAgIHwgIDIgKy0KIHhlbi9hcmNoL3g4Ni9odm0vdmxhcGlj
LmMgICAgICAgICAgfCAgMiArLQogeGVuL2FyY2gveDg2L25taS5jICAgICAgICAgICAgICAgICB8
IDI2ICsrKysrKysrKysrKystLS0tLS0tLS0tLS0tCiB4ZW4vYXJjaC94ODYvb3Byb2ZpbGUvbm1p
X2ludC5jICAgIHwgIDIgKy0KIHhlbi9hcmNoL3g4Ni9wdi9jYWxsYmFjay5jICAgICAgICAgfCAg
MiArLQogeGVuL2FyY2gveDg2L3B2L2lyZXQuYyAgICAgICAgICAgICB8IDE0ICsrKysrKystLS0t
LS0tCiB4ZW4vYXJjaC94ODYvcHYvdHJhcHMuYyAgICAgICAgICAgIHwgIDIgKy0KIHhlbi9hcmNo
L3g4Ni94ODZfNjQvYXNtLW9mZnNldHMuYyAgfCAxMCArKysrKy0tLS0tCiB4ZW4vYXJjaC94ODYv
eDg2XzY0L2NvbXBhdC9lbnRyeS5TIHwgMTIgKysrKysrLS0tLS0tCiB4ZW4vYXJjaC94ODYveDg2
XzY0L2VudHJ5LlMgICAgICAgIHwgMTIgKysrKysrLS0tLS0tCiB4ZW4vY29tbW9uL2RvbWFpbi5j
ICAgICAgICAgICAgICAgIHwgMTUgLS0tLS0tLS0tLS0tLS0tCiB4ZW4vaW5jbHVkZS9hc20teDg2
L2RvbWFpbi5oICAgICAgIHwgMjcgKysrKysrKysrKysrKysrKystLS0tLS0tLS0tCiB4ZW4vaW5j
bHVkZS94ZW4vc2NoZWQuaCAgICAgICAgICAgIHwgMTEgLS0tLS0tLS0tLS0KIDE4IGZpbGVzIGNo
YW5nZWQsIDc3IGluc2VydGlvbnMoKyksIDg1IGRlbGV0aW9ucygtKQoKLS0gCjIuMTEuMAoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
