Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B4CAAC057D
	for <lists+xen-devel@lfdr.de>; Thu, 22 May 2025 09:19:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.993004.1376453 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uI0Ci-0003w9-Mo; Thu, 22 May 2025 07:19:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 993004.1376453; Thu, 22 May 2025 07:19:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uI0Ci-0003tT-Jz; Thu, 22 May 2025 07:19:00 +0000
Received: by outflank-mailman (input) for mailman id 993004;
 Thu, 22 May 2025 07:18:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ix6t=YG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uI0Ch-0003tN-IP
 for xen-devel@lists.xenproject.org; Thu, 22 May 2025 07:18:59 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 07376f60-36dd-11f0-a2fb-13f23c93f187;
 Thu, 22 May 2025 09:18:58 +0200 (CEST)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-601a6e2e93cso307849a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 22 May 2025 00:18:58 -0700 (PDT)
Received: from [10.1.248.227] ([80.188.125.198])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6005ac336d5sm10164316a12.54.2025.05.22.00.18.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 May 2025 00:18:57 -0700 (PDT)
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
X-Inumbo-ID: 07376f60-36dd-11f0-a2fb-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747898338; x=1748503138; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZHg8jAWMsjn/TRzGwfRbrlJdxdRRRX7STo4YvNJ5bz4=;
        b=ScOeXgG5z/K1dG82hs17Hh7dzpDozxk5K5NmFXAm5f9ucoCzfGfDp57bu3lucLkifX
         rljpV0cRUawVZ/mkOurhv/8IIe3zJ2oxcUEMiVHOXMcANwjbFUqPYLMFXreqVW6P6oaY
         w4YIk2NqoiHq5eNMyouG2v0GtLS8fehfRPvtFpezjEm1MoXoX1rZQ2wS3I0TeGA9mL5T
         OFQBza24C7AMbgb0BWpzMvj5PIdpE6bPY3ON7wGgeBZWBP8WXqxrzBvfCyPxnDlIITzK
         lSqyc/+FpDksVzfxI9yxzNr4dI7a6Mv+zEWLD0/Iv2KRcctNe5CPuZ9JAmCJycPdLoiy
         DKsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747898338; x=1748503138;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZHg8jAWMsjn/TRzGwfRbrlJdxdRRRX7STo4YvNJ5bz4=;
        b=SvedKNMBlpOHP3Lr3448RbW5KHgYTeZvcEgvZN6tBuqjmr77qWdNfYP03xZetV30yT
         wEkLaCFZRXGpbjOUPsb7iU4iqu2tGY4GyKTPtWs7xU9nsSaR+DLDwNLzQ4CLRq5dlYmI
         39/sse/RpT/vLb/0LbcFy9aX2NDbkFFoUZ6lkTT0461w/c23n5weloVZ2QbzaaPsdUPq
         RoDTBo5Gn5w4+glkm4/Sy0hcT4x93rUe01mr5kZckiNS/jO+RuMhlLhaWwwPlYi5wDfQ
         7+L1nzhk28YdqnE4HmPr9bwzRbFkp6ietgfjX6UqxUDzJIoUzPiLPq2iQsIqNP7zG13g
         Nqvg==
X-Forwarded-Encrypted: i=1; AJvYcCWiwq4D73Fz7Q7oxxsk+aeQ106sicvGRqaq68bjymsBIPpd+3vvw8zS++o7ti31Z2hekjB73NuiU0M=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx+38EYd08VUG0XStdvx8iljaGe6XB6HMIj1TZPxbW+3XU9C07w
	Qkx8BEOaLqR2DftpyohYwGHy8ZgH850IRZe0VNNmQuUg0N5SQW4u9g7+rqbXZVMj2Q==
X-Gm-Gg: ASbGncvzeYnN4wVJ7Qrw2z4O8V6HLVoWjV6ZX43hdKTXTzpfVTuMIA1DI5ur+JmFBdu
	2cSwm5vKl66cC2Sx0dqHPtMYPPl7je7xKzzxeZpedfJxhxEcJFfOXhJA3ABpoVbapfayp7M8s4p
	U50FvtHgMw/Z77lsKaVa834Jsrib9M0TOWLEIPlV8/ipWtPt4IIG+l8BxbmTyVXzYVTH13nFMvR
	GO8KCI8bRsN5LiKNhveAcqu1PKI8Jq9T79vpg8l+nNQc2di6s3dsRV1GaCE3a6PnQRo5wFYnCdR
	j/tfEQBOg6bbjeW10zL0+GDUi7808c7nnQvUMFC2GALVTsZLOaf9QLraL7PqoA==
X-Google-Smtp-Source: AGHT+IHbEXoqV52g6auTF/erLKPQy6wOtHwLeKZIVhzZ/zB5lzS28WKiH9+DF8XT84vgGOb0L5H3Jg==
X-Received: by 2002:a50:a446:0:b0:601:470b:6d47 with SMTP id 4fb4d7f45d1cf-601470b6e9emr15326667a12.1.1747898338092;
        Thu, 22 May 2025 00:18:58 -0700 (PDT)
Message-ID: <8a39ec76-f050-488e-bf4c-ba378fae7275@suse.com>
Date: Thu, 22 May 2025 09:18:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] x86/boot: attempt to print trace and panic on AP
 bring up stall
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20250521165504.89885-1-roger.pau@citrix.com>
 <20250521165504.89885-3-roger.pau@citrix.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20250521165504.89885-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.05.2025 18:55, Roger Pau Monne wrote:
> --- a/xen/arch/x86/traps.c
> +++ b/xen/arch/x86/traps.c
> @@ -714,13 +714,15 @@ static cpumask_t show_state_mask;
>  static bool opt_show_all;
>  boolean_param("async-show-all", opt_show_all);
>  
> +static bool force_show_all;
> +
>  static int cf_check nmi_show_execution_state(
>      const struct cpu_user_regs *regs, int cpu)
>  {
>      if ( !cpumask_test_cpu(cpu, &show_state_mask) )
>          return 0;
>  
> -    if ( opt_show_all )
> +    if ( opt_show_all || force_show_all )
>          show_execution_state(regs);
>      else if ( guest_mode(regs) )
>          printk(XENLOG_ERR "CPU%d\t%pv\t%04x:%p in guest\n",
> @@ -734,6 +736,40 @@ static int cf_check nmi_show_execution_state(
>      return 1;
>  }
>  
> +void show_execution_state_nmi(const cpumask_t *mask, bool show_all)
> +{
> +    unsigned int msecs, pending;
> +
> +    force_show_all = show_all;

Both forms of the call can, aiui, in principle race with one another.
I think you want to avoid setting the static to false once it was set
to true.

Furthermore, as long as all calls here with the 2nd argument being
true are followed by panic() or alike, I see no reason why you couldn't
simply re-use opt_show_all, setting that one to true. (Or else there
would then also be some resetting of the new static.)

Jan

