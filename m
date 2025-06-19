Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56FA4AE0E3D
	for <lists+xen-devel@lfdr.de>; Thu, 19 Jun 2025 21:51:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1020353.1396644 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSLHh-0001DV-Ni; Thu, 19 Jun 2025 19:50:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1020353.1396644; Thu, 19 Jun 2025 19:50:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSLHh-0001B5-KT; Thu, 19 Jun 2025 19:50:53 +0000
Received: by outflank-mailman (input) for mailman id 1020353;
 Thu, 19 Jun 2025 19:50:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c5Pn=ZC=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uSLHg-0001Az-1V
 for xen-devel@lists.xenproject.org; Thu, 19 Jun 2025 19:50:52 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b3039c6c-4d46-11f0-a30d-13f23c93f187;
 Thu, 19 Jun 2025 21:50:50 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id CBC174ABED;
 Thu, 19 Jun 2025 19:50:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD1CBC4CEEA;
 Thu, 19 Jun 2025 19:50:47 +0000 (UTC)
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
X-Inumbo-ID: b3039c6c-4d46-11f0-a30d-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750362648;
	bh=acloxf4CADeKhC5LIwKdP81HPfEUkNlm0QXPNvuJq+0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=JZiuFVLixLZBW/H9abA75XhatkV5HFPq5cBAzz56E+Sn7zo0MA65Cxce+p51rbe4D
	 MlL+iE/NqvaaQ8mRkf0JXl8ZdSspFYJN4qPbXWBjrg0Z1Q492sRWCWaPkpWbHrsQ1n
	 RM0wZDwpyMs+bdY7VCQTXifAVu2Z75LFtqVJA+tuk8w0HiQhFLxqyXSch+3s8YI3Aj
	 AdbOv0zLOVlHtgY4GgISVJ6sh/qTeHNfEFX4Z5dcnXqm7GJ3IaEcOAKLxZutFjLZSR
	 pexX9SfMUpRXTbEZDmMWP9L2FexvXvE6Fptkm1yr9S60SoikYx0KjxqM9CQ3Qj+dAf
	 DEkHEMWEkKuJQ==
Date: Thu, 19 Jun 2025 12:50:46 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Alejandro Vallejo <agarciav@amd.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH v3 08/14] xen/dt: Move bootfdt functions to
 xen/bootfdt.h
In-Reply-To: <DAQKTR8QHLNG.281MIGAIW8SZ4@amd.com>
Message-ID: <alpine.DEB.2.22.394.2506191249310.1780597@ubuntu-linux-20-04-desktop>
References: <20250613151612.754222-1-agarciav@amd.com> <20250613151612.754222-9-agarciav@amd.com> <alpine.DEB.2.22.394.2506131815200.8480@ubuntu-linux-20-04-desktop> <DAQKTR8QHLNG.281MIGAIW8SZ4@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 19 Jun 2025, Alejandro Vallejo wrote:
> Hi,
> 
> On Sat Jun 14, 2025 at 3:16 AM CEST, Stefano Stabellini wrote:
> > On Fri, 13 Jun 2025, Alejandro Vallejo wrote:
> >> diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
> >> index 75017e4266..0a22b1ba1d 100644
> >> --- a/xen/include/xen/device_tree.h
> >> +++ b/xen/include/xen/device_tree.h
> >> @@ -10,6 +10,7 @@
> >>  #ifndef __XEN_DEVICE_TREE_H__
> >>  #define __XEN_DEVICE_TREE_H__
> >>  
> >> +#include <xen/bootfdt.h>
> >>  #include <xen/byteorder.h>
> >
> > This should not be needed?
> 
> dt_read_number() is still needed in dt_read_paddr() in device_tree.h
> 
> I can move that helper too (makes sense, as it's strictly a wrapper) and
> add includes in whatever .c files require it (tentatively it looks like only
> static-evtchn.c. Then that include can be dropped.

Procede as you think is best. I thought it was unneeded by code
inspection, then I tried to remove it and Xen compiled okay. So I wrote
that comment. If it is needed it is also OK to keep it.

