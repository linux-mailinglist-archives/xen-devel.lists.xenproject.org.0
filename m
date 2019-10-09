Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 518FBD19E3
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2019 22:43:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iIIkm-0000is-7M; Wed, 09 Oct 2019 20:40:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=oEee=YC=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1iIIkl-0000ih-4s
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2019 20:40:11 +0000
X-Inumbo-ID: fbbb3cd4-ead4-11e9-80e3-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fbbb3cd4-ead4-11e9-80e3-bc764e2007e4;
 Wed, 09 Oct 2019 20:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1570653610;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=z+VNBLUi3XEHXWcHeR3frN4H9JqggtLkkXxnjeplxoU=;
 b=ayzsks2bxnrCnAdwRjzS/PXmjWNyUmW9eRAZy/5A2x/MMWV55b1fUKAG
 a4hpWVDLMJkIUahuYdvwvygEvvOi1/9Wp8TSpuc21cEAiU1v4M8bqhp/1
 1lx0tkCXjMKsplJJ4X7vl9I/Y1AlXNx18L4xodPHXnTACQhzKQmMIfpu0 k=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=igor.druzhinin@citrix.com;
 spf=Pass smtp.mailfrom=igor.druzhinin@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 igor.druzhinin@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 igor.druzhinin@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
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
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: DCdr9JH8oeTIVNRtF28HA8FXjlvjsleQalPb5sUHLh5qu5ESvQJzBSBekZR9Uo1xEuUCHfVPUD
 VYAhoOZhPD8mNGQofQCCn+bdpZJ2HGmMG1lc2U7bD7rqaAWzewgzJkrX8tGjZ6IDcYKwZqYzGl
 p9AeelH8Kn8IQ1VH0r/sq+P0N5p1YQ4b7+nm8yaOQMsjvq+htwfZ9Fpd9wwpL4qUjtt1erfAUg
 RW3ZBDcyLTZw9J9FryHGlGkywSPjQ3Mhk6+UGJhi6uAhrXYR7n5mS3vBUJu1mT8O42tm4acyIW
 e+k=
X-SBRS: 2.7
X-MesageID: 6684886
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,277,1566878400"; 
   d="scan'208";a="6684886"
From: Igor Druzhinin <igor.druzhinin@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 9 Oct 2019 21:40:01 +0100
Message-ID: <1570653603-9889-2-git-send-email-igor.druzhinin@citrix.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1570653603-9889-1-git-send-email-igor.druzhinin@citrix.com>
References: <1570653603-9889-1-git-send-email-igor.druzhinin@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH for-4.13 v2 1/3] efi/boot: add missing pointer
 dereference in set_color
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

U2lnbmVkLW9mZi1ieTogSWdvciBEcnV6aGluaW4gPGlnb3IuZHJ1emhpbmluQGNpdHJpeC5jb20+
Ci0tLQogeGVuL2NvbW1vbi9lZmkvYm9vdC5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9lZmkvYm9v
dC5jIGIveGVuL2NvbW1vbi9lZmkvYm9vdC5jCmluZGV4IDlhODk0MTQuLjZjZWY0MjkgMTAwNjQ0
Ci0tLSBhL3hlbi9jb21tb24vZWZpL2Jvb3QuYworKysgYi94ZW4vY29tbW9uL2VmaS9ib290LmMK
QEAgLTExMTYsNyArMTExNiw3IEBAIHN0YXRpYyBpbnQgX19pbml0IF9fbWF5YmVfdW51c2VkIHNl
dF9jb2xvcih1MzIgbWFzaywgaW50IGJwcCwgdTggKnBvcywgdTggKnN6KQogICAgICAgIHJldHVy
biAtRUlOVkFMOwogICAgZm9yICggKnBvcyA9IDA7ICEobWFzayAmIDEpOyArKypwb3MgKQogICAg
ICAgIG1hc2sgPj49IDE7Ci0gICBmb3IgKCAqc3ogPSAwOyBtYXNrICYgMTsgKytzeikKKyAgIGZv
ciAoICpzeiA9IDA7IG1hc2sgJiAxOyArKypzeikKICAgICAgICBtYXNrID4+PSAxOwogICAgaWYg
KCBtYXNrICkKICAgICAgICByZXR1cm4gLUVJTlZBTDsKLS0gCjIuNy40CgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
