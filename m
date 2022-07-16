Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A66C576F99
	for <lists+xen-devel@lfdr.de>; Sat, 16 Jul 2022 17:06:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.368780.600181 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oCjNO-0005GH-3Q; Sat, 16 Jul 2022 15:06:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 368780.600181; Sat, 16 Jul 2022 15:06:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oCjNO-0005Da-0d; Sat, 16 Jul 2022 15:06:38 +0000
Received: by outflank-mailman (input) for mailman id 368780;
 Sat, 16 Jul 2022 15:06:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oCjNM-0005DT-Hl
 for xen-devel@lists.xenproject.org; Sat, 16 Jul 2022 15:06:36 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oCjNM-0007by-8S; Sat, 16 Jul 2022 15:06:36 +0000
Received: from home.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oCjNM-0007T6-2f; Sat, 16 Jul 2022 15:06:36 +0000
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
	bh=v9RHWzfCywtNJsLWIO9efdXoki6IitgFnhsbuPUMKIQ=; b=CZbPp65WsLQDo10vsn34lDgaLM
	HeP+j4ocS1bizDsI+ClpS7J+k7QUAd927PPSEz/6wdQ5qJ2QCQ711gCgsqU35ziZ/MeQMPtGCISwz
	VpMfI7zvoLA+yeUHh3/gWgXURIlLRXb1hOROlYWhQYnXuDb66NjDlHSS8ibKbruv/3Mw=;
Message-ID: <fea296b1-76e4-f8f1-77fc-274309b54a38@xen.org>
Date: Sat, 16 Jul 2022 16:06:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PATCH V7 1/2] xen/arm: Harden the P2M code in
 p2m_remove_mapping()
To: Oleksandr Tyshchenko <olekstysh@gmail.com>, xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Julien Grall <jgrall@amazon.com>
References: <20220716145658.4175730-1-olekstysh@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220716145658.4175730-1-olekstysh@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Oleksandr,

In the future, please provide a cover letter (even if it is short) when 
you bundle multiple patches. This is useful to make generic comments and 
help threading in e-mail client (each patch would be a subthread of 0 
rather than 1).

On 16/07/2022 15:56, Oleksandr Tyshchenko wrote:
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> Borrow the x86's check from p2m_remove_page() which was added
> by the following commit: c65ea16dbcafbe4fe21693b18f8c2a3c5d14600e
> "x86/p2m: don't assert that the passed in MFN matches for a remove"
> and adjust it to the Arm code base.
> 
> Basically, this check will be strictly needed for the xenheap pages
> after applying a subsequent commit which will introduce xenheap based
> M2P approach on Arm. But, it will be a good opportunity to harden
> the P2M code for *every* RAM pages since it is possible to remove
> any GFN - MFN mapping currently on Arm (even with the wrong helpers).
> 
> Suggested-by: Julien Grall <jgrall@amazon.com>
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> ---
> You can find the corresponding discussion at:
> https://lore.kernel.org/xen-devel/82d8bfe0-cb46-d303-6a60-2324dd76a1f7@xen.org/
> https://lore.kernel.org/xen-devel/1652294845-13980-2-git-send-email-olekstysh@gmail.com/
> 
> Changes V6 -> V7:
>     - make this commit to be the first
>     - update commit description and add a comment in code
> ---
>   xen/arch/arm/p2m.c | 28 ++++++++++++++++++++++++++++
>   1 file changed, 28 insertions(+)
> 
> diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
> index d00c2e462a..2a0d383df4 100644
> --- a/xen/arch/arm/p2m.c
> +++ b/xen/arch/arm/p2m.c
> @@ -1308,11 +1308,39 @@ static inline int p2m_remove_mapping(struct domain *d,
>                                        mfn_t mfn)
>   {
>       struct p2m_domain *p2m = p2m_get_hostp2m(d);
> +    unsigned long i;
>       int rc;
>   
>       p2m_write_lock(p2m);
> +    /*
> +     * Before removing the GFN - MFN mapping for any RAM pages make sure
> +     * that there is no difference between what is already mapped and what
> +     * is requested to be unmapped.
> +     * If they don't match bail out early. For instance, this could happen
> +     * if two CPUs are requesting to unmap the same P2M concurrently.

Missing word: P2M *entry*

Other than that:

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

