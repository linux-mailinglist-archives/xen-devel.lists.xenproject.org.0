Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D6FAAD6999
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jun 2025 09:53:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1012479.1390938 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPcju-0001Tr-0l; Thu, 12 Jun 2025 07:52:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1012479.1390938; Thu, 12 Jun 2025 07:52:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPcjt-0001SC-Ty; Thu, 12 Jun 2025 07:52:45 +0000
Received: by outflank-mailman (input) for mailman id 1012479;
 Thu, 12 Jun 2025 07:52:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TRIX=Y3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uPcjt-0001S6-2R
 for xen-devel@lists.xenproject.org; Thu, 12 Jun 2025 07:52:45 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 379b7706-4762-11f0-b894-0df219b8e170;
 Thu, 12 Jun 2025 09:52:41 +0200 (CEST)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3a4f379662cso561396f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 12 Jun 2025 00:52:41 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-313c1b5efa2sm829233a91.41.2025.06.12.00.52.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Jun 2025 00:52:39 -0700 (PDT)
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
X-Inumbo-ID: 379b7706-4762-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749714761; x=1750319561; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9NCPsqwJKJYtAS51CI1sh85u3p3RB5+6ZXXom88mXuA=;
        b=Ra0QR/uhQ39JJ2VzjokEMV0yGCMqk9PigKno03EJhKP6/35jDxS74PWmNv0YqNHH98
         aNuQ4QUKM02ILTHi3xTGYTKaod0A0t/8ZZCAupVKxd9pDXqFpwYkdRaUNgSNnQzKXvzt
         l5eTQutcFaWsLkQBwpbU0bMgW0KIFmF1/Bs8zgyVnZyXTio0Gnc07mo6ySh5+ii9IiN7
         MmNUVyfo4Ew6f5A8fLywBrn60uMwNNV0MzYf/NYjRVPNLhQfLVpI+jDE13/oXhoiqxK0
         t9ZoRFglTKZoY8owIceZWH5ZurgawvofyxwtmTsfgdSqD6QpbfsShGmcdKe0Yji5WbOK
         4PEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749714761; x=1750319561;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9NCPsqwJKJYtAS51CI1sh85u3p3RB5+6ZXXom88mXuA=;
        b=fZ8uWNbTz2qkqFNdtH69KlJj5JJWjQ0XwAMslIG2vm+DgyXi+l9sloqUNY2mbQKVK5
         ORMQuJ4K4DaZwtDxJEro0kzCo3q6FlNUrVhPq4Fai7MBnc0TuvdBoQl5DdYoz6Z2sEIn
         FaO6qiGC3N/lt609XgSCR5DBbPtjX+cQUh8NdbEhGoQiNiqWGmeRvrl7IYSU/+n45RqI
         B61vy266Js/HFuV6ryL/FKjYyM6eSaLos0OuI0CIMroaACEyt1IrgrfyOWZtAwQ4EBlz
         Bi4Pcw8yEugRImLUT2xEe63Y7nfivMXUUy3K9dxOddpcyqI97N0t496ZhIE0eigvqRw2
         EP9Q==
X-Forwarded-Encrypted: i=1; AJvYcCXqS2YT/jcFR4kcd7HiE3wkEngOX3jCWaH2Apyy+0NRsYYPFt+ibkQjKtHR3dUMl13afN4dYsUJQ9s=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzIjcV8PNnikDGdJxhP0Vql6ZzwtLV9ERjUJNI4By0BmqjWqp+y
	iZsoSQxy3jnec67PZX6/0XgTM5slm1NKCxRtNTvv+djE+HjKSx97f2HAyaGbYfa1Mg==
X-Gm-Gg: ASbGncvg5HlAWzHMxOT2pRgxBN+0h+iyWRqg/LrqVcxDG3rhWSZtOw72q2iiwmZlKHz
	FQ8h+4E/c5tfbv01bz2CaheFdLTNkSzr+7iOavkYVyOy7nwT46HFXbMEaeiync4Ze20gZBWKCp3
	POjExl8H3wz9kX+29yAztx0huT0UO7Ytsvhf6DRDzQpU/yXrGwfSF0xLMg0TOUEsrbHDuv6Byoe
	S2mvgWugoLMX5yJuHgtLpRFDFgeRUddonV3TbQH6DMeEPAdB4GjT7ErqfgNG4NSmJahJh0kJ0u7
	9AmT8MhBYPd3SezVq8ANpEKqNQmls0WPUbtDtYo2EfXUAvdb3KnsMT0hUc6YWwFc5k3QG7Qarmv
	HVe7lZ1WbCWzlvmcTbq5NvUdvvdCXIQ0EoCu/7y+kSGK5H2I=
