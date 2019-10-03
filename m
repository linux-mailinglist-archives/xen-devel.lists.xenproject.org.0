Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7526FC9FDD
	for <lists+xen-devel@lfdr.de>; Thu,  3 Oct 2019 15:51:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iG1Tw-0003sL-RJ; Thu, 03 Oct 2019 13:49:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=mAUn=X4=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1iG1Tv-0003sA-2O
 for xen-devel@lists.xenproject.org; Thu, 03 Oct 2019 13:49:23 +0000
X-Inumbo-ID: 9a1c474c-e5e4-11e9-9727-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9a1c474c-e5e4-11e9-9727-12813bfff9fa;
 Thu, 03 Oct 2019 13:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1570110561;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=C8gu3u0jmuUkleoR1qnSeIJznfZhaFZTKWf4Jx4btzk=;
 b=IhDp77oYmer+86RRWJADFd/g8tVxDIkd9CVbxZXnKMdLNb419oMGnGbB
 sywDh7Z/EDxYP9jCx56KlxsilO3mIsSXZ41V4v/4MoVcBWaM2XFNwZj4e
 qeyRg/WY1PL0CIXh5dz8wD+Jic8FhyG4Q67l19e0lUsh/T8jM0QYu5ry+ U=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=igor.druzhinin@citrix.com;
 spf=Pass smtp.mailfrom=igor.druzhinin@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 igor.druzhinin@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 igor.druzhinin@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 49ZLIWYiETLjMJF/1Jenm5NQzZcQdgzKYL1tttx8GDOW0kKWzf42XMwE6WbHjSbIujI0zI0vOz
 hQsSHDSSfD/jfM0xeSi/4HuzDreJ2KedACf3dGl77qgXFjhAewa3qiPozrIaMNC0q9etugfHQL
 xTc6L5hZVOzOeAkqbhRvD8QYCLfMEucjhgwn+Ur25foryqSNe+9xT1BJZvgiBVLn4EuBptBWK4
 fjMV0IgtGYk69L0kuV8e/RMjJzvhTsCew8ERT4V5qP5BCE0QtCRZrfYtlSwUnN8ZKNXiE2qo0x
 8oU=
X-SBRS: 2.7
X-MesageID: 6669741
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,252,1566878400"; 
   d="scan'208";a="6669741"
From: Igor Druzhinin <igor.druzhinin@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 3 Oct 2019 14:49:13 +0100
Message-ID: <1570110555-24287-1-git-send-email-igor.druzhinin@citrix.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 0/2] EFI GOP fixes
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

SWdvciBEcnV6aGluaW4gKDIpOgogIGVmaS9ib290OiBmaXggc2V0X2NvbG9yIGZ1bmN0aW9uCiAg
ZWZpL2Jvb3Q6IG1ha2Ugc3VyZSBjaG9zZW4gbW9kZSBpcyBzZXQgZXZlbiBpZiBmaXJtd2FyZSB0
ZWxsIGl0IGlzCgogeGVuL2NvbW1vbi9lZmkvYm9vdC5jIHwgMTAgKysrKysrKy0tLQogMSBmaWxl
IGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCi0tIAoyLjcuNAoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
