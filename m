Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91F2A96B0B0
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2024 07:52:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.789765.1199389 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sliwM-0005op-HO; Wed, 04 Sep 2024 05:52:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 789765.1199389; Wed, 04 Sep 2024 05:52:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sliwM-0005mq-E9; Wed, 04 Sep 2024 05:52:26 +0000
Received: by outflank-mailman (input) for mailman id 789765;
 Wed, 04 Sep 2024 05:52:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uxYG=QC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sliwK-0005mk-MY
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2024 05:52:24 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id daf68562-6a81-11ef-a0b3-8be0dac302b0;
 Wed, 04 Sep 2024 07:52:23 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a868831216cso725939966b.3
 for <xen-devel@lists.xenproject.org>; Tue, 03 Sep 2024 22:52:23 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8a3ece292fsm49577466b.217.2024.09.03.22.52.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Sep 2024 22:52:22 -0700 (PDT)
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
X-Inumbo-ID: daf68562-6a81-11ef-a0b3-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725429142; x=1726033942; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XUc7td7qdk1SZcXSkIueKqU9Ni4UPleRx4FakltzyYk=;
        b=fWud3quezGLf90nQgeAVVG7TH2hKz81uA49FYNhlI8if+ks7WADf0JlfmrwBdRELWQ
         4N/cyUsxWGenoPegSJ/cf/TVSVOcsSghXeaPl06PGgWIgnItSxcdArLN2h7jv0Dh58Qk
         FzmQ6tYo3ujm/nfxzQ4dymCCswdBKFUHb6mQjANEJTLOFlAfh73Yu2a+g/gSdZcJqHqq
         fRwJO8NoJJiRbveoqh7g2q4bsSHlPcQssDPH7BTl9jPrSZzGQMJ4fOgRIHeG80HRwF3l
         Hq1O9ll+CLjdL6NwBDfgQ+8Q0GsRItx46QukRQ1M71xrTuwdiG/zW1CYKamB6XLo3wm9
         TRkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725429142; x=1726033942;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XUc7td7qdk1SZcXSkIueKqU9Ni4UPleRx4FakltzyYk=;
        b=Yw831BN6luOq4I8kt5sXRj5dk6PEUuSj3W+ck8Rx3IdZ3sJVg4t0od9E8V7iEYEWLc
         Hsu5B1+qQGBZiEPZaBxaVZ33tvWWzI9kwN++C2S3+WXMPrm7pnnk3kgcRNhRgS5U0NDE
         gSbDiHueK4AZX/uiLjMaK+a80R5yk969YZLzKfyKE4nXWjiP/urcOj7q4cF87L6SKX5m
         iP2SV5Xen0D+cdij+zvdwnq/pF63VGtns86OFOynil+tPUL/oPSQEcqhBtuH/TYwVFoN
         RC4w+SQFBcn5KLqTFEhbgeR7NoHqwdkacBFtIUT/LeE03yAzwYge34UVEPlYLLeeo34w
         qI+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVPh3DsD1r1UjF7Y99AgubMvHyrJgHMTdQuu0M9AaE+55LlpMbk147mlHGfPqbFR8aaz3Evej3MYC4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwtGCZ/MdmgjfGFqTVBqIq33UZHqhSnukrCax/7PF8vejq3WeVh
	9hAT9MV9hVWFF/ksYcwh8fuY4eVpqDYBa7etq0D3JcdVg9Q4ZI5qTZBrr/2ZBA==
X-Google-Smtp-Source: AGHT+IEgXT4jTDiN7vCACpKPYiv+1CynOsg7WtPFaHmIH94owXLK4G9IQD4Im2bKqE2oUqar4+1bhQ==
X-Received: by 2002:a17:906:fe4b:b0:a79:82c1:a5b2 with SMTP id a640c23a62f3a-a89b93db796mr990599466b.9.1725429142330;
        Tue, 03 Sep 2024 22:52:22 -0700 (PDT)
Message-ID: <64ae419e-b314-4255-8075-a0f16cfa3bb8@suse.com>
Date: Wed, 4 Sep 2024 07:52:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/11] xen/compiler: Rename __attribute_const__ to
 attr_const
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240828220351.2686408-1-andrew.cooper3@citrix.com>
 <20240828220351.2686408-2-andrew.cooper3@citrix.com>
 <4381179f-bcca-4bd4-8dcf-8de79b79c405@suse.com>
 <98acb540-4f77-4ce1-918c-c0bec8fa005e@citrix.com>
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
In-Reply-To: <98acb540-4f77-4ce1-918c-c0bec8fa005e@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03.09.2024 21:19, Andrew Cooper wrote:
> On 29/08/2024 3:03 pm, Jan Beulich wrote:
>> On 29.08.2024 00:03, Andrew Cooper wrote:
>>> There's no need for the name to be so verbose.
>>>
>>> No functional change.
>>>
>>> Suggest-by: Jan Beulich <JBeulich@suse.com>
>> The form you use here was your suggestion, wasn't it?
> 
> Ok, I'll drop this.
> 
>>  I'm fine with the
>> change as is, so ...
>>
>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> 
> Thanks.
> 
>>
>> Yet I still would have liked the more generic
>>
>> #define attr(attr...) __attribute__((attr))
> 
> The more I think about this, the less I think it's a good idea.
> 
> For starters, this would force it to be attr(__const__) and suddenly all
> our annotations are even longer than they were before.

Without meaning to insist, I disagree here. Just like __attribute__((const))
is fine, attr(const) would imo be, too.

Jan

