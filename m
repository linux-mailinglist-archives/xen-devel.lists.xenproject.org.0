Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A218CB08883
	for <lists+xen-devel@lfdr.de>; Thu, 17 Jul 2025 10:55:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1046429.1416760 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucKOT-0000sw-9k; Thu, 17 Jul 2025 08:55:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1046429.1416760; Thu, 17 Jul 2025 08:55:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucKOT-0000qd-6Y; Thu, 17 Jul 2025 08:55:09 +0000
Received: by outflank-mailman (input) for mailman id 1046429;
 Thu, 17 Jul 2025 08:55:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Kd8q=Z6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ucKOS-0000qS-1j
 for xen-devel@lists.xenproject.org; Thu, 17 Jul 2025 08:55:08 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bc03d4ec-62eb-11f0-b894-0df219b8e170;
 Thu, 17 Jul 2025 10:55:06 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3a548a73ff2so672659f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 17 Jul 2025 01:55:06 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23de4332c02sm144849915ad.148.2025.07.17.01.54.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Jul 2025 01:55:04 -0700 (PDT)
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
X-Inumbo-ID: bc03d4ec-62eb-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752742505; x=1753347305; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wSJjDNckZ2TIznAn/jHcE3Dwzte9e/X86y0aypOALdc=;
        b=FDJyQBH5zpWgUKuW0j926VLRT5/y43cYwjUHEFYMoO2Lw/XuB0Sekq4cqPBBzVBpPf
         H+FBOf2UwojvIsDRZg4QtKajwPqFep9a1OIAgdTpne58UAJ8bu7xafSoArJMpePnURzq
         sYw1ltIcvC528S1eMlfTPLu6DV88US7szpzdt122tbayidL8NwkIBKyTtIh9IJVsVzfU
         DqYmLQWtJvSdOGOZilRr5wkhiRgQBA7or4o78dhtIt5c3vbMi0DCQGBUQiHKl+GkVxB/
         IFP//Y5tmkAFD4G/728elrs0r20t1p8onAbUV58u6+EhmCw4hCNMDsJ7b9Jkb1CaCjuH
         WwMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752742505; x=1753347305;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wSJjDNckZ2TIznAn/jHcE3Dwzte9e/X86y0aypOALdc=;
        b=I7kxFptKkqwvaoAygwbZl75djtFmjEl9u+FweEqzB/Xnj7a0AZXx6yz3I7pNt7nF3o
         by77Lv6GdK60bRYl9O56HtmB1IMNl0qNr3NAU+9jEVi+3BrB69V7Vw0CCMKDjrNwkAPx
         g2plhEw7w8wmSzfYL78u5RnJFOW0SEL/7TPjP3WOcK0HN4OYGVUu+j45OimXo71IY6wj
         sJ1BmCCB/8tnxnVYB//jRihoPGwCoC6r9i1O7OOWNdoTirwBycQ2cTsLj6Cv4FNQV7bu
         /lmMoVRcaqjUseepL78jvrOyDG2uw0pnMIXPaxAtzNt8Oa9yurnXaP2j8w8X+0HeKOCU
         MliA==
X-Forwarded-Encrypted: i=1; AJvYcCUztPR/F/g6zuVHF3Wx2bhwh7Y9ciXiHBBAkghdC8my8ucfI9Y4exiYL9HuTw+s9pGzm6LM0aSZxts=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz3E4GvgoFfCnaXKrNloVjRqH0mcE4M/hymbz3lqd1XapgfJHJ3
	9Guga9bzXGfLtgfnlGd61k23mWn+8cauxMgD+UdyA05lFHPD/sX1dbYCWs4Vwh2COg==
X-Gm-Gg: ASbGnctJXexPpkrqgMUmM9qINH1bOjbqJ1vPPSbCLnTQfSW090kKB0DJxwo1Lx09fwe
	t54FznIcTNAraO2qDxlzo0BAFjnGBaexWJoo56KX8juPLsgjSOSEuC4HcaANXp4WJIhfwZQctdR
	YeAALN7OnTpbbwmzRnD2NeYGIEXgXcTAg4OZrZMzG5/neY5o3QHqACxZLPNWjeI3ntGCGRv1OQs
	pn4J81P9bZ/fD7Zwo5+a8qc/pMUzJNbzEIoJWvstMWjphvSzuLrcJieGZe1XrCx6vKW5gvYHpXb
	zfwtqY1EODgzTNHgYQCI+SejxO06vmBmN7uHmWmXTG70aXSREh6mFL5NCucDq7O1E4LlnRfysww
	8+U/xNHv/S52CmPC3pNyftoK8zihygqZqk7ACOekicvxgBe/5i/GmgQMJGpbBhzie9wvPbUNCL0
	bFrXxNy9Q=
X-Google-Smtp-Source: AGHT+IEifl3bmDpg4ZVbpARzocRdqs5eU98ztSlGYpLcYrpNTm/2iYP4VYeOByjMVYkk1Szpi5K3qw==
X-Received: by 2002:a05:6000:43c8:b0:3b6:936:976c with SMTP id ffacd0b85a97d-3b60dd4fademr4307951f8f.17.1752742505486;
        Thu, 17 Jul 2025 01:55:05 -0700 (PDT)
Message-ID: <5238ec09-2a00-4f80-aea6-95a3ab617b0d@suse.com>
Date: Thu, 17 Jul 2025 10:54:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 7/7] xen/sysctl: wrap around sysctl hypercall
To: Penny Zheng <Penny.Zheng@amd.com>,
 Stefano Stabellini <stefano.stabellini@amd.com>
Cc: ray.huang@amd.com, Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Sergiy Kibrik <Sergiy_Kibrik@epam.com>, xen-devel@lists.xenproject.org
References: <20250711043158.2566880-1-Penny.Zheng@amd.com>
 <20250711043158.2566880-8-Penny.Zheng@amd.com>
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
In-Reply-To: <20250711043158.2566880-8-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.07.2025 06:31, Penny Zheng wrote:
> --- a/xen/common/Makefile
> +++ b/xen/common/Makefile
> @@ -49,6 +49,7 @@ obj-y += spinlock.o
>  obj-$(CONFIG_STACK_PROTECTOR) += stack-protector.o
>  obj-y += stop_machine.o
>  obj-y += symbols.o
> +obj-$(CONFIG_SYSCTL) += sysctl.o
>  obj-y += tasklet.o
>  obj-y += time.o
>  obj-y += timer.o
> @@ -70,7 +71,6 @@ obj-$(CONFIG_COMPAT) += $(addprefix compat/,domain.o memory.o multicall.o xlat.o
>  ifneq ($(CONFIG_PV_SHIM_EXCLUSIVE),y)
>  obj-y += domctl.o
>  obj-$(CONFIG_VM_EVENT) += monitor.o
> -obj-y += sysctl.o
>  endif
>  
>  extra-y := symbols-dummy.o

CI demonstrates that this combination of changes is wrong. The job that failed
(debian-12-x86_64-gcc-ibt) is a randconfig one, and ended up picking both
SYSCTL=y and PV_SHIM_EXCLUSIVE=y. Which results in sysctl.c being built, but
domctl.c not being built. Which leaves getdomaininfo() undefined, causing
linking to fail. In case the next pipeline also ends up failing, I'll simply
revert that change. In case it succeeds, not reverting may be an option, as
long as a proper fix shows up pretty quickly.

Jan

