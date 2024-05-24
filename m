Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCD3E8CECAC
	for <lists+xen-devel@lfdr.de>; Sat, 25 May 2024 01:20:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.730039.1135414 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAeCU-0006Jb-Tv; Fri, 24 May 2024 23:19:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 730039.1135414; Fri, 24 May 2024 23:19:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAeCU-0006Hs-PM; Fri, 24 May 2024 23:19:50 +0000
Received: by outflank-mailman (input) for mailman id 730039;
 Fri, 24 May 2024 23:19:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K6bJ=M3=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sAeCT-0006Hm-T0
 for xen-devel@lists.xenproject.org; Fri, 24 May 2024 23:19:49 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1cae37b9-1a24-11ef-90a1-e314d9c70b13;
 Sat, 25 May 2024 01:19:48 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B5232632A9;
 Fri, 24 May 2024 23:19:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A089BC2BBFC;
 Fri, 24 May 2024 23:19:44 +0000 (UTC)
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
X-Inumbo-ID: 1cae37b9-1a24-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716592786;
	bh=Y8RlXmRX4MU9EfvBRdC6XMdY2PMPSUSBAEST/7avcQs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=hMqGlYsPPCBOeqK6QvmrA2nq5vdENKDlK9opW7YtOBKLcNyRN4sj81JHygv7KuG98
	 t8A6FzpxfOTYTL3AezGMBehsGF0vJJoIVwtqmE7YJFrqBeUPKyNqGMWZV+k5vlnwwf
	 JVmz3u0m4gu0wJdhQb3uSYXe8HT/lv++prYKIJikqtC+xljbsTGMSMCLJD7VzrsV3Z
	 XpQDXg3gmi/DYqmBU26KWPCxgEVE/6a5R7mRsJkWcJRj2sFZI7mdZCXsUz8ugjg5ng
	 Oos5KsBz/mSENwbpPswdE05vwaV6E+duUJwvDBSLpwj0j1TMv/ROjJhqXQuqKoo59E
	 mlHccUCl5Dd8Q==
Date: Fri, 24 May 2024 16:19:43 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: =?UTF-8?Q?J=C3=BCrgen_Gro=C3=9F?= <jgross@suse.com>
cc: Julien Grall <julien@xen.org>, Henry Wang <xin.wang2@amd.com>, 
    xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Alec Kwapis <alec.kwapis@medtronic.com>, 
    "Daniel P . Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH v3 2/4] xen/arm: Alloc XenStore page for Dom0less DomUs
 from hypervisor
In-Reply-To: <d3aca96b-2b6b-4bb8-99bf-7c0ede4c94fe@suse.com>
Message-ID: <alpine.DEB.2.22.394.2405241614370.2557291@ubuntu-linux-20-04-desktop>
References: <20240517032156.1490515-1-xin.wang2@amd.com> <20240517032156.1490515-3-xin.wang2@amd.com> <cf0a096a-0fe8-4d91-a064-910bd6c43951@xen.org> <d3aca96b-2b6b-4bb8-99bf-7c0ede4c94fe@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-2138729461-1716592786=:2557291"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-2138729461-1716592786=:2557291
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Fri, 24 May 2024, Jürgen Groß wrote:
> On 24.05.24 15:58, Julien Grall wrote:
> > Hi Henry,
> > 
> > + Juergen as the Xenstore maintainers. I'd like his opinion on the approach.
> > The documentation of the new logic is in:
> > 
> > https://lore.kernel.org/xen-devel/20240517032156.1490515-5-xin.wang2@amd.com/
> > 
> > FWIW I am happy in principle with the logic (this is what we discussed on
> > the call last week). Some comments below.
> 
> I'm not against this logic, but I'm wondering why it needs to be so
> complicated.

Actually the reason I like it is that in my view, this is the simplest
approach. You allocate a domain, you also allocate the xenstore page
together with it. Initially the xenstore connection has an
"uninitialized" state, as it should be. That's it. At some point, when
xenstored is ready, the state changes to CONNECTED.


> Can't the domU itself allocate the Xenstore page from its RAM pages,
> write the PFN into the Xenstore grant tab entry, and then make it
> public via setting HVM_PARAM_STORE_PFN?

This is not simpler in my view


> The init-dom0less application could then check HVM_PARAM_STORE_PFN
> being set and call XS_introduce_domain.
> 
> Note that at least C-xenstored does not need the PFN of the Xenstore
> page, as it is just using GNTTAB_RESERVED_XENSTORE for mapping the
> page.
--8323329-2138729461-1716592786=:2557291--

