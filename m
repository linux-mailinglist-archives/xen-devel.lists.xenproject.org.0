Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F3DBB13935
	for <lists+xen-devel@lfdr.de>; Mon, 28 Jul 2025 12:49:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1061293.1426809 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugLPr-0005zh-94; Mon, 28 Jul 2025 10:49:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1061293.1426809; Mon, 28 Jul 2025 10:49:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugLPr-0005xH-6S; Mon, 28 Jul 2025 10:49:11 +0000
Received: by outflank-mailman (input) for mailman id 1061293;
 Mon, 28 Jul 2025 10:49:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YAI4=2J=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ugLPq-0005ws-Hl
 for xen-devel@lists.xenproject.org; Mon, 28 Jul 2025 10:49:10 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7cbd9c7f-6ba0-11f0-b895-0df219b8e170;
 Mon, 28 Jul 2025 12:49:08 +0200 (CEST)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4538bc52a8dso31312935e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 28 Jul 2025 03:49:08 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45870555065sm154862275e9.15.2025.07.28.03.49.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Jul 2025 03:49:06 -0700 (PDT)
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
X-Inumbo-ID: 7cbd9c7f-6ba0-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1753699747; x=1754304547; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Qaf9Ts+/2Miso5mFWsXYj8YlFeFNLGQdGfr+C608ZBU=;
        b=q4adOexUZhYA4x7Oi1vcMr1SNuIhVKKFgSNXk/9NO+GS7w6QdZZRXiVnTn2elehn5z
         1Wa9bU1WeVK5r5z3/wRCD5ShgNfUjtAGyfIbkp/F/Wo13mXQn/YeNjt4GtADzyPfrF10
         WYaQPTnerKxGCrTE+/BNXnI48/Whkj5docXfA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753699747; x=1754304547;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qaf9Ts+/2Miso5mFWsXYj8YlFeFNLGQdGfr+C608ZBU=;
        b=UGhlJrmT+iskv+q5Sfpb5iJHVI40knOHEMacWZBvyuiHXfAu2hGXgqOje0edeq68P7
         wxHsKDOBweJMLRWxpyMJOhvKIJSHO25RLsh+Sxep40hNLU/PInFUQyiX4SigZ2pYRz+y
         2rDk1baGwN40aexz+bTgB/AeB30rJiTKTd9Jna9tj4tNtiUc5gfkR8IStH1FeXWmAYOi
         MUYpOARB9SXQZwwgCRBIctbFbMAIeY+lEUXjn3X8wDw89vXsKjRPR+0sHSlmT5erTqba
         PFSsXf7NN6zfOA4gGqAUF7pV+Kf/TKifb622HCz/NlZ5hcT+HkiULeKaeLT8VrAYTRVy
         qTFA==
X-Forwarded-Encrypted: i=1; AJvYcCXcM0pP0DyS64fTKkjpPyzq3zvAB6eGYWXR2YvmzaglLk3hISloAkGYFmlSLZq+Th/8UbKf8uuAAqg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxzxL0CeQSAo/OxtYnSTnMi7fzp8tktVqNE0IytTHnfx25qJzs7
	3upU9mNS/Dx5NwuK5SnC61SJcRbUwnumeRCdhwEbdol7vBOdODtCRFmtTot9S52sbGF/shlMQ9Y
	uLTBzRas=
X-Gm-Gg: ASbGnctuTgKpTUcjyyiXr+g8QRJFFN0hgeR5ebJrDq/iG9LmG+sW//bfd7fnrJM/QcK
	U/dK8YqRZKxO5eMI9BMIqmXRGcO8oslgPkHfMZRmwX2MB+/cumWNFgoO+SvrC2d0gSQc67EY70D
	sjyh5n4p99xfNzsBSkLYpIfkWJ2gD3thUvDNcE6jMb6kVIFQY6SAj4ZEXEe7NlijRhWOmaQfN5p
	R0c8FkFkzyHqhV6xxInKYN3NjGeCYV5nrEoZBkC22e4O/njw0EzAmxRnHrSEQRrx05T0MgYFIrp
	gT1gTlVwunBBEqBr4Ffb9x8ikVTWrMxC85l33Hc2JoTJccYH9gKIQztf8nO6pKPtbXhVFCGVG1K
	3iR/0YhAuLBLy0IJ5P9wvJHqrBdVvGFtwHEzmgQ6Nd2bTDhAAnyvU6lWgFudWIthK0Qeo
X-Google-Smtp-Source: AGHT+IFsnG+PxyYCG6pZF3F1xKqjOk0Y69URHRfAVsZBwTX1nMB5CPBdJ8TASjauzxzj5hidGZ/6pg==
X-Received: by 2002:a05:600c:468d:b0:456:1d4e:c14f with SMTP id 5b1f17b1804b1-4587655601cmr79273045e9.28.1753699747485;
        Mon, 28 Jul 2025 03:49:07 -0700 (PDT)
Message-ID: <43bea8dd-fbd3-4a64-ad9c-aac5813c15a9@citrix.com>
Date: Mon, 28 Jul 2025 11:49:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] misra: deviate explicit cast for Rule 11.1
To: Jan Beulich <jbeulich@suse.com>,
 Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>,
 "consulting@bugseng.com" <consulting@bugseng.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <181a03d5c7625d42c06cf9fa0cf48a9bc6825361.1753647875.git.dmytro_prokopchuk1@epam.com>
 <093601d7-691a-48ee-a0f4-2e86a0f2015e@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <093601d7-691a-48ee-a0f4-2e86a0f2015e@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 28/07/2025 10:56 am, Jan Beulich wrote:
> On 27.07.2025 22:27, Dmytro Prokopchuk1 wrote:
>> Explicitly cast 'halt_this_cpu' when passing it
>> to 'smp_call_function' to match the required
>> function pointer type '(void (*)(void *info))'.
>>
>> Document and justify a MISRA C R11.1 deviation
>> (explicit cast).
>>
>> Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
> All you talk about is the rule that you violate by adding a cast. But what is
> the problem you're actually trying to resolve by adding a cast?
>
>> --- a/xen/arch/arm/shutdown.c
>> +++ b/xen/arch/arm/shutdown.c
>> @@ -25,7 +25,8 @@ void machine_halt(void)
>>      watchdog_disable();
>>      console_start_sync();
>>      local_irq_enable();
>> -    smp_call_function(halt_this_cpu, NULL, 0);
>> +    /* SAF-15-safe */
>> +    smp_call_function((void (*)(void *))halt_this_cpu, NULL, 0);
> Now this is the kind of cast that is very dangerous. The function's signature
> changing will go entirely unnoticed (by the compiler) with such a cast in place.

I agree.  This code is *far* safer in practice without the cast, than
with it.

> If Misra / Eclair are unhappy about such an extra (benign here) attribute, I'd
> be interested to know what their suggestion is to deal with the situation
> without making the code worse (as in: more risky). I first thought about having
> a new helper function that then simply chains to halt_this_cpu(), yet that
> would result in a function which can't return, but has no noreturn attribute.

I guess that Eclair cannot know what an arbitrary attribute does and
whether it impacts the ABI, but it would be lovely if Eclair could be
told "noreturn is a safe attribute to differ on"?

~Andrew

