Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 875F197E9FF
	for <lists+xen-devel@lfdr.de>; Mon, 23 Sep 2024 12:39:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.801882.1211931 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ssgTj-00076J-0D; Mon, 23 Sep 2024 10:39:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 801882.1211931; Mon, 23 Sep 2024 10:39:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ssgTi-00073o-SV; Mon, 23 Sep 2024 10:39:38 +0000
Received: by outflank-mailman (input) for mailman id 801882;
 Mon, 23 Sep 2024 10:39:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aZUN=QV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ssgTh-00073i-NL
 for xen-devel@lists.xenproject.org; Mon, 23 Sep 2024 10:39:37 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 204d90bf-7998-11ef-99a2-01e77a169b0f;
 Mon, 23 Sep 2024 12:39:35 +0200 (CEST)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5c26311c6f0so5786269a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 23 Sep 2024 03:39:35 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c42bb539dasm10193819a12.34.2024.09.23.03.39.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Sep 2024 03:39:34 -0700 (PDT)
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
X-Inumbo-ID: 204d90bf-7998-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727087975; x=1727692775; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=HMDPaveUw2W2FYp4Oa6I4vhn+Cq8HfpwVJ6Q1xyZsJ8=;
        b=UWfIZuUWBdN0TFDjTaarCshGo0CQIR/YWMD3s/VCF6u5kboomi2VHnY/gDAIvUJ0+Q
         XqHwB86EaDHDzlsTwdcV8rwCaOa3GWJE7+W1bx+uoSM9VtNMN409EaGAQhseWZ/Wbuus
         XXPoWi3ok6j6qMUWOsl7ahjRZAFaC9Dz6YSpa4b3N0HB1XmHSmxbrgjNxJJTKep6+C1z
         IfQI4dqiX1PMG3JDVHLzt9veEkkcDgD/p+TcN9CWTIHvzbLiOEOPkPHxKelBqtrlq53I
         VGRknaG/wkhk6AVZMrr8jkQ1WJm+hfYwxTXF97+3sENReUtVlbsonQRV2UzXnXrw+l62
         1m3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727087975; x=1727692775;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HMDPaveUw2W2FYp4Oa6I4vhn+Cq8HfpwVJ6Q1xyZsJ8=;
        b=iGz6gIATe89HkhlL4UPQ5mej/VP3tBEmZRCHk6GS1o1RmbEjyL0nLmEhiaA0n6+Lz+
         PuIGvYSUrbPL3Pmws5DDZx/ZlTm7IiCW06zrQkVLETUCMnlI0iEuGMryL4p2QHImwZwt
         HmQ5l9zcUiV22u67D7dCcAAN85KWS3cxK14rQuLbZfr/PkCzsBuB90kCLW6px81ERAPc
         CW/0awSgleiF9FvDImzUvAv+bm2NsZmPBxb7fFV54/FWaIkihvywdBBOWzBAw/gF3eCS
         YctmtNW3nVRDR/BW78eIUqLpIEh7SGlp6IDh8oNHtFePYtwHG3xsiAbvaozI6Sv+GlrE
         SrPQ==
X-Forwarded-Encrypted: i=1; AJvYcCWrWHkLWL5EDKXNsZEGMuGUOwwxmezygZLUO0dlr9IcFBLryrc/mWRKOaFnxdSfKINxU0ZE7F71lsg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxX4dzKECbOhkseZym3J+2w8gv789Kx6uHMv0ID6n8/TdcGcLd5
	2y+eVozc2Y9x9/+kiRuE9znOXpleHadtqiW/ulel3L1XGihAuDW6WAQ7RLdBiZ1FOhCTXl1UoMA
	=
X-Google-Smtp-Source: AGHT+IF3FVrCiq8RQnPxxAaUg01gzrSW0GhtVq2EivTJNhjpwoBjSTQxJUJkyCp5ojhTSY+iG0HKnA==
X-Received: by 2002:a05:6402:358b:b0:5af:30d9:e2b6 with SMTP id 4fb4d7f45d1cf-5c464a5abfdmr10790195a12.23.1727087975046;
        Mon, 23 Sep 2024 03:39:35 -0700 (PDT)
