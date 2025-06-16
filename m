Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55FF1ADB36A
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jun 2025 16:19:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1017324.1394302 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRAgM-0004Ij-I7; Mon, 16 Jun 2025 14:19:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1017324.1394302; Mon, 16 Jun 2025 14:19:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRAgM-0004Fx-Ei; Mon, 16 Jun 2025 14:19:30 +0000
Received: by outflank-mailman (input) for mailman id 1017324;
 Mon, 16 Jun 2025 14:19:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jh7D=Y7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uRAgL-0004Fr-39
 for xen-devel@lists.xenproject.org; Mon, 16 Jun 2025 14:19:29 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e9392868-4abc-11f0-a309-13f23c93f187;
 Mon, 16 Jun 2025 16:19:27 +0200 (CEST)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3a361b8a664so4633147f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 16 Jun 2025 07:19:27 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b319467bd41sm3567857a12.24.2025.06.16.07.19.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Jun 2025 07:19:26 -0700 (PDT)
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
X-Inumbo-ID: e9392868-4abc-11f0-a309-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750083567; x=1750688367; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zVP5n4ekblcnUWvCNJVCmgzyA5qQ2D+3paM2EkBmvVs=;
        b=Elwie3kIUJj3RIQoo8081lp0X+giZBevLBG5T/w3GvEQc6Nz4DbE2aNkJPFs28ca/S
         2ATVMFiz/88BIr+A1R175WQqCt2EZve7gY3zFxoPUefq7ddAXr3qg0gmqqBnjCD6vlui
         aUVDG+SmBi/jcIs4IUrh0+kqxpVd//xvqyG2CIgisvYvS50z4WMlUXZxJQzu05DzADze
         eTMxC3sj9ON6sjGrAvfSaAz4dKFKuQ5l1axulIvLA2jAl60VYO82ip6cKaIjHtpgLHvp
         sdySCz70FE59PSAZG/ADn9uR3IMzdQk+hxYU0rht14o/zPVdGThRu2AG/DW+6bvkQOrX
         1JrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750083567; x=1750688367;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zVP5n4ekblcnUWvCNJVCmgzyA5qQ2D+3paM2EkBmvVs=;
        b=DCyfg0AjMF2iq3VpiBs4IF0g7Uf7IEhQNolsRPZO8PmJk3iFciYIvwDmJYWqxZcfG0
         RIRqY4olkp0NOy26ABVUQqyzUT0mKRlsh5Q8swt1fgxYxz7ydG0/0803lnpuLfrlvp9L
         TFX0yN8NHy2UolPnh2cPc16kTdqv8gM90TbdakDnT6GPItW0KA2aewq3CI88l1R7/Vdi
         6CuWxMvw2Y3EWEKmYlAddbYJA3AcXTd7g/+QMuGWSmwBTAjGYqAGyyyUvZ7xLB62sFGA
         vg5TIY5zXbYBAkLftwBJ1MSiswLnQ07BmaLuPbnl2km30Zw5TatOmBOpxzj0Ul3YK/gO
         3BQA==
X-Forwarded-Encrypted: i=1; AJvYcCXMv4jT4ASqETvWGzHMLyGs1qk22EC8qh5EtCkhNIZFSZRMvL2LXhL3oiHQ8/e61xPIbuQgyumbzvQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzPi2nok1I4qE8j6kbaX6VlMAXGBZZyqS8/aHAY+7IXoTMzkcyE
	1u+f1q+zRt6aWJ8NQgjp1g6MotH+R2Z3e//9tyhTvSGE9l7jL9ajUirl+cHi3ajT7w==
X-Gm-Gg: ASbGncsZKgSiErYltHGaQUPp+k3hCGcxAhlZNLB3ZdBWLIwpNpHnNU5brrLKm7tKn7C
	fiVmkWNp9XaQDrkNAOQlQUgrEjAMPGMzFJI6Zx0dV8PgKpmY1x160ErJnmKdyiiAK/tsX3E83Vc
	8ncNjpuGsp+hqrH5Oae7JiQpa+XJliVpHjejeHdwjBTE4o2tiAYpUMpSYKHFrPAsiNPpMclU45c
	1eUxrki1LZRYqCilMe7SmyFM3ULcXbiaXeqRqy96K+Vx//zNZB6nzx5B3XPGnt5gYGP3B4pd2dm
	3SCJQHnidNb230BBSvPcwSnBCAOMH6zKG9Flb9+Li7wqMOvY3pRFyrtby+aiKTKBsXS2rKeXiha
	a+WUnuEUJ+j1lVpEuAJydhRPdmdnNKNEMIsfQ7T0jlzaIKfg=
X-Google-Smtp-Source: AGHT+IEGflE5Megwvd5acudINcgcqxFMTZQjxh101i/jslo9Kps0iCtpJ/A1aaLNj5QRlLVDQHNVHw==
X-Received: by 2002:a5d:64cd:0:b0:3a5:5270:c38f with SMTP id ffacd0b85a97d-3a5718b455fmr8419074f8f.0.1750083566733;
        Mon, 16 Jun 2025 07:19:26 -0700 (PDT)
Message-ID: <7581099b-96c8-4ec1-8323-8e93c3200f5b@suse.com>
Date: Mon, 16 Jun 2025 16:19:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 14/14] kconfig: Allow x86 to pick CONFIG_DOM0LESS_BOOT
To: Alejandro Vallejo <agarciav@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <20250613151612.754222-1-agarciav@amd.com>
 <20250613151612.754222-15-agarciav@amd.com>
 <79722683-cd29-4b38-bd93-ef9458f95056@suse.com>
 <DAO0PFUYWBH9.1WIFUKRSL6CJE@amd.com>
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
In-Reply-To: <DAO0PFUYWBH9.1WIFUKRSL6CJE@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.06.2025 16:12, Alejandro Vallejo wrote:
> On Mon Jun 16, 2025 at 8:59 AM CEST, Jan Beulich wrote:
>> On 13.06.2025 17:13, Alejandro Vallejo wrote:
>>> Without picking CONFIG_HAS_DEVICE_TREE.
>>>
>>> In order to do that. Allow CONFIG_DOM0LESS_BOOT to enable a subset
>>> of the common/device-tree/ directory. x86 doesn't want dom0less-build.c,
>>> as that's tightly integrated still to the ARM way of building domains.
>>
>> Which then is grossly misleading: x86 also ought to select HAS_DEVICE_TREE
>> if it wants to use that machinery. Instead of theis an the previous patch,
> 
> It wants to use a _subset_. I can't use the full machinery.
> 
>> I think what we need is a new Kconfig setting to control the use of
>> dom0less-build.c.
> 
> It's not just dom0less-build.c. It's critical to avoid parsing device_t's
> during the unflatten procedure (which is the few lines compiled out with
> ifdef CONFIG_DEVICE_TREE).
> 
> Renaming CONFIG_HAS_DEVICE_TREE to CONFIG_HAS_PLATFORM_DT (with a suitable
> `help` message for clarity, even though it would always be enabled) should
> help clarify things.
> 
> Does that sound reasonable?

Perhaps. The main input has to come from DT maintainers, though.

Jan

