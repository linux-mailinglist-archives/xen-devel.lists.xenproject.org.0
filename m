Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACA41A72C60
	for <lists+xen-devel@lfdr.de>; Thu, 27 Mar 2025 10:30:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.928790.1331453 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txjYx-0000HX-EN; Thu, 27 Mar 2025 09:30:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 928790.1331453; Thu, 27 Mar 2025 09:30:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txjYx-0000FS-Ak; Thu, 27 Mar 2025 09:30:11 +0000
Received: by outflank-mailman (input) for mailman id 928790;
 Thu, 27 Mar 2025 09:30:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8rqf=WO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1txjYv-0000FM-GF
 for xen-devel@lists.xenproject.org; Thu, 27 Mar 2025 09:30:09 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1245ab17-0aee-11f0-9ffa-bf95429c2676;
 Thu, 27 Mar 2025 10:30:07 +0100 (CET)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3914aba1ce4so565551f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 27 Mar 2025 02:30:07 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39ab907da9asm16933532f8f.90.2025.03.27.02.30.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Mar 2025 02:30:06 -0700 (PDT)
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
X-Inumbo-ID: 1245ab17-0aee-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743067807; x=1743672607; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=W4vZBvYaByNd9A1fE5NNYaUZh1Or1PdoNuWSV/1koD0=;
        b=DUdK0Y7NUurY44iImp8JNB9IG9J+MPTATQ2DqQj2cqiOIl/phjvGDrATaIBtE+DpJS
         C5al0EFOhkWQeAwP08m2DJG6sZeUAdJbJDh8Vf8z8WMjqdqupPRyV2e/j73P/XwL8aUK
         AMz9K2WQ8qCA5Ga5IF3JvzI4oqH9wIpzUc+v5RxHrRGc8CfWYGJqfuCJwS9mC9v1HaTb
         B+G77gvi00hmSjG6se72PbMxLLsplsfTnnZEFSFZUP/n/hOE9Ns7gNelqK7GG2L7r04G
         a4YcqO7zyk3KGVjIVgcAdVwpopuYfmGt4xa32EZBPLw/wK2aBZMsKEdIkhAufT9DhyyP
         k3AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743067807; x=1743672607;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W4vZBvYaByNd9A1fE5NNYaUZh1Or1PdoNuWSV/1koD0=;
        b=sCSkCjZIP9UA44UVsOlF7RzNSGLkmTOysVTQvonMmYNJES7AwQFe046TNZq6fBllDA
         jJMv/EX25tXdEFokC8U2Rit4cRAzm7nRWuOlor7MthId+oTYb3jWXRgCaRda1EaJfe3V
         mQnkuqCmd0jL7nfUcuH9hfmo4GJrbeDT7tjfN7qdzLjzOPZA6McMXhHArYnap8Uq993L
         CpoRON8M5uxCc+cwRUCRYDhH7/pnKOlnhfyeuzc6LGYt91pbY+jsFThKpGhkCr3MxQtU
         kwjusnni7m1u0ac+cSNzDAt8qU/F+UTAbRGhvEbWNY9uePa0am0ekEe6T1Wcjg1SBfpI
         D4bQ==
X-Gm-Message-State: AOJu0Yx12D5LxLBwXDGrRw2sYmhRUAH1EvuR1Iq7q5NFafLdAuPivVlv
	NhJv+tA2nY8qfsGChfRZ1sQ4EBbnvFFQpJ04BfHJWNmpZW4HWQSN28ObdfNERw==
X-Gm-Gg: ASbGncuN605M8xGhQ6eg4tpSofrH9s6FCPrgQz1sqTeX6nz3oZJSQlqJTeFRi9vtUv5
	37H0LZf3ZNHlJFLXbYZDqgc9cFD+8m2EGktdZZEh6i2HMZ5xMuz44pkuXaHBfk42hwSiXiIjxca
	Lw8CMv/WuL8Aj7bBAE7sV76ODSD4U6ahs8t75+bhFxUa9a3eV8xJMzpvUImL+MRw4CHWIOT/cBi
	2b8HCwg5IfeuQYttVn94PsH3UVEBLJfYiq8bGmvriHjhW4Yo4jhcQk45hmrAFGPUFeyuHQXv/N/
	PMVc/ysvzSI8I1uEi6g85BnG+cKl5j/weIvq0Y1nt1PDKKfK/PVGY3NBu+6inaoseasNLSkNReF
	wkaawirvH9Ta22wdVJE41+YGXdkfi9Q==
X-Google-Smtp-Source: AGHT+IExw33n57Jurm/4GA5OUknOZplGOJ7D9HQh3OoC5LzEXuN2WqDGWeMjvojVRDkPsLDwleIXDw==
X-Received: by 2002:a05:6000:4011:b0:38d:bccf:f342 with SMTP id ffacd0b85a97d-39ad1760510mr2298061f8f.43.1743067806845;
        Thu, 27 Mar 2025 02:30:06 -0700 (PDT)
Message-ID: <bb3a7a97-b90e-461e-9ebb-edf8cfbe430a@suse.com>
Date: Thu, 27 Mar 2025 10:30:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/CPU: don't hard-code MTRR availability
From: Jan Beulich <jbeulich@suse.com>
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <edecdda9-4728-4c65-9f31-76c912a433d7@suse.com>
 <Z-UKm6D9pmAEaE_9@macbook.local>
 <eb44921a-f6af-4aa9-9395-18e4e47d440a@suse.com>
Content-Language: en-US
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
In-Reply-To: <eb44921a-f6af-4aa9-9395-18e4e47d440a@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 27.03.2025 10:15, Jan Beulich wrote:
> On 27.03.2025 09:21, Roger Pau Monné wrote:
>> My main concern is whether the !mtrr path is still functional.  Have
>> you tried booting the resulting hypervisor with MTRR masked on CPUID?
>>
>> (or alternatively short-circuiting cpu_has_mtrr == 0?)
> 
> I didn't think this would be a prereq here. If we boot in an environment truly
> lacking MTRR, we'll crash on the first MTRR MSR access - none of those accesses
> use the safe accessors. Since you asked, I tried booting with "cpuid=no-mtrr".
> As I'm doing this on a system with console, all I can say is that it takes
> minutes to reach the point where we'd start setting up Dom0 (which itself then
> takes so long that I timed out waiting for it to make progress), due to all
> screen output becoming unbelievably slow after AP bringup. Surely something's
> screwed somewhere, as VRAM accesses being slow (or fast) shouldn't depend on AP
> bringup having completed. I actually suspect it's not just VRAM accesses which
> are slow, but that we're left running in uncachable mode altogether for whatever
> reason.

I think found a trivial way to avoid this, and the change there imo makes sense
even if I can't explain this particular aspect of it. I'll submit that
independently.

Jan

