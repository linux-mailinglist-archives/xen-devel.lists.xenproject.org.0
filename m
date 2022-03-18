Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C90D44DE3F4
	for <lists+xen-devel@lfdr.de>; Fri, 18 Mar 2022 23:20:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.292261.496422 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nVKxT-0008Rv-3B; Fri, 18 Mar 2022 22:20:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 292261.496422; Fri, 18 Mar 2022 22:20:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nVKxS-0008Q6-W5; Fri, 18 Mar 2022 22:20:30 +0000
Received: by outflank-mailman (input) for mailman id 292261;
 Fri, 18 Mar 2022 22:20:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3xU5=T5=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nVKxR-0008Q0-W7
 for xen-devel@lists.xenproject.org; Fri, 18 Mar 2022 22:20:29 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9d4539a7-a709-11ec-8fbc-03012f2f19d4;
 Fri, 18 Mar 2022 23:20:28 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 16DBB61452;
 Fri, 18 Mar 2022 22:20:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D3B7C340E8;
 Fri, 18 Mar 2022 22:20:25 +0000 (UTC)
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
X-Inumbo-ID: 9d4539a7-a709-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1647642026;
	bh=MofUkYPYGPhJeFIKBWb5e6TTNkoPdXXReRJqkgP7j5Y=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=NczvIpMWSdgUUdyTkiNGkpfmsbnaUkKkg+mZjjhvTpwXZXCHet83lHkkVgEI0cs5c
	 A1ojCZ0sEAP/jXuIU9TD6NaUwXtYoTdYzw0QheQsrp4XiyEIinM8XOOhp1f8vJsF40
	 Oin1vXNDXeyOA6hbTm4YmSrU2Wg9qhIURwTK0E2sachnjQpdwuMaDaZRrs7xtA/fnI
	 3vUjdF7p903veb83nySlg7mAOcC4Swt5YJzCmD4P7IrioR8JwcJmHS/T4EcCMr/u7+
	 2PNhArLK8iFlLWpGUSMWr5ADdd+u/AP78SkgL0tXVaPCs5Gl69vOIynT16gx4UhTrm
	 nYOLCBQzxfpfg==
Date: Fri, 18 Mar 2022 15:20:25 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Penny Zheng <Penny.Zheng@arm.com>, nd@arm.com, 
    Penny Zheng <penzhe01@a011292.shanghai.arm.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH v1 02/13] xen/arm: introduce a special domain
 DOMID_SHARED
In-Reply-To: <eefa9cf2-a04c-ba8d-74cb-0d2aaa35badb@suse.com>
Message-ID: <alpine.DEB.2.22.394.2203181504140.2910984@ubuntu-linux-20-04-desktop>
References: <20220311061123.1883189-1-Penny.Zheng@arm.com> <20220311061123.1883189-3-Penny.Zheng@arm.com> <eefa9cf2-a04c-ba8d-74cb-0d2aaa35badb@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 18 Mar 2022, Jan Beulich wrote:
> Further (there's no particularly good place to mention this) I'm
> afraid I don't view "shared" as a good name: It's not the domain
> which is shared, but it's the domain to hold shared memory.

To be honest I thought the same thing when reading this patch but
couldn't easily come up with a better name.


> For this
> my first consideration would be to see whether an existing special
> domain can be re-used; after all the set of reserved domain IDs is
> a very limited one, and hence each value taken from there should come
> with a very good reason. We did such re-use e.g. when introducing
> quarantining for PCI devices, by associating them with DOM_IO rather
> than inventing a new DOM_QUARANTINE. If there are good reasons
> speaking against such re-use, then I'd like to ask to consider e.g.
> DOMID_SHM / DOMID_SHMEM plus associated predicate.

From my point of view is totally fine to reuse one of the existing
special domains if we can.

DOMID_IO seems to be the closest match but its current definition
doesn't cover what Penny is trying to achieve. I am happy to change its
definition and make it wider to support this use-case too.

It is not trivial to come up with an appropriate description though. I
took a stab at it but I couldn't come up with anything better:

 * DOMID_IO is used for mapping memory and MMIO regions when no explicit
 * Domain need to be specified.
 *
 * For instance, DOMID_IO is the owner of memory pre-shared among
 * multiple domains at boot time, when no explicit owner is specified.
 *
 * Also, DOMID_IO is used to restrict page-table updates to mapping I/O
 * memory. Although no Foreign Domain need be specified to map I/O
 * pages, DOMID_IO is useful to ensure that no mappings to the OS's own
 * heap are accidentally installed. (e.g., in Linux this could cause
 * havoc as reference counts aren't adjusted on the I/O-mapping code
 * path). This only makes sense as HYPERVISOR_mmu_update()'s and
 * HYPERVISOR_update_va_mapping_otherdomain()'s "foreigndom" argument.
 * For HYPERVISOR_mmu_update() context it can be specified by any
 * calling domain, otherwise it's only permitted if the caller is
 * privileged.

