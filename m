Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 778205B100D
	for <lists+xen-devel@lfdr.de>; Thu,  8 Sep 2022 00:56:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.402349.644261 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oW3xS-0003lW-0U; Wed, 07 Sep 2022 22:55:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 402349.644261; Wed, 07 Sep 2022 22:55:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oW3xR-0003jI-TL; Wed, 07 Sep 2022 22:55:45 +0000
Received: by outflank-mailman (input) for mailman id 402349;
 Wed, 07 Sep 2022 22:55:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=b9Or=ZK=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1oW3xP-0003jC-MO
 for xen-devel@lists.xenproject.org; Wed, 07 Sep 2022 22:55:43 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 31fc8cd9-2f00-11ed-a016-b9edf5238543;
 Thu, 08 Sep 2022 00:55:41 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9B3A661AFA;
 Wed,  7 Sep 2022 22:55:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF266C433C1;
 Wed,  7 Sep 2022 22:55:37 +0000 (UTC)
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
X-Inumbo-ID: 31fc8cd9-2f00-11ed-a016-b9edf5238543
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662591339;
	bh=xJI7MKALxBULf8g608wz6nLt8ppaK80oF0WwRJgfDOQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ECP3cEmsb7KEMTsus9+2dXe6niSouifTXLEb4dBwH7nUiR0bqP9LtS+UeypOlMzK6
	 I9bdkm9sHG0CI4Y+KZbEst944nL+eZwfqFqDyIko0LK9ZLfgC8Ek80cugHMQ8j+b5+
	 CqwOXoC+gCqnW/nCE83u2IGnMGCidj845CD7D8o1cABprLIF4z1y/v3gW36rPqdac0
	 BMZJT/Q7/msunVIZE07VxoQhsvWnXVmMeWOw9x+XKco86GmCV7ve8AbT9SYp401zbL
	 rqI2dokrpf1L2JI+pJdGoye3i5o0+j06uYP/Z0a8NmCrwwM2xaftR6xGbE/rhJguJk
	 CrqSLLAnQp7Ng==
Date: Wed, 7 Sep 2022 15:55:36 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Jan Beulich <jbeulich@suse.com>, Rahul Singh <rahul.singh@arm.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH v4 2/2] xen/pci: replace call to is_memory_hole to
 pci_check_bar
In-Reply-To: <11fed186-7295-00b0-4fb9-50d08e63f364@xen.org>
Message-ID: <alpine.DEB.2.22.394.2209071552080.157835@ubuntu-linux-20-04-desktop>
References: <cover.1662548825.git.rahul.singh@arm.com> <d1db7461eb4ae3f9423814877c5ab6d946dae4e7.1662548825.git.rahul.singh@arm.com> <a7576b0c-2134-1778-7751-375cd4c02554@suse.com> <11fed186-7295-00b0-4fb9-50d08e63f364@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 7 Sep 2022, Julien Grall wrote:
> Hi Jan,
> 
> On 07/09/2022 13:06, Jan Beulich wrote:
> > On 07.09.2022 13:09, Rahul Singh wrote:
> > > is_memory_hole was implemented for x86 and not for ARM when introduced.
> > > Replace is_memory_hole call to pci_check_bar as function should check
> > > if device BAR is in defined memory range. Also, add an implementation
> > > for ARM which is required for PCI passthrough.
> > > 
> > > On x86, pci_check_bar will call is_memory_hole which will check if BAR
> > > is not overlapping with any memory region defined in the memory map.
> > > 
> > > On ARM, pci_check_bar will go through the host bridge ranges and check
> > > if the BAR is in the range of defined ranges.
> > > 
> > > Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> > > ---
> > > Changes in v4:
> > >   - check "s <= e" before callback
> > >   - Add TODO comment for revisiting the function pci_check_bar() when
> > >     ACPI PCI passthrough support is added.
> > >   - Not Added the Jan Acked-by as patch is modified.
> > 
> > Hmm, I don't see any change to the parts the ack covers (x86 and common),
> > so please re-instate. I'm not in the position to ack Arm changes; things
> > would be different for a Reviewed-by without scope restriction.
> 
> I would like the question about the BAR alignment to be resolved before giving
> my Reviewed-by/Acked-by here.
> 
> Hopefully Stefano can clarify it.

We had a discussion this morning and this is the summary.

BAR addresses and Root Complex window addresses are not guaranteed to be
page aligned.

If they are not guaranteed to be page aligned we should check for
alignment, however, this is not the right location for the alignment
check. It is a good idea to add a TODO comment in the code.

So that we don't relax the check in case the addresses are not aligned,
we should drop the use of PFN_UP and PFN_DOWN in this check. 

