Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77642C9FDF
	for <lists+xen-devel@lfdr.de>; Thu,  3 Oct 2019 15:52:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iG1U2-0003sw-4R; Thu, 03 Oct 2019 13:49:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=mAUn=X4=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1iG1U0-0003sX-1D
 for xen-devel@lists.xenproject.org; Thu, 03 Oct 2019 13:49:28 +0000
X-Inumbo-ID: 9a6cc62c-e5e4-11e9-9727-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9a6cc62c-e5e4-11e9-9727-12813bfff9fa;
 Thu, 03 Oct 2019 13:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1570110563;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=tF7w/7mqj8IwgpPtQkuMPPTxghPi+ksljdz3BKUJThU=;
 b=Q66uXR6cJH33ZWurNIe2Kmjlu0fhoVDB2SM/ZQg+u6HmoEnn5m0v9rIG
 mO8gBGClpgPWMVh+uVvvi57/kcFAUEwpXgaHO4U8uL3q7nOa+v2aoAFpz
 YmmPy0/SmyHpo4iVYC8XDZMY4HtKZt8ORNMKYqpZsv4YYkDDCCa+ymlul g=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Me9VyvpGclwF1TBnHqDr0w7e6HWsJxCyM8rlfHQ06lltLKXlXwgfjQZIecvmjWAmV573zf0WNQ
 +JhFXbEN6ZUuapSkjVj998IAFhBsxs1UrsfkpAp6t53yBOmB/6lvcAmJKp8izzGAiyYPHeisA3
 DkN+DHlRqS67TjkXjZQkFUvBbfNryxoVYfhdJ008WQtKCigJV/y12lengiUs/laGklV3A5l57M
 zuMa/AVtRpeoZm3LXoH1Sq1MNbC+RYJJBR16r92L0f97B5WAD3lX8wWLjD95bpY8OzTE26uU5O
 4Jo=
X-SBRS: 2.7
X-MesageID: 6422683
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,252,1566878400"; 
   d="scan'208";a="6422683"
From: Igor Druzhinin <igor.druzhinin@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 3 Oct 2019 14:49:15 +0100
Message-ID: <1570110555-24287-3-git-send-email-igor.druzhinin@citrix.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1570110555-24287-1-git-send-email-igor.druzhinin@citrix.com>
References: <1570110555-24287-1-git-send-email-igor.druzhinin@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 2/2] efi/boot: make sure chosen mode is set even
 if firmware tell it is
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
Cc: Igor Druzhinin <igor.druzhinin@citrix.com>, jbeulich@suse.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SWYgYSBib290bG9hZGVyIGlzIHVzaW5nIG5hdGl2ZSBkcml2ZXIgaW5zdGVhZCBvZiBFRkkgR09Q
IGl0IG1pZ2h0CnJlc2V0IGdyYXBoaWNzIG1vZGUgdG8gYmUgZGlmZmVyZW50IGZyb20gd2hhdCBm
aXJtd2FyZSB0aGlua3MgaXQKY3VycmVudGx5IGlzLiBTZXQgY2hvc2VuIG1vZGUgdW5jb25kaXRp
b25hbGx5IHRvIGZpeCB0aGlzIHBvc3NpYmxlCm1pc2FsaWdubWVudC4KCk9ic2VydmVkIHdpdGgg
RUZJIEdSVUIyIGNvbXBpbGVkIHdpdGggYWxsIHBvc3NpYmxlIHZpZGVvIGRyaXZlcnMgd2hlcmUK
bmF0aXZlIGRyaXZlcnMgdGFrZSBwcmlvcml0eSBvdmVyIGZpcm13YXJlLgoKU2lnbmVkLW9mZi1i
eTogSWdvciBEcnV6aGluaW4gPGlnb3IuZHJ1emhpbmluQGNpdHJpeC5jb20+Ci0tLQogeGVuL2Nv
bW1vbi9lZmkvYm9vdC5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAx
IGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9lZmkvYm9vdC5jIGIveGVuL2Nv
bW1vbi9lZmkvYm9vdC5jCmluZGV4IDkzM2RiODguLjQwNjc3MjEgMTAwNjQ0Ci0tLSBhL3hlbi9j
b21tb24vZWZpL2Jvb3QuYworKysgYi94ZW4vY29tbW9uL2VmaS9ib290LmMKQEAgLTEwNTIsNyAr
MTA1Miw3IEBAIHN0YXRpYyB2b2lkIF9faW5pdCBlZmlfc2V0X2dvcF9tb2RlKEVGSV9HUkFQSElD
U19PVVRQVVRfUFJPVE9DT0wgKmdvcCwgVUlOVE4gZ29wCiAgICAgVUlOVE4gaW5mb19zaXplOwog
CiAgICAgLyogU2V0IGdyYXBoaWNzIG1vZGUuICovCi0gICAgaWYgKCBnb3BfbW9kZSA8IGdvcC0+
TW9kZS0+TWF4TW9kZSAmJiBnb3BfbW9kZSAhPSBnb3AtPk1vZGUtPk1vZGUgKQorICAgIGlmICgg
Z29wX21vZGUgPCBnb3AtPk1vZGUtPk1heE1vZGUgKQogICAgICAgICBnb3AtPlNldE1vZGUoZ29w
LCBnb3BfbW9kZSk7CiAKICAgICAvKiBHZXQgZ3JhcGhpY3MgYW5kIGZyYW1lIGJ1ZmZlciBpbmZv
LiAqLwotLSAKMi43LjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
