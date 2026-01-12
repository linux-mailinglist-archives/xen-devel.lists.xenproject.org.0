Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B51A4D13BD8
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jan 2026 16:41:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1200581.1516456 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfK2I-0002mD-Tx; Mon, 12 Jan 2026 15:40:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1200581.1516456; Mon, 12 Jan 2026 15:40:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfK2I-0002jK-RD; Mon, 12 Jan 2026 15:40:54 +0000
Received: by outflank-mailman (input) for mailman id 1200581;
 Mon, 12 Jan 2026 15:40:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Qluw=7R=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vfK2H-0002jE-3t
 for xen-devel@lists.xenproject.org; Mon, 12 Jan 2026 15:40:53 +0000
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [2a00:1450:4864:20::344])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 128992a1-efcd-11f0-9ccf-f158ae23cfc8;
 Mon, 12 Jan 2026 16:40:50 +0100 (CET)
Received: by mail-wm1-x344.google.com with SMTP id
 5b1f17b1804b1-47d493a9b96so37835645e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 12 Jan 2026 07:40:50 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d8719d057sm131736625e9.16.2026.01.12.07.40.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Jan 2026 07:40:49 -0800 (PST)
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
X-Inumbo-ID: 128992a1-efcd-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768232450; x=1768837250; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=i1Zly8kgHSY/soQCzgJnDNON8HOmCRWVbLSbq2T2iyE=;
        b=M9JqPa2KJtIWq+N8BOr0uRK/AShUP5W8ZJ0o/kbAym6bVngtDUAXbf+6GqZ+jkXvyR
         Db5cBUBD1K4h6aPdTbBFthxmN8hB81oTUtMFV8R0sxQ5WZR6iATXj4XmxJSDJnVeXiip
         rluHPnueiS3UjLPIGx9VZJdK3DSr8i7HLvquyYNQgViG6LGbT+6+ktGAslgojVSdPF6/
         gFiUjpCbAnfeq6K8Se3VOrBcWjbbIZgrHz8wM3S1eKvrP/d4DpnGUi/Kqx+MGRoUHYoI
         6c0C70p65sI61HFqpeHoWTBX5J2tHLYg9l/58hTYDSWPh6+JntD3liqCJEOjIn5istSu
         QbXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768232450; x=1768837250;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i1Zly8kgHSY/soQCzgJnDNON8HOmCRWVbLSbq2T2iyE=;
        b=ii6Y4jx60e6JYXSKb1f0sDUUA1erHJ+yr3VMUo3km06dk1HzqTPKDBXUTI1K3eiXJQ
         bl+BogW//qzCmyMznFfwTwH4Or1lAdth238zgYJpxc9m4waVVZJFSe7YLr3VgMYzq7Hr
         yLsuVKpmJVq6VWJ9OlDfpIBhp518+iyPm6wRGxWL9PrBnnS1PBbZsakkfMe3AV7gz8TV
         EGEJvQq7t+ES0uUExdGySeql73EV+wsQTZdIIBUOFZthpvRomehDTaz+jF6f7NgPLGtE
         vmLsnDtIqUgPeKQ1+6E4XwEwf6XGy5cMBZF3lgWFX4T3ANzz0hE2ueDVnLvxpd8qS/YR
         7njw==
X-Forwarded-Encrypted: i=1; AJvYcCV/mfS8L5Hek7/reQdBDqHeewvtDNIhjrG5NS+h6YPjKWogspRdGcQ3EtSSYF4IQSajgnTzXp5HwG8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy6pbLPjTJ9s4wmqFjI6zS7zZ6uAhwEZBZZjpVyqtM+8Wn8QeOh
	3Ug2fXJ7RpSp6T9TO63N26rZhWPKm9/bnhE5LvfNJHOnzx8nBUZMT/iz+TdLsBHf5A==
X-Gm-Gg: AY/fxX5Tetal7YsSGfmPVTkrQ2TDMWmWKCJHuLukLldba9kzYi7uEnMyg2wR2ntXOJF
	qaYqprbHWH8hm+0Zh5PQx2qSRz6UUkxUfEkPYnabKmXwmANhC1qK8wBwwKkW3oTdrRhjMlTT7Ca
	cMAamZLWdHMcIv78ZtMeHqqhW9obvXmmBrEa842GQ2g3dGBxYzO4qaEd4g/CVF2YmeLWizihp39
	y6BWhbYTjsAI4VzMDHKA/tGjrUoxdrT3Ix2rrMyiTemOcE4GQdV+j+OPwdRdNMNy7+aOTlHGISi
	V/3vvmgKzd2P/wYQJLbtvIF0ggpFNstOPxXUS4hkiturdRncTIPVNtp3WLv3MGCOCPbriM1PUB9
	UpDAEibRq987m/XUQRqDWckTVkz3uzGCikA7SWmyMF4bE92J5/21mAHKhEB9Jpi9DRliCXG+5Va
	noROe4psuF1pHirmoeonFg5JySkIgHJhcqFCczkOfFYb9yjXUt3N8TY6IbnDB57UZdTY77kPCZ9
	Vc=
X-Google-Smtp-Source: AGHT+IFSB8c8eJBEPp925v5gMKTjgV+sii12KtyoArjNywIfRXbH1a+hCKoLjanxPsGZs2f/46QVdA==
X-Received: by 2002:a05:600c:8119:b0:477:7ae0:cd6e with SMTP id 5b1f17b1804b1-47d84b0afe1mr185896525e9.5.1768232450208;
        Mon, 12 Jan 2026 07:40:50 -0800 (PST)
