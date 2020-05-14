Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FA181D36D4
	for <lists+xen-devel@lfdr.de>; Thu, 14 May 2020 18:43:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jZGx6-0007in-73; Thu, 14 May 2020 16:43:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NlH/=64=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jZGx4-0007hn-0B
 for xen-devel@lists.xenproject.org; Thu, 14 May 2020 16:43:18 +0000
X-Inumbo-ID: 02af982c-9602-11ea-b07b-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 02af982c-9602-11ea-b07b-bc764e2007e4;
 Thu, 14 May 2020 16:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1589474598;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=zk407Zx2NhZqy1uEhJfHNMgPucOjR8qsFj7cF6VTpiA=;
 b=gejuf4/Cbt/qrLr+wVuwjWj4Zq1PWTXCAKEb5sg9ZH3i0MsIeRFxWizs
 f9q6tIihOafkUTuWIoNcZhzkfWGHMMxr4shn4xMbrTxxbOnyWQnxN4LEC
 MOFaM+5nN6uDey+t7gHd+AEObqvN6F6x+77nn++0Wc4BNFy7/pcN/an2+ 0=;
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
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
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com;
 dmarc=pass (p=none dis=none) d=citrix.com
IronPort-SDR: fphBZdBlwuEEDWVe/fPZLWXBvpDaGAmMdl5nBEYpjV1JXpGDGjZHWPHbXooyxXnMY3T9Jfmjd1
 lx+S07vX7Ovqk+oIMUfBuy2dZcRGQUMV4q2+wht6Dt8c5OVmFgKP8mdWva1nL2GCeZIxSrvlaI
 ZUZhi8r+ZY90Bx9lj2ygVglvuPqlEKzy4zzfs3zo1a6OcLfSE5oAiOc99UO3mL5EQgG3YQzOCZ
 5IRT9st2MPxFSXrR/WSX4RVKPhJs4DvE/eq/fEG/bT/CR0yX1ohtcrqOq99hHbTJ5aiw8wdExD
 /LU=
X-SBRS: 2.7
X-MesageID: 17571860
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,392,1583211600"; d="scan'208";a="17571860"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
Message-ID: <24253.29984.17178.839943@mariner.uk.xensource.com>
Date: Thu, 14 May 2020 17:43:12 +0100
To: Jason Andryuk <jandryuk@gmail.com>
Subject: Re: [PATCH v5 15/21] libxl: ignore emulated IDE disks beyond the
 first 4
In-Reply-To: <20200428040433.23504-16-jandryuk@gmail.com>
References: <20200428040433.23504-1-jandryuk@gmail.com>
 <20200428040433.23504-16-jandryuk@gmail.com>
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

Jason Andryuk writes ("[PATCH v5 15/21] libxl: ignore emulated IDE disks beyond the first 4"):
> From: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> 
> Qemu supports only 4 emulated IDE disks, when given more (or with higher
> indexes), it will fail to start. Since the disks can still be accessible
> using PV interface, just ignore emulated path and log a warning, instead
> of rejecting the configuration altogether.
> 
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> Reviewed-by: Jason Andryuk <jandryuk@gmail.com>
> Signed-off-by: Jason Andryuk <jandryuk@gmail.com>

Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>