X-Google-Smtp-Source: AGHT+IFIv9SxT9/QQGvFoYRUwswy5n0Y7fat8/JkNB8D4Bi3XYAiIjjJPJd02wBVWgZ4BR51dEbz5Q==
X-Received: by 2002:a05:6000:40df:b0:3a4:dd8e:e16d with SMTP id ffacd0b85a97d-3a56133d9afmr1516515f8f.15.1749714760812;
        Thu, 12 Jun 2025 00:52:40 -0700 (PDT)
Message-ID: <805abeee-0cad-4cc9-88ae-77e4c1e23fac@suse.com>
Date: Thu, 12 Jun 2025 09:52:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] xsm/silo: Support hwdom/control domains
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <20250610225737.469690-1-jason.andryuk@amd.com>
 <20250610225737.469690-3-jason.andryuk@amd.com>
 <0f47268e-0674-46e7-bfd4-8a395ee1ddf6@suse.com>
 <6cc69b45-7347-4250-ab32-a1e2857b7d23@amd.com>
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
In-Reply-To: <6cc69b45-7347-4250-ab32-a1e2857b7d23@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.06.2025 06:20, Jason Andryuk wrote:
> On 2025-06-11 09:17, Jan Beulich wrote:
>> On 11.06.2025 00:57, Jason Andryuk wrote:
>>> In a disaggregated environment, dom0 is split into Control, Hardware,
>>> and Xenstore domains, along with domUs.  The is_control_domain() check
>>> is not sufficient to handle all these cases.  Add is_priv_domain() to
>>> support allowing for the various domains.
>>>
>>> The purpose of SILO mode is to prevent domUs from interacting with each
>>> other.  But dom0 was allowed to communicate with domUs to provide
>>> services.  As the disaggregation of dom0, Control, Hardware and Xenstore
>>> are all service domains that need to communicate with other domains.
>>>
>>> To provide xenstore connections, the Xenstore domain must be allowed to
>>> connect via grants and event channels.  Xenstore domain must also be
>>> allowed to connect to Control and Hardware to provide xenstore to them.
>>
>> Are you suggesting that SILO at present is incompatible with a Xenstore
>> domain? silo_mode_dom_check() in its original form has no special
>> precautions, after all.
> 
> Yes, it is incompatible with the current silo_mode_dom_check().  Only 
> Control domain is allowed to use grants and event channels with a domU. 
> A Xenstore domain would be denied.
> 
> Xenstore stubdom only exists for x86 today.  My limited attempts to run 
> xenstored in an dedicated Xenstore ARM Linux domain have failed.

This may want sorting independently first. Once sorted, the requirements
here may become more clear.

>>> Hardware domain will provide PV devices to domains, so it must be
>>> allowed to connect to domains.
>>
>> As a built-in policy, isn't this already going too far? There could
>> conceivably be configurations with only pass-through devices in use, in
>> which case neither grants nor the event channels operations intercepted
>> by SILO would be required.
> 
> Such a domain wouldn't have any PV devices configured?

Indeed, that's my point: Why would Hardware then have a need to be
allowed to connect to domains.

>  I don't think this changes anything compared to today.

I don't think I see what you mean to tell me with this. What we're
discussing here is the effect of the separation you're suggesting,
which necessarily is different from what we have today.

> Both sides need to be configured and opt-in.  Hardware is a system 
> domain, so it should be possible to allow grants and event channels. 
> But they won't be used unless configured.

"Won't be used" isn't enough, imo. Isn't disaggregation about proper
isolation, i.e. to guarantee that unwanted interactions can't occur?

