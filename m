Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50AA0AA02CF
	for <lists+xen-devel@lfdr.de>; Tue, 29 Apr 2025 08:15:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.971417.1359831 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9eEO-0003gX-0c; Tue, 29 Apr 2025 06:14:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 971417.1359831; Tue, 29 Apr 2025 06:14:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9eEN-0003es-T7; Tue, 29 Apr 2025 06:14:11 +0000
Received: by outflank-mailman (input) for mailman id 971417;
 Tue, 29 Apr 2025 06:14:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qXnC=XP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u9eEM-0003em-RX
 for xen-devel@lists.xenproject.org; Tue, 29 Apr 2025 06:14:10 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 296772e8-24c1-11f0-9eb4-5ba50f476ded;
 Tue, 29 Apr 2025 08:14:09 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-ac2ab99e16eso1211742566b.0
 for <xen-devel@lists.xenproject.org>; Mon, 28 Apr 2025 23:14:09 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ace6e4fb5ecsm728919466b.71.2025.04.28.23.14.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Apr 2025 23:14:08 -0700 (PDT)
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
X-Inumbo-ID: 296772e8-24c1-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745907248; x=1746512048; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=CEHyaoDMFKGRU1E2AmIUNeNgLo2ACJqKO89ucJ4zOd0=;
        b=A5eV6+mMFMz5NQAv7ndTyFQ67ZpcUB7zuUNqB004m4ldQ91Pxj7cZmPuiibnDB6gi6
         gN6zDEfeJoifryk6wJZtxgi55tH+eItthhbLuDB18G5nY1mzs++4FUZYgrsdT9qQL1OZ
         PAnr+rjfJWNXPzfGr6TTqSkS/6rjMGEHrVY9TS9+vMRBc3wfgzXtT12fnpA6j4WR+hjq
         hp0s7zYu7VobwK9hbUhQgusqLMlricE1x1lvkbpeWPxQlzclHnqvy2reBM5IahB6U6Nm
         yN1s9e4g34Vu25iaXuC90r5clQR6TGxH1po6BRkObfCAZLpQDr9aLPN4pnBBd58EaH5Z
         dFQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745907248; x=1746512048;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CEHyaoDMFKGRU1E2AmIUNeNgLo2ACJqKO89ucJ4zOd0=;
        b=E4CcxbKM5XAj4iirUx9ZhFT6fP2f/E9ttLdhQxCQeCvB+0I0zJKvvE/cntldlEaWf+
         IFE3T7g1Pfk+FepZkW14Ey3i9tN7wJLBZ4ab57zTAnS34FHx6CzdhUaYrlB/NGIQqO7L
         qGhHO+sPtga5nBokgkJfInLlplWVXGn+kFLMMhOKAvTmq+xVEvPdkZV61VjYSQ+zGOtR
         iJs6SISrptZUOR85kxojMTQmb6l5G0xaRyrniY/YaT9mq7HLfbXcjhnMslEYQm9irpJW
         iJ/p00jn/kPg92R9HDwYa5+yH07RPkQofuJpb637JqNF9u7ZJaiqZxBdL03948tVxO56
         YD7g==
X-Forwarded-Encrypted: i=1; AJvYcCUakra2o1Ezo2Cx2l2H+creodQMDTtXpriZI2R723lVKJhysUyM7h1PGJCYXHfyDPKdwKhhIDEzyZk=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywa2k7VEb4FTcghHV2pEXpYTN/QyW+8+DZ2qCgY8NOgzEQM9AOG
	DnC+dRU0s+HE/9624pBlQNyodidEJXWqAQdNdA2siVqoNrkKWkuqeJ887qMjUw==
