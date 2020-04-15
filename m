Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33C451AA90C
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2020 15:50:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOiQv-0006Hs-Po; Wed, 15 Apr 2020 13:50:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=RJH9=57=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jOiQu-0006Hl-N1
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2020 13:50:28 +0000
X-Inumbo-ID: 0f62f21a-7f20-11ea-8a50-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0f62f21a-7f20-11ea-8a50-12813bfff9fa;
 Wed, 15 Apr 2020 13:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1586958628;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=DX7seWI444dQtUzzyfy+tFF7R0mmM0fIh4xow2/mPlI=;
 b=YcF9uqHZBWGhAOcoxXOnyS3SbPjFY/PhlDO59lfWlml0XxVf1DAbfie/
 3bqHLsfpiWADpv+IT4iVYVTZm6/YVxduzbFHesc5IlbC/HPEbakzhR9oX
 trqtJPaw8HNaYhRSI7Pcx0/aMcYod6D+0GonDuswDQJ4tqDixcM32FjI8 c=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
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
IronPort-SDR: 4zzX6FdRlQojD56QbBLrfDE/Kog+0ziTVlH3YpO3QF24KensuB8voPSJikOCPWFS/0nk5Li8En
 bhh5e+ged14KDpqXII8T659ZTBSnkApyXobCF6hW5rZpIuWFhktnoJ/yoSo0oCwXAVT4I3SaBU
 PKWY00nX/P1cL8Yt+O4zgWxdvgh+9Xz3kmrWs+MSJ5UuiEtLqATZsxh/epctz06FTzpqoLrLhU
 8N4aS+pTaPJkCq+VgZxANXrYrieiYyE39zkFdeAHnN4NyyRA5OsSuuf0O9shgksKu/ZBI9sYAg
 f8w=
X-SBRS: 2.7
X-MesageID: 15955713
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,387,1580792400"; d="scan'208";a="15955713"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24215.4380.895524.768102@mariner.uk.xensource.com>
Date: Wed, 15 Apr 2020 14:50:20 +0100
To: Roger Pau Monne <roger.pau@citrix.com>
Subject: Re: [PATCH OSSTEST 1/2] exanime: test for SMT and add a host flag
In-Reply-To: <20200415134722.GL28601@Air-de-Roger>
References: <20200415085246.7945-1-roger.pau@citrix.com>
 <24215.1635.613926.945930@mariner.uk.xensource.com>
 <20200415134722.GL28601@Air-de-Roger>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Roger Pau Monne writes ("Re: [PATCH OSSTEST 1/2] exanime: test for SMT and add a host flag"):
> If OTOH we don't want to be that fine grained I think
> hw-{smt,iommu,vmx,...} would also be fine.
> 
> Not sure whether this has helped much. I guess my vote would be for
> cpu-smt namespace.

Let's go with hw-*.  That will avoid chopping logic over the precise
nature of hardware features, especially ones which have elements in
multiple components.

Thanks,
Ian.

