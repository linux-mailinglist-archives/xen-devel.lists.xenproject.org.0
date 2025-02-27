Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 019FAA476BE
	for <lists+xen-devel@lfdr.de>; Thu, 27 Feb 2025 08:42:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.897848.1306473 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnYWz-0004Vu-LL; Thu, 27 Feb 2025 07:42:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 897848.1306473; Thu, 27 Feb 2025 07:42:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnYWz-0004TY-II; Thu, 27 Feb 2025 07:42:05 +0000
Received: by outflank-mailman (input) for mailman id 897848;
 Thu, 27 Feb 2025 07:42:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MKxr=VS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tnYWy-0004TS-3N
 for xen-devel@lists.xenproject.org; Thu, 27 Feb 2025 07:42:04 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 54e72b90-f4de-11ef-9898-31a8f345e629;
 Thu, 27 Feb 2025 08:42:01 +0100 (CET)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-390dc0a7605so314660f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 26 Feb 2025 23:42:01 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-390e47b7dcfsm1164414f8f.55.2025.02.26.23.42.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Feb 2025 23:42:00 -0800 (PST)
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
X-Inumbo-ID: 54e72b90-f4de-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1740642121; x=1741246921; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8syFfS91hW3CAfqruDAEqpzi4/rxRDCAuschMZuI7hs=;
        b=OB64QACJZeBR0qZ75O50bXNpUs9IRsWszObU4JCfERgd51Jn8afMHtJsCtRro41R1C
         Mpi+paQ/1fxEcNiLUTIcv5n6HXxqce9ZOSjfwmQDcc5pe30NBe4b3EJPMEvVBSp/zWb3
         m7uHaiEq/T+xtq/O0/BTJFU9/DbKtSl5q8G4X+xXNdkUbgSoGljU0E5eO3/z5kmCxiRi
         IrGGn30o0yUvacVRQ9Hme3p8neCbVkE6S2LQaeSI/QBvEsfUs6WgpKMkprw/ECX/rzy+
         CrdjSou2aooIrLH1HE5x/xIhlTVjJFTykiBc3h0W7HEvZtRnwxLeNJWDwNmBVhDyrfDt
         cScQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740642121; x=1741246921;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8syFfS91hW3CAfqruDAEqpzi4/rxRDCAuschMZuI7hs=;
        b=tnTPy9XuVFaauMxicAlE0a5K9l5dAqZxD1Okd9a0tX8Eohc3kduC/YB1avzxavFzNf
         VtI6pA+Lazqs234cgXeQo76INCaQwLb3b1TaAzo7adWtSsXCxffFQwSVp/BNRC4KvDrE
         k12D3lNxHMHmF9VE5hUqqZhdu9eEH5zjTpqDv/y0WYu+5u5tfQwCuXR+5AqQNpUjl8jH
         5lM+L10fSkWdNMiSfpTNSxodlaJnZizXoa/OVvBf8qx0eN8KanCn5Jx+0YebSwm1BzT2
         8Ff0RpMsQKcD6FCiTaLjFkWORnWRJdQa1ouduDGb0xepAmNMIKHwyH7QJYPU7vEe3WvP
         f2zg==
X-Forwarded-Encrypted: i=1; AJvYcCUuCEPryWy9AamDsEET+AxAFr4maRRn6jtZIV4bPXmbruUTmprO644IEtTU2/ld5dVPIbdNNQb1KgQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwVT2FuJ1rhN5wsEwbEUuSj6NFLJS3zN8zoNR5gkFHsWaeNgMTB
	7eq49dt4y8wydnh6jAm9bC9nyws92aELItI516Wj1Dx0zrqLtb+9wZFM5BOI1t8/FfaDWE8jTrE
	=
X-Gm-Gg: ASbGncu2gQAEuDnW6jSB7u0hXMDgNk+w0wxa6Ckr8Yl6KBy4xHu3BnreztY6UebXzxw
	2Oy5qWuQcz+8YlYQPTzs43Al+lDRzpYkbubWmy7tVqKYTmXG7njU2lJjjR8qJKifLpj5Ag+P8KG
	rnroaBMJSHdri4Ss3498Jbrg2TBOsfgegvhpNwPeOHwt2kHINNFeN8BG9YwJdCGnTE6cjAJFnxg
	WrVRPZdCpxRiQFo7fWobEUHGSiXE2t7siNDOQmqsvjNdJOvlkFwrbsIjlmsufjwdcZBVOexUzYj
	gxIe51h9P+LctCXPEoTUNAYTmxyqnyOef/LmSAnVZvZUrKDoYJBypT2jWSEzxi5vI1/DqLpMPAN
	JmlpxgizaMXA=
X-Google-Smtp-Source: AGHT+IGB+g0GdrozOUielNLGrdLDLJmSITls/QfyGoaY2mQXQUl0seMvTCZsoqKbteCr+Ybv7vsgzQ==
X-Received: by 2002:a5d:64ce:0:b0:38f:3224:6615 with SMTP id ffacd0b85a97d-390cc5f5b27mr7507059f8f.7.1740642121099;
        Wed, 26 Feb 2025 23:42:01 -0800 (PST)
