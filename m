Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AA71B219BA
	for <lists+xen-devel@lfdr.de>; Tue, 12 Aug 2025 02:20:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1078199.1439198 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulcjy-0002rU-R9; Tue, 12 Aug 2025 00:19:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1078199.1439198; Tue, 12 Aug 2025 00:19:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulcjy-0002p8-OM; Tue, 12 Aug 2025 00:19:46 +0000
Received: by outflank-mailman (input) for mailman id 1078199;
 Tue, 12 Aug 2025 00:19:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UEr3=2Y=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1ulcjx-0002p2-L1
 for xen-devel@lists.xenproject.org; Tue, 12 Aug 2025 00:19:45 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 085f8cbc-7712-11f0-b898-0df219b8e170;
 Tue, 12 Aug 2025 02:19:39 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1754957974051186.28010670768845;
 Mon, 11 Aug 2025 17:19:34 -0700 (PDT)
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
X-Inumbo-ID: 085f8cbc-7712-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; t=1754957976; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Bahxkm0PdaqpSMEfKKX5t1z49Dzm1mFMp/I6sxW3BcZ5M4DBxpcNWWyBF0He1fFjoS9cXJ6nL7cHCkWMGcjg9OX2CmcJrFhx8x228HKxrZvIBAMHfMumGFwDHMz68yfOwOpYmm3AABF9GHbgWVi9tP55eFA6I6Fy7MGNvrZOq00=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1754957976; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=/SnaI2kkQcPBgygS5Sgb5bJ3hy/qubZcZmGgG7Rzm5E=; 
	b=RQ75dhdNBySYYmEY0tbmMsYWajjSFU8CxTzGY97mxWZOjmGMoFo0VZJf+RKfL2PYb1Cnewq1x977cnUA6x9U1JplPOly3qaGxtxDY4hpnyyM6hl+vF/Rzfq8oGtl7m1E7/E+1fFNRumqoVb65oZQNKrQK61zlocY0l6nGsQsnQA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1754957976;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=/SnaI2kkQcPBgygS5Sgb5bJ3hy/qubZcZmGgG7Rzm5E=;
	b=mfNqG1Q8CaVVKVdAPPH9Ogun+TqfLGa63lHFYujBusLe52lPzUlFFxBCWnG7d9ZO
	eq6DhtHDC/0qu1nbUa6k0M/nq7yLWKUjEck/EQ27ci7dSmL1HkngiCTQl5McLTck0oJ
	maBEhRSa5M5KXZkDrlP+AK3uvM+HriBvfWmjyN70=
Message-ID: <761b584a-51fb-403d-948e-3366501cea50@apertussolutions.com>
Date: Mon, 11 Aug 2025 20:19:32 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] EFI/runtime: switch to xv[mz]alloc_array()
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Marek Marczykowski <marmarek@invisiblethingslab.com>
References: <41b7e14c-59ef-40f5-8c43-69bdc5fb4531@suse.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Autocrypt: addr=dpsmith@apertussolutions.com; keydata=
 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
In-Reply-To: <41b7e14c-59ef-40f5-8c43-69bdc5fb4531@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 7/23/25 09:39, Jan Beulich wrote:
> Use the more "modern" form, thus doing away with effectively open-coding
> xmalloc_array() at the same time. While there is a difference in
> generated code, as xmalloc_bytes() forces SMP_CACHE_BYTES alignment, if
> code really cared about such higher than default alignment, it should
> request so explicitly.

While I don't object to the change itself, I think this description is a 
bit over simplification of the change. If the allocation is under 
PAGE_SIZE, then they are equivalent, but if it is over the page size 
there are a few more differences than just cache alignment. It 
completely changes the underlying allocator. I personally also find it a 
bit of a stretch to call xmalloc_bytes(size) an open coded version of 
xmalloc_array(char, size).

> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> v3: Use xv[mz]alloc_array().
> 
> --- a/xen/common/efi/runtime.c
> +++ b/xen/common/efi/runtime.c
> @@ -6,6 +6,7 @@
>   #include <xen/irq.h>
>   #include <xen/sections.h>
>   #include <xen/time.h>
> +#include <xen/xvmalloc.h>
>   
>   DEFINE_XEN_GUEST_HANDLE(CHAR16);
>   
> @@ -500,23 +501,23 @@ int efi_runtime_call(struct xenpf_efi_ru
>           len = gwstrlen(guest_handle_cast(op->u.get_variable.name, CHAR16));
>           if ( len < 0 )
>               return len;
> -        name = xmalloc_array(CHAR16, ++len);
> +        name = xvmalloc_array(CHAR16, ++len);
>           if ( !name )
>              return -ENOMEM;
>           if ( __copy_from_guest(name, op->u.get_variable.name, len) ||
>                wmemchr(name, 0, len) != name + len - 1 )
>           {
> -            xfree(name);
> +            xvfree(name);
>               return -EIO;
>           }
>   
>           size = op->u.get_variable.size;
>           if ( size )
>           {
> -            data = xmalloc_bytes(size);
> +            data = xvmalloc_array(unsigned char, size);
>               if ( !data )
>               {
> -                xfree(name);
> +                xvfree(name);
>                   return -ENOMEM;
>               }
>           }
> @@ -539,8 +540,8 @@ int efi_runtime_call(struct xenpf_efi_ru
>           else
>               rc = -EOPNOTSUPP;
>   
> -        xfree(data);
> -        xfree(name);
> +        xvfree(data);
> +        xvfree(name);
>       }
>       break;
>   
> @@ -553,17 +554,17 @@ int efi_runtime_call(struct xenpf_efi_ru
>           len = gwstrlen(guest_handle_cast(op->u.set_variable.name, CHAR16));
>           if ( len < 0 )
>               return len;
> -        name = xmalloc_array(CHAR16, ++len);
> +        name = xvmalloc_array(CHAR16, ++len);
>           if ( !name )
>              return -ENOMEM;
>           if ( __copy_from_guest(name, op->u.set_variable.name, len) ||
>                wmemchr(name, 0, len) != name + len - 1 )
>           {
> -            xfree(name);
> +            xvfree(name);
>               return -EIO;
>           }
>   
> -        data = xmalloc_bytes(op->u.set_variable.size);
> +        data = xvmalloc_array(unsigned char, op->u.set_variable.size);
>           if ( !data )
>               rc = -ENOMEM;
>           else if ( copy_from_guest(data, op->u.set_variable.data,
> @@ -581,8 +582,8 @@ int efi_runtime_call(struct xenpf_efi_ru
>               efi_rs_leave(&state);
>           }
>   
> -        xfree(data);
> -        xfree(name);
> +        xvfree(data);
> +        xvfree(name);
>       }
>       break;
>   
> @@ -598,13 +599,13 @@ int efi_runtime_call(struct xenpf_efi_ru
>               return -EINVAL;
>   
>           size = op->u.get_next_variable_name.size;
> -        name.raw = xzalloc_bytes(size);
> +        name.raw = xvzalloc_array(unsigned char, size);
>           if ( !name.raw )
>               return -ENOMEM;
>           if ( copy_from_guest(name.raw, op->u.get_next_variable_name.name,
>                                size) )
>           {
> -            xfree(name.raw);
> +            xvfree(name.raw);
>               return -EFAULT;
>           }
>   
> @@ -629,7 +630,7 @@ int efi_runtime_call(struct xenpf_efi_ru
>           else
>               rc = -EOPNOTSUPP;
>   
> -        xfree(name.raw);
> +        xvfree(name.raw);
>       }
>       break;
>   

With a stronger description of the change,

Acked-by: Daniel P. Smith <dpsmith@apertussolutions.com>

