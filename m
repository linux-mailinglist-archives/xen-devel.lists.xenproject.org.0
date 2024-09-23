Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5750097E908
	for <lists+xen-devel@lfdr.de>; Mon, 23 Sep 2024 11:48:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.801769.1211773 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ssffZ-0007fy-Tf; Mon, 23 Sep 2024 09:47:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 801769.1211773; Mon, 23 Sep 2024 09:47:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ssffZ-0007eS-Qr; Mon, 23 Sep 2024 09:47:49 +0000
Received: by outflank-mailman (input) for mailman id 801769;
 Mon, 23 Sep 2024 09:47:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aZUN=QV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ssffY-0007eM-Tr
 for xen-devel@lists.xenproject.org; Mon, 23 Sep 2024 09:47:48 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e3c87d72-7990-11ef-a0b9-8be0dac302b0;
 Mon, 23 Sep 2024 11:47:47 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a8d2daa2262so539847766b.1
 for <xen-devel@lists.xenproject.org>; Mon, 23 Sep 2024 02:47:47 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a90612e1a55sm1186325166b.157.2024.09.23.02.47.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Sep 2024 02:47:46 -0700 (PDT)
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
X-Inumbo-ID: e3c87d72-7990-11ef-a0b9-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727084867; x=1727689667; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1aeBnyvxDs6h+jxIF+2fiajAnXwfHmknD+2rTs/FAHI=;
        b=eX37zL+cqeD/wY4WH/KBmfSL2t7KBU0qHa/UmRfNCPI/kqNmKDnpfeOtJY/iLd9xn6
         hLAJhvbUprvJt6j6xqsx4hIMrjnBUgeS33rm94UDvToXpnsCQAVZNQKGFSokRa4Kkvvi
         3EYGNYnN3xxH2lw8LVpo7imE5SM2oyTkKazNiXiRAxORhow/4xqz/g5kc7AX7mzHXuTH
         5vWaH0TivB0qy7g3axIF1uoW17+9iUVjYeikWDjxUiW62PdvbTTLqD7MnspjAACLl13V
         KHTRUDH5w1g+tPxR1UWlXnt/lKPiDbD93iQlZuGSQYnl8ICLRnXUf4jSej8qcCWjYeZ1
         iVXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727084867; x=1727689667;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1aeBnyvxDs6h+jxIF+2fiajAnXwfHmknD+2rTs/FAHI=;
        b=biAMzOn/bO5zQtaw07MDTUmW6ecPw7m1st3rPFE4gmU5p9royJSJrRoxNfYRxorqVH
         6bZa7r4YjcEeSchV8O/vvEuAvvqjABUpwyA9h97Oc87GYJYKXiMZ+alQa2S6cC7niQ7I
         z38eJwWi2g0SRPniAuWxAHNJ3DZQQQcRj6RSKbYzT+hXYoQBmQ+tyY7LWMakYV4pvSmm
         l13Ujz9zQhzRLBHCSgcSF12X9Kr0g85Y7+3+q6sRpEyeQ6E41QjqeABwb5GtjCpd+ZiJ
         ZCpFyBQLEzh3j+tQvp1nhmtrGs/Ty9F4WfA/EdCoJ+mxPslFdIRNqyfR2f0VFq4c93SF
         RODQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWWE5e5SVn1VrreoyCfmZrLjwvUWCFdieyNpJL+5RZUrwi8MEMCrHJdxs6+KutA0fPoJhY6N6Lef8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yye6h28ZeFTIGrZoA8Vhw0BbanYUd6AlBQOLfLO1lKgWOCHndKi
	3yPBTMQ/GSFQ1lht1S5RopVbrl7XXezoQri8G3UOCv7CK2UQ2XYQLCDcKUCuHA==
X-Google-Smtp-Source: AGHT+IEnEFCnn6G8z+wL/6JvGvATta6V7NTcG5tw6kLQSSvlUQpuZZ0OUxv2Ytiup5jAGMEeLbMPsA==
X-Received: by 2002:a17:906:794c:b0:a86:7199:af37 with SMTP id a640c23a62f3a-a90d51601d9mr1342848566b.58.1727084867133;
        Mon, 23 Sep 2024 02:47:47 -0700 (PDT)
Message-ID: <d29f7235-661c-4457-959c-eeb3b553da02@suse.com>
Date: Mon, 23 Sep 2024 11:47:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ioreq: don't wrongly claim "success" in
 ioreq_send_buffered()
To: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <f0cd7c48-6816-4050-a505-693c4a470506@suse.com>
 <c80dd525-7fb6-4e2f-99f2-5d96d3f7ec52@xen.org>
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
In-Reply-To: <c80dd525-7fb6-4e2f-99f2-5d96d3f7ec52@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.09.2024 23:27, Julien Grall wrote:
> On 11/09/2024 13:19, Jan Beulich wrote:
>> Returning a literal number is a bad idea anyway when all other returns
>> use IOREQ_STATUS_* values. While that's maybe intended on Arm (mapping
>> to IO_ABORT), 
> 
> Arm doesn't support buffered ioreq (see ioreq_server_create()) and 
> AFAICT the "0" was already there before the code was moved.

Indeed, the bad conversion is older than the move.

>  > mapping to X86EMUL_OKAY is surely wrong on x86.
> 
> The code has been for nearly 10 years. So I would like to understand why 
> the change now. Did you see any issue?

Well, result of looking at the code. As said - returning success here is
definitely wrong on x86. The open question is whether IO_ABORT was actually
meant to be (implicitly) used here for Arm (but see below).

> The unclear part for me is the behavior change. Below...
> 
>>
>> Fixes: f6bf39f84f82 ("x86/hvm: add support for broadcast of buffered ioreqs...")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> Judging from history, it may want to be IOREQ_STATUS_UNHANDLED instead,
>> eliminating the need for IOREQ_STATUS_BAD. That'll be a behavioral
>> change on Arm then too, though.
> 
> ... you mention Arm. But not x86. This would imply there are no behavior 
> change but I don't understand why.

The way the patch is written it keeps Arm's (perceived; again see below)
behavior unchanged, but fixes x86. The remark above is suggesting an
alternative without need for the new IOREQ_STATUS_BAD, yet then also
leading to a behavioral change on Arm. Hence the question whether the
present behavior is intended. However, ...

> For the Arm behavior change, per above, I don't think we can reach the 
> code on Arm so it should not be a problem to change it.

... with you pointing out that buffered ioreqs aren't supported on Arm,
I could indeed change this whichever way suits x86, without affecting
Arm at all. It would then be only an abstract consideration, for the
hypothetical case that buffered ioreqs became needed on Arm as well.

Buffered ioreqs not being supported on Arm of course means the function
as a whole is unreachable, i.e. in violation of Misra rule 2.1. Which I
find concerning, as that rule is marked as clean - indicating that
Eclair isn't smart enough to spot the case here. (Reason for the remark:
If the function had been marked / excluded accordingly, I would have
noticed Arm's unaffectedness of whichever way the change is done.)

>> Shouldn't IOREQ_READ requests also be rejected here, for the result of
>> a read not possibly coming from anywhere, yet a (bogus) caller then
>> assuming some data was actually returned?
> 
> I am not sure. I understand from an hardened PoV. But this would add an 
> extra check to something the caller should be aware of. This is 
> different from the address check because this is more of an 
> implementation details.
> 
> So maybe it should be an ASSERT()?

That might be an option, yet with the general movement towards also
providing safety on release builds that would likely end up being

    if ( dir != IOREQ_WRITE )
    {
        ASSERT_UNREACHABLE():
        return 0;
    }

i.e. still an extra check.

Jan

