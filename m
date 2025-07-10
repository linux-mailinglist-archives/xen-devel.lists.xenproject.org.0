Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DE99AFFB97
	for <lists+xen-devel@lfdr.de>; Thu, 10 Jul 2025 10:02:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1039159.1411115 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZmEy-00081m-4Z; Thu, 10 Jul 2025 08:02:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1039159.1411115; Thu, 10 Jul 2025 08:02:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZmEy-0007zw-1w; Thu, 10 Jul 2025 08:02:48 +0000
Received: by outflank-mailman (input) for mailman id 1039159;
 Thu, 10 Jul 2025 08:02:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=V320=ZX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uZmEw-0007zq-QN
 for xen-devel@lists.xenproject.org; Thu, 10 Jul 2025 08:02:46 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 42d5bfd0-5d64-11f0-b894-0df219b8e170;
 Thu, 10 Jul 2025 10:02:45 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3a4fb9c2436so449912f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 10 Jul 2025 01:02:45 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31c3eb7e9ecsm1504253a91.42.2025.07.10.01.02.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Jul 2025 01:02:43 -0700 (PDT)
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
X-Inumbo-ID: 42d5bfd0-5d64-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752134564; x=1752739364; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xJ0qp0T4D+SitfRfG30hYwGCGnwJpsWII20E3YfRpQ4=;
        b=GUKgIM5OWp0Rv35wBeJh6B0GokDvElyihX32ksjpbiys3+T/T6XwXh95a+e1DhET7m
         W369lUOXj9XTKJVVqrAcN5PzEpM9lXf3vJ5+aqLNx29BHsBrTJuVhgL8sk4PbTXnJBJd
         fZuZ7SbOvtGFSwnYV7SPZYUts3vIez9nyXu74XCUvxXWlrWN2ocUwdcwKh8xi78nZ9HW
         5P3AUZ75J3KdI1bQLkf84a27l2pC0Rse2I/sUf8lIPnHFy3YVK3Ir+ODEGdPoj0nvSyL
         C0SXeaBGA4LMkuhq9QTTmrjUCiifxEqjmnkjn9NNAIctAbX+M70S2K8WwTYWtB58efWu
         DQSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752134564; x=1752739364;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xJ0qp0T4D+SitfRfG30hYwGCGnwJpsWII20E3YfRpQ4=;
        b=ixNyppokGi92k+8Tz79dTy/spW27rQHeHvN3Gp6QwNU/q/NXhif+m458IpfPZLbbLj
         9b3GGCuMTeWWW4KTr9L9q0YNQdjlXaYo94bo+tOHTYUnDUnwEDNqaGFMshhuxGTYCj2F
         QZWN5QtSGx7A89nmRjjoiGMQA/hCrhHQ2WuAvtoWvNf25vkqd/m7+tl5uEMQQhxURBHT
         Ap7j3laAAPttdAGOiGNL5O89W+1NC7eV+YXvnCwthBTel+JnL0zPMXS77LTEwf5e8p8d
         X3fFJ80Ulkfjdvksw7XJW7odqqV3ADSjF40aw8fJBpJYKo6/WtzwI2PQ/sDcdfV70Jfi
         sKVQ==
X-Gm-Message-State: AOJu0YxWsapv/r2UmoeBA9CCWNprKZ6OconizvniEfZZDXA7L9SPS2Gg
	o2xxuv/5wRrO98qOCErLP0rtRJ6Nrov6Vfi5mOcY138EfHpSNiKKgAyVwq+AuzwCNg==
X-Gm-Gg: ASbGncvId6xaht708bQWw8sTC/B/NSSxqDjtTsXjsaMRSRvrUx+gnAZFeD1OTNZKwyi
	znOhN1pa4vYZdWbAANwFLqLb3C41Ezg8mW5bMrQCpLUU9l1NN/9rtvAm0qOHvmKX223Uy2ROP4Z
	ySgZ5RDWFUgdKAtoNrTjoZFHexEJHjRI5NQOBRecONZK0jnWGppV7ijQ1X1lWw2hwQKaZo+/2l9
	vl5kUaY9G3yM6WkzycDyLXWlTi22QMzj/1T1IH51CtP525MbYCVHyghQVw/0kdXWIVEnG9Unlk3
	QEAnBWk7CqrTN1Nn0tudJPVmm8/vbubhEvMGUiYkUG0vqq/Z9wNq3VSuaGCXRwi9MWRYgZsb+yY
	R74PWeM6+Nds+FkA8evBwRjtKiyRgp1WaU4WLGL2/O3hPFg0=
X-Google-Smtp-Source: AGHT+IHkce7nH3eNNVnH6V6wBHuG33Rqo4G+etDUrmFz9HkJ4yh45HOsy3iXGKySZwp9WJs2BKU4mQ==
X-Received: by 2002:a05:6000:40de:b0:3a4:eecd:f4d2 with SMTP id ffacd0b85a97d-3b5e78c0e9bmr2791749f8f.38.1752134564213;
        Thu, 10 Jul 2025 01:02:44 -0700 (PDT)
Message-ID: <979884b1-736d-46ee-9465-e432404c59be@suse.com>
Date: Thu, 10 Jul 2025 10:02:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Xen real-time x86
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <stefano.stabellini@amd.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Xenia.Ragiadakou@amd.com,
 alejandro.garciavallejo@amd.com, Jason.Andryuk@amd.com
References: <alpine.DEB.2.22.394.2507071657440.605088@ubuntu-linux-20-04-desktop>
 <aGzu4A_nk3dAScxt@macbook.local>
 <6d283128-4aaf-4f52-8e96-7a4ebe292be3@suse.com>
 <alpine.DEB.2.22.394.2507081000490.605088@ubuntu-linux-20-04-desktop>
 <b81d7bf6-6254-4001-89f3-3ec06e03e21a@suse.com>
 <alpine.DEB.2.22.394.2507091736520.605088@ubuntu-linux-20-04-desktop>
 <aG9lh5FI8tKMJkco@macbook.local>
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
In-Reply-To: <aG9lh5FI8tKMJkco@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10.07.2025 09:02, Roger Pau Monné wrote:
> On Wed, Jul 09, 2025 at 05:44:33PM -0700, Stefano Stabellini wrote:
>> 2) means that the RTOS must be undisturbed when executing the critical
>> section, which is typically right after receiving the interrupt and only
>> last for less than 1ms. In practice, it means the RTOS should absolutely
>> not be descheduled and there should be no (unnecessary) traps into Xen
>> while the RTOS is executing the critical section. It is expected that
>> the RTOS will run the critical section with interrupts disabled.
> 
> What about other external interrupts?  While the guest runs the
> critical interrupt handling section with interrupts disabled, an
> external interrupt from a device targeting the pCPU could cause a
> vmexit.

For interrupts to be handled by the guest, we may need to finally gain AVIC
support (albeit I'm not sure how close that is to VMX-es posted interrupts).
For interrupts handled in Xen the only way would be to allow the guest to
announce such critical sections to Xen. Which, besides being a security
concern, may of course itself represent unacceptable overhead.

Jan

>  I'm not aware of a nice way to solve this however, as for
> PVH/HVM Xen doesn't know when the guest has finished interrupt
> processing (iret).  Maybe this is not an issue in practice if you
> isolate interrupts to different vCPUs (you might have to do this
> already to ensure deterministic latency).
> 
> Roger.


