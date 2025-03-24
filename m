Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88781A6DD26
	for <lists+xen-devel@lfdr.de>; Mon, 24 Mar 2025 15:36:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.925705.1328571 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twiuW-0007RO-7h; Mon, 24 Mar 2025 14:36:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 925705.1328571; Mon, 24 Mar 2025 14:36:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twiuW-0007PK-57; Mon, 24 Mar 2025 14:36:16 +0000
Received: by outflank-mailman (input) for mailman id 925705;
 Mon, 24 Mar 2025 14:36:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sMR0=WL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1twiuV-0007PE-AX
 for xen-devel@lists.xenproject.org; Mon, 24 Mar 2025 14:36:15 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 55a9b06a-08bd-11f0-9ffa-bf95429c2676;
 Mon, 24 Mar 2025 15:36:12 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3912e96c8e8so2537818f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 24 Mar 2025 07:36:12 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3997f9b4cd3sm11396671f8f.57.2025.03.24.07.36.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Mar 2025 07:36:11 -0700 (PDT)
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
X-Inumbo-ID: 55a9b06a-08bd-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742826972; x=1743431772; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Nz74gVzvTOCcAdzsbe/SGJnolqFg0Dw/X4ex18Ugpi0=;
        b=ccTD5mMIr4ooWIYk38A0JGlLfpewW0oy9H+hlY7hEHlxBt7Xq2dWts6RjKwVnlpZLb
         OHMCIIYpR1V+QAy3tvrdFXxdmjiR5Ps9SYZoqsKI67IKsiU9pXVXVTJ+vVgzQTJkjXlf
         sS16N37o32ISnEy7l1U/4RzUGP+TIhIgsT2I2n/iJt9c6nquy+N/1yn2mayEZxaARJDd
         r0fevDhs68JWyqm455vz2uS6ddO3cfo7XT1dFB0GuviImia8Kqnr9ZlCIRTtIvTYgmXw
         0xlMz7bZMuTxkjQFCokfOclt88BGfzosViqaHMlpW2PmKy4m5qLllvi3cQuyRj7WVebn
         i2bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742826972; x=1743431772;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nz74gVzvTOCcAdzsbe/SGJnolqFg0Dw/X4ex18Ugpi0=;
        b=IYwRFFdg8LvhYfsSSZ4VBKUQnRnjDpxX9UJC4dkCyf2iXxFdwUoWLZAxAVH4rKo8jv
         pwdfbcAImhFNKu94OoCgsO7FCxs3U9FuJjOJnlozPghcBxREi/ANGrLQoaXptceTC0qJ
         TQmZDuqQU3hEqqFI6HQo/I+OvD5HPYxYX1n6b7IyS5WJwC2NKQNrs3mjsG2uZ5pKEB/3
         W72jj1gRV/yd/OQmfnPLIeJ23LDzYjXO2k5L87ivITRggMmTnSrR6RxyMgNcuVdii64g
         SL1OReyVWQpxm+u2INA2aXVBd2pWO+VBvASV34vGYOTQssS6F8MKHRAWSr2cxa27JcJX
         LZjQ==
X-Forwarded-Encrypted: i=1; AJvYcCXm4vES8x0wlTi4uOuyZaLwUzv93ORoKNY6FFdXtWvvOvjpm7MuAWApsyvtcLlSvyE0qOa3GJ8SA0o=@lists.xenproject.org
X-Gm-Message-State: AOJu0YynvsH+IfQoW59dkZeJ8PfHRDRK89TbjIpDsjghBlqFtBWC98VX
	O5MUZ3eyN1keH+ZMtlZz+LkZsDovbs/5JTHns3wvuADvYE5IP3n+PHb7kTe1JQ==
X-Gm-Gg: ASbGncv98TKb4mcRFd9oCOb7QUXu5vGnZ/wrhlwpG2bJp/S6JEPuPmQn6L3hIQQXKUz
	tv2H2CWo68FkmyNYg83H4fEQVhuND/0kmYFoWRXAdnSnCrUHZ+2RmwLJHvQfbXyuo69K3EW/sEx
	BxvYg6yD7aa1DUO7Dt9LS+u0C1CrB0LvN/+bEVgta2Gx1DMh9wYhDEgigLPK4ccuNhOzYpC0Zd5
	v3yVmoBf5P5dQZjI9IQc6xJlLkH6X7LTCUIduI6eYQf7K5FmcwVPPZ2I9r0OdvbJiZBxCL4M/My
	Zr8ysQiJ2OqwDqHSCFeVzoitCtu36e0qmf/52wQKYEulYVcq/VsLiaelq7Tyf5mODAflD7vjKSi
	LuXKsWYfZB2Tp0CjHh9LEozx+/cPQPw4Ilzp3cT+L
X-Google-Smtp-Source: AGHT+IGdtuyUMvTXqJOlt3obm45fwXBskhoc+3H5veHjfSrDmYQwn+qkTJjkccvZ71FS0/oOa+Strg==
X-Received: by 2002:a5d:64a2:0:b0:391:31f2:b998 with SMTP id ffacd0b85a97d-3997f8eeb6amr9690516f8f.6.1742826972096;
        Mon, 24 Mar 2025 07:36:12 -0700 (PDT)
