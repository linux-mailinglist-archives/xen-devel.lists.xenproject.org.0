Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E1BB7585D6
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jul 2023 21:51:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.565448.883548 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLqhk-0000PJ-6U; Tue, 18 Jul 2023 19:49:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 565448.883548; Tue, 18 Jul 2023 19:49:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLqhk-0000Mz-3E; Tue, 18 Jul 2023 19:49:52 +0000
Received: by outflank-mailman (input) for mailman id 565448;
 Tue, 18 Jul 2023 19:49:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jxnk=DE=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1qLqhj-0000Mt-DX
 for xen-devel@lists.xenproject.org; Tue, 18 Jul 2023 19:49:51 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3fa11e8e-25a4-11ee-8611-37d641c3527e;
 Tue, 18 Jul 2023 21:49:48 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 220A08285333;
 Tue, 18 Jul 2023 14:49:46 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id xVTA0dMx5qNh; Tue, 18 Jul 2023 14:49:45 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id F3689828535D;
 Tue, 18 Jul 2023 14:49:44 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 0oVQ3l03KyCi; Tue, 18 Jul 2023 14:49:44 -0500 (CDT)
Received: from [10.11.0.2] (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 5AC3C8285333;
 Tue, 18 Jul 2023 14:49:44 -0500 (CDT)
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
X-Inumbo-ID: 3fa11e8e-25a4-11ee-8611-37d641c3527e
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com F3689828535D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1689709785; bh=O89l9RKgtHV9218UtqijLQ2JUrHWjU82NabzCvrvUeE=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=vl9ym8w69rKdB81ABQ8DtCEeOhTVoC2ZmcvxecOMLLvpgxtEVG4eNOR7LVN0LWU3k
	 +y0cod+P0nfrvkH/aK282bMRoS7gf/dqb+2cBMjJYqY72YDOuqYTURQfiha4TD8rbi
	 a9wmpIqvyttq+/6W36cr4YyUcRsbmNxoT/wOv45c=
X-Virus-Scanned: amavisd-new at rptsys.com
Message-ID: <2da1f2f6-b039-96b3-cb79-f813e6de782e@raptorengineering.com>
Date: Tue, 18 Jul 2023 14:49:43 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux ppc64le; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v3 1/8] common: move a few macros out of xen/lib.h
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 George Dunlap <george.dunlap@citrix.com>
References: <e4bf47ca-2ae6-1fd4-56a6-e4e777150b64@suse.com>
 <a4907ba1-a247-f96d-54e4-090f27665b20@suse.com>
 <109efb43-a519-73f6-2a26-2b420090ab2b@suse.com>
From: Shawn Anastasio <sanastasio@raptorengineering.com>
In-Reply-To: <109efb43-a519-73f6-2a26-2b420090ab2b@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/10/23 3:51 AM, Jan Beulich wrote:
> Introduce xen/macros.h for this purpose. For now xen/lib.h simply
> includes xen/macro.h, until consumers can be suitable cleaned up.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> v3: New.
> 
> --- a/xen/include/xen/lib.h
> +++ b/xen/include/xen/lib.h
> @@ -1,26 +1,7 @@
>  #ifndef __LIB_H__
>  #define __LIB_H__
>  
> -#define ROUNDUP(x, a) (((x) + (a) - 1) & ~((a) - 1))
> -
> -#define IS_ALIGNED(val, align) (!((val) & ((align) - 1)))
> -
> -#define DIV_ROUND(n, d) (((n) + (d) / 2) / (d))
> -#define DIV_ROUND_UP(n, d) (((n) + (d) - 1) / (d))
> -
> -#define MASK_EXTR(v, m) (((v) & (m)) / ((m) & -(m)))
> -#define MASK_INSR(v, m) (((v) * ((m) & -(m))) & (m))
> -
> -#define count_args_(dot, a1, a2, a3, a4, a5, a6, a7, a8, x, ...) x
> -#define count_args(args...) \
> -    count_args_(., ## args, 8, 7, 6, 5, 4, 3, 2, 1, 0)
> -
> -/* Indirect macros required for expanded argument pasting. */
> -#define PASTE_(a, b) a ## b
> -#define PASTE(a, b) PASTE_(a, b)
> -
> -#define __STR(...) #__VA_ARGS__
> -#define STR(...) __STR(__VA_ARGS__)
> +#include <xen/macros.h>
>  
>  #ifndef __ASSEMBLY__
>  
> --- /dev/null
> +++ b/xen/include/xen/macros.h
> @@ -0,0 +1,34 @@

Should there be an SPDX header here?

> +#ifndef __MACROS_H__
> +#define __MACROS_H__
> +
> +#define ROUNDUP(x, a) (((x) + (a) - 1) & ~((a) - 1))
> +
> +#define IS_ALIGNED(val, align) (!((val) & ((align) - 1)))
> +
> +#define DIV_ROUND(n, d) (((n) + (d) / 2) / (d))
> +#define DIV_ROUND_UP(n, d) (((n) + (d) - 1) / (d))
> +
> +#define MASK_EXTR(v, m) (((v) & (m)) / ((m) & -(m)))
> +#define MASK_INSR(v, m) (((v) * ((m) & -(m))) & (m))
> +
> +#define count_args_(dot, a1, a2, a3, a4, a5, a6, a7, a8, x, ...) x
> +#define count_args(args...) \
> +    count_args_(., ## args, 8, 7, 6, 5, 4, 3, 2, 1, 0)
> +
> +/* Indirect macros required for expanded argument pasting. */
> +#define PASTE_(a, b) a ## b
> +#define PASTE(a, b) PASTE_(a, b)
> +
> +#define __STR(...) #__VA_ARGS__
> +#define STR(...) __STR(__VA_ARGS__)
> +
> +#endif /* __MACROS_H__ */
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * indent-tabs-mode: nil
> + * End:
> + */

Reviewed-by: Shawn Anastasio <sanastasio@raptorengineering.com>

