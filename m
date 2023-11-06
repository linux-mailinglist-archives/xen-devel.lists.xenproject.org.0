Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A78CA7E3038
	for <lists+xen-devel@lfdr.de>; Mon,  6 Nov 2023 23:57:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.628509.980057 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r08XE-0002w2-Nb; Mon, 06 Nov 2023 22:57:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 628509.980057; Mon, 06 Nov 2023 22:57:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r08XE-0002tZ-Kw; Mon, 06 Nov 2023 22:57:32 +0000
Received: by outflank-mailman (input) for mailman id 628509;
 Mon, 06 Nov 2023 22:57:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1r08XD-0002tT-R4
 for xen-devel@lists.xenproject.org; Mon, 06 Nov 2023 22:57:31 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r08XC-0007dT-Tb; Mon, 06 Nov 2023 22:57:30 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r08XC-0007xY-Kq; Mon, 06 Nov 2023 22:57:30 +0000
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
	bh=k1W35WbMFZsKcoShx29lagZp4A9j3oSQ7wkLX5qxz/c=; b=jorTpUY64SPbOcrkjVb+jVwhVa
	pxNH/2AqADOatsnkeaYeGDXIAUDYf0Ob5iiBvnZOxWtppBQZU14ADq7x1fE0OLB5rJLjwYdw3XhKf
	1HcpCI3ZOstKEKj/NOcQnNrHC+Ra0/ZPqFs609lSKbYk4h/XePLmoD+ohFWD49+vKlUU=;
Message-ID: <ef60f721-f784-4595-8866-e1c57da7e48f@xen.org>
Date: Mon, 6 Nov 2023 22:57:26 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH][for-4.19] xen: replace occurrences of SAF-1-safe with
 asmlinkage attribute
To: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com, jbeulich@suse.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <334b360fada7177e0b6e074fbdd33e02ce186b8f.1699034672.git.nicola.vetrini@bugseng.com>
Content-Language: en-GB
From: Julien Grall <julien@xen.org>
In-Reply-To: <334b360fada7177e0b6e074fbdd33e02ce186b8f.1699034672.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Nicola,

On 03/11/2023 18:05, Nicola Vetrini wrote:
> The comment-based justifications for MISRA C:2012 Rule 8.4 are replaced
> by the asmlinkage pseudo-attribute, for the sake of uniformity.
> The deviation with a comment based on the SAF framework is also
> mentioned as a last resort.

I don't see any reason to keep SAF-1 after this patch. So can this be 
removed?

> 
> Add missing 'xen/compiler.h' #include-s where needed.
> 
> The text in docs/misra/deviations.rst is modified to reflect this change.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> ---
>   docs/misra/deviations.rst   |  6 +++---
>   xen/arch/arm/cpuerrata.c    |  7 +++----
>   xen/arch/arm/setup.c        |  5 ++---
>   xen/arch/arm/smpboot.c      |  3 +--
>   xen/arch/arm/traps.c        | 21 +++++++--------------
>   xen/arch/x86/boot/cmdline.c |  5 +++--
>   xen/arch/x86/boot/reloc.c   |  7 ++++---
>   xen/arch/x86/extable.c      |  3 +--
>   xen/arch/x86/setup.c        |  3 +--
>   xen/arch/x86/traps.c        | 27 +++++++++------------------
>   xen/common/efi/boot.c       |  5 ++---
>   11 files changed, 36 insertions(+), 56 deletions(-)
> 
> diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
> index d468da2f5ce9..ed5d36c08647 100644
> --- a/docs/misra/deviations.rst
> +++ b/docs/misra/deviations.rst
> @@ -134,9 +134,9 @@ Deviations related to MISRA C:2012 Rules:
>        - Tagged as `safe` for ECLAIR.
>   
>      * - R8.4
> -     - Functions and variables used only by asm modules are either marked with
> -       the `asmlinkage` macro or with a SAF-1-safe textual deviation
> -       (see safe.json).

I thought we agreed to a different wording [1]. So is this really based 
on last version?

> +     - Functions and variables used only to interface with asm modules should
> +       be marked with the `asmlinkage` macro. If that's not possible, consider
> +       using the SAF-1-safe textual deviation (see safe.json).

See above. Actually, I am a bit surprised that SAF-1 is still mentioned 
given that I have now requested multiple that it should be removed and I 
haven't yet seen a reason to keep it.

Cheers,

[1] 
https://lore.kernel.org/all/b914ac93-2499-4bfd-a60a-51a9f1c170ec@xen.org/

-- 
Julien Grall

