Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B251D360F
	for <lists+xen-devel@lfdr.de>; Thu, 14 May 2020 18:10:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jZGRS-0003jJ-Cd; Thu, 14 May 2020 16:10:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NlH/=64=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jZGRR-0003jE-QW
 for xen-devel@lists.xenproject.org; Thu, 14 May 2020 16:10:37 +0000
X-Inumbo-ID: 720e2a59-95fd-11ea-a4b0-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 720e2a59-95fd-11ea-a4b0-12813bfff9fa;
 Thu, 14 May 2020 16:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1589472636;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=BJAywIiEegLx6jsR7Rtjl8UG8QzQHLIMfNnFGm9NpD0=;
 b=ADckRYwV6ism7kn9OCkV0U3top9E7DJiWjPfgNXcTrQMecrVVVvELBGP
 Znvk23eo9PjvakGJN6bIYKW0XTt+Ls0kN9c6dfixP7oZ/hcIPMx3J05cV
 V7Rmfh8nkqAC6IxG963lSqh/W+8uXGSJqFTW+lucGpe3F55rrihb4ydOB E=;
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com;
 dmarc=pass (p=none dis=none) d=citrix.com
IronPort-SDR: Hq6JI01u0muvXElBBXv5O0LgzKVBjolsunBIyrhsh+vdMUI+tLscZ+Xy7T7Ut6jTwv1amsskwc
 caCSgf99Vb4SbVGPmvTCXxag2Kti36eiKsxaJ3jn6W13jwK5NbPTY4iOol0RGcnYLVSe4DKngO
 26CNfPpY05Obk3V1DPaZHrWMnOL7EKaI/5FbWSKCIE++DBaktC1U1n4KTkaGNc/GLy7Nc792OX
 sWtaVN4SXf1BvJTF1SlyH5oPG49Tm9Lx+UprWtR0v98j651bu9iKQxqqF24cVpnpdtgDNuD9pu
 PQE=
X-SBRS: 2.7
X-MesageID: 17814247
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,392,1583211600"; d="scan'208";a="17814247"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
Message-ID: <24253.28008.395070.927378@mariner.uk.xensource.com>
Date: Thu, 14 May 2020 17:10:16 +0100
To: Jason Andryuk <jandryuk@gmail.com>
Subject: Re: [PATCH v5 04/21] libxl: Allow running qemu-xen in stubdomain
In-Reply-To: <20200428040433.23504-5-jandryuk@gmail.com>
References: <20200428040433.23504-1-jandryuk@gmail.com>
 <20200428040433.23504-5-jandryuk@gmail.com>
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
 Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?=
 <marmarek@invisiblethingslab.com>, Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Jason Andryuk writes ("[PATCH v5 04/21] libxl: Allow running qemu-xen in stubdomain"):
> From: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> 
> Do not prohibit anymore using stubdomain with qemu-xen.
> To help distingushing MiniOS and Linux stubdomain, add helper inline
> functions libxl__stubdomain_is_linux() and
> libxl__stubdomain_is_linux_running(). Those should be used where really
> the difference is about MiniOS/Linux, not qemu-xen/qemu-xen-traditional.
> 
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> Signed-off-by: Jason Andryuk <jandryuk@gmail.com>

Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>

