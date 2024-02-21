Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE9E85E1CC
	for <lists+xen-devel@lfdr.de>; Wed, 21 Feb 2024 16:47:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.684103.1063800 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcoob-0001vi-CN; Wed, 21 Feb 2024 15:47:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 684103.1063800; Wed, 21 Feb 2024 15:47:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcoob-0001tU-8A; Wed, 21 Feb 2024 15:47:21 +0000
Received: by outflank-mailman (input) for mailman id 684103;
 Wed, 21 Feb 2024 15:47:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TA2L=J6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rcooZ-0001tK-La
 for xen-devel@lists.xenproject.org; Wed, 21 Feb 2024 15:47:19 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7e2ad398-d0d0-11ee-8a53-1f161083a0e0;
 Wed, 21 Feb 2024 16:47:18 +0100 (CET)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a293f2280c7so981638366b.1
 for <xen-devel@lists.xenproject.org>; Wed, 21 Feb 2024 07:47:18 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 s8-20020a170906500800b00a3de4c7bf00sm5061791ejj.79.2024.02.21.07.47.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Feb 2024 07:47:17 -0800 (PST)
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
X-Inumbo-ID: 7e2ad398-d0d0-11ee-8a53-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1708530438; x=1709135238; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BaSZPrN+BoA1InZG490Cz4viy5OnTLYfAijdnOVQWCY=;
        b=ATVEwDhKS4/Dzu/Zr72u9G7wGmMT2fAy7cCkJdouLnZhRu9nlVFiLlRctbr/GwBx5I
         ArAWJgHDLfDj2A0lSdo8zb3WIhsdMRQNP8L+MJ3CKZ2MtUKMfaqEu2qfya29J/nD+LLn
         HxcsNyxv57d85hmsvlyronkBfCDtYcCLX8FzWSj9W9gl/eQxqd5pe+zZkTNTDN6MImMT
         kctzcA1yLuQowJ03hSOp3ry6KbLNF0Yn2iPb49eH+a5ZoFBaXOJHR4zHHRVCaf7IXZbj
         XEm6Wki9PVtODgXyGwz4Vwlf0ogaCTM5uGD9kqZ9P7Lq9BF/JqEi4TQpZ/UPaPH8/zfx
         rqIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708530438; x=1709135238;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BaSZPrN+BoA1InZG490Cz4viy5OnTLYfAijdnOVQWCY=;
        b=TOxnaE+yxzDkm9X/QcnNj/4tSy7i3kS6ntdkGZl+b4j5HJRpsGKutLOkepxc1ppsxb
         XiWZzjKe+CYYIhlB0aHkxn6bwsMdFxDWckyngDhkJ32SBOajjESAnCU1e094A66zDoPR
         PdWCWngcX9KKappwTq7ADO9l+XYBqlXklc7kn5+orfS17gFXEHkpiKF067d7eFDaRmFt
         DiV6kUV+uA2P5KmWFzSfoGDwsmqC3KNAlyhzU667Vg4nhLCATE0k+UDgY/kx0bVGHkQd
         FBdREp7MHD4iXZLaqIBwkE0ESQ+gz2AugdOuSALkrzUKISklK46sM3Ocx3YAzpFgF4vK
         AFgA==
X-Gm-Message-State: AOJu0Yy2ooDnZ9/PRWvOzgr658xqB4T4vWRc4MlTkINaj5KZuLEy/LXH
	KSePQFtYfWlC8rgPJ7RIPdtpXKCy4JK1H58sNvdjgFrEPNicvvnI4dneAeUTIQ==
X-Google-Smtp-Source: AGHT+IG/L/BmGQ2U9fC5PJH7SYIWbjHtKtF0h1j52+bqP4RxaHBdT3TcvG77WJj2gJmrEU1v05A0+Q==
X-Received: by 2002:a17:906:a0ce:b0:a3d:8f37:c37f with SMTP id bh14-20020a170906a0ce00b00a3d8f37c37fmr14099147ejb.6.1708530437934;
        Wed, 21 Feb 2024 07:47:17 -0800 (PST)
