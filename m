Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CBB5D141E0
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jan 2026 17:43:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1200777.1516616 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfL0S-0002wL-1i; Mon, 12 Jan 2026 16:43:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1200777.1516616; Mon, 12 Jan 2026 16:43:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfL0R-0002tU-VB; Mon, 12 Jan 2026 16:43:03 +0000
Received: by outflank-mailman (input) for mailman id 1200777;
 Mon, 12 Jan 2026 16:43:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Qluw=7R=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vfL0Q-0002tO-KC
 for xen-devel@lists.xenproject.org; Mon, 12 Jan 2026 16:43:02 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c16e6c95-efd5-11f0-9ccf-f158ae23cfc8;
 Mon, 12 Jan 2026 17:43:00 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-47775fb6c56so63256795e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 12 Jan 2026 08:43:00 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432bd0860f5sm39432041f8f.0.2026.01.12.08.42.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Jan 2026 08:42:59 -0800 (PST)
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
X-Inumbo-ID: c16e6c95-efd5-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768236180; x=1768840980; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=aodtCCYQHv77xQMPNm9MvtkCMQFK6CqUOHOhIfnR5Hs=;
        b=gkHnNu8lgeZqtgmKmfgvYLFWdrsZEgUhakufs/aj1IKRWONzVpErvjvED20fEcCvI7
         Qoej6Bpzqi8LTMY1ez1Cnb0/fX940MeTIrFGDoHedFgU1B5wdrsi1tY9pRy/RThKY4q7
         dJNvmyRPWa5Tz0pRtAdspHR/C12Fj3IEbQJGn5GSMO2BidYi6syuXP8rGbmmMVSRjaWS
         jNk7rjt+RAnkHa40AHi2sjNk/EICjFbltdgzGgAaOkfEaKf/poplIRLwSLc9IoPkuLXo
         XjaBqzWXNCkPQBoVYGNgK111gmsZqt4zBGrPwoV/MmV1bdPoJg+Zzp8y2+6TkcW8TWws
         QemQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768236180; x=1768840980;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aodtCCYQHv77xQMPNm9MvtkCMQFK6CqUOHOhIfnR5Hs=;
        b=J+uMElegLpREOBv9TxmYfWqaTl+IL/Jfah124BUeLwICpsplFxP2cB9TBkd9LSGl3J
         yBDwgRZkDwvFVZ4mgeHhMIYsBwiy7Sls9odUungMVZVcm3Rq1c+ybS66QJlGT2JqwLfb
         H7tXrduAxZ17GiCQoM1qzUlJvMqturbDtHHYKyWf20gb3ZIfldO01CRvH/sNh4ESysD+
         kysJIogpf/BaYfV4ZxJH6PmI3yLHqJwnPKfwHuKzSZzvGQl0hXMvTcqg63buQ1QRpmFP
         zhS1mpYWkeGAiZI85AQupWVz6dxtNRs8fQ4iRO1ptaiU5EnUYew9eRJl7LcDB6UPEg12
         /cKQ==
X-Forwarded-Encrypted: i=1; AJvYcCUhKMGxu+PZBpUNPWxU7eJ1/JCNQAiRMKJ1wvmZoBZXRf8ebUi+d9Cu+BpPpuLHIs5ci8AaxnDfxD8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxqSQ3eWyJPjMR2jcg45cX4SaTNVQx2I1K9SKxMWPOByK4F3vwB
	W/FmGrmzdcd5Em1/hNGkSGNvOEn9KxuoXAc0o5h4VF/f60HIgdCCDKNDQy7PD4eWcw==
X-Gm-Gg: AY/fxX7UOSpq42wSjJm6fd+U/U6bcPvJYiJHZb4elJUC3BJNJYYdWFcc+XXbV+V1Lfi
	+jlTqCN4Yuhpcq4BkVOvYM4DQE6+yNk6HzCKbthX1YuWsMftqlNrT5yJevnDL82YOkuVR2Tul0O
	vOVpJY5P3Xt0Hwn/fb8o5MezT5YJj0p6blFZSHfF9t/I5k6s7AB8CJL/4WRrHQgDJlTQ6kG1w01
	U0zxFUpKe0sXns6mm/YklINIUUFafqFhM4KEY30exZE4rp9SC1bO1LPC5nFtyXGVJjB5e8ULuw2
	4mkqD+PA9L3BmHLnhLAjKBs1EkRi7vEgISfCsK2hvdhW41qs9EtBiFNP+TcFg/XX5VkiW/nVMuf
	0rpjHocruQW7d244hoqFTxy61OqDRNU3FBUvapxYTSF7rOHzJRz6AoVH5UAs+ZBLLE8n8OkhTEo
	pfFJiug73FzNgTurapFk6nf7ddzCKQsKIPDXA9UTsnRX2eV9JX/EtGh5MuOPo3YkgoYgQHwvY35
	vc=
