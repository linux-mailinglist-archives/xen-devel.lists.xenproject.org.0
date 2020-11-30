Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DB192C905E
	for <lists+xen-devel@lfdr.de>; Mon, 30 Nov 2020 22:58:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.41487.74668 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kjrBN-0006FR-UN; Mon, 30 Nov 2020 21:58:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 41487.74668; Mon, 30 Nov 2020 21:58:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kjrBN-0006F2-R0; Mon, 30 Nov 2020 21:58:05 +0000
Received: by outflank-mailman (input) for mailman id 41487;
 Mon, 30 Nov 2020 21:58:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qs/p=FE=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kjrBM-0006Ex-Ae
 for xen-devel@lists.xenproject.org; Mon, 30 Nov 2020 21:58:04 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1fd5c1fc-875d-4fe3-ac41-4d227b580585;
 Mon, 30 Nov 2020 21:58:03 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net
 [24.130.65.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 27DF92084C;
 Mon, 30 Nov 2020 21:58:02 +0000 (UTC)
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
X-Inumbo-ID: 1fd5c1fc-875d-4fe3-ac41-4d227b580585
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1606773482;
	bh=6gAQm7UPZej/TlUFIJ+RG2HvFpxnuc65fvjVOTR5uHk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=xEza86sRYW8/X3PV1MLwxoHDVR3BqQpZDbxy3tuISn2fk7IWYRX8LAtBVE+KWx3jb
	 xgSwQKKLfzcVVg12VXAoQWHDcQimTe5+Yz4MKc8hopZczMpIOVZDK1mo7ngF37WlpZ
	 Z/g9Lf+gO6bV0krIXUZRPbABFpzwIdld2id8cC9E=
Date: Mon, 30 Nov 2020 13:58:01 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Stefano Stabellini <stefano.stabellini@xilinx.com>, 
    Julien Grall <jgrall@amazon.com>
Subject: Re: [PATCH RFC 1/6] xen/arm: mm: Remove special case for CPU0 in
 dump_hyp_walk()
In-Reply-To: <3a783a3d-4c4d-f107-1583-16f04fe76ae0@xen.org>
Message-ID: <alpine.DEB.2.21.2011301357530.1100@sstabellini-ThinkPad-T480s>
References: <20201119190751.22345-1-julien@xen.org> <20201119190751.22345-2-julien@xen.org> <3a783a3d-4c4d-f107-1583-16f04fe76ae0@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 28 Nov 2020, Julien Grall wrote:
> On 19/11/2020 19:07, Julien Grall wrote:
> > From: Stefano Stabellini <sstabellini@kernel.org>
> > 
> > There is no need to have a special case for CPU0 when converting the
> > page-table virtual address into a physical address. The helper
> > virt_to_maddr() is able to translate any address as long as the root
> > page-tables is mapped in the virtual address. This is the case for all
> > the CPUs at the moment.
> > 
> > So use the same BUG_ON() regardless the CPU.
> > 
> > Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> > [julien: Rework the commit message]
> > Signed-off-by: Julien Grall <jgrall@amazon.com>
> > 
> > ---
> > 
> > I went back through the conversation in [1] regarding the issue when
> > loading Xen below 2MB on Arm32. The example provided is wrong because to
> > find the physical address, we need to add 'phys_offset', not substract.
> > 
> > So I removed the comment regarding the code was buggy.
> > 
> > [1] https://marc.info/?l=xen-devel&m=157081398022401
> 
> Stefano, can you confirm that you are happy with the new commit message?

Yes, that's OK