Message-ID: <8dbf3be5-4954-493d-acdc-aed0603943f0@suse.com>
Date: Wed, 21 Feb 2024 16:47:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] build: make sure build fails when running kconfig fails
Content-Language: en-US
To: Anthony PERARD <anthony.perard@cloud.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <55c3a781-17f8-47f2-9629-515e1aea77aa@suse.com>
 <b7c22718-ec6c-470e-be72-e613b2af3c54@perard>
 <abbae372-5e3e-4013-a2a3-45892ec96c89@suse.com>
 <ed53b507-8ce1-4496-b2c2-cb0089f384c0@perard>
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
In-Reply-To: <ed53b507-8ce1-4496-b2c2-cb0089f384c0@perard>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 21.02.2024 16:22, Anthony PERARD wrote:
> On Tue, Feb 20, 2024 at 01:20:16PM +0100, Jan Beulich wrote:
>> On 20.02.2024 12:18, Anthony PERARD wrote:
>>> On Tue, Feb 20, 2024 at 09:43:56AM +0100, Jan Beulich wrote:
>>>> Because of using "-include", failure to (re)build auto.conf (with
>>>> auto.conf.cmd produced as a secondary target) won't stop make from
>>>> continuing the build. Arrange for it being possible to drop the - from
>>>> Rules.mk, requiring that the include be skipped for tools-only targets.
>>>> Note that relying on the inclusion in those cases wouldn't be correct
>>>> anyway, as it might be a stale file (yet to be rebuilt) which would be
>>>> included, while during initial build, the file would be absent
>>>> altogether.
>>>>
>>>> Fixes: 8d4c17a90b0a ("xen/build: silence make warnings about missing auto.conf*")
>>>> Reported-by: Roger Pau Monné <roger.pau@citrix.com>
>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>
>>> Just to make sure, this patch is a workaround to a harmless bug in older
>>> version of GNU Make which print spurious error messages, and said bug as
>>> been fixed in GNU Make 4.2, right? Bug report:
>>>
>>>     bug #102: Make prints an incorrect error for missing includes
>>>     https://savannah.gnu.org/bugs/?func=detailitem&item_id=102
>>
>> Assuming you mean the change referenced in Fixes: - yes, that's my
>> understanding. (Whether the referenced make bug is the one I can't tell,
>> though. But it looks like it is.)
>>
>>>> --- a/xen/Makefile
>>>> +++ b/xen/Makefile
>>>> @@ -375,6 +375,7 @@ $(KCONFIG_CONFIG): tools_fixdep
>>>>  # This exploits the 'multi-target pattern rule' trick.
>>>>  # The syncconfig should be executed only once to make all the targets.
>>>>  include/config/%.conf include/config/%.conf.cmd: $(KCONFIG_CONFIG)
>>>> +	$(Q)rm -f include/config/$*.conf
>>>
>>> Maybe this should say "include/config/auto.conf" instead of using "$*".
>>> "syncconfig" is going to generate "auto.conf" and not "$*.conf". And it
>>> would make easier to find the "rm" command via "grep".
>>
>> Generally I advocate for using $* wherever possible in pattern rules. If,
> 
> Well, it might look like a pattern rule, but it isn't one. It's a
> "groupes targets" rule that works on version of Make that doesn't have
> this brand new feature. It would be written as:
>     include/config/auto.conf include/config/auto.conf.cmd&: $(KCONFIG_CONFIG)

Assuming new enough make.

> Second, the other command in the recipe doesn't use "$*", so it's not
> possible to use this rule with a value of $* other than "auto".

True. "auto" isn't used there either, though.

To emphasize this isn't really a pattern rule, how about shrinking the
stem along the lines of what I've done in

https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=79d635fc64ba9ca97c24c0c52c9924dba77e9527

e.g. making it just the (first) dot here?

>> however, replacing that is the only way to get an ack for this change, then
>> I would (hesitantly) do so.
> 
> Yes please, even if I don't like the patch. I hope it isn't going to
> byte us later if something in "tools/" happens to start depending on
> Kconfig (only fixdep and kconfig need to not depend on kconfig at the
> moment). But the patch currently works and looks ok. So, with "$*"
> replace by "auto", you can add my "Reviewed-by: Anthony PERARD
> <anthony.perard@citrix.com>".

Thanks.

Jan

