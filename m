Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BAEFC5B326F
	for <lists+xen-devel@lfdr.de>; Fri,  9 Sep 2022 10:57:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.403939.646211 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWZor-0001QY-Bu; Fri, 09 Sep 2022 08:57:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 403939.646211; Fri, 09 Sep 2022 08:57:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWZor-0001Ng-8y; Fri, 09 Sep 2022 08:57:01 +0000
Received: by outflank-mailman (input) for mailman id 403939;
 Fri, 09 Sep 2022 08:56:59 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oWZop-0001Na-S5
 for xen-devel@lists.xenproject.org; Fri, 09 Sep 2022 08:56:59 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oWZop-0005KC-DN; Fri, 09 Sep 2022 08:56:59 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=[192.168.11.73]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oWZop-0006yR-6I; Fri, 09 Sep 2022 08:56:59 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=X8IeEzZiX4kZhRhfnqCdLGEjuWqQLlCu96zT2ODmSq4=; b=zX8swPbHbpZ+cqXu9iYgskodw2
	dNNjvMKl3paUV1TMBT0M663Ns/BMzWBAbcyyzCrnXB76bi4viceqEk936hbPOOLFNAWuk3jUvIiAs
	saYlVVERtVb/bxdH09j+41RbkqdzxRZyeHyoiuCFRfBH9BqjhQhw1iSVQZdXIJ6dv48Y=;
Message-ID: <689f7d26-b691-56de-7adb-dfb6480e7469@xen.org>
Date: Fri, 9 Sep 2022 09:56:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.1
Subject: Re: [PATCH] xen/gnttab: fix gnttab_acquire_resource()
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Henry.Wang@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20220909080944.28559-1-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220909080944.28559-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 09/09/2022 09:09, Juergen Gross wrote:
> Commit 9dc46386d89d ("gnttab: work around "may be used uninitialized"
> warning") was wrong, as vaddr can legitimately be NULL in case
> XENMEM_resource_grant_table_id_status was specified for a grant table
> v1. This would result in crashes in debug builds due to
> ASSERT_UNREACHABLE() triggering.
> 
> Basically revert said commit, but keep returning -ENODATA in that case.

This commit was introduced to silence a compiler warning (treated as 
error in Xen build system). As you revert it, did you check the said 
compiler (IIRC GCC 4.3) was still happy?

> Fixes: 9dc46386d89d ("gnttab: work around "may be used uninitialized" warning")
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
> Might be considered for 4.17 and for backporting
> ---
>   xen/common/grant_table.c | 14 +++-----------
>   1 file changed, 3 insertions(+), 11 deletions(-)
> 
> diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
> index ad773a6996..68e7f1df38 100644
> --- a/xen/common/grant_table.c
> +++ b/xen/common/grant_table.c
> @@ -4125,7 +4125,10 @@ int gnttab_acquire_resource(
>   
>       case XENMEM_resource_grant_table_id_status:
>           if ( gt->gt_version != 2 )
> +        {
> +            rc = -ENODATA;
>               break;
> +        }
>   
>           /* Check that void ** is a suitable representation for gt->status. */
>           BUILD_BUG_ON(!__builtin_types_compatible_p(
> @@ -4135,17 +4138,6 @@ int gnttab_acquire_resource(
>           break;
>       }
>   
> -    /*
> -     * Some older toolchains can't spot that vaddrs won't remain uninitialized
> -     * on non-error paths, and hence it needs setting to NULL at the top of the
> -     * function.  Leave some runtime safety.
> -     */
> -    if ( !vaddrs )
> -    {
> -        ASSERT_UNREACHABLE();
> -        rc = -ENODATA;
> -    }
> -
>       /* Any errors?  Bad id, or from growing the table? */
>       if ( rc )
>           goto out;

Looking at the code just below the loop is:

for ( i = 0; i < nr_frames; ++i )
    mfn_list[i] = virt_to_mfn(vaddrs[frame + 1]);

Given that 'nr_frames' is provided by the caller it is a bit unclear how 
we guarantee that 'vaddrs' will not be NULL when nr_frames > 0.

Can you explain how you came to the conclusion that this is not possible?

Cheers,

-- 
Julien Grall

