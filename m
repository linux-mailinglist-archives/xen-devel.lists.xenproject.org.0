Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03ECAA21AE4
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jan 2025 11:19:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.879060.1289284 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1td5Aa-0007fz-Iw; Wed, 29 Jan 2025 10:19:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 879060.1289284; Wed, 29 Jan 2025 10:19:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1td5Aa-0007eB-GA; Wed, 29 Jan 2025 10:19:40 +0000
Received: by outflank-mailman (input) for mailman id 879060;
 Wed, 29 Jan 2025 10:19:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1peA=UV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1td5AY-0007dl-CD
 for xen-devel@lists.xenproject.org; Wed, 29 Jan 2025 10:19:38 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8af72121-de2a-11ef-a0e6-8be0dac302b0;
 Wed, 29 Jan 2025 11:19:37 +0100 (CET)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-aaeec07b705so1266044066b.2
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jan 2025 02:19:37 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab6d5a96facsm54436366b.31.2025.01.29.02.19.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Jan 2025 02:19:36 -0800 (PST)
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
X-Inumbo-ID: 8af72121-de2a-11ef-a0e6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738145977; x=1738750777; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=QMJU9QiZfM5FbBD6tvghID4dwSX6anz6xsYv85IsPME=;
        b=DbFu169wX+a3R8hG9DvUtEZCeBR3O2Md64MqDb1DFeUvqrw7udMMUgr7OBVSIEv1IY
         F0GrVY3EMBxYGy+hOOfJyZvTTGNS11huFK7PJ+j+cZIWkTG5D3RRf4NB6XIPGrny8MV3
         1zFrwNXYZ0QzNWCCG4riEYS6HjR2+gZHSfIw2uZrng+egckMKN73kORv+VlI2za3Gcev
         n3k5sejEPXKqO62rhAmS7Zy3sn15WRvzcxobuEFepqduNPqMx+1jI0N7+owk1XjEyo+B
         wQgsnvzuPUYuftjMmJQzo32DtELWyG2v5bOhiDM8u5byv7LRazcVuP4UE+tsGlnCz0yE
         BzmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738145977; x=1738750777;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QMJU9QiZfM5FbBD6tvghID4dwSX6anz6xsYv85IsPME=;
        b=Z+puGKOLwRBsw+Wap8tXOW6cVTgc25vuZdr08v25SjhTmGLEx8brcuTprJnv2ZOGWJ
         VwINGWhVSUXByRj/whZlJBLdv4PotDY5mq+rRpNc2TkUluprQbiyJLPHLFUUQOzn091n
         NE1TfAB4c94p1w4aU3LgYFYKlvFXbrCNAz2DN/hWsDy4KoBohR0kJ+vOpaDycpugDsXZ
         tUaCPaQGscDSrbzceSFZX79Vn5OmUUAbiUv9BXV5UUROzsIblzfchpHmeFT/NaVwQjqV
         CGemqWx3kwrJqoMUF6RfRi3ZOoSNkDSm3UNv9wjXCZIs0ULh9kWyEMenwc7WDZ3Crb9x
         cQCA==
X-Forwarded-Encrypted: i=1; AJvYcCX955gUZZdLhuxKIAzE2lcRrcS8+LGfms/Vxvvl6dY9MqicKb7ueF9mmEszEgCwsnEFbcQjFrx3aPM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyBepu1JIETAdJ5XokH3VvjQgzNiY9SAtVdDWPE1WHYSznqyp46
	ENVlmOdRcKowvkIYLJNDDAgVuoXo95eCdBGLZZNeVeURKKW/S3bhakqVO/MTSw==
X-Gm-Gg: ASbGncu53YLoqbgKqwifKeFrLSDDk5217Mo76Bpg8wKbMjw1T5FC5J/s72HMOX+4yEL
	8TNCnWHZvcn5oCR/q787sKn9+ucgIt+ZTmD8ZVWEyHS4rTztkX6TY7gOlk0vFLtGrBQlz2xrqRA
	ODFLf5p8Uj1DddYMIgz2mPO/fE9U76vZOF5jHVAqV58VGuBwNxbvYSFmnfj8dpy84EyyZ9M4LjB
	SJ7orlc/iq45tt51pG0+MuPDZ/2ixM+X4AsncUeNab1E/A0IY0dActJoKGrjdGBcpPtUzpCeAlb
	I9VYmIvLHxcFYC4qqCszc+rON8ZJWhMFMDlZ6W8r8LPkwTVbHUUGCwqB0Mfq2Gngcu1eat7oLac
	Q
