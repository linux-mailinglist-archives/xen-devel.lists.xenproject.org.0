Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9C624B7924
	for <lists+xen-devel@lfdr.de>; Tue, 15 Feb 2022 22:00:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.273562.468800 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nK4w9-0008Nk-DD; Tue, 15 Feb 2022 21:00:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 273562.468800; Tue, 15 Feb 2022 21:00:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nK4w9-0008Md-9A; Tue, 15 Feb 2022 21:00:37 +0000
Received: by outflank-mailman (input) for mailman id 273562;
 Tue, 15 Feb 2022 21:00:35 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nK4w7-0008MX-HO
 for xen-devel@lists.xenproject.org; Tue, 15 Feb 2022 21:00:35 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nK4w6-000232-IB; Tue, 15 Feb 2022 21:00:34 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239] helo=[192.168.8.20])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nK4w6-0005GX-Bp; Tue, 15 Feb 2022 21:00:34 +0000
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
	bh=vbGF0RPcwfQm4WUX06EwAzgRMZPTh6YbvyHD6PK+ym0=; b=pN3393+P9KnqwsFJKGd6xVgDGO
	G32HT2pTtyHIWKpun9G3iHAORMn10vkWnkPeu/OWo1sMoBlcbqbImJ9WzfrEYab9/DF3jVQsUQ3FZ
	i2cWqLwno130WNNbD6vAH68w+WCTUCjNfV48yuF0awhmz0rzQFGhnPk7k5AC4aMArUyc=;
Message-ID: <35d82770-66cf-e030-5bcc-3c030e4463d7@xen.org>
Date: Tue, 15 Feb 2022 21:00:32 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.0
Subject: Re: [PATCH v2] lib: extend ASSERT()
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <75125344-b0e1-9663-4c1a-84bb35870fef@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <75125344-b0e1-9663-4c1a-84bb35870fef@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

(+ Bertrand)

Hi Jan,

On 27/01/2022 14:34, Jan Beulich wrote:
> The increasing amount of constructs along the lines of
> 
>      if ( !condition )
>      {
>          ASSERT_UNREACHABLE();
>          return;
>      }
> 
> is not only longer than necessary, but also doesn't produce incident
> specific console output (except for file name and line number).

So I agree that this construct will always result to a minimum 5 lines. 
Which is not nice. But the proposed change is...

> Allow
> the intended effect to be achieved with ASSERT(), by giving it a second
> parameter allowing specification of the action to take in release builds
> in case an assertion would have triggered in a debug one. The example
> above then becomes
> 
>      ASSERT(condition, return);
> 
> Make sure the condition will continue to not get evaluated when just a
> single argument gets passed to ASSERT().
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> v2: Rename new macro parameter.
> ---
> RFC: The use of a control flow construct as a macro argument may be
>       controversial.

indeed controversial. I find this quite confusing and not something I 
would request a user to switch to if they use the longer version.

That said, this is mainly a matter of taste. So I am interested to hear 
others view.

I have also CCed Bertrand to have an opinions from the Fusa Group (I 
suspect this will go backward for them).

> 
> --- a/xen/common/memory.c
> +++ b/xen/common/memory.c
> @@ -826,11 +826,7 @@ int xenmem_add_to_physmap(struct domain
>       union add_to_physmap_extra extra = {};
>       struct page_info *pages[16];
>   
> -    if ( !paging_mode_translate(d) )
> -    {
> -        ASSERT_UNREACHABLE();
> -        return -EACCES;
> -    }
> +    ASSERT(paging_mode_translate(d), return -EACCES);
>   
>       if ( xatp->space == XENMAPSPACE_gmfn_foreign )
>           extra.foreign_domid = DOMID_INVALID;
> @@ -920,11 +916,7 @@ static int xenmem_add_to_physmap_batch(s
>        * call doesn't succumb to dead-code-elimination. Duplicate the short-circut
>        * from xatp_permission_check() to try and help the compiler out.
>        */
> -    if ( !paging_mode_translate(d) )
> -    {
> -        ASSERT_UNREACHABLE();
> -        return -EACCES;
> -    }
> +    ASSERT(paging_mode_translate(d), return -EACCES);
>   
>       if ( unlikely(xatpb->size < extent) )
>           return -EILSEQ;
> --- a/xen/include/xen/lib.h
> +++ b/xen/include/xen/lib.h
> @@ -49,11 +49,13 @@
>   #endif
>   
>   #ifndef NDEBUG
> -#define ASSERT(p) \
> +#define ASSERT(p, ...) \
>       do { if ( unlikely(!(p)) ) assert_failed(#p); } while (0)
>   #define ASSERT_UNREACHABLE() assert_failed("unreachable")
>   #else
> -#define ASSERT(p) do { if ( 0 && (p) ) {} } while (0)
> +#define ASSERT(p, failsafe...) do { \
> +        if ( !count_args(failsafe) || unlikely(!(p)) ) { failsafe; } \
> +    } while ( 0 )
>   #define ASSERT_UNREACHABLE() do { } while (0)
>   #endif
>   
> 

Cheers,

-- 
Julien Grall

