Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE7B8196BA
	for <lists+xen-devel@lfdr.de>; Wed, 20 Dec 2023 03:12:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.657320.1026136 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFm3x-00016c-L1; Wed, 20 Dec 2023 02:11:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 657320.1026136; Wed, 20 Dec 2023 02:11:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFm3x-00013z-Hx; Wed, 20 Dec 2023 02:11:57 +0000
Received: by outflank-mailman (input) for mailman id 657320;
 Wed, 20 Dec 2023 02:11:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wrkk=H7=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rFm3w-00013p-Tl
 for xen-devel@lists.xenproject.org; Wed, 20 Dec 2023 02:11:56 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org
 [2604:1380:40e1:4800::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2460cc37-9edd-11ee-9b0f-b553b5be7939;
 Wed, 20 Dec 2023 03:11:54 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id A7F32CE1B27;
 Wed, 20 Dec 2023 02:11:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7161DC433C7;
 Wed, 20 Dec 2023 02:11:47 +0000 (UTC)
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
X-Inumbo-ID: 2460cc37-9edd-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703038308;
	bh=CDAoeTZ2V4Z1F0/BwOXViUT5SJWB2/1q3/PUmSYvTa4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Rd/b19bEA2baZeGS9sK7YB98+DJqyKs0Ui5Ur2J1YgnXZqtwev4Fu689pABCzAZWQ
	 ZEuhjj8DjZMJQW8h6T5B5gr0KYRPZHja01oG19wIbbiYyiZc5Qp5l6Lu5EYYhvfQrQ
	 EqFrW0fHOAh2zzrkq2UoDJT96CLPsoUvr/PjVgYG6JKmTvpjKsHQdfWq+kywsuBkI8
	 epPT1fLzz+Y0YfVB0oSLN6UyB99WeY9YaB4XnVXJvH2BAYY91CwEay6hyW+6NARpIy
	 okyoPT58Ug6TrwhlyqSh09Dxv06ZfR2GwcA3+sFXTp7sg3iuEW6ijvizKve5r9kDuO
	 XknAXxjgDieYg==
Date: Tue, 19 Dec 2023 18:11:45 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Stewart Hildebrand <stewart.hildebrand@amd.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Kevin Tian <kevin.tian@intel.com>
Subject: Re: [PATCH v11 02/17] pci: introduce per-domain PCI rwlock
In-Reply-To: <20231202012556.2012281-3-volodymyr_babchuk@epam.com>
Message-ID: <alpine.DEB.2.22.394.2312191811370.3175268@ubuntu-linux-20-04-desktop>
References: <20231202012556.2012281-1-volodymyr_babchuk@epam.com> <20231202012556.2012281-3-volodymyr_babchuk@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1668302398-1703038308=:3175268"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1668302398-1703038308=:3175268
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Sat, 2 Dec 2023, Volodymyr Babchuk wrote:
> Add per-domain d->pci_lock that protects access to
> d->pdev_list. Purpose of this lock is to give guarantees to VPCI code
> that underlying pdev will not disappear under feet. This is a rw-lock,
> but this patch adds only write_lock()s. There will be read_lock()
> users in the next patches.
> 
> This lock should be taken in write mode every time d->pdev_list is
> altered. All write accesses also should be protected by pcidevs_lock()
> as well. Idea is that any user that wants read access to the list or
> to the devices stored in the list should use either this new
> d->pci_lock or old pcidevs_lock(). Usage of any of this two locks will
> ensure only that pdev of interest will not disappear from under feet
> and that the pdev still will be assigned to the same domain. Of
> course, any new users should use pcidevs_lock() when it is
> appropriate (e.g. when accessing any other state that is protected by
> the said lock). In case both the newly introduced per-domain rwlock
> and the pcidevs lock is taken, the latter must be acquired first.
> 
> Suggested-by: Roger Pau Monné <roger.pau@citrix.com>
> Suggested-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>
--8323329-1668302398-1703038308=:3175268--

