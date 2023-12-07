Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46A0A808B98
	for <lists+xen-devel@lfdr.de>; Thu,  7 Dec 2023 16:19:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.649962.1015158 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBG9O-0004gh-Bd; Thu, 07 Dec 2023 15:18:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 649962.1015158; Thu, 07 Dec 2023 15:18:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBG9O-0004e2-8B; Thu, 07 Dec 2023 15:18:54 +0000
Received: by outflank-mailman (input) for mailman id 649962;
 Thu, 07 Dec 2023 15:18:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+CYm=HS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rBG9M-0004dw-RW
 for xen-devel@lists.xenproject.org; Thu, 07 Dec 2023 15:18:52 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ed08ce8b-9513-11ee-98e7-6d05b1d4d9a1;
 Thu, 07 Dec 2023 16:18:51 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-40c0f3a7717so12418785e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 07 Dec 2023 07:18:51 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 b16-20020a05600c4e1000b0040c310abc4bsm343392wmq.43.2023.12.07.07.18.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Dec 2023 07:18:50 -0800 (PST)
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
X-Inumbo-ID: ed08ce8b-9513-11ee-98e7-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1701962330; x=1702567130; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ueQ7eAPvlFdZ82vf8qwyeAiUQJ7XmotqdujSmoTLeds=;
        b=JecMdPqnSivcRk0ONueFkVuj5rJ79dLkQ28yTfd+N77+v9jcwDofEdm63Lzx0a8RuK
         o3AWu4nerCbImZ/3x91QTctetefCxqO/B3KeB1eR6XFK8foP0v/X8qacqUPiyxTqNNrw
         kwPCtuMChHibrXQQTWubRW7ArCqyRT/uThQ/XsS8vC6H88Ze4ihTKaW0+i7DuNF+cCKI
         U/scsmAaRw7ufHYNSyH9UmKHffsGKcBLzoxm9cBwg02Rjy4fz3OfKnfecGXNXjZ2GGq7
         M02MGUQpPniC1r9J12th4PcsaExVCDYDbw/TbFj6EB49Gl5+LW0o+P27tUaHAyrvWhiH
         wvMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701962330; x=1702567130;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ueQ7eAPvlFdZ82vf8qwyeAiUQJ7XmotqdujSmoTLeds=;
        b=c0t4IsPdsvCbsmoD00ZUyrSGBf9Rc9I6KFhFrMiwdUX5g5mE5UgVvIw39L8wvY9Ttd
         v73hysMayyJnuwJyXay1o6tIRb1T7rueyVH5n1j/PB1EJjVd0T/czN9Q2+/rbgVZqqk3
         L1dwVbml+ZFZ3YJmvXeYYtyTIWD1gdsGDGGkE3Z1rD+nJr8rfIIBVQBh9NV4osemK3ju
         XyQMSBMNwQ/Y8UipdsydJyVj8v4ZtmhG9Akdy/qWP5zyQFFdWZRRoE6unx3hecua55MR
         fhGuxdMRxtIz1ofaE66BY+KlYBNvuffJeFEgOejA14Kf7rs38elqy5/arYj6E4qbIbiK
         GweA==
X-Gm-Message-State: AOJu0YwxxPdj65OY2F2fqfDS7BRcXE/68Ov8arua+brlApPEIUi1h5FI
	wwnFT24GJOLVnCbQ4sHWBDZH
X-Google-Smtp-Source: AGHT+IE9YL8DZDWpyY4ODnA9QJTAQmcFJB33r807FQ20c/wvaylYrpQOBziN2CqNcTFluB0miDbPqg==
X-Received: by 2002:a05:600c:46c8:b0:40b:5e1c:2f9c with SMTP id q8-20020a05600c46c800b0040b5e1c2f9cmr858112wmo.44.1701962330431;
        Thu, 07 Dec 2023 07:18:50 -0800 (PST)