Message-ID: <98f5e8f0-070c-4be5-9baf-46278de8093d@suse.com>
Date: Mon, 12 Jan 2026 16:40:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/5] xen/domctl: extend XEN_DOMCTL_assign_device to
 handle not only iommu
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Juergen Gross
 <jgross@suse.com>, Julien Grall <julien@xen.org>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Grygorii Strashko <grygorii_strashko@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1761998077.git.oleksii_moisieiev@epam.com>
 <b0a72660d58608c80e7408eb8df32ec369d4e45b.1761998077.git.oleksii_moisieiev@epam.com>
 <9598b2e2-7df8-40c5-82cb-c097121af763@suse.com>
 <5d8f55a6-7182-4e9d-a139-96fddb9450f8@epam.com>
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
In-Reply-To: <5d8f55a6-7182-4e9d-a139-96fddb9450f8@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12.01.2026 16:16, Oleksii Moisieiev wrote:
> On 06/11/2025 12:09, Jan Beulich wrote:
>> On 01.11.2025 12:56, Oleksii Moisieiev wrote:
>>> @@ -827,7 +828,32 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
>>>       case XEN_DOMCTL_test_assign_device:
>>>       case XEN_DOMCTL_deassign_device:
>>>       case XEN_DOMCTL_get_device_group:
>>> +        int ret1;
>>> +
>>> +        /*
>>> +         * Add chained handling of assigned DT devices to support
>>> +         * access-controller functionality through SCI framework, so
>>> +         * DT device assign request can be passed to FW for processing and
>>> +         * enabling VM access to requested device.
>>> +         * The access-controller DT device processing is chained before IOMMU
>>> +         * processing preserving return code and expected to be executed for
>>> +         * any DT device regardless if DT device is protected by IOMMU or
>>> +         * not (or IOMMU is disabled).
>>> +         */
>>> +        ret1 = sci_do_domctl(op, d, u_domctl);
>> Why would this not be the initializer of the new variable? (I also don't think
>> that we've decided to permit variable declarations at other than the top of
>> scopes or within e.g. a for() loop control construct.)
>>
> +
>>>           ret = iommu_do_domctl(op, d, u_domctl);
>>> +        if ( ret < 0 )
>>> +            return ret;
>> Why would you invoke both in all cases? If sci_do_domctl() handled the request,
>> there isn't any point in also invoking iommu_do_domctl(), is there? Or else is
>> there maybe some crucial aspect missing from the description (or not explicit
>> enough there for a non-SCI person like me)?
>>
>> Also this doesn't look to fit the description saying "The SCI access-controller
>> DT device processing is chained after IOMMU processing ..."
>>
> We call both because SCI and IOMMU cover different concerns and a DT 
> device may need
> both: SCI for FW-mediated access control (power/clocks/reset) and IOMMU 
> for DMA isolation.
> SCI returning success does not mean the IOMMU work is redundant.

Can the comment then please be updated to properly call out this dual
requirement?

> - sci_do_domctl() returns -ENXIO when it has nothing to do (non-DT, no 
> mediator, mediator lacks assign hook).
> That is the “not handled by SCI” sentinel; in that case the code 
> proceeds to IOMMU normally.
> -  When sci_do_domctl() succeeds (0), the device may still require IOMMU 
> programming
> (e.g., DT device has an iommus property). Skipping iommu_do_domctl() 
> would leave DMA isolation unprogrammed.
> 
> The final if (ret1 != -ENXIO) ret = ret1; ensures that if both paths ran 
> and IOMMU succeeded,
> an SCI failure is still reported to the caller.
> 
> Device-tree examples to illustrate the dual roles:
> 1. Access-controlled DT device (not necessarily IOMMU-protected):
> 
> i2c3: i2c@e6508000 {
>      compatible = "renesas,rcar-gen3-i2c";
>      reg = <0 0xe6508000 0 0x40>;
>      power-domains = <&scmi_pd 5>;      // FW-managed power domain
>      clocks = <&scmi_clk 12>;
>      clock-names = "fck";
>      access-controllers = <&scmi_xen 0>;
>      // no iommus property: SCI may need to authorize/power this device; 
> IOMMU has nothing to do
> };
> 
> 2. IOMMU-protected DT device that still may need SCI mediation:
> vpu: video@e6ef0000 {
>      compatible = "renesas,rcar-vpu";
>      reg = <0 0xe6ef0000 0 0x10000>;
>      iommus = <&ipmmu 0 0>;             // needs IOMMU mapping for DMA 
> isolation
>      power-domains = <&scmi_pd 7>;      // FW-managed power/clock/reset
>      clocks = <&scmi_clk 34>;
>      access-controllers = <&scmi_xen 0>;
>      clock-names = "vpu";
> };
>>> --- a/xen/drivers/passthrough/device_tree.c
>>> +++ b/xen/drivers/passthrough/device_tree.c
>>> @@ -379,6 +379,12 @@ int iommu_do_dt_domctl(struct xen_domctl *domctl, struct domain *d,
>>>               break;
>>>           }
>>>   
>>> +        if ( !dt_device_is_protected(dev) )
>>> +        {
>>> +            ret = 0;
>>> +            break;
>>> +        }
>>> +
>>>           ret = iommu_assign_dt_device(d, dev);
>>>   
>>>           if ( ret )
>> How are DT and PCI different in this regard?
> Please find examples above.

Sorry, but I can't spot anything PCI-ish in the examples above. Then again I
also no longer recall why I compared with PCI here. Oh, perhaps because the
PCI side isn't being modified at all.

Jan

