Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 329EAD19F1
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2019 22:43:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iIIkr-0000jA-IL; Wed, 09 Oct 2019 20:40:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=oEee=YC=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1iIIkp-0000j4-Az
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2019 20:40:15 +0000
X-Inumbo-ID: fbe99643-ead4-11e9-97f9-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fbe99643-ead4-11e9-97f9-12813bfff9fa;
 Wed, 09 Oct 2019 20:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1570653610;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=31JjDne/MzQxNLXoK/dZSbJK1J09a1RW3vYMZ8axP38=;
 b=NC7aViGWTwlZ6XrSevCQp3CPVkcf6dXPMJEMhxg0/PDK1k+VzGze9iKk
 UEEYRCz0rgkKdkGCQOKaJTKw5AW/EYbSpTwaoylaRKIdUa2Zw1p94xv4E
 iO77HNXq3jZZHFD4ZHDP8Ez2KdEQuCf0ynpYRiyzHMZjGXqlxtoS9yk8B k=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=igor.druzhinin@citrix.com;
 spf=Pass smtp.mailfrom=igor.druzhinin@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 igor.druzhinin@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 igor.druzhinin@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
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
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: P83oaYzqYcFtmqdshcBkAiDtJwsrlAASVJXCt4JWFOJBpVL5j1CRzkqcUovtTVnZAiGgbUBB7x
 LojNCmmRHnlKrdJHThAxMfSGuKL7FsShSC9sg7CXg15+Y75Ft+w9S5RPEvS/RODFOSfB/hpLCs
 jzxFBloLayppfL1arbFnnPMF9I7P2yXL9hNivRUc20weG40WjGMwSrnYcWa2AjJoz2q80b05zW
 JbDT4KTGrYLK9j9FStpzOo0PzXzf1EKxGVqi8awEaf0WRkQzY3wf0OBeym8ZbdGUtaYwUqhCqM
 nsA=
X-SBRS: 2.7
X-MesageID: 6994176
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,277,1566878400"; 
   d="scan'208";a="6994176"
From: Igor Druzhinin <igor.druzhinin@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 9 Oct 2019 21:40:02 +0100
Message-ID: <1570653603-9889-3-git-send-email-igor.druzhinin@citrix.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1570653603-9889-1-git-send-email-igor.druzhinin@citrix.com>
References: <1570653603-9889-1-git-send-email-igor.druzhinin@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH for-4.13 v2 2/3] x86/efi: properly handle 0 in
 pixel reserved bitmask
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
Cc: jgross@suse.com, Igor Druzhinin <igor.druzhinin@citrix.com>, wl@xen.org,
 andrew.cooper3@citrix.com, jbeulich@suse.com, roger.pau@citrix.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SW4gc29tZSBncmFwaGljcyBtb2RlcyBmaXJtd2FyZSBpcyBhbGxvd2VkIHRvIHJldHVybiAwIGlu
IHBpeGVsIHJlc2VydmVkCmJpdG1hc2sgd2hpY2ggZG9lc24ndCBnbyBhZ2FpbnN0IFVFRkkgU3Bl
YyAyLjggKDEyLjkgR3JhcGhpY3MgT3V0cHV0IFByb3RvY29sKS4KCldpdGhvdXQgdGhpcyBjaGFu
Z2Ugbm9uLVRydWVDb2xvciBtb2RlcyB3b24ndCB3b3JrIHdoaWNoIHdpbGwgY2F1c2UKR09QIGlu
aXQgdG8gZmFpbCAtIG9ic2VydmVkIHdoaWxlIHRyeWluZyB0byBib290IEVGSSBYZW4gd2l0aCBD
aXJydXMgVkdBLgoKU2lnbmVkLW9mZi1ieTogSWdvciBEcnV6aGluaW4gPGlnb3IuZHJ1emhpbmlu
QGNpdHJpeC5jb20+Ci0tLQogeGVuL2FyY2gveDg2L2VmaS9lZmktYm9vdC5oIHwgMTIgKysrKysr
KysrLS0tCiAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9lZmkvZWZpLWJvb3QuaCBiL3hlbi9hcmNoL3g4Ni9l
ZmkvZWZpLWJvb3QuaAppbmRleCBhMDczN2Y5Li40YWY2MzE0IDEwMDY0NAotLS0gYS94ZW4vYXJj
aC94ODYvZWZpL2VmaS1ib290LmgKKysrIGIveGVuL2FyY2gveDg2L2VmaS9lZmktYm9vdC5oCkBA
IC01MjgsOSArNTI4LDE1IEBAIHN0YXRpYyB2b2lkIF9faW5pdCBlZmlfYXJjaF92aWRlb19pbml0
KEVGSV9HUkFQSElDU19PVVRQVVRfUFJPVE9DT0wgKmdvcCwKICAgICAgICAgYnBwID0gc2V0X2Nv
bG9yKG1vZGVfaW5mby0+UGl4ZWxJbmZvcm1hdGlvbi5CbHVlTWFzaywgYnBwLAogICAgICAgICAg
ICAgICAgICAgICAgICAgJnZnYV9jb25zb2xlX2luZm8udS52ZXNhX2xmYi5ibHVlX3BvcywKICAg
ICAgICAgICAgICAgICAgICAgICAgICZ2Z2FfY29uc29sZV9pbmZvLnUudmVzYV9sZmIuYmx1ZV9z
aXplKTsKLSAgICAgICAgYnBwID0gc2V0X2NvbG9yKG1vZGVfaW5mby0+UGl4ZWxJbmZvcm1hdGlv
bi5SZXNlcnZlZE1hc2ssIGJwcCwKLSAgICAgICAgICAgICAgICAgICAgICAgICZ2Z2FfY29uc29s
ZV9pbmZvLnUudmVzYV9sZmIucnN2ZF9wb3MsCi0gICAgICAgICAgICAgICAgICAgICAgICAmdmdh
X2NvbnNvbGVfaW5mby51LnZlc2FfbGZiLnJzdmRfc2l6ZSk7CisgICAgICAgIGlmICggIW1vZGVf
aW5mby0+UGl4ZWxJbmZvcm1hdGlvbi5SZXNlcnZlZE1hc2sgKQorICAgICAgICB7CisgICAgICAg
ICAgICB2Z2FfY29uc29sZV9pbmZvLnUudmVzYV9sZmIucnN2ZF9wb3MgPSAwOworICAgICAgICAg
ICAgdmdhX2NvbnNvbGVfaW5mby51LnZlc2FfbGZiLnJzdmRfc2l6ZSA9IDA7CisgICAgICAgIH0K
KyAgICAgICAgZWxzZQorICAgICAgICAgICAgYnBwID0gc2V0X2NvbG9yKG1vZGVfaW5mby0+UGl4
ZWxJbmZvcm1hdGlvbi5SZXNlcnZlZE1hc2ssIGJwcCwKKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAmdmdhX2NvbnNvbGVfaW5mby51LnZlc2FfbGZiLnJzdmRfcG9zLAorICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICZ2Z2FfY29uc29sZV9pbmZvLnUudmVzYV9sZmIucnN2ZF9zaXplKTsK
ICAgICAgICAgaWYgKCBicHAgPiAwICkKICAgICAgICAgICAgIGJyZWFrOwogICAgICAgICAvKiBm
YWxsIHRocm91Z2ggKi8KLS0gCjIuNy40CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
