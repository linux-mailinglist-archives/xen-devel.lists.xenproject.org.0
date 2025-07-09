Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50332AFDF4D
	for <lists+xen-devel@lfdr.de>; Wed,  9 Jul 2025 07:37:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1037678.1410226 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZNUX-0003Fm-EA; Wed, 09 Jul 2025 05:37:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1037678.1410226; Wed, 09 Jul 2025 05:37:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZNUX-0003EB-AA; Wed, 09 Jul 2025 05:37:13 +0000
Received: by outflank-mailman (input) for mailman id 1037678;
 Wed, 09 Jul 2025 05:37:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6dDj=ZW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uZNUW-0003E3-11
 for xen-devel@lists.xenproject.org; Wed, 09 Jul 2025 05:37:12 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c28c9180-5c86-11f0-a317-13f23c93f187;
 Wed, 09 Jul 2025 07:37:10 +0200 (CEST)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3a6f2c6715fso4576041f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 08 Jul 2025 22:37:10 -0700 (PDT)
Received: from ?IPV6:2003:ca:b711:f2be:e417:6234:73d2:3c23?
 (p200300cab711f2bee417623473d23c23.dip0.t-ipconnect.de.
 [2003:ca:b711:f2be:e417:6234:73d2:3c23])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b471b97708sm14859975f8f.50.2025.07.08.22.37.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jul 2025 22:37:09 -0700 (PDT)
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
X-Inumbo-ID: c28c9180-5c86-11f0-a317-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752039430; x=1752644230; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=EevTR1tZs6Yidg5VYYD4ZWa7CuglyMVbjDi3xQHjOkA=;
        b=YZKaY8YkpmcRNtt0Rd3emlUObKCyJaW862UzSim8GfuS1RRZKcYN6ZN6pTF6hnS3ID
         Zrmq/+MRtovzH/gQjxMdDtbaBykh/ydWWtl8nsJPmW4Zo4u76xKcxq2qjq9nGwfuqxgV
         nLYvmYLWn3zN35DhEujOlMSAPwBn3+ZrugZ41YI3aI9l+uM52ra0rRSqE7kCGj1RcLCR
         pJFmTKdvb592pGjOEYHi0MBbTVX3CmhKsWH7DfCNMhdoZ9kN0DKVBePG9Bt/YewW480u
         HR7dNvOIsd2BvHgE3UbfSgxBNjn09pjmd2YGR7HrkrDNW/9iXAKCnnHKkDqSy9nZj8xT
         W/+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752039430; x=1752644230;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EevTR1tZs6Yidg5VYYD4ZWa7CuglyMVbjDi3xQHjOkA=;
        b=ODsJ1SlkUYWAlCPcbclxdWpAo3oMEpyYrZLsUStwxO0xMouh5j4oS2lC25k1elJ4vR
         y4E+rmK6i4K8I+Ke0ZATlxC+3DjqEzV6NCmnhsRs9qqcV3iwXSKX3f9tjmA6R3MPst5n
         q7okmwb59nDGpwXjwU/NBi9WrH4VlpMqn53QcqJVBjlGQu/JIa/gbklAU3xD5m5byJzb
         QDGVnPsOyT2NDa26KLlP5XnPclJ08xxlbmiAoKTl+pM+nUr36mF21lWGH+ER8DDcjxBY
         Jf6TDS6KlJ+yVeBK8t6Pe6t/2vLgiXb92ZfRHDcb//GYcUk9w60EjvFgCePZrS/UrUdD
         W0gA==
X-Forwarded-Encrypted: i=1; AJvYcCVn9xGyBK6lVGb+30sHplNh63GO8EIpUtO1bGOEjKDtdQHpC7U/kQ8cpg1V80748EAwm+P6B0SXeIU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw82cPytKm1ksdS9EQ1325cA6R8QRDi0Mq5M1gZ99blgM+mn2ZU
	6QLhhz2MTrHzjkG8fuini2fk079LbMzzXlmVbQ8btl+isTlVqV8UFmwIQfbdB37jwA==
