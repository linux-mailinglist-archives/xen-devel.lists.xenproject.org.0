Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51FFAB3E1E6
	for <lists+xen-devel@lfdr.de>; Mon,  1 Sep 2025 13:44:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1104552.1455582 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ut2xE-0004OS-Py; Mon, 01 Sep 2025 11:44:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1104552.1455582; Mon, 01 Sep 2025 11:44:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ut2xE-0004LY-Mm; Mon, 01 Sep 2025 11:44:08 +0000
Received: by outflank-mailman (input) for mailman id 1104552;
 Mon, 01 Sep 2025 11:44:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UGQU=3M=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ut2xE-0004LS-7M
 for xen-devel@lists.xenproject.org; Mon, 01 Sep 2025 11:44:08 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f7b2451f-8728-11f0-8adc-4578a1afcccb;
 Mon, 01 Sep 2025 13:44:07 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-b0411b83aafso233304766b.1
 for <xen-devel@lists.xenproject.org>; Mon, 01 Sep 2025 04:44:07 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b0424cc1698sm282617866b.21.2025.09.01.04.44.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Sep 2025 04:44:06 -0700 (PDT)
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
X-Inumbo-ID: f7b2451f-8728-11f0-8adc-4578a1afcccb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756727047; x=1757331847; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YYOniGEgcJohxqUkIJcHzCC/FI6aGs5q7b2FmE7WcAY=;
        b=FGiacuYDa1EK/hrttoGSW0fQOsUXVD1V13C1Nd83VToA+irgc8AWPeKMkErrJ6FkVh
         se/w+HjwNOhEQWNv6gWYb+2Ku4ZBHE8rN6xkrB2Y69wZ6skFZYvtda9hpiBM/S2Qj303
         1nxIjrJwJmPIdTpGWPXhhN5W4L33I5z+y1BTnp04Ua7arHFbXTwSHRb/AbWF1qWN5bXe
         Pzsng68Ez4Xkz3udfub1QSZifyoaVuVWxGWQsRLE5jUfP+f2dEy7oUJzxrtpxriaJsvj
         DwdCXBzKeSFS2b7nEGyCQH8v7ksmtDCkSnQ2k0NDJLzQnG38+iTzjjSHmHOY9k+BZKSQ
         BVUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756727047; x=1757331847;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YYOniGEgcJohxqUkIJcHzCC/FI6aGs5q7b2FmE7WcAY=;
        b=bS2A07A3kaYgMEWwkqALXShvh+tXamO7b+RdA6Lpf9umKhb8NtRuDhfer3ziG79UAZ
         QfIIERK1g87514t5STkkpXq7/oHbu4TEs2siTL94HMjt0qQkq1i5eLKzgEfVVjLdVrDs
         8hfqX5NySFwZnc7EfNcMKbdzQ0NdJAMylOVeQUJ/oMIpfDXDjPAQgxuhAoRUbHug8Vp2
         csvJk5Jolj6mk5wz6qrnYJU1slzZciCvSBo6dXUI5Yzzc3hALyNmARmznvHbt3kA1eou
         emZ7QabpBxVZ9kbUq7DuiKUsuJz2EYmlX2x4FR8LcGTRJNxVMUYPNjixpAMy54llPLCn
         xjpg==
X-Forwarded-Encrypted: i=1; AJvYcCXolUgLwW7sxAd+2dZe+AyDjdjv51uajnSAECvxDqH6K9PmMeI7M1KkCe+G+PiBDR9t3D7RycNRkMw=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw1AnNnGDbiBoSbq3O+P56x1M4ihEBiwEe77CTDKq3SeWgLVTvP
	84+DPdu3cko3slGJpTo14QMBw8fFAmjp/UmldKDHvTyLqj96kPnPkxOLn1RsbRermA==
