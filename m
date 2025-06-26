Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 330A9AE9DA7
	for <lists+xen-devel@lfdr.de>; Thu, 26 Jun 2025 14:38:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1026314.1401497 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUlrE-0007EX-99; Thu, 26 Jun 2025 12:37:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1026314.1401497; Thu, 26 Jun 2025 12:37:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUlrE-0007CT-6G; Thu, 26 Jun 2025 12:37:36 +0000
Received: by outflank-mailman (input) for mailman id 1026314;
 Thu, 26 Jun 2025 12:37:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=o/Pp=ZJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uUlrD-0007CN-1u
 for xen-devel@lists.xenproject.org; Thu, 26 Jun 2025 12:37:35 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 55492ad9-528a-11f0-a30f-13f23c93f187;
 Thu, 26 Jun 2025 14:37:34 +0200 (CEST)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3a507e88b0aso716058f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 26 Jun 2025 05:37:33 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-749c88722e7sm6896887b3a.166.2025.06.26.05.37.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Jun 2025 05:37:32 -0700 (PDT)
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
X-Inumbo-ID: 55492ad9-528a-11f0-a30f-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750941453; x=1751546253; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=B/pdsmga+9WLKORcptWiaUY7QzAxD+mRE9Kq8aLAfIw=;
        b=WXQzdjeQeQzefEd5twVwbXUEMkbk2Hc1ecLck5YoXHwxIldSjcbW/VF2eMRbPv3fqd
         IfTtFbcDBaMGV2q/wo/Kzp0HcFX+V/cHQcw0KUIGhl83kdU9uGw/pB9LDVdKyVjAH0+d
         caOjD6Q+xjyG44LbH7Ld6dFE5JjcmMIZ6JunP+f9+L/pmlbXryxcYXrp2/kdLWE6lqUt
         kSJQgk+7u424BEddzzeSMt5uQYlLQ5FiCg3g5SSMIEW5n+qqkEr0KU9ZtER/E7GvyvXg
         sQXHk4Ay0lAVeKIOPClFYtT40pnV3TkW1ylD5REpgunwwZVXCQtHqD55vqFy2VI+Dz0o
         t20Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750941453; x=1751546253;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B/pdsmga+9WLKORcptWiaUY7QzAxD+mRE9Kq8aLAfIw=;
        b=qupMSVnmUK9hy7DhKnszEoxhSKngvl8oTQRm08T5BK47zRHOO8XcSk+v8k6faf6WNC
         VCkdE8+YH8+6h41kNSekMEabcvwnO3otly7WtpyOPDjQz5JbhC45+IzWF/UEZDx18Ueq
         IJ5sEW/zvv91WYzbBH4TOuw4reEO0UYyVyt7k9y09Yb02T+59M0SRIovCIEm4PRvU68Y
         4JIu8OhBR+DJqqs1It1IDW+83hpYubnE8JgJv+0Ktedj//5UXAtZjNfmy3MM/ZCHO41e
         rA1Q2XyxrFXu5GBt6435gS+kNZPbdTTSIOUGDAMhDfnslNz3EwlMweL+cEzuTb95OcXO
         R/bQ==
X-Forwarded-Encrypted: i=1; AJvYcCWnK+hure0UqbYYTqCShhfNaP8fYmxIBH0y2qwrs5elNTCiMTVHs6jAczzln7ZYKuk4GVlgm69lQdE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwTjmP4L9eU/Xf/z1BAV5rULdi2qAdZ71UpUCVGIbn/GDKAZD8z
	fRSmTKgP7IVnm4P/Exm+Bt6EIzkAPI03hMOtJgeFS+xCmbM9ptOPgiM77/dnKzZALg==
X-Gm-Gg: ASbGnctTnCrWiV4XeOGF+1GRMs/NhkCG6Gdd02Xawse8rCOJHapht2eU7hZZM/unuHi
	X32t0Q8lqARnyMoUGLAIyMdBCBLMnRk02Efsw2ag0tE413X7uoVVcpuJmEvpuAUILlUV8UV2da8
	vSjB6RLuig/gfRKx4kBw5DApJGfthQp09Znf5mnMAkstC9Evxhnr8zV1lY1rslZJ9pihFirl7Zs
	JqffSXkSQL+vf24VNQbOUZ82gHwpvE/fM9/ToCbinrCqhd4rFKxrGHsvaFh8msVDcz5WSI2YDp+
	pvATLAXSIW5MMyCPgvgMblSbzmOsMWEnWEJPYPUtY9efzz66zCZziWdG9s95UZG9a+n7eJ2lRTp
	TqWw2IIzqPXyiczRKrNaDzt3kzHaDIEY1Dk0hzvl7L7uNAmw=