X-Google-Smtp-Source: AGHT+IHlwh93TCtO8IqHNHC/MbVo+JsrZatcg6YIGCqsaGfL1l7Ci1sNVzYwddTnDcJlnmFXrXQLxQ==
X-Received: by 2002:a5d:5f43:0:b0:430:f3fb:35fa with SMTP id ffacd0b85a97d-432c38d22fbmr22858680f8f.57.1768236179567;
        Mon, 12 Jan 2026 08:42:59 -0800 (PST)
Message-ID: <e84d4b88-0c17-43ef-b2aa-4853705a255b@suse.com>
Date: Mon, 12 Jan 2026 17:42:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 03/15] xen/riscv: implement vcpu_csr_init()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1766595589.git.oleksii.kurochko@gmail.com>
 <bf617d77bb9e75bbd2930614bb86ff83b80adcfc.1766595589.git.oleksii.kurochko@gmail.com>
 <dc24a8ea-9041-4097-bbe2-459c668e9e64@suse.com>
 <7ba4bcfe-59d3-43f3-adb4-207424dc1713@gmail.com>
 <f1beef63-1995-4e8d-bbdb-3be406ac414c@suse.com>
 <988ba581-5503-45d4-a621-18cdc3b14cab@gmail.com>
 <30dbd0b0-2a2b-4064-b39c-4dfa438af15b@suse.com>
 <dc510c7c-58d7-4435-9df9-b51b5c3341f4@gmail.com>
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
In-Reply-To: <dc510c7c-58d7-4435-9df9-b51b5c3341f4@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12.01.2026 17:39, Oleksii Kurochko wrote:
> 
> On 1/12/26 4:54 PM, Jan Beulich wrote:
>> On 12.01.2026 16:46, Oleksii Kurochko wrote:
>>> On 1/12/26 3:28 PM, Jan Beulich wrote:
>>>> On 12.01.2026 13:59, Oleksii Kurochko wrote:
>>>>> On 1/7/26 9:46 AM, Jan Beulich wrote:
>>>>>> Also, wouldn't you better keep internal state in line with what hardware
>>>>>> actually supports? CSRIND may be read-only-zero in the real register, in
>>>>>> which case having the bit set in the "cached" copy can be misleading.
>>>>> [...]
>>>>>
>>>>>> (This may similarly apply to at least hedeleg and hideleg, btw.)
>>>>> Regarding the previous bits, I can understand that it would be an issue:
>>>>> if SSAIA isn’t supported, then it is incorrect to update the corresponding
>>>>> bits of|hstateen0|.
>>>>>
>>>>> However, I’m not really sure I understand what the issue is with|h{i,e}deleg|.
>>>>> All writable bits there don’t depend on hardware support. Am I missing something?
>>>> My reading of the doc was that any of the bits can be r/o 0, with - yes -
>>>> no dependencies on particular extensions.
>>> Just to be sure that I get your idea correctly.
>>>
>>> Based on the priv. spec:
>>>     Each bit of hedeleg shall be either writable or read-only zero. Many bits of
>>>     hedeleg are required specifically to be writable or zero, as enumerated in
>>>     Table 29.
>>>
>>> Now let’s take hedeleg.bit1, which is marked as writable according to Table 29.
>>> Your point is that even though hedeleg.bit1 is defined as writable, it could still
>>> be read-only zero, right?
>>>
>>> In general, I agree with that. It is possible that M-mode software decides, for
>>> some reason (for example, because the implementation does not support delegation
>>> of bit1 to a lower mode), not to delegate medeleg.bit1 to HS-mode. In that case,
>>> hedeleg.bit1 would always be read-only zero.
>>>
>>>>    In which case you'd need to do
>>>> the delegation in software. For which it might be helpful to know what
>>>> the two registers are actually set to in hardware (i.e. the cached values
>>>> wanting to match the real ones).
>>> Does it make sense then to have the following
>>>     	...
>>> 	v->arch.hedeleg = hedeleg;
>>>     	vcpu->arch.hedeleg = csr_read(CSR_HEDELEG);
>>> in arch_vcpu_create()?
>> The above makes no sense to me, with or without s/vcpu/v/.
> 
> Right...
> 
> It should be also csr_write() before csr_read():
>   csr_write(CSR_HEDELEG, hedeleg);
>   v->arch.hedeleg = csr_read(CSR_HEDELEG);

Ah yes. Alternatively you could obtain a mask of modifiable bits once, and
then simply apply that here in place of the CSR read/write.

Jan

