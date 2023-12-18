Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A6C817731
	for <lists+xen-devel@lfdr.de>; Mon, 18 Dec 2023 17:15:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.656223.1024313 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFGHO-0004NY-8x; Mon, 18 Dec 2023 16:15:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 656223.1024313; Mon, 18 Dec 2023 16:15:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFGHO-0004Kh-48; Mon, 18 Dec 2023 16:15:42 +0000
Received: by outflank-mailman (input) for mailman id 656223;
 Mon, 18 Dec 2023 16:15:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=h3b+=H5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rFGHM-0004Kb-9r
 for xen-devel@lists.xenproject.org; Mon, 18 Dec 2023 16:15:40 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aedfad7a-9dc0-11ee-98eb-6d05b1d4d9a1;
 Mon, 18 Dec 2023 17:15:39 +0100 (CET)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-33668163949so1196643f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 18 Dec 2023 08:15:38 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 j17-20020a05600c1c1100b0040b48690c49sm43110390wms.6.2023.12.18.08.15.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Dec 2023 08:15:38 -0800 (PST)
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
X-Inumbo-ID: aedfad7a-9dc0-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1702916138; x=1703520938; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YYUWCSAxZvREm2wsIVb0uzxLc9FlZQTameWd5CdpK8M=;
        b=B6W2Fn4Hj9ZAnCbt3838xeZVx1Aw/FSd0R2vWwaLn+kgNI2ReKDcWkGRKatFqYZotj
         1VYYFdPgyrSFJ3hHC+2Hs7HmYM6QFccVbPy6tCS4eC1zF9aHqUsI49fqJ9F05ScXlwiY
         WmjPgX0/1fxJLKxP3WY0R2nkg9tFUkovBdcgjvsA0RW0/h3AYs/IzDQDCkvSYVHobGbG
         GPIm4lNeqV2kt1FtoOvJpGwSSdAVijBrwWqMM0g7d5gdvX5wr9fPxfYngWHo7ehWVxfg
         XN+7MtV7gR7BP/gvkpwpVwKau517fvxVuXM+gpHQBOM8iaBO3PaFn3gHBuswAzikpTUi
         ZI1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702916138; x=1703520938;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YYUWCSAxZvREm2wsIVb0uzxLc9FlZQTameWd5CdpK8M=;
        b=MTiFm68pbH3GZfYABU0nU8KWheJp3xOnSN6Mphdn6AXY8Wv/KCHOCIk2oMJ/+4zjm5
         UoL3+GFjf5HbbY849lL6YyCoamhxBRT6XcFpNSlH6Y+ukLOXJ6HaFjSHZVs3oTfx4e5l
         787xiaB1N1+lDuMi36BHrKaIVRx92yp5GHplClkeQgF+gdh4xrC409myXN1HTkXmtdRc
         1F1HSIXFSICkJ5iRXCPLNH/rKPrllRwXWKh9NV8/9lsDHQIuqnpy/zgVK1Yws+0vNPq4
         e88oYZZbc7Xbggh+rX5qMUBFrOgofjDY/GlDuWcrDnNv9n9VkOhKomhEYpxhWOWQ21sc
         PAiQ==
X-Gm-Message-State: AOJu0YzwZRXtOHzez6MxzzMEZo8xupb6s3gv3DTm7Cv2eUri9ZB77KIg
	tJTFLgPfNSLXOOnADAfNiD5W
X-Google-Smtp-Source: AGHT+IG8RosISx48Hwr6mUxxz/sbQDi/ZkfE/9FmTO7aa3bCJAyW+fBdVHvpV9XClgxHL26uCGnCRQ==
X-Received: by 2002:a7b:c8cf:0:b0:40c:66d6:cbcb with SMTP id f15-20020a7bc8cf000000b0040c66d6cbcbmr1764102wml.374.1702916138376;
        Mon, 18 Dec 2023 08:15:38 -0800 (PST)
