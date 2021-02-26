Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45759326A33
	for <lists+xen-devel@lfdr.de>; Fri, 26 Feb 2021 23:49:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.90605.171567 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFluo-0006tm-P3; Fri, 26 Feb 2021 22:48:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 90605.171567; Fri, 26 Feb 2021 22:48:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFluo-0006tM-Kp; Fri, 26 Feb 2021 22:48:54 +0000
Received: by outflank-mailman (input) for mailman id 90605;
 Fri, 26 Feb 2021 22:48:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ECYH=H4=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1lFlum-0006t1-F9
 for xen-devel@lists.xenproject.org; Fri, 26 Feb 2021 22:48:52 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 305b196f-caa3-4da4-82a6-1074a6de6549;
 Fri, 26 Feb 2021 22:48:51 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E3C1A64EE2;
 Fri, 26 Feb 2021 22:48:50 +0000 (UTC)
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
X-Inumbo-ID: 305b196f-caa3-4da4-82a6-1074a6de6549
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1614379731;
	bh=iia1f0tQSqDCaikMDFO+Bo40Eak+IQuimn8f9AjXh4k=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=unCcIjUj2qlJaPAD12PHZj3xkY9KHIqKQOUfaz5Z+7z9bOcweBCtutTAZ9DjautGG
	 3I3I9Oxgc94tatSbjh3efUdz2ZyRaSDVjAmrtO6EJbbDOba+yrDKEUCPL40m4P17p0
	 OVcXSZxgfcHHTy1lrIFI5H/3KPUfw4L//OLmzrx8vZKQRtoIerxTqpySGc7YKMr3nD
	 shfqm8qPYhw5vZN5vD9+D0dXNuafQCPcqxykPxPNUVpa5slHDXujOokyLchmjEHrL1
	 o+vY2Xye8YfNmhMyT8KFO41Xo2fzFE8+og9BzGfFW0RxZfY8zD29oqqyPYMholPbX2
	 vSd8mDwID0GlA==
Date: Fri, 26 Feb 2021 14:48:50 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Xen-devel <xen-devel@lists.xenproject.org>, 
    Doug Goldstein <cardoe@cardoe.com>, Ian Jackson <iwj@xenproject.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, roger.pau@citrix.com
Subject: Re: [PATCH for-4.15] automation: Fix the Alpine clang builds to use
 clang
In-Reply-To: <20210226110233.27991-1-andrew.cooper3@citrix.com>
Message-ID: <alpine.DEB.2.21.2102261446490.3234@sstabellini-ThinkPad-T480s>
References: <20210226110233.27991-1-andrew.cooper3@citrix.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 26 Feb 2021, Andrew Cooper wrote:
> Looks like a copy&paste error.
> 
> Fixes: f6e1d8515d7 ("automation: add alpine linux x86 build jobs")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Thanks for the patch and of course it is correct

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


However unfortunately it breaks the Alpine Linux gitlab-ci again :-(
I created a branch with Roger's patches plus this patch. The two clang
Alpine Linux build jobs fail:

https://gitlab.com/xen-project/people/sstabellini/xen/-/jobs/1059686530
https://gitlab.com/xen-project/people/sstabellini/xen/-/jobs/1059686532


The error is the following:

<built-in>:3:10: fatal error: 'cstring' file not found
#include "cstring"
         ^~~~~~~~~
1 error generated.
make[10]: *** [Makefile:120: headers++.chk] Error 1
make[10]: *** Waiting for unfinished jobs....







> ---
> CC: Doug Goldstein <cardoe@cardoe.com>
> CC: Ian Jackson <iwj@xenproject.org>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> ---
>  automation/gitlab-ci/build.yaml | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
> index d00b8a5123..23ab81d892 100644
> --- a/automation/gitlab-ci/build.yaml
> +++ b/automation/gitlab-ci/build.yaml
> @@ -443,13 +443,13 @@ alpine-3.12-gcc-debug:
>    allow_failure: true
>  
>  alpine-3.12-clang:
> -  extends: .gcc-x86-64-build
> +  extends: .clang-x86-64-build
>    variables:
>      CONTAINER: alpine:3.12
>    allow_failure: true
>  
>  alpine-3.12-clang-debug:
> -  extends: .gcc-x86-64-build-debug
> +  extends: .clang-x86-64-build-debug
>    variables:
>      CONTAINER: alpine:3.12
>    allow_failure: true
> -- 
> 2.11.0
> 

