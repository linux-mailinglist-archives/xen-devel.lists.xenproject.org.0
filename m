Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A80A766DFF5
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jan 2023 15:08:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.479488.743371 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHmda-0007lF-V6; Tue, 17 Jan 2023 14:08:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 479488.743371; Tue, 17 Jan 2023 14:08:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHmda-0007iE-S8; Tue, 17 Jan 2023 14:08:30 +0000
Received: by outflank-mailman (input) for mailman id 479488;
 Tue, 17 Jan 2023 14:08:29 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pHmdY-0007i1-W8
 for xen-devel@lists.xenproject.org; Tue, 17 Jan 2023 14:08:29 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pHmdY-0001RI-3f; Tue, 17 Jan 2023 14:08:28 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=[192.168.7.198]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pHmdX-0008E1-U7; Tue, 17 Jan 2023 14:08:28 +0000
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
	bh=EEw53UadeBRHOFbnoUCYTcnaRLTGU27o928rNAeyUYs=; b=fRECNWYhDjhF9OQJ9VXxQb4q7A
	ObYC4T1NFwosLWX5rFSr5Cuorw8EGEny+ymQTcGeqoGhJjG+UKr9VFmYLnQUSxOzOrIp+p6hiKp1Z
	+x0DDkrTKDjQR4k/FmWri+BuAtvAF3L8GSVUNg4VHl7Y5U9E6JJ3753brjG9wI2hhKzs=;
Message-ID: <8aa74a44-2189-ca6b-3668-722e74d233fd@xen.org>
Date: Tue, 17 Jan 2023 14:08:26 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v3 08/17] tools/xenstore: don't allow creating too many
 nodes in a transaction
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230117091124.22170-1-jgross@suse.com>
 <20230117091124.22170-9-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230117091124.22170-9-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 17/01/2023 09:11, Juergen Gross wrote:
> The accounting for the number of nodes of a domain in an active
> transaction is not working correctly, as it allows to create arbitrary
> number of nodes. The transaction will finally fail due to exceeding
> the number of nodes quota, but before closing the transaction an
> unprivileged guest could cause Xenstore to use a lot of memory.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Is the rest of the series depend on this patch? I am asking this because 
I still need to go through your second series before forging an opinion 
on this patch.

Yet, I would like to reduce the number of inflight patches :).

Cheers,

> ---
>   tools/xenstore/xenstored_domain.c | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/tools/xenstore/xenstored_domain.c b/tools/xenstore/xenstored_domain.c
> index edfe5809be..07d91eb50c 100644
> --- a/tools/xenstore/xenstored_domain.c
> +++ b/tools/xenstore/xenstored_domain.c
> @@ -1129,9 +1129,8 @@ int domain_nbentry_fix(unsigned int domid, int num, bool update)
>   
>   int domain_nbentry(struct connection *conn)
>   {
> -	return (domain_is_unprivileged(conn))
> -		? conn->domain->nbentry
> -		: 0;
> +	return domain_is_unprivileged(conn)
> +	       ? domain_nbentry_add(conn, conn->id, 0, true) : 0;
>   }
>   
>   static bool domain_chk_quota(struct domain *domain, int mem)

-- 
Julien Grall

