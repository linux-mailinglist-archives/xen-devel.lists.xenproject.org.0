Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B89244D746
	for <lists+xen-devel@lfdr.de>; Thu, 11 Nov 2021 14:34:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.224752.388239 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mlACs-0002ft-8f; Thu, 11 Nov 2021 13:33:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 224752.388239; Thu, 11 Nov 2021 13:33:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mlACs-0002cq-3z; Thu, 11 Nov 2021 13:33:34 +0000
Received: by outflank-mailman (input) for mailman id 224752;
 Thu, 11 Nov 2021 13:33:32 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mlACq-0002ci-TZ
 for xen-devel@lists.xenproject.org; Thu, 11 Nov 2021 13:33:32 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mlACq-00064o-Rz
 for xen-devel@lists.xenproject.org; Thu, 11 Nov 2021 13:33:32 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mlACq-0000Y5-PQ
 for xen-devel@lists.xenproject.org; Thu, 11 Nov 2021 13:33:32 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mlACf-0005Rm-U2; Thu, 11 Nov 2021 13:33:21 +0000
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
	bh=ZiFZYIc+WwNDMosbTX+iW4TIWlEHr6isM2HyV9t6KW8=; b=ZkhYcmuEjQMXJ49flRrEZ15GzC
	jzpmgv40p+W+Geh32MRPCyXMqRvZP6syxgI5worTCSQgsc1CDkyKvcZCyzB8l8K/CI1k/4XkJ3jSl
	WuddxFQxcf6zTlho0HypwvR4QXCHawwGvOMfvplg0f579peE14caicDB0+8ytfW4SC8M=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24973.7073.267980.897378@mariner.uk.xensource.com>
Date: Thu, 11 Nov 2021 13:33:21 +0000
To: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
    Penny.Zheng@arm.com,
    Bertrand.Marquis@arm.com,
    Wei.Chen@arm.com,
    Volodymyr_Babchuk@epam.com,
    xen-devel@lists.xenproject.org,
    Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: Re: [PATCH v3] xen/arm: don't assign domU static-mem to dom0 as
 reserved-memory
In-Reply-To: <34d14ad2-3af6-1624-f30d-12f53f8ffdfb@xen.org>
References: <20211110201812.934306-1-sstabellini@kernel.org>
	<34d14ad2-3af6-1624-f30d-12f53f8ffdfb@xen.org>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Julien Grall writes ("Re: [PATCH v3] xen/arm: don't assign domU static-mem to dom0 as reserved-memory"):
> Hi Stefano,
> 
> On 10/11/2021 20:18, Stefano Stabellini wrote:
> > From: Stefano Stabellini <stefano.stabellini@xilinx.com>
> > 
> > DomUs static-mem ranges are added to the reserved_mem array for
> > accounting, but they shouldn't be assigned to dom0 as the other regular
> > reserved-memory ranges in device tree.
> > 
> > In make_memory_nodes, fix the error by skipping banks with xen_domain
> > set to true in the reserved-memory array. Also make sure to use the
> > first valid (!xen_domain) start address for the memory node name.
> > 
> > Fixes: 41c031ff437b ("xen/arm: introduce domain on Static Allocation")
> > Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> > Release-Acked-by: Ian Jackson <iwj@xenproject.org>
> 
> Reviewed-by: Julien Grall <jgrall@amazon.com>

FTAOD: I don't see a for-4.16 tag here.  So I think this is targeted
for post-4.16 ?  But I wonder if it ought to be considered.  I don't
understand the impact of the bug that is being fixed here.

Thanks,
Ian.

