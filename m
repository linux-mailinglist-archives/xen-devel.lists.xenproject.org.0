Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD791567959
	for <lists+xen-devel@lfdr.de>; Tue,  5 Jul 2022 23:29:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.361583.591168 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8q6w-0001cm-TY; Tue, 05 Jul 2022 21:29:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 361583.591168; Tue, 05 Jul 2022 21:29:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8q6w-0001ZN-Q5; Tue, 05 Jul 2022 21:29:34 +0000
Received: by outflank-mailman (input) for mailman id 361583;
 Tue, 05 Jul 2022 21:29:33 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1o8q6v-0001Z9-3g
 for xen-devel@lists.xenproject.org; Tue, 05 Jul 2022 21:29:33 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o8q6u-0005zu-IB; Tue, 05 Jul 2022 21:29:32 +0000
Received: from home.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o8q6u-0006TZ-Cl; Tue, 05 Jul 2022 21:29:32 +0000
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
	bh=1H/miVnlQ8KT0jnMBB4CKCDvF+Fxs3OlNXv4F1pMGQQ=; b=rP5NUmWFLJ6MB7mcNV+mTPfL0X
	hJgi7fYrCsxyFtcjcjBybic5Sd8Vy/Hh7eQkvhhk/T+bkFPbveoHFZZf7SdZ3IQss3IW9sgmC9ZZX
	a84GEbudZdSYnXlvjmXRS0OqX59Oj/BOaJBawfU/Fg6z3ImqxqMivA+jZRrcld1dpkZU=;
Message-ID: <32147948-ce70-1217-c899-2c60f8502f16@xen.org>
Date: Tue, 5 Jul 2022 22:29:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PATCH 2/4] xen/common: time: Fix MISRA C 2012 Rule 8.7 violation
To: Xenia Ragiadakou <burzalodowa@gmail.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20220705210218.483854-1-burzalodowa@gmail.com>
 <20220705210218.483854-3-burzalodowa@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220705210218.483854-3-burzalodowa@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Xenia,

On 05/07/2022 22:02, Xenia Ragiadakou wrote:
> The variable __mon_lengths is referenced only in time.c.
> Change its linkage from external to internal by adding the storage-class
> specifier static to its definitions.
> 
> Also, this patch resolves indirectly a MISRA C 2012 Rule 8.4 violation warning.
> 
> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

> ---
>   xen/common/time.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/xen/common/time.c b/xen/common/time.c
> index 22379f4ae2..92f7b72464 100644
> --- a/xen/common/time.c
> +++ b/xen/common/time.c
> @@ -28,7 +28,7 @@
>     ((year) % 4 == 0 && ((year) % 100 != 0 || (year) % 400 == 0))
>   
>   /* How many days are in each month.  */
> -const unsigned short int __mon_lengths[2][12] = {
> +static const unsigned short int __mon_lengths[2][12] = {
>       /* Normal years.  */
>       {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31},
>       /* Leap years.  */

-- 
Julien Grall

