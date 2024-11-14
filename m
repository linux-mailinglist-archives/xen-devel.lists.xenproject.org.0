Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C57F9C8EF4
	for <lists+xen-devel@lfdr.de>; Thu, 14 Nov 2024 17:00:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.836607.1252509 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBcG4-0003LX-6b; Thu, 14 Nov 2024 15:59:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 836607.1252509; Thu, 14 Nov 2024 15:59:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBcG4-0003JG-3Z; Thu, 14 Nov 2024 15:59:48 +0000
Received: by outflank-mailman (input) for mailman id 836607;
 Thu, 14 Nov 2024 15:59:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3TDs=SJ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tBcG2-0003JA-PN
 for xen-devel@lists.xenproject.org; Thu, 14 Nov 2024 15:59:46 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 749c65d0-a2a1-11ef-a0c7-8be0dac302b0;
 Thu, 14 Nov 2024 16:59:40 +0100 (CET)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5cf7aadc8b7so780180a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 14 Nov 2024 07:59:40 -0800 (PST)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cf79c1df6bsm678033a12.83.2024.11.14.07.59.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Nov 2024 07:59:38 -0800 (PST)
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
X-Inumbo-ID: 749c65d0-a2a1-11ef-a0c7-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo1MzAiLCJoZWxvIjoibWFpbC1lZDEteDUzMC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6Ijc0OWM2NWQwLWEyYTEtMTFlZi1hMGM3LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxNTk5OTgwLjMxMzE0Nywic2VuZGVyIjoiYW5kcmV3LmNvb3BlckBjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1731599980; x=1732204780; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=sAY4U0UvVCbnGzt7jDMkzZyyPWjNab+ZCpfAPvAY/LI=;
        b=TCzsj8o4iZY/0LDesF5JACZx3+ukKpWO/52cfrciufZMXOFOq++OAeVCAaMi2ueXv1
         oHJ2XRSYuzOC7Q65WkNQrc4Wef9Mc2A4LnYrD688+/iRcSjJUzcBOo2drCBZS079p2pL
         73/flNT+Zn4MqFSbwElZJi6rb3L4DYxwYXAr4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731599980; x=1732204780;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sAY4U0UvVCbnGzt7jDMkzZyyPWjNab+ZCpfAPvAY/LI=;
        b=r5msyGbhjr2jn8LArgICNbFf4ZSzbpz/GOSCG1vGy9jsADXxtq/LL6LRKOzTb1TOeo
         BR/XTk96BTyUGwxTrilmlcA8WfLK7Zr/a4OFRdoTYKWDszMMH3797vFyFduUvpW3IAGr
         AG3B3Tb+yoBtQqDXGsfMwRO6aBKTo65WaTvyHIvN2M3qMPmI0Lr6mtONBbBvvM+90uSC
         DNjpgnGtYS9XRUD+Pnb4mOVYj9YRBdBr9sm4ggBIsNf7plFwNb8hikpGEdQWD4yNzQeN
         BlV+BX7GKhMEayOx+cTShCf17Zr5wmmDtBV83GNXC+rGNEuqv7iBXdHsWofUg7w3YOEW
         TNFA==
X-Forwarded-Encrypted: i=1; AJvYcCUm8mJ84z9iIcx9q9B2Qsp9qjJdaFhIrP+uUeypFtW/jLMP11xvMQJv7mxOM1h4a3PQdDcSQ7c0pNE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyON8YQ3oO5nxxdKWs3k2jedx+pVIJZWGAUU6pf2xqW6HXmt1hF
	R+NL+hJ0e+AtgsJtkRXQQMB8UYb+l5CrTsXyq5w5xPe57K6JdNInZjEUh1KgTvg=
X-Google-Smtp-Source: AGHT+IFuRXEgMJQyVgTkpVCiWPpSP5c6mjCPRc5aUvuNKyB9X04IRHQcuYb1JFKMLEnEn/FBjNg1mw==
X-Received: by 2002:a05:6402:34c6:b0:5cf:77e4:75c0 with SMTP id 4fb4d7f45d1cf-5cf77e47630mr2384164a12.30.1731599979513;
        Thu, 14 Nov 2024 07:59:39 -0800 (PST)
Message-ID: <c9a24b52-6498-41e9-aa20-a3cc5c2b1027@citrix.com>
Date: Thu, 14 Nov 2024 15:59:37 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] x86/ucode: Remove the collect_cpu_info() call from
 parse_blob()
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20241112211915.1473121-1-andrew.cooper3@citrix.com>
 <20241112211915.1473121-2-andrew.cooper3@citrix.com>
 <f0072d5d-8626-4708-91a8-503a33e99ec5@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <f0072d5d-8626-4708-91a8-503a33e99ec5@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14/11/2024 11:11 am, Jan Beulich wrote:
> On 12.11.2024 22:19, Andrew Cooper wrote:
>> With the tangle of logic starting to come under control, it is now plain to
>> see that parse_blob()'s side effect of re-gathering the signature/revision is
>> pointless.
>>
>> The cpu_request_microcode() hooks need the signature only.  The BSP gathers
>> this in early_microcode_init(), the APs and S3 in microcode_update_cpu().
> That's microcode_update_one() after 502478bc1d9d if I'm not mistaken.

I wouldn't necessarily say "after".

microcode_update_cpu() has been the way the APs and S3 get this
information for ages, whether its in the function directly, or in an
immediate callee.

>  In the
> course of determining that I'm afraid I also found the first sentence of this
> paragraph rather misleading than helpful:

Do you mean "The cpu_request_microcode() hooks need the signature only" ?


> While it is true what is being said,
> in both cases it is collect_cpu_info() that is being invoked, retrieving both
> signature and revision. IOW logic needing the signature only doesn't really
> matter here (and the sentence made me hunt for cases where we would read just
> the signature, aiming at verifying that leaving the revision field unset
> would indeed not be a problem).

It probably doesn't come as a surprise that I'm intending to rework
collect_cpu_info() entirely.  It's a mess.

The signature and platform flags are invariants for a CPU.  (In fact,
Platform Flags had better be the same for an entire system).  The
revision does change with type, but apply_microcode() keeps it up to date.

Yet we had logic which was throwing the details away and re-gathering
(which is quite expensive) for basically every microcode operation.


What I'm trying to express is "this information is collected once at the
start of day, and kept up to date, so collect_cpu_info() should not be
called under any other circumstance".

Perhaps I should just say that directly?



>>  For
>> good measure, the apply_microcode() hooks also keep the revision correct as
>> load attempts are made.
>>
>> This finally gets us down to a single call per CPU on boot / S3 resume, and no
>> calls during late-load hypercalls.
>>
>> No functional change.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Preferably with the problematic sentence dropped or clarified:
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks.

