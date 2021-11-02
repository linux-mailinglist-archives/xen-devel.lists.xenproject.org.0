Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C017D44323F
	for <lists+xen-devel@lfdr.de>; Tue,  2 Nov 2021 17:02:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.220401.381684 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhwDn-0008WR-1I; Tue, 02 Nov 2021 16:01:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 220401.381684; Tue, 02 Nov 2021 16:01:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhwDm-0008U2-UN; Tue, 02 Nov 2021 16:01:10 +0000
Received: by outflank-mailman (input) for mailman id 220401;
 Tue, 02 Nov 2021 16:01:09 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mhwDl-0008Tw-8y
 for xen-devel@lists.xenproject.org; Tue, 02 Nov 2021 16:01:09 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mhwDl-0000nT-3t
 for xen-devel@lists.xenproject.org; Tue, 02 Nov 2021 16:01:09 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mhwDl-0003TQ-3E
 for xen-devel@lists.xenproject.org; Tue, 02 Nov 2021 16:01:09 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mhwDU-0001Za-O9; Tue, 02 Nov 2021 16:00:52 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:Cc:To:Date
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=Dai0H+tuPEb1tkqZ47Fy88yw9gcbx1FydiV2M5UUips=; b=dPfNmedWbD6vKhDLqw0GYvbMuQ
	2vH83QWGnKtzozYIFQF1Hn+pHa1mh7l8gYuDJ/cCVE/X+yqf7rti7/j8pwthI4mLDgEqF0U4cBMKQ
	WxBdtSarmO++mFTIpfKJvpvIwd4EOa6P8wJDrQY0JI7EyjB+9S3DSwssWH/JKzN66o8I=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24961.24756.236341.888900@mariner.uk.xensource.com>
Date: Tue, 2 Nov 2021 16:00:52 +0000
To: Jan Beulich <jbeulich@suse.com>
Cc: Dongli Zhang <dongli.zhang@oracle.com>,
    sstabellini@kernel.org,
    julien@xen.org,
    Volodymyr_Babchuk@epam.com,
    andrew.cooper3@citrix.com,
    george.dunlap@citrix.com,
    wl@xen.org,
    joe.jin@oracle.com,
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 1/1] xen: update system time immediately when
 VCPUOP_register_vcpu_info
In-Reply-To: <fdcc4adb-c823-2c08-57ed-e4306c1e186e@suse.com>
References: <20211025173523.3647-1-dongli.zhang@oracle.com>
	<fdcc4adb-c823-2c08-57ed-e4306c1e186e@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Jan Beulich writes ("Re: [PATCH v2 1/1] xen: update system time immediately when VCPUOP_register_vcpu_info"):
> On 25.10.2021 19:35, Dongli Zhang wrote:
> > The guest may access the pv vcpu_time_info immediately after
> > VCPUOP_register_vcpu_info. This is to borrow the idea of
> > VCPUOP_register_vcpu_time_memory_area, where the
> > force_update_vcpu_system_time() is called immediately when the new memory
> > area is registered.
> > 
> > Otherwise, we may observe clock drift at the VM side if the VM accesses
> > the clocksource immediately after VCPUOP_register_vcpu_info().
> > 
> > Reference:
> > https://lists.xenproject.org/archives/html/xen-devel/2021-10/msg00571.html
> > Cc: Joe Jin <joe.jin@oracle.com>
> > Signed-off-by: Dongli Zhang <dongli.zhang@oracle.com>
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> 
> Ian - any thoughts towards 4.16 here either way?

This looks like a bugfix to me, and the diff is certainly small.  I am
positively inclined.  I would like to know what the risks are.
Stefano says this does nothing on ARM so the risk would be to x86.
Can you advise ?

Thanks,
Ian.

