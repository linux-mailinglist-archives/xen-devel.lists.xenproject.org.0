Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78AB23259FE
	for <lists+xen-devel@lfdr.de>; Thu, 25 Feb 2021 23:59:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.89996.170113 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFPam-00061s-7M; Thu, 25 Feb 2021 22:58:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 89996.170113; Thu, 25 Feb 2021 22:58:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFPam-00061W-3k; Thu, 25 Feb 2021 22:58:44 +0000
Received: by outflank-mailman (input) for mailman id 89996;
 Thu, 25 Feb 2021 22:58:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Mloc=H3=gmail.com=bobbyeshleman@srs-us1.protection.inumbo.net>)
 id 1lFPak-00061R-RG
 for xen-devel@lists.xenproject.org; Thu, 25 Feb 2021 22:58:42 +0000
Received: from mail-pl1-x631.google.com (unknown [2607:f8b0:4864:20::631])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5e8c302a-ed26-4765-a455-418dd2e5ed39;
 Thu, 25 Feb 2021 22:58:41 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id z7so4048803plk.7
 for <xen-devel@lists.xenproject.org>; Thu, 25 Feb 2021 14:58:41 -0800 (PST)
Received: from ?IPv6:2601:1c2:4f80:d230::5? ([2601:1c2:4f80:d230::5])
 by smtp.gmail.com with ESMTPSA id d10sm7228664pgl.72.2021.02.25.14.58.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Feb 2021 14:58:40 -0800 (PST)
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
X-Inumbo-ID: 5e8c302a-ed26-4765-a455-418dd2e5ed39
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=6li7BCgu0BeaMv5H6dr1yOY/I5ecVdAEH7WnmzvBhtE=;
        b=M7jX6zSfTjE0FmzLS11Hoo2aVFu8QYTZp/uRaPQK7IiJLIZQojVFFpgJTOSNhYDt7j
         oyK5zLcm/Bl5q37yX1VcVr9nTs9tw3kRWkxnWSti02excFutI2/D/aZnKhwB1A7WEQSL
         KEgqNKQrUzlHeBuk9XPZH+mJpwUMoIGST5GWv8R8rIbYf8DbUEUp8SF3cz9VlZMispGd
         c3Jc1N7BTSsiL5WitEs1h7pOd3SjisONfLR5u5afOsTi6Use42u/Dy5EDl7dD0KbL9ND
         ZCBBzD4o7WnejDtP9WAjnx2aiWyrE5oS8oymbLpgNvFVH91Au1+tss7pUimy2A3VaXTf
         40Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=6li7BCgu0BeaMv5H6dr1yOY/I5ecVdAEH7WnmzvBhtE=;
        b=e42OB1U3Av3e6InBMYdQkcPeBkufUde7AzGJ6M7wW0T4iP9B8hZr2TkyokoeS1EwtG
         012gBEkeJU49lZLugclpWPa1DzjloTuvz8QdO3T0TGPmHZ3NeiD6I8x+276oxsbkyRoT
         NgrfHlSNE7DnSpERlnoDuSeZcaADDDcFwzQPAk82/+ihrZbwpWew6kP57bQczNfTaxau
         t+qmHeX/mx1NbNoIgY6bYFNaise5KxclgRL/roUoxIKdWmszmfGeUouRlvLdujwjlRfL
         JTCdPaHoO00sD7L3HS5HW6sAaoxn1if2JKw/KMXVKSGBO2KmKmUdRDV09u8oupMUmUfK
         DVaQ==
X-Gm-Message-State: AOAM530T2Cmkvhz80CA+qA5WzpWeU/k7AeORxegcfWbzw4m/m24DZ3hd
	ie6ddCglPYkdThazE14dxf4=
X-Google-Smtp-Source: ABdhPJxOHoN3e8uu1fd4LQeW+bEGjeecBmRyRvJja23o4R/gi9IugVzYzClFVagfJ1NV+APziQs8iw==
X-Received: by 2002:a17:90a:ab10:: with SMTP id m16mr217923pjq.24.1614293920816;
        Thu, 25 Feb 2021 14:58:40 -0800 (PST)
Subject: Re: [PATCH for-next 3/6] xen/sched: Fix build when NR_CPUS == 1
To: Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>, Jan Beulich <jbeulich@suse.com>
References: <cover.1614265718.git.connojdavis@gmail.com>
 <d0922adc698ab76223d76a0a7f328a72cedf00ad.1614265718.git.connojdavis@gmail.com>
From: Bob Eshleman <bobbyeshleman@gmail.com>
Organization: Vates SAS
Message-ID: <71840112-790f-24b9-115c-9030c8521b65@gmail.com>
Date: Thu, 25 Feb 2021 14:55:45 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <d0922adc698ab76223d76a0a7f328a72cedf00ad.1614265718.git.connojdavis@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 2/25/21 7:24 AM, Connor Davis wrote:
> Return from cpu_schedule_up when either cpu is 0 or
> NR_CPUS == 1. This fixes the following:
> 
> core.c: In function 'cpu_schedule_up':
> core.c:2769:19: error: array subscript 1 is above array bounds
> of 'struct vcpu *[1]' [-Werror=array-bounds]
>  2769 |     if ( idle_vcpu[cpu] == NULL )
>       |
> 
> Signed-off-by: Connor Davis <connojdavis@gmail.com>
> ---
>  xen/common/sched/core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
> index 9745a77eee..f5ec65bf9b 100644
> --- a/xen/common/sched/core.c
> +++ b/xen/common/sched/core.c
> @@ -2763,7 +2763,7 @@ static int cpu_schedule_up(unsigned int cpu)
>      cpumask_set_cpu(cpu, &sched_res_mask);
>  
>      /* Boot CPU is dealt with later in scheduler_init(). */
> -    if ( cpu == 0 )
> +    if ( cpu == 0 || NR_CPUS == 1 )
>          return 0;
>  
>      if ( idle_vcpu[cpu] == NULL )
> 

Interesting.  I wonder when this changed in GCC.

I haven't yet seen this issue compiling with:
  NR_CPUS=1
  ARCH=riscv64
  riscv64-unknown-linux-gnu-gcc (GCC) 10.1.0

Which version of GCC are you seeing emit this?

- Bob

