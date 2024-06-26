Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58F1D917E05
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2024 12:32:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.748721.1156529 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMPwR-0001dp-7M; Wed, 26 Jun 2024 10:31:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 748721.1156529; Wed, 26 Jun 2024 10:31:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMPwR-0001bf-3a; Wed, 26 Jun 2024 10:31:55 +0000
Received: by outflank-mailman (input) for mailman id 748721;
 Wed, 26 Jun 2024 10:31:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WUJr=N4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sMPwP-0001bZ-P6
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2024 10:31:53 +0000
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [2a00:1450:4864:20::22b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4d97c9cd-33a7-11ef-90a3-e314d9c70b13;
 Wed, 26 Jun 2024 12:31:52 +0200 (CEST)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2ec17eb4493so88407161fa.2
 for <xen-devel@lists.xenproject.org>; Wed, 26 Jun 2024 03:31:52 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2c8d7e5c46asm1307206a91.5.2024.06.26.03.31.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jun 2024 03:31:51 -0700 (PDT)
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
X-Inumbo-ID: 4d97c9cd-33a7-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1719397912; x=1720002712; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nfFTNrGHQaG72YKlw5OfVon/okQOPf5apgYkqAlwkGo=;
        b=Ecwcg/ZQLrsCbS/QXKpokmVD445MXIjvoPLfE5Bmzu08/I6A3L8iT91SZ6Jbf1Bmj4
         2JZIYwrAuK5NCTlXVVP5p1zmKbH0oghbmS78PNVuriIbjXSJYjwaRN6E/5IL4tTcedr4
         neXR6nywJlAFt+LobNX5CVeLSJYlMuyYSH1QE8hYxs2v4g/osXBts14KTQ31OmcKkSGp
         1QgHDoozPJidhVLDMMZBsXEfwmniUsj+w424CHfqwq95PjkKM3us6eZANNHtBEUKauE9
         dfPG/ej3BIm1+dkRVA/i/LjLa+v+Sbjj8vVchX6QAGhsm0cehfMQcsrL9mC6uN46wipl
         mr0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719397912; x=1720002712;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nfFTNrGHQaG72YKlw5OfVon/okQOPf5apgYkqAlwkGo=;
        b=Wd8Aj5kl0azmf/eVQotA94XR0NCEZmTMnOhfsaivTb5gNn/IUyWhewi3rhaXGsijhC
         b3imcZkzj2Lsskzi65tcqfF+XxLmZEArGUFLZdUq4V+AtFupufwq5lO1ryBuijm2xzKY
         nXTKbRPjX3O7hRaVn4vRONGGgcTk12I2hqu523o62jwHdHb3bbx02SQGPu2I/is37yBK
         sRBbNCnDUZVHk8j0gJTBg9YnDlPw/jLi+gIHvawyA3cFJncwdWSlMXnm+fvxA3k++5vC
         hzGPhpc0twyS4uSJQSv0hikbyQymyK4zJ76URFXVPKowSFK3kTB2xl4CcOdi1r3yMHUi
         pitg==
X-Forwarded-Encrypted: i=1; AJvYcCV7pxgPEcS8XZNY6iSGCzLG3yiYUYGoonY/q/Nxk+RoXqfKEXSNQQiwSrD+3d4fYTla0MxEu3XINV3ybaMRB3aFf8pidc2eGtdaEG6f9Xs=
X-Gm-Message-State: AOJu0YwNzwZmyj2BFLV5pK+rGaJ4nQnWiLtwx2/bzi4cE3Zwl3ucoi3d
	MNkJ4gPlGd9EH15jXfQj2lQ5SF5nRF2HGeWeDaNWOx14Jp39z1wa2DOFz1sIeNxhshhhyRuH/U0
	=
X-Google-Smtp-Source: AGHT+IE3K6YDy56oBMe/cCGpZWqrnyLqFvwRJamfk5nFfI/k1CHIpghVTk7rEgAca4AGn/68tVB8rg==
X-Received: by 2002:a2e:9054:0:b0:2ed:59af:ecb4 with SMTP id 38308e7fff4ca-2ed59afee82mr13382191fa.41.1719397912113;
        Wed, 26 Jun 2024 03:31:52 -0700 (PDT)
Message-ID: <0c88d86e-f226-4225-b723-a6662fcd5bef@suse.com>
Date: Wed, 26 Jun 2024 12:31:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v3 05/16] xen/x86: address violations of MISRA C:2012
 Directive 4.10
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: Simone Ballarin <simone.ballarin@bugseng.com>, consulting@bugseng.com,
 sstabellini@kernel.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org,
 Anthony Perard <anthony@xenproject.org>
