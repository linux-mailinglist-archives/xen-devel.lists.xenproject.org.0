Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DBA6AE95D6
	for <lists+xen-devel@lfdr.de>; Thu, 26 Jun 2025 08:11:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1025882.1401123 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUfoq-0007PD-Uo; Thu, 26 Jun 2025 06:10:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1025882.1401123; Thu, 26 Jun 2025 06:10:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUfoq-0007Ma-Rc; Thu, 26 Jun 2025 06:10:44 +0000
Received: by outflank-mailman (input) for mailman id 1025882;
 Thu, 26 Jun 2025 06:10:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=o/Pp=ZJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uUfop-0007Kc-9h
 for xen-devel@lists.xenproject.org; Thu, 26 Jun 2025 06:10:43 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 424f317f-5254-11f0-b894-0df219b8e170;
 Thu, 26 Jun 2025 08:10:29 +0200 (CEST)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3a6d1369d4eso270922f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 25 Jun 2025 23:10:29 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-237d86f701csm148107875ad.217.2025.06.25.23.10.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Jun 2025 23:10:27 -0700 (PDT)
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
X-Inumbo-ID: 424f317f-5254-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750918228; x=1751523028; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=khMk2IX4IhlJytG0pFhEMNyHmUbj0HrxsnGjlRpXUYw=;
        b=W/tdwvXQP2vw0zQLFsMhBKiSpdr4SVFGRDSzGzkwxQGvW+uQ5YDDNHyai12pw/+mvX
         xsq4TS/z1w3oYY8gjDjqrnB0eahOxoZIDJwKiC4cNCZgQss02Ej0d/gHz1GcmE1fHFNC
         9NkkVkdIWqk1eIEWXrx24TgjJrfEVDeiY9MvMkXsMuyK1nycGfTDzBp3cgsnhGVUYlJC
         2ByInRZ5r9ugQVY+sQ5D4+re6VM1KZchxpgQIX1SEtcZZ6hjIrPnHaGOQcGLWrLPrjBU
         HBedUaglaM+bE/mpkxupO0AWUQIYaB26Dj3L+cekZafJoHGufFJ8fkVXRSOW6C0+w4Bi
         YWEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750918229; x=1751523029;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=khMk2IX4IhlJytG0pFhEMNyHmUbj0HrxsnGjlRpXUYw=;
        b=ufzaGZgp1T11mp2TttfuW4ogZCfWpxQpjbNH2N/L5BQ3u8ggoNaWasmrO8KzPLnwAb
         4JjnHzItPburjy6s+V0sArpCtWC/kAmpHzJYGPXFqrfOL6ZoytWFy+QE5ufaMG0ArziY
         QIc9f5hpeVy3IqHbSrPXRk5GaSMVeWC9v1RG9SQ04XiMkbHJVJysrjr8v2Fl4JccHekt
         KfAgLjv5u07CwXlfGDvls4tVufUzx5URXu6cs8iLwQsQMxVJDrbBl6O3JiHYl/mAbbZF
         UjNg0exjfTolVYxjQOq0Iz0H0fvBbUDNl+gJocDtjT3yC9btp8CD4dfH4dceIHbpQY1/
         Qp9Q==
X-Gm-Message-State: AOJu0YytAQa4HNHYkHEUxmtfZ62E3+8dkXShwiQGL2a9WsKTY2BLWlUc
	LDRiP8/Bxo7D6i3SkxqMiwyUEBGoRtokQaJp/GS9hFlltoXb0OpRUQ2iDQVh7iGmuQ==
X-Gm-Gg: ASbGncu0FsMDlxskQQpQ9ybdDr1CLQBEdl/qNPfHyqCrixlf4feRN04oNKnRz/IDEni
	E1w4wzdPUkcxrslKbiZjL9LQR4e5cUjV7Q9ksb74uSocRD63xT4+23/gH6y4wO5334PE42rPAyn
	5VCgEADoG2vsCmyy8jPhPpNaETXdn1s+FRyhR4xrVLhrwrDmjs/+EpxtuZP/9kmy/9ZBDnJcIrQ
	jnVAytPfjLdn6fJw5WpqG94t0blUgphgYQJMdRZxzbeSLAeEIt9IVzJ0p+QdAyO15CbdRVFlrkm
	8qPFc1+eRU82W0KY4r3y91zc6d0w9xVt70l+ImF8AUY89+e8gfcx0akdEY23MEVl9LORl6xEzd9
	hosYkgQHbP7oTs3fyfF9GGN7mSWb6oJiUy/Y8F0tRio91x0u3BspEMKBDUw==
X-Google-Smtp-Source: AGHT+IFsvY3XdK0ytlJNEOiyGLOndo9xUdM9aLuh4iEl7bw047+QvDDvRSw4kK+hTdUJqdsPdl3SYQ==
X-Received: by 2002:a05:6000:714:b0:3a5:8cc2:dabc with SMTP id ffacd0b85a97d-3a6f2e871d4mr1901259f8f.5.1750918228554;
        Wed, 25 Jun 2025 23:10:28 -0700 (PDT)