X-Gm-Gg: ASbGnct/477UJ0qgSl5b9x7Iwjch9h2qMJ+3hwu7N7q7b4n597RSQW+5KJe4BWpZspb
	ahX0otZidMIuaEGBluLYngAjSkzyfTJBb7pFyosDSm5hJbjBRGO8PNfCJbse1q109U+V9YkHBqB
	N2aKZ+8OP9xwRxRND3vKAi8M/u3jESmGfGa11GotCunqNOrx1JHde+1mSy7G+3K5KEQ0LoHtSjp
	iwFCz6iWLhPsM2W5w5Qz3cMr4TP5SnzsRlwqlwL0tQuy3xHXobiixd/I9wbApVJozzm3vsM6fZF
	7DbEc7dG7alqRiYT7X9T+SJPaH/NSPhoFwhLMZlmlXSlbRP/U3a/M9tvZO/AGjtKVxUGzgn+4+P
	AeQEYilGpO1tpodL4Aw6Pq0wL0f1UqDceEG5qYP3s9FwUP3c6qsF/yYM0NWt0C3wdypQdNML+d0
	kcr8ophQ0=
X-Google-Smtp-Source: AGHT+IGY1Kt/D6voeF9Ad8ogPhOYR2ctCzoyAeSJ0pRbvqHN4CiASdP2kb3ZYVKe9mlbQlw1V0hy7Q==
X-Received: by 2002:a17:907:97ce:b0:afe:63ae:c337 with SMTP id a640c23a62f3a-b01e6e63ebemr891759966b.57.1756727046692;
        Mon, 01 Sep 2025 04:44:06 -0700 (PDT)
Message-ID: <acdd8d89-37c4-4dee-a9d1-72268e58256b@suse.com>
Date: Mon, 1 Sep 2025 13:44:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86: Fix AMD_SVM and INTEL_VMX dependency
To: "Orzel, Michal" <michal.orzel@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20250901104329.25693-1-michal.orzel@amd.com>
 <4012a431-0d1d-400e-a0f4-b2ece3439441@suse.com>
 <4f59cfd8-dff6-4ac0-beda-13ccd161d628@amd.com>
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
In-Reply-To: <4f59cfd8-dff6-4ac0-beda-13ccd161d628@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01.09.2025 13:25, Orzel, Michal wrote:
> 
> 
> On 01/09/2025 13:19, Jan Beulich wrote:
>> On 01.09.2025 12:43, Michal Orzel wrote:
>>> Commit e3ed540f2e9f was meant to make AMD_SVM dependent on AMD and
>>> INTEL_VMX on INTEL. Such dependency should be done using 'depends on'
>>> and not 'if' next to prompt that deals only with the visibility of the
>>> given Kconfig option. This makes it impossible to e.g. disable INTEL_VMX
>>> when INTEL is disabled (option is hidden).
>>
>> Hmm, yes, just that ...
>>
>>> --- a/xen/arch/x86/hvm/Kconfig
>>> +++ b/xen/arch/x86/hvm/Kconfig
>>> @@ -16,7 +16,8 @@ menuconfig HVM
>>>  if HVM
>>>  
>>>  config AMD_SVM
>>> -	bool "AMD-V" if AMD && EXPERT
>>> +	bool "AMD-V" if EXPERT
>>> +	depends on AMD
>>>  	default y
>>>  	help
>>>  	  Enables virtual machine extensions on platforms that implement the
>>> @@ -25,7 +26,8 @@ config AMD_SVM
>>>  	  If in doubt, say Y.
>>>  
>>>  config INTEL_VMX
>>> -	bool "Intel VT-x" if INTEL && EXPERT
>>> +	bool "Intel VT-x" if EXPERT
>>> +	depends on INTEL
>>>  	default y
>>>  	select ARCH_VCPU_IOREQ_COMPLETION
>>>  	help
>>
>> ... now it becomes impossible to _enable_ INTEL_VMX when INTEL is disabled,
>> yet which may be of interest if you target some other vendor's VMX
>> implementation. Perhaps really we should have
>>
>> config INTEL_VMX
>> 	bool "Intel VT-x" if EXPERT
>>  	default INTEL
> I did not think such configuration makes sense (VMX without INTEL)
> which is in line with the last sentence from the mentioned commit.

Just like Hygon CPUs support AMD's SVM (which we cover), VIA's and Shanghai
iirc support VMX (which we don't cover very well, but which we also shouldn't
break knowingly).

Jan

