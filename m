Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B68331512B
	for <lists+xen-devel@lfdr.de>; Tue,  9 Feb 2021 15:04:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83262.154486 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9TcT-0007ML-LE; Tue, 09 Feb 2021 14:03:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83262.154486; Tue, 09 Feb 2021 14:03:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9TcT-0007Lw-Hl; Tue, 09 Feb 2021 14:03:57 +0000
Received: by outflank-mailman (input) for mailman id 83262;
 Tue, 09 Feb 2021 14:03:56 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l9TcS-0007Lr-3i
 for xen-devel@lists.xenproject.org; Tue, 09 Feb 2021 14:03:56 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l9TcS-0007ut-0H
 for xen-devel@lists.xenproject.org; Tue, 09 Feb 2021 14:03:56 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l9TcR-0002Un-Uk
 for xen-devel@lists.xenproject.org; Tue, 09 Feb 2021 14:03:55 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1l9TcK-0005Yw-2r; Tue, 09 Feb 2021 14:03:48 +0000
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
	bh=M3aBlIg3/bnVMULC4dyTeqPoVq7ecTLMRgUB7dNf9ek=; b=ejIS6e4oQC54cFTur5nxVYrXdW
	DcfjHzxmsZPpt6096cD87s0UHuhyJPvxHTJ5CpXbT66EBrOf9HmjoukpG81hurawwl4YfMakprHnH
	X2LBAhPUEEzJtqstCdY8lPvYgMSWD0+b6NW8slOfFCb69uZ/2Hde/nGgkKTzRswqKFSM=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24610.38467.808678.941320@mariner.uk.xensource.com>
Date: Tue, 9 Feb 2021 14:03:47 +0000
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
    Julien Grall <julien@xen.org>,
    lucmiccio@gmail.com,
    xen-devel@lists.xenproject.org,
    Bertrand.Marquis@arm.com,
    Volodymyr_Babchuk@epam.com,
    Rahul.Singh@arm.com,
    Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: Re: [PATCH v2] xen/arm: fix gnttab_need_iommu_mapping
In-Reply-To: <4df687cb-d3bc-ccb8-4e7c-a6429c37574e@suse.com>
References: <20210208184932.23468-1-sstabellini@kernel.org>
	<173ed75a-94cf-26a5-9271-a687bf201578@xen.org>
	<alpine.DEB.2.21.2102081214010.8948@sstabellini-ThinkPad-T480s>
	<4df687cb-d3bc-ccb8-4e7c-a6429c37574e@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Jan Beulich writes ("Re: [PATCH v2] xen/arm: fix gnttab_need_iommu_mapping"):
> On 08.02.2021 21:24, Stefano Stabellini wrote:
...
> > For these cases, I would just follow a simple rule of thumb:
> > - is the submitter willing to provide the backport?
> > - is the backport low-risk?
> > - is the underlying bug important?
> > 
> > If the answer to all is "yes" then I'd go with it.
> 
> Personally I disagree, for the very simple reason of the question
> going to become "Where do we draw the line?" The only non-security
> backports that I consider acceptable are low-risk changes to allow
> building with newer tool chains. I know other backports have
> occurred in the past, and I did voice my disagreement with this
> having happened.

I think I take a more relaxed view than Jan, but still a much more
firm line than Stefano.  My opinion is that we should make exceptions
for only bugs of exceptional severity.

I don't think I have seen an argument that this bug is exceptionally
severe.

For me the fact that you can only experience this bug if you upgrade
the hardware or significantly change the configuration, means that
this isn't so serious a bug.

The downside of accepting this backport is not only the slippery
slope.  It is also shipping the risk of a mistake in it to people who
are using 4.12 and expect it to remain almost unchanged.

The alternative, which I think is reasonable, is to ask people who are
substantially changing their hardware and/or configuration, to also
upgrade to a newer hypervisor.  I don't see that this would be a
significant imposition, but maybe I am missing some reason why
upgrading to a newer hypervisor would add a lot of difficulty to an
upgrade which is already significant in other ways.

(I definitely agree with Jan that backports to fix build problems with
newer tools are serious because they are so blocking, so will
generally need an exception to the "security fixes only" rule.)

> But this is a community decision, so my opinion counts as just a
> single vote.

I think on this particular patch, with the information I have so far,
I am with Jan and Julien.

Thanks,
Ian.

