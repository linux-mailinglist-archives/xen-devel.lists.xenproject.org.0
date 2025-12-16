Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5EDBCC1FDF
	for <lists+xen-devel@lfdr.de>; Tue, 16 Dec 2025 11:37:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1187826.1509158 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVSQl-0000pH-3O; Tue, 16 Dec 2025 10:37:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1187826.1509158; Tue, 16 Dec 2025 10:37:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVSQl-0000me-0F; Tue, 16 Dec 2025 10:37:23 +0000
Received: by outflank-mailman (input) for mailman id 1187826;
 Tue, 16 Dec 2025 10:37:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=t3Kb=6W=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vVSQk-0000mY-Eu
 for xen-devel@lists.xenproject.org; Tue, 16 Dec 2025 10:37:22 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3362f5df-da6b-11f0-b15b-2bf370ae4941;
 Tue, 16 Dec 2025 11:37:20 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-42e33956e76so2071541f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 16 Dec 2025 02:37:20 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-430f7475895sm16087765f8f.33.2025.12.16.02.37.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Dec 2025 02:37:19 -0800 (PST)
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
X-Inumbo-ID: 3362f5df-da6b-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765881440; x=1766486240; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=hO0F1xOUvtlwJl1z+INLlQfmgAbeX/EB504Kr7PQQqs=;
        b=ZF/+SixYi/nJrCAKyTCHnp7L7uJh15lybHIKSRVGL5V+9qLYY8rXr9BG93LfJp63m+
         HkeFPkp9rnyggNx/a0ZqEnAY2UAZzrbimDqXSl5P6h4uUl6HWQsWJTJ+gEpWo6bgT82z
         omXXJ0dJ/8IL5IZHy6yCzYN2sPrXQiKa1OuvfDa0LQT4FnxlI/0p5HJzEao3H2NvtKf1
         MJSJOuASekVkRJm9sxw0loyzSeFs60GfDXHgzZL1vJOJeo9eHs43T/AH2pZYNZ6+etBr
         uitCCc9sHcJaxZ/ATSbr/qIUpnE/A3DQCg1iDr9EG+aY+LQfFLbBHrWElkpXke7Z3Qs+
         7yWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765881440; x=1766486240;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hO0F1xOUvtlwJl1z+INLlQfmgAbeX/EB504Kr7PQQqs=;
        b=M/mKY4jJWsjgz1kh3hMaFFm3jkwIPFXfwx2p23hPUBQHSJHAq/0A4LlwjAm+KEeShb
         NDaiYitlaQ0lH8OCgjEU+87FEjWsU8889eMCRn7aWHX5hXmAY330Y7aWKYjrnUW1Vz0M
         61Je5UHd4BikWLbPtDgvfxdSf4+gxy3lKSc7CuEwqgmXTsvDYLGb7/wx+JACpl0erSMt
         2TdZYRnp8MWMUr4JZmuTF/fx9s4AOQZIxFnIsmX5k2SauomeXamIfgkC62o1AcyBHPxu
         CDbycIt7RQfouCEfGpWK9lAZqOO78gZnMEZ902CBECW6GybBCh4XL3Z9bsQYJvmWkzjl
         tjPQ==
X-Forwarded-Encrypted: i=1; AJvYcCUsE5DzPeiiO8CL3KCDnC7iY8zPyAYBvUpmHmNPExKQF4HuJAXQQH6QYpyIbTniHWwdW7Mso7uTczI=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx3n2IFIj9rvV2v9jHQv7JkDvpgrrQ52z/p6s7RSTpYNthZIVKg
	s0e47ekFJA0VQPfDgWUjWz5M/3T2/uWpHtS7GcZSsC6Nsgl7bV2MpyTvxOBXGME2Ow==