>>> That leaves Control.  Xenstore and Hardware would already allow access
>>> to Control, so it can obtain services that way.  Control should be
>>> "privileged", which would mean it can make the connections.  But with
>>> Xenstore and Hardware providing their services to domUs, there may not
>>> be a reason to allow Control to use grants or event channels with domUs.
>>> Still, Control is privileged, so it should be allowed to do something if
>>> it chooses.  Establishing a grant, or event channel requires action on
>>> both sides, so allow for the possibility.  This does open up an argo
>>> wildcard ring from domUs, FWIW.
>>
>> Along the lines of my reply to patch 1, I think Hardware and Control
>> need to have a pretty strong boundary between them. It's hard to see,
>> for example, whether grant map/copy/transfer would indeed make sense
>> between the two.
> 
> The Hardware domain might provide a PV device to Control?
> 
> I've tested removing control:
> static bool is_priv_domain(const struct domain *d)
> {
>      return is_xenstore_domain(d) || is_hardware_domain(d);
> }
> 
> And that works in my limited ARM dom0less testing.  The toolstack isn't 
> really exercised in that case.  It seems strange that the privileged 
> control domain is *not* allowed though.

With the intended separation, there's (imo) not going to be any
all-mighty domain anymore. Neither Hardware nor Control.

>> Similarly I'm not convinced a strong boundary isn't also needed
>> between Xenstore and Hardware.
> 
> If hardware is providing PV devices to domains, it will need access to 
> Xenstore.  I don't see how you can get around it.
> 
> I tried to explain this in the first paragraph.  SILO's purpose was to 
> isolate domUs from each other, but allow it to access dom0.  dom0 
> embodies the control, hardware, and xenstore capabilities.  So as a 
> first approximation, each of Control, Hardware, and Xenstore should be 
> allowed to communicate with domUs.

Yes. Yet what to permit between the three special entities is far less
clear. Hence why I'm unconvinced this can be expressed by SILO, and
would rather require Flask.

> domUs needs to communicate with Xenstore and Hardware for PV devices.
> 
> Xenstore provides Xenstore access to Hardware.
> 
> Control would want Xenstore access.
> 
> I don't know if this helps, but here's a table:
> 
>      | CTL | HW  | XS  | domU
> ----------------------------
> CTL |     |  ?  |  y  |  ?
> HW  |  ?  |     |  y  |  y
> XS  |  y  |  y  |     |  y
> domU|  ?  |  y  |  y  |  x
> 
> Control and Hardware would be y if we allow PV devices
> 
> Control and domUs - I don't have an immediate rational for them.  Except 
> that Control is privileged.  I've been running xenconsoled in Hardware. 
> If xenconsoled is in Control, then access would be required.

Perhaps some clarification is first need about what Control really is
(and is not). It is sole the domain to create other domains. But beyond
that things become unclear. E.g. xenconsoled may not belong into either
Hardware or Control.

>>> --- a/xen/xsm/silo.c
>>> +++ b/xen/xsm/silo.c
>>> @@ -20,6 +20,12 @@
>>>   #define XSM_NO_WRAPPERS
>>>   #include <xsm/dummy.h>
>>>   
>>> +static bool is_priv_domain(const struct domain *d)
>>> +{
>>> +    return is_xenstore_domain(d) || is_hardware_domain(d) ||
>>> +           is_control_domain(d);
>>> +}
>>
>> This construct expands to two evaluate_nospec(), which likely isn't
>> wanted. Some open-coding may be pretty much unavoidable here.
> 
> Thanks, yes, good point.
> 
>> (I'm
>> surprised it's not three, i.e. I find it odd that is_xenstore_domain()
>> doesn't also use that guard.)
> 
> It looks okay to me.  There were only 2 uses until I added a 3rd in the 
> dom0less code.  The XSM check has evaluate_nospec() and the other 2 uses 
> aren't security critical - Setting a domain info flag, and __init code 
> for dom0less.  Maybe moving the evaluate_nospec() would be safer in case 
> use grows in the future, but it looks okay to me today.

When some of the hardening was first introduced, actual use sites were
indeed taken into account. That wasn't quite right though, I think. Any
such construct ought to be safe to use anywhere. For uses with clearly
no concerns towards speculative abuse, a 2nd lightweight form of such
constructs should then exist, imo. As to your use of "security critical":
I'm not convinced you what mean is covering the potential of speculative
abuse of involved code paths.

Jan

