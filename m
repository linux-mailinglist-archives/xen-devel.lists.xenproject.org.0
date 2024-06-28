Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D61191B6D5
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jun 2024 08:16:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.750501.1158622 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sN4ti-0003sd-UZ; Fri, 28 Jun 2024 06:15:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 750501.1158622; Fri, 28 Jun 2024 06:15:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sN4ti-0003pj-Ri; Fri, 28 Jun 2024 06:15:50 +0000
Received: by outflank-mailman (input) for mailman id 750501;
 Fri, 28 Jun 2024 06:15:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NNqu=N6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sN4tg-0003pd-QK
 for xen-devel@lists.xenproject.org; Fri, 28 Jun 2024 06:15:48 +0000
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [2a00:1450:4864:20::233])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dbc88e19-3515-11ef-90a3-e314d9c70b13;
 Fri, 28 Jun 2024 08:15:47 +0200 (CEST)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2ec61eeed8eso2440211fa.0
 for <xen-devel@lists.xenproject.org>; Thu, 27 Jun 2024 23:15:47 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fac1599c23sm7336845ad.280.2024.06.27.23.15.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Jun 2024 23:15:46 -0700 (PDT)
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
X-Inumbo-ID: dbc88e19-3515-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1719555347; x=1720160147; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=R82/EpIayr+6+8T5f0M7t7I97Dc8tus+c2bQiGzzL+s=;
        b=IJO9+GnIQ0+Rmx+oXLXFi6uq1e86mYXUrDV5cYTvQ8MwO96S2Hv14nhR5apnZqSkCX
         Mi4NEhuffHwGbuFIx4kTnNTXGVlShTL8v7GkLzHOI1AQITZ6VputshX/HJ5zkssD+Em/
         i84DXV8iWnzd9nM4P1YwD6iY6AHVn344gRSfoqiU82+SE6hOcWpVhA3U7SsKKI/jlXoP
         yQ6Sjf6TxKqzV0rsliX6sxfgqiA8r4aInGXydK5O9LevMJTRW31MTyTLpv8Hcz3Iqrzb
         O3UVs2L4QwpIXarMeBuCj4WP9wiRSTNsgFbvcOKFnz9Qx1wE2gaL5uMTPhngvh0iETQ/
         CqMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719555347; x=1720160147;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R82/EpIayr+6+8T5f0M7t7I97Dc8tus+c2bQiGzzL+s=;
        b=OmABAybZ0HEuM7zhTBiZDDKYYvLyc15ALiauJKhXlpQ9dbw247OL1L0gTKMKRMKnAh
         S3Bv43tb7y4vUOeQMYO5whSoUxHc/FJZ26B+ZSAVyV2IAF8EQSb2hA/ncVvZe3Ibtxtx
         PuLHs9TL2w97S8xjwTuO9EgnVTgSU4illYTFeVqmMwSQL/9hoWjIe2N1qnw8JFhP0h5i
         h8GC3RDXAYl+1SG3gOQ/vddV+mdyyD5Ndx155DiPyFUCrqtZp/x2f4Jekzt28Ol4l4Y8
         RX6a9EUzbdV5t5W59vm+t0acBJRvcQdxcVlEhq24CFU9xzdBWBURdUUejuZYmC6OhdY5
         xFVw==
X-Gm-Message-State: AOJu0YxY9kLdcQmyAT4Ehp6mEzS1TR8mfHkmzyaCVSwZlj8GBjalRYmp
	YllRPNiPPZj1ZYRuIafHXP6cVQvlCS05OhQ6FO++GH1arp4y8t3yxShJdlXZVw==
X-Google-Smtp-Source: AGHT+IEW9fc5WYl5Eh4R7s8JZO+Meq6mxoTOGzjJg6XMTqqFJx7QqDt145zTYXZszIEj7H0blkwCnA==
X-Received: by 2002:a2e:8416:0:b0:2ea:8308:841e with SMTP id 38308e7fff4ca-2ec5b345df8mr86903151fa.24.1719555346649;
        Thu, 27 Jun 2024 23:15:46 -0700 (PDT)
Message-ID: <3b026b36-926c-4ae4-9402-a30a10cf0134@suse.com>
Date: Fri, 28 Jun 2024 08:15:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 05/13] x86/traps: address violations of MISRA C
 Rule 16.3
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Federico Serafini <federico.serafini@bugseng.com>
References: <cover.1719218291.git.federico.serafini@bugseng.com>
 <4f44a7b021eb4f78ccf1ce69b500b48b75df81c5.1719218291.git.federico.serafini@bugseng.com>
 <alpine.DEB.2.22.394.2406241753260.3870429@ubuntu-linux-20-04-desktop>
 <a5b47b7e-9dc0-4108-bd6f-eb34f7cb8c3c@suse.com>
 <alpine.DEB.2.22.394.2406251808040.3635@ubuntu-linux-20-04-desktop>
 <6441010f-c2f6-4098-bf23-837955dcf803@suse.com>
 <alpine.DEB.2.22.394.2406261758390.3635@ubuntu-linux-20-04-desktop>
 <84eb22c8-7737-4e6b-8194-724c792c2d92@suse.com>
 <alpine.DEB.2.22.394.2406271545210.3635@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2406271545210.3635@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.06.2024 00:59, Stefano Stabellini wrote:
