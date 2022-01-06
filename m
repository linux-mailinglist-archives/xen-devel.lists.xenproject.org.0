Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9DA6485D51
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jan 2022 01:41:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.253807.435076 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5Gpq-0002B9-Mj; Thu, 06 Jan 2022 00:40:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 253807.435076; Thu, 06 Jan 2022 00:40:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5Gpq-00027s-Il; Thu, 06 Jan 2022 00:40:54 +0000
Received: by outflank-mailman (input) for mailman id 253807;
 Thu, 06 Jan 2022 00:40:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AmKD=RW=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1n5Gpp-0001p9-4g
 for xen-devel@lists.xenproject.org; Thu, 06 Jan 2022 00:40:53 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4ccd6018-6e89-11ec-81c0-a30af7de8005;
 Thu, 06 Jan 2022 01:40:52 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id AC03EB81E5A;
 Thu,  6 Jan 2022 00:40:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17263C36AE9;
 Thu,  6 Jan 2022 00:40:50 +0000 (UTC)
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
X-Inumbo-ID: 4ccd6018-6e89-11ec-81c0-a30af7de8005
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1641429650;
	bh=TJlmdCjdsyign0otVauoV0SOfyP1WtV8Z3hc7fqeDak=;
	h=Date:From:To:cc:Subject:From;
	b=duLBYh1cmMn+GKAtwzf/rqFAxcklkJCDYqtzcudHScbBnqzhkLjhhyUKB535FNmHS
	 uBOU8fVciFLu8GcuKAYtFA8BLRKzA2ofZ4+U751Z/mauZZb0ErUJgNxCwiX0OkJ/bi
	 pkQeEncKPUsa5BnWb7GrrgAdbIfHkSq5OLbAZ2DVFJKV8AqeH3if3NCrQQJGiUqZ9R
	 ELKEhALbyXYL6MtW5UNs5m+/ZKaD1Aoxz6xPLMkH1EKjpgaS8kPYQf9k1wqVXq9tU2
	 F5X2pDTIJDRYDEvr+u+CtV2Pnh66cNSvd+ZkUPPWu9EWxgRdA256u9DN6zRj+IeDNC
	 37t3Fxfu/mu5A==
Date: Wed, 5 Jan 2022 16:40:49 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: jgross@suse.com, boris.ostrovsky@oracle.com
cc: sstabellini@kernel.org, julien@xen.org, bertrand.marquis@arm.com, 
    Volodymyr_Babchuk@epam.com, xen-devel@lists.xenproject.org
Subject: request for feedback on a Xen/Linux compatibility issue
Message-ID: <alpine.DEB.2.22.394.2112131729100.3376@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Hi all,

Today Xen dom0less guests are not "Xen aware": the hypervisor node
(compatible = "xen,xen") is missing from dom0less domUs device trees and
as a consequence Linux initializes as if Xen is not present. The reason
is that interfaces like grant table and xenstore (xenbus in Linux) don't
work correctly in a dom0less environment at the moment.

The good news is that I have patches for Xen to implement PV drivers
support for dom0less guests. They also add the hypervisor node to device
tree for dom0less guests so that Linux can discover the presence of Xen
and related interfaces.

When the Linux kernel is booting as dom0less kernel, it needs to delay
the xenbus initialization until the interface becomes ready. Attempts to
initialize xenbus straight away lead to failure, which is fine because
xenbus has never worked in Linux when running as dom0less guest up until
now. It is reasonable that a user needs a newer Linux to take advantage
of dom0less with PV drivers. So:

- old Xen + old/new Linux -> Xen not detected in Linux
- new Xen + old Linux     -> xenbus fails to initialize in Linux
- new Xen + new Linux     -> dom0less PV drivers working in Linux


The problem is that Linux until recently couldn't deal with any errors
in xenbus initialization. Instead of returning error and continuing
without xenbus, Linux would crash at boot.

I upstreamed two patches for Linux xenbus_probe to be able to deal with
initialization errors. With those two fixes, Linux can boot as a
dom0less kernel with the hypervisor node in device tree. The two fixes
got applied to master and were already backported to all the supported
Linux stable trees, so as of today:

- dom0less with hypervisor node + Linux 5.16+           -> works
- dom0less with hypervisor node + stable Linux 5.10     -> works
- dom0less with hypervisor node + unpatched Linux 5.10  -> crashes


Is this good enough? Or for Xen/Linux compatibility we want to also be
able to boot vanilla unpatched Linux 5.10 as dom0less kernel? If so,
the simplest solution is to change compatible string for the hypervisor
node, so that old Linux wouldn't recognize Xen presence and wouldn't try
to initialize xenbus (so it wouldn't crash on failure). New Linux can of
course learn to recognize both the old and the new compatible strings.
(For instance it could be compatible = "xen,xen-v2".) I have prototyped
and tested this solution successfully but I am not convinced it is the
right way to go.

Do you have any suggestion or feedback?

The Linux crash on xenbus initialization failure is a Linux bug, not a
Xen issue. For this reason, I am tempted to say that we shouldn't change
compatible string to work-around a Linux bug, especially given that the
Linux stable trees are already all fixed.

Cheers,

Stefano

