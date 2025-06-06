Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E9C2ACFD6E
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jun 2025 09:24:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1008028.1387243 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNRQa-00025K-Mz; Fri, 06 Jun 2025 07:23:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1008028.1387243; Fri, 06 Jun 2025 07:23:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNRQa-00023D-KG; Fri, 06 Jun 2025 07:23:48 +0000
Received: by outflank-mailman (input) for mailman id 1008028;
 Fri, 06 Jun 2025 07:23:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=U7n3=YV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uNRQZ-000236-99
 for xen-devel@lists.xenproject.org; Fri, 06 Jun 2025 07:23:47 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2e0a816a-42a7-11f0-b894-0df219b8e170;
 Fri, 06 Jun 2025 09:23:44 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3a375888297so1144088f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 06 Jun 2025 00:23:45 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3134b05c4c0sm680810a91.19.2025.06.06.00.23.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Jun 2025 00:23:44 -0700 (PDT)
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
X-Inumbo-ID: 2e0a816a-42a7-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749194625; x=1749799425; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KariCyR0dGZDPIE40ZrelzTAXlwAXQCM1p379V0kows=;
        b=L0jO3fQtGYVgfurOrvZWmY+su/mLMvKx05L58YjrTTkvnzO0YvZciDZ9XLY1BAX4cw
         Q8O9EOEkudXJLqKzjiAfHA6maTdQh4+xBJyDhoclH8XICW+tFXNhRd8LjZZy6a4mjDto
         fyscHcIiK7jlUH3gOLXZaYrVIypNbbqZLgXMOY2MJLHLxVaq0qAfbRnT3l/FzMkaBPLx
         +2u+0RechoP+WW4Y3jUG4mW8ylz6VbE3IuuZBxvNfvboxMTDNuRl56SJqiS0uWpJcb0U
         Rm/r+2S2M/xRfFUDEICQyoK3JIIHW6pXGoCSrFWxn6T++ZV5nuYMHmyRCBqT/h9lXUn3
         QevA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749194625; x=1749799425;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KariCyR0dGZDPIE40ZrelzTAXlwAXQCM1p379V0kows=;
        b=iY8kfQa7j4YJqPRctb7kxfTP+4JtpxX5LuaLH0Te9H5Uhcgt155G+D8JRrLOQJ1JAA
         ZZLo0lqbsxAA1IySNnhoobpi+c5AlFUlqo9YRyqu3H2D4q+oPZ9fAPAuXv1CMcg0Tdl4
         6vHZyTP4uVYSPU0QY8/BzqYE/JuHHaxXlD8Iv5dZ/NOcfL9Yzm00lFGQi4S0RBSxTBOB
         wXVRyadk8SlyLbHJjsV2OeuVd0d5BfHuxbyT/M0NgvQWEiY66REFQ79fEd3BBkN4ITqE
         dcOdGuXRd75pz4NGsrrhJxQjFSK3OLrDrlCIQwdLD6iOq7rlsOAiNB26iO1ryUb28q1m
         mjYA==
X-Forwarded-Encrypted: i=1; AJvYcCVW67sltwnCywezME2Ut62IjvTFGnC916ln9pEYst8LfQ9jQOx6QJUyDvxQnVhC4hKEJ/5sLlVH5Ww=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxy2S6HcMEjuIHq0nz9+SY4A61IU1npCz5Nb7tmm3Y3wwa13++4
	F6NG47H/hVUcYmo7zUqpHBwwSWP/X5li97RpCM9zymOgwlDMiRxrFI6Jb9Z/zKzxqg==
