Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67CA25514F0
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jun 2022 11:53:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.352673.579510 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3E6B-00008U-39; Mon, 20 Jun 2022 09:53:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 352673.579510; Mon, 20 Jun 2022 09:53:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3E6A-00005e-VT; Mon, 20 Jun 2022 09:53:34 +0000
Received: by outflank-mailman (input) for mailman id 352673;
 Mon, 20 Jun 2022 09:53:34 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1o3E6A-00005Y-1d
 for xen-devel@lists.xenproject.org; Mon, 20 Jun 2022 09:53:34 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o3E69-0000qj-4c; Mon, 20 Jun 2022 09:53:33 +0000
Received: from 54-240-197-226.amazon.com ([54.240.197.226] helo=[192.168.1.39])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o3E68-0000iu-Uc; Mon, 20 Jun 2022 09:53:33 +0000
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
	bh=+k3EeC0vPzczHHm5EyhICqT6Mx/itTIa3WcU5mtwNeE=; b=HYcWbXo9l9zQSd1OUXAYWC3Jlk
	p1B3VP8dq5ry56G+K4f3MGoJZIko0qrNUYlN21otkkYllBzUA7CVhwEm/oD2FhTBEZeHQKjJgkLC5
	9EYEKQgj9moLqO9N043TyMsGff7DtgckZfi7EaTf3feD63ToWMsr/tEWf7A/mQCtxVXY=;
Message-ID: <af427a56-3023-ce84-af43-1a0a1961a805@xen.org>
Date: Mon, 20 Jun 2022 10:53:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: [PATCH 4/9] include/xen: Use explicitly specified types
To: Michal Orzel <michal.orzel@arm.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20220620070245.77979-1-michal.orzel@arm.com>
 <20220620070245.77979-5-michal.orzel@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220620070245.77979-5-michal.orzel@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 20/06/2022 08:02, Michal Orzel wrote:
> According to MISRA C 2012 Rule 8.1, types shall be explicitly
> specified. Fix all the findings reported by cppcheck with misra addon
> by substituting implicit type 'unsigned' to explicit 'unsigned int'.
> 
> Signed-off-by: Michal Orzel <michal.orzel@arm.com>
> ---
>   xen/include/xen/perfc.h | 2 +-
>   xen/include/xen/sched.h | 6 +++---
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/xen/include/xen/perfc.h b/xen/include/xen/perfc.h
> index bb010b0aae..7c5ce537bd 100644
> --- a/xen/include/xen/perfc.h
> +++ b/xen/include/xen/perfc.h
> @@ -49,7 +49,7 @@ enum perfcounter {
>   #undef PERFSTATUS
>   #undef PERFSTATUS_ARRAY
>   
> -typedef unsigned perfc_t;
> +typedef unsigned int perfc_t;
>   #define PRIperfc ""
>   
>   DECLARE_PER_CPU(perfc_t[NUM_PERFCOUNTERS], perfcounters);
> diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
> index 463d41ffb6..d957b6e11f 100644
> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -518,9 +518,9 @@ struct domain
>   
>       /* hvm_print_line() and guest_console_write() logging. */
>   #define DOMAIN_PBUF_SIZE 200
> -    char       *pbuf;
> -    unsigned    pbuf_idx;
> -    spinlock_t  pbuf_lock;
> +    char         *pbuf;
> +    unsigned int  pbuf_idx;
> +    spinlock_t    pbuf_lock;

Looking a "struct domain", we don't often seem to align the name. In 
fact, this is something I don't particularly like because it adds a lot 
of churn in a patch.

So my preference would be to just change the line "unsigned".

Other than that:

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

