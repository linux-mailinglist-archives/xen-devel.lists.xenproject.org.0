Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FC74B2A295
	for <lists+xen-devel@lfdr.de>; Mon, 18 Aug 2025 14:58:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1086054.1444283 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1unzRk-0006Mf-J3; Mon, 18 Aug 2025 12:58:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1086054.1444283; Mon, 18 Aug 2025 12:58:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1unzRk-0006KJ-GM; Mon, 18 Aug 2025 12:58:44 +0000
Received: by outflank-mailman (input) for mailman id 1086054;
 Mon, 18 Aug 2025 12:58:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=q+DX=26=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1unzRj-0006Jx-6y
 for xen-devel@lists.xenproject.org; Mon, 18 Aug 2025 12:58:43 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0ba67cb3-7c33-11f0-b898-0df219b8e170;
 Mon, 18 Aug 2025 14:58:33 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-afcb7a0550cso602307966b.2
 for <xen-devel@lists.xenproject.org>; Mon, 18 Aug 2025 05:58:33 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afcdd016bbcsm783285366b.95.2025.08.18.05.58.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Aug 2025 05:58:32 -0700 (PDT)
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
X-Inumbo-ID: 0ba67cb3-7c33-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1755521912; x=1756126712; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=e0XplaC2g32be+oaChdk+3rntwx9pprbgt7wh2cWP/w=;
        b=f+Yr17qtF+IGZQPFwne9PvxIdDr89EzcIUOzbf0Q522YVU5K6ghOWmSy5/o6NKODMG
         76SApaIdGgEIjt2VpxZ5h0/DjY1LUcpWCEKjKgJJDQ7OIi9awR9o9XKX0WUW3K/pXhsY
         z1/kkch7iyAJRcSbZA/yy8PYalykAiR5r6l2xOgTp5u1sqiKQXl2/n3/+3NoITOQ3YNu
         Fha4maSa0k+wXzBBQWZzUKpjx5WQbvZLkwkZI6TCkGeo4rz8Ezn+Pzfmkb+5+E3rAcjH
         +moK+pK70O3nqwencYrb90DtK+SCCWkcuywwonBLM/JJ/duKxWJ+PEFlSwwo6Zlvx9Ah
         hsaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755521912; x=1756126712;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e0XplaC2g32be+oaChdk+3rntwx9pprbgt7wh2cWP/w=;
        b=mzhEwubArqBpPaTT7sJ0CsnRDn5Ha/TgyxCm7wyDb8e8m6wRK7fKoKaWJGousNoYEm
         Z7n22deB5sFAFhmiclirrA34MJhKO9texMuwIMI6ZbnV/Mye9hQajynMd5XNKYhQyMlx
         PAMvBkzzj1ovxEdsf0k8oKWkqBAF2oq0Lqx1+fa+Io3+7hh+kEV+btt3lJa4YXxCGrRd
         how3dYk+ZebPhf1S2A5v907iXK/gYt+e0tDS3r6tbW6eyGzxOiKGEnhp1C/8c5QkSitv
         FJtCO6EsEyy801Q89iy0SunuclSUub+TBxaJgpVCNAS1RN7v167OIMVMr+mlp3d4STNW
         aHkQ==
X-Forwarded-Encrypted: i=1; AJvYcCX9vVmJDzgnQpyofh4oSd5T8rCHRLTAvd8J9RgPWryBg2bYhV8mzzhoxZHPk/cjYTN6ipSxrTYwLHw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwWSra11m664BsvIshrp1aPP+cMLDiH6YrXzCAlvvuCziTXvxG6
	V6CKxE1Enh7aP/PXhQE+QBU8Y8XIDEOBfgLdcEwadpd8LJWv49l8dGeyAnJq8hAPSg==