X-Google-Smtp-Source: AGHT+IESv1h3tnJEKeF6Ymq81qeBEhUM3V4jdP9Jh74MDjdmwb2GdgZk8fANh/5Hjk2dqEo9xLxE2Q==
X-Received: by 2002:a05:6000:2184:b0:3a4:f519:ed3 with SMTP id ffacd0b85a97d-3a6ed648fedmr4449075f8f.44.1750941453377;
        Thu, 26 Jun 2025 05:37:33 -0700 (PDT)
Message-ID: <a54860a1-cf35-44c4-b95a-5c2b1c50cc2e@suse.com>
Date: Thu, 26 Jun 2025 14:37:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/17] xen/riscv: introduce guest domain's VMID
 allocation and manegement
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 Juergen Gross <jgross@suse.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <cover.1749555949.git.oleksii.kurochko@gmail.com>
 <abbf1c30c485d4baae25d4c1fb26942f60015403.1749555949.git.oleksii.kurochko@gmail.com>
 <d747fd23-9ac3-49d2-8a5e-699290cef3f4@suse.com>
 <145f71c2-643e-4839-a2ae-0bc1f049db74@gmail.com>
 <80223fe3-7403-4026-9505-8826c318fabb@suse.com>
 <a692d449-4101-498e-a460-33e4b2fb7176@gmail.com>
 <f5c14ffa-6314-4534-a83e-4024b379755c@suse.com>
 <1a570c32-e207-47f5-9702-a752246328a9@gmail.com>
 <f4a20826-0949-4bf0-a8e8-eecd1428f739@suse.com>
 <264db0b0-43bf-4829-a5cc-ca696601349c@gmail.com>
 <7c5761b5-805c-4d56-ad8c-1746540423e4@suse.com>
 <096224cd-12f3-4e4f-8cd8-74c1ae292609@vates.tech>
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
In-Reply-To: <096224cd-12f3-4e4f-8cd8-74c1ae292609@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26.06.2025 14:17, Teddy Astie wrote:
> Le 26/06/2025 à 13:46, Juergen Gross a écrit :
>> On 26.06.25 13:34, Oleksii Kurochko wrote:
>>>
>>> On 6/26/25 12:41 PM, Jan Beulich wrote:
>>> - Minimized inter-CPU TLB flushes — since VMIDs are local, TLB entries 
>>> don’t need
>>>    to be invalidated on other CPUs when reused.
>>> - Better scalability — this approach works better on systems with a 
>>> large number
>>>    of CPUs.
>>> - Frequent VM switches don’t require global TLB flushes — reducing the 
>>> overhead
>>>    of context switching.
>>> However, the downside is that this model consumes more VMIDs. For 
>>> example,
>>> if a single domain runs on 4 vCPUs across 4 CPUs, it will consume 4 
>>> VMIDs instead
>>> of just one.
>>
>> Consider you have 4 bits for VMIDs, resulting in 16 VMID values.
>>
>> If you have a system with 32 physical CPUs and 32 domains with 1 vcpu each
>> on that system, your scheme would NOT allow to keep each physical cpu busy
>> by running a domain on it, as only 16 domains could be active at the same
>> time.
> 
> Why not instead consider dropping use of VMID in case there is no one 
> remaining ?
> (i.e systematically flush the guest TLB before entering the vcpu and 
> using a "blank" VMID)

Why would one want to do that, when there's a better scheme available?
And how would you decide which VMs to penalize?

> I don't expect a lot of platforms to allow for 32 pCPU while not giving 
> more than 16 VMID values. So it would just be less efficient in that 
> case at worst.

How would you know? How many CPUs (cores) to have in a system is entirely
independent of the capabilities of the individual CPUs.

Jan

