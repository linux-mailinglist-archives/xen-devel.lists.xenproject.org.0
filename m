Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B5C19CDA28
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2024 09:02:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.836933.1252844 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBrHp-00038b-Sy; Fri, 15 Nov 2024 08:02:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 836933.1252844; Fri, 15 Nov 2024 08:02:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBrHp-00036E-QN; Fri, 15 Nov 2024 08:02:37 +0000
Received: by outflank-mailman (input) for mailman id 836933;
 Fri, 15 Nov 2024 08:02:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OZ3N=SK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tBrHo-000361-DP
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2024 08:02:36 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f6e5e993-a327-11ef-99a3-01e77a169b0f;
 Fri, 15 Nov 2024 09:02:31 +0100 (CET)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-37d538fe5f2so292559f8f.2
 for <xen-devel@lists.xenproject.org>; Fri, 15 Nov 2024 00:02:31 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3821ada3fc9sm3629735f8f.20.2024.11.15.00.02.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Nov 2024 00:02:30 -0800 (PST)
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
X-Inumbo-ID: f6e5e993-a327-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo0MmUiLCJoZWxvIjoibWFpbC13cjEteDQyZS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImY2ZTVlOTkzLWEzMjctMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxNjU3NzUxLjUwODMzMiwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1731657751; x=1732262551; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XCBwzEqfBQazh3BuF2QFMG8+QIagOJ+aJ0XZQXpAjQQ=;
        b=Y3MR3kSNXCmodCBYvGQQxFEZHRI5zj6QxXPAhsR7gHenC57AW2k5Sc0oZycp8N0hy0
         DUVxTH7yIgHzdbodF9pEdOHpoHRd7isGYgisjMV1CYm3MrCoKwU32g1Sw5RQctxigjYJ
         aRRqjhDyPzGZx6wfxgcGS6EUq4vKhEZnZcPhYRhRgHLpCj8eYbgkB5DuyEFr/YET9sPr
         VKW+biyA/QrZ9Wz9W+PpxgVujpPyVvu67PNron45lfZ8fOcRmaRRhRankyEkAOP5gozJ
         VboQnDlLzGcBoByWi/FGhBT9/ywVZdICnF9INkGxQc8HYB3MtH1wz1k4BB957OsRbyDU
         lZug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731657751; x=1732262551;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XCBwzEqfBQazh3BuF2QFMG8+QIagOJ+aJ0XZQXpAjQQ=;
        b=ArP3V0VK2LxPx4Kvw8UdOvVPwDYV+n3eZrE1Kihg5Zx0xWaXx24jFGOWnmIJ8dRKA+
         iLu49MoNin9hXQKPy5onPh+VFCAn7zwkWjWmSHxPBONuvpbeztpqRl1hC6hUGbTAqjPn
         2PUmhkRJuzIieaZR6LIZ86nyVOv0OD/fjYX1tl0lwwVJSV02pDgH0CggySq/4Z9PoqIh
         JkeD3zJdvyMGPtwLCzHwgN5ijBS67POigAbPpQkQYrMVfo/TGZlUZdk9IfZEDZ1dyD37
         SK1OYLMaJNbtgVnYaovlUZnX436DENcKFq81ubhozfVZr/WbQlOrTk8qoKiTd3xVR98r
         mQXg==
X-Forwarded-Encrypted: i=1; AJvYcCXt+QGzg/P1g3rkcZfyh/M0DPzr6Et56Z4i1RM9BSFXqFp8KZ8Yjt6srkRkJx+pFx3R8ss5yApbb9o=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwCfo/eERVVa1gPxIMKdZq/xESRBZ7DiO75mBu4UyAGRBRfr54R
	YiSdfscFVPNItxwXcVARkq4kd2I6TXTDGBB2AcHx5nbjAUXc5PpUjl4pwalLIA==
X-Google-Smtp-Source: AGHT+IF3z8LHWZFlJ+Z8q9bRbYApMBXbA7LxP/1D9v7/Ah3iIN3fQ0uNjqvLlaiwOqhnXND8lsa1AQ==
X-Received: by 2002:a5d:5d12:0:b0:37d:5129:f45e with SMTP id ffacd0b85a97d-3822590f339mr1253396f8f.20.1731657750794;
        Fri, 15 Nov 2024 00:02:30 -0800 (PST)
Message-ID: <9ff021f5-fc32-4283-9ee4-f807333e05bb@suse.com>
Date: Fri, 15 Nov 2024 09:02:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] x86/ucode: Drop MIS_UCODE and
 microcode_match_result
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20241112211915.1473121-1-andrew.cooper3@citrix.com>
 <20241112211915.1473121-4-andrew.cooper3@citrix.com>
 <aee06ffe-fb3d-41ab-a715-0bb057d4ca52@suse.com>
 <6b656171-0f61-4ef9-82e7-dfb43f2bdd4d@citrix.com>
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
In-Reply-To: <6b656171-0f61-4ef9-82e7-dfb43f2bdd4d@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14.11.2024 18:18, Andrew Cooper wrote:
> On 14/11/2024 11:41 am, Jan Beulich wrote:
>> On 12.11.2024 22:19, Andrew Cooper wrote:
>>> @@ -199,8 +198,8 @@ static bool microcode_fits_cpu(const struct microcode_patch *patch)
>>>      return equiv.id == patch->processor_rev_id;
>>>  }
>>>  
>>> -static enum microcode_match_result cf_check compare_patch(
>>> -    const struct microcode_patch *new, const struct microcode_patch *old)
>>> +static int cf_check compare_patch(
>>> +    const struct microcode_patch *old, const struct microcode_patch *new)
>>>  {
>> Let's hope we won't screw up a backport because of this swapping.
> 
> I wasn't going to start thinking about backports until the code gets
> into a better state.
> 
> But if backports do happen, it will be all-or-nothing.  This code is far
> too tangled.

I wasn't so much worrying about backporting of this work (as of now I don't
think it's a candidate), but anything that's yet to come.

> That said, in this specific case, the only thing that would go wrong is
> with Intel debug patches.  Even I've only had a handful of those in the
> past 8 years.

Why would that be? Doing the check the wrong way round would lead to
possible downgrading of ucode, wouldn't it?

>> I'd like to ask to at least consider renaming at least the functions,
>> perhaps also the hook pointer, perhaps simply by switching from singular
>> to plural. This would then also avoid reviewers like me to go hunt for
>> all uses of the function/hook, in an attempt to make sure none was left
>> out when converting.
> 
> In the other series I've paused for a while, I have renamed some hooks
> (along with related cleanup), but I'm undecided on this one.
> 
> One option is cmp(), or perhaps compare().

Either would be fine with me as a hook name. As a function name I'm less
certain this will (remain to) be unambiguous.

> But, it occurs to me, another option would be is_newer().  We always
> care about the operation one way around.

is_newer() doesn't very well lend itself to a tristate return value.

Jan

