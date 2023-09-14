Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D1A7A0EB4
	for <lists+xen-devel@lfdr.de>; Thu, 14 Sep 2023 22:05:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.602696.939428 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgsaV-000110-If; Thu, 14 Sep 2023 20:05:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 602696.939428; Thu, 14 Sep 2023 20:05:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgsaV-0000yX-FJ; Thu, 14 Sep 2023 20:05:19 +0000
Received: by outflank-mailman (input) for mailman id 602696;
 Thu, 14 Sep 2023 20:05:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uqVP=E6=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1qgsaU-0000yP-3j
 for xen-devel@lists.xenproject.org; Thu, 14 Sep 2023 20:05:18 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 05a42108-533a-11ee-8788-cb3800f73035;
 Thu, 14 Sep 2023 22:05:16 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-401d6f6b2e0so16216805e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 14 Sep 2023 13:05:16 -0700 (PDT)
Received: from [10.80.67.28] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 z25-20020a1c4c19000000b003fe29f6b61bsm2801946wmf.46.2023.09.14.13.05.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Sep 2023 13:05:15 -0700 (PDT)
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
X-Inumbo-ID: 05a42108-533a-11ee-8788-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1694721916; x=1695326716; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3vId4sGLx2eHjI1TRIXVKBBQP34DBKTvr1CrE3vZyMI=;
        b=tNugVZ7uc8xqg2EBSHUq+i8vuxttGRm2zY9z7UX3H7V972/Xz9JlwWvlQNoWNXWlKj
         NlZiJjtroyAiBhSc+1zFtcsp5fR3bO/y5Ra0Wk+nqdr5AfUFwEm3i3nkl8DNqj7LaBeF
         emUc0o1cmADH4E4OZ+cOUkX3fYX2PZVVjawvU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694721916; x=1695326716;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3vId4sGLx2eHjI1TRIXVKBBQP34DBKTvr1CrE3vZyMI=;
        b=xIrND11xBG/iu2WJZJLon6q+5fUsDIBVHk/R/wnH1ITRZ8gVHSrdRhu9aduRINv1T5
         xCqU8z7ajy+q9c0NAPlFt2afI00CAPGa4elg+t+fqfVS1kxCAc75ii9zvC1GK2MduWDx
         zA3C17stq86AbFSmB3Vhk0dkQTAM6bRqMCmVuzpDItm5LMhj9AbQeiG/qyTYBwK51gi4
         GLRs2mrHYNJDH/v3bGJG1qQlRsSsAW0cayX6L9A/LuBqIabkXqbkeCdUcI5oxhbieebk
         oWQFX0SEjTlRkEjjMPanhG4juP0dklOGGq1iCJSfGRQ2xiIlKz7StzoQL8i2T8nHckKx
         z8Fw==
X-Gm-Message-State: AOJu0YzO92RSH23g+6lcuyDXErTng/0M04MmrA4lSKKW9rY5vEbc6BIs
	NJdXp7VM/S8SBzxnlKitdV//pw==
X-Google-Smtp-Source: AGHT+IEFOMu8HOw1fLimacRClqpUxu9YYIpRBWrQpDg29JIiiHG1zJtWI6wj4wfcsLWWwQsSl6GBrg==
X-Received: by 2002:a05:600c:b4b:b0:3fe:1b5e:82 with SMTP id k11-20020a05600c0b4b00b003fe1b5e0082mr1946889wmr.20.1694721915901;
        Thu, 14 Sep 2023 13:05:15 -0700 (PDT)
Message-ID: <55bf2c04-c238-ba86-3ef4-99b0524c17ae@citrix.com>
Date: Thu, 14 Sep 2023 21:05:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 8/8] x86/spec-ctrl: Mitigate the Zen1 DIV leakge
Content-Language: en-GB
To: Jason Andryuk <jandryuk@gmail.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <20230913202758.508225-1-andrew.cooper3@citrix.com>
 <20230913202758.508225-9-andrew.cooper3@citrix.com>
 <CAKf6xpuRh00P9at-bY+XE669vjoMf_xMwozQkCx=DL6Q2kLwgg@mail.gmail.com>
In-Reply-To: <CAKf6xpuRh00P9at-bY+XE669vjoMf_xMwozQkCx=DL6Q2kLwgg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14/09/2023 2:12 pm, Jason Andryuk wrote:
> On Wed, Sep 13, 2023 at 6:09 PM Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>> @@ -955,6 +960,40 @@ static void __init srso_calculations(bool hw_smt_enabled)
>>          setup_force_cpu_cap(X86_FEATURE_SRSO_NO);
>>  }
>>
>> +/*
>> + * Div leakage is specific to the AMD Zen1 microarchitecure.  Use STIBP as a
>> + * heuristic to select between Zen1 and Zen2 uarches.
>> + */
>> +static bool __init has_div_vuln(void)
>> +{
>> +    if ( !(boot_cpu_data.x86_vendor &
>> +           (X86_VENDOR_AMD | X86_VENDOR_HYGON)) )
>> +        return false;
>> +
>> +    if ( (boot_cpu_data.x86 != 0x17 && boot_cpu_data.x86 != 0x18) ||
>> +         !boot_cpu_has(X86_FEATURE_AMD_STIBP) )
>> +        return false;
>> +
>> +    return true;
>> +}
>> +
>> +static void __init div_calculations(bool hw_smt_enabled)
>> +{
>> +    bool cpu_bug_div = has_div_vuln();
>> +
> Would it make sense to add
>     if ( !cpu_bug_div )
>         return
> ...
>
>> +    if ( opt_div_scrub == -1 )
>> +        opt_div_scrub = cpu_bug_div;
>> +
>> +    if ( opt_div_scrub )
>> +        setup_force_cpu_cap(X86_FEATURE_SC_DIV);
> ...so that div-scrub=1 isn't setting X86_FEATURE_SC_DIV on un-affected
> hardware?  Or do you want to leave command line control in place in
> case it might be needed as a future workaround on other hardware?

All options (where possible) allow for paths to be explicitly activated
on un-affected hardware so we can test this giant mess.

The only cases where we ignore a user choice is when the result will
crash from e.g. #GP due to insufficient microcode.

~Andrew

