Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B8852B832A
	for <lists+xen-devel@lfdr.de>; Wed, 18 Nov 2020 18:38:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.30163.59949 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfRPi-0000y1-9g; Wed, 18 Nov 2020 17:38:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 30163.59949; Wed, 18 Nov 2020 17:38:38 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfRPi-0000xc-6T; Wed, 18 Nov 2020 17:38:38 +0000
Received: by outflank-mailman (input) for mailman id 30163;
 Wed, 18 Nov 2020 17:38:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1kfRPg-0000xX-Vp
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 17:38:37 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kfRPe-00073P-OF; Wed, 18 Nov 2020 17:38:34 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kfRPe-0006DN-Dt; Wed, 18 Nov 2020 17:38:34 +0000
Received: from mail.xenproject.org ([104.130.215.37])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kfRPg-0000xX-Vp
	for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 17:38:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=8WEfpjuNjOBv86cVdjdze1V6RaHuJunwVeR6bDLFSCI=; b=ixEmZ7er0r5mOHe50m2FYo0YZ2
	f4clazaE9ysXlKLvRunQsb68r1FDvGUF4xJJ90KD+NqTeFurIcJNGYECb5yyv6nkX22oi3JSugmRh
	7j5N9pd8jM7vbAmRHd1c6wFFimUVBsft8Ni7u6lRJZAvE7YUA5YnCNNHeU3wRIDtBx4c=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kfRPe-00073P-OF; Wed, 18 Nov 2020 17:38:34 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kfRPe-0006DN-Dt; Wed, 18 Nov 2020 17:38:34 +0000
Subject: Re: [PATCH v2 3/8] lib: move list sorting code
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <aa1ca5da-3ecf-8721-63f9-b86ebbc64330@suse.com>
 <19d28bcc-9e5b-4902-8e8d-ae95fbc560a6@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <aaf7183b-a843-57e3-84c9-7408a6ebfedf@xen.org>
Date: Wed, 18 Nov 2020 17:38:31 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <19d28bcc-9e5b-4902-8e8d-ae95fbc560a6@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 23/10/2020 11:17, Jan Beulich wrote:
> Build the source file always, as by putting it into an archive it still
> won't be linked into final binaries when not needed. This way possible
> build breakage will be easier to notice, and it's more consistent with
> us unconditionally building other library kind of code (e.g. sort() or
> bsearch()).
> 
> While moving the source file, take the opportunity and drop the
> pointless EXPORT_SYMBOL().
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

It looks like the commit message was duplicated.

> Build the source file always, as by putting it into an archive it still
> won't be linked into final binaries when not needed. This way possible
> build breakage will be easier to notice, and it's more consistent with
> us unconditionally building other library kind of code (e.g. sort() or
> bsearch()).
> 
> While moving the source file, take the opportunity and drop the
> pointless EXPORT_SYMBOL().

You are mentioning the EXPORT_SYMBOL() but...

> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
>   xen/arch/arm/Kconfig                        | 4 +---
>   xen/common/Kconfig                          | 3 ---
>   xen/common/Makefile                         | 1 -
>   xen/lib/Makefile                            | 1 +
>   xen/{common/list_sort.c => lib/list-sort.c} | 2 --
>   5 files changed, 2 insertions(+), 9 deletions(-)
>   rename xen/{common/list_sort.c => lib/list-sort.c} (98%)
> 
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index 277738826581..cb7e2523b6de 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -56,9 +56,7 @@ config HVM
>           def_bool y
>   
>   config NEW_VGIC
> -	bool
> -	prompt "Use new VGIC implementation"
> -	select NEEDS_LIST_SORT
> +	bool "Use new VGIC implementation"
>   	---help---
>   
>   	This is an alternative implementation of the ARM GIC interrupt
> diff --git a/xen/common/Kconfig b/xen/common/Kconfig
> index 3e2cf2508899..0661328a99e7 100644
> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -66,9 +66,6 @@ config MEM_ACCESS
>   config NEEDS_LIBELF
>   	bool
>   
> -config NEEDS_LIST_SORT
> -	bool
> -
>   menu "Speculative hardening"
>   
>   config SPECULATIVE_HARDEN_ARRAY
> diff --git a/xen/common/Makefile b/xen/common/Makefile
> index 083f62acb634..52d3c2aa9384 100644
> --- a/xen/common/Makefile
> +++ b/xen/common/Makefile
> @@ -21,7 +21,6 @@ obj-y += keyhandler.o
>   obj-$(CONFIG_KEXEC) += kexec.o
>   obj-$(CONFIG_KEXEC) += kimage.o
>   obj-y += lib.o
> -obj-$(CONFIG_NEEDS_LIST_SORT) += list_sort.o
>   obj-$(CONFIG_LIVEPATCH) += livepatch.o livepatch_elf.o
>   obj-$(CONFIG_MEM_ACCESS) += mem_access.o
>   obj-y += memory.o
> diff --git a/xen/lib/Makefile b/xen/lib/Makefile
> index b8814361d63e..764f3624b5f9 100644
> --- a/xen/lib/Makefile
> +++ b/xen/lib/Makefile
> @@ -1,3 +1,4 @@
>   obj-$(CONFIG_X86) += x86/
>   
>   lib-y += ctype.o
> +lib-y += list-sort.o
> diff --git a/xen/common/list_sort.c b/xen/lib/list-sort.c
> similarity index 98%
> rename from xen/common/list_sort.c
> rename to xen/lib/list-sort.c
> index af2b2f6519f1..f8d8bbf28178 100644
> --- a/xen/common/list_sort.c
> +++ b/xen/lib/list-sort.c
> @@ -15,7 +15,6 @@
>    * this program; If not, see <http://www.gnu.org/licenses/>.
>    */
>   
> -#include <xen/lib.h>

... this is not mentionned.

>   #include <xen/list.h>
>   
>   #define MAX_LIST_LENGTH_BITS 20
> @@ -154,4 +153,3 @@ void list_sort(void *priv, struct list_head *head,
>   
>   	merge_and_restore_back_links(priv, cmp, head, part[max_lev], list);
>   }
> -EXPORT_SYMBOL(list_sort);
> 

Cheers,

-- 
Julien Grall