X-Gm-Gg: ASbGnctJrPO+puY0uAojd1s40PMxMn4iPybgRxaJ2OAbCDfdNNQEZDfiBI0yjzXEoSo
	tsLo+WfgMzwVb2Z9JAB3zsFT0n4iyvfLKbbWRzYqiccqx6GdI1+6Vk8Izicq0TmTK2Xp49vVOXq
	to1ps7w53Qe3Y1oZGk9WqDIe16vBQwaPXku3f98kh9uMbZDis6+KA8SFFnTfS++gQ0XUleusNOY
	S1/FFGpVs7p0YIIo1E3kdNDUcBnRwR6g5T9xq8fg5BEvykaPfzSPIBdpfYcvxZBvGHONMd18MgU
	C3u9CN8T2k9P1fQmlaNMdcnB2befQcexL1dTRJiKQZ1Lxq7RqCBEYzFeOKDMsBaY5I0SU/mMjda
	AXZTq4th1GVAeoC2vg3ATU33v8HWcBz9zA43g9pcpFglatx0sBpR4f9Q+rS9u0t1/PyFPnTiC+g
	syH4qG5Euf+MUX1SNS3CxuEBG5fo76
X-Google-Smtp-Source: AGHT+IHUPCCxe2EUBRNwUOkbU3QYY5Hf/mkO2Y7dXo98MaehpeGmvzEU27WgQawWjdJ3gM+8HqV8tw==
X-Received: by 2002:a17:907:7eaa:b0:ae0:da2f:dcf3 with SMTP id a640c23a62f3a-afcdc3f261emr1098033366b.59.1755521912279;
        Mon, 18 Aug 2025 05:58:32 -0700 (PDT)
Message-ID: <db587dea-f5b9-47cd-9f0e-6d0e1bd8569c@suse.com>
Date: Mon, 18 Aug 2025 14:58:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 1/4] xen/arm: Implement PSCI SYSTEM_SUSPEND call for
 guests
To: Mykola Kvach <xakep.amatop@gmail.com>
Cc: Mykola Kvach <mykola_kvach@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1755506449.git.mykola_kvach@epam.com>
 <205b2b354ff1d34d0e9ec4777ca3c94492f6d9d1.1755506449.git.mykola_kvach@epam.com>
 <5bf9b184-70fb-4698-a01e-e8cbcb05935f@suse.com>
 <CAGeoDV-JiD-sdVwGQjYbchD5N57ta8aT4_ZtPb_jNHxe77p5aQ@mail.gmail.com>
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
In-Reply-To: <CAGeoDV-JiD-sdVwGQjYbchD5N57ta8aT4_ZtPb_jNHxe77p5aQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18.08.2025 14:43, Mykola Kvach wrote:
> On Mon, Aug 18, 2025 at 1:15 PM Jan Beulich <jbeulich@suse.com> wrote:
>> On 18.08.2025 10:49, Mykola Kvach wrote:
>>> @@ -1360,13 +1357,33 @@ void domain_resume(struct domain *d)
>>>
>>>      for_each_vcpu ( d, v )
>>>      {
>>> +        /*
>>> +         * No need to conditionally clear _VPF_suspended here:
>>> +         * - This bit is only set on Arm64, and only after a successful suspend.
> 
> Note to self: s/Arm64/Arm/g
> 
>>> +         * - domain_resume_nopause() may also be called from paths other than
>>> +         *   the suspend/resume flow, such as "soft-reset" actions (e.g.,
>>> +         *   on_poweroff), as part of the Xenstore control/shutdown protocol.
>>> +         *   These require guest acknowledgement to complete the operation.
>>> +         * So clearing the bit unconditionally is safe.
>>> +         */
>>> +        clear_bit(_VPF_suspended, &v->pause_flags);
>>
>> Seeing that you set this bit for a single vCPU in a domain only, I wonder why
>> it needs to be a per-vCPU flag.
> 
> That's a good question. In earlier versions of this patch series, both I and
> some other contributors used existed fields from the domain structure, such as
> shutdown_code and is_shutting_down, for this purpose. However, I recall that
> in a previous review, this approach was not well received. See:
> https://lore.kernel.org/all/d24be446-af5a-7881-2db4-b25afac3e1f4@citrix.com/
> 
> Technically, there is nothing preventing me from storing this information in
> the domain structure. However, I do not see much benefit in introducing a new
> field to the domain struct when there is already an existing per-vCPU flags
> field that tracks powerdown and pause states. Using one more bit in the
> pause_flags field seems sufficient and avoids further bloating the domain
> structure.

Hmm, yes, I was mis-remembering something here: I thought that much like we
have pause_count both for vCPU-s and for domains, we'd also have pause_flags
for both. Perhaps indeed okay as is then, as far as where to put the flag
goes.

Jan

