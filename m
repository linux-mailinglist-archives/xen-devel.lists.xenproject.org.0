Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 925A13EA368
	for <lists+xen-devel@lfdr.de>; Thu, 12 Aug 2021 13:22:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.166248.303565 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mE8lT-0002Zj-20; Thu, 12 Aug 2021 11:20:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 166248.303565; Thu, 12 Aug 2021 11:20:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mE8lS-0002Wn-V1; Thu, 12 Aug 2021 11:20:46 +0000
Received: by outflank-mailman (input) for mailman id 166248;
 Thu, 12 Aug 2021 11:20:45 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mE8lR-0002Wh-M9
 for xen-devel@lists.xenproject.org; Thu, 12 Aug 2021 11:20:45 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mE8lR-0004Hj-JQ
 for xen-devel@lists.xenproject.org; Thu, 12 Aug 2021 11:20:45 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mE8lR-0003IZ-IO
 for xen-devel@lists.xenproject.org; Thu, 12 Aug 2021 11:20:45 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mE8lG-0006l3-BG; Thu, 12 Aug 2021 12:20:34 +0100
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
	bh=l1SptzCkxZvIkTSkAep65X/cYJpY2C/9RPljtk21y7E=; b=vDNRTn7PLuVfyV9OHV6+gnzUrF
	jcs5hJS5YO/SpW7ScIBzwE4Zoro08/FzEn8bQvLhlOCBGtsyR1wYL76XTXDgwdl77NNAhgrwA/Bmc
	QEKvvl2RzimXg2pi9rO6RQje0m7Ux8y6aTOhQPlPjbXWCOHfZWOVAUV56awEUnXtfP/M=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24853.1026.39229.230658@mariner.uk.xensource.com>
Date: Thu, 12 Aug 2021 12:20:34 +0100
To: Jan Beulich <jbeulich@suse.com>
Cc: Jason Andryuk <jandryuk@gmail.com>,
    pdurrant@amazon.com,
    Wei Liu <wl@xen.org>,
    Anthony PERARD <anthony.perard@citrix.com>,
    Juergen Gross <jgross@suse.com>,
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2] libxl: Fix stubdom PCI passthrough
In-Reply-To: <30354256-4527-d909-8453-28dd384a35dc@suse.com>
References: <20210812005700.3159-1-jandryuk@gmail.com>
	<30354256-4527-d909-8453-28dd384a35dc@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Jan Beulich writes ("Re: [PATCH v2] libxl: Fix stubdom PCI passthrough"):
> On 12.08.2021 02:57, Jason Andryuk wrote:
> > commit 0fdb48ffe7a1 "libxl: Make sure devices added by pci-attach are
> > reflected in the config" broken stubdom PCI passthrough when it moved
> > libxl__create_pci_backend later in the function.  xl pci-attach for a
> > running PV domain may also have been broken, but that was not verified.
> > 
> > The stubdomain is running (!starting) and PV, so it calls
> > libxl__wait_for_backend.  With the new placement of
> > libxl__create_pci_backend, the path does not exist and the call
> > immediately fails.
> > libxl: error: libxl_device.c:1388:libxl__wait_for_backend: Backend /local/domain/0/backend/pci/43/0 does not exist
> > libxl: error: libxl_pci.c:1764:device_pci_add_done: Domain 42:libxl__device_pci_add failed for PCI device 0:2:0.0 (rc -3)
> > libxl: error: libxl_create.c:1857:domcreate_attach_devices: Domain 42:unable to add pci devices
> > 
> > The wait is only relevant when the backend is already present.  num_devs
> > is already used to determine if the backend needs to be created.  Re-use
> > num_devs to determine if the backend wait is necessary.  The wait is
> > necessary to avoid racing with another PCI attachment reconfiguring the
> > front/back. If we are creating the backend, then we don't have to worry
> > about a racing reconfigure.
> 
> And why is such a race possible in the first place? If two independent
> actions are permitted in parallel on a domain, wouldn't there better
> be synchronization closer to the root of the call tree?

libxl does not have a per-domain lock that would prevent this kind of
thing.  Individual operations that might malfunction if done
concurrently are supposed to take appropriate precautions.

I think that this patch is trying to be those precautions.  It's not
clear to me whether it's correct, though.  I (or another mailntainer)
will have to look at it properly...

Thanks,
Ian.

