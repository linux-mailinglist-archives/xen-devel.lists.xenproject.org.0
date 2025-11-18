Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A292AC69A22
	for <lists+xen-devel@lfdr.de>; Tue, 18 Nov 2025 14:39:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1164766.1491687 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLLvm-0000ku-K1; Tue, 18 Nov 2025 13:39:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1164766.1491687; Tue, 18 Nov 2025 13:39:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLLvm-0000in-HD; Tue, 18 Nov 2025 13:39:38 +0000
Received: by outflank-mailman (input) for mailman id 1164766;
 Tue, 18 Nov 2025 13:39:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=maYy=52=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vLLvl-0000if-16
 for xen-devel@lists.xenproject.org; Tue, 18 Nov 2025 13:39:37 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 05a37da1-c484-11f0-9d18-b5c5bf9af7f9;
 Tue, 18 Nov 2025 14:39:36 +0100 (CET)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-640a503fbe8so9557162a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 18 Nov 2025 05:39:36 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6433a4b1fadsm13697576a12.31.2025.11.18.05.39.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Nov 2025 05:39:34 -0800 (PST)
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
X-Inumbo-ID: 05a37da1-c484-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763473175; x=1764077975; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YExxYdA3mXEoxETd+tuMXcDg0yE/yxcQGKFlhqouBd4=;
        b=Ne1Ffmmk9DDKKVWy8HUjErlx0BAssqe2Lcg/dq1JZkhQzLcabrRgi/234zYqEGA9PG
         b0hy7pRSR8tocoyK5ORhJYxoQ20ORprYO28g1NDzeKk+srw+fZWX6T8IJtSZ8gsyoayN
         d3O2VQ8gWEF2NQz9C0WHx4d6uuq/M5haUG1qJLp6hX6PBKOp0zJKy4d9R9HE14odjV2E
         b5zNOTP5Cettz6IfeakHXET6sw7QDzG3oowwygVS6ZIfCSVFXAygfLhrRcZbk3KfMP9T
         QlXABRZQ9vImDojkryI/zoZ2nCl/RAIAwxXn3qbjF0Yu1MM911KH+bR37F/8TO8LGUdL
         V1tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763473175; x=1764077975;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YExxYdA3mXEoxETd+tuMXcDg0yE/yxcQGKFlhqouBd4=;
        b=rcyWf2z6WwfnpRXL5NcQZlgNfUvWGxmaDWGFYudqoDvafxoI9H5+YpO4rTZC0bwpXz
         b5/OzgyVfnzwXS+bWQ8n4jyl+ZBKoDu8IhbPC9OLWrpv/0IkXsC7/o4XbC4iJgydmbBn
         HcKbGLfKekctCGV+5KTSSa4TpnKMxmnxnyB3LdoFxgHL5R15zvas01eJUOmlVMdpswkw
         NO8rSPXtvmO6rxxUrkh5M//YSbPcsQLwqM2u8cZyhD/+iee2cvpEcsnv6RQJ43601YgT
         ioVjV3OkLECz0LWtbJWZ2FTzYz21fOpKaG1nL9O9KiaoTGkHESXW6GeSAOfT0pjWKr86
         apKA==
X-Forwarded-Encrypted: i=1; AJvYcCXLLJDh1b6/jH3K10o+uLtXJTm+yfCKyI3M1SDCdVEMfUgz6BVD9wbUfcPBN87jPy6RZtSSlt0jrBo=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy4jwPC5w2tixicBecHLn6QpOSr+nn1Tj8t4p16IzwR1Gl0HuSt
	RJuFBJv5RP8w9wAxyUJRXcpQTvaAtUJVuMQzaqBvgOjRtCoOEd1GWFPPx6/ENO2kag==
X-Gm-Gg: ASbGnctrikZ9hmJULoWiqIHXvTV06pSKpevP7Wyu8FHsDpQTLAvbK9RzEBSKSqyrOmj
	INyk4nRFQR616ZMSeKyr+gY9L7i4uS/qrZ38SyoWSS3L7UhjL1WtKAtVzdmTKrt33hZI4l7e1xz
	Q6vecMN/VKwVRgWfD/gTE/Ibn8DRsaw6bcwaSmJ7bXLsIM28rb3c2kvviMgPjIweEvx0MX0fvCg
	M2R7VPL9UkP58+SHcZzWnQ40JB14WORdrHnuGUKqfp1eQd1ZTgOrnS9ed7tf5AGB+P/J0wu0ubO
	D5q44EQ5Tjh7nK30R1QMHGBALhWhwT+f09CvVO7Y5YGhVV78kkMuyz+pFSSq7y1yUDeFY/1c33v
	/6h6IzEu4LT64NbYcST4IHbzQtP1+quztwNZ/VPcPmk6A/50D6UqETH9icZlmPTrhWKyzz6IhfF
	jCDvvcaGOMqzDzjpI+E5DLZ57sxt2ZwAqGmOBNcfG6lN39dPN8bmPpC+dbWAkEtYnMHwQQ9xCh5
	nf9mBRLfjQpBQ==
