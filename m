Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IK8EDk5onWlgPQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 24 Feb 2026 09:58:54 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A22D81841F9
	for <lists+xen-devel@lfdr.de>; Tue, 24 Feb 2026 09:58:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1239555.1540957 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuoFe-0002Sg-UU; Tue, 24 Feb 2026 08:58:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1239555.1540957; Tue, 24 Feb 2026 08:58:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuoFe-0002QL-Qz; Tue, 24 Feb 2026 08:58:42 +0000
Received: by outflank-mailman (input) for mailman id 1239555;
 Tue, 24 Feb 2026 08:58:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1N/p=A4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vuoFd-0002QF-FU
 for xen-devel@lists.xenproject.org; Tue, 24 Feb 2026 08:58:41 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 02726321-115f-11f1-9ccf-f158ae23cfc8;
 Tue, 24 Feb 2026 09:58:38 +0100 (CET)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-439857ec679so358831f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 24 Feb 2026 00:58:38 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43970d5463dsm23743310f8f.34.2026.02.24.00.58.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Feb 2026 00:58:37 -0800 (PST)
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
X-Inumbo-ID: 02726321-115f-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1771923518; x=1772528318; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ToT0AsUW4zTeFecS/gTwqDRLLh/cGsddDIC4lq3qFfM=;
        b=aRqGkr2QJxl/Mc2pMdSJnS/HrVkkgNMMhzKL4Zjdi/jf9mi3BVMWZphncp6TrluaXk
         2c0AGyJwlWxLcsQbx5qvdD1rRnjGHuVEHKb4gDzj1laERUn0/tUpA0Aaf/a30GxollRy
         T4m4JhRu0CKKzGK3+TY50XGf3XrcYRU+ITgWr6nJAIHKZEn36+LBLPl1KHj6M5psh/PF
         5UWGsjieK/O1pPBa1KMxiZx79mztnk0O6pOuuUiEzCDXi/pdSR2d/5wafFBKpDT44Zd+
         rDe/YplEBVC3DpPZxxkgDGaDif/oz6TTKoPJfuSWkYuMDmMprKxj+Sc9VM5wjE29yMrE
         ISuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771923518; x=1772528318;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ToT0AsUW4zTeFecS/gTwqDRLLh/cGsddDIC4lq3qFfM=;
        b=jpHaL/BKIDCbfI/a6gHoF9sQD9FmxPPFGxHAAAg0CW+XcA4IxFUm6UuWpa6sCJX7AD
         6efQImKDQfLUGrVQK/X2i7rtg14LS4XCMXGPCgdIkY5grE+fiot32P3l73DvDI9jVe68
         HKisQDbs2HxeRoXhBy/jety0pGroXIxWMCzbA8XXky4TS/ZzXMicEVeQT7TroG+oCKSl
         3DokJ5DTznjVsTg5OTxUK5bbJtdDK9fbbxDMNfxabu0LA/DrJX7lEl8tJ6UUfdDaQDcD
         YSpThMkhSvQXiKrppD4jIorQgX1VLKK2xblRxiWeMTHtwVpzCt802OjujCrIJEaQ+ooT
         B+cA==
X-Forwarded-Encrypted: i=1; AJvYcCUN5V6JImtxiFtPQvqJdUZ0JOJzItOxTOOx/PHgreCTMRVG8PUIms29YjWwxEJSRfKcyuqS1GcycIs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxA8L1ZaKdVYc6c6hTof4qA/ejx3ApJwvWse3NpwKM3y6guZJ88
	+zMbAV5Q7hb6yXmJpqHLcSXZlE36LaXkeRNIyv7VISAumpQNbdmzJ8WBJw00Wn1V9g==
X-Gm-Gg: ATEYQzyBVsSfMEFG1XidYyfQOjUU/L+fmqAQzwJFIYX8afxmGxTtZsvqU6vLN+apv+j
	oZ3Ld7s4xPEHx43kD1K/eSaN/mWx+x8sDEiXUotvpph8OjtTti1WXirpGIfx41r0H3oaYrOyp+U
	sEaqfN/nwtx++3VdowbsGQWFt+7PoaOI4VRv6Z7UPkU4TwtIFG2v7tSSU5j0+24JAvDEAbVkv9b
	+H0sCxU6yidZqCKLhSclQua/i+kvE+9kAbIo5UPtuuKgHDjWlPMCF8NZPBHNsSv8N2GIvp1OU5G
	ksupiK7Mb1CJrRpVchkvlWyqpNLL5j7kXL9PXzHbxCYZPZ5TXWE6vpONZD9EkxBXV9dbwPug4Ws
	nKv98UzTvVaW1Ftm6U09ldBj9cfHzhQO/sdEh1VQJFxKvUpvhZDbGAoOs4qEUb/aEzeSCzzpo1s
	MTk05UcBTMIOtkcF7ljwpKffa64WuuvMMWhXt85IZGbS8ZbYnjCjH1oSMqsV41jBOGDvK+TIohV
	usKVye5hsoRITg=
