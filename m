Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA8953761D2
	for <lists+xen-devel@lfdr.de>; Fri,  7 May 2021 10:24:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.123816.233621 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1levmg-0001vW-UB; Fri, 07 May 2021 08:24:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 123816.233621; Fri, 07 May 2021 08:24:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1levmg-0001ta-Qs; Fri, 07 May 2021 08:24:30 +0000
Received: by outflank-mailman (input) for mailman id 123816;
 Fri, 07 May 2021 08:24:29 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hx242@xen.org>) id 1levmf-0001tL-Cn
 for xen-devel@lists.xenproject.org; Fri, 07 May 2021 08:24:29 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1levmc-0002qE-HZ; Fri, 07 May 2021 08:24:26 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=ua82172827c7b5a.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1levmc-0003L4-6T; Fri, 07 May 2021 08:24:26 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Mime-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID;
	bh=kzodNZzZ/s/DeUd/c79H/lZ0jYya5iYeJAjr4P6l0pQ=; b=ixcY31IfrTf1rQyljTpWUEvTgs
	UkESnTRvy1QK0OYRCwNsT2SiyyfGvNdU8l7w1Yxcy3Zso99FrkfAxLGni/WzTZqR+bItcgRk3bU4c
	FhiYlrPesMU9ZhHO+MLBQLpBF8hjuuZ24gcz7MxM7nGKRCg8GKwYXW4Ha573OxfKCBKU=;
Message-ID: <8773723448ea05a6ea0c843e408f6f05a04c2fd6.camel@xen.org>
Subject: Re: [PATCH RFC 2/2] xen/kexec: Reserve KEXEC_TYPE_LIVEUPDATE and
 KEXEC_RANGE_MA_LIVEUPDATE
From: Hongyan Xia <hx242@xen.org>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: dwmw2@infradead.org, paul@xen.org, raphning@amazon.com,
 maghul@amazon.com,  Julien Grall <jgrall@amazon.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Ian
 Jackson <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Date: Fri, 07 May 2021 09:24:22 +0100
In-Reply-To: <20210506104259.16928-3-julien@xen.org>
References: <20210506104259.16928-1-julien@xen.org>
	 <20210506104259.16928-3-julien@xen.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit

On Thu, 2021-05-06 at 11:42 +0100, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> Unfortunately, the code to support Live Update has already been
> merged in
> Kexec and shipped since 2.0.21. Reserve the IDs used by Kexec before
> they
> end up to be re-used for a different purpose.
> 
> This patch reserves two IDs:
>     * KEXEC_TYPE_LIVEUPDATE: New operation to request Live Update
>     * KEXEC_MA_RANGE_LIVEUPDATE: New range to query the Live Update
>       area below Xen
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Reviewed-by: Hongyan Xia <hongyxia@amazon.com>

> ---
>  xen/include/public/kexec.h | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/include/public/kexec.h b/xen/include/public/kexec.h
> index 3f2a118381ba..650d2feb036f 100644
> --- a/xen/include/public/kexec.h
> +++ b/xen/include/public/kexec.h
> @@ -71,17 +71,22 @@
>   */
>  
>  /*
> - * Kexec supports two types of operation:
> + * Kexec supports three types of operation:
>   * - kexec into a regular kernel, very similar to a standard reboot
>   *   - KEXEC_TYPE_DEFAULT is used to specify this type
>   * - kexec into a special "crash kernel", aka kexec-on-panic
>   *   - KEXEC_TYPE_CRASH is used to specify this type
>   *   - parts of our system may be broken at kexec-on-panic time
>   *     - the code should be kept as simple and self-contained as
> possible
> + * - Live update into a new Xen, preserving all running domains
> + *   - KEXEC_TYPE_LIVE_UPDATE is used to specify this type
> + *   - Xen performs non-cooperative live migration and stores live
> + *     update state in memory, passing it to the new Xen.
>   */
>  
> -#define KEXEC_TYPE_DEFAULT 0
> -#define KEXEC_TYPE_CRASH   1
> +#define KEXEC_TYPE_DEFAULT      0
> +#define KEXEC_TYPE_CRASH        1
> +#define KEXEC_TYPE_LIVEUPDATE   2
>  
>  
>  /* The kexec implementation for Xen allows the user to load two
> @@ -150,6 +155,8 @@ typedef struct xen_kexec_load_v1 {
>  #define KEXEC_RANGE_MA_EFI_MEMMAP 5 /* machine address and size of
>                                       * of the EFI Memory Map */
>  #define KEXEC_RANGE_MA_VMCOREINFO 6 /* machine address and size of
> vmcoreinfo */
> +/* machine address and size of the Live Update area below Xen */
> +#define KEXEC_RANGE_MA_LIVEUPDATE 7

Very nit: I tend to say "right below" Xen, since below sounds like it
could be anywhere. In the design doc we also said "just below".

Hongyan


