Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91C581958FC
	for <lists+xen-devel@lfdr.de>; Fri, 27 Mar 2020 15:30:43 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jHpxh-0001Vk-6u; Fri, 27 Mar 2020 14:27:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=HB07=5M=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jHpxg-0001Vf-7O
 for xen-devel@lists.xenproject.org; Fri, 27 Mar 2020 14:27:52 +0000
X-Inumbo-ID: 2391ceb6-7037-11ea-899d-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2391ceb6-7037-11ea-899d-12813bfff9fa;
 Fri, 27 Mar 2020 14:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585319271;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=U118HJzD2YmpW7f5LN7HuTVHdm8Gdb5QMwh2qM6UWnc=;
 b=dC+XIVcbKM49OHQtCnvaJ4B+0HMNo5fE115Vqh456KYByOiwyCq50xLb
 lgGzW+qYYtxZsi7jV3is9dSL/VqVVcHjQeeDcKqVr0r62k2drB/7XTF8F
 6CzSxJ6Z/VC9LUxH/KV/0AyofSdTBMj/UmQODi3U6AHqomY0YQCQtg3c5 s=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: cyI61rH9AnrsbBPgqLpNzJv4ChQ9plosMKh/kbsDj2owEO4fjqcBRwj42nRoZblq5Ze63hKWvr
 dwPfWLAQlZwKzW4CEaYuaq1NK0PgdkvQkWq5m0G/eieoWYcVkrrxDDziazeBN2HtANmJv1GexL
 eNvBSPUWvHW5yvR+KLkNyRmEiLYVboJm4nAlw+KsNTyvtqpRZajyBckOgM5pd/974VSX9LOxDF
 vVMuL55HDHS8DxHUBDD98P8VNESFfRX6hsjeGrybSZWbh+b9Naae93jBuDXeOjLoE/s4xNMM/5
 FvU=
X-SBRS: 2.7
X-MesageID: 15167595
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,312,1580792400"; d="scan'208";a="15167595"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24190.3426.470473.335250@mariner.uk.xensource.com>
Date: Fri, 27 Mar 2020 14:27:46 +0000
To: Olaf Hering <olaf@aepfle.de>
In-Reply-To: <20200327142256.3256-1-olaf@aepfle.de>
References: <20200327142256.3256-1-olaf@aepfle.de>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH v1] libxl: remove limit for default number
 of event channels
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
Cc: Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Olaf Hering writes ("[PATCH v1] libxl: remove limit for default number of event channels"):
> The imposed limit of 1023 is too low for a three digit value of vcpus.
> Remove the arbitrary value of 1023 and let Xen decide about the upper limit.

This seems likely to be right, but: what is the default in Xen ?  Is
it sufficiently tight to stop a guest using too many resources ?

Ian.

