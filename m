Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBB188691C2
	for <lists+xen-devel@lfdr.de>; Tue, 27 Feb 2024 14:27:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.686176.1067850 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rexUI-0002GM-Fd; Tue, 27 Feb 2024 13:27:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 686176.1067850; Tue, 27 Feb 2024 13:27:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rexUI-0002Dh-C7; Tue, 27 Feb 2024 13:27:14 +0000
Received: by outflank-mailman (input) for mailman id 686176;
 Tue, 27 Feb 2024 13:27:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HnYt=KE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rexUH-0002DZ-Sj
 for xen-devel@lists.xenproject.org; Tue, 27 Feb 2024 13:27:13 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e9f04651-d573-11ee-a1ee-f123f15fe8a2;
 Tue, 27 Feb 2024 14:27:11 +0100 (CET)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a43488745bcso326168766b.3
 for <xen-devel@lists.xenproject.org>; Tue, 27 Feb 2024 05:27:11 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 kf5-20020a17090776c500b00a438d594d3esm760275ejc.217.2024.02.27.05.27.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Feb 2024 05:27:11 -0800 (PST)
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
X-Inumbo-ID: e9f04651-d573-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709040431; x=1709645231; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1PP71nXAl22kstrYPkbKOLLUjfFtEG8yr+uCm8pr9jg=;
        b=NNKXUPLQSgoWE2ZkgTHAwrz/W8+f/vxRGkHfpiklHuqZDK+57vRQQnDtYa8PbQm5qA
         lbPTA3E+Bgb0VIy4hg5Y+DnAWvd8hm5Njodncp91CylvfsNij1OVsrbhVFmp8x9gSGnf
         Lm4+q/hi0U4XtnwGvnhUrQCPPFD1+jireJrwV4REsCq9LeZzpKOPeQeLsNXWfklK2BSi
         5qw2g3aCLrevrHVqaGQdtB3tyNsUSzU8xpNpnu2zK+yBX2Oa7Qt8fz6GPZ8xyZtZjNL9
         kUuzP4ttZnlgtzIwfhy92bV4tJ6qmply6sD7Gqba9ZZ6AzDxAlXr2/3jqMLBMGc18ZFv
         BAwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709040431; x=1709645231;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1PP71nXAl22kstrYPkbKOLLUjfFtEG8yr+uCm8pr9jg=;
        b=NOIzKpbUcwMtLr78rKl3bRB6CTx8N/1h0Sq7AhZUzkGby5B7IzxTSmvLEmBht3T4YB
         DpgtBsXIUb3nVnGXTdRWiqd8+M+xYwQRY2c1QQTv5rUs/sRGI+h8SmUd/bognbGrM38j
         JU0G4qqH8HgRovvtaBtpX7cKu4G/kQJ5vWML+qdgk4tgUp/qo2J8L9AKojloEps3bkXk
         OMGTAuEI6VbX54NU0b4fSEtHbdQUkmLssSuC+i5sXTKrDF+ML+nyvNC9uyA/meo/W1uy
         0P/XaVQ6v7J4Z8c74/2+UjJu6NIuy3+ia6Llh2y5/Z9YXe7ESeYZ5pN0L2OcmyxlYzh+
         GoDQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbU0/rkHWal62EAYYbkh1u/eFLamsBGHM4CFNKN9tUzl3+xwog3hcYFO1k81A9twgoC/SFCe23KMpdvqcBdqeFlmXnJhQ5GelPDgQqI04=
X-Gm-Message-State: AOJu0Yw0k9slmqniEYv6/iKmGySuvc22UOIgjM8KjNn5DDM5uBbLDpVL
	9JdyA4UO5MsqWDsAVTk1b9NoGAcqfpBrikbuAHRdehD2++jHdAbVDWqC1PVdQQ==
X-Google-Smtp-Source: AGHT+IFAmF91kqqVuwaegLa4ryhgF0hkMr/LeUACD6mvMV7cBBgVve8H4LrMQTrRp6JxtJYFFl/F3Q==
X-Received: by 2002:a17:906:80d4:b0:a43:10b6:40f6 with SMTP id a20-20020a17090680d400b00a4310b640f6mr4603307ejx.1.1709040431432;
        Tue, 27 Feb 2024 05:27:11 -0800 (PST)
Message-ID: <23dc102e-e827-4f1e-876d-76a7df4c4927@suse.com>
Date: Tue, 27 Feb 2024 14:27:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/common: Do not allocate magic pages 1:1 for direct
 mapped domains
Content-Language: en-US
To: Henry Wang <xin.wang2@amd.com>
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Alec Kwapis <alec.kwapis@medtronic.com>, xen-devel@lists.xenproject.org
References: <20240226011935.169462-1-xin.wang2@amd.com>
 <b41daccb-d402-4da8-bc88-933facd088a8@suse.com>
 <c3edf84d-3177-4125-bdd6-ba99190340a3@amd.com>
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
In-Reply-To: <c3edf84d-3177-4125-bdd6-ba99190340a3@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27.02.2024 14:24, Henry Wang wrote:
> On 2/26/2024 4:25 PM, Jan Beulich wrote:
>> On 26.02.2024 02:19, Henry Wang wrote:
>>> --- a/xen/common/memory.c
>>> +++ b/xen/common/memory.c
>>> @@ -219,7 +219,7 @@ static void populate_physmap(struct memop_args *a)
>>>           }
>>>           else
>>>           {
>>> -            if ( is_domain_direct_mapped(d) )
>>> +            if ( is_domain_direct_mapped(d) && !is_magic_gpfn(gpfn) )
>>>               {
>>>                   mfn = _mfn(gpfn);
>>>   
>> I wonder whether is_domain_direct_mapped() shouldn't either be cloned
>> into e.g. is_gfn_direct_mapped(d, gfn), or be adjusted in-place to gain
>> such a (then optional) 2nd parameter. (Of course there again shouldn't be
>> a need for every domain to define a stub is_domain_direct_mapped() - if
>> not defined by an arch header, the stub can be supplied in a single
>> central place.)
> 
> Same here, it looks like you prefer the centralized 
> is_domain_direct_mapped() now, as we are having more archs. I can do the 
> clean-up when sending v2. Just out of curiosity, do you think it is a 
> good practice to place the is_domain_direct_mapped() implementation in 
> xen/domain.h with proper arch #ifdefs?

arch #ifdefs? I'd like to avoid such, if at all possible. Generic fallbacks
generally ought to key their conditionals to the very identifier not
(already) being defined.

Jan

