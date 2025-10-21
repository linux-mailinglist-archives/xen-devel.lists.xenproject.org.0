Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5756ABF546F
	for <lists+xen-devel@lfdr.de>; Tue, 21 Oct 2025 10:35:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1146868.1479216 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vB7pT-0007gR-V0; Tue, 21 Oct 2025 08:34:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1146868.1479216; Tue, 21 Oct 2025 08:34:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vB7pT-0007e2-Rv; Tue, 21 Oct 2025 08:34:51 +0000
Received: by outflank-mailman (input) for mailman id 1146868;
 Tue, 21 Oct 2025 08:34:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9TpK=46=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vB7pS-0007dw-DY
 for xen-devel@lists.xenproject.org; Tue, 21 Oct 2025 08:34:50 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cbe7461e-ae58-11f0-980a-7dc792cee155;
 Tue, 21 Oct 2025 10:34:45 +0200 (CEST)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4711b95226dso40674965e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 21 Oct 2025 01:34:45 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-427f009a797sm19171259f8f.27.2025.10.21.01.34.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Oct 2025 01:34:44 -0700 (PDT)
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
X-Inumbo-ID: cbe7461e-ae58-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1761035684; x=1761640484; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ByRRGw9bHnq4l1+ZsV+7jUmDxAlCkzpoSYUe2E+MR6c=;
        b=Z0cXLI0GzU43SAyhurHkpzz+/j1GjndJZtifEzw2sYc+ibzqY+uhuESqoLieKrxk9A
         4O1Ywmy8sBkiywRZ440BR3+XOhNODMzflFQWCfbF2PdQ1qzZE2CrrlorjqjLmzDVFLe/
         d3jO6u1xF78GeLKwpLqz3jExfvZe9rle9sRj3kpGUlybNwYEjXU+CZo50iIxYAPSXbDS
         jyWCn+uMLUhMa+rnDPmsiAgokbjt7c3iqFonbe00KIrkE9vXDKzJbofZuYOB6iMkRCdm
         oqfMAw6tCVC87M7OcyP+C0mmguE0r0yB9nlnt/X61mTkYYRznJ87voAk1VCv6tj7d+rY
         0cmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761035684; x=1761640484;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ByRRGw9bHnq4l1+ZsV+7jUmDxAlCkzpoSYUe2E+MR6c=;
        b=seXdJwDSMwerGVz1MejrUrnCKXPGAlCjCjGeu5cqrdrDQt/IENWWMzmwb28kJcOkd/
         pTh6d/dmPR6vxu9JRDl+q81w96y41CtMNvfDgbxwY+ADGfKoiV9I0SV5rPqTyxAh/kQZ
         /AFVgAHAcHXx5zZOhCvcrOf/GvyaveZ9gQEobu4wFZgkfdG0DpUIHeRe7UVV7hQfEh/l
         6GeYaGdNTqkpayfwJBfmqgAimg39HB1x8GbotJvk7BZahRgHrdXt6MhDvv8568R5cfnd
         Q6C3cnnCk4LWknFazQWa5HoO19PQ7yQ/uhVVEHU+VuTx6aSfyBLYN4RmKeibisWgr+hP
         RDRw==
X-Forwarded-Encrypted: i=1; AJvYcCXfPPy8FOG8R24Y40vhzy4ghQ7rXJdGs2+qIf34k5yV85oiAlQFixYJPHPRYVXi3wLaU6tr2qVkCPQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw36ZUhhIbNuAwHjYKDTdMp8M3/FNXJpZQ0nWTpeZcxH1VxD3xu
	tjbGQMSR5gULQpTTC0m8jBBFKmzHPLkT9nKRHpRGFVx7OzujjKcQ0vx3IDts3+ZfcQ==
X-Gm-Gg: ASbGncu9JdwjvkcSiJ3yVA+asSKUv4tbXlIn7FNIcgH1H+rJPB49q54C7N7rZXtGeNa
	Rc2GYFsRUmf60MpgX99/xqKTOqZoeVUoahgPBlJMijBqa6+oaXvRDOjX0+XScwZ4oGvcl2H+U/X
	2j5AwyvErtzXFkvKUg35Vd01ID8VIMSWKF798km/CyB2lyxpVt13pBLLWrnRS3R+nt3IpjXkflK
	6E6i2x89zkql1FF/JjJkLRtnvbERmCJ3ReUEhLC0nCyVurHf3R9MHh4aKfB3D/sK0zgLaHoRGBo
	iYup8Yn4I2u4Yi41i0pMgreNmQe79UvYQ+IZB3aX4VaDGmf5scLkGpY5EQes79tn+i/lqz3da6j
	SCq43r7YlKHcBm9dwuoICZ7MQfRO3IgVciGsjDGb1S1Wpg6Sykzd38XQWQt07hZJkL51tVJ1BJ8
	YB4o8dWThiRQkgudnLZg0OB/dLVGWer8JcwkGfIqGWUm4JMJHfneJFlqhH532EMc+oq7I933w=
X-Google-Smtp-Source: AGHT+IGX6WtL9XA3A/MrrbWjQ63udRkuMIsz5ecHfafRhzgl/X29pBZCOTjs4xvrP3REnTKDFdL6xQ==
X-Received: by 2002:a05:600c:4743:b0:471:ff3:a877 with SMTP id 5b1f17b1804b1-47117907a30mr104631645e9.20.1761035684516;
        Tue, 21 Oct 2025 01:34:44 -0700 (PDT)
Message-ID: <4934f4b2-f931-430e-b9a7-e8de38bd3f8d@suse.com>
Date: Tue, 21 Oct 2025 10:34:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] x86/ucode: Refine TLB flush fix for AMD Fam17h CPUs
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20251020131955.2928261-1-andrew.cooper3@citrix.com>
 <20251020131955.2928261-4-andrew.cooper3@citrix.com>
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
In-Reply-To: <20251020131955.2928261-4-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20.10.2025 15:19, Andrew Cooper wrote:
> In the time since Xen discovered this, Linux stubled on it too and AMD
> produced a narrower fix, limited to Fam17h CPUs only.  To my knowledge,
> there's no erratum or other public statement from AMD on the matter.
> 
> Adjust Xen to match the narrower fix.
> 
> Link: https://lore.kernel.org/lkml/ZyulbYuvrkshfsd2@antipodes/T/#u
> Fixes: f19a199281a2 ("x86/AMD: flush TLB after ucode update")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> 
> There is a difference in memory clobber with the invlpg() wrapper.
> apply_microcode() specifically does not want a memory clobber, whereas
> flush_area_local() doesn't need it as far as I can tell (there's nothing
> unsafe to move across this instruction).

The memory access(es) it would not want moving across would be page table
writes. With link-time optimization, wouldn't it in principle be possible
for flush_area_local() to be inlined, and the invlpg() then be moved?
Potentially ahead of a PTE write, seeing that read_cr4() is merely a
simple memory only, and hence the compiler could utilize knowledge it has
to short-circuit that as well?

For the ucode case things can't move unduly due to both rdmsrl() and
invlpg() using "asm volatile()".

With the clobber re-added
Acked-by: Jan Beulich <jbeulich@suse.com>

Otherwise I need to be further educated as to why omitting the clobber is
safe in all (present and future) cases.

Jan

