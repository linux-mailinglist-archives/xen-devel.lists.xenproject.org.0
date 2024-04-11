Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ABB648A0773
	for <lists+xen-devel@lfdr.de>; Thu, 11 Apr 2024 07:08:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.703748.1099596 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rumep-0002Sw-UI; Thu, 11 Apr 2024 05:07:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 703748.1099596; Thu, 11 Apr 2024 05:07:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rumep-0002Qp-RY; Thu, 11 Apr 2024 05:07:31 +0000
Received: by outflank-mailman (input) for mailman id 703748;
 Thu, 11 Apr 2024 05:07:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=llhl=LQ=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rumen-0002Qj-T1
 for xen-devel@lists.xenproject.org; Thu, 11 Apr 2024 05:07:29 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 63ad7860-f7c1-11ee-94a3-07e782e9044d;
 Thu, 11 Apr 2024 07:07:27 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 6E3944EE0739;
 Thu, 11 Apr 2024 07:07:26 +0200 (CEST)
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
X-Inumbo-ID: 63ad7860-f7c1-11ee-94a3-07e782e9044d
MIME-Version: 1.0
Date: Thu, 11 Apr 2024 07:07:26 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, George Dunlap
 <George.Dunlap@citrix.com>, Jan Beulich <JBeulich@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Juergen
 Gross <jgross@suse.com>, "consulting @ bugseng . com"
 <consulting@bugseng.com>, Roberto Bagnara <roberto.bagnara@bugseng.com>,
 Federico Serafini <federico.serafini@bugseng.com>
Subject: Re: [PATCH] xen/spinlock: Adjust LOCK_DEBUG_INITVAL to placate MISRA
In-Reply-To: <20240410193531.1499128-1-andrew.cooper3@citrix.com>
References: <20240410193531.1499128-1-andrew.cooper3@citrix.com>
Message-ID: <a8d51ec13809acfde7c463c53290b74d@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2024-04-10 21:35, Andrew Cooper wrote:
> Resolves an R7.2 violation.
> 

Thanks, I was going to suggest the same change. This will resolve the 
failure of the CI MISRA analysis on GitLab.

Reviewed-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

> Fixes: c286bb93d20c ("xen/spinlock: support higher number of cpus")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: George Dunlap <George.Dunlap@citrix.com>
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Julien Grall <julien@xen.org>
> CC: Juergen Gross <jgross@suse.com>
> CC: consulting@bugseng.com <consulting@bugseng.com>
> CC: Roberto Bagnara <roberto.bagnara@bugseng.com>
> CC: Federico Serafini <federico.serafini@bugseng.com>
> CC: Nicola Vetrini <nicola.vetrini@bugseng.com>
> ---
>  xen/include/xen/spinlock.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/xen/include/xen/spinlock.h b/xen/include/xen/spinlock.h
> index db00a24646bd..18793c5e29cb 100644
> --- a/xen/include/xen/spinlock.h
> +++ b/xen/include/xen/spinlock.h
> @@ -13,7 +13,7 @@
>  #ifdef CONFIG_DEBUG_LOCKS
>  union lock_debug {
>      uint32_t val;
> -#define LOCK_DEBUG_INITVAL 0xffffffff
> +#define LOCK_DEBUG_INITVAL 0xffffffffU
>      struct {
>          unsigned int cpu:SPINLOCK_CPU_BITS;
>  #define LOCK_DEBUG_PAD_BITS (30 - SPINLOCK_CPU_BITS)
> 
> base-commit: 0e7ea8ca5fc9bce9248414f6aaf2dc861abd45d9
> prerequisite-patch-id: 8d06e56c5d8a52f1387e1f5a7fce6a94b8c4a1ed
> prerequisite-patch-id: 13355d26254b979c79de456c9a6ea6a9c639ba63

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

