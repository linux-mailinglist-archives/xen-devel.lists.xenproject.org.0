Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D9D7A843CA
	for <lists+xen-devel@lfdr.de>; Thu, 10 Apr 2025 14:57:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.945662.1343823 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2rSx-0007Mu-Cn; Thu, 10 Apr 2025 12:57:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 945662.1343823; Thu, 10 Apr 2025 12:57:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2rSx-0007LB-9v; Thu, 10 Apr 2025 12:57:11 +0000
Received: by outflank-mailman (input) for mailman id 945662;
 Thu, 10 Apr 2025 12:57:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=w6Mj=W4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u2rSv-0007L5-On
 for xen-devel@lists.xenproject.org; Thu, 10 Apr 2025 12:57:09 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4eb20abf-160b-11f0-9ffb-bf95429c2676;
 Thu, 10 Apr 2025 14:57:07 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-43ede096d73so5907315e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 10 Apr 2025 05:57:07 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43f235a5d82sm51392595e9.37.2025.04.10.05.57.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Apr 2025 05:57:06 -0700 (PDT)
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
X-Inumbo-ID: 4eb20abf-160b-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744289826; x=1744894626; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=t37rVdDE6IVN360bNct2aeXWCt8oeno05sRf0qm9MIU=;
        b=f7q36OvQz196RymSvfDwftNoCToWsotEU0gRZJ0SQDi3JHAW9ruN7+LXu1l1QG0w58
         JFPJGlDeRV1RUvS9p2TQ7fadNFvxJP8T35lZPxNgrkuvUq9xK/BpmP36m8p+2XX/l/rQ
         tE/Z8bH8RcS0RZVNVpfzqjIz9rsjbckM/EhWG0PhJY+zdCoHU3XPJg2xCWb9O5sW40+R
         fsqpTTX39RetPvkGUgNEos1eskfIM1onFUmb4HkLpxFkbKbKnfv92weA6eg27bIHqOPA
         RxVud7Z0FV/44JPtnWYio//eB3fjstTnz5+0HSArJbWtBXgD7g/L5gPuftrLOEvuS5Sj
         xp2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744289826; x=1744894626;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t37rVdDE6IVN360bNct2aeXWCt8oeno05sRf0qm9MIU=;
        b=FJHoXpGtOR9h3qIAeSG1qWCoatYFT7bbWmCqZL5bZQ5CEuiJ4P5l5HmLzXIkzCkqbl
         Z3t6gO1LC3B6KRT3vRupPh1ErSAtOWe8jKhOrAwIxsY5CJfhduda6cxOOrLcQ/AhI/9P
         oANt7p8R1S42BBUhhAOtKSdHTuVufDZKXk8+DglvGQS0EYk6d+k7lpzjiMqj3InNpEvi
         RpzkNjKuyj+Vuzl5/Yqo67lUv6HW/Vypsf4+rKys/wc093Cw62Elgj6opU+w8BGzbtVq
         qFa8d8HhSyZMMqdxvNd8/i/yw6lEjlxhxUbslYdUbL00qQz8X135TH8iH3hy0sYNi34L
         h5Bg==
X-Forwarded-Encrypted: i=1; AJvYcCUR5ko4AtuEV27P1DIpNEWWdlfep7mnusagIKdr9xV0QECeWDXBcTH46th5og1nFAl+sg1U2/0m2hM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwTMtymOE0jg08986yXW30f3031xPZ2f+4gmlHxWny9+9Mhoo44
	hCAymjMGVPhP7wgZXOAxQXMvnZeB+5cg+XD3TbGlzG+er5SVJqf/8uS+DRQYpw==
X-Gm-Gg: ASbGncsrMDRFBtCUfpFlvr1rVhoZ20/nryyafryjD+16Isu1yfprFKsRKYiXp1Y7dub
	YVj/Y5SeC+ELjWxi7Dv2bQ1NO0J3a/5j1O1kcQqkewUQjVyrV5P1cmMnZUewXsukS8Lj9I+Q9R5
	ZWHZBZ28HHU8RbfeopGWVSbrkZ/G+UxQ37Qx4zcEshR7TAxT2cK9QsFfaAkf7txoz0vGQrJ+iDl
	mtxakms0hub8oiFHl14R52upw2C00eCPSBspSalgcfwhr7GWI5Rd0kegyJ6gNPdjHW+MVrwZ0ZO
	FeNTWely3FUKPNHw3TPq16jXPTW6TCTTEoxcm+iNth/TqmJ59g/UsHnFo5kmQ1kUDXiQ9J3Nbwg
	Dhyx3QE/nrpqaiVmppQq+9F8zUA==
X-Google-Smtp-Source: AGHT+IGMd1IWHnpfhoFlx3N9wTsAkDG9PcbHScfDXyYccZtOk1XqNHHSyFuc0REzsdencLa1We9iYQ==
X-Received: by 2002:a05:600c:1e0e:b0:43d:7de:16e3 with SMTP id 5b1f17b1804b1-43f2ff9b182mr21621585e9.24.1744289826559;
        Thu, 10 Apr 2025 05:57:06 -0700 (PDT)
Message-ID: <13ab7e75-1c2c-499c-9174-047a319a3106@suse.com>
Date: Thu, 10 Apr 2025 14:57:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/16] kconfig: introduce domain builder config option
To: Alejandro Vallejo <agarciav@amd.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Jason Andryuk <jason.andryuk@amd.com>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20250408160802.49870-1-agarciav@amd.com>
 <20250408160802.49870-6-agarciav@amd.com>
 <d61f5fbc-8e28-454b-9931-c267d67cb491@suse.com>
 <D92Z1LECR2VA.3FW5H7ZIRVXU7@amd.com>
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
In-Reply-To: <D92Z1LECR2VA.3FW5H7ZIRVXU7@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.04.2025 14:52, Alejandro Vallejo wrote:
> On Thu Apr 10, 2025 at 10:08 AM BST, Jan Beulich wrote:
>> On 08.04.2025 18:07, Alejandro Vallejo wrote:
>>> --- /dev/null
>>> +++ b/xen/arch/x86/domain-builder/Kconfig
>>
>> This really looks to be the first patch where it needs settling on whether
>> all of this is to live under arch/x86/. If it is to, the reasons need writing
>> down somewhere - maybe not here, but at least in the cover letter.
> 
> I need to think about it. I haven't yet reviewed all the history about
> the series and the related discussions on the matter. Moving this to
> common code ought to be simple enough, but merging dom0less into it
> seems like a pretty big undertaking. Presumably you merely mean the code
> location and the scope of the Kconfig?

Code location only: Yes, definitely. Kconfig: The scope would presumably still
be x86-only, until e.g. Arm was enabled, too.

Jan