X-Received: by 2002:a05:6000:2906:b0:437:711c:8750 with SMTP id ffacd0b85a97d-4396f1829f9mr21270758f8f.46.1771923518216;
        Tue, 24 Feb 2026 00:58:38 -0800 (PST)
Message-ID: <c412f399-9e20-4f20-a43d-f0b3c3fa8f52@suse.com>
Date: Tue, 24 Feb 2026 09:58:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] x86/cpu-policy: move CPU policy library code
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <4bd68e41-e665-4992-9d3c-0086bb5195ef@suse.com>
 <7c06bd5e-fad2-42cb-947f-6749f647b068@suse.com>
 <d8eb4220-da82-43b3-b0e0-9d006f68877c@citrix.com>
 <e5e75e36-a383-4506-8e59-288faeffb614@suse.com>
 <1d85f83d-45c9-444e-8db4-3e0962aad0a6@citrix.com>
 <11c2f97e-efa8-46ea-8605-4ce6cffb9683@suse.com>
 <aZ1m8ZcXyiEBk1Sf@macbook.local>
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
In-Reply-To: <aZ1m8ZcXyiEBk1Sf@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:mid,suse.com:dkim];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: A22D81841F9
X-Rspamd-Action: no action

On 24.02.2026 09:53, Roger Pau Monné wrote:
> On Tue, Feb 24, 2026 at 07:54:29AM +0100, Jan Beulich wrote:
>> On 23.02.2026 20:00, Andrew Cooper wrote:
>>> On 02/02/2026 4:26 pm, Jan Beulich wrote:
>>>> On 02.02.2026 16:47, Andrew Cooper wrote:
>>>>> On 07/01/2026 2:17 pm, Jan Beulich wrote:
>>>>>> diff --git a/xen/arch/x86/arch.mk b/xen/arch/x86/arch.mk
>>>>>> index 0203138a819a..be6c76d2934b 100644
>>>>>> --- a/xen/arch/x86/arch.mk
>>>>>> +++ b/xen/arch/x86/arch.mk
>>>>>> @@ -4,6 +4,7 @@
>>>>>>  export XEN_IMG_OFFSET := 0x200000
>>>>>>  
>>>>>>  ARCH_LIBS-y += arch/x86/lib/lib.a
>>>>>> +ALL_LIBS-y += arch/x86/lib/cpu-policy/lib.a
>>>>> This wants to extend ARCH_LIBS-y surely?  Is this a rebasing oversight?
>>>> No, this was deliberate. The functions here are different from those in
>>>> arch/x86/lib/lib.a. We don't need to fear collision with "common code"
>>>> ones. Hence I preferred to use the more "normal" placement into what's
>>>> passed to the linker.
>>>
>>> I agree that we don't have the explicit ordering requirement that we
>>> have with arch/x86/lib/lib.a.
>>>
>>> But, it still reads as bogus to be putting arch/x86/lib/cpu-policy/lib.a
>>> in the non-ARCH list.
>>>
>>> What difference is there having this a little earlier in the linker
>>> arguments?  Nothing AFAICT.
>>
>> Indeed. The sole reason why I'd prefer things as presented is that putting
>> stuff in ARCH_LIBS should imo be the special case (i.e. requiring a special
>> reason), while putting things in ALL_LIBS should be the default.
> 
> I agree with Andrew that it feels weird that arch/x86/lib/lib.a is
> placed in ARCH_LIBS-y and arch/x86/lib/cpu-policy/lib.a is placed in
> ALL_LIBS-y.  If we want to do it that way it needs a comment
> explaining why they are placed in different list, otherwise it seems
> like a typo on first sight, and it's likely to confuse people in the
> future.

Well, I'll (reluctantly) change then.

Jan

