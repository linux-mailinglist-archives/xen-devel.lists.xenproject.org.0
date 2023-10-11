Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F4F77C54CA
	for <lists+xen-devel@lfdr.de>; Wed, 11 Oct 2023 15:06:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.615502.956771 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqYub-0003N6-2S; Wed, 11 Oct 2023 13:06:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 615502.956771; Wed, 11 Oct 2023 13:06:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqYua-0003KZ-VS; Wed, 11 Oct 2023 13:06:04 +0000
Received: by outflank-mailman (input) for mailman id 615502;
 Wed, 11 Oct 2023 13:06:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uJaT=FZ=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qqYuY-0003KB-Tp
 for xen-devel@lists.xenproject.org; Wed, 11 Oct 2023 13:06:02 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ed2b343b-6836-11ee-9b0d-b553b5be7939;
 Wed, 11 Oct 2023 15:06:01 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id C011B4EE0747;
 Wed, 11 Oct 2023 15:06:00 +0200 (CEST)
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
X-Inumbo-ID: ed2b343b-6836-11ee-9b0d-b553b5be7939
MIME-Version: 1.0
Date: Wed, 11 Oct 2023 15:06:00 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com, jbeulich@suse.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, George Dunlap
 <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Wei Liu
 <wl@xen.org>
Subject: Re: [XEN PATCH][for-4.19] xen/include: make enum perfcounter
 anonymous
In-Reply-To: <d739fefde6f142cec10899ed2c5eb81f91618bf0.1697028983.git.nicola.vetrini@bugseng.com>
References: <d739fefde6f142cec10899ed2c5eb81f91618bf0.1697028983.git.nicola.vetrini@bugseng.com>
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <43412e2e1c5c4bce181cb624e4201aa9@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 11/10/2023 15:03, Nicola Vetrini wrote:
> Using enumerators declared in a named enum, such as the one modified,
> as operands to arithmetic operators is not allowed by MISRA C:2012 Rule 
> 10.1.
> The enumerators of an anonymous enum can be used instead.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> ---
> This violation manifeststs itself, for instance, in all uses of macro
> 'perfc_incra' from xen/include/xen/perfc.h, because the expansion
> contains an arithmetic operation on two enum constants from enum 
> perfcounter.
> 
> ( (*nr) <= PERFC_LAST_hypercalls - PERFC_hypercalls ?  [...]
> 
> ---
>  docs/misra/rules.rst    | 3 +++
>  xen/include/xen/perfc.h | 2 +-
>  2 files changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
> index 3139ca7ae6dd..26c3ff819948 100644
> --- a/docs/misra/rules.rst
> +++ b/docs/misra/rules.rst
> @@ -341,6 +341,9 @@ maintainers if you want to suggest a change.
>             compilers' extensions)
>           - Implicit conversions to boolean for conditionals (?: if 
> while
>             for) and logical operators (! || &&)
> +         - The essential type model allows the constants defined by 
> anonymous
> +           enums (e.g., enum { A, B, C }) to be used as operands to 
> arithmetic
> +           operators, as they have a signed essential type.
> 
>     * - `Rule 10.2
> <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_10_02.c>`_
>       - Required
> diff --git a/xen/include/xen/perfc.h b/xen/include/xen/perfc.h
> index 7c5ce537bd02..96022c07481e 100644
> --- a/xen/include/xen/perfc.h
> +++ b/xen/include/xen/perfc.h
> @@ -39,7 +39,7 @@
>  #define PERFSTATUS       PERFCOUNTER
>  #define PERFSTATUS_ARRAY PERFCOUNTER_ARRAY
> 
> -enum perfcounter {
> +enum {
>  #include <xen/perfc_defn.h>
>  	NUM_PERFCOUNTERS
>  };
> --
> 2.34.1

See [1] for a discussion on the possible alternatives to this approach.

[1] https://marc.info/?l=xen-devel&m=169658364229813

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