Message-ID: <a0b41698-15c1-4ff2-aa47-ce3545bfc0ec@suse.com>
Date: Thu, 27 Feb 2025 08:42:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] x86/ucode: Adjust parse_ucode() to match other list
 handling
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250225222905.1182374-1-andrew.cooper3@citrix.com>
 <20250225222905.1182374-2-andrew.cooper3@citrix.com>
 <f5a8262d-8397-46b0-83f9-5b597ac322e1@suse.com>
 <1dea0c8a-ce6c-40db-8ab6-f3d2a3b1d0dc@citrix.com>
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
In-Reply-To: <1dea0c8a-ce6c-40db-8ab6-f3d2a3b1d0dc@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26.02.2025 19:45, Andrew Cooper wrote:
> On 26/02/2025 2:30 pm, Jan Beulich wrote:
>> On 25.02.2025 23:29, Andrew Cooper wrote:
>>> --- a/docs/misc/xen-command-line.pandoc
>>> +++ b/docs/misc/xen-command-line.pandoc
>>> @@ -2721,34 +2721,42 @@ performance.
>>>     Alternatively, selecting `tsx=1` will re-enable TSX at the users own risk.
>>>  
>>>  ### ucode
>>> -> `= List of [ <integer> | scan=<bool>, nmi=<bool> ]`
>>> +> `= List of [ <integer>, scan=<bool>, nmi=<bool> ]`
>> While this makes doc fit present behavior, it is the behavior that is wrong.
>> It was - afaict - broken by 5ed12565aa32 ("microcode: rendezvous CPUs in NMI
>> handler and load ucode"). There should not be both an integer and "scan=".
>> (Really we should have taken measures to stay consistent even if multiple
>> "ucode=" were on the command line.) You actually say so ...
> 
> Yes that changed commit changed the behaviour.  We discussed it during
> c25c964634b1 ("x86/ucode: Enforce invariant about module selection").
> 
> "Wrong" is more complicated.  Neither behaviour is great, but we need
> regular comma separated operations.  (I know I'm deleting nmi= in the
> next patch but I need to introduce a new one for the AMD fix).
> 
> In the presence of comma separated options, one part being `<integer> |
> scan=<bool>` is pointless, because `ucode=1,1,1` is valid, as is
> `ucode=scan,scan,scan`, and then all you've got is an overly complicated
> description of what is identical to other regular list operations.
> 
> For this corner case, it's simply easier to tell the user "don't do
> that", which is what we say elsewhere too.

Hmm, while I don't like this, I'll accept it.

>>>      Applicability: x86
>>>      Default: `scan` is selectable via Kconfig, `nmi=true`
>>>  
>>> -Controls for CPU microcode loading. For early loading, this parameter can
>>> -specify how and where to find the microcode update blob. For late loading,
>>> -this parameter specifies if the update happens within a NMI handler.
>>> -
>>> -'integer' specifies the CPU microcode update blob module index. When positive,
>>> -this specifies the n-th module (in the GrUB entry, zero based) to be used
>>> -for updating CPU micrcode. When negative, counting starts at the end of
>>> -the modules in the GrUB entry (so with the blob commonly being last,
>>> -one could specify `ucode=-1`). Note that the value of zero is not valid
>>> -here (entry zero, i.e. the first module, is always the Dom0 kernel
>>> -image). Note further that use of this option has an unspecified effect
>>> -when used with xen.efi (there the concept of modules doesn't exist, and
>>> -the blob gets specified via the `ucode=<filename>` config file/section
>>> -entry; see [EFI configuration file description](efi.html)).
>>> -
>>> -'scan' instructs the hypervisor to scan the multiboot images for an cpio
>>> -image that contains microcode. Depending on the platform the blob with the
>>> -microcode in the cpio name space must be:
>>> -  - on Intel: kernel/x86/microcode/GenuineIntel.bin
>>> -  - on AMD  : kernel/x86/microcode/AuthenticAMD.bin
>>> -When using xen.efi, the `ucode=<filename>` config file setting takes
>>> -precedence over `scan`. The default value for `scan` is set with
>>> -`CONFIG_UCODE_SCAN_DEFAULT`.
>>> +Controls for CPU microcode loading.
>>> +
>>> +In order to load microcode at boot, Xen needs to find a suitable update
>>> +amongst the modules provided by the bootloader.  Two kinds of microcode update
>>> +are supported:
>>> +
>>> + 1. Raw microcode containers.  The format of the container is CPU vendor
>>> +    specific.
>>> +
>>> + 2. CPIO archive.  This is Linux's preferred mechanism, and involves having
>>> +    the raw containers expressed as files
>>> +    (e.g. `kernel/x86/microcode/{GenuineIntel,AuthenticAMD}.bin`) in a CPIO
>>> +    archive, typically prepended to the initrd.
>>> +
>>> +The `<integer>` and `scan=` options are mutually exclusive and select between
>>> +these two options.  They are also invalid in EFI boots (see below).
>> ... here.
>>
>> As to EFI boots: "scan=" ought to be usable there, as long as no "ucode="
>> was in the xen.efi config file. I think your code is correct in this regard,
>> it's just the wording here which is too strict.
> 
> There's still a sharp corner trying that, which is why I didn't address it.
> 
> With EFI, there's no order of modules, so `scan` is still ambiguous if
> you've got multiple CPIO archives.

Is it? In the config file only one "ramdisk=" is permitted per section. (Or to
be more precise, subsequent ones in the same section simply will be ignored.
Like is the case for other similar settings, like "kernel=".)

Jan

