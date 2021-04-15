Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5B53360BB3
	for <lists+xen-devel@lfdr.de>; Thu, 15 Apr 2021 16:21:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.111254.212757 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lX2rm-0007qp-OA; Thu, 15 Apr 2021 14:21:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 111254.212757; Thu, 15 Apr 2021 14:21:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lX2rm-0007qQ-Kq; Thu, 15 Apr 2021 14:21:10 +0000
Received: by outflank-mailman (input) for mailman id 111254;
 Thu, 15 Apr 2021 14:21:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lX2rk-0007qL-Gh
 for xen-devel@lists.xenproject.org; Thu, 15 Apr 2021 14:21:08 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lX2ri-0001Oh-Dz; Thu, 15 Apr 2021 14:21:06 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lX2ri-0006IB-7L; Thu, 15 Apr 2021 14:21:06 +0000
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
	bh=+uVQDutjgs9HFtTvZJCsDAxLH4DRxrhwezFtx44M4JY=; b=DywMfr/f+QSOD+Peuz0+JXGcC6
	+apB7c8XIKknmS17T4uoKasDL0Ijl7MuBj4IxF3csR8MQpmm5M5sdafO99n8EvcguNUBNx8uk3oKo
	77egiibCco6p/GbvvrooLiVrNFGEZf6Sg96jBtYMaCNp+iJ+yhGbFG8iXAVb0M5YVvNE=;
Subject: Re: [PATCH v3 14/15] xen/decompress: drop STATIC and INIT
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <2db91183-a7de-0c43-2fef-feb3523ed19b@suse.com>
 <b9410d49-8767-a6f2-ccbe-c94e451c60ba@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <e36f9026-edb6-5eb3-fdb2-cd00750b3ee7@xen.org>
Date: Thu, 15 Apr 2021 15:21:04 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <b9410d49-8767-a6f2-ccbe-c94e451c60ba@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 26/01/2021 09:53, Jan Beulich wrote:
> All users have been removed in earlier changes.

This is not entirely correct given there is a still a user of...

> 
> Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> v3: New.
> 
> --- a/xen/arch/arm/efi/efi-dom0.c
> +++ b/xen/arch/arm/efi/efi-dom0.c
> @@ -28,7 +28,7 @@
>   #include <asm/setup.h>
>   #include <asm/acpi.h>
>   #include "../../../common/decompress.h"
> -#define XZ_EXTERN STATIC
> +#define XZ_EXTERN static

STATIC here. So maybe you want to say "all but one users"?

Also, for consistency, I think you want to either remove INITDATA here 
or remove INIT in the patch that drop the last user.

Cheers,

>   #include "../../../common/xz/crc32.c"
>   
>   /* Constant to indicate "Xen" in unicode u16 format */
> --- a/xen/common/decompress.h
> +++ b/xen/common/decompress.h
> @@ -7,9 +7,6 @@
>   #include <xen/types.h>
>   #include <xen/xmalloc.h>
>   
> -#define STATIC static
> -#define INIT __init
> -
>   #define malloc xmalloc_bytes
>   #define free xfree
>   
> @@ -18,9 +15,6 @@
>   
>   #else
>   
> -#define STATIC static
> -#define INIT
> -
>   #undef __init /* tools/libs/guest/xg_private.h has its own one */
>   #define __init
>   #define __initdata
> 
> 

-- 
Julien Grall

