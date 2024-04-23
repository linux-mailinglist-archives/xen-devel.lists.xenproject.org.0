Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0836F8AF373
	for <lists+xen-devel@lfdr.de>; Tue, 23 Apr 2024 18:06:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.710892.1110431 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzIes-0005fT-SB; Tue, 23 Apr 2024 16:06:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 710892.1110431; Tue, 23 Apr 2024 16:06:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzIes-0005dx-PW; Tue, 23 Apr 2024 16:06:14 +0000
Received: by outflank-mailman (input) for mailman id 710892;
 Tue, 23 Apr 2024 16:06:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ck89=L4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rzIer-0005dW-D9
 for xen-devel@lists.xenproject.org; Tue, 23 Apr 2024 16:06:13 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 67239371-018b-11ef-b4bb-af5377834399;
 Tue, 23 Apr 2024 18:06:11 +0200 (CEST)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-349545c3eb8so4242445f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 23 Apr 2024 09:06:11 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 cs18-20020a056000089200b003437799a373sm15045095wrb.83.2024.04.23.09.06.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Apr 2024 09:06:10 -0700 (PDT)
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
X-Inumbo-ID: 67239371-018b-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1713888371; x=1714493171; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3f/Ycrriye47SjAq/bloBCjmfD7llaMG56DuAqJMXtU=;
        b=TVCCQ0Z1LDBqRPAlS+zccSckHrBaIOQE85g3n9U+3aaMB90c0ph1GAN04J4lay0xGX
         bMOpgXNqw+1N6R2g9J4PkJyQVEosLIP3Ck74zGbWoloi8uWKAMfj6HL/9Zs+KEZ6kdb/
         pWUk1dH5b6prVtza79L5GTckgXIwumedIN6HQXbRGJIAARnOwY2CeVV6yNSej45n0PrI
         YtmnfXYwM4dtLl+ZgmvUDCNjjdCLa6SPKDEyKSUZejCRxH1GXTYimc5pujwVx04xHNsd
         tSBa/GtFBOZnDSnBMG+l6iFaYwVqm5g6naXqN7ZtK/tOWLfWCJqetAZtfoAjNUhL2hOB
         7HWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713888371; x=1714493171;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3f/Ycrriye47SjAq/bloBCjmfD7llaMG56DuAqJMXtU=;
        b=Xj/ZAqWYOvM+9s1VWz1NQdEMVgxb171SgaZapS5qnpVUNyEDxidGRPf7KNoEHiXpmq
         17LlkQpzrHVmI+Qqwc1NUqnSPvSKnguXCgooEL6hyPQk2b8dRO6kCyMoNKB3mhXF6l0A
         uUosU27xlPELpE9gHSG/h/W6oBw7tlPoKymGbyIHRGUZcuhL617ULTP97TIrjNvS+7qR
         TnrTBAA0awIfOxpAOEIAjnf/wP+pHnpytjhhPNs4nDmbWNlqud3st37adLnTqWJIs7e/
         9la0+l2ZKiRERlzha9zkASsAKteDIWJ7As2zDnbxKdYtEqe/cJb2FRa4VuQw9ThqRQWf
         dEMg==
X-Forwarded-Encrypted: i=1; AJvYcCUzWCP5K6O+8ZArNFIz6Aa52+MO9CHqSjYUCSLSKu/xrdo3wglVNzirUBfrL+tjTS1hjcxDz2ylPAQHUi/5FTz05uL7la20P3OO3UQEeOw=
X-Gm-Message-State: AOJu0Yz24rK2XoC9NS0TZ2YPPLVMsBIhi3sS01wHNEhcZaLJ5cqlYGkU
	DNDg8ZXohCxaj3yeaN6igrBNgClsUr8V7FuGSLzJhP0UZFtkV8K0hi11gh4z7Q==
X-Google-Smtp-Source: AGHT+IEgI1fmiqFPhi8iZAkcdPlGHzHpf3lnL3XealWEFL+OjDl8G4wpZ9bl8G+8Z7w2yn8VCsK36Q==
X-Received: by 2002:a5d:678e:0:b0:341:d912:1fec with SMTP id v14-20020a5d678e000000b00341d9121fecmr8274253wru.49.1713888370964;
        Tue, 23 Apr 2024 09:06:10 -0700 (PDT)
Message-ID: <1ea60e22-12d9-432d-9ba9-7dd7b2b7d22b@suse.com>
Date: Tue, 23 Apr 2024 18:06:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] automation/eclair: add deviations for MISRA C:2012
 Rule 16.4
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 xen-devel@lists.xenproject.org
References: <4981c3fb0992898a121881333485004f3609eaf7.1713866519.git.federico.serafini@bugseng.com>
 <17c022d9-245b-449f-96c5-7a29ba782880@suse.com>
 <11b8bbbd-1e22-4eb9-b571-cdd5d2661dfc@bugseng.com>
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
In-Reply-To: <11b8bbbd-1e22-4eb9-b571-cdd5d2661dfc@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.04.2024 17:52, Federico Serafini wrote:
> On 23/04/24 12:26, Jan Beulich wrote:
>> On 23.04.2024 12:02, Federico Serafini wrote:
>>> --- a/docs/misra/deviations.rst
>>> +++ b/docs/misra/deviations.rst
>>> @@ -302,6 +302,19 @@ Deviations related to MISRA C:2012 Rules:
>>>          leave such files as is.
>>>        - Tagged as `deliberate` for ECLAIR.
>>>   
>>> +   * - R16.4
>>> +     - Switch statements having a controlling expression of enum type
>>> +       deliberately do not have a default case: gcc -Wall enables -Wswitch
>>> +       which warns (and breaks the build as we use -Werror) if one of the enum
>>> +       labels is missing from the switch.
>>> +     - Tagged as `deliberate` for ECLAIR.
>>> +
>>> +   * - R16.4
>>> +     - A switch statement with a single switch clause and no default label may
>>> +       be used in place of an equivalent if statement if it is considered to
>>> +       improve readability."
> 
> (I placed Rule 16.4 before Rule 16.3.
> I will propose a new version with the correct ordering.)
> 
>>
>> First a terminology related comment here: I'm afraid "switch clause" can be
>> interpreted multiple ways, when I think we want to leave no room for
>> interpretation here. It's not even clear to me whether
>>
>>      switch ( x )
>>      {
>>      case 1: case 2: case 3: case 4:
>>          ...
>>          break;
>>      }
>>
>> would be covered by the deviation, or whether the multiple case labels
>> wouldn't already be too much.
> 
> The MISRA C document, within Rule 16.1 ("A switch statement shall be
> well-formed") defines the syntax rules that can be used to define a
> "well formed" switch statement.
> When I say "switch clause", I refer to the same entity the MISRA
> document refers to in the definition of such syntax rules.
> In the example above, we have a single switch clause with multiple
> labels and no default label: this is a violation of Rule 16.4
> ("Every `switch' statement shall have a `default' label") which will
> be covered by the deviation.
> Do you think inserting the example in rules.rst or deviations.rst could
> be useful?

No, I don't think there should be examples in those documents. But those
documents should also not (blindly) rely on terminology in the Misra
spec, as not everyone has access to that (licensed copies had to be
obtained for quite a few of us).

Jan

