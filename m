Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F03DA10FBD2
	for <lists+xen-devel@lfdr.de>; Tue,  3 Dec 2019 11:37:00 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ic5VJ-0004Z6-8i; Tue, 03 Dec 2019 10:34:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pRqY=ZZ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ic5VI-0004Yv-FV
 for xen-devel@lists.xenproject.org; Tue, 03 Dec 2019 10:34:00 +0000
X-Inumbo-ID: 6a6cecf0-15b8-11ea-a55d-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6a6cecf0-15b8-11ea-a55d-bc764e2007e4;
 Tue, 03 Dec 2019 10:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1575369239;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1b25f9Pb9+YABHaRHo8XXkmvV7QeC9VPU7jM1wHOrxA=;
 b=bHPfrcgeo10WJW0J8WV9zoeZy19twEO5RmyctdBpNzNm3WdMX3P4r8pp
 htoT8jZzNLJH/CHg9qIv94Rg3g5891OgiShnmNpsQ02veF1XIKST20ZFR
 B1fveNEX6o3K9wL7eG/cIKdYG6Z2o7SFOJFTNfEuir+an3Oo5Y+hsGdAu 0=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
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
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: W2KXanF+yOP1wPTZ8UZmI0KvnMnCQR74mfppw46rODdtBIuVIVSW1lc//I3F7XCgY7kpmoVNVS
 bpFbtpWVxFqhAMEc/wB9umsTf3QfPBQFqCGBuSyAreSq22qkCOLRx3A+celWURgWxyJk6t+Skk
 wNYODYFwe/wBQRNyRYelXfnwVcwKe/iCxEkAVz6VigA9WZza+yN6+SzqpNtq6LSjfOWZjbJmZM
 hraI7Uqd9VQvC0HvUKRyArhPVznbsMMU/vYdgthGJ5pH7p6JykSfFTrrTODtiRXMYZ8HvPgF9w
 vtw=
X-SBRS: 2.7
X-MesageID: 9656568
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,272,1571716800"; 
   d="scan'208";a="9656568"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 3 Dec 2019 11:33:51 +0100
Message-ID: <20191203103352.29728-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191203103352.29728-1-roger.pau@citrix.com>
References: <20191203103352.29728-1-roger.pau@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 1/2] automation: add timestamps to Xen tests
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
Cc: Doug Goldstein <cardoe@cardoe.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RW5hYmxlIFhlbiB0aW1lc3RhbXBzIGluIHRoZSBhdXRvbWF0ZWQgWGVuIHRlc3RzLCB0aGlzIGlz
IGhlbHBmdWwgaW4Kb3JkZXIgdG8gZmlndXJlIG91dCBpZiBYZW4gaXMgc3R1Y2sgb3IganVzdCBz
bG93IGluIHRoZSBhdXRvbWF0ZWQKdGVzdHMuCgpTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9u
bsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KLS0tCiBhdXRvbWF0aW9uL3NjcmlwdHMvcWVtdS1z
bW9rZS14ODYtNjQuc2ggfCAzICsrLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwg
MSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2F1dG9tYXRpb24vc2NyaXB0cy9xZW11LXNtb2tl
LXg4Ni02NC5zaCBiL2F1dG9tYXRpb24vc2NyaXB0cy9xZW11LXNtb2tlLXg4Ni02NC5zaAppbmRl
eCA1ZmEzYTYzZGJkLi5mMzhlYWNmZDlmIDEwMDc1NQotLS0gYS9hdXRvbWF0aW9uL3NjcmlwdHMv
cWVtdS1zbW9rZS14ODYtNjQuc2gKKysrIGIvYXV0b21hdGlvbi9zY3JpcHRzL3FlbXUtc21va2Ut
eDg2LTY0LnNoCkBAIC0yNCw3ICsyNCw4IEBAIHNldCArZQogdGltZW91dCAtayAxIDEwIFwKIHFl
bXUtc3lzdGVtLXg4Nl82NCAtbm9ncmFwaGljIC1rZXJuZWwgYmluYXJpZXMveGVuIFwKICAgICAg
ICAgLWluaXRyZCB4dGYvdGVzdHMvZXhhbXBsZS8kayBcCi0gICAgICAgIC1hcHBlbmQgImxvZ2x2
bD1hbGwgY29tMT0xMTUyMDAsLDhuMSBjb25zb2xlPWNvbTEgbm9yZWJvb3QgJGV4dHJhIiBcCisg
ICAgICAgIC1hcHBlbmQgImxvZ2x2bD1hbGwgY29tMT0xMTUyMDAsLDhuMSBjb25zb2xlPWNvbTEg
bm9yZWJvb3QgXAorICAgICAgICAgICAgICAgICBjb25zb2xlX3RpbWVzdGFtcHM9Ym9vdCAkZXh0
cmEiIFwKICAgICAgICAgLW0gNTEyIC1tb25pdG9yIG5vbmUgLXNlcmlhbCBmaWxlOnNtb2tlLnNl
cmlhbAogc2V0IC1lCiBncmVwIC1xICdUZXN0IHJlc3VsdDogU1VDQ0VTUycgc21va2Uuc2VyaWFs
IHx8IGV4aXQgMQotLSAKMi4yNC4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
