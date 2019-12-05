Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FB301140B3
	for <lists+xen-devel@lfdr.de>; Thu,  5 Dec 2019 13:16:50 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1icq0z-0006Kv-HM; Thu, 05 Dec 2019 12:13:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=MeZc=Z3=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1icq0y-0006Kq-AX
 for xen-devel@lists.xenproject.org; Thu, 05 Dec 2019 12:13:48 +0000
X-Inumbo-ID: afeffae6-1758-11ea-8223-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id afeffae6-1758-11ea-8223-12813bfff9fa;
 Thu, 05 Dec 2019 12:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1575548027;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=H7GgwFaJd2VQcPQnw7nBQ/VlkmsfSIaY7Kkj2JFsc4w=;
 b=XVT4uy2ZW9G6etUyDDZgq98elQHMuT9wcrQL4JF6f9mk2DUyaDrpJQQl
 dPSIbyLHtKWuoUx9ct6Vkkcldx3MVQbxcHCKCNPEVa1mOh1PzWoG71K8r
 vCE4bTrqViK8pBdYfW1kRCwLTTwTmX5zRvx11P9rxLS3iVLLdXrsZB+IW w=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=igor.druzhinin@citrix.com;
 spf=Pass smtp.mailfrom=igor.druzhinin@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 igor.druzhinin@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 igor.druzhinin@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
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
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 7pwGZE6XuziR2U8r7z5E4nJp8DFgE+QZrha3DoKx3S6OmQCskoqWksPRS+DsEK2mHVP4LP4iKC
 pg+Y5ZhwsXE2smw19X72p/jCpx/eRKFvVo4kCf1P5cMFJjKM2XV+9qJudYFyKa53S+4o29efHk
 uLVL6KWW0p5Xqbffg3jhV/29olH04+kT+Ve+J6C9fGMnKEjxfH1NRpj14MeqcNBm8mWaLF6yC0
 jO1Ve8DgYtICRUa2rBBnI4mJPdJiylI36aXKJ7NLDlrPMH1lMKeLjuemSs8X+gr2sLOBvZvbOB
 GdI=
X-SBRS: 2.7
X-MesageID: 9244770
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,281,1571716800"; 
   d="scan'208";a="9244770"
From: Igor Druzhinin <igor.druzhinin@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 5 Dec 2019 12:13:42 +0000
Message-ID: <1575548022-14213-1-git-send-email-igor.druzhinin@citrix.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2] passthrough: drop break statement following
 c/s cd7dedad820
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
Cc: linux@eikelenboom.it, pdurrant@amazon.com, jbeulich@suse.com, Igor
 Druzhinin <igor.druzhinin@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIGxvY2tpbmcgcmVzcG9uc2liaWxpdGllcyBoYXZlIGNoYW5nZWQgYW5kIGEgcHJlbWF0dXJl
IGJyZWFrIGluCnRoaXMgc2VjdGlvbiBub3cgY2F1c2VzIHRoZSBmb2xsb3dpbmcgYXNzZXJ0aW9u
OgoKQXNzZXJ0aW9uICchcHJlZW1wdF9jb3VudCgpJyBmYWlsZWQgYXQgcHJlZW1wdC5jOjM2CgpT
dWdnZXN0ZWQtYnk6IFBhdWwgRHVycmFudCA8cGR1cnJhbnRAYW1hem9uLmNvbT4KUmVwb3J0ZWQt
Ynk6IFNhbmRlciBFaWtlbGVuYm9vbSA8bGludXhAZWlrZWxlbmJvb20uaXQ+ClNpZ25lZC1vZmYt
Ynk6IElnb3IgRHJ1emhpbmluIDxpZ29yLmRydXpoaW5pbkBjaXRyaXguY29tPgotLS0KIHhlbi9k
cml2ZXJzL3Bhc3N0aHJvdWdoL3BjaS5jIHwgMSAtCiAxIGZpbGUgY2hhbmdlZCwgMSBkZWxldGlv
bigtKQoKZGlmZiAtLWdpdCBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3BjaS5jIGIveGVuL2Ry
aXZlcnMvcGFzc3Rocm91Z2gvcGNpLmMKaW5kZXggY2VkMGMyOC4uYzA3YTYzOSAxMDA2NDQKLS0t
IGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvcGNpLmMKKysrIGIveGVuL2RyaXZlcnMvcGFzc3Ro
cm91Z2gvcGNpLmMKQEAgLTE3MDUsNyArMTcwNSw2IEBAIGludCBpb21tdV9kb19wY2lfZG9tY3Rs
KAogICAgICAgICAgICAgICAgICAgICAgICBzZWcsIGJ1cywgUENJX1NMT1QoZGV2Zm4pLCBQQ0lf
RlVOQyhkZXZmbikpOwogICAgICAgICAgICAgICAgIHJldCA9IC1FSU5WQUw7CiAgICAgICAgICAg
ICB9Ci0gICAgICAgICAgICBicmVhazsKICAgICAgICAgfQogICAgICAgICBlbHNlIGlmICggIXJl
dCApCiAgICAgICAgICAgICByZXQgPSBhc3NpZ25fZGV2aWNlKGQsIHNlZywgYnVzLCBkZXZmbiwg
ZmxhZ3MpOwotLSAKMi43LjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
