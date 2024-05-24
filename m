Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB1908CEC7D
	for <lists+xen-devel@lfdr.de>; Sat, 25 May 2024 00:51:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.729953.1135292 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAdl6-000363-RX; Fri, 24 May 2024 22:51:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 729953.1135292; Fri, 24 May 2024 22:51:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAdl6-00034W-OB; Fri, 24 May 2024 22:51:32 +0000
Received: by outflank-mailman (input) for mailman id 729953;
 Fri, 24 May 2024 22:51:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K6bJ=M3=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sAdl5-00031k-4F
 for xen-devel@lists.xenproject.org; Fri, 24 May 2024 22:51:31 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 28c4ce51-1a20-11ef-90a1-e314d9c70b13;
 Sat, 25 May 2024 00:51:30 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5AFC861255;
 Fri, 24 May 2024 22:51:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D348C2BBFC;
 Fri, 24 May 2024 22:51:28 +0000 (UTC)
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
X-Inumbo-ID: 28c4ce51-1a20-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716591089;
	bh=XAwoBH/hq9BnOLuTHwhew6AJ+pucCPFCnbPge3mmXEA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=CL2boOtXt92MYSilm58eCafWmfnZqQIRmdlYqhIb85rNa6ufsX/V7YmefsUGlBfQ3
	 etEuczF4mGwABDWsqKNfIL2iMw1RaYeF82Jt/rqCBV7E8sYad9mkbtuKuihBxXt0ce
	 kFzoWO4ZmvHwRXW6bOFrhOGaORXW6RYHh5TzLd8blNRe/snv6Bs9uaaiq9Na2vIf6L
	 ikElAxEiIMKx/noCC7Z/CiE724BGwLjnre59NtKkoYmdUscaU05vCOGXHyqZskQ4oM
	 IjbFUAfTwmJAZAvYrRSN2cUDQBAVbB6rZ2tsDCyK/qNjIb6u+jZP0sh9QdX+igTJrl
	 uDnoCCM/dvQqw==
Date: Fri, 24 May 2024 15:51:27 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jason Andryuk <jason.andryuk@amd.com>
cc: Henry Wang <xin.wang2@amd.com>, xen-devel@lists.xenproject.org, 
    Anthony PERARD <anthony@xenproject.org>, 
    Alec Kwapis <alec.kwapis@medtronic.com>
Subject: Re: [PATCH v3 3/4] tools/init-dom0less: Avoid hardcoding
 GUEST_MAGIC_BASE
In-Reply-To: <46e1d5f3-20e5-47ea-a1cd-10d120211f0d@amd.com>
Message-ID: <alpine.DEB.2.22.394.2405241551220.2557291@ubuntu-linux-20-04-desktop>
References: <20240517032156.1490515-1-xin.wang2@amd.com> <20240517032156.1490515-4-xin.wang2@amd.com> <46e1d5f3-20e5-47ea-a1cd-10d120211f0d@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 20 May 2024, Jason Andryuk wrote:
> On 2024-05-16 23:21, Henry Wang wrote:
> > Currently the GUEST_MAGIC_BASE in the init-dom0less application is
> > hardcoded, which will lead to failures for 1:1 direct-mapped Dom0less
> > DomUs.
> > 
> > Since the guest magic region allocation from init-dom0less is for
> > XenStore, and the XenStore page is now allocated from the hypervisor,
> > instead of hardcoding the guest magic pages region, use
> > xc_hvm_param_get() to get the XenStore page PFN. Rename alloc_xs_page()
> > to get_xs_page() to reflect the changes.
> > 
> > With this change, some existing code is not needed anymore, including:
> > (1) The definition of the XenStore page offset.
> > (2) Call to xc_domain_setmaxmem() and xc_clear_domain_page() as we
> >      don't need to set the max mem and clear the page anymore.
> > (3) Foreign mapping of the XenStore page, setting of XenStore interface
> >      status and HVM_PARAM_STORE_PFN from init-dom0less, as they are set
> >      by the hypervisor.
> > 
> > Take the opportunity to do some coding style improvements when possible.
> > 
> > Reported-by: Alec Kwapis <alec.kwapis@medtronic.com>
> > Signed-off-by: Henry Wang <xin.wang2@amd.com>
> 
> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

