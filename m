Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8E75985FAE
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2024 16:03:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.804003.1214877 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stSbm-0006zc-Te; Wed, 25 Sep 2024 14:03:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 804003.1214877; Wed, 25 Sep 2024 14:03:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stSbm-0006xj-Qd; Wed, 25 Sep 2024 14:03:10 +0000
Received: by outflank-mailman (input) for mailman id 804003;
 Wed, 25 Sep 2024 14:03:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0GdR=QX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1stSbl-0006RE-9Z
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2024 14:03:09 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e36a9abc-7b46-11ef-99a2-01e77a169b0f;
 Wed, 25 Sep 2024 16:03:06 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a8d6d0fe021so1123981666b.1
 for <xen-devel@lists.xenproject.org>; Wed, 25 Sep 2024 07:03:06 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9393134c27sm211488266b.210.2024.09.25.07.03.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Sep 2024 07:03:05 -0700 (PDT)
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
X-Inumbo-ID: e36a9abc-7b46-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727272986; x=1727877786; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=NYCPEZuaPVBuCwWdHDCvb5lZREf3xp8+z+MQoN90KEQ=;
        b=G7FpO7jXg7k8YDDIq9PhZSY/nVu+Db1j9ve2ljaK6NujN77gmwEOBFXTwQS9rFeVb8
         rdztR12L1D6AB/pbldxE4H0NrRjNlqBVeM3k5lUveRGDM8G0wijv3uCtN7U95CN53rfx
         7fqxpx43n72Z7qH3zHwoaAQRw+erFmr8qq4Fs+rrXWy7l117fGD8wtGmsZYZ0e53LE09
         S9src7IkrWtwdzdCn6IdZg+veOJceFjoYJu4NNGIyNiaIJfLwxghPt4EP0LKlGDXsgYA
         bNujiUA738ltLoR+HhVV6xJ598NLPrfoawPn4vY3PN18a8QGA8WQK9k+H61mETDUyBBW
         GgTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727272986; x=1727877786;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NYCPEZuaPVBuCwWdHDCvb5lZREf3xp8+z+MQoN90KEQ=;
        b=vUIgBYzMDS1GoMVLDZkNzDCGOFMWiXbXUIQRX1TJaXh8BUqHttB7xlg073bJclLaHJ
         6R7VGe3AK3uzEfDJJqxf0j0wj0BKJmo839FqFG54Lte5fRUq6YCPeePhxREqAWm1qukW
         4KwPV7VsYBCeubEM1gIiD9RfzEJHNPOJTUa9vTkJZB6w1q4+pdZiwpL49dSWJNDjNoTE
         CM5l2nU5buqdEf+VLNUDi+0wDJj/vrENzhwsao+mlmTqZv64vNe/TAXN77JxHcgZ15J5
         YwfaUvrSj1E5MnHWgza0vhOYKFTJMINei3NsOlTbg3YzuEQz0dwc9siVHCMuOPATZsPn
         B7Pw==
X-Forwarded-Encrypted: i=1; AJvYcCV/9GjMY9HXMHFeI6nf1k6MN3Ce9CboiAO0U+y5XB/xTCHzujeSDAfZEcC+Vy7rVL7xd7ngjKCqGMg=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz+Junb5M/BGNv1QdpgoZ/SKmY7rMMJf1rx4Fhu71YgjKxt+tFo
	ChlEyPmGoHJzyZtaVfseQulYjDbtaWHFYHz/Hc9QuLqNdI/1TS7F11UW5Keqsw==
X-Google-Smtp-Source: AGHT+IFluV+FuuPHABE/gnFMMp98B2WWyZsXaMHvMo7q9bcfVKJUDC01AUop0Vs5w2a44oRmhrip1w==
X-Received: by 2002:a17:906:dc90:b0:a80:f6a0:9c3c with SMTP id a640c23a62f3a-a93a0100be6mr237661266b.0.1727272985731;
        Wed, 25 Sep 2024 07:03:05 -0700 (PDT)
