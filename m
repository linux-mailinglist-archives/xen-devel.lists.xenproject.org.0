Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3D76C3881
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2019 17:05:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFJfP-000587-9u; Tue, 01 Oct 2019 15:02:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rvNq=X2=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1iFJab-0004ON-60
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2019 14:57:21 +0000
X-Inumbo-ID: c41b7084-e45b-11e9-9702-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by localhost (Halon) with ESMTPS
 id c41b7084-e45b-11e9-9702-12813bfff9fa;
 Tue, 01 Oct 2019 14:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569941840;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Xghgu9KcB7ibFaIMt8VDKSPyd8RK6kPmGYyxg/fjkgk=;
 b=Zho7DnR10UkdojHMG/68vHj2N+RTFBA7w5ED98erxDa2WAu0apiWOWNo
 5EX+K3U0BJoqD0Cb24Kb3N8QEDt/CsLQAocVOq05ezZfrxbIetDQBeWcN
 GpJF0G2O2fqxWRlD1A/Bg5vCemHwaGXFRJzOA32/3LLfA+5EyfP8GO7c/ M=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=paul.durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 paul.durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="paul.durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: RymhN+7LULBvXplrj3sq21HiUFEDdErU+tofNbdOQl6PPK4dnqaGlrmI4iBtnpztfOmUl32REh
 b9+4XK68B+P1D2IAtjAJf5hEhQj1Y0Gx4/bP2Z/6ZlM5QVqZgartJlZT/9T3E0Fwx2hWQjw6c8
 0pFBHfcuSh2030a0p0eD9+z34CuLeOn6Go70JxMfWhvEYHsmJxHe6UygpPD5N75U/TPFf8cg9y
 u0/L5IyE0FBsOrbuf/3o7mKaVOtpEYp3us79SGyriy+293c6fVakbBWgbxGNNa52EUnzuM3uEO
 WQw=
X-SBRS: 2.7
X-MesageID: 6557833
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,571,1559534400"; 
   d="scan'208";a="6557833"
From: Paul Durrant <paul.durrant@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 1 Oct 2019 15:57:12 +0100
Message-ID: <20191001145714.556-1-paul.durrant@citrix.com>
X-Mailer: git-send-email 2.20.1.2.gb21ebb671
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 01 Oct 2019 15:02:16 +0000
Subject: [Xen-devel] [PATCH-for-4.13 v2 0/2] libxl: fix assertion failure
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
Cc: Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
 Paul Durrant <paul.durrant@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyB3YXMgb3JpZ2luYWxseSBhIHNpbmdsZSBwYXRjaCwgd2hpY2ggaXMgbm93IHBhdGNoICMy
IG9mIHRoaXMgc2VyaWVzLgoKUGF1bCBEdXJyYW50ICgyKToKICBsaWJ4bDogcmVwbGFjZSAnZW5h
YmxlZCcgd2l0aCAndW5rbm93bicgaW4gbGlieGxfcGFzc3Rocm91Z2gKICAgIGVudW1lcmF0aW9u
CiAgbGlieGw6IGNob29zZSBhbiBhcHByb3ByaWF0ZSBkZWZhdWx0IGZvciBwYXNzdGhyb3VnaC4u
LgoKIHRvb2xzL2xpYnhsL2xpYnhsX2NyZWF0ZS5jICB8IDEwICsrKysrKystLS0KIHRvb2xzL2xp
YnhsL2xpYnhsX3R5cGVzLmlkbCB8ICAyICstCiB0b29scy94bC94bF9wYXJzZS5jICAgICAgICAg
fCAyNiArKysrKysrKysrKysrKystLS0tLS0tLS0tLQogMyBmaWxlcyBjaGFuZ2VkLCAyMyBpbnNl
cnRpb25zKCspLCAxNSBkZWxldGlvbnMoLSkKLS0tCkNjOiBBbnRob255IFBFUkFSRCA8YW50aG9u
eS5wZXJhcmRAY2l0cml4LmNvbT4KQ2M6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRy
aXguY29tPgpDYzogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgpDYzogV2VpIExpdSA8
d2xAeGVuLm9yZz4KLS0gCjIuMjAuMS4yLmdiMjFlYmI2NzEKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
