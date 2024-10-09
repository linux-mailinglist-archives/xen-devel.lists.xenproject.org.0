Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E0E9996824
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2024 13:13:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.814340.1227887 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syUdE-00068Z-L8; Wed, 09 Oct 2024 11:13:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 814340.1227887; Wed, 09 Oct 2024 11:13:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syUdE-000655-IS; Wed, 09 Oct 2024 11:13:28 +0000
Received: by outflank-mailman (input) for mailman id 814340;
 Wed, 09 Oct 2024 11:13:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z5PZ=RF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1syUdD-00064v-9M
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2024 11:13:27 +0000
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [2a00:1450:4864:20::234])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 814eee82-862f-11ef-a0bd-8be0dac302b0;
 Wed, 09 Oct 2024 13:13:26 +0200 (CEST)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2fad5024b8dso76831041fa.1
 for <xen-devel@lists.xenproject.org>; Wed, 09 Oct 2024 04:13:26 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c8e05ecafbsm5392186a12.70.2024.10.09.04.13.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Oct 2024 04:13:25 -0700 (PDT)
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
X-Inumbo-ID: 814eee82-862f-11ef-a0bd-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1728472406; x=1729077206; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qaOVW6pxd/LBtFDzmIxeje2r0nwomK6w5VBfXxfg8S8=;
        b=HASl2DqUztFh+7EKRycK796puGCEFhQNnk203bP80JzXVgjXnzO6TYVUIEqdngmMTl
         B0zdpatT+LJinv5oCZQv7K4YJiwnuE9akB0XUhQyLbf6q4pEXhZ2DoahT9+rTyi89wRo
         x995zAc8yHI8ZfKoJ8FWehbgVgF0brS2nS4ONvZmRX4OA7C3ly/DkEzjskyiceWLsOpF
         8lCe+YuMhJaL88QsOn4m1Y2a1tIyXjoVTSY5orT1xyifnWzA0pfvAHDwujFDu2McrZVu
         NowGYZMBI/I1p12e0Q8UDVFIbowZAjx7JiP2LlbRdSjKmllQI4oMaKXKCb0dmKfQ69vl
         v07Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728472406; x=1729077206;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qaOVW6pxd/LBtFDzmIxeje2r0nwomK6w5VBfXxfg8S8=;
        b=PPsdhNHIhm3V5eXK5hroB1dc4mxBYr/Jca066yWTPmq6PTQ6QfkqJTMUJCK1hqCKol
         Ba7M5INq7HoY0bNJjtj8j2mg33QBoDY0mlAvd23QmUOv9Vv2LJ8PRHwd8KgzMds6RSHL
         Q7jeL51moojltY17pDSLlHOfZjH/9IrnRDME0wS+LzAUY7iZLQZjrwzFIPoDt9nM02Vh
         FR+PdOH3scRaL7z6zF+T54bX2fOa7cNyGPeT1qV+F7k0U/vJG8WmyZZ4eejsJQP6ApK/
         tfBrxDnZispjts4Brsx50LSqrX1A9cSIzcGXwv8fnWe13wT7/HtWUavOa0lO8AKGRiMi
         Dp8g==
X-Forwarded-Encrypted: i=1; AJvYcCWw3OP0crFkRYPR5QZ4V/QVaUSoZBhAR/n302aXIGG9Gpj0FB9ibYxb1PNC2mfiEzQMGMdKDXPRef4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzlt8izKQbHezTcweSGkf9ENo9iZUhHzsCci7+ZmfgsApa5yPYS
	pePtXAUwn3ztHHskvWUam96bFl6nRZIXZD3LsH+vaCfzJH0ghlgK8reOuwx9bQ==
X-Google-Smtp-Source: AGHT+IFo0Caqxw3Wlyee7bxOTrVOEShDPgoFL0QgTUVocVbVWo6MSCuKZIypO6qeWRjUbF5EfrKR1Q==
X-Received: by 2002:a2e:5152:0:b0:2fa:c0df:3d7b with SMTP id 38308e7fff4ca-2fb1873da33mr10040531fa.22.1728472405607;
        Wed, 09 Oct 2024 04:13:25 -0700 (PDT)
Message-ID: <49d1ff38-dff7-4db0-aec8-15ca82339e54@suse.com>
Date: Wed, 9 Oct 2024 13:13:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/2] x86/boot: Align mbi2.c stack to 16 bytes
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20241009080439.2411730-1-frediano.ziglio@cloud.com>
 <20241009080439.2411730-2-frediano.ziglio@cloud.com>
 <f54d8f4b-e088-4ebe-a72f-ec4a540f9b33@suse.com>
 <CACHz=ZjLDv11OiMdtDmTLDOEmgDiqMoP9cppdKg3qcsXK+wpgA@mail.gmail.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <CACHz=ZjLDv11OiMdtDmTLDOEmgDiqMoP9cppdKg3qcsXK+wpgA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 09.10.2024 12:15, Frediano Ziglio wrote:
> On Wed, Oct 9, 2024 at 9:20 AM Jan Beulich <jbeulich@suse.com> wrote:
>> On 09.10.2024 10:04, Frediano Ziglio wrote:
>>> --- a/xen/arch/x86/efi/Makefile
>>> +++ b/xen/arch/x86/efi/Makefile
>>> @@ -11,6 +11,8 @@ $(obj)/boot.init.o: $(obj)/buildid.o
>>>  $(call cc-option-add,cflags-stack-boundary,CC,-mpreferred-stack-boundary=4)
>>>  $(addprefix $(obj)/,$(EFIOBJ-y)): CFLAGS_stack_boundary := $(cflags-stack-boundary)
>>>
>>> +$(obj)/mbi2.o: CFLAGS_stack_boundary := $(cflags-stack-boundary)
>>> +
>>>  obj-y := common-stub.o stub.o
>>>  obj-$(XEN_BUILD_EFI) := $(filter-out %.init.o,$(EFIOBJ-y))
>>>  obj-bin-$(XEN_BUILD_EFI) := $(filter %.init.o,$(EFIOBJ-y))
>>
>> You're duplicating code, which is better to avoid when possible. Is there
>> a reason the earlier commit didn't simply add mbi2.o to $(EFIOBJ-y)? That
>> way the existing logic would have covered that file as well. And really I
>> think it should have been mbi2.init.o (or else adding it into $(obj-bin-y)
>> is wrong), which probably wants correcting at the same time (ISTR actually
>> having requested that during an earlier review round).
> 
> This was my first attempt, but it fails poorly, as EFIOBJ-y comes with
> the addition of creating some file links that causes mbi2.c to be
> overridden.

I can't see $(EFIOBJ-y) affecting symlink creation. What I can see is that
the variable is used in the setting of clean-files, which indeed is a problem.
Still imo the solution then is to introduce another variable to substitute the
uses of $(EFIOBJ-y) in arch/x86/efi/Makefile. E.g.

EFIOBJ-all := $(EFIOBJ-y) mbi2.init.o

> If I remember, you suggested changing to obj-bin-y. Still, maybe is
> not the best place. It was added to obj-bin-y because it should be
> included either if XEN_BUILD_EFI is "y" or not.

No, that doesn't explain the addition to obj-bin-y; this would equally be
achieved by adding to obj-y. The difference between the two variables is
whether objects are to be subject to LTO. And the typical case then is that
init-only objects aren't worth that extra build overhead. Hence the common
pattern is (besides files with assembly sources) for *.init.o to be added to
obj-bin-*.

Jan