> On Thu, 27 Jun 2024, Jan Beulich wrote:
>> On 27.06.2024 03:53, Stefano Stabellini wrote:
>>> On Wed, 26 Jun 2024, Jan Beulich wrote:
>>>> On 26.06.2024 03:11, Stefano Stabellini wrote:
>>>>> On Tue, 25 Jun 2024, Jan Beulich wrote:
>>>>>> On 25.06.2024 02:54, Stefano Stabellini wrote:
>>>>>>> On Mon, 24 Jun 2024, Federico Serafini wrote:
>>>>>>>> Add break or pseudo keyword fallthrough to address violations of
>>>>>>>> MISRA C Rule 16.3: "An unconditional `break' statement shall terminate
>>>>>>>> every switch-clause".
>>>>>>>>
>>>>>>>> No functional change.
>>>>>>>>
>>>>>>>> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
>>>>>>>> ---
>>>>>>>>  xen/arch/x86/traps.c | 3 +++
>>>>>>>>  1 file changed, 3 insertions(+)
>>>>>>>>
>>>>>>>> diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
>>>>>>>> index 9906e874d5..cbcec3fafb 100644
>>>>>>>> --- a/xen/arch/x86/traps.c
>>>>>>>> +++ b/xen/arch/x86/traps.c
>>>>>>>> @@ -1186,6 +1186,7 @@ void cpuid_hypervisor_leaves(const struct vcpu *v, uint32_t leaf,
>>>>>>>>  
>>>>>>>>      default:
>>>>>>>>          ASSERT_UNREACHABLE();
>>>>>>>> +        break;
>>>>>>>
>>>>>>> Please add ASSERT_UNREACHABLE to the list of "unconditional flow control
>>>>>>> statements" that can terminate a case, in addition to break.
>>>>>>
>>>>>> Why? Exactly the opposite is part of the subject of a recent patch, iirc.
>>>>>> Simply because of the rules needing to cover both debug and release builds.
>>>>>
>>>>> The reason is that ASSERT_UNREACHABLE() might disappear from the release
>>>>> build but it can still be used as a marker during static analysis. In
>>>>> my view, ASSERT_UNREACHABLE() is equivalent to a noreturn function call
>>>>> which has an empty implementation in release builds.
>>>>>
>>>>> The only reason I can think of to require a break; after an
>>>>> ASSERT_UNREACHABLE() would be if we think the unreachability only apply
>>>>> to debug build, not release build:
>>>>>
>>>>> - debug build: it is unreachable
>>>>> - release build: it is reachable
>>>>>
>>>>> I don't think that is meant to be possible so I think we can use
>>>>> ASSERT_UNREACHABLE() as a marker.
>>>>
>>>> Well. For one such an assumption takes as a prereq that a debug build will
>>>> be run through full coverage testing, i.e. all reachable paths proven to
>>>> be taken. I understand that this prereq is intended to somehow be met,
>>>> even if I'm having difficulty seeing how such a final proof would look
>>>> like: Full coverage would, to me, mean that _every_ line is reachable. Yet
>>>> clearly any ASSERT_UNREACHABLE() must never be reached.
>>>>
>>>> And then not covering for such cases takes the further assumption that
>>>> debug and release builds are functionally identical. I'm afraid this would
>>>> be a wrong assumption to make:
>>>> 1) We may screw up somewhere, with code wrongly enabled only in one of the
>>>>    two build modes.
>>>> 2) The compiler may screw up, in particular with optimization.
>>>
>>> I think there are two different issues here we are discussing.
>>>
>>> One issue, like you said, has to do with coverage. It is important to
>>> mark as "unreachable" any part of the code that is indeed unreachable
>>> so that we can account it properly when we do coverage analysis. At the
>>> moment the only "unreachable" marker that we have is
>>> ASSERT_UNREACHABLE(), and I am hoping we can use it as part of the
>>> coverage analysis we'll do.
>>>
>>> However, there is a different separate question about what to do in the
>>> Xen code after an ASSERT_UNREACHABLE(). E.g.:
>>>
>>>              default:
>>>                  ASSERT_UNREACHABLE();
>>>                  return -EPERM; /* is it better with or without this? */
>>>              }
>>>
>>> Leaving coverage aside, would it be better to be defensive and actually
>>> attempt to report errors back after an ASSERT_UNREACHABLE() like in the
>>> example? Or is it better to assume the code is actually unreachable
>>> hence there is no need to do anything afterwards?
>>>
>>> One one hand, being defensive sounds good, on the other hand, any code
>>> we add after ASSERT_UNREACHABLE() is dead code which cannot be tested,
>>> which is also not good. In this example, there is no way to test the
>>> return -EPERM code path. We also need to consider what is the right
>>> thing to do if Xen finds itself in an erroneous situation such as being
>>> in an unreachable code location.
>>>
>>> So, after thinking about it and also talking to the safety manager, I
>>> think we should:
>>> - implement ASSERT_UNREACHABLE with a warning in release builds
>>
>> If at all, then controlled by a default-off Kconfig setting. This would,
>> after all, raise the question of how ASSERT() should behave then. Imo
>> the two should be consistent in this regard, and NDEBUG clearly results
>> in the expectation that ASSERT() expands to nothing. Perhaps this is
>> finally the time where we need to separate NDEBUG from CONFIG_DEBUG; we
>> did discuss doing so before. Then in your release builds, you could
>> actually leave assertions active.
>  
> Yes, a kconfig to define the behavior of ASSERT_UNREACHABLE in release
> builds is fine. And you are right that we should consider doing
> something similar for ASSERT too.
> 
> I think that in any environment where safety (i.e. correctness of
> behavior) is a primary concern, attempting to continue without doing
> anything after reaching a point that is supposed to be unreachable is
> not a good idea.
> 
> I think Xen should do something in response to reaching a point it is
> not supposed to reach. I don't know yet what is the best course of
> action but printing a warning seems to be the bare minimum.
> 
> Crashing the system is not a good idea as it could potentially be
> exploited by malicious guests (security might not be the primary concern
> but still.)

Yet continuing may set the system up for much harder to understand issues,
including crashes and exploitable issues later on.

Jan

