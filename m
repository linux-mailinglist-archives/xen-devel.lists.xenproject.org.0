Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07DB9229B12
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jul 2020 17:11:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jyGP4-0003rE-Ur; Wed, 22 Jul 2020 15:11:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yOZ1=BB=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jyGP3-0003r9-PV
 for xen-devel@lists.xenproject.org; Wed, 22 Jul 2020 15:11:29 +0000
X-Inumbo-ID: 9dcf9940-cc2d-11ea-8676-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9dcf9940-cc2d-11ea-8676-bc764e2007e4;
 Wed, 22 Jul 2020 15:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1595430688;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=ApPNVIIi5mcIkCo9tTSbg8wZ838gPku5lyHiuYPRiV4=;
 b=cuwEJzRCUVQebf5vYq/ObW0zjfGiyID9ftgBJBk+To0iCO0XDKqRMJNb
 0a4IS5Au4wQaqv1iJqeVbBwp3jQBi87/+xV5UPrkW+O4EUD3aANCcF3L7
 +hr4Ti3iKZquPjT8ZxD0AI4m7AafHa83fCDHUaCmggfycYjNVw04zazIQ I=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: cqWSG2edpto00/Jn2KSkPDTAiXbG3k6vl/BYC5HTRj9tBT7KFKoFL+l1djBl0I1lmH3n1OYvLC
 pFjueJ/swG9+YFXbUXyJ/3u52MT11Kg0s7BpMPclDtjahyEo10g/d2R+gN4mKsEpCtb3D+K2dO
 I6D9veTFA/H4639RRd7iK6YehtLk6YlNAuYliJkCKYFN8opz7gRgzUcQpXRFHapgl4iCTzDge6
 PVWcil4NYhoXYJ/K9IiH/DO2rhs5IPD2f3dQxm5XKhEze29GRopZwi1AvcAlY33PEuM70U5QRf
 Tvo=
X-SBRS: 2.7
X-MesageID: 23281383
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,383,1589256000"; d="scan'208";a="23281383"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
Message-ID: <24344.22297.957336.615021@mariner.uk.xensource.com>
Date: Wed, 22 Jul 2020 16:11:21 +0100
To: Roger Pau Monne <roger.pau@citrix.com>
Subject: Re: [osstest PATCH] dom0pvh: assign 1GB of memory to PVH dom0
In-Reply-To: <20200722150416.36426-1-roger.pau@citrix.com>
References: <20200722150416.36426-1-roger.pau@citrix.com>
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Roger Pau Monne writes ("[osstest PATCH] dom0pvh: assign 1GB of memory to PVH dom0"):
> Current tests use 512MB of memory for dom0, but that's too low for a
> PVH dom0 on some hosts and will cause errors because memory is
> ballooned out in order to obtain physical memory ranges to map foreign
> pages.
> 
> Using ballooned out pages for foreign mappings also doesn't seem to
> work properly with the current Linux kernel version, so increase the
> memory assigned to dom0 to 1GB for PVH dom0 tests. We should see about
> reverting this when using ballooned pages is fixed.
> 
> The runvar diff is:
> 
> +test-amd64-amd64-dom0pvh-xl-amd   dom0_mem 1024
> +test-amd64-amd64-dom0pvh-xl-intel dom0_mem 1024
> 
> I've done a repro of the failed test on elbling0 with dom0_mem set to
> 1GB and it seems to prevent the issue, the flight is 152111.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>

And queued.

Ian.

