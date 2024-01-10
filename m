Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EAD938297BD
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jan 2024 11:40:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.665378.1035584 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNW0F-00081O-OJ; Wed, 10 Jan 2024 10:40:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 665378.1035584; Wed, 10 Jan 2024 10:40:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNW0F-0007zg-KE; Wed, 10 Jan 2024 10:40:07 +0000
Received: by outflank-mailman (input) for mailman id 665378;
 Wed, 10 Jan 2024 10:40:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/O5u=IU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rNW0E-0007vj-8K
 for xen-devel@lists.xenproject.org; Wed, 10 Jan 2024 10:40:06 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9d0f5ce9-afa4-11ee-9b0f-b553b5be7939;
 Wed, 10 Jan 2024 11:40:04 +0100 (CET)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-50ec948ad31so2528753e87.2
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jan 2024 02:40:04 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 n5-20020a5d8245000000b007bc234fd196sm625829ioo.0.2024.01.10.02.40.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Jan 2024 02:40:03 -0800 (PST)
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
X-Inumbo-ID: 9d0f5ce9-afa4-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1704883203; x=1705488003; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=yA8YdLR2ShFVTt3u5LBepjeyUmoUlfaz55ddsaZrxTA=;
        b=YBJp/bAfnrlI9TrcPN+Y8EbS/qISI5EcXLukUaxJSDl5ka4M3BbHcuyDBcXEt81FeO
         xMCtYG5yIFtoZU8SnIaAqs/uLOARewhY8FLOWSt6Q1JzLHqlRFWhN8qOnNZvpJ2kek4n
         pxH6/dh4RkGjoROP59DjxVR/fHrfd/EoWBho3/mnajFHe6067YEAZrLpQ14flZ+GKzrn
         VsaWvmSimFlGZ/NKo62PUq+SP1Yc7umJh5l4VHEwxxOgRLB+kRrk0kr0ByCGDNRAmCPW
         kFHT59dN6p96nBg1KZ1xX3Knzg7u92CUtf3NNtHVjbdGtrfFFQDcVIQArtiO8C1vj5Qc
         u0iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704883203; x=1705488003;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yA8YdLR2ShFVTt3u5LBepjeyUmoUlfaz55ddsaZrxTA=;
        b=cFUL3CBMPqqSje1I696dhCOJ3QNa8Xq05adxHQ0HJEuE8qF4ZKujqqEXipHCQamWYW
         MkrEmtbruWfMuV9dG1lvZjhd248dH7AAb3zSKv5o0ZSE+ZPTIZuuPPUXutbUgrxOFjRm
         qKeBQU48jPU3ESt8M4GZ+SO0DrvqevIy8t66jg7T4dwDEM8QqFKp2SaASa0EEPB/kX02
         2uWj3p4GAWNoHnm7Pef1JOs722lL8S8m2oBDgnN/ONUT3iGutQvMyGzfdwAEYohoR4xs
         907bYLkR8w1zih3kwKwDq5daTTJipLmzooIkzwxoUiADfQ3e8WzKyFECJMeL7sJm3f6e
         WuVw==
X-Gm-Message-State: AOJu0Yw4z4bBk68ct9aTUgeu5EXCSeHigXCDm8+B2pAx9lhqFCLuClHV
	dkmqCajlm0lbtg3kEyxKEANhPNJYHUQP
X-Google-Smtp-Source: AGHT+IG7MwNXELEl4ir54PTdG4nDoNKpz6IAa/HRrUrC6KJREzGmP3FjZodetQv3FTYGECdHbKnZ0Q==
X-Received: by 2002:a05:6512:370e:b0:50e:5049:a179 with SMTP id z14-20020a056512370e00b0050e5049a179mr273860lfr.105.1704883203495;
        Wed, 10 Jan 2024 02:40:03 -0800 (PST)
Message-ID: <1b43d027-450e-4777-9ea9-682ebcc7115e@suse.com>
Date: Wed, 10 Jan 2024 11:39:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/15] VMX: convert vmx_basic_msr
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Kevin Tian <kevin.tian@intel.com>,
 Jun Nakajima <jun.nakajima@intel.com>,
 George Dunlap <george.dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <b63b648f-02d0-4e52-a5e5-94ffd5666a14@suse.com>
 <d07fb86f-ef9c-4c2b-ba9a-f1e5c813d45d@suse.com>
 <e17d6e45-b03c-4906-9fb3-af4770aa3cf0@citrix.com>
 <beac1f7c-51cb-47a9-8e96-d09cb3ea6ab7@suse.com>
 <04992603-cb10-43ff-9eb3-b8f8f1dc765c@citrix.com>
 <83f266f1-c46b-4ace-9c29-b0b486f817a6@suse.com>
 <3af7e3a7-c76d-4784-a215-06510171c66c@citrix.com>
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
In-Reply-To: <3af7e3a7-c76d-4784-a215-06510171c66c@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 09.01.2024 15:54, Andrew Cooper wrote:
> On 09/01/2024 2:39 pm, Jan Beulich wrote:
>> Even the inner struct plan falls apart pretty quickly (or grows what
>> needs doing by too much for my taste, in the context right here):
>> While for basic_msr this works, and it would apparently also work
>> for vmfunc and tertiary exec control (the latter is itself only part
>> of a yet to be reviewed / approved patch), it doesn't for all the
>> others with split 0-setting and 1-setting halves. This is because
>> what VMX code wants are the calculated values to put in the VMCS,
>> whereas imo in the policy we'd want to store both halves (and what
>> exactly wants to be in the host policy there isn't really clear to
>> me). As a result I can't create a single uniform structure properly
>> serving both purposes. Nor could I have VMX code use the host
>> policy for most of its capability checks.
>>
>> Thought / ideas?
> 
> If it's not actually trivial, then don't worry.
> 
> The policy does need to hold the architectural representation.  The
> in-use settings need storing per-vCPU because they do (or need to me
> made to) vary based on the configuration of the VM, and because they're
> needed on every virtual vmentry when re-calculating VMCS02.

Would it help if I did a hybrid approach, i.e. move to raw/host policies
only what can be easily moved, with the rest kept as is (perhaps with
vmx_caps renamed to vmx_ctls then)?

Jan

