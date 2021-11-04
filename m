Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D113E445904
	for <lists+xen-devel@lfdr.de>; Thu,  4 Nov 2021 18:53:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.221830.383724 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1migv1-0002VG-UR; Thu, 04 Nov 2021 17:52:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 221830.383724; Thu, 04 Nov 2021 17:52:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1migv1-0002SP-Qv; Thu, 04 Nov 2021 17:52:55 +0000
Received: by outflank-mailman (input) for mailman id 221830;
 Thu, 04 Nov 2021 17:52:55 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1migv0-0002SJ-V7
 for xen-devel@lists.xenproject.org; Thu, 04 Nov 2021 17:52:54 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1migv0-0001Iu-RW
 for xen-devel@lists.xenproject.org; Thu, 04 Nov 2021 17:52:54 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1migv0-0007lD-Q6
 for xen-devel@lists.xenproject.org; Thu, 04 Nov 2021 17:52:54 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1migug-0003Tg-Ee; Thu, 04 Nov 2021 17:52:34 +0000
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
	bh=sYZte+nVO5b9Nzc5VUhZ1ihjQjw/VMqCPKDV2mSvyUU=; b=1IX4PIOB3GXoo5iv74C8gFPKgK
	Mvtgp15J5TfrWyB+5/NuPLpe4OgfpwFpfNQaMGQOLb0LOB2+6xUuZkAqI6TFMw+GGllCkVFbwkiC5
	LQQVcnty4d0EOOB+AAEid+4Xa5RF1PfeXNxBdy3HdWhh9xWz6/ypHP2fB7TXcAYGM3Aw=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24964.7640.116612.519384@mariner.uk.xensource.com>
Date: Thu, 4 Nov 2021 17:52:24 +0000
To: Julien Grall <julien@xen.org>
Cc: Michal Orzel <michal.orzel@arm.com>,
    Stefano Stabellini <sstabellini@kernel.org>,
    Ian Jackson <iwj@xenproject.org>,
    Julien Grall <julien.grall.oss@gmail.com>,
    xen-devel <xen-devel@lists.xenproject.org>,
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
    Bertrand Marquis <bertrand.marquis@arm.com>
Subject: Re: [patch-4.16] arm/smmuv1,v2: Protect smmu master list with a lock
In-Reply-To: <8ff2dc1a-b640-ec2a-810a-c135f0399130@xen.org>
References: <20211026122903.15042-1-michal.orzel@arm.com>
	<e5632a4e-db98-41b4-1045-2b3532c098fa@xen.org>
	<70c30a6c-b779-805e-079a-41bb484894b9@xen.org>
	<cb452c0c-ccde-7798-c403-f972b48a2c46@arm.com>
	<01545115-e82e-2a9d-a8e4-da9676080c0f@xen.org>
	<alpine.DEB.2.21.2110271557570.20134@sstabellini-ThinkPad-T480s>
	<CAJ=z9a2SSgG7a87_xTGT5LeNLgubOLQf1+dbnrsTsP8_p5ErJg@mail.gmail.com>
	<alpine.DEB.2.21.2110271658330.20134@sstabellini-ThinkPad-T480s>
	<4554621d-63da-ea3e-e56a-4e01d0cef347@xen.org>
	<alpine.DEB.2.21.2110281311030.20134@sstabellini-ThinkPad-T480s>
	<24959.49895.14808.77881@mariner.uk.xensource.com>
	<alpine.DEB.2.21.2111011341480.20134@sstabellini-ThinkPad-T480s>
	<9955c390-e5a4-0e58-f0db-b070249d3b16@arm.com>
	<8ff2dc1a-b640-ec2a-810a-c135f0399130@xen.org>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Julien Grall writes ("Re: [patch-4.16] arm/smmuv1,v2: Protect smmu master list with a lock"):
> On 04/11/2021 09:18, Michal Orzel wrote:
> > On 01.11.2021 21:51, Stefano Stabellini wrote:
> >> On Mon, 1 Nov 2021, Ian Jackson wrote:
> >>> It sounds like this is a possible latent bug, or at least a bad state
> >>> of the code that might lead to the introduction of bad bugs later.

^ this is the upside.

> >>> Can you set out the downside for me too ?  What are the risks ?  How
> >>> are the affected code paths used in 4.16 ?
> >>>
> >>> A good way to think about this is: if taking this patch for 4.16
> >>> causes problems, what would that look like ?
> >>
> >> The patch affects the SMMU code paths that are currently in-use for
> >> non-PCI devices which are currently supported. A bug in this patch could
> >> cause a failure to setup the SMMU for one or more devices. I would
> >> imagine that it would manifest probably as either an error or an hang
> >> (given that it is adding spin locks) early at boot when the SMMU is
> >> configured.
> >>
> >> The validation of this patch would mostly happen by review: it is the
> >> kind of patch that changes some "return -1" into "goto err".

^ this is the downside.

> > In order not to leave this patch high and dry:

Michal, you are right that we should not just stall this.

> My main objection is on the process. We should not merge patch that 
> doesn't fix a real issue at this stage of this release.

I agree with Julien.  I wouldn't characterise this as a process
objection.  I think it is a practical objection.  As I understand it
the patch can only harm the experience of users of 4.16.  The release
process is primarily aimed at making sure 4.16 meets the needs of
users.

So:

Release-Nacked-by: Ian Jackson <iwj@xenproject.org>

I would be very sympathetic to code comment patches which document the
limitations/restrictions so as to make the future bugs less likely.

> ... Ian can we get your release-acked-by?

You can have my decision.  I hope this is helpful.

Thanks,
Ian.

