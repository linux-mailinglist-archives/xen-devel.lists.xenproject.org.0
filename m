Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDFB84E4F97
	for <lists+xen-devel@lfdr.de>; Wed, 23 Mar 2022 10:41:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.293827.499286 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWxTW-0002pQ-EH; Wed, 23 Mar 2022 09:40:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 293827.499286; Wed, 23 Mar 2022 09:40:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWxTW-0002mh-Aa; Wed, 23 Mar 2022 09:40:18 +0000
Received: by outflank-mailman (input) for mailman id 293827;
 Wed, 23 Mar 2022 09:40:16 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nWxTU-0002mb-Ec
 for xen-devel@lists.xenproject.org; Wed, 23 Mar 2022 09:40:16 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nWxTU-0001VB-1h; Wed, 23 Mar 2022 09:40:16 +0000
Received: from 54-240-197-230.amazon.com ([54.240.197.230]
 helo=[192.168.10.149]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nWxTT-0005Dx-Rn; Wed, 23 Mar 2022 09:40:15 +0000
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
	bh=hZfzxzfTvi8WbzQT7d+PpAeHT5X/MJOWNDoiVmU2UJ4=; b=TNrVYTAS2vod0IYIiB7WPPiNgx
	g3xRDo1cbxQ7sENwOb3wz1870rFAMZDwHNz1uXVr5niwELcpzvFw2XRhoRAWGzzgwFG8kJ475ZUeC
	edDitRB/8zWEtP0qFvhz3jAG3PGgPC7DRCwu45mNmeWzgSiML9MomW60retZap09IH2I=;
Message-ID: <93bdb9e5-f054-704e-9302-3c2e17d92c60@xen.org>
Date: Wed, 23 Mar 2022 09:40:13 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH v4 10/11] xen/arm: call hypercall handlers via generated
 macro
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Michal Orzel <michal.orzel@arm.com>
References: <20220310073420.15622-1-jgross@suse.com>
 <20220310073420.15622-11-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220310073420.15622-11-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 10/03/2022 07:34, Juergen Gross wrote:
> @@ -1520,7 +1460,10 @@ static bool check_multicall_32bit_clean(struct multicall_entry *multi)
>   {
>       int i;
>   
> -    for ( i = 0; i < arm_hypercall_table[multi->op].nr_args; i++ )
> +    if ( multi->op >= ARRAY_SIZE(hypercall_args) )
> +        return true;

NIT: This change reads odd to me. So I would prefer...

> +
> +    for ( i = 0; i < hypercall_args[multi->op]; i++ )
>       {
>           if ( unlikely(multi->args[i] & 0xffffffff00000000ULL) )
>           {
> @@ -1537,28 +1480,13 @@ static bool check_multicall_32bit_clean(struct multicall_entry *multi)
>   enum mc_disposition arch_do_multicall_call(struct mc_state *state)
>   {
>       struct multicall_entry *multi = &state->call;
> -    arm_hypercall_fn_t call = NULL;
> -
> -    if ( multi->op >= ARRAY_SIZE(arm_hypercall_table) )

... if we keep this checks. So we don't return true in 
check_multicall_32bit_clean() when the hypercall doesn't exist.

The code still do the right thing, so either way:

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