X-Gm-Gg: AY/fxX4M8+TuFHYvx28Ou6nK6thbD3UhNSdASFVVuMSaWUk2GDRkZM2X6CshaXu+4xr
	KLsOvNOuElAN/QHP75EdvSwW/82EbVN4EhxaD2yRKwGdOgD/gZx0o0ryoHOEWu4PhZsKBcUFy+a
	8NOD/B0W4K4T0YrpWnBs51M4z10ccM7NkcC6P75Ck+LuBhhiCYP7fPFZYOMjNT/+r5m6PWpt91V
	wL9ar498Subn9XKUD69Az08fAe3TBUpxP75sINzvlHyRvrZFNRtOcd+j/zeUOF1ksaSsLUdY2lO
	dw7GBPap5DvHbHvxBJfpKQR+qK3PUtAZELRKV1AnlCNFN2LEaXAvAA9yGeDmm624dM6cFXFz1hI
	pbIuwLBv+VlI3bX7BrjtzP87qmMZFRzpbdrOsC/+AUSI9uPqCsLX4Tl7xLC89S2nOmCcgd62vwi
	CI6hv8sQmIXDtUz58voIeD6kWfnwqeatD1Ui7oGO1t3DA+jgzlq2NT59YmFY9ZzyImAwKOwU7wk
	z8=
X-Google-Smtp-Source: AGHT+IGbQVFaZKgEom16huaPISPOZJNwrs7f32fclSfNAyWLlKJ28snWspLYmjYlrsW2W7YWlZcjTQ==
X-Received: by 2002:a05:6000:2305:b0:431:32f:314b with SMTP id ffacd0b85a97d-431032f34cemr2595467f8f.9.1765881440234;
        Tue, 16 Dec 2025 02:37:20 -0800 (PST)
Message-ID: <342a49c9-6b83-4605-a5e7-b2f7fbdac269@suse.com>
Date: Tue, 16 Dec 2025 11:37:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] x86/AMD: disable RDSEED on problematic Zen5
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <0b15a3fb-6ce4-4bf7-a235-073742fff35d@suse.com>
 <05012660-b93f-4439-a383-ff6e8e8d9566@suse.com>
 <c4f7c28c-c5da-4c52-b243-a07dea8bf201@vates.tech>
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
In-Reply-To: <c4f7c28c-c5da-4c52-b243-a07dea8bf201@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 16.12.2025 11:08, Teddy Astie wrote:
> Le 16/12/2025 à 10:03, Jan Beulich a écrit :
>> @@ -1130,6 +1152,28 @@ static void cf_check init_amd(struct cpu
>>   		    !cpu_has(c, X86_FEATURE_BTC_NO))
>>   			setup_force_cpu_cap(X86_FEATURE_BTC_NO);
>>   		break;
>> +
>> +	case 0x1a:
>> +		/*
>> +		 * Zen5 have an error that causes the 16- and 32-bit forms of
>> +		 * RDSEED to frequently return 0 while signaling success (CF=1).
>> +		 * Sadly at the time of writing the fixed microcode revision is
>> +		 * known for only two of the models.
> 
> Is it still two models ?

Oops - s/two/some/. Thanks for noticing.

>> +		 */
>> +		if (c == &boot_cpu_data &&
>> +		    cpu_has(c, X86_FEATURE_RDSEED) &&
>> +		    !is_forced_cpu_cap(X86_FEATURE_RDSEED)) {
>> +			static const char __initconst text[] =
>> +				"RDSEED32 is unreliable on this hardware; disabling its exposure\n";
>> +
>> +			if (zen5_rdseed_good(c))
>> +				break;
>> +
>> +			setup_clear_cpu_cap(X86_FEATURE_RDSEED);
>> +			cpuidmask_defaults._7ab0 &= ~cpufeat_mask(X86_FEATURE_RDSEED);
>> +			warning_add(text);
>> +		}
>> +		break;
> 
> Do we still want to disable if we are running in a hypervisor; we can 
> expect the host to emulate the instructions to workaround the issue ?

That would only work if we knew the host intercepts that insn. We don't
ourselves, so I can't see us legitimately expecting anyone else to do so. Plus
while I'm aware RDSEED can be intercepted on VMX, I'm unaware of there being
equivalent functionality on SVM (PM vol 3 does not yield any hit when searching
for RDSEED).

Jan