X-Google-Smtp-Source: AGHT+IEjF87qxNSk9eoVwq/msAFMfObf++dKtJGVa8Bg7AN4oxZNi+LvmkbMSeEr3wsXN0ZKC7OEcg==
X-Received: by 2002:a05:6402:4403:b0:640:b497:bf71 with SMTP id 4fb4d7f45d1cf-64350e006b3mr16824585a12.8.1763473175245;
        Tue, 18 Nov 2025 05:39:35 -0800 (PST)
Message-ID: <c5636b73-cbbe-4480-94ce-928d4f01dd74@suse.com>
Date: Tue, 18 Nov 2025 14:39:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH v3] xen: make VMTRACE support optional
To: Grygorii Strashko <grygorii_strashko@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 Teddy Astie <teddy.astie@vates.tech>, Penny Zheng <Penny.Zheng@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20251114142207.279834-1-grygorii_strashko@epam.com>
 <225378f4-0ebd-4c77-ae77-807bbb03b0bb@suse.com>
 <5ebcbafc-d391-4541-8df3-2742cef43be8@epam.com>
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
In-Reply-To: <5ebcbafc-d391-4541-8df3-2742cef43be8@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18.11.2025 13:42, Grygorii Strashko wrote:
> On 17.11.25 18:52, Jan Beulich wrote:
>> On 14.11.2025 15:22, Grygorii Strashko wrote:
>>> --- a/xen/arch/x86/hvm/Kconfig
>>> +++ b/xen/arch/x86/hvm/Kconfig
>>> @@ -35,6 +35,18 @@ config INTEL_VMX
>>>   	  If your system includes a processor with Intel VT-x support, say Y.
>>>   	  If in doubt, say Y.
>>>   
>>> +config VMTRACE
>>> +    bool "HW VM tracing support"
>>> +    depends on INTEL_VMX
>>> +    default y
>>> +    help
>>> +      Enables HW VM tracing support which allows to configure HW processor
>>> +      features (vmtrace_op) to enable capturing information about software
>>> +      execution using dedicated hardware facilities with minimal interference
>>> +      to the software being traced. The trace data can be retrieved using buffer
>>> +      shared between Xen and domain
>>> +      (see XENMEM_acquire_resource(XENMEM_resource_vmtrace_buf)).
>>
>> Please check adjacent options above or ...
>>
>>>   config HVM_FEP
>>>   	bool "HVM Forced Emulation Prefix support (UNSUPPORTED)" if UNSUPPORTED
>>>   	default DEBUG
>>
>> ... below for how proper indentation would look like here.
> 
> There is a mix in Kconfigs - some places <Tabs> some places <Spaces> :(
> Will change to <Tabs>

Any place where only spaces are used is malformed. "help" text with its special
indentation is a separate thing, of course.

>>> --- a/xen/arch/x86/vm_event.c
>>> +++ b/xen/arch/x86/vm_event.c
>>> @@ -253,7 +253,8 @@ void vm_event_fill_regs(vm_event_request_t *req)
>>>       req->data.regs.x86.shadow_gs = ctxt.shadow_gs;
>>>       req->data.regs.x86.dr6 = ctxt.dr6;
>>>   
>>> -    if ( hvm_vmtrace_output_position(curr, &req->data.regs.x86.vmtrace_pos) != 1 )
>>> +    if ( IS_ENABLED(CONFIG_VMTRACE) &&
>>> +         hvm_vmtrace_output_position(curr, &req->data.regs.x86.vmtrace_pos) != 1 )
>>
>> Would be nice if the too-long-line issue here was also address, when the line
>> needs touching anyway.
> 
> I left it as is for better readability as an exception.
> Will below be ok:
> 
>       if ( IS_ENABLED(CONFIG_VMTRACE) &&
> -         hvm_vmtrace_output_position(curr, &req->data.regs.x86.vmtrace_pos) != 1 )
> +         hvm_vmtrace_output_position(curr,
> +                                     &req->data.regs.x86.vmtrace_pos) != 1 )
>           req->data.regs.x86.vmtrace_pos = ~0;

Almost, albeit the off-by-1 indentation may also merely be an effect of your mailer.

Jan

