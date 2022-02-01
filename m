Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 524D34A61DF
	for <lists+xen-devel@lfdr.de>; Tue,  1 Feb 2022 18:05:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.263704.456535 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEwac-0006W0-Di; Tue, 01 Feb 2022 17:05:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 263704.456535; Tue, 01 Feb 2022 17:05:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEwac-0006TX-AX; Tue, 01 Feb 2022 17:05:10 +0000
Received: by outflank-mailman (input) for mailman id 263704;
 Tue, 01 Feb 2022 17:05:09 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nEwaa-0006TN-VJ
 for xen-devel@lists.xenproject.org; Tue, 01 Feb 2022 17:05:08 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nEwaZ-0008Un-Be; Tue, 01 Feb 2022 17:05:07 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232] helo=[10.95.141.48])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nEwaZ-0005Oo-4H; Tue, 01 Feb 2022 17:05:07 +0000
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
	bh=mCabRdLzecYi21RUKUf8GiXL6En4ciaveMncdhDTlv4=; b=Uozi72T5OVxcxeAPYT1vMnIr1X
	aAC7Ujcqd4GemTnzx2yYdXQJHedCc4vr235MQh7cK2Jufw+rirut2lybcmgwcmHzM1SuwexVgjizv
	8Uyf9430ZNJcGmLYH8SAlwyrmmwXvPus7ca6r1GaIapMam9MY4hldJ2osAdkW26vlgdY=;
Message-ID: <bb5010df-5e5b-9de1-7ad8-1ba5e8e37edc@xen.org>
Date: Tue, 1 Feb 2022 17:05:04 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH 2/4] rangeset: add rangeset_reset helper function
To: Oleksandr Andrushchenko <andr2000@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, oleksandr_tyshchenko@epam.com,
 volodymyr_babchuk@epam.com, Artem_Mygaiev@epam.com, roger.pau@citrix.com,
 jbeulich@suse.com, andrew.cooper3@citrix.com, george.dunlap@citrix.com,
 paul@xen.org, bertrand.marquis@arm.com, rahul.singh@arm.com,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
References: <20220201162508.417008-1-andr2000@gmail.com>
 <20220201162508.417008-3-andr2000@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220201162508.417008-3-andr2000@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 01/02/2022 16:25, Oleksandr Andrushchenko wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> This helper destroys all the ranges of the rangeset given.
> Please note, that it uses rangeset_remove_range which returns an error
> code on failure. This error code can be ignored as while destroying all
> the ranges no memory allocation is expected, so in this case it must not
> fail.
> 
> To make sure this remains valid use BUG_ON if that changes in the future.
> 
> Suggested-by: Roger Pau Monné <roger.pau@citrix.com>
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> ---
>   xen/common/rangeset.c      | 6 ++++++
>   xen/include/xen/rangeset.h | 3 +++
>   2 files changed, 9 insertions(+)
> 
> diff --git a/xen/common/rangeset.c b/xen/common/rangeset.c
> index ea27d651723b..9ca2b06cff22 100644
> --- a/xen/common/rangeset.c
> +++ b/xen/common/rangeset.c
> @@ -525,6 +525,12 @@ void rangeset_swap(struct rangeset *a, struct rangeset *b)
>       write_unlock(&b->lock);
>   }
>   
> +void rangeset_reset(struct rangeset *r)
> +{
> +    /* This doesn't allocate anything and must not fail. */
> +    BUG_ON(rangeset_remove_range(r, 0, ~0ULL));

I vaguely recall some discussion in the past (not related to this 
series) that we wanted to avoid calling function have side-effect in a 
BUG_ON(). So if we decide to remove at compile-time BUG_ON(), there 
would be no issue.

But then I am not sure about the use of BUG_ON(). Can you outline why 
crashing the hypervisor is better than continuing (e.g. use WARN_ON() or 
ASSERT())?

Cheers,

-- 
Julien Grall

