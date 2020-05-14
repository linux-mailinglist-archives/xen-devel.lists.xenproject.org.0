Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EF9F1D3606
	for <lists+xen-devel@lfdr.de>; Thu, 14 May 2020 18:08:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jZGPf-0002t2-Sn; Thu, 14 May 2020 16:08:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NlH/=64=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jZGPe-0002sj-6z
 for xen-devel@lists.xenproject.org; Thu, 14 May 2020 16:08:46 +0000
X-Inumbo-ID: 2fded8d0-95fd-11ea-b9cf-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2fded8d0-95fd-11ea-b9cf-bc764e2007e4;
 Thu, 14 May 2020 16:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1589472526;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=Y/T8Grcn34HMj3CGoXXwBGV24cvuScdXdDdEnlZ/FJY=;
 b=UnmTCGJmcXIWgknyulNCbULjlpBiMkVjPqz3RYQAOBRNytGiGkE06YKA
 IfV4um0E9wVObnxI2dK61gXJ+lH/72XbZ/LDXOOhDAw3eiemPXE5WwrXK
 VOaPewn74GhWkOALq+zVtKCXBGWp5SA0+xv2kTI+irt+OTZ/zr00t7buU s=;
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
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
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com;
 dmarc=pass (p=none dis=none) d=citrix.com
IronPort-SDR: j4NUtXO7gk5nDydIprIn/k7pD/k9R5rFwVhwJxYzS2c9apFb/VkPjnSd2BKKQ09+B0bbsZ8Xlk
 ur3b+xNZ9X29F+YQFvH5ParntF7ravEE517k7mVvnyMpMCrSDmx0uBHa1LCrRLATWAXb4yy6KJ
 TSjMZSOhXE2z7Ioed18LOSl+qWtCTZ/vhIer3avP6+UNfWnfS/+M3GenVeFk54uS6Uoddf1A7R
 YvlNp/DV13/tHWAVUT6wyyxc46tTCkVUsAhOFYnYPpBFErd2EFRRdxGFWe+4g1CaWquVhFHdFl
 KvI=
X-SBRS: 2.7
X-MesageID: 17539758
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,391,1583211600"; d="scan'208";a="17539758"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
Message-ID: <24253.27911.881494.657040@mariner.uk.xensource.com>
Date: Thu, 14 May 2020 17:08:39 +0100
To: Jason Andryuk <jandryuk@gmail.com>
Subject: Re: [PATCH v5 02/21] Document ioemu Linux stubdomain protocol
In-Reply-To: <20200428040433.23504-3-jandryuk@gmail.com>
References: <20200428040433.23504-1-jandryuk@gmail.com>
 <20200428040433.23504-3-jandryuk@gmail.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <Andrew.Cooper3@citrix.com>,
 George Dunlap <George.Dunlap@citrix.com>,
 Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?=
 <marmarek@invisiblethingslab.com>, Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Jason Andryuk writes ("[PATCH v5 02/21] Document ioemu Linux stubdomain protocol"):
> From: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> 
> Add documentation for upcoming Linux stubdomain for qemu-upstream.

Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>

This probably shouldn't be committed except with the implmeentation
:-).

Ian.

