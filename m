Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D4BAC897EA
	for <lists+xen-devel@lfdr.de>; Wed, 26 Nov 2025 12:23:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1172557.1497637 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vODcc-00064S-HP; Wed, 26 Nov 2025 11:23:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1172557.1497637; Wed, 26 Nov 2025 11:23:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vODcc-000619-DF; Wed, 26 Nov 2025 11:23:42 +0000
Received: by outflank-mailman (input) for mailman id 1172557;
 Wed, 26 Nov 2025 11:23:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JzEl=6C=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vODcb-0005yy-Rv
 for xen-devel@lists.xenproject.org; Wed, 26 Nov 2025 11:23:41 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5c049bbc-caba-11f0-9d18-b5c5bf9af7f9;
 Wed, 26 Nov 2025 12:23:40 +0100 (CET)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-42b3d4d9ca6so5428096f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 26 Nov 2025 03:23:40 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42cb7f49a7bsm39748767f8f.19.2025.11.26.03.23.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Nov 2025 03:23:39 -0800 (PST)
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
X-Inumbo-ID: 5c049bbc-caba-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1764156220; x=1764761020; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=jk1pvK0/cLHFveMsauaxwE+mlazVhpXy+21Gpw72R78=;
        b=MJ8kB23vPnEdKi9AeYSYDKMz1HUmChqPw3HABDiRd6Uwa2i95BvAqbC37w6BVg96Xf
         FH7DMBY4mhwpmLDfXeS5ac0n+Nh/wqTQ30zK0pR72IhEVxfxF8C1vMCX4YIwJJtUAi0A
         zhcYmNDzytMfH/3TSs4Z1m7eZtcEcBptgrncCaYOELKHbNIfSO6BLiNxvju69rVBm2L1
         GeS6iPH/kWho9FSRYJTN49eXvXa+hx+HkrUE9Msl0HIUx7vesJVHOTE+U44IbjGgGhQp
         ahGoyulJaYAfqVVe6Pn5DH+1qZw1v7s/fgCe6oW6nFI0MbXP6l5ViGpRVqAKihURxcus
         XRTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764156220; x=1764761020;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jk1pvK0/cLHFveMsauaxwE+mlazVhpXy+21Gpw72R78=;
        b=QH5KpEZlqquacMOHFctTPke2c630g64DYiUWeDup//C+1MusiaV0QAkOKW96OPMO1Q
         hV5kwLEkbEVNAS0erudOmLawLK3ucdL/U7+ZuBDjUO+twzZclVOZM+J9RPdRDJv8QjKB
         C7JYwek7lkFFaV0MwvND0HDYwGobhzSJgT3H/jM+iCYIrWRcM41qTcBbR17EynJGGBt9
         YilYr6HgXfEmvO25eOQV8e50FbIRxj5tIJPACBitS9ZUQK5y0OSdoVaIfN/bjAZRBOnM
         ibBa+XeibTpaqElK04V2UEgFkcOe9ugtadN7CXl2CFpOWhZcxY9++GGUX+7ucQPPFjiK
         rNAA==
X-Forwarded-Encrypted: i=1; AJvYcCXa0OU1gkPUe5/3+BtYotss+LHoljVTN4Iexyrke091RnVhEIHgXYFZO/oNgvy/QVXukbNGIntWU6Y=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzqAYynfQJCeD6Nl3RBt+fkx4UMWP1AS1Vtv6dvr4phal//h9Rg
	dwGl5+fqQt0fWs1Xu+zshQ3eWtJViXuXMZqIXIQh8/arMMuyZthVKJ4tpLXdy8IfMQ==
