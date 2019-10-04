Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37489CBEED
	for <lists+xen-devel@lfdr.de>; Fri,  4 Oct 2019 17:19:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iGPKX-0001PO-23; Fri, 04 Oct 2019 15:17:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=lQ+Z=X5=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iGPKU-0001P9-VR
 for xen-devel@lists.xenproject.org; Fri, 04 Oct 2019 15:17:15 +0000
X-Inumbo-ID: 0b1329ea-e6ba-11e9-975c-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0b1329ea-e6ba-11e9-975c-12813bfff9fa;
 Fri, 04 Oct 2019 15:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1570202233;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=HHjvVa0hXjDUJXHOkFJUifA2m5S0BM39eHlsW+65hwM=;
 b=MsFR4N5X7XywAtFt32KnrDv50eghJQfaxL2bBx4RGgw+4h/ARJK8f/GV
 HpCfpRrELop7/Kk85015+Mtab5ZVT1MHNbwpoAftaItJDG0Q4qz6iKBXs
 AiLVG0Qn5nyjbYiehFwptO1rhhG8zOeA8WPCffEHHCE5+GSbGsyuP4XSo c=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@eu.citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@eu.citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@eu.citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: UEQo/Gwz4NDYcIsDhZrkYoVTIgIAVvwenJrkIeuXp8470ohZabAgWTWzGGC81ocAlBUtfdhJp3
 Osj4zhX/RfrWasuH5BW9SmOxnuM3i+LUCFqrRWUtgkQsr93HehW2ZMG4inX9ov4DV0aHPKazNP
 3+g2yCymMtZjUYJBKEv3X3Xsh1y0PMA2vOYjj29p5hkEqnBrYz5ulz8gcQCAroj6siyFb1hnX+
 9sMzaQ4lFo3k0BI2PV4BjC3k87H3EwPuivaSDGU4tzgdBzYASbjE1O9SCnbb+Uy9wzYbWkRSmQ
 6HU=
X-SBRS: 2.7
X-MesageID: 6779127
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,256,1566878400"; 
   d="scan'208";a="6779127"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 4 Oct 2019 16:17:02 +0100
Message-ID: <20191004151707.24844-2-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20191004151707.24844-1-ian.jackson@eu.citrix.com>
References: <20191004151707.24844-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [XEN PATCH for-4.13 1/6] libxl: Offer API versions
 0x040700 and 0x040800
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
 =?UTF-8?q?J=C3=BCrgen=20Gro=C3=9F?= <jgross@suse.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QWNjb3JkaW5nIHRvIGdpdCBsb2cgLUc6CgoweDA0MDcwMCB3YXMgaW50cm9kdWNlZCBpbiAzMDQ0
MDA0NTllZjAgKGFrYSA0LjcuMC1yYzF+NDgxKQogICJ0b29scy9saWJ4bDogcmVuYW1lIHJlbXVz
IGRldmljZSB0byBjaGVja3BvaW50IGRldmljZSIKCjB4MDQwODAwIHdhcyBpbnRyb2R1Y2VkIGlu
IDU3ZjhiMTNjNzI0MCAoYWthIDQuOC4wLXJjMX40MzcpCiAgImxpYnhsOiBtZW1vcnkgc2l6ZSBp
biBrYiByZXF1aXJlcyA2NCBiaXQgdmFyaWFibGUiCgpJdCBpcyBzdXJwcmlzaW5nIHRoYXQgbm8t
b25lIG5vdGljZWQgdGhpcy4gIEkgd29uZGVyIGlmIGFueW9uZSBpcwp1c2luZyBvdXIgTElCWExf
QVBJX1ZFUlNJT04gZmFjaWxpdHkuICBJZiBub3QgbWF5YmUgd2Ugc2hvdWxkIHRha2UgYQpkaWZm
ZXJlbnQgYXBwcm9hY2guCgpBbnl3YXksIGluIHRoZSBtZWFudGltZSwgd2Ugc2hvdWxkIGZpeCB0
aGlzLiAgQmFja3BvcnRpbmcgdGhpcyBpcwpwcm9iYWJseSBhIGdvb2QgaWRlYTogaXQgd29uJ3Qg
Y2hhbmdlIHRoZSBiZWhhdmlvdXIgZm9yIGV4aXN0aW5nCmNhbGxlcnMgYnV0IGl0IHdpbGwgYXZv
aWQgZXJyb3JzIGZvciBzb21lIG9sZGVyIGNvcnJlY3QgdXNlcy4KClNpZ25lZC1vZmYtYnk6IElh
biBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgotLS0KIHRvb2xzL2xpYnhsL2xp
YnhsLmggfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBh
L3Rvb2xzL2xpYnhsL2xpYnhsLmggYi90b29scy9saWJ4bC9saWJ4bC5oCmluZGV4IDI1NTVlOWNk
M2IuLjUxOGZjOWU0N2YgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2xpYnhsL2xpYnhsLmgKKysrIGIvdG9v
bHMvbGlieGwvbGlieGwuaApAQCAtNjU1LDYgKzY1NSw3IEBAIHR5cGVkZWYgc3RydWN0IGxpYnhs
X19jdHggbGlieGxfY3R4OwogI2lmZGVmIExJQlhMX0FQSV9WRVJTSU9OCiAjaWYgTElCWExfQVBJ
X1ZFUlNJT04gIT0gMHgwNDAyMDAgJiYgTElCWExfQVBJX1ZFUlNJT04gIT0gMHgwNDAzMDAgJiYg
XAogICAgIExJQlhMX0FQSV9WRVJTSU9OICE9IDB4MDQwNDAwICYmIExJQlhMX0FQSV9WRVJTSU9O
ICE9IDB4MDQwNTAwICYmIFwKKyAgICBMSUJYTF9BUElfVkVSU0lPTiAhPSAweDA0MDcwMCAmJiBM
SUJYTF9BUElfVkVSU0lPTiAhPSAweDA0MDgwMCAmJiBcCiAgICAgTElCWExfQVBJX1ZFUlNJT04g
IT0gMHgwNDEzMDAKICNlcnJvciBVbmtub3duIExJQlhMX0FQSV9WRVJTSU9OCiAjZW5kaWYKLS0g
CjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
