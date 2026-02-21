Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 9SXqKNSdmWlgVgMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sat, 21 Feb 2026 12:58:12 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BCE616CCA7
	for <lists+xen-devel@lfdr.de>; Sat, 21 Feb 2026 12:58:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1237912.1540041 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vtlc9-0005ry-0W; Sat, 21 Feb 2026 11:57:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1237912.1540041; Sat, 21 Feb 2026 11:57:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vtlc8-0005q4-To; Sat, 21 Feb 2026 11:57:36 +0000
Received: by outflank-mailman (input) for mailman id 1237912;
 Sat, 21 Feb 2026 11:57:35 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1vtlc7-0005py-JH
 for xen-devel@lists.xenproject.org; Sat, 21 Feb 2026 11:57:35 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1vtlc7-002jX2-0G;
 Sat, 21 Feb 2026 11:57:35 +0000
Received: from [2a02:8012:3a1:0:31fa:1b47:3c78:2265]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1vtlc6-0000YC-2k;
 Sat, 21 Feb 2026 11:57:34 +0000
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
	bh=ilZyp0t5vDwXdJuMj+0RKEbkM9xQjkzffh24FsW21yY=; b=yzE5DvSkCR1YppZGIjvU/A2b+d
	0avi4mEO8hMeBEg0YH+xEv+WpStdGpL9skNUA43GBaiCkh37/X8OyNwPI32W799O/u3BwMd/T/L15
	RD9ujKij2CzYG0Bg2BbSDZNvucaWC7CBdfCH97ClY5G3z1Eh9a1OEbthcYa3omW6+KVs=;
Message-ID: <f9996237-760b-4be5-be90-e935ff71284e@xen.org>
Date: Sat, 21 Feb 2026 11:57:32 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: Fix memory leak in xenmem_add_to_physmap_one
Content-Language: en-GB
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Xenia Ragiadakou <Xenia.Ragiadakou@amd.com>
References: <20260205125820.116555-1-michal.orzel@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20260205125820.116555-1-michal.orzel@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[xen.org:s=20200302mail];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS(0.00)[m:michal.orzel@amd.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:Xenia.Ragiadakou@amd.com,s:lists@lfdr.de];
	DMARC_NA(0.00)[xen.org];
	FORGED_SENDER(0.00)[julien@xen.org,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[julien@xen.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[xen.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2BCE616CCA7
X-Rspamd-Action: no action

Hi Michal,

For the subject title and part of the code, "memory leak" tends to imply 
the memory is lost forever and therefore can never be recovered. AFAIU, 
in your case, the memory will be freed when the domain is destroyed. I 
would suggest to clarify it so it doesn't sound like a security issue.

What about:

"xen/arm: mm: Release the old page reference in xenmem_add_to_physmap_one()"

On 05/02/2026 12:58, Michal Orzel wrote:
> When a guest maps pages via XENMEM_add_to_physmap to a GFN that already
> has an existing mapping, the old page at that GFN was not being removed,
> causing a memory leak. This affects all mapping spaces including
> XENMAPSPACE_shared_info, XENMAPSPACE_grant_table, and
> XENMAPSPACE_gmfn_foreign. The memory would be reclaimed on domain
> destruction.
> 
> Add logic to remove the previously mapped page before creating the new
> mapping, matching the x86 implementation approach.
> 
> Additionally, skip removal if the same MFN is being remapped.

Can you explain why we skip the removal but not the insertion in this case?

> 
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> ---
> I'm not sure where to point the Fixes tag to.
> ---
>   xen/arch/arm/mm.c | 32 +++++++++++++++++++++++++++++---
>   1 file changed, 29 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
> index 6df8b616e464..b9f1a493dcd7 100644
> --- a/xen/arch/arm/mm.c
> +++ b/xen/arch/arm/mm.c
> @@ -166,10 +166,11 @@ int xenmem_add_to_physmap_one(
>       unsigned long idx,
>       gfn_t gfn)
>   {
> -    mfn_t mfn = INVALID_MFN;
> +    mfn_t mfn = INVALID_MFN, mfn_old;
>       int rc;
>       p2m_type_t t;
>       struct page_info *page = NULL;
> +    struct p2m_domain *p2m = p2m_get_hostp2m(d);
>   
>       switch ( space )
>       {
> @@ -244,6 +245,33 @@ int xenmem_add_to_physmap_one(
>           return -ENOSYS;
>       }
>   
> +    /*
> +     * Remove previously mapped page if it was present, to avoid leaking
> +     * memory.
> +     */
> +    mfn_old = gfn_to_mfn(d, gfn);

I saw Jan mentionned the fact that we have two section with the P2M lock 
taken. But isn't it in fact 3 sections as gfn_to_mfn(d, gfn) also take a 
lock?

I am not against the idea of not solving the locking right now. But I 
think it would at least be good to document it so this doesn't come as a 
surprise.

> +
> +    if ( mfn_valid(mfn_old) )
> +    {
> +        if ( is_special_page(mfn_to_page(mfn_old)) )
> +        {
> +            /* Just unmap, don't free */
> +            p2m_write_lock(p2m);
> +            rc = p2m_set_entry(p2m, gfn, 1, INVALID_MFN,
> +                               p2m_invalid, p2m->default_access);
> +            p2m_write_unlock(p2m);
> +            if ( rc )
> +                return rc;

For here and the second "return" statement below. Above callers may have 
taken a reference on the new page. So shouldn't we drop it like this is 
done at the end of the function?

> +        }
> +        else if ( !mfn_eq(mfn, mfn_old) )
> +        {
> +            /* Normal domain memory is freed, to avoid leaking memory */

Based on the thread with Jan, is this statement actually correct? Could 
we reach this call with an MMIO (or event foreign mapping). In which 
case, I am guessing we could fail? If so, is this the intended behavior 
change?

Cheers,

-- 
Julien Grall


