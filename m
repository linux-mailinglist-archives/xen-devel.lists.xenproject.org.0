Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BBC97F81B7
	for <lists+xen-devel@lfdr.de>; Fri, 24 Nov 2023 20:01:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.640897.999688 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6bP8-0001t3-9N; Fri, 24 Nov 2023 18:59:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 640897.999688; Fri, 24 Nov 2023 18:59:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6bP8-0001pi-6C; Fri, 24 Nov 2023 18:59:54 +0000
Received: by outflank-mailman (input) for mailman id 640897;
 Fri, 24 Nov 2023 18:59:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AaTM=HF=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1r6bP6-0001pc-Rx
 for xen-devel@lists.xenproject.org; Fri, 24 Nov 2023 18:59:52 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a538a13b-8afb-11ee-98e2-6d05b1d4d9a1;
 Fri, 24 Nov 2023 19:59:51 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-40b27726369so15571635e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 24 Nov 2023 10:59:51 -0800 (PST)
Received: from [10.80.4.253] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 fa20-20020a05600c519400b0040b3e26872dsm773963wmb.8.2023.11.24.10.59.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Nov 2023 10:59:50 -0800 (PST)
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
X-Inumbo-ID: a538a13b-8afb-11ee-98e2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1700852390; x=1701457190; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+2EqA3WKOTSi5sA1kRGPuHa/SCPopUzZMkbh8doNGpM=;
        b=gLYerTWPlp5jp5BICpmfx3Fl6qXMyxajZMA5xiOCGCqa3/1A2cecbaQCcOGOJrK3GC
         p+SEIZjEkycA9kWjxnh4w9QR3NjtQu1gnFnVirtH18GL8kmTHGMcI8fBXsc6u7YBjcww
         FicI8BWRezlv83kP+sVdSyyhNfFuYnCGmgbSs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700852390; x=1701457190;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+2EqA3WKOTSi5sA1kRGPuHa/SCPopUzZMkbh8doNGpM=;
        b=BfcccvGVjWU/7gOLSmTpKy8SB5DKuFk0sErRp6c7HbP/Om8n58QLOQv6iH03k8ScfY
         qWSrGlcKKB8+kshL15y8XodADZmAcea4O7/DuBG1OLRI5HUIT6zE9huV147SIE4UivNp
         0VSaM3N97u4Z1xOXOfmp0LXRN4CTYZsGEJseylUfEoXcM3xahxM7ekqzs8nKTAThqSp1
         2dREkR9m7heCTDNQAZlpbT08Qu66pD1WDTh7X7HA+7BomIf3nV0+J6tUWz6DlYz7UtLo
         efnZpUQ9zcn9Rz9jUpNZAx7+SBFoc/afTKMSlukGzgtT0mbJdfTKN7dfQa99tDZ5ISLr
         hPWw==
X-Gm-Message-State: AOJu0Yzes4A+RIBeOucMWDTxhzaF1G5wFQAI1f7kTlI5J3kLkDDcnCe2
	X1p8/MN+yE2JBfe7+FYa9J37cA==
X-Google-Smtp-Source: AGHT+IHj/zvi6D47ADsJGM3PYFy56y/bmnIPWsH9JDgLsf9vuSH0jL4tRhy24u6JYTD3Ww4nMobCqA==
X-Received: by 2002:a05:600c:1c0d:b0:40b:3d92:de42 with SMTP id j13-20020a05600c1c0d00b0040b3d92de42mr1393465wms.8.1700852390488;
        Fri, 24 Nov 2023 10:59:50 -0800 (PST)
Message-ID: <e31f93a7-5270-4c09-8ada-c9bc24172c70@cloud.com>
Date: Fri, 24 Nov 2023 18:59:48 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/13] xen/spinlock: introduce new type for recursive
 spinlocks
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: javi.merino@cloud.com, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Paul Durrant <paul@xen.org>
References: <20231120113842.5897-1-jgross@suse.com>
 <20231120113842.5897-5-jgross@suse.com>
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
In-Reply-To: <20231120113842.5897-5-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20/11/2023 11:38, Juergen Gross wrote:
> Introduce a new type "rspinlock_t" to be used for recursive spinlocks.
> 
> For now it is only an alias of spinlock_t, so both types can still be
> used for recursive spinlocks. This will be changed later, though.
> 
> Switch all recursive spinlocks to the new type.
> 
> Define the initializer helpers and use them where appropriate.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
> V2:
> - carved out from V1 patch
> ---
>   xen/arch/x86/include/asm/mm.h |  2 +-
>   xen/arch/x86/mm/mm-locks.h    |  2 +-
>   xen/common/domain.c           |  4 ++--
>   xen/common/ioreq.c            |  2 +-
>   xen/drivers/char/console.c    |  4 ++--
>   xen/drivers/passthrough/pci.c |  2 +-
>   xen/include/xen/sched.h       |  6 +++---
>   xen/include/xen/spinlock.h    | 19 +++++++++++++++----
>   8 files changed, 26 insertions(+), 15 deletions(-)
> 
> diff --git a/xen/arch/x86/include/asm/mm.h b/xen/arch/x86/include/asm/mm.h
> index 05dfe35502..8a6e0c283f 100644
> --- a/xen/arch/x86/include/asm/mm.h
> +++ b/xen/arch/x86/include/asm/mm.h
> @@ -596,7 +596,7 @@ unsigned long domain_get_maximum_gpfn(struct domain *d);
>   
>   /* Definition of an mm lock: spinlock with extra fields for debugging */
>   typedef struct mm_lock {
> -    spinlock_t         lock;
> +    rspinlock_t        lock;

Considering it's rspinlock_t rather than spinlock_recursive, do we want
to change also mm_lock_recursive() and paging_lock_recursive() into
mm_rlock() and paging_rlock() ?


> diff --git a/xen/include/xen/spinlock.h b/xen/include/xen/spinlock.h
> index bbe1472571..19561d5e61 100644
> --- a/xen/include/xen/spinlock.h
> +++ b/xen/include/xen/spinlock.h
 > [snip]
> @@ -182,8 +191,10 @@ typedef struct spinlock {
>   #endif
>   } spinlock_t;
>   
> +typedef spinlock_t rspinlock_t;
>   
>   #define spin_lock_init(l) (*(l) = (spinlock_t)SPIN_LOCK_UNLOCKED)
> +#define rspin_lock_init(l) (*(l) = (rspinlock_t)SPIN_LOCK_UNLOCKED)

nit: Both variants of [r]spin_lock_init(l) could be inline functions
rather than macros.

Cheers,
Alejandro


