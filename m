Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CF56B56244
	for <lists+xen-devel@lfdr.de>; Sat, 13 Sep 2025 18:48:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1123395.1466442 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uxTPP-0006k8-N5; Sat, 13 Sep 2025 16:47:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1123395.1466442; Sat, 13 Sep 2025 16:47:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uxTPP-0006hl-HP; Sat, 13 Sep 2025 16:47:31 +0000
Received: by outflank-mailman (input) for mailman id 1123395;
 Sat, 13 Sep 2025 16:47:30 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@xen.org>) id 1uxTPO-0006hf-Ce
 for xen-devel@lists.xenproject.org; Sat, 13 Sep 2025 16:47:30 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1uxTPN-0087u3-0o;
 Sat, 13 Sep 2025 16:47:29 +0000
Received: from [19.12.91.86] (helo=localhost)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1uxTPN-007JXH-0G;
 Sat, 13 Sep 2025 16:47:28 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID
	:Subject:Cc:To:Date:From; bh=nk+a4Zm09MRHh8ilMQeOdDzCAbcGfTh80Z4xo3A5uLk=; b=
	eaxup+O+P6saiitEUPvYJ9b3eDU1yuYNV9rsiDfLlZGeKqlYkVFUvuvGOjifrZKIVDkObnHsko1fJ
	NpnROrJQmADGyjp9tyCC5BJEjpPrKdMbGUuxCC0ZVYGrIbxO1zrBhRM/rayE7w2KtBJwnhM7/pw5B
	41l3671s2c8uV6jig=;
From: dmukhin@xen.org
Date: Sat, 13 Sep 2025 09:47:27 -0700
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] xen/domctl: Fix double domid_free in
 XEN_DOMCTL_createdomain error path
Message-ID: <aMWgH8YpGmgjZqy3@kraken>
References: <37561a9a3b6000502bb1a43651f6ddc49cd9149c.1757759941.git.oleksii_moisieiev@epam.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <37561a9a3b6000502bb1a43651f6ddc49cd9149c.1757759941.git.oleksii_moisieiev@epam.com>

On Sat, Sep 13, 2025 at 10:44:39AM +0000, Oleksii Moisieiev wrote:
> Remove redundant domid_free() call in the XEN_DOMCTL_createdomain error
> handling path to prevent a double-free condition.
> 
> When domain_create() fails, it internally calls _domain_destroy() during
> its cleanup routine, which already invokes domid_free() to release the
> allocated domain ID. The additional domid_free() call in the domctl error
> path creates a double-free scenario, triggering an assertion failure in
> domid.c:
> 
>     Assertion 'rc' failed at common/domid.c:84
> 
> The domain creation flow is:
> 1. domid_alloc() allocates a domain ID
> 2. domain_create() is called with the allocated ID
> 3. If domain_create() fails:
>    a) domain_create() calls _domain_destroy() internally
>    b) _domain_destroy() calls domid_free() to release the ID
>    c) domctl incorrectly calls domid_free() again
> 
> This double-free violates the domain ID management invariants and causes
> system instability. The fix ensures domid_free() is called exactly once
> per allocated domain ID, maintaining proper resource cleanup
> semantics.
> 
> Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>

Thanks a quick fix and sorry for the breakage.

--
Denis