X-Google-Smtp-Source: AGHT+IEtkMQC2Crq+mFhZr8KGiTe9KDD74F9/bFoihkOqF9ZOuA01HzLdnpI3rsxpUSNG476UhfkDg==
X-Received: by 2002:a17:907:9482:b0:aae:83c6:c67e with SMTP id a640c23a62f3a-ab6cfe12fdbmr245531466b.55.1738145976868;
        Wed, 29 Jan 2025 02:19:36 -0800 (PST)
Message-ID: <db0bf01f-9162-40e1-9baa-8519e53a46d3@suse.com>
Date: Wed, 29 Jan 2025 11:19:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.20 1/2] x86/shutdown: quiesce devices ahead of AP
 shutdown
From: Jan Beulich <jbeulich@suse.com>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250128162742.90431-1-roger.pau@citrix.com>
 <20250128162742.90431-2-roger.pau@citrix.com>
 <9673c95f-7ee6-461c-8678-46aeab55735a@suse.com>
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
In-Reply-To: <9673c95f-7ee6-461c-8678-46aeab55735a@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29.01.2025 11:13, Jan Beulich wrote:
> On 28.01.2025 17:27, Roger Pau Monne wrote:
>> The current shutdown logic in smp_send_stop() will first disable the APs,
>> and then attempt to disable (some) of the interrupt sources.
>>
>> There are two issues with this approach; the first one being that MSI
>> interrupt sources are not disabled, the second one is the APs are stopped
>> before interrupts are disabled.  On AMD systems this can lead to the
>> triggering of local APIC errors:
>>
>> APIC error on CPU0: 00(08), Receive accept error
>>
>> Such error message can be printed in a loop, thus blocking the system from
>> rebooting.  I assume this loop is created by the error being triggered by
>> the console interrupt, which is further triggered by the ESR reporting
>> write to the console.
>>
>> Intel SDM states:
>>
>> "Receive Accept Error.
>>
>> Set when the local APIC detects that the message it received was not
>> accepted by any APIC on the APIC bus, including itself. Used only on P6
>> family and Pentium processors."
>>
>> So the error shouldn't trigger on any Intel CPU supported by Xen.
>>
>> However AMD doesn't make such claims, and indeed the error is broadcasted
>> to all local APIC when for example an interrupt targets a CPU that's
>> offline.
>>
>> To prevent the error from triggering, move the masking of IO-APIC pins
>> ahead of stopping the APs.  Also introduce a new function that disables
>> MSI and MSI-X on all PCI devices.  Remove the call to fixup_irqs() since
>> there's no point in attempting to move interrupts: all sources will be
>> either masked or disabled.
>>
>> For the NMI crash path also call the newly introduced function, with the
>> hope that disabling MSI and MSI-X will make it easier for the (possible)
>> crash kernel to boot, as it could otherwise receive the same "Receive
>> accept error" upon re-enabling interrupts.
>>
>> Note that this will have the side-effect of preventing further IOMMU
>> interrupts from being delivered, that's expected and at that point in the
>> shutdown process no further interaction with the IOMMU should be relevant.
> 
> This is at most for AMD only. Shouldn't we similarly disable VT-d's
> interrupt(s)? (It's only one right now, as we still don't use the QI
> completion one.) Even for AMD I'm uncertain: It has separate
> hw_irq_controller instances, and its set_iommu_interrupt_handler() is
> custom as well. Will pci_disable_msi_all() really affect it? (Hmm,
> yes, from amd_iommu_msi_enable() it looks like it will.)

Oh, no - not for the x2APIC case. There it's solely iommu->ctrl.int_cap_xt_en
which controls whether the interrupt is enabled, iirc. Btw, one of the two
calls from enable_iommu() to amd_iommu_msi_enable() is actually wrong (commit
d9e49d1afe2e should have moved it instead of adding another call); I'll make
a patch for that.

Jan

