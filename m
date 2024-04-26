Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ABE878B30BB
	for <lists+xen-devel@lfdr.de>; Fri, 26 Apr 2024 08:51:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.712463.1113186 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0FPq-0007Ph-1U; Fri, 26 Apr 2024 06:50:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 712463.1113186; Fri, 26 Apr 2024 06:50:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0FPp-0007Mr-U0; Fri, 26 Apr 2024 06:50:37 +0000
Received: by outflank-mailman (input) for mailman id 712463;
 Fri, 26 Apr 2024 06:50:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lj3M=L7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s0FPo-0007Ml-Ee
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2024 06:50:36 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 487e4180-0399-11ef-909a-e314d9c70b13;
 Fri, 26 Apr 2024 08:50:35 +0200 (CEST)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5708d8beec6so2134762a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 25 Apr 2024 23:50:35 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 g22-20020a056402091600b005721f9fbb60sm3785198edz.63.2024.04.25.23.50.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Apr 2024 23:50:34 -0700 (PDT)
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
X-Inumbo-ID: 487e4180-0399-11ef-909a-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1714114235; x=1714719035; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8RxqCSweANnkLXX233xQvtMuNhLXbw8tmzSyswJWhBY=;
        b=fPML5sGnnQxnaCg/J005BsBKXmSa0WvFs7Mpz1bpGFxUQFHVhkOGHtUoK2g5BdG0ht
         6k2tppmQijxGUMGtksZg1b6WRJrGExi55LEszpho3fBsEYUdJoFpN5jl8DZp34rHuRXP
         bS+TOY0CbjeTDN7fZ+gH/qol72sMuzXcWXsndLfBQ30v+4FRu0JZttmhh8oqfbXgm/w2
         sGLEPiBTJgnDQu4r9vbeL2AckeW1TMuXWdvk8Di/WmsXfoWwhCCUQp3nDSix9WFpLjwR
         +JoFwviKmTAyUXpbAUYxGh9/4I+1oudQlPBEeGOb076YP+B3j0KKhxaCGaw689uSMMfa
         Rw5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714114235; x=1714719035;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8RxqCSweANnkLXX233xQvtMuNhLXbw8tmzSyswJWhBY=;
        b=rQ0zeE+JhR1UODSV4uM4gBySqrXwcuAgCBuJHulOkYDICKG2tR7fh77+3x8PtbJvE/
         YL89iYfmOiiNIZ0xE7zAA6vXIdaik3qmLzPVJev1cSffxcJgQZjcyxZL2OWWOzJaktqs
         ff0QmydeghFfCIJwaAiG55+n4tlKc2Y/P9GP9qnBQdUid5z4tKHJCtxnzFI043lU/9kb
         cxmOzHzdU/cPw2wZgOnetzW6nytGXcO5YHAHfUSjPVcgOeDnFjQIDBaSRntBev7x6L3N
         nv2X/0XNsrzHzzLjDVucE4WCLacZpVDwGTy6r5MpueA8j1CFPBXuvvgZ8DNaDExvAzuk
         RItg==
X-Forwarded-Encrypted: i=1; AJvYcCV3gtItEkNcqi8yERa9/nWhbYKdMjHMJweUeKSyY5a/+mxKvUDN6bUiSelDNjB7ligWYt/tjiIsG5mC6Zl//aCg2/Z3VcR77+GvUv1aZww=
X-Gm-Message-State: AOJu0Ywdvb91N58Gvyc/m2b5ATx8cNL+iEonH29d0YFd9ny3Gatht2bn
	wuEkCymmTg4MHHyMchl//jLAZ9c9MsyvfErN1tEKRPAaFWRbUxP6iSHoH35L9Q==
X-Google-Smtp-Source: AGHT+IGCuJIzjZ5lGq356BJWoxzRoBJjgQEUQABD42PbJEVHKwO8hh7VOpa5UxRXvAZy5DdVK2+7pQ==
X-Received: by 2002:a50:a693:0:b0:570:2418:3607 with SMTP id e19-20020a50a693000000b0057024183607mr1613588edc.36.1714114234936;
        Thu, 25 Apr 2024 23:50:34 -0700 (PDT)
Message-ID: <9825c488-0acd-412b-894a-b683525b1592@suse.com>
Date: Fri, 26 Apr 2024 08:50:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] xen/arm, tools: Add a new HVM_PARAM_MAGIC_BASE_PFN
 key in HVMOP
Content-Language: en-US
To: Henry Wang <xin.wang2@amd.com>
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Alec Kwapis <alec.kwapis@medtronic.com>, xen-devel@lists.xenproject.org
References: <20240426031455.579637-1-xin.wang2@amd.com>
 <20240426031455.579637-3-xin.wang2@amd.com>
 <3af4f1c7-9059-436b-9449-94bd7aad9eed@suse.com>
 <c49cbaef-101e-444d-b202-2f1f34beb390@amd.com>
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
In-Reply-To: <c49cbaef-101e-444d-b202-2f1f34beb390@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.04.2024 08:30, Henry Wang wrote:
> On 4/26/2024 2:21 PM, Jan Beulich wrote:
>> On 26.04.2024 05:14, Henry Wang wrote:
>>> --- a/xen/include/public/hvm/params.h
>>> +++ b/xen/include/public/hvm/params.h
>>> @@ -76,6 +76,7 @@
>>>    */
>>>   #define HVM_PARAM_STORE_PFN    1
>>>   #define HVM_PARAM_STORE_EVTCHN 2
>>> +#define HVM_PARAM_MAGIC_BASE_PFN    3
>>>   
>>>   #define HVM_PARAM_IOREQ_PFN    5
>> Considering all adjacent values are used, it is overwhelmingly likely that
>> 3 was once used, too. Such re-use needs to be done carefully. Since you
>> need this for Arm only, that's likely okay, but doesn't go without (a)
>> saying and (b) considering the possible future case of dom0less becoming
>> arch-agnostic, or hyperlaunch wanting to extend the scope. Plus (c) imo
>> this also needs at least a comment, maybe even an #ifdef, seeing how x86-
>> focused most of the rest of this header is.
> 
> Thanks for the feedback. These make sense. I think probably 
> dom0less/hyperlaunch will have similar use cases so the number 3 can be 
> reused at that time. Therefore, in v2, I will add more description in 
> commit message, a comment on top of this macro and protect it with 
> #ifdef. Hope this will address your concern. Thanks.

FTAOD: If you foresee re-use by hyperlaunch, re-using a previously used
number may need re-considering. Which isn't to say that number re-use is
excluded here, but it would need at least figuring out (and then stating)
what exactly the number was used for and until when.

Jan

