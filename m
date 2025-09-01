Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78D01B3F0B4
	for <lists+xen-devel@lfdr.de>; Mon,  1 Sep 2025 23:56:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1105386.1456312 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utCVD-0002N2-0W; Mon, 01 Sep 2025 21:55:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1105386.1456312; Mon, 01 Sep 2025 21:55:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utCVC-0002Kt-Tc; Mon, 01 Sep 2025 21:55:50 +0000
Received: by outflank-mailman (input) for mailman id 1105386;
 Mon, 01 Sep 2025 21:55:49 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@xen.org>) id 1utCVB-0002Kn-Rf
 for xen-devel@lists.xenproject.org; Mon, 01 Sep 2025 21:55:49 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1utCV7-001M9z-2X;
 Mon, 01 Sep 2025 21:55:46 +0000
Received: from [19.12.91.86] (helo=localhost)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1utCV7-00COLF-2A;
 Mon, 01 Sep 2025 21:55:45 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID
	:Subject:Cc:To:Date:From; bh=vxCpnRsJ25qmn+AFxDqD1rYc2ebQPzUWXUR5bwmZLxw=; b=
	IF+5XOyZjsI/sDXLAN3sTVQr+eWyQ6FPGePfDRV3BVjAaM0mDaqmgXC1EhOWIqhDnQRJZ8I+0aUKK
	d6Azg6L7Mh/hZSbS5R71QmGUt8RAINhBJTxUS4l6AUKQCmwsvZD0ixY7Rgqg5kR2F/RZMkRfN0f4z
	GCgBwWMV+1xc4Zjzg=;
From: dmukhin@xen.org
Date: Mon, 1 Sep 2025 14:55:44 -0700
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: dmkhn@proton.me, xen-devel@lists.xenproject.org,
	andrew.cooper3@citrix.com, anthony.perard@vates.tech,
	jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com,
	roger.pau@citrix.com, dmukhin@ford.com
Subject: Re: [PATCH v11] xen/console: introduce domain_console struct
Message-ID: <aLYWYOzfZ4hzhiR4@kraken>
References: <20250807005649.551704-1-dmukhin@ford.com>
 <alpine.DEB.2.22.394.2508291506170.341243@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2508291506170.341243@ubuntu-linux-20-04-desktop>

On Fri, Aug 29, 2025 at 03:06:27PM -0700, Stefano Stabellini wrote:
> On Thu, 7 Aug 2025, dmkhn@proton.me wrote:
> > From: Denis Mukhin <dmukhin@ford.com> 
> > 
> > Introduce domain_console for grouping data structures used for integrating
> > domain's diagnostic console with Xen's console driver.
> > 
> > Group all pbuf-related data structures under domain_console. Rename the moved
> > fields to plain .buf, .idx and .lock names, since all uses of the fields are
> > touched.
> > 
> > Ensure accesses to domain_console pointer are valid in console_switch_input().
> > 
> > Bump the domain console buffer allocation size to 256. No extra symbol for the
> > value since it is used only once during data structure declaration. All size
> > checks use ARRAY_SIZE().
> > 
> > Allocate domain_console from the heap so that the parent domain struct size
> > stays below PAGE_SIZE boundary to account for more console-related fields
> > added in the future.
> > 
> > Finally, update the domain_console allocation and initialization code. Make
> > sure domain_console is not allocated for system domains.
> > 
> > No functional change.
> > 
> > Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> 
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Thank you