Message-ID: <49bd385d-f27a-4ca6-b0d2-56a458b44a84@suse.com>
Date: Wed, 25 Sep 2024 16:03:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/22] x86/spec-ctrl: introduce Address Space Isolation
 command line option
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: alejandro.vallejo@cloud.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <20240726152206.28411-1-roger.pau@citrix.com>
 <20240726152206.28411-13-roger.pau@citrix.com>
 <c30b14a4-3fb2-4e2f-bdcc-81f587540811@suse.com>
 <ZvQQxijykD3cJNaJ@macbook.local>
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
In-Reply-To: <ZvQQxijykD3cJNaJ@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 25.09.2024 15:31, Roger Pau Monné wrote:
> On Wed, Aug 14, 2024 at 12:10:56PM +0200, Jan Beulich wrote:
>> On 26.07.2024 17:21, Roger Pau Monne wrote:
>>> --- a/docs/misc/xen-command-line.pandoc
>>> +++ b/docs/misc/xen-command-line.pandoc
>>> @@ -2387,7 +2387,7 @@ By default SSBD will be mitigated at runtime (i.e `ssbd=runtime`).
>>>  
>>>  ### spec-ctrl (x86)
>>>  > `= List of [ <bool>, xen=<bool>, {pv,hvm}=<bool>,
>>> ->              {msr-sc,rsb,verw,{ibpb,bhb}-entry}=<bool>|{pv,hvm}=<bool>,
>>> +>              {msr-sc,rsb,verw,{ibpb,bhb}-entry,asi}=<bool>|{pv,hvm}=<bool>,
>>
>> Is it really appropriate to hide this underneath an x86-only option? Even
>> of other architectures won't support it right away, they surely will want
>> to down the road? In which case making as much of this common right away
>> is probably the best we can do. This goes along with the question whether,
>> like e.g. "xpti", this should be a top-level option.
> 
> I think it's better placed in spec-ctrl as it's a speculation
> mitigation.

As is XPTI.

>  I can see your point about sharing with other arches,
> maybe when that's needed we can introduce a generic parser of
> spec-ctrl options?

Not sure how much could be generalized there.

>>> @@ -2449,6 +2449,11 @@ for guests to use.
>>>    is not available (see `bhi-dis-s`).  The choice of scrubbing sequence can be
>>>    selected using the `bhb-seq=` option.  If it is necessary to protect dom0
>>>    too, boot with `spec-ctrl=bhb-entry`.
>>> +* `asi=` offers control over whether the hypervisor will engage in Address
>>> +  Space Isolation, by not having sensitive information mapped in the VMM
>>> +  page-tables.  Not having sensitive information on the page-tables avoids
>>> +  having to perform some mitigations for speculative attacks when
>>> +  context-switching to the hypervisor.
>>
>> Is "not having" and ...
>>
>>> --- a/xen/arch/x86/include/asm/domain.h
>>> +++ b/xen/arch/x86/include/asm/domain.h
>>> @@ -458,6 +458,9 @@ struct arch_domain
>>>      /* Don't unconditionally inject #GP for unhandled MSRs. */
>>>      bool msr_relaxed;
>>>  
>>> +    /* Run the guest without sensitive information in the VMM page-tables. */
>>> +    bool asi;
>>
>> ... "without" really going to be fully true? Wouldn't we better say "as little
>> as possible" or alike?
> 
> Maybe better use:
> 
> "...by not having sensitive information permanently mapped..."
> 
> And a similar adjustment to the comment?

Yes, that's better.

>>> @@ -143,6 +148,10 @@ static int __init cf_check parse_spec_ctrl(const char *s)
>>>              opt_unpriv_mmio = false;
>>>              opt_gds_mit = 0;
>>>              opt_div_scrub = 0;
>>> +
>>> +            opt_asi_pv = 0;
>>> +            opt_asi_hwdom = 0;
>>> +            opt_asi_hvm = 0;
>>>          }
>>>          else if ( val > 0 )
>>>              rc = -EINVAL;
>>
>> I'm frequently in trouble when deciding where the split between "=no" and
>> "=xen" should be. opt_xpti_* are cleared ahead of the disable_common label;
>> considering the similarity I wonder whether the same should be true for ASI
>> (as this is also or even mainly about protecting guests from one another),
>> or whether the XPTI placement is actually wrong.
> 
> Hm, that's a difficult one.  ASI is a Xen implemented mitigation, so
> it should be turned off when spec-ctrl=no-xen is used according to the
> description of the option:
> 
> "spec-ctrl=no-xen can be used to turn off all of Xen’s mitigations"

Meaning (aiui) mitigations to protect Xen itself.

>>> @@ -378,6 +410,13 @@ int8_t __ro_after_init opt_xpti_domu = -1;
>>>  
>>>  static __init void xpti_init_default(void)
>>>  {
>>> +    ASSERT(opt_asi_pv >= 0 && opt_asi_hwdom >= 0);
>>> +    if ( (opt_xpti_hwdom == 1 || opt_xpti_domu == 1) && opt_asi_pv == 1 )
>>
>> There is a separate opt_asi_hwdom which isn't used here, but only ...
> 
> opt_asi_pv (and opt_asi_hvm) must be set for opt_asi_hwdom to also be
> set.  XPTI is sligtly different, in that XPTI could be set only for
> the hwdom by using `xpti=dom0`.

Hmm, I didn't even notice this oddity (as it feels to me) in parsing.
From the doc provided it wouldn't occur to me that e.g. "asi=pv" won't
affect a PV Dom0. That's (iirc) specifically why "xpti=" has a "hwdom"
sub-option.

>>> @@ -389,9 +428,9 @@ static __init void xpti_init_default(void)
>>>      else
>>>      {
>>>          if ( opt_xpti_hwdom < 0 )
>>> -            opt_xpti_hwdom = 1;
>>> +            opt_xpti_hwdom = !opt_asi_hwdom;
>>>          if ( opt_xpti_domu < 0 )
>>> -            opt_xpti_domu = 1;
>>> +            opt_xpti_domu = !opt_asi_pv;
>>>      }
>>
>> ... here?
>>
>> It would further seem desirable to me if opt_asi_hwdom had its default set
>> later, when we know the kind of Dom0, such that it could be defaulted to
>> what opt_asi_{hvm,pv} are set to. This, however, wouldn't be compatible
>> with the use here. Perhaps the invocation of xpti_init_default() would
>> need deferring, too.
> 
> Given the current parsing logic, opt_asi_hwdom will only be set when
> both opt_asi_{hvm,pv} are set.  Setting spec-ctrl=asi={pv,hvm} will
> only enable ASI for the domUs of the selected mode.
> 
> Hence deferring won't make any practical difference, as having
> opt_asi_hwdom enabled implies having ASI enabled for all domain
> types.

Right, another effect of me not having paid enough attention to that parsing
detail.

>>> @@ -643,22 +683,24 @@ static void __init print_details(enum ind_thunk thunk)
>>>             opt_eager_fpu                             ? " EAGER_FPU"     : "",
>>>             opt_verw_hvm                              ? " VERW"          : "",
>>>             boot_cpu_has(X86_FEATURE_IBPB_ENTRY_HVM)  ? " IBPB-entry"    : "",
>>> -           opt_bhb_entry_hvm                         ? " BHB-entry"     : "");
>>> +           opt_bhb_entry_hvm                         ? " BHB-entry"     : "",
>>> +           opt_asi_hvm                               ? " ASI"           : "");
>>>  
>>>  #endif
>>>  #ifdef CONFIG_PV
>>> -    printk("  Support for PV VMs:%s%s%s%s%s%s%s\n",
>>> +    printk("  Support for PV VMs:%s%s%s%s%s%s%s%s\n",
>>>             (boot_cpu_has(X86_FEATURE_SC_MSR_PV) ||
>>>              boot_cpu_has(X86_FEATURE_SC_RSB_PV) ||
>>>              boot_cpu_has(X86_FEATURE_IBPB_ENTRY_PV) ||
>>> -            opt_bhb_entry_pv ||
>>> +            opt_bhb_entry_pv || opt_asi_pv ||
>>>              opt_eager_fpu || opt_verw_pv)            ? ""               : " None",
>>>             boot_cpu_has(X86_FEATURE_SC_MSR_PV)       ? " MSR_SPEC_CTRL" : "",
>>>             boot_cpu_has(X86_FEATURE_SC_RSB_PV)       ? " RSB"           : "",
>>>             opt_eager_fpu                             ? " EAGER_FPU"     : "",
>>>             opt_verw_pv                               ? " VERW"          : "",
>>>             boot_cpu_has(X86_FEATURE_IBPB_ENTRY_PV)   ? " IBPB-entry"    : "",
>>> -           opt_bhb_entry_pv                          ? " BHB-entry"     : "");
>>> +           opt_bhb_entry_pv                          ? " BHB-entry"     : "",
>>> +           opt_asi_pv                                ? " ASI"           : "");
>>>  
>>>      printk("  XPTI (64-bit PV only): Dom0 %s, DomU %s (with%s PCID)\n",
>>>             opt_xpti_hwdom ? "enabled" : "disabled",
>>
>> Should this printk() perhaps be suppressed when ASI is in use?
> 
> Maybe, I found it useful during development to ensure the logic was
> correct, but I guess it's not of much use for plain users.  I will
> make the printing conditional to ASI not being uniformly enabled.
> 
> Maybe it would be useful to unify XPTI printing with the rest of
> mitigations listed in the "Support for PV VMs:" line?  Albeit that
> would drop the signaling of opt_xpti_hwdom.

Which is why I wouldn't want to "unify" it.

Jan

