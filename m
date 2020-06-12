Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 536D11F77BE
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2020 14:15:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jjiaM-0003fQ-C7; Fri, 12 Jun 2020 12:15:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Kdnc=7Z=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jjiaK-0003fL-Gy
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2020 12:15:00 +0000
X-Inumbo-ID: 5639caca-aca6-11ea-b5be-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5639caca-aca6-11ea-b5be-12813bfff9fa;
 Fri, 12 Jun 2020 12:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JsXxqUF/QPhgsow/SIQLFdeZsE3FOY3Yzo/7lnvuEK0=; b=D6+AG0ZkAIQIsSa1haHkoRclBE
 sIAMifvbOsCG+LITssSJo17m1G9X9FQTBFSa7aWJqM6OKFahzrxAlIJe0FbiwJ96T0HubVKJgeGvX
 MYPMOZejc7YtbJIp7Q7wUGP4twAUFd2qOSP1K5dgBM+6oL4LTnoOiMoY6M6SpbkKpQhU=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jjiaI-0000SV-Oh; Fri, 12 Jun 2020 12:14:58 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jjiaI-00051v-DY; Fri, 12 Jun 2020 12:14:58 +0000
Subject: Re: [PATCH 2/2] xen/arm: Support runstate crossing pages
To: Bertrand Marquis <bertrand.marquis@arm.com>, xen-devel@lists.xenproject.org
References: <cover.1591806713.git.bertrand.marquis@arm.com>
 <b4843bd234d4ece4f843bc636071106746abb3b5.1591806713.git.bertrand.marquis@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <0ea51410-050b-58a6-806a-b175f534852f@xen.org>
Date: Fri, 12 Jun 2020 13:14:56 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <b4843bd234d4ece4f843bc636071106746abb3b5.1591806713.git.bertrand.marquis@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: nd@arm.com, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi,

On 11/06/2020 12:58, Bertrand Marquis wrote:
> Add support for runstate area register with the structure crossing pages

Well, this has always been supported until your previous patch. In 
general, we try to not break thing in a middle of the series so we can 
still bisect it.

I think this patch can be simplified a lot by mapping the two page 
contiguously (see my previous answer). With that it would be feasible to 
fold this patch in #1.

> The code is storing up to 2 pages reference during the hypercall.
> During a context switch, the code is computing where the
> state_entry_time is and is breaking the memcpy in 2 parts when it is
> required.
> 
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
>   xen/arch/arm/domain.c        | 101 +++++++++++++++++++++++++----------
>   xen/include/asm-arm/domain.h |   5 +-
>   2 files changed, 76 insertions(+), 30 deletions(-)
> 
> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> index 739059234f..d847cb00f2 100644
> --- a/xen/arch/arm/domain.c
> +++ b/xen/arch/arm/domain.c
> @@ -280,11 +280,16 @@ void arch_cleanup_runstate_guest(struct vcpu *v)
>   {
>       spin_lock(&v->arch.runstate_guest.lock);
>   
> -    /* cleanup previous page if any */
> -    if ( v->arch.runstate_guest.page )
> +    /* cleanup previous pages if any */
> +    if ( v->arch.runstate_guest.page[0] )
>       {
> -        put_page_and_type(v->arch.runstate_guest.page);
> -        v->arch.runstate_guest.page = NULL;
> +        put_page_and_type(v->arch.runstate_guest.page[0]);
> +        v->arch.runstate_guest.page[0] = NULL;
> +        if ( v->arch.runstate_guest.page[1] )
> +        {
> +            put_page_and_type(v->arch.runstate_guest.page[1]);
> +            v->arch.runstate_guest.page[1] = NULL;
> +        }

I think this can be moved outside of the first if.

>           v->arch.runstate_guest.offset = 0;
>       }
>   
> @@ -294,26 +299,25 @@ void arch_cleanup_runstate_guest(struct vcpu *v)
>   int arch_setup_runstate_guest(struct vcpu *v,
>                               struct vcpu_register_runstate_memory_area area)
>   {
> -    struct page_info *page;
> +    struct page_info *page[2] = {NULL,NULL};

I don't think you need the temporary variable. You can directly update 
page[0] as it is protected by the lock. The nice benefits is you could 
take advantage of a common helper to cleanup and reduce the complexity 
of the code.

>       unsigned offset;
>   
>       spin_lock(&v->arch.runstate_guest.lock);
>   
> -    /* cleanup previous page if any */
> -    if ( v->arch.runstate_guest.page )
> +    /* cleanup previous pages if any */
> +    if ( v->arch.runstate_guest.page[0] )
>       {
> -        put_page_and_type(v->arch.runstate_guest.page);
> -        v->arch.runstate_guest.page = NULL;
> +        put_page_and_type(v->arch.runstate_guest.page[0]);
> +        v->arch.runstate_guest.page[0] = NULL;
> +        if ( v->arch.runstate_guest.page[1] )
> +        {
> +            put_page_and_type(v->arch.runstate_guest.page[1]);
> +            v->arch.runstate_guest.page[1] = NULL;
> +        }
>           v->arch.runstate_guest.offset = 0;
>       }
>   
>       offset = ((vaddr_t)area.addr.v) & ~PAGE_MASK;
> -    if ( offset > (PAGE_SIZE - sizeof(struct vcpu_runstate_info)) )
> -    {
> -        spin_unlock(&v->arch.runstate_guest.lock);
> -        gprintk(XENLOG_DEBUG, "Runstate is crossing pages\n");
> -        return -EINVAL;
> -    }
>   
>       /* provided address must be aligned to a 64bit */
>       if ( offset % alignof(struct vcpu_runstate_info) )
> @@ -323,15 +327,30 @@ int arch_setup_runstate_guest(struct vcpu *v,
>           return -EINVAL;
>       }
>   
> -    page = get_page_from_gva(v, (vaddr_t)area.addr.v, GV2M_WRITE);
> -    if ( !page )
> +    page[0] = get_page_from_gva(v, (vaddr_t)area.addr.v, GV2M_WRITE);
> +    if ( !page[0] )
>       {
>           spin_unlock(&v->arch.runstate_guest.lock);
>           gprintk(XENLOG_DEBUG, "Runstate pointer is not mapped\n");
>           return -EINVAL;
>       }
>   
> -    v->arch.runstate_guest.page = page;
> +    if ( offset > (PAGE_SIZE - sizeof(struct vcpu_runstate_info)) )
> +    {
> +        /* guest area is crossing pages */
> +        page[1] = get_page_from_gva(v, (vaddr_t)area.addr.v + PAGE_SIZE,
> +                                        GV2M_WRITE);
> +        if ( !page[1] )
> +        {
> +            put_page_and_type(v->arch.runstate_guest.page[0]);
v->arch.runstate_guest.page[0] would be NULL as you set it afterwards. 
So you want to set v->arch.runstate_guest.page[0] beforehand.

Cheers,

-- 
Julien Grall