Message-ID: <8bb4e188-eb3b-4ee3-88cc-93c826b04ef8@suse.com>
Date: Thu, 26 Jun 2025 08:10:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v4 5/8] xen/domctl: extend XEN_DOMCTL_assign_device to
 handle not only iommu
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Juergen Gross
 <jgross@suse.com>, Julien Grall <julien@xen.org>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Grygorii Strashko <grygorii_strashko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1747669845.git.oleksii_moisieiev@epam.com>
 <4f58bf9c47c40413ee9250c4cd21458382aac857.1747669845.git.oleksii_moisieiev@epam.com>
 <alpine.DEB.2.22.394.2505211715210.147219@ubuntu-linux-20-04-desktop>
 <f7a82cbe-2967-487f-9947-b56d1dea3e84@epam.com>
 <alpine.DEB.2.22.394.2506171701190.1780597@ubuntu-linux-20-04-desktop>
 <1780646c-cb6f-4508-86c8-a573fbc09f6a@epam.com>
 <1e116116-ddf7-4640-9809-2502203abe46@suse.com>
 <3e190e60-74a4-4565-acae-3b8602a4c46e@epam.com>
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
In-Reply-To: <3e190e60-74a4-4565-acae-3b8602a4c46e@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25.06.2025 21:56, Oleksii Moisieiev wrote:
> 
> On 23/06/2025 10:15, Jan Beulich wrote:
>> On 19.06.2025 18:15, Oleksii Moisieiev wrote:
>>> On 18/06/2025 03:04, Stefano Stabellini wrote:
>>>> On Thu, 12 Jun 2025, Oleksii Moisieiev wrote:
>>>>>>> diff --git a/xen/arch/arm/firmware/sci.c b/xen/arch/arm/firmware/sci.c
>>>>>>> index e1522e10e2..8efd541c4f 100644
>>>>>>> --- a/xen/arch/arm/firmware/sci.c
>>>>>>> +++ b/xen/arch/arm/firmware/sci.c
>>>>>>> @@ -126,6 +126,43 @@ int sci_assign_dt_device(struct domain *d, struct dt_device_node *dev)
>>>>>>>         return 0;
>>>>>>>     }
>>>>>>>     
>>>>>>> +int sci_do_domctl(struct xen_domctl *domctl, struct domain *d,
>>>>>>> +                  XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
>>>>>>> +{
>>>>>>> +    struct dt_device_node *dev;
>>>>>>> +    int ret = 0;
>>>>>>> +
>>>>>>> +    switch ( domctl->cmd )
>>>>>>> +    {
>>>>>>> +    case XEN_DOMCTL_assign_device:
>>>>>>> +        ret = -EOPNOTSUPP;
>>>>>> Are you sure -EOPNOTSUPP is the right error code for the 3 checks below?
>>>>> The -EOPNOTSUPP code is used because this is part of a chained call after
>>>>> iommu_do_domctl, as stated in xen/common/domctl.c:859. The
>>>>> XEN_DOMCTL_assign_device
>>>>> call is expected to handle any DT device, regardless of whether the DT
>>>>> device is
>>>>> protected by an IOMMU or if the IOMMU is disabled.
>>>>> The following cases are considered:
>>>>>
>>>>> 1. IOMMU Protected Device (Success)
>>>>>
>>>>> If the device is protected by the IOMMU and iommu_do_domctl returns 0,
>>>>> we continue
>>>>> processing the DT device by calling sci_do_domctl.
>>>>>
>>>>> 2. IOMMU Disabled (-EOPNOTSUPP from iommu_do_domctl)
>>>>>
>>>>> If iommu_do_domctl returns -EOPNOTSUPP, indicating that the IOMMU is
>>>>> disabled,
>>>>> we still proceed to call sci_do_domctl.
>>>> OK this makes sense.  I think it is OK to have a special error code to
>>>> say "the IOMMU is disabled" but I don't know if it is a good idea to try
>>>> to use -EOPNOTSUPP for that. -EOPNOTSUPP could mean a hypervisor
>>>> configuration with domctl disabled, for instance.
>>>>
>>>> It might be wiser to use a different error code. Maybe ENOENT?
>>>>
>>> I see that in the following commit:
>>>
>>> 71e617a6b8 (use is_iommu_enabled() where appropriate..., 2019-09-17)
>>>
>>> -ENOSYS return code was changed to -EOPNOTSUPP in iommu_do_domctl.
>>>
>>> It's not clear to me why this was done from the commit description.
>> This has been discussed many times elsewhere. Many of our ENOSYS uses are
>> simply wrong. ENOSYS has very limited applicability: Unavailability of a
>> top-level hypercall (originally: syscall).
>>
> What is your opinion about changing it to -ENOENT to say "the IOMMU is 
> disabled" as Stefano suggested in [0]?
> 
> [0]: https://lists.xen.org/archives/html/xen-devel/2025-06/msg01233.html

To me, ENOENT is closer to ENODEV, and hence not overly applicable here.
If you want to avoid EOPNOTSUPP for whatever reason, how about ENXIO or
EIO? (EPERM might also be an option, but we assign that a different
meaning generally.)

Jan

