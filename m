Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5266863F995
	for <lists+xen-devel@lfdr.de>; Thu,  1 Dec 2022 22:12:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.451191.708839 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0qqX-0005Ni-DA; Thu, 01 Dec 2022 21:11:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 451191.708839; Thu, 01 Dec 2022 21:11:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0qqX-0005Kr-9c; Thu, 01 Dec 2022 21:11:53 +0000
Received: by outflank-mailman (input) for mailman id 451191;
 Thu, 01 Dec 2022 21:11:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p0qqV-0005GX-NH
 for xen-devel@lists.xenproject.org; Thu, 01 Dec 2022 21:11:51 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p0qqV-000460-1s; Thu, 01 Dec 2022 21:11:51 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p0qqU-0000Me-SV; Thu, 01 Dec 2022 21:11:51 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:
	From:References:Cc:To:MIME-Version:Date:Message-ID;
	bh=DeXtAJiRecyuvc6hFrpChtod9Sfs+fnlWtR7/wugBB4=; b=DpyxBg1cSb8usgDmyntSFdmJVZ
	rCqOjcwU+WRjxah16kfLQjUKbjaKghaw9vPEF8CMWfhLpk8T2X5SbhFVKahVk3p4/1VM+PmXkqT7f
	EHDe4dnVOP7XimtxYF+T6ymdlZhlZsa12RJm01/97OUDwVGICoQjoGwMnJEkF6jgXtNc=;
Message-ID: <47f6bd45-f976-4e40-6207-c50e7ee2a8f3@xen.org>
Date: Thu, 1 Dec 2022 21:11:49 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20221101152842.4257-1-jgross@suse.com>
 <20221101152842.4257-8-jgross@suse.com>
From: Julien Grall <julien@xen.org>
Subject: Re: [PATCH 07/20] tools/xenstore: enhance hashtable implementation
In-Reply-To: <20221101152842.4257-8-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 01/11/2022 15:28, Juergen Gross wrote:
> Today it is possible to set a flag when calling hashtable_destroy() in
> order to specify whether the data associated with the hashtable entries
> should be freed or not. The keys of the entries will always be freed.
> 
> Change that by replacing the flag of hashtable_destroy() by two flags
> for create_hashtable() which will specify whether the data and/or the
> key of each entry should be freed or not.
> 
> This will enable users to have the key e.g. as part of the data.
> 
> Add a new function hashtable_iterate() to call a user specified
> function for each entry in the hashtable.
> 
> Add new primes to the primetable in order to support smaller sizes of
> the hashtable. The primes are selected according to:
> 
> https://planetmath.org/goodhashtableprimes
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>   tools/xenstore/hashtable.c      | 66 +++++++++++++++++++++++----------
>   tools/xenstore/hashtable.h      | 35 +++++++++++++++--
>   tools/xenstore/xenstored_core.c |  7 ++--
>   3 files changed, 82 insertions(+), 26 deletions(-)
> 
> diff --git a/tools/xenstore/hashtable.c b/tools/xenstore/hashtable.c
> index 6ac336eff1..7a1548c490 100644
> --- a/tools/xenstore/hashtable.c
> +++ b/tools/xenstore/hashtable.c
> @@ -16,6 +16,7 @@ struct entry
>   
>   struct hashtable {
>       unsigned int tablelength;
> +    unsigned int flags;
>       struct entry **table;
>       unsigned int entrycount;
>       unsigned int loadlimit;
> @@ -25,12 +26,11 @@ struct hashtable {
>   };
>   
>   /*
> -Credit for primes table: Aaron Krowne
> - http://br.endernet.org/~akrowne/
> - http://planetmath.org/encyclopedia/GoodHashTablePrimes.html
> -*/
> + * Credit for primes table: Aaron Krowne
> + * https://planetmath.org/goodhashtableprimes
> + */

You don't seem to explain in the commit message why the URLs have been 
modified. Other than that:

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