X-Gm-Gg: ASbGncvvX3lLMnSdV5+wqkg7KXeQ86+WvikSW6MK4SnB4XQuXTBPL8RrtISGYXhP3wE
	uVRgkcEqFQzbBaJHHj78fx4yucR7Qj/XXiINkcJQsVxd/ZCnrVCO+YLVKhiie0WYNq6ez4xJHAj
	lwGE2yWI8tZJhrAYK3hHMOAYZlUigoeogXG3Y8Leb+JvWETVXgShvAj+C90PbUOls6MVEs4aZr9
	R+PjKXq1zaPClzoQDxaIAS+4/UuUIVibMJL48Mrcfo/xKYhh9s0OXksuF3ZhcehzDFJYZysvFvm
	FFgaX3X5bt2WRXCfIkcwTqY5SJYbeToU79RRcpFxkUtgtcCFXfcl4SNGm5Lktg3ERf4L+EEuiTe
	ZQ1rNGx/T5i05RQ1YOBz5jkXPB0csbV2PQX7ECsfRrbmofC0PO8MTN24VFGt8HR9QwFV5vvjeKV
	U5WFgdr4Fd15798fv4qgWy
X-Google-Smtp-Source: AGHT+IGCSI3HezP+khC8oJrDTlIXLY6URGfZ8niTadQi1SgC0KEaE3+k5hXUvOhcAEyA239tjS6Jsg==
X-Received: by 2002:a05:6000:18a8:b0:3a3:5f36:33ee with SMTP id ffacd0b85a97d-3b5e4521d24mr679690f8f.32.1752039430197;
        Tue, 08 Jul 2025 22:37:10 -0700 (PDT)
Message-ID: <b81d7bf6-6254-4001-89f3-3ec06e03e21a@suse.com>
Date: Wed, 9 Jul 2025 07:37:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Xen real-time x86
To: Stefano Stabellini <stefano.stabellini@amd.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 Xenia.Ragiadakou@amd.com, alejandro.garciavallejo@amd.com,
 Jason.Andryuk@amd.com
References: <alpine.DEB.2.22.394.2507071657440.605088@ubuntu-linux-20-04-desktop>
 <aGzu4A_nk3dAScxt@macbook.local>
 <6d283128-4aaf-4f52-8e96-7a4ebe292be3@suse.com>
 <alpine.DEB.2.22.394.2507081000490.605088@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2507081000490.605088@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 08.07.2025 19:11, Stefano Stabellini wrote:
> On Tue, 8 Jul 2025, Jan Beulich wrote:
>> On 08.07.2025 12:11, Roger Pau Monné wrote:
>>> On Mon, Jul 07, 2025 at 05:06:53PM -0700, Stefano Stabellini wrote:
>>>> Hi all,
>>>>
>>>> This short patch series improves Xen real-time execution on AMD x86
>>>> processors.
>>>>
>>>> The key to real-time performance is deterministic guest execution times
>>>> and deterministic guest interrupt latency. In such configurations, the
>>>> null scheduler is typically used, and there should be no IPIs or other
>>>> sources of vCPU execution interruptions beyond the guest timer interrupt
>>>> as configured by the guest, and any passthrough interrupts for
>>>> passthrough devices.
>>>>
>>>> This is because, upon receiving a critical interrupt, the guest (such as
>>>> FreeRTOS or Zephyr) typically has a very short window of time to
>>>> complete the required action. Being interrupted in the middle of this
>>>> critical section could prevent the guest from completing the action
>>>> within the allotted time, leading to malfunctions.
>>>
>>> There's IMO still one pending issue after this series on x86, maybe
>>> you have addressed this with some local patch.
>>
>> Not just one, I think. We use IPIs for other purposes as well. The way
>> I read the text above, all of them are a (potential) problem.
> 
> Yes, all of them are potentially a problem. If you know of any other
> IPI, please let me know and I'll try to remove them.

INVALIDATE_TLB_VECTOR, EVENT_CHECK_VECTOR, and CALL_FUNCTION_VECTOR, maybe
also others in that group of vectors (see irq-vectors.h).

> One of my goals
> posting this series was to raise awareness on this issue and attempting
> to fix it with your help. It is not just IPIs, also Xen timers and other
> things that could cause the guest to trap into Xen without the guest
> knowledge. Typically IPIs are the worst offenders in my experience.
> 
> On ARM, I have done several experiments where, after the system is
> configured correctly, I can see that if the RTOS does nothing, there are
> no traps in Xen on the RTOS vCPU/pCPU for seconds.

Being quiescent when the system is idle is only part of the overall
requirement, though?

Jan