X-Gm-Gg: ASbGncv5Thz3Q/EjEjiXzfS+gFS6q4s8qqsbvUH1iXtgH6cBz2AsyUbCmy6OXfXYSg2
	/ANeFZXO6/YdAQOgdwOkvJrXiWqzTWppJv9xf6fbdKpy4RHOhFbdm3hnG1oJlkKpnb9OcAH+haq
	KeFlVe2DCWC55Fy0KbzNIGE9p25PbeBEYm6V1e6T9QKt07BHwloGSNvop3UUxbo6UDbWqYuWrSL
	DKeHlwXs9Z20u6fvzRzKvkKnEhZfLI1ozJhjnD3z04RHNJalRxz9C4M6W1eQ0ZvHPx0SOg95cEz
	FFudn55BM4v9ht4OY2HQjtY0rRraxGtr+RysS0zX0ytrJIe4Iof70WnPPN7rZUPgA3Nk734JG7p
	ujzalfaJDiPdYVFZpkQ6Zw11jOjNgH+RxiCZpPV11qgKTHOtgQAV/H4L/ifw4crdK4qFBXWzEr2
	a+1/yZAcsZQUL29MwYlEG763ivQRZCkhviISVwR8PBfmQ13o+E527XTN+Eb2PtFnGMOaFulq+qz
	Oo=
X-Google-Smtp-Source: AGHT+IEdFK2yHPsbEzCAP2X9a7f0hRhti3Crob6qs3Wt4QdwlIfa4mDepKXylvEviILS88ezUu6Ocg==
X-Received: by 2002:a05:6000:1a8f:b0:42b:3c25:cd06 with SMTP id ffacd0b85a97d-42cc1cee419mr20496524f8f.22.1764156219902;
        Wed, 26 Nov 2025 03:23:39 -0800 (PST)
Message-ID: <01309cd4-9feb-42c2-8275-405a0ffb5189@suse.com>
Date: Wed, 26 Nov 2025 12:23:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] domain: add barrier in vcpu_create()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <bea22906-5805-4fad-b73a-fb2e3a8da807@suse.com>
 <54ea162a-4de1-478b-afb8-c566d828dd03@citrix.com>
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
In-Reply-To: <54ea162a-4de1-478b-afb8-c566d828dd03@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26.11.2025 12:09, Andrew Cooper wrote:
> On 26/11/2025 10:13 am, Jan Beulich wrote:
>> The lock-less list updating isn't safe against racing for_each_vcpu(),
>> unless done (by hardware) in exactly the order written.
>>
>> Fixes: 3037c5a2cb82 ("arm: domain")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> The Fixes: tag is pretty arbitrary; the issue was becoming non-latent when
>> Arm support was added. (Strictly speaking IA-64 and PPC would have been
>> affected too afaict, just that now that doesn't matter anymore [or, for
>> PPC, not yet, seeing that its support is being re-built from scratch].)
>>
>> I'm not quite happy about prev_id being plain int, but changing it to
>> unsigned (with suitable other adjustments) actually makes gcc15 generate
>> worse code on x86.
>>
>> --- a/xen/common/domain.c
>> +++ b/xen/common/domain.c
>> @@ -464,6 +464,7 @@ struct vcpu *vcpu_create(struct domain *
>>              prev_id--;
>>          BUG_ON(prev_id < 0);
>>          v->next_in_list = d->vcpu[prev_id]->next_in_list;
>> +        smp_wmb();
>>          d->vcpu[prev_id]->next_in_list = v;
>>      }
>>  
> 
> Where's the matching smp_rmb()?  There needs to be one for this
> smp_wmb() to be correct.
> 
> It's rather rhetorical, because clearly the smp_rmb() needs to be in
> for_each_vcpu() given your commit message, but we obviously don't want
> to do that.

It's not rhetorical at all, I think. It's not needed there because of the
data dependency due to reading the loop iteration variable from the link
fields. I.e. there are no two reads there which would need ordering against
one another, and hence there's simply no-where to place a read barrier.

> This list can only be changed once during a VM's lifecycle, and even
> then it only gets appended to.  i.e. this particular piece of logic to
> splice a vCPU into the middle of a single linked list can be simplified
> to the second assignment, as the first is always copying NULL.

Except for the idle domain, as Jürgen also mentioned.

Jan