Message-ID: <42511843-c6e0-40ae-894a-cad4a73c002c@suse.com>
Date: Mon, 24 Mar 2025 15:36:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 1/7] xen/arm: add generic SCI subsystem
To: Grygorii Strashko <grygorii_strashko@epam.com>,
 Grygorii Strashko <gragst.linux@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Orzel <michal.orzel@amd.com>, Roger Pau Monne <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Oleksii Moisieiev <oleksii_moisieiev@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Juergen Gross
 <jgross@suse.com>, xen-devel@lists.xenproject.org
References: <20250311111618.1850927-1-grygorii_strashko@epam.com>
 <20250311111618.1850927-2-grygorii_strashko@epam.com>
 <6a0a3b3d-9bbd-49da-a37c-eb1cbad94cc1@suse.com>
 <53758670-ca39-4df2-93be-5dc417231f1d@epam.com>
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
In-Reply-To: <53758670-ca39-4df2-93be-5dc417231f1d@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.03.2025 15:25, Grygorii Strashko wrote:
> On 11.03.25 13:43, Jan Beulich wrote:> On 11.03.2025 12:16, Grygorii Strashko wrote:
>>> @@ -851,6 +852,18 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
>>>       case XEN_DOMCTL_deassign_device:
>>>       case XEN_DOMCTL_get_device_group:
>>>           ret = iommu_do_domctl(op, d, u_domctl);
>>> +
>>> +        if ( ret >= 0 || (ret == -EOPNOTSUPP) || (ret == -ENODEV) )
>>> +        {
>>> +            /*
>>> +             * TODO: RFC
>>> +             * This change will allow to pass DT nodes/devices to
>>> +             * XEN_DOMCTL_assign_device OP using xl.cfg:"dtdev" property even
>>> +             * if those DT nodes/devices even are not behind IOMMU (or IOMMU
>>> +             * is disabled) without failure.
>>> +             */
>>> +            ret = sci_do_domctl(op, d, u_domctl);
>>> +        }
>>>           break;
>>
>> Despite the comment I fear I don't understand what you're trying to do here.
> 
> It enables in toolstack "Device specific access control" function, which is implemented in SCI FW.
> SCI FW has privileged management interface assigned to Xen,
> and non-privileged interfaces assigned to guest (VM) and identified by agent_id.
> 
> SCI FW manages access to HW resources clocks, resets, etc, which considered shared and
> which can't be accessed from multiple domains due to HW limitations.
> SCI FW can also manage safety specific resources like HW firewalls for example.
> 
> Each device identified by device_id and can have HW resources assigned to it
> device_id_res = {clk_1, clk_2, reset_1, pd_1 } - FW implementation specific.
> 
> Device can be assigned:
> 1) to any VM, but only to one - dynamic configuration;
> 2) only one, specific VM identified by agent_id - static configuration.
> The policy is FW implementation specific.
> 
> Here and below the case (1) is considered, while in the case (2) - nothing need to be done.
> To enable VMx access to device_id (and its resources) the special request need
> to be sent to the FW management interface to get device_id accessible from VMx.
> 
> In case of SCMI, ARM System Control and Management Interface (SCMI)
> specification (DEN0056E) - functionality defined in sections
> 4.2.1.1 Device specific access control
> 4.2.2.11 BASE_SET_DEVICE_PERMISSIONS
> 
> The HW configuration described in device tree, like in the below example
> (abstract, not related to any specific FW, but principle is generic)
> 
> Host DT:
> /sci_fw {
> 	#access-controller-cells = <1>;
> 	#reset-cells = <1>;
> 	#clock-cells = <1>;
> 	#power-domain-cells = <1>;
> }
> 
> /soc/deviceA {
> 	clocks = <&sci_fw 1>, <&sci_fw 2>;
> 	power-domains = <&sci_fw 1>;
> 	resets = <&sci_fw 1>;
> 	access-controllers = <&sci_fw 0>;
> }
> 
> To trigger SCI FW it required to pass Host DT device path "/soc/deviceA" down
> to the corresponding SCI FW driver during domain creation by toolstack.
> And it has to be done as for devices behind IOMMU, as for devices
> not protected by IOMMU.
> 
> To achieve above xl.cfg:"dtdev" property was selected to be used due to:
> - xen doc says
> "
> Specifies the host device tree nodes to pass through to this guest.
> Each DTDEV_PATH is an absolute path in the device tree.
> "
> - toolstack triggers XEN_DOMCTL_assign_device(XEN_DOMCTL_DEV_DT) hypercall
> nothing from above says it's strictly limited to IOMMU-protected devices only.
> 
> But now ARM XEN_DOMCTL_assign_device actually limited to IOMMU-protected devices
> and will return to toolstack:
> -EOPNOTSUPP if iommu is not enabled
> -EINVAL if DT device is not IOMMU-protected
> 
> in both cases toolstack will fail.
> 
> Idea behind this change (and change in iommu_do_dt_domctl()) is to enable
> XEN_DOMCTL_assign_device(XEN_DOMCTL_DEV_DT) and so xl.cfg:"dtdev"
> for DT devices which
> - IOMMU-protected only (has "iommus" property)
> - require device access control (has "access-controllers" property)
> - both

Thanks for all the details, but I feel overwhelmed. I'd like to see this clarified
in more basic terms. For example the comment says "This change will allow ...".
What's "this change" here? Together with "TODO: RFC" it feels a little as if the
code comment was really meant to live elsewhere (patch description? post-commit-
message area of the submission?), and thus offering little value to an observer
like me. Yet as this is common code, I'd like to have at least a rough, high
level understanding of what's going on here. This doesn't need to go into any Arm
details that I may not fully understand / appreciate anyway.

Jan

