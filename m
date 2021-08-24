Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38C933F5E64
	for <lists+xen-devel@lfdr.de>; Tue, 24 Aug 2021 14:50:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.171329.312641 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIVt0-0003JB-LK; Tue, 24 Aug 2021 12:50:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 171329.312641; Tue, 24 Aug 2021 12:50:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIVt0-0003HO-Hv; Tue, 24 Aug 2021 12:50:38 +0000
Received: by outflank-mailman (input) for mailman id 171329;
 Tue, 24 Aug 2021 12:50:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mIVsy-0003HG-Es
 for xen-devel@lists.xenproject.org; Tue, 24 Aug 2021 12:50:36 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mIVsx-0003Mz-JX; Tue, 24 Aug 2021 12:50:35 +0000
Received: from [54.239.6.177] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mIVsx-0006I6-DQ; Tue, 24 Aug 2021 12:50:35 +0000
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
	bh=2U7+iYwnj3IT4UlKYJURHPyIhaZA3etDjq8bwgj6zxs=; b=wksSXqFZcQnc6wqazl/3RbWrTF
	CBI4ha+SraQyozozbBwoqvMNEH/LPce4BBj6Tm64jiG9J6EmB1bTwsMz4F0OxCEN9DMatinm5XXnx
	2uAD6LhPSwP6h5TYY8whzMJckj6bGE8JTY4RG9zD5/ZLzyAQkAO6AGLzVNYXDEIYYM0Y=;
Subject: Re: [XEN PATCH v7 10/51] build,arm: move LDFLAGS change to arch.mk
To: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20210824105038.1257926-1-anthony.perard@citrix.com>
 <20210824105038.1257926-11-anthony.perard@citrix.com>
From: Julien Grall <julien@xen.org>
Message-ID: <b5c93c83-1d32-c71b-c4c5-36d2fc00dfa2@xen.org>
Date: Tue, 24 Aug 2021 13:50:33 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210824105038.1257926-11-anthony.perard@citrix.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Anthony,

Can you explain why this is moved?

Cheers,

On 24/08/2021 11:49, Anthony PERARD wrote:
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> ---
>   xen/arch/arm/Makefile | 8 --------
>   xen/arch/arm/arch.mk  | 8 ++++++++
>   2 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
> index 0edd9dee6f49..3d0af8ebc93c 100644
> --- a/xen/arch/arm/Makefile
> +++ b/xen/arch/arm/Makefile
> @@ -104,14 +104,6 @@ prelink.o: $(ALL_OBJS) $(ALL_LIBS) FORCE
>   	$(call if_changed,ld)
>   endif
>   
> -ifeq ($(CONFIG_ARM64_ERRATUM_843419),y)
> -    ifeq ($(call ld-option, --fix-cortex-a53-843419),n)
> -        $(warning ld does not support --fix-cortex-a53-843419; xen may be susceptible to erratum)
> -    else
> -        XEN_LDFLAGS += --fix-cortex-a53-843419
> -    endif
> -endif
> -
>   targets += prelink.o
>   
>   $(TARGET)-syms: prelink.o xen.lds
> diff --git a/xen/arch/arm/arch.mk b/xen/arch/arm/arch.mk
> index 11caec86ba14..6a2982059486 100644
> --- a/xen/arch/arm/arch.mk
> +++ b/xen/arch/arm/arch.mk
> @@ -17,3 +17,11 @@ $(call cc-option-add,CFLAGS-$(CONFIG_ARM_64),CC,-mno-outline-atomics)
>   ifneq ($(filter command line environment,$(origin CONFIG_EARLY_PRINTK)),)
>       $(error You must use 'make menuconfig' to enable/disable early printk now)
>   endif
> +
> +ifeq ($(CONFIG_ARM64_ERRATUM_843419),y)
> +    ifeq ($(call ld-option, --fix-cortex-a53-843419),n)
> +        $(warning ld does not support --fix-cortex-a53-843419; xen may be susceptible to erratum)
> +    else
> +        LDFLAGS += --fix-cortex-a53-843419
> +    endif
> +endif
> 

-- 
Julien Grall

