Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3EEA4E24B1
	for <lists+xen-devel@lfdr.de>; Mon, 21 Mar 2022 11:50:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.292911.497451 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWFc7-0004oQ-1O; Mon, 21 Mar 2022 10:50:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 292911.497451; Mon, 21 Mar 2022 10:50:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWFc6-0004lz-Uh; Mon, 21 Mar 2022 10:50:14 +0000
Received: by outflank-mailman (input) for mailman id 292911;
 Mon, 21 Mar 2022 10:50:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TqSg=UA=citrix.com=prvs=072a23104=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nWFc6-0004lq-26
 for xen-devel@lists.xenproject.org; Mon, 21 Mar 2022 10:50:14 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id adae3458-a904-11ec-a405-831a346695d4;
 Mon, 21 Mar 2022 11:50:12 +0100 (CET)
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
X-Inumbo-ID: adae3458-a904-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1647859812;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ml2KVQclTyJOEspxM/gK6Fugf2lMoSzVLKsfuOZIYbs=;
  b=W4QL94Sh9lqIlnILRHfVCcmVdVaP1GTbppqFzUI3rE2xEhqPXAXb/Xcj
   HoqOzM9lTjmKbZXxnpy83yKsaOVm88HoxX+vmGx4F80S6dDMZ2MYBZTj3
   u8sYhyQ7IifC27Z3mKoleN6GWmPAblR1gMPrmsYaFvPnElF+CU8XqTYf3
   o=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 66754730
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:k2/HbqPhGw4pYZnvrR11l8FynXyQoLVcMsEvi/4bfWQNrUog1zIAz
 jNLWzrVM/zYNmL9ftEgaYSy8ElV6JWGm4IwSAto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH1dOKJQUBUjclkfJKlYAL/En03FFcMpBsJ00o5wbZi2Ncw2LBVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Z4
 tAVlMe8WFwQL47dqfw0XiNHHn8nBPgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALJc/3PIQZqzd4wCvQF/oOSpHfWaTao9Rf2V/cg+gQQ6mDO
 5VCMVKDajyYYRt3GFpMN64Alc6wiUjvVDEGmRGs8P9fD2/7k1UqjemF3MDuUsyHQ4BZk1iVo
 krC/n/lGVcKOdqH0z2H/3mwwOjVkkvTQ54fGrS+8bhxnFSZy2gXCRsXfUu6pfi/mgi1XNc3A
 0YZ4DY0pK4+skmiVMDgXgaQqWSB+BUbXrJ4DOkS+AyLjK3O7G6xHXMYRzRMbNgnss4eRjEw0
 FKN2dTzClRHsqCRSH+b3qeZq3W1Iyd9BWQLfyMDQCMO6sPvp4x1hRXKJuuPC4bs0IezQ2uph
 WnX8m5u3N3/kPLnyY2R+Ajm2D69/aHYbR8E/izaZH2osFpAMdvNi5OT1XDX6vNJLYC8R1aHv
 WQZl8X20N3iHa1hhwTWHrxTQejBC+KtdWSF3AUxR8VJGyGFoSbLQGxG3N1pyK6F2O4gcCShX
 kLcsBg5CHR7bCrzNv8fj25c5q0XIUnc+TbNC6u8gjlmOMEZmOq7EMZGPxL44owVuBJw+ZzTw
 L/CGSpWMV4UCL580B29TPoH3Lkgy0gWnD2PGsCil03+gePFNRZ5rIvp13PUM4gEAF6s+l2Jo
 76zyePUo/mgbAEOSnaOqtNCRbz7BXM6GYr3u6Rqmh2reWJb9JUaI6aJm9sJItU994wMz7ug1
 iztCydwlQuk7VWaeFriV5yWQO62NXqJhSlgZnJE0JfB8yVLXLtDG49ELsppJ+Z7rLI/pRO2J
 tFcE/i97j10Ymyv01wggVPV9uSOqDzDadqyAheY
IronPort-HdrOrdr: A9a23:M0dG4qoKRotj5HRakBeiaqUaV5oreYIsimQD101hICG8cqSj+f
 xGuM5rsSMc6QxhPU3I9ursBEDtex/hHNtOkO4s1NSZLWvbUQmTTL2KhLGKq1aLJ8S9zJ8/6U
 4JSdkZNDSaNzlHZKjBjzWFLw==
X-IronPort-AV: E=Sophos;i="5.90,198,1643691600"; 
   d="scan'208";a="66754730"
Date: Mon, 21 Mar 2022 10:50:05 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>, <cardoe@cardoe.com>, <wl@xen.org>,
	<andrew.cooper3@citrix.com>, <xen-devel@lists.xenproject.org>, "Stefano
 Stabellini" <stefano.stabellini@xilinx.com>, <bertrand.marquis@arm.com>
Subject: Re: [PATCH RESEND 2/2] gitlab-ci: add an ARM32 qemu-based smoke test
Message-ID: <YjhYXYCMLHfXlVwB@perard.uk.xensource.com>
References: <20210714004854.31135-2-sstabellini@kernel.org>
 <2aaddfc5-0502-fd0a-6393-63a17c7f6778@xen.org>
 <alpine.DEB.2.22.394.2203161508200.3497@ubuntu-linux-20-04-desktop>
 <YjSfPtUwWrqhDsW2@perard.uk.xensource.com>
 <alpine.DEB.2.22.394.2203181713000.2910984@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2203181713000.2910984@ubuntu-linux-20-04-desktop>

On Fri, Mar 18, 2022 at 05:15:06PM -0700, Stefano Stabellini wrote:
> On Fri, 18 Mar 2022, Anthony PERARD wrote:
> > On Wed, Mar 16, 2022 at 06:38:53PM -0700, Stefano Stabellini wrote:
> > > Also considering the recent arm32 xen breakage, which could have been
> > > caught by gitlab-ci before commit,
> > 
> > I'm not sure that's true. I think the commits you are speaking about
> > also break the build on x86, which was caught by the gitlab ci.
> > 
> > Anyway, some arm32 smoke tests on gitlab should be useful.
> 
> I think we are probably talking about different breakages :-)
> 
> Ayan recently broke Xen on ARM32 (run-time not build-time) with the
> commit 9e5a68a66 and fef5531fd. I verified that the QEMU32 test in this
> series actually catches the failure.

See the pipeline on this commit:
https://gitlab.com/xen-project/xen/-/commit/fef5531fd
https://gitlab.com/xen-project/xen/-/pipelines/491963118

;-)

-- 
Anthony PERARD

