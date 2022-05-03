Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23445518B50
	for <lists+xen-devel@lfdr.de>; Tue,  3 May 2022 19:44:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.319839.540260 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nlwZG-0002RD-18; Tue, 03 May 2022 17:44:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 319839.540260; Tue, 03 May 2022 17:44:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nlwZF-0002Pm-T4; Tue, 03 May 2022 17:44:09 +0000
Received: by outflank-mailman (input) for mailman id 319839;
 Tue, 03 May 2022 17:44:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nlwZE-0002Pa-Bs
 for xen-devel@lists.xenproject.org; Tue, 03 May 2022 17:44:08 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nlwZD-0000Bs-Mg; Tue, 03 May 2022 17:44:07 +0000
Received: from [54.239.6.185] (helo=[192.168.2.157])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nlwZD-0005EE-Ge; Tue, 03 May 2022 17:44:07 +0000
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
	bh=AJTxtIsZiRzarCT1oQta/EtUbVEGwPc7KZaUCcC4/X4=; b=HosHuBnQ4BSpOkfsCZ8WUsc/tU
	uBYnKe+rSBIbOQ2/ECqyPle4NZ+I2lDif5hLJwf+Lbpiu2R5udYBd0WBydl28wq3NJz53+zqB39Uh
	Bn0tv0ylLMpyPN0C5o9kRRTqWMtQ73rszc0IaJ6xAM4dAit6lCnzFYIZskfwq9mOQPQc=;
Message-ID: <074a5ae8-cade-3343-0c18-8122c85fecc3@xen.org>
Date: Tue, 3 May 2022 18:44:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.1
Subject: Re: [PATCH v2] xen/arm: gnttab: cast unused macro arguments to void
To: Michal Orzel <michal.orzel@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220428094625.382970-1-michal.orzel@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220428094625.382970-1-michal.orzel@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 28/04/2022 10:46, Michal Orzel wrote:
> Function unmap_common_complete (common/grant_table.c) defines and sets
> a variable ld that is later on passed to a macro:
> gnttab_host_mapping_get_page_type().
> On Arm this macro does not make use of any arguments causing a compiler
> to warn about unused-but-set variable (when -Wunused-but-set-variable
> is enabled). Fix it by casting the arguments to void in macro's body.
> 
> While there, take the opportunity to modify other macros in this file
> that do not make use of all the arguments to prevent similar issues in
> the future.
> 
> Signed-off-by: Michal Orzel <michal.orzel@arm.com>
> ---
> Changes since v1:
> -standalone patch carved out from a series (other patches already merged)
> -v1 was ([3/8] gnttab: Remove unused-but-set variable)
> -modify macro on Arm instead of removing ld variable
> ---
>   xen/arch/arm/include/asm/grant_table.h | 13 ++++++++-----
>   1 file changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/xen/arch/arm/include/asm/grant_table.h b/xen/arch/arm/include/asm/grant_table.h
> index d31a4d6805..5bcd1ec528 100644
> --- a/xen/arch/arm/include/asm/grant_table.h
> +++ b/xen/arch/arm/include/asm/grant_table.h
> @@ -31,10 +31,11 @@ static inline void gnttab_mark_dirty(struct domain *d, mfn_t mfn)
>   
>   int create_grant_host_mapping(unsigned long gpaddr, mfn_t mfn,
>                                 unsigned int flags, unsigned int cache_flags);
> -#define gnttab_host_mapping_get_page_type(ro, ld, rd) (0)
> +#define gnttab_host_mapping_get_page_type(ro, ld, rd) \
> +    ((void)(ro), (void)(ld), (void)(rd), 0)

I would switch to a static inline helper:

static inline bool
gnttab_host_mapping_get_page_type(bool ro, struct domain *ld,
			          struct domian *rd)
{
	return false;
}

Note the switch from 0 to false as the function is technically returning 
a boolean (see the x86 implementation).

>   int replace_grant_host_mapping(unsigned long gpaddr, mfn_t mfn,
>                                  unsigned long new_gpaddr, unsigned int flags);
> -#define gnttab_release_host_mappings(domain) 1
> +#define gnttab_release_host_mappings(domain) ((void)(domain), 1)

Same here.

>   
>   /*
>    * The region used by Xen on the memory will never be mapped in DOM0
> @@ -89,10 +90,12 @@ int replace_grant_host_mapping(unsigned long gpaddr, mfn_t mfn,
>   })
>   
>   #define gnttab_shared_gfn(d, t, i)                                       \
> -    (((i) >= nr_grant_frames(t)) ? INVALID_GFN : (t)->arch.shared_gfn[i])
> +    ((void)(d),                                                          \
> +     ((i) >= nr_grant_frames(t)) ? INVALID_GFN : (t)->arch.shared_gfn[i])
>   
> -#define gnttab_status_gfn(d, t, i)                                       \
> -    (((i) >= nr_status_frames(t)) ? INVALID_GFN : (t)->arch.status_gfn[i])
> +#define gnttab_status_gfn(d, t, i)                                        \
> +    ((void)(d),                                                           \
> +     ((i) >= nr_status_frames(t)) ? INVALID_GFN : (t)->arch.status_gfn[i])

I share Jan's opinion here. If we want to evaluate d, then we should 
make sure t and i should be also evaluated once. However, IIRC, they 
can't be turned to static inline because the type of t (struct 
grant_table) is not fully defined yet.

Cheers

-- 
Julien Grall

