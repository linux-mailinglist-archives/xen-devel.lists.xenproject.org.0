Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B9B5192E1A
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2020 17:24:00 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jH8lv-0002TU-MF; Wed, 25 Mar 2020 16:20:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pb40=5K=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1jH8lu-0002TN-7n
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2020 16:20:50 +0000
X-Inumbo-ID: 969db3b8-6eb4-11ea-8652-12813bfff9fa
Received: from mail-wm1-f65.google.com (unknown [209.85.128.65])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 969db3b8-6eb4-11ea-8652-12813bfff9fa;
 Wed, 25 Mar 2020 16:20:49 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id m3so3441317wmi.0
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2020 09:20:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vTx0d24e5Kl6kZF4vq3XzEwm3s+1RN+YS6q9iohmBg0=;
 b=Wtz2oix/mR/crAMNwYMb/DoyvYqpxKsD6P129e5ka+qci+QHdA+0xdr1ZwS0gFL0Vs
 VnmGFpAu6w597X6b36ExDWtbeuPeQWKNn05mz2A4H9eGbOnsPuwcgWI8wjvxPR1ZuQy3
 dgqEtl6KW+OJiTn00Vp+TDRC1ylufKMdarPUuqTByDY2FSMWlEBZmOEisUhtrcMkoOFF
 AIA4gWQ41sia+5VBDnlSXPQyfKBDSIMfQRJ18VIIVos6gvV4CiDzUM5X4LuHojQnF1Lx
 LARmDVP8i44Mvf3jKcvX1mJrfLP/7fs02xOtEjNCiuwwptuIiALo0mBAjdqBqAaPr6Lg
 ZMLQ==
X-Gm-Message-State: ANhLgQ2zIY8JT0m+0/ycPE8tnYUug70vJVViotnIRXtoL1z1E2Tzuqu6
 TeCdwJoLDNp9QXqlkuKplF0=
X-Google-Smtp-Source: ADFU+vtfgRfFS+Yd7iHGFk/lC1PV8vCbH7Bey4U+5cQk8o+y6S3XiLxM7E6PXOslooHT52QAtSFwmA==
X-Received: by 2002:a1c:5502:: with SMTP id j2mr4203279wmb.93.1585153248438;
 Wed, 25 Mar 2020 09:20:48 -0700 (PDT)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-234.amazon.com.
 [54.240.197.234])
 by smtp.gmail.com with ESMTPSA id k18sm33571271wru.94.2020.03.25.09.20.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Mar 2020 09:20:47 -0700 (PDT)
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
References: <20200325105511.20882-1-jgross@suse.com>
 <20200325105511.20882-2-jgross@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <7328403f-9616-33a3-7908-6d19f45483e1@xen.org>
Date: Wed, 25 Mar 2020 16:20:46 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200325105511.20882-2-jgross@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Subject: Re: [Xen-devel] [PATCH v7 1/5] xen: introduce
 smp_mb__[after|before]_atomic() barriers
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Juergen,

On 25/03/2020 10:55, Juergen Gross wrote:
> When using atomic variables for synchronization barriers are needed
> to ensure proper data serialization. Introduce smp_mb__before_atomic()
> and smp_mb__after_atomic() as in the Linux kernel for that purpose.
> 
> Use the same definitions as in the Linux kernel.
> 
> Suggested-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

> ---
> V7:
> - new patch
> ---
>   xen/include/asm-arm/system.h | 3 +++
>   xen/include/asm-x86/system.h | 3 +++
>   2 files changed, 6 insertions(+)
> 
> diff --git a/xen/include/asm-arm/system.h b/xen/include/asm-arm/system.h
> index e5d062667d..65d5c8e423 100644
> --- a/xen/include/asm-arm/system.h
> +++ b/xen/include/asm-arm/system.h
> @@ -30,6 +30,9 @@
>   
>   #define smp_wmb()       dmb(ishst)
>   
> +#define smp_mb__before_atomic()    smp_mb()
> +#define smp_mb__after_atomic()     smp_mb()
> +
>   /*
>    * This is used to ensure the compiler did actually allocate the register we
>    * asked it for some inline assembly sequences.  Apparently we can't trust
> diff --git a/xen/include/asm-x86/system.h b/xen/include/asm-x86/system.h
> index 069f422f0d..7e5891f3df 100644
> --- a/xen/include/asm-x86/system.h
> +++ b/xen/include/asm-x86/system.h
> @@ -233,6 +233,9 @@ static always_inline unsigned long __xadd(
>   #define set_mb(var, value) do { xchg(&var, value); } while (0)
>   #define set_wmb(var, value) do { var = value; smp_wmb(); } while (0)
>   
> +#define smp_mb__before_atomic()    do { } while (0)
> +#define smp_mb__after_atomic()     do { } while (0)
> +
>   /**
>    * array_index_mask_nospec() - generate a mask that is ~0UL when the
>    *      bounds check succeeds and 0 otherwise
> 

-- 
Julien Grall