Message-ID: <c975ac43-a4fc-4036-8e25-a02a3d5b416d@suse.com>
Date: Mon, 23 Sep 2024 12:39:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ioreq: don't wrongly claim "success" in
 ioreq_send_buffered()
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <f0cd7c48-6816-4050-a505-693c4a470506@suse.com>
 <c80dd525-7fb6-4e2f-99f2-5d96d3f7ec52@xen.org>
 <d29f7235-661c-4457-959c-eeb3b553da02@suse.com>
 <85ef25890dc92f768646ac16031b84ec@bugseng.com>
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
In-Reply-To: <85ef25890dc92f768646ac16031b84ec@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.09.2024 11:55, Nicola Vetrini wrote:
> On 2024-09-23 11:47, Jan Beulich wrote:
>> On 16.09.2024 23:27, Julien Grall wrote:
>>> On 11/09/2024 13:19, Jan Beulich wrote:
>>>> Returning a literal number is a bad idea anyway when all other 
>>>> returns
>>>> use IOREQ_STATUS_* values. While that's maybe intended on Arm 
>>>> (mapping
>>>> to IO_ABORT),
>>>
>>> Arm doesn't support buffered ioreq (see ioreq_server_create()) and
>>> AFAICT the "0" was already there before the code was moved.
>>
>> Indeed, the bad conversion is older than the move.
>>
>>>  > mapping to X86EMUL_OKAY is surely wrong on x86.
>>>
>>> The code has been for nearly 10 years. So I would like to understand 
>>> why
>>> the change now. Did you see any issue?
>>
>> Well, result of looking at the code. As said - returning success here 
>> is
>> definitely wrong on x86. The open question is whether IO_ABORT was 
>> actually
>> meant to be (implicitly) used here for Arm (but see below).
>>
>>> The unclear part for me is the behavior change. Below...
>>>
>>>>
>>>> Fixes: f6bf39f84f82 ("x86/hvm: add support for broadcast of buffered 
>>>> ioreqs...")
>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>> ---
>>>> Judging from history, it may want to be IOREQ_STATUS_UNHANDLED 
>>>> instead,
>>>> eliminating the need for IOREQ_STATUS_BAD. That'll be a behavioral
>>>> change on Arm then too, though.
>>>
>>> ... you mention Arm. But not x86. This would imply there are no 
>>> behavior
>>> change but I don't understand why.
>>
>> The way the patch is written it keeps Arm's (perceived; again see 
>> below)
>> behavior unchanged, but fixes x86. The remark above is suggesting an
>> alternative without need for the new IOREQ_STATUS_BAD, yet then also
>> leading to a behavioral change on Arm. Hence the question whether the
>> present behavior is intended. However, ...
>>
>>> For the Arm behavior change, per above, I don't think we can reach the
>>> code on Arm so it should not be a problem to change it.
>>
>> ... with you pointing out that buffered ioreqs aren't supported on Arm,
>> I could indeed change this whichever way suits x86, without affecting
>> Arm at all. It would then be only an abstract consideration, for the
>> hypothetical case that buffered ioreqs became needed on Arm as well.
>>
>> Buffered ioreqs not being supported on Arm of course means the function
>> as a whole is unreachable, i.e. in violation of Misra rule 2.1. Which I
>> find concerning, as that rule is marked as clean - indicating that
>> Eclair isn't smart enough to spot the case here. (Reason for the 
>> remark:
>> If the function had been marked / excluded accordingly, I would have
>> noticed Arm's unaffectedness of whichever way the change is done.)
>>
> 
> ECLAIR has been configured to mark unreferenced functions as 
> deliberately unreachable and thus hide those reports by default in the 
> CI analyses.
> 
> -doc_begin="Some functions are intended to be not referenced."
> -config=MC3R1.R2.1,+reports={deliberate,"first_area(^.*is never 
> referenced$)"}
> -doc_end

But the function is referenced. If it wasn't, the build would fail. It is
just that on Arm the code path there cannot be taken, as the "buffered"
function argument in the sole caller will only ever be false.

That said - looking at docs/misra/deviations.txt I spot 4 entries for 2.1,
yet none of them appears to fit with your reply. What's the connection?

Furthermore I never fully understood Misra's separation of "unreachable"
vs "dead", so maybe we're rather talking about dead code here (and hence
another rule).

Jan

