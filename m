Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51AE52CC333
	for <lists+xen-devel@lfdr.de>; Wed,  2 Dec 2020 18:14:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.42926.77254 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkVhr-0003MX-7Q; Wed, 02 Dec 2020 17:14:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 42926.77254; Wed, 02 Dec 2020 17:14:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkVhr-0003M8-3m; Wed, 02 Dec 2020 17:14:19 +0000
Received: by outflank-mailman (input) for mailman id 42926;
 Wed, 02 Dec 2020 17:14:17 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1kkVhp-0003Lx-4a
 for xen-devel@lists.xenproject.org; Wed, 02 Dec 2020 17:14:17 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kkVhm-0006yZ-Py; Wed, 02 Dec 2020 17:14:14 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kkVhm-0002Uj-83; Wed, 02 Dec 2020 17:14:14 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=0FqFLdJQXrjhS3oZ6ij+JKyXDSMIt3qywizF6zgyS3Y=; b=o0VdJ0ml2EIsGotYn/WJuIpTYJ
	1JltMO4Q7cYf8s/oByWmC2Z2UG7OKRm4PutUAeSfbQJbIqHe5KL6VACZpxLxquyWlsjSdZUZ5iU9C
	NTWoJzZ40jncTjD7+hQqbLnqeM2GVJTbbZo6l8GJFg5+3omVtrI9QU9EKrTZ9IFhvI9M=;
Subject: Re: [PATCH 1/2] include: don't use asm/page.h from common headers
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Hongyan Xia <hx242@xen.org>
References: <75484377-160c-a529-1cfc-96de86cfc550@suse.com>
 <04276039-a5d0-fefd-260e-ffaa8272fd6a@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <a35fb176-e729-a542-4416-7040d6c80964@xen.org>
Date: Wed, 2 Dec 2020 17:14:12 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <04276039-a5d0-fefd-260e-ffaa8272fd6a@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 02/12/2020 14:49, Jan Beulich wrote:
> Doing so limits what can be done in (in particular included by) this per-
> arch header. Abstract out page shift/size related #define-s, which is all
> the repsecitve headers care about. Extend the replacement / removal to

s/repsecitve/respective/

> some x86 headers as well; some others now need to include page.h (and
> they really should have before).
> 
> Arm's VADDR_BITS gets restricted to 32-bit, as its current value is
> clearly wrong for 64-bit, but the constant also isn't used anywhere
> right now (i.e. the #define could also be dropped altogether).

Whoops. Thankfully this is not used.

> 
> I wasn't sure about Arm's use of vaddr_t in PAGE_OFFSET(), and hence I
> kept it and provided a way to override the #define in the common header.

vaddr_t is defined to 32-bit for arm32 or 64-bit for arm64. So I think 
it would be fine to use the generic PAGE_OFFSET() implementation.

> 
> Also drop the dead PAGE_FLAG_MASK altogether at this occasion.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> --- a/xen/arch/arm/arm64/lib/clear_page.S
> +++ b/xen/arch/arm/arm64/lib/clear_page.S
> @@ -14,6 +14,8 @@
>    * along with this program.  If not, see <http://www.gnu.org/licenses/>.
>    */
>   
> +#include <xen/page-size.h>
> +
>   /*
>    * Clear page @dest
>    *
> --- a/xen/include/asm-arm/config.h
> +++ b/xen/include/asm-arm/config.h
> @@ -176,11 +176,6 @@
>   #define FIXMAP_ACPI_BEGIN  2  /* Start mappings of ACPI tables */
>   #define FIXMAP_ACPI_END    (FIXMAP_ACPI_BEGIN + NUM_FIXMAP_ACPI_PAGES - 1)  /* End mappings of ACPI tables */
>   
> -#define PAGE_SHIFT              12
> -#define PAGE_SIZE           (_AC(1,L) << PAGE_SHIFT)
> -#define PAGE_MASK           (~(PAGE_SIZE-1))
> -#define PAGE_FLAG_MASK      (~0)
> -
>   #define NR_hypercalls 64
>   
>   #define STACK_ORDER 3
> --- a/xen/include/asm-arm/current.h
> +++ b/xen/include/asm-arm/current.h
> @@ -1,6 +1,7 @@
>   #ifndef __ARM_CURRENT_H__
>   #define __ARM_CURRENT_H__
>   
> +#include <xen/page-size.h>
>   #include <xen/percpu.h>
>   
>   #include <asm/processor.h>
> --- /dev/null
> +++ b/xen/include/asm-arm/page-shift.h

The name of the file looks a bit odd given that *_BITS are also defined 
in it. So how about renaming to page-size.h?

> @@ -0,0 +1,15 @@
> +#ifndef __ARM_PAGE_SHIFT_H__
> +#define __ARM_PAGE_SHIFT_H__
> +
> +#define PAGE_SHIFT              12
> +
> +#define PAGE_OFFSET(ptr)        ((vaddr_t)(ptr) & ~PAGE_MASK)
> +
> +#ifdef CONFIG_ARM_64
> +#define PADDR_BITS              48

Shouldn't we define VADDR_BITS here? But I wonder whether VADDR_BITS 
should be defined as sizeof(vaddr_t) * 8.

This would require to include asm/types.h.

> +#else
> +#define PADDR_BITS              40
> +#define VADDR_BITS              32
> +#endif
> +
> +#endif /* __ARM_PAGE_SHIFT_H__ */
> --- a/xen/include/asm-arm/page.h
> +++ b/xen/include/asm-arm/page.h
> @@ -2,21 +2,11 @@
>   #define __ARM_PAGE_H__
>   
>   #include <public/xen.h>
> +#include <xen/page-size.h>
>   #include <asm/processor.h>
>   #include <asm/lpae.h>
>   #include <asm/sysregs.h>
>   
> -#ifdef CONFIG_ARM_64
> -#define PADDR_BITS              48
> -#else
> -#define PADDR_BITS              40
> -#endif
> -#define PADDR_MASK              ((1ULL << PADDR_BITS)-1)
> -#define PAGE_OFFSET(ptr)        ((vaddr_t)(ptr) & ~PAGE_MASK)
> -
> -#define VADDR_BITS              32
> -#define VADDR_MASK              (~0UL)
> -
>   /* Shareability values for the LPAE entries */
>   #define LPAE_SH_NON_SHAREABLE 0x0
>   #define LPAE_SH_UNPREDICTALE  0x1
> --- a/xen/include/asm-x86/current.h
> +++ b/xen/include/asm-x86/current.h
> @@ -8,8 +8,8 @@
>   #define __X86_CURRENT_H__
>   
>   #include <xen/percpu.h>
> +#include <xen/page-size.h>
>   #include <public/xen.h>
> -#include <asm/page.h>
>   
>   /*
>    * Xen's cpu stacks are 8 pages (8-page aligned), arranged as:
> --- a/xen/include/asm-x86/desc.h
> +++ b/xen/include/asm-x86/desc.h
> @@ -1,6 +1,8 @@
>   #ifndef __ARCH_DESC_H
>   #define __ARCH_DESC_H
>   
> +#include <asm/page.h>

May I ask why you are including <asm/page.h> and not <xen/page-size.h> here?

Cheers,

-- 
Julien Grall

