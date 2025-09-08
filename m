Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA9C7B48DCE
	for <lists+xen-devel@lfdr.de>; Mon,  8 Sep 2025 14:40:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1115198.1461905 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvbAG-00068y-JD; Mon, 08 Sep 2025 12:40:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1115198.1461905; Mon, 08 Sep 2025 12:40:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvbAG-00066X-GE; Mon, 08 Sep 2025 12:40:08 +0000
Received: by outflank-mailman (input) for mailman id 1115198;
 Mon, 08 Sep 2025 12:40:06 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1uvbAE-00066R-OX
 for xen-devel@lists.xenproject.org; Mon, 08 Sep 2025 12:40:06 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1uvbAE-0004Oh-1Z;
 Mon, 08 Sep 2025 12:40:06 +0000
Received: from [2a01:cb15:80df:da00:e2a9:ff82:7bde:38cd] (helo=l14)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1uvbAE-000AqQ-1Q;
 Mon, 08 Sep 2025 12:40:06 +0000
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
	d=xenproject.org; s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date;
	bh=LKrQf42PX7PPTfH1KO/Y9I8QjeGk+y1kUYYQZKxEP0w=; b=0vlEO8y6HHLg6PKRaSaMxk84oG
	AYvnx8fdewIejU2VDBVyyoDDD/wIOkBnE3YYYFoufYBY8EfLbx+BErtk+3xJu9FfORsGKBg7vSGfo
	Xmp4HIKor55Y8NLcMBFSS8mCGXEcgEi6qCD5IJQf17RwKUzh7z8ZGXR2fPutMWHFRJrQ=;
Date: Mon, 8 Sep 2025 14:40:04 +0200
From: Anthony PERARD <anthony@xenproject.org>
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] libxl: preserve errno in libxl__xcinfo2xlinfo()
Message-ID: <aL7OpEaEFswuUbSQ@l14>
References: <e567c234-473d-40c3-86dc-53317812baf7@suse.com>
 <c4ce1651-3881-4af0-bfe4-294917c31c9d@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c4ce1651-3881-4af0-bfe4-294917c31c9d@amd.com>

On Wed, Aug 27, 2025 at 09:16:38PM -0400, Jason Andryuk wrote:
> On 2025-08-27 01:57, Jan Beulich wrote:
> > Callers observing errors elsewhere may be confused by the ENOSYS that
> > the Flask operation would yield on a Flask-disabled hypervisor.
> > 
> > Signed-off-by: Jan Beulich <jbeulich@suse.com>
> > ---
> > Of course I don't know whether clobbering errno is perhaps deemed "fine"
> > in libxl.
> 
> I wonder if it would be better to special case libxl_flask_sid_to_context()
> to preserve errno on ENOSYS.  flask returning ENOSYS is common, but
> libxl_flask_sid_to_context() can legitimately have error.

Well, errno=ENOSYS gives information about why
libxl_flask_sid_to_context() returns an error. 
They are multiple error code for returns libxl_*() functions but they
aren't really check. We often rely on errno to print an error message.
And in this case, libxl_flask_sid_to_context() doesn't event return a
proper libxl_error value.

> I guess this is fine if we want to use this approach:
> 
> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

Acked-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,

-- 
Anthony PERARD

