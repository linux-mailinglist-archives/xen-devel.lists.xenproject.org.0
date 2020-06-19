Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67BF2200FF1
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2020 17:25:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jmIte-0003Be-NV; Fri, 19 Jun 2020 15:25:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A/CH=AA=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jmItd-0003BZ-Bp
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2020 15:25:37 +0000
X-Inumbo-ID: 1f5fe980-b241-11ea-bba6-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1f5fe980-b241-11ea-bba6-12813bfff9fa;
 Fri, 19 Jun 2020 15:25:36 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: /mSgulF+ycME8TtcnonrGmCH8Byxg2si0Wz7VVPdJ4wvABsGA4c3np5bWsLHKgbSaP70TioZb+
 vGIKqeqOQv0zacONna5UKXgUTMd+7+5/Qez50c8WRW0kpy/63v5RmgfSMm8yZi5Bq4qekBuCnl
 7BhW1ev5XzXXwk9cCYDm15ZMiSW1y1kbCMqEPVSqnyf/RitR1M8K4GqCHtpriP2vUT8J2gTW/J
 zLxP4dyoH7TwYxpAPb1v+XRQBnr3o6ynbxkPfVyZ4nHQMzTZ0TLZ8jAXqVkAatuAW0QyWOImk1
 Zc0=
X-SBRS: 2.7
X-MesageID: 20479828
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,255,1589256000"; d="scan'208";a="20479828"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
Message-ID: <24300.55530.451581.376231@mariner.uk.xensource.com>
Date: Fri, 19 Jun 2020 16:25:30 +0100
To: Paul Durrant <paul@xen.org>, Patrik =?iso-8859-1?Q?Horn=EDk?=
 <patrik@hornik.sk>
Subject: Re: [PATCH for 4.14] libxl: allow passthrough to PV guests regardless
 of whether IOMMU is enabled
In-Reply-To: <20200619073315.8414-1-paul@xen.org>
References: <20200619073315.8414-1-paul@xen.org>
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
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Paul
 Durrant <pdurrant@amazon.com>, Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Paul Durrant writes ("[PATCH for 4.14] libxl: allow passthrough to PV guests regardless of whether IOMMU is enabled"):
> From: Paul Durrant <pdurrant@amazon.com>
> 
> Commit babde47a "introduce a 'passthrough' configuration option to xl.cfg..."
> added a check to xl_parse.c:parse_config_data() to make sure that an IOMMU
> was present and enabled in the system before allowing devices to be passed
> through to a guest. This check was then subsequently moved into
> libxl_create.c:libxl__domain_config_setdefault() by commit ad011ad0 "libxl/xl:
> Overhaul passthrough setting logic".
> 
> Prior to this check being added, it was possible (although not in any way safe
> or supported) to pass devices through to a PV guest without an IOMMU being
> enabled in the system. This patch relaxes the check for PV guests to restore
> that possibility, emitting a warning instead.

Thanks.

Reviewed-by: Ian Jackson <ian.jackson@eu.citrix.com>

I think this patch could have
  Reported-by: Patrik Horník <patrik@hornik.sk>
Patrik, if we put your credit in like this it will be permanently
recorded in our git history, as part of our code traceability etc.
Please let us know what you would prefer.

> Signed-off-by: Paul Durrant <pdurrant@amazon.com>
> ---
> Cc: Ian Jackson <ian.jackson@eu.citrix.com>
> Cc: Wei Liu <wl@xen.org>A
> Cc: Anthony PERARD <anthony.perard@citrix.com>
> 
> This patch ought to be in 4.14 as it as very obvious change, restoring lost
> functionality that has affected a user.

Thanks.  I'll take that as a release-ack :-).

Also, I will add this tag too when I commit this:

Backport: 4.13+

Ian.

