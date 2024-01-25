Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E79283C3ED
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jan 2024 14:43:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.671529.1044914 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rT00N-0000Sb-Uw; Thu, 25 Jan 2024 13:42:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 671529.1044914; Thu, 25 Jan 2024 13:42:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rT00N-0000Pr-S8; Thu, 25 Jan 2024 13:42:55 +0000
Received: by outflank-mailman (input) for mailman id 671529;
 Thu, 25 Jan 2024 13:42:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vt1H=JD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rT00M-0000Pl-Ni
 for xen-devel@lists.xenproject.org; Thu, 25 Jan 2024 13:42:54 +0000
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [2a00:1450:4864:20::236])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a257946a-bb87-11ee-8a42-1f161083a0e0;
 Thu, 25 Jan 2024 14:42:53 +0100 (CET)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2cf354613easo8861691fa.1
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jan 2024 05:42:51 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 h15-20020a02b60f000000b0046e2ce45dafsm4509040jam.165.2024.01.25.05.42.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Jan 2024 05:42:49 -0800 (PST)
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
X-Inumbo-ID: a257946a-bb87-11ee-8a42-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1706190170; x=1706794970; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ucocFwjbJuOYLTmjV0LYYSNKRdd+VCNltMxWXEPDbhA=;
        b=c5cKnbVD3ZJIUy5EHwz3UAZ+edOAMLwRSyusBvnGej7ikbEye1j5EDqmZbEoilpTmL
         8ruMJVp48N1d39XLIBI4yoJtTQSWLuFuvJFOZLTM2y7bwzP6pzF0p1R4oUBt3EumF3DF
         yoIuqG01NvvWJFbbNLzglBLxhLuY8eIKaaQJgCqPTwd514lZgLr4xZLguKkh7agBWEG3
         N0FsBf2MmdxKWUt+Uc0QAOdKf4Q6xeW5i89UFevYqIwuNB6KV2cr6TOjRAcMaK4DAfOP
         +pfZm22knt7OgbeS1X8tIIClrrnKRcpPAJ9JvAkZnrjP9J+3N8sAXTmrKDS1Kv+nzlaA
         Bj/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706190170; x=1706794970;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ucocFwjbJuOYLTmjV0LYYSNKRdd+VCNltMxWXEPDbhA=;
        b=bkPoGl/NEGHWC4FDiL6HPaYMSA5n5ly8q9dE+ZqrJTAv9kAGOhQ1RGnVU6hddpt7J3
         54UcDR4ygPUXZ8ENPcn0fv9LUIKm+rNZD7iNGCEUjNUzGjKj9V47BIV1W7cHogF6pUhC
         eLmpHg825wS8FyC+4HjXGkP7qtsyV0ORsk6a61acUaBrVvqsdW40acEn64pgLw+G6GEL
         iSiGuVAHXpVWN+ukCxtWYDfKbzgK2qgV5SybZ17/1511l9ggxE0RB6l5fumaUHDv5Kwd
         acyGInVhwHHUaQppNF4tfO6Fi82/JbC/NRGZG9WZthkVt004RUb7ntz0cEZLnnYvJ7FO
         QxIQ==
X-Gm-Message-State: AOJu0YxlfGCTP+B1mWCnbplQW3m3HxDD8QKGnhF9a4/u151CKG07anIm
	BDk54k10/iA9CJrB17pJ24bMke9OZPPcQLzGpH2lx7bxZzIUuPL/AuV9oabgKA==
X-Google-Smtp-Source: AGHT+IH8nEbvz2iYuiXbMI43jRWwb7AErbQlYzfsa1uMkgM2fX5pYutYu5whElS+4c/K/pAUZz/j2w==
X-Received: by 2002:a2e:7a0e:0:b0:2cf:1696:4ecc with SMTP id v14-20020a2e7a0e000000b002cf16964eccmr572535ljc.18.1706190170260;
        Thu, 25 Jan 2024 05:42:50 -0800 (PST)
Message-ID: <8073feb1-81c2-4f0e-835a-70940ec46dc2@suse.com>
Date: Thu, 25 Jan 2024 14:42:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] consolidate do_bug_frame() / bug_fn_t
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Federico Serafini <federico.serafini@bugseng.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <d466eb44-1160-4b57-a41f-752dbf626748@suse.com>
 <alpine.DEB.2.22.394.2401231731570.2287888@ubuntu-linux-20-04-desktop>
 <665b7ea9-77d9-4bbc-a67c-1ac0d9ba908a@suse.com>
 <37afd0b1-a6b3-41aa-8338-c99b68592c92@citrix.com>
 <b19ef7de-b55c-4a70-8b64-d0d4d5a96d93@suse.com>
 <1b109fd8-2a23-4ee8-88a4-e3bf48d2f4c5@citrix.com>
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
In-Reply-To: <1b109fd8-2a23-4ee8-88a4-e3bf48d2f4c5@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 25.01.2024 13:10, Andrew Cooper wrote:
> Answering out of order:
> 
> On 25/01/2024 8:15 am, Jan Beulich wrote:
>> All fine. Still I wonder whether in the meantime this patch isn't an
>> improvement on its own, and hence whether the const couldn't sensibly
>> be added subsequently.
> 
> We have a while until 4.19 goes out.  I would prefer to try and get this
> untangled properly, because half of your patch is in the opposite
> direction for getting the const-ness working.
> 
> If we start to hit rc1 and the const-ness isn't complete, we can revisit.
> 
> 
> Regarding the removal of gdb-stub.  I'd like to get that done, and
> rebase the remainder of the IRQ series over it, because it will reduce
> the churn in your IRQ series.  I'm happy to do the rebase if you want.

Shouldn't be overly difficult, so I guess I can as well do it before
(eventually) re-submitting.

>> On 25.01.2024 02:14, Andrew Cooper wrote:
>>> To make the serial code compile, I ended up having to revert patch 2 of
>>> the regs series, which I believe is safe to do following patch 3-5 which
>>> un-plumb the regs pointer deeper in the call chain.  If this is turns
>>> out to be true, then the patch ought to be added and reverted in the
>>> same series so it isn't left hanging about after the fact.
>> Hmm, I'm not sure I see how reverting that would end up working. However,
>> aiui you need to revert primarily for the non-const-ness of the pointers
>> involved in [gs]et_irq_regs(). I wonder whether, if we followed your
>> underlying thought here, those shouldn't be const-ified then anyway.
>>
>>> The _$X_poll() functions are used in timer context, which means there's
>>> an outer regs context already latched, and that's arguably a better
>>> context to use anyway for 'd'.
>> If the timer happens to run on an idle vCPU, what "outer regs context"
>> would we have there?
> 
> The only reason the serial infrastructure was setting up a fake IRQ
> context was because it was using run_in_exception_handler().
> 
> But I (think I have) removed that fully (and it simplifies things more
> than I was hoping).
> 
> With '%' deleted, it's only 'd' that cares, isn't it?

Yes.

>  And that's "dump the current regs", rather than wanting something else.

Question remains though: What are "current regs" when on an idle vCPU?
But perhaps that will clarify itself once I see how you "removed that
fully".

Jan

