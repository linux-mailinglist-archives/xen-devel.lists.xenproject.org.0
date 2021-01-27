Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31BA0306009
	for <lists+xen-devel@lfdr.de>; Wed, 27 Jan 2021 16:47:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.76187.137367 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4n2Q-0003Pn-AI; Wed, 27 Jan 2021 15:47:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 76187.137367; Wed, 27 Jan 2021 15:47:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4n2Q-0003PN-6y; Wed, 27 Jan 2021 15:47:22 +0000
Received: by outflank-mailman (input) for mailman id 76187;
 Wed, 27 Jan 2021 15:47:21 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l4n2P-0003PH-D5
 for xen-devel@lists.xenproject.org; Wed, 27 Jan 2021 15:47:21 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l4n2P-0000j5-BT
 for xen-devel@lists.xenproject.org; Wed, 27 Jan 2021 15:47:21 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l4n2P-0001wC-A7
 for xen-devel@lists.xenproject.org; Wed, 27 Jan 2021 15:47:21 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1l4n2L-0001dX-RD; Wed, 27 Jan 2021 15:47:17 +0000
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
	bh=IPvCwETlJDhCC6XWOP0LjvhYEJfszVQBN8B+fKSW7i8=; b=URIZUpxMX/ITKDTCibd5fzQAuI
	0B+Oeu5hl1pAeraQgsIBtkGZRZSuljqp+qOCHOXcs0npOYG6Q1RrDbt4OcKax677rfdYaRieG63CD
	8lYTUz1Y2JuOCRgD7IImwRr5UU2sfEWWYXTJoBXFQe0b+sqqbCtz4nWDiV2vS/NcHAX8=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24593.35589.568338.759560@mariner.uk.xensource.com>
Date: Wed, 27 Jan 2021 15:47:17 +0000
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel\@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
    Ian Jackson <iwj@xenproject.org>,
    Wei Liu <wl@xen.org>,
    Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] xenstored: fix build on libc without O_CLOEXEC
In-Reply-To: <a5af8c21-f12d-d9a0-1751-90e5e8e0902e@suse.com>
References: <a5af8c21-f12d-d9a0-1751-90e5e8e0902e@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Jan Beulich writes ("[PATCH] xenstored: fix build on libc without O_CLOEXEC"):
> The call to lu_read_state() would remain unresolved in this case. Frame
> the construct by a suitable #ifdef, and while at it also frame command
> line handling related pieces similarly.
> 
> Fixes: 9777fa6b6ea0 ("tools/xenstore: evaluate the live update flag when starting")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Ian Jackson <ian.jackson@eu.citrix.com>

Personally my preference would have been to retain the command line
option parsing and have it bomb out with an error message here:

> +#ifndef NO_LIVE_UPDATE
>  	/* Read state in case of live update. */
>  	if (live_update)
>  		lu_read_state();
> +#endif

But you have written the patch and what you have done is reasonable.

Thanks,
Ian.

