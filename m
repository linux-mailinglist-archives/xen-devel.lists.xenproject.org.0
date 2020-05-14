Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 758F41D36DD
	for <lists+xen-devel@lfdr.de>; Thu, 14 May 2020 18:45:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jZGz6-0007zz-5I; Thu, 14 May 2020 16:45:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NlH/=64=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jZGz4-0007zd-C5
 for xen-devel@lists.xenproject.org; Thu, 14 May 2020 16:45:22 +0000
X-Inumbo-ID: 4cef1994-9602-11ea-a4b3-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4cef1994-9602-11ea-a4b3-12813bfff9fa;
 Thu, 14 May 2020 16:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1589474721;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=czhQvsIWRDbqz1RpqtIinIp60DIS8tczDgv9fc4yOZM=;
 b=YWIUN4+NlKlO2D0CeSVFxQKN329mKgnw7XeDn9VGDRyZL6St5tV1iPpN
 LU2cxRqHYxyqbaC5Gu14JtaA4WdfQEzI2qO7vIMxUGMJOJXvP91yub/CS
 L3MDFxcq77JvxLTVcGkcrk3cmyJQAOgzrCvvtrQ3+fqeMcw/DFkHa5HNp 4=;
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
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
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com;
 dmarc=pass (p=none dis=none) d=citrix.com
IronPort-SDR: hufTwrDfaVviPbptfpajk9bonJMrP7EoCHNI3XhmGhGaBoVpIirjljT0bmx06kwxCpZlgmy/cf
 E1IowfnMRyqEg+RdWJMkgKO7m3XVCKSe0KGsBvhu1bVkeV6ukYvhIcd4r6hPKDZpdan2JNmPGH
 odpLFiHkb1ctmlpvZwZzhr2ufKkEamTDVqvGsHj3W/vtWxxpT7HbOIZ5+eioPydY3JQPB85veK
 xecSzFNfbvpvLRWAp3NBFhwRKFEGZAraxVHkynjMGmSfBl1Xhx86NwGGHB9O6gRMgFzN9ZBEeG
 UWs=
X-SBRS: 2.7
X-MesageID: 18245754
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,392,1583211600"; d="scan'208";a="18245754"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24253.30108.586111.505987@mariner.uk.xensource.com>
Date: Thu, 14 May 2020 17:45:16 +0100
To: Jason Andryuk <jandryuk@gmail.com>
Subject: Re: [PATCH v5 18/21] libxl: Check stubdomain kernel & ramdisk presence
In-Reply-To: <20200428040433.23504-19-jandryuk@gmail.com>
References: <20200428040433.23504-1-jandryuk@gmail.com>
 <20200428040433.23504-19-jandryuk@gmail.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
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

Jason Andryuk writes ("[PATCH v5 18/21] libxl: Check stubdomain kernel & ramdisk presence"):
> Just out of context is the following comment for libxl__domain_make:
> /* fixme: this function can leak the stubdom if it fails */
> 
> When the stubdomain kernel or ramdisk is not present, the domid and
> stubdomain name will indeed be leaked.  Avoid the leak by checking the
> file presence and erroring out when absent.  It doesn't fix all cases,
> but it avoids a big one when using a linux device model stubdomain.

Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>

