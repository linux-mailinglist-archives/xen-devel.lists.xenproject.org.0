Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0BBD308924
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jan 2021 13:44:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.78123.141979 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5T8W-0007S6-39; Fri, 29 Jan 2021 12:44:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 78123.141979; Fri, 29 Jan 2021 12:44:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5T8V-0007Rg-VV; Fri, 29 Jan 2021 12:44:27 +0000
Received: by outflank-mailman (input) for mailman id 78123;
 Fri, 29 Jan 2021 12:44:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o9cT=HA=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1l5T8U-0007RP-Bf
 for xen-devel@lists.xenproject.org; Fri, 29 Jan 2021 12:44:26 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f82c3f76-aa8a-4280-9fd9-a8a894624fd9;
 Fri, 29 Jan 2021 12:44:23 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: f82c3f76-aa8a-4280-9fd9-a8a894624fd9
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611924263;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=e30b84/L5AmP0sZwKPzqceua8izfpzn6mJwke7GRQn4=;
  b=Rguo/Hu5y/kNY8pVBv9CY+n4MWo04XG/1qwvqSiZv28l/30SWS/xfPLz
   JU/pxi8lMYfZn/XdCHa/hcT3RUOi+q1KuLFCTcKNyb6ZCQhul/AK8lniA
   hgVjyPttT2hhJVrqYtC2WS0OnwHlTdFBgqL4wEmfR3KEUYBbBQ3W2cl8N
   8=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: osq9WiU3Q1Sl+yp30jDbbOYQmOHqaK17EN+Eq67E83dTmh6pxgq6f45Jkl8/L0AvDp5tMhlUij
 zGLtoQqmJTIMA5BlH3w5tNZMLf6xfDWuZUq6z4drTS05jEPBcCfdZuIVlNOo6q5B1upBAoYHbw
 iVe2xMw+yFXi0y89iQzJjZfTaq3SGbWAPc46QUCQoZmHRYws63ixMYZfX4xAQDl2qxYeKOFDQU
 S9LQFqvQFJq8g0v2EMSTqmjjRRgYgz7sTaDFLsNxHokp29OPQu7IB/bec0cohXR5WyvRyh+mPY
 84o=
X-SBRS: 5.1
X-MesageID: 36523086
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,385,1602561600"; 
   d="scan'208";a="36523086"
Date: Fri, 29 Jan 2021 12:44:18 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Igor Druzhinin <igor.druzhinin@citrix.com>
CC: <xen-devel@lists.xenproject.org>, <iwj@xenproject.org>, <wl@xen.org>,
	<andrew.cooper3@citrix.com>, <george.dunlap@citrix.com>, <jbeulich@suse.com>,
	<julien@xen.org>, <sstabellini@kernel.org>, <paul@xen.org>,
	<roger.pau@citrix.com>
Subject: Re: [PATCH v2 2/2] viridian: allow vCPU hotplug for Windows VMs
Message-ID: <YBQDIp1Y5mJLFQ7M@perard.uk.xensource.com>
References: <1610425048-990-1-git-send-email-igor.druzhinin@citrix.com>
 <1610425048-990-2-git-send-email-igor.druzhinin@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1610425048-990-2-git-send-email-igor.druzhinin@citrix.com>

On Tue, Jan 12, 2021 at 04:17:28AM +0000, Igor Druzhinin wrote:
> If Viridian extensions are enabled, Windows wouldn't currently allow
> a hotplugged vCPU to be brought up dynamically. We need to expose a special
> bit to let the guest know we allow it. Hide it behind an option to stay
> on the safe side regarding compatibility with existing guests but
> nevertheless set the option on by default.
> 
> Signed-off-by: Igor Druzhinin <igor.druzhinin@citrix.com>

Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