References: <cover.1710145041.git.simone.ballarin@bugseng.com>
 <dd042e7d17e7833e12a5ff6f28dd560b5ff02cf7.1710145041.git.simone.ballarin@bugseng.com>
 <dce6c44d-94b7-43bd-858a-9337336a79cf@suse.com>
 <ef623bad297d016438b35bedc80f091d@bugseng.com>
 <ec92611e-6762-4b6c-af3e-999b748d1f1b@suse.com>
 <797b00049612507d273facc581b2c2c5@bugseng.com>
 <a5009c3e-cba6-4737-aaff-c3b79a11169c@suse.com>
 <e3ae670923fd061986e27b3f95833b88@bugseng.com>
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
In-Reply-To: <e3ae670923fd061986e27b3f95833b88@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.06.2024 12:25, Nicola Vetrini wrote:
> On 2024-06-26 11:26, Jan Beulich wrote:
>> On 26.06.2024 11:20, Nicola Vetrini wrote:
>>> On 2024-06-26 11:06, Jan Beulich wrote:
>>>> On 25.06.2024 21:31, Nicola Vetrini wrote:
>>>>> On 2024-03-12 09:16, Jan Beulich wrote:
>>>>>> On 11.03.2024 09:59, Simone Ballarin wrote:
>>>>>>> --- a/xen/arch/x86/Makefile
>>>>>>> +++ b/xen/arch/x86/Makefile
>>>>>>> @@ -258,18 +258,20 @@ $(obj)/asm-macros.i: CFLAGS-y += -P
>>>>>>>  $(objtree)/arch/x86/include/asm/asm-macros.h: $(obj)/asm-macros.i
>>>>>>> $(src)/Makefile
>>>>>>>  	$(call filechk,asm-macros.h)
>>>>>>>
>>>>>>> +ARCHDIR = $(shell echo $(SRCARCH) | tr a-z A-Z)
>>>>>>
>>>>>> This wants to use :=, I think - there's no reason to invoke the 
>>>>>> shell
>>>>>> ...
>>>>>
>>>>> I agree on this
>>>>>
>>>>>>
>>>>>>>  define filechk_asm-macros.h
>>>>>>> +    echo '#ifndef ASM_$(ARCHDIR)_ASM_MACROS_H'; \
>>>>>>> +    echo '#define ASM_$(ARCHDIR)_ASM_MACROS_H'; \
>>>>>>>      echo '#if 0'; \
>>>>>>>      echo '.if 0'; \
>>>>>>>      echo '#endif'; \
>>>>>>> -    echo '#ifndef __ASM_MACROS_H__'; \
>>>>>>> -    echo '#define __ASM_MACROS_H__'; \
>>>>>>>      echo 'asm ( ".include \"$@\"" );'; \
>>>>>>> -    echo '#endif /* __ASM_MACROS_H__ */'; \
>>>>>>>      echo '#if 0'; \
>>>>>>>      echo '.endif'; \
>>>>>>>      cat $<; \
>>>>>>> -    echo '#endif'
>>>>>>> +    echo '#endif'; \
>>>>>>> +    echo '#endif /* ASM_$(ARCHDIR)_ASM_MACROS_H */'
>>>>>>>  endef
>>>>>>
>>>>>> ... three times while expanding this macro. Alternatively (to avoid
>>>>>> an unnecessary shell invocation when this macro is never expanded 
>>>>>> at
>>>>>> all) a shell variable inside the "define" above would want
>>>>>> introducing.
>>>>>> Whether this 2nd approach is better depends on whether we 
>>>>>> anticipate
>>>>>> further uses of ARCHDIR.
>>>>>
>>>>> However here I'm not entirely sure about the meaning of this latter
>>>>> proposal.
>>>>> My proposal is the following:
>>>>>
>>>>> ARCHDIR := $(shell echo $(SRCARCH) | tr a-z A-Z)
>>>>>
>>>>> in a suitably generic place (such as Kbuild.include or maybe
>>>>> xen/Makefile) as you suggested in subsequent patches that reused 
>>>>> this
>>>>> pattern.
>>>>
>>>> If $(ARCHDIR) is going to be used elsewhere, then what you suggest is
>>>> fine.
>>>> My "whether" in the earlier reply specifically left open for
>>>> clarification
>>>> what the intentions with the variable are. The alternative I had
>>>> described
>>>> makes sense only when $(ARCHDIR) would only ever be used inside the
>>>> filechk_asm-macros.h macro.
>>>
>>> Yes, the intention is to reuse $(ARCHDIR) in the formation of other
>>> places, as you can tell from the fact that subsequent patches 
>>> replicate
>>> the same pattern. This is going to save some duplication.
>>> The only matter left then is whether xen/Makefile (around line 250, 
>>> just
>>> after setting SRCARCH) would be better, or Kbuild.include. To me the
>>> former place seems more natural, but I'm not totally sure.
>>
>> Depends on where all the intended uses are. If they're all in 
>> xen/Makefile,
>> then having the macro just there is of course sufficient. Whereas when 
>> it's
>> needed elsewhere, instead of exporting putting it in Kbuild.include 
>> would
>> seem more natural / desirable to me.
>>
> 
> The places where this would be used are these:
> file: target (or define)
> xen/build.mk: arch/$(SRCARCH)/include/asm/asm-offsets.h: asm-offsets.s
> xen/include/Makefile: define cmd_xlat_h
> xen/arch/x86/Makefile: define filechk_asm-macros.h
> 
> The only issue that comes to my mind (it may not be one at all) is that 
> SRCARCH is defined and exported in xen/Makefile after including 
> Kbuild.include, so it would need to be defined after SRCARCH is 
> assigned:
> 
> include scripts/Kbuild.include
> 
> # Don't break if the build process wasn't called from the top level
> # we need XEN_TARGET_ARCH to generate the proper config
> include $(XEN_ROOT)/Config.mk
> 
> # Set ARCH/SRCARCH appropriately.
> 
> ARCH := $(XEN_TARGET_ARCH)
> SRCARCH := $(shell echo $(ARCH) | \
>      sed -e 's/x86.*/x86/' -e 's/arm\(32\|64\)/arm/g' \
>          -e 's/riscv.*/riscv/g' -e 's/ppc.*/ppc/g')
> export ARCH SRCARCH
> 
> Am I missing something?

In that case the alternatives are exporting or using = rather than := in
Kbuild.include, i.e. other than initially requested. Personally I dislike
exporting to a fair degree, but I'm not sure which one's better in this
case. Cc-ing Anthony for possible input.

Jan