Message-ID: <d56aa264-41f2-4cff-97dd-1a222750a389@suse.com>
Date: Mon, 18 Dec 2023 17:15:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v1 1/1] xen/Makefile: introduce ARCH_FIXED_CONFIG for
 randconfig
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org, Anthony PERARD <anthony.perard@citrix.com>
References: <cover.1701966261.git.oleksii.kurochko@gmail.com>
 <c95959adca794a90465abd10f579dc9159a7697f.1701966261.git.oleksii.kurochko@gmail.com>
 <f9ceb8f7-a664-452b-8b38-f74b36386e33@citrix.com>
 <7ec81395-298d-4d50-89af-d54f756ef657@suse.com>
 <95d3e8e9-66d3-4097-b2ed-c808369a08ac@citrix.com>
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
In-Reply-To: <95d3e8e9-66d3-4097-b2ed-c808369a08ac@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18.12.2023 17:07, Andrew Cooper wrote:
> On 11/12/2023 3:56 pm, Jan Beulich wrote:
>> On 07.12.2023 21:17, Andrew Cooper wrote:
>>> On 07/12/2023 5:03 pm, Oleksii Kurochko wrote:
>>>> ARCH_FIXED_CONFIG is required in the case of randconfig
>>>> and CI for configs that aren't ready or are not
>>>> supposed to be implemented for specific architecture.
>>>> These configs should always be disabled to prevent randconfig
>>>> related tests from failing.
>>>>
>>>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>>> ---
>>>>  xen/Makefile | 5 ++++-
>>>>  1 file changed, 4 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/xen/Makefile b/xen/Makefile
>>>> index ca571103c8..8ae8fe1480 100644
>>>> --- a/xen/Makefile
>>>> +++ b/xen/Makefile
>>>> @@ -336,11 +336,14 @@ ifeq ($(config-build),y)
>>>>  # *config targets only - make sure prerequisites are updated, and descend
>>>>  # in tools/kconfig to make the *config target
>>>>  
>>>> +ARCH_FORCED_CONFIG := $(srctree)/arch/$(SRCARCH)/configs/randomforced.config
>>>> +
>>>>  # Create a file for KCONFIG_ALLCONFIG which depends on the environment.
>>>>  # This will be use by kconfig targets allyesconfig/allmodconfig/allnoconfig/randconfig
>>>>  filechk_kconfig_allconfig = \
>>>>      $(if $(findstring n,$(XEN_HAS_CHECKPOLICY)), echo 'CONFIG_XSM_FLASK_POLICY=n';) \
>>>> -    $(if $(KCONFIG_ALLCONFIG), cat $(KCONFIG_ALLCONFIG);) \
>>>> +    $(if $(KCONFIG_ALLCONFIG), cat $(KCONFIG_ALLCONFIG); \
>>>> +    $(if $(wildcard $(ARCH_FORCED_CONFIG)), cat $(ARCH_FORCED_CONFIG);) ) \
>>>>      :
>>>>  
>>>>  .allconfig.tmp: FORCE
>>> We already have infrastructure for this.  What's wrong with
>>> EXTRA_FIXED_RANDCONFIG?
>> What I don't understand here is why dealing with the issue would want
>> limiting to gitlab-CI. Anyone could run randconfig on their own, and
>> imo it would be helpful if the same issue(s) could be prevented there,
>> too. Hence my earlier suggestion to have a snippet which can be used
>> by "interested" parties. And once dealt with in e.g. the makefile
>> there should not be a need for any overrides in the CI config anymore.
> 
> This is trying to find a solution to a problem which doesn't exist.
> 
> RISC-V and PPC are experimental in Xen.  Noone else is going to come and
> randconfig them until they're rather more production ready, and a
> prerequisite of that is removing this list of exclusions.
> 
> Until you can actually find an interested party to comment, I think this
> is just churn for no useful improvement.  If nothing else, calling it
> randomforced.config isn't appropriate given the explanation of what this
> target is used for...

"random" in the name can't possibly be right anyway. Such collection of
fixed settings would also be relevant to e.g. all{yes,no}config. Yet
that's still not the same as any kind of "default" config, which the
two architectures presently kind of abuse for the purpose of defining
required-fixed settings.

Jan


