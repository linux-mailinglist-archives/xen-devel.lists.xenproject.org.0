Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F690570832
	for <lists+xen-devel@lfdr.de>; Mon, 11 Jul 2022 18:22:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.365298.595422 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oAwAF-0007Zy-PZ; Mon, 11 Jul 2022 16:21:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 365298.595422; Mon, 11 Jul 2022 16:21:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oAwAF-0007XD-Mp; Mon, 11 Jul 2022 16:21:39 +0000
Received: by outflank-mailman (input) for mailman id 365298;
 Mon, 11 Jul 2022 16:21:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=79kg=XQ=citrix.com=prvs=184793b5a=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oAwAE-0007X7-3W
 for xen-devel@lists.xenproject.org; Mon, 11 Jul 2022 16:21:38 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 87a6008e-0135-11ed-bd2d-47488cf2e6aa;
 Mon, 11 Jul 2022 18:21:36 +0200 (CEST)
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
X-Inumbo-ID: 87a6008e-0135-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1657556496;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4/cPvRGCHv91OABlMjjXd4S9LvIBx6YhWn+u3h66+IA=;
  b=LLDN0g/M3dFFRKGFs0Z93B1aY0JxAeuXwSDp3weNls2zhoFgREh11rdB
   rbG4kzyztvSsRQvLUSDatECnBgeMLbUEGs9FLbztwxAct9axWrG6mRDqz
   0oo3CYT7MgFrV/+YCBM81haaIQ3hNbz4kireKtmafrMkAxuUhIDiNaCOT
   k=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 75530228
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:aL9PSK563xOzrJ2vC/ZHVQxRtGjHchMFZxGqfqrLsTDasY5as4F+v
 jccUGDXOqyPYmuhfI0kOY/j90IEv5fdnNNqGQM5qi5jHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuVGuG96yE6j8lkf5KkYAL+EnkZqTRMFWFw03qPp8Zj2tQy2YfgWlvX0
 T/Pi5a31GGNimYc3l08s8pvmDs31BglkGpF1rCWTakjUG72zxH5PrpGTU2CByKQrr1vNvy7X
 47+IISRpQs1yfuP5uSNyd4XemVSKlLb0JPnZnB+A8BOiTAazsA+PzpS2FPxpi67hh3Q9+2dx
 umhurSgaR1qJvTik903dDZTTBFBL+5C25rIdC3XXcy7lyUqclPpyvRqSko3IZcZ6qB8BmQmG
 f4wcW5XKErZ3qTvnez9GrIEascLdaEHOKsWvG1gyjfIS+4rW5nZT43B5MNC3Sd2jcdLdRrbT
 5VENGE3Nk6QC/FJEm42A7sfxtymvXjieAF4rU+kiekvoGeGmWSd15CyaYGIK7RmX/59gUKwt
 m/AuWPjDXkyJNGZjDaI7H+oruvOhj/gHpIfEqWi8fxni0HVwXYcYDUUX1ampfiyimalRslSb
 UcT/0ITQbMarRLxCIOnBlvh/SDC7kV0t8ds//MS+CGXibKNzQ2gLE8rRWFxV85lsOwTSml/v
 rOWpO8FFQCDoZXMFy/Cre/O8GrrUcQGBTRcPHFZFGPp9/Gm+dhu1UyXE76PBYbv1rXI9SfML
 ydmRcTUr5EaloY12qqy5jgraBr898GSHmbZCug6N19JDz+Vh6b/PuREEXCBsZ59wH+xFzFtR
 kQslcmE9/wpBpqQjiGLS+hlNOj3uqnZb22F3gI+RcVJG9GRF5mLJNo43d2DDB0xbpZslcHBO
 ic/Rj+9FLcMZSD3PMebkqq6CtgwzLiIKOkJosv8N4IUCrAoLVfv1Hg3OSa4gjG2+GBxwP5XB
 HtuWZv1ZZrsIf8/nGTeqiZ0+eJD+x3SMkuKGMqrnkT5gerDDJNXIJ9cWGazgikCxPvsiG3oH
 xx3baNmFz03vDXCXxTq
IronPort-HdrOrdr: A9a23:ozisTK30oLanUogeguacdgqjBLIkLtp133Aq2lEZdPRUGvb3qy
 mLpoV+6faUskd1ZJhOo7290cW7LU80sKQFhrX5Xo3SPjUO2lHJEGgK1+KLqFfd8m/Fh41gPM
 9bAs5D4bbLbGSS4/yU3DWF
X-IronPort-AV: E=Sophos;i="5.92,263,1650945600"; 
   d="scan'208";a="75530228"
Date: Mon, 11 Jul 2022 17:21:25 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Wei Liu
	<wl@xen.org>
Subject: Re: [PATCH] xl: relax freemem()'s retry calculation
Message-ID: <YsxOBUfIl47N+E+u@perard.uk.xensource.com>
References: <55556c13-dbaa-3eb7-9f3a-9e448a0324aa@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <55556c13-dbaa-3eb7-9f3a-9e448a0324aa@suse.com>

On Fri, Jul 08, 2022 at 03:39:38PM +0200, Jan Beulich wrote:
> While in principle possible also under other conditions as long as other
> parallel operations potentially consuming memory aren't "locked out", in
> particular with IOMMU large page mappings used in Dom0 (for PV when in
> strict mode; for PVH when not sharing page tables with HAP) ballooning
> out of individual pages can actually lead to less free memory available
> afterwards. This is because to split a large page, one or more page
> table pages are necessary (one per level that is split).
> 
> When rebooting a guest I've observed freemem() to fail: A single page
> was required to be ballooned out (presumably because of heap
> fragmentation in the hypervisor). This ballooning out of a single page
> of course went fast, but freemem() then found that it would require to
> balloon out another page. This repeating just another time leads to the
> function to signal failure to the caller - without having come anywhere
> near the designated 30s that the whole process is allowed to not make
> any progress at all.
> 
> Convert from a simple retry count to actually calculating elapsed time,
> subtracting from an initial credit of 30s. Don't go as far as limiting
> the "wait_secs" value passed to libxl_wait_for_memory_target(), though.
> While this leads to the overall process now possibly taking longer (if
> the previous iteration ended very close to the intended 30s), this
> compensates to some degree for the value passed really meaning "allowed
> to run for this long without making progress".
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> I further wonder whether the "credit expired" loop exit wouldn't better
> be moved to the middle of the loop, immediately after "return true".
> That way having reached the goal on the last iteration would be reported
> as success to the caller, rather than as "timed out".

That would sound like a good improvement to the patch.

Thanks,

-- 
Anthony PERARD

