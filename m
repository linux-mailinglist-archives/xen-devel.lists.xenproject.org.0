Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D80737101C3
	for <lists+xen-devel@lfdr.de>; Thu, 25 May 2023 01:38:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.539247.839929 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1y3C-0007D0-Fy; Wed, 24 May 2023 23:37:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 539247.839929; Wed, 24 May 2023 23:37:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1y3C-0007B1-C4; Wed, 24 May 2023 23:37:50 +0000
Received: by outflank-mailman (input) for mailman id 539247;
 Wed, 24 May 2023 23:37:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hEuA=BN=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1q1y3A-0007Av-LS
 for xen-devel@lists.xenproject.org; Wed, 24 May 2023 23:37:48 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fc3c7283-fa8b-11ed-b230-6b7b168915f2;
 Thu, 25 May 2023 01:37:46 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4079C60A20;
 Wed, 24 May 2023 23:37:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F270BC433EF;
 Wed, 24 May 2023 23:37:43 +0000 (UTC)
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
X-Inumbo-ID: fc3c7283-fa8b-11ed-b230-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684971464;
	bh=6uKVCP+Qbgk4oPiNn1yhMJ0omp7uIoP9Abjj3g+v0yA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=QbO8uFfwcaRLr+/+sTj8tgSV/6oOglhFPWu6PynKT8WwXP6Lj0jTT/fm5zPfHQuRq
	 +hf/xXSSOATFx5esYPzwXM7IWKGWrM5NthxQ3gpzKqBYxlq7H8SpxWMDcpM1RMn4Q1
	 H18dturO1ekTAp3iu9VG2ca0YywjAcOY9rLA3qPJsRXiUz36t7cWaLx2fHFsmVRYSq
	 502on6+AFSZRfB/uSAMgGVG1aqhuydMXeR6WvbXqReOYfv44PGCg+Mu8NuNQ+9HFEK
	 f4sr+8Heo7ceRkyGWr6UjqgXA2t9bA/gG539vUMXSZvS4Mf9uNGV0rs9PXPuoEFyoq
	 WHK8epqseXAGw==
Date: Wed, 24 May 2023 16:37:42 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH RFC v2] vPCI: account for hidden devices
In-Reply-To: <614c5bf4-b273-7439-caf7-f6df0d90bf87@suse.com>
Message-ID: <alpine.DEB.2.22.394.2305241627290.44000@ubuntu-linux-20-04-desktop>
References: <7294a70c-0089-e375-bb5a-bf9544d4f251@suse.com> <ZG4dmJuzNVUE5UIY@Air-de-Roger> <614c5bf4-b273-7439-caf7-f6df0d90bf87@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 24 May 2023, Jan Beulich wrote:
> >> RFC: _setup_hwdom_pci_devices()' loop may want splitting: For
> >>      modify_bars() to consistently respect BARs of hidden devices while
> >>      setting up "normal" ones (i.e. to avoid as much as possible the
> >>      "continue" path introduced here), setting up of the former may want
> >>      doing first.
> > 
> > But BARs of hidden devices should be mapped into dom0 physmap?
> 
> Yes.

The BARs would be mapped read-only (not read-write), right? Otherwise we
let dom0 access devices that belong to Xen, which doesn't seem like a
good idea.

But even if we map the BARs read-only, what is the benefit of mapping
them to Dom0? If Dom0 loads a driver for it and the driver wants to
initialize the device, the driver will crash because the MMIO region is
read-only instead of read-write, right?

How does this device hiding work for dom0? How does dom0 know not to
access a device that is present on the PCI bus but is used by Xen?

The reason why I was suggesting to hide the device completely in the
past was that I assumed we had to hide the device (make it "disappear"
on the PCI bus) otherwise Dom0 would access it. Is there another way to
mark a PCI devices as "inaccessible" or "disabled"?