Message-ID: <b8e103d4-dfd7-41cf-91a0-8f7117176113@suse.com>
Date: Thu, 7 Dec 2023 16:18:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/39] xen/riscv: disable unnecessary configs
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, xen-devel@lists.xenproject.org,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <cover.1700761381.git.oleksii.kurochko@gmail.com>
 <b4e85f8f58787b4d179022973ce25673d6b56e36.1700761381.git.oleksii.kurochko@gmail.com>
 <fdfda320-b73b-4830-8f1b-d261b02bcdde@suse.com>
 <22fa451f7b165a00082443a35077e98e101c22e4.camel@gmail.com>
 <008d0c66-6816-4d12-9e1f-1878e982f9fc@suse.com>
 <09d24b36380027df21d547de438da10e01eda0e0.camel@gmail.com>
 <4064be07-747e-4b9c-b5da-9935aa13d91f@suse.com>
 <decb178a72c48549d721a7da88459b35ac443f52.camel@gmail.com>
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
In-Reply-To: <decb178a72c48549d721a7da88459b35ac443f52.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07.12.2023 15:51, Oleksii wrote:
> On Thu, 2023-12-07 at 15:11 +0100, Jan Beulich wrote:
>> On 07.12.2023 14:44, Oleksii wrote:
>>> On Thu, 2023-12-07 at 11:00 +0100, Jan Beulich wrote:
>>>> On 07.12.2023 10:22, Oleksii wrote:
>>>>> On Tue, 2023-12-05 at 16:38 +0100, Jan Beulich wrote:
>>>>>>> On 24.11.2023 11:30, Oleksii Kurochko wrote:
>>>>>>>>> The patch also fixes the build script as conf util
>>>>>>>>> expects
>>>>>>>>> to have each config on separate line.
>>>>>>>
>>>>>>> The approach doesn't really scale (it's already odd that
>>>>>>> you
>>>>>>> add
>>>>>>> the
>>>>>>> (apparently) same set four times. There's also zero
>>>>>>> justification
>>>>>>> for
>>>>>>> this kind of an adjustment (as per discussion elsewhere I
>>>>>>> don't
>>>>>>> think
>>>>>>> we should go this route, and hence arguments towards
>>>>>>> convincing
>>>>>>> me
>>>>>>> [and
>>>>>>> perhaps others] would be needed here).
>>>>> I agree that this may not be the best approach, but it seems
>>>>> like
>>>>> we
>>>>> don't have too many options to turn off a config for
>>>>> randconfig.
>>>>>
>>>>> To be honest, in my opinion (IMO), randconfig should either be
>>>>> removed
>>>>> or allowed to fail until most of the functionality is ready.
>>>>> Otherwise,
>>>>> there should be a need to introduce HAS_* or depend on
>>>>> 'SUPPORTED_ARCHS' for each config, or introduce a lot of stubs.
>>>>>
>>>>> Could you please suggest a better option?
>>>>
>>>> As to dropping randconfig tests, I'd like to refer you to Andrew,
>>>> who
>>>> is of the opinion that it was wrong to drop them for ppc. (I'm
>>>> agreeing
>>>> with him when taking a theoretical perspective, but I'm not happy
>>>> with
>>>> the practical consequences.)
>>>>
>>>> As to a better approach: Instead of listing the same set of
>>>> options
>>>> several times, can't there be a template config which is used to
>>>> force
>>>> randconfig to not touch certain settings? In fact at least for
>>>> non-
>>>> randconfig purposes I thought tiny64_defconfig /
>>>> riscv64_defconfig
>>>> already serve kind of a similar purpose. Imo the EXTRA_*CONFIG
>>>> overrides
>>>> are there for at most very few special case settings, not for
>>>> purposes
>>>> like you use them here.
>>> The template will be the really a good option.
>>>
>>> What do you think about the following patch which introduces arch-
>>> specific allrandom.config?
>>>
>>> diff --git a/xen/Makefile b/xen/Makefile
>>> index ca571103c8..cb1eca76c2 100644
>>> --- a/xen/Makefile
>>> +++ b/xen/Makefile
>>> @@ -336,11 +336,14 @@ ifeq ($(config-build),y)
>>>  # *config targets only - make sure prerequisites are updated, and
>>> descend
>>>  # in tools/kconfig to make the *config target
>>>  
>>> +ARCH_ALLRANDOM_CONFIG :=
>>> $(srctree)/arch/$(SRCARCH)/configs/allrandom.config
>>> +
>>>  # Create a file for KCONFIG_ALLCONFIG which depends on the
>>> environment.
>>>  # This will be use by kconfig targets
>>> allyesconfig/allmodconfig/allnoconfig/randconfig
>>>  filechk_kconfig_allconfig = \
>>>      $(if $(findstring n,$(XEN_HAS_CHECKPOLICY)), echo
>>> 'CONFIG_XSM_FLASK_POLICY=n';) \
>>> -    $(if $(KCONFIG_ALLCONFIG), cat $(KCONFIG_ALLCONFIG);) \
>>> +    $(if $(KCONFIG_ALLCONFIG), cat $(KCONFIG_ALLCONFIG); \
>>> +    $(if $(wildcard $(ARCH_ALLRANDOM_CONFIG)), cat
>>> $(ARCH_ALLRANDOM_CONFIG);) ) \
>>>      :
>>
>> Something along these lines may be okay, but why would the name be
>> "allrandom" when the config is used elsewhere as well?
> The naming is not optimal. "unused.config" or "ignored.config" would be
> a better choice.

I don't think "unused" or "ignored" are properly describing what such
a file would hold. I was vaguely playing with "fixed" or "forced", fwiw.

>>  Further, besides
>> keeping randconfig and all*config from creating unusable configs, it
>> will at least want considering whether in other cases that set of
>> fixed
>> values shouldn't be used as well then.
> If I understood you correctly, the other case is *defconfig targets.
> Therefore, the following targets might also need to be updated by
> merging "unused.config" with {defconfig,%_defconfig}:
> 
> 
> defconfig: $(obj)/conf
> ifneq ($(wildcard
> $(srctree)/arch/$(SRCARCH)/configs/$(KBUILD_DEFCONFIG)),)
> 	@$(kecho) "*** Default configuration is based on
> '$(KBUILD_DEFCONFIG)'"
> 	$(Q)$< $(silent) --
> defconfig=arch/$(SRCARCH)/configs/$(KBUILD_DEFCONFIG) $(Kconfig)
> else
> 	@$(kecho) "*** Default configuration is based on target
> '$(KBUILD_DEFCONFIG)'"
> 	$(Q)$(MAKE) -f $(srctree)/Makefile $(KBUILD_DEFCONFIG)
> endif
> 
> %_defconfig: $(obj)/conf
> 	$(Q)$< $(silent) --defconfig=arch/$(SRCARCH)/configs/$@
> $(Kconfig)
> 
> However, I believe it's possible that for *defconfig, a configuration
> should be set to N, but in randconfig, it is still acceptable to be set
> to Y.

I'm not sure *defconfig should be affected by what's in the "locked
down" config, assuming they're consistent with what may not be changed.
But of course one could also model this incrementally, such that
defconfigs don't need to repeat what the "locked down" one has.

Anyway, I think this needs sending an RFC with the right people in Cc,
such that this can be properly discussed.

Jan