X-Gm-Gg: ASbGncvvLl/mM0VnV/oVLj277U6q2010/IZl/VmzJApAtYKaWXCnXiem3vVX3ynnMiH
	fX1p0JZY3FxzOCbjsOzeZqifDDuHYF75By8avOcsQSApcZGauxYkrvzq5k04Vo8DXl6kaJKeTsz
	tMneaGZplVEAME8FBBPQZ36qpc2VD31FbMtA6d+1DRGgxI9QF6WIC+0PC3gU1UErPqOORiI0CzT
	MzL+xGpqknr535WAiwTasqoLnOpBEPZyTBJecB/8IwxjXP/uKIkDrVslbsyiTAvKQm5iytxITEk
	jNdFQFgyA1X9NqxpQi6/vPSuuW+IrXQc+fOAHf+BJUJx4XyF7sft2bBDGsUEfXCYRhiXYcj2HSy
	7qECnZCfO23d/enz6xAliQlbodA==
X-Google-Smtp-Source: AGHT+IFfWFULhOwajRgdME0/ajfWYODSGgBwirsnHCHfUlUpp6FRPM3ai8a3L00HehzthyC/J8sY2g==
X-Received: by 2002:a17:907:7244:b0:ac7:322d:779c with SMTP id a640c23a62f3a-acec4f749e0mr219030066b.50.1745907248518;
        Mon, 28 Apr 2025 23:14:08 -0700 (PDT)
Message-ID: <f2b6396c-c933-4fb9-ba4b-c90170540955@suse.com>
Date: Tue, 29 Apr 2025 08:14:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] xen/page_alloc: address violation of Rule 14.3
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: victorm.lira@amd.com, Federico Serafini <federico.serafini@bugseng.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, xen-devel@lists.xenproject.org
References: <5f2e316aae4667d1fe851e68552eb881c4d5a015.1745625477.git.victorm.lira@amd.com>
 <3146fbf3-2ff1-48a4-b05b-37477a9a5cc5@suse.com>
 <alpine.DEB.2.22.394.2504281551530.785180@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2504281551530.785180@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29.04.2025 01:21, Stefano Stabellini wrote:
> On Mon, 28 Apr 2025, Jan Beulich wrote:
>> On 26.04.2025 02:00, victorm.lira@amd.com wrote:
>>> From: Federico Serafini <federico.serafini@bugseng.com>
>>>
>>> MISRA C Rule 14.3 states that "Controlling expressions shall not be
>>> invariant".
>>>
>>> Add a SAF comment to deviate the rule for build configurations without
>>> CONFIG_LLC_COLORING enabled.
>>
>> I was surprised by this supposedly being the only violation. And indeed it
>> wasn't very hard to find more. For example, we have a number of
>> "while ( num_online_cpus() > 1 && ... )", which become compile-time
>> constant (false) when NR_CPUS=1.
> 
> Uhm, I did run a special scan for this and I can confirm no other
> violations are detected.

Because of it being only one single configuration that's being scanned. I did
point out before that this is a problem for anyone wanting to certify the
hypervisor in a (perhaps just slightly) different configuration.

>>> --- a/xen/common/page_alloc.c
>>> +++ b/xen/common/page_alloc.c
>>> @@ -2038,6 +2038,7 @@ static struct page_info *alloc_color_heap_page(unsigned int memflags,
>>>
>>>      spin_lock(&heap_lock);
>>>
>>> +    /* SAF-14-safe MISRA C R14.3 condition always false without LLC_COLORING */
>>>      for ( i = 0; i < domain_num_llc_colors(d); i++ )
>>>      {
>>>          unsigned long free = free_colored_pages[domain_llc_color(d, i)];
>>
>> Hmm, this way the deviation applies even when LLC_COLORING=y.
> 
> Yes but in the LLC_COLORING=y case it is harmless. Do you have something
> else in mind?

What if, perhaps by mistake, domain_num_llc_colors() becomes constant 0 in
yet another configuration? (I don't expect this would work, but in principle
the comment ought to be inside an #ifdef.)

>> As to the comment wording - looks like we're pretty inconsistent with that
>> right now. I, for one, don't think the Misra rule needs (re)stating there;
>> the SAF index points at all the data that's needed if one cares about the
>> specifics of the deviation.
> 
> Do you prefer:
> 
> /* SAF-14-safe */

That's too short. All I'm asking for is to drop the (imprecise) rule
reference. Noticing only now: It being imprecise may make the comment go
stale if we move to a newer Misra spec, as the rule number may be different
then.

Jan