X-Gm-Gg: ASbGncuYaaKI9ESigMKxuRr2kcuMTFfgPDkkoI7x2RJsaSPs+2iBaN7wY9tMf8AWIjK
	6SISAqiGMwX0ltwPcB7iNtMwwUP7Z+cXk06UEUHK7AXdNr+EXXYgBfBs/XFEcMA6z0uLGe42GJa
	D3KcJ4foMxb/Vpt8nXM90zheoEB74qiPrHOaW2KgFB1xphF48fzMOlVgtbdfAfBa6swFsLwOuko
	YizJmpcR+cwcpuh8vtOQGJZbgAwkKi6gi8erRRDIAkhh62C/E9vU4CFpp3VvL0YaCmsxbuzCa70
	brxZ5EjjUTEfQlr4vyxRFpPOdcHXtc4Y4nsshn+L22CkzMcyPHq+bDuphOFj9CTPG89JMb2N/Dt
	oF/wogbsUqdbSSMHMdi5lg+zkyftA9NddRsFv
X-Google-Smtp-Source: AGHT+IGv6Z7GJARK7IlmLqRuy9scT1aAnFqw0/ILl3vuL2nuWsB3WAd7pInbSJ7D5d/hvMGyieqAnA==
X-Received: by 2002:a05:6000:1acf:b0:3a4:eb7a:2ccb with SMTP id ffacd0b85a97d-3a526ddbaeamr5749196f8f.16.1749194624752;
        Fri, 06 Jun 2025 00:23:44 -0700 (PDT)
Message-ID: <a154fa09-57f3-4cb7-801a-b371dd06b08c@suse.com>
Date: Fri, 6 Jun 2025 09:23:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] x86/EFI: Fix detection of buildid
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250605111638.2869914-1-andrew.cooper3@citrix.com>
 <20250605111638.2869914-2-andrew.cooper3@citrix.com>
 <0a314400-126a-4c2a-b36c-dda61bb0b751@suse.com>
 <a477369d-77d0-48fa-8ac4-120d49e32d11@citrix.com>
 <4d1f1b70-e309-453b-bae6-e066d49a417a@suse.com>
 <9200277c-aa8e-4fd9-ab6a-f9e106114f54@citrix.com>
 <6eaf2b27-969a-4326-9726-8b6e0994e006@suse.com>
Content-Language: en-US
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
In-Reply-To: <6eaf2b27-969a-4326-9726-8b6e0994e006@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06.06.2025 09:22, Jan Beulich wrote:
> On 05.06.2025 19:01, Andrew Cooper wrote:
>> On 05/06/2025 2:24 pm, Jan Beulich wrote:
>>> On 05.06.2025 14:14, Andrew Cooper wrote:
>>>> On 05/06/2025 1:02 pm, Jan Beulich wrote:
>>>>> On 05.06.2025 13:16, Andrew Cooper wrote:
>>>> This really is a property of being a PE32+ binary, and nothing to do
>>>> with EFI.
>>> Which still can be checked for without having this code path being taken
>>> for xen.gz, too: You could e.g. check for &efi > &_end. That's firmly an
>>> image property (yet I expect you're going to sigh about yet another hack).
>>
>> It's all hacks, but no.
>>
>> I'm amazed MISRA hasn't spotted that we've got a global `struct efi
>> efi;` and a label named efi, creating an alias for the object with it
>> out of bounds in the compiled image.  But even then, it's based on
>> XEN_BUILD_EFI not XEN_BUILD_PE and does not distinguish the property
>> that matters.
> 
> The use of XEN_BUILD_EFI in the linker script should have been switched
> to XEN_BUILD_PE when the split was introduced.
> 
>> But the argument I'm going to make this this:  Why do you want a check,
>> even if you can find a correct one (and as said before, I cannot)?
>>
>> This function is run exactly once.  We've excluded "nothing given by the
>> toolchain", and excluded "what the toolchain gave us was not the
>> expected ELF note".  The only thing left (modulo toolchain bugs) is the
>> CodeView region, and if it's not a valid CodeView region then we've
>> wasted a handful of cycles.
> 
> Two reasons: Having code which cannot possibly do anything useful isn't
> good. Misra calls the latest the body of the inner if() "unreachable code"
> and objects to the presence of such in a build. (I'm pretty sure Eclair
> wouldn't spot it, but that doesn't eliminate this being a violation of
> the respective rule.)
> 
> And then, based on your reasoning above, why don't you also drop the
> #ifdef CONFIG_X86?

..., saying in the description "we can as well check for this uniformly"

Jan

