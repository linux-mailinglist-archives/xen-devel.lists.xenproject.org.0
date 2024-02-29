Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B326E86CABE
	for <lists+xen-devel@lfdr.de>; Thu, 29 Feb 2024 14:54:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.687134.1070079 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfgra-0007EW-0o; Thu, 29 Feb 2024 13:54:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 687134.1070079; Thu, 29 Feb 2024 13:54:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfgrZ-0007D0-Tx; Thu, 29 Feb 2024 13:54:17 +0000
Received: by outflank-mailman (input) for mailman id 687134;
 Thu, 29 Feb 2024 13:54:16 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rfgrY-0007Cu-85
 for xen-devel@lists.xenproject.org; Thu, 29 Feb 2024 13:54:16 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rfgrX-0005Y2-Gj; Thu, 29 Feb 2024 13:54:15 +0000
Received: from [15.248.3.86] (helo=[10.45.19.50])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rfgrX-00063I-84; Thu, 29 Feb 2024 13:54:15 +0000
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
	bh=fHqAgmIJ16aenmat+zXd3xoW6+g/MT2fpdWqfvojaDE=; b=cxHel2HXzG68DIfZQbKO8r5WAa
	RDv5OmmtA27MenFzw0IpTFW7FER3NlkTxTn6hGM+1EbjTOYTHsXbOJ1C1YA7vyJx4XFG6RRb23kuK
	hmZBkT71qthyJGUMwF0dUazPGD08kAXUPNcl1oC3CtDIDUxi3KYsH3IYobl+qvIfSIc0=;
Message-ID: <e22ca712-b8cf-4bc9-87df-22cbd7819733@xen.org>
Date: Thu, 29 Feb 2024 13:54:13 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 04/23] xen/asm-generic: introduce generic fls() and
 flsl() functions
Content-Language: en-GB
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <cover.1708962629.git.oleksii.kurochko@gmail.com>
 <df7ab5055ef08fa595f913072302770a3f6a5c33.1708962629.git.oleksii.kurochko@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <df7ab5055ef08fa595f913072302770a3f6a5c33.1708962629.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Oleksii,

On 26/02/2024 17:38, Oleksii Kurochko wrote:
> These functions can be useful for architectures that don't
> have corresponding arch-specific instructions.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
>   Changes in V5:
>     - new patch
> ---
>   xen/include/asm-generic/bitops/fls.h  | 18 ++++++++++++++++++
>   xen/include/asm-generic/bitops/flsl.h | 10 ++++++++++

One header per function seems a little bit excessive to me. Do you have 
any pointer where this request is coming from?

Why not using the pattern.

In arch implementation:

#define fls
static inline ...

In the generic header (asm-generic or xen/):

#ifndef fls
static inline ...
#endif

>   2 files changed, 28 insertions(+)
>   create mode 100644 xen/include/asm-generic/bitops/fls.h
>   create mode 100644 xen/include/asm-generic/bitops/flsl.h
> 
> diff --git a/xen/include/asm-generic/bitops/fls.h b/xen/include/asm-generic/bitops/fls.h
> new file mode 100644
> index 0000000000..369a4c790c
> --- /dev/null
> +++ b/xen/include/asm-generic/bitops/fls.h
> @@ -0,0 +1,18 @@
> +/* SPDX-License-Identifier: GPL-2.0 */

You should use GPL-2.0-only.

> +#ifndef _ASM_GENERIC_BITOPS_FLS_H_
> +#define _ASM_GENERIC_BITOPS_FLS_H_
> +
> +/**
> + * fls - find last (most-significant) bit set
> + * @x: the word to search
> + *
> + * This is defined the same way as ffs.
> + * Note fls(0) = 0, fls(1) = 1, fls(0x80000000) = 32.
> + */
> +
> +static inline int fls(unsigned int x)
> +{
> +    return generic_fls(x);
> +}
> +
> +#endif /* _ASM_GENERIC_BITOPS_FLS_H_ */

Missing emacs magic. I am probably not going to repeat this remark and 
the one above again. So please have a look.

> diff --git a/xen/include/asm-generic/bitops/flsl.h b/xen/include/asm-generic/bitops/flsl.h
> new file mode 100644
> index 0000000000..d0a2e9c729
> --- /dev/null
> +++ b/xen/include/asm-generic/bitops/flsl.h
> @@ -0,0 +1,10 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef _ASM_GENERIC_BITOPS_FLSL_H_
> +#define _ASM_GENERIC_BITOPS_FLSL_H_
> +
> +static inline int flsl(unsigned long x)
> +{
> +    return generic_flsl(x);
> +}
> +
> +#endif /* _ASM_GENERIC_BITOPS_FLSL_H_ */

Cheers,

-- 
Julien Grall

