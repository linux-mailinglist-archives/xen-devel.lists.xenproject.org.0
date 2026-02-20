Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OFc2CKM1mGn/CgMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 20 Feb 2026 11:21:23 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80D83166CA8
	for <lists+xen-devel@lfdr.de>; Fri, 20 Feb 2026 11:21:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1236993.1539467 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vtNd3-0001Ld-UN; Fri, 20 Feb 2026 10:20:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1236993.1539467; Fri, 20 Feb 2026 10:20:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vtNd3-0001Je-Rm; Fri, 20 Feb 2026 10:20:57 +0000
Received: by outflank-mailman (input) for mailman id 1236993;
 Fri, 20 Feb 2026 10:20:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S1uT=AY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vtNd2-0001JW-KC
 for xen-devel@lists.xenproject.org; Fri, 20 Feb 2026 10:20:56 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d68e6bed-0e45-11f1-9ccf-f158ae23cfc8;
 Fri, 20 Feb 2026 11:20:54 +0100 (CET)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-4359108fd24so1164870f8f.2
 for <xen-devel@lists.xenproject.org>; Fri, 20 Feb 2026 02:20:54 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43796a74704sm58880944f8f.16.2026.02.20.02.20.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Feb 2026 02:20:53 -0800 (PST)
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
X-Inumbo-ID: d68e6bed-0e45-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1771582853; x=1772187653; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=McoxHz2HBEyEzNFLtGp4vY7tQE4z4XUs6CTdw6m7ejo=;
        b=F0l+QgBZEXKRyiPpejyBVUD6PEF4XnHh2qLIrNg6EXKKcVpdi6ng73zeTDIbh0XeqQ
         YCmegUYgyxZwAMphaC50bUN1TvydpO6JeR/6cvNKPco6wmHVCY93RXVX3PNOLo74vTvI
         Mq+2rvl5QTNdTzLdFM6VW4NGw2qVhGSuZHLc/6Zf6C8ykXoscxK6B6nr1MsruRV/bv4m
         HC/0+BjaP7UQF08uv2hSoH1phazg22CttzuFhhtlLk7jGhUrZHuNEPFPCHuSNSpcar/z
         sMZBSBN5pEEq4fnk+h4H6vQ9JkLbKaAAKmSbwpo/VmQ/PQidCncUUKAo3PLv84MFoZ9q
         9tgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771582853; x=1772187653;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=McoxHz2HBEyEzNFLtGp4vY7tQE4z4XUs6CTdw6m7ejo=;
        b=Bz2i2kV9sb80KXiQRqAX37CTnxiufXdtnT+ZFIhDui9nxO3qIrQCcvUaVYYhmTInuF
         vELV32Yqk6UBSzSF5W1rpXPMAhAOBb9y4q62NXML4U4bP18yPQTGjXDkxdSc79FezzZn
         rIQKzZAjZZBAOVckmzPpJkswzP4KhhkBaWtUIPjLDPUjdfyHtQkM2VqI/dydjNagFlfz
         hLfECCQApTA6hijjG8fhMLq+M0EAXUilJS4AsER+V8hH8qcQncBqvU0SQTGJy+Dioboh
         tsJGsB3h12+R0+mOjdBh1ynVnKUnlwDCjWMvre/+EHUu9Wz/GZaHDl1YubVN7Q33KPZk
         OPyA==
X-Gm-Message-State: AOJu0YxYraacFOWv6nUUwwuB3QjETowEohYZTd5YHZnIoOyb1KRc2dys
	BfWsBfJrcEw7tp4LWoKu6fcujc+InoxhWo2s0xXeZ0v0gtRz7sARdE0K+fRUW8kVDQ==
X-Gm-Gg: AZuq6aJNRAvcHBjoQsFjBZ/7zHbXZ+byeXDtF8POfq4n6OeZqSx6KLRNMNayEsU/OR3
	YefT46YiBT/L04ghO+MSQGERvGRSomNTh4UEtlEag+sSZvPikDnRV6GzTTNp5lPSsNzLPmithCQ
	5TAEGNLuOjl7WA/7M4f7Sf8xQ/WWDl+PYzbwPpzcXmk6tap5eOaHkv0Ki+M9fbQDimMf0LYtRIj
	ZwlCA7HPFftDyTOaT2/7TVB+ExYT9EPimrgzTzbUrWvrgavpERyG9UQl68cl/5pphZvvmyJs04L
	2kjfQ+R8q6rxf3D5WIXddZp9aaKTTkkYL2pVFe4SK3wEPDWYrErlI1IVHh7a48rVbtBTtWHYWCN
	uDjdlZVmPtrBkvxKcXFgtEpQa1S9Y3dxLjt3DBVKBjCFdWoKh47qiukGrzZ90xqa7ASGaCpTuhR
	WTztyJ7KaiK2+5nwVd4txe9+f8cFGwkGl2kztj7h50lyyUWAEJeJr44cZramw5I8a8QO0iW3ShN
	3O/nllx92LFSCDROyMUUv252w==
X-Received: by 2002:a05:6000:24c9:b0:3ec:db87:e5f4 with SMTP id ffacd0b85a97d-4395fd2afebmr8225349f8f.7.1771582853464;
        Fri, 20 Feb 2026 02:20:53 -0800 (PST)
Message-ID: <b82a2dee-aa37-4b05-b368-60af8c54edf2@suse.com>
Date: Fri, 20 Feb 2026 11:20:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/5] vPCI: re-init extended-capabilities when MMCFG
 availability changed
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Stewart Hildebrand <stewart.hildebrand@amd.com>
References: <25c65557-c97c-499c-a698-571e40cde563@suse.com>
 <67b1f190-a7a8-4cf2-89ca-7186204f0b56@suse.com>
 <aZgpRAXefanISluT@macbook.local>
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
In-Reply-To: <aZgpRAXefanISluT@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:stewart.hildebrand@amd.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:mid,suse.com:dkim,suse.com:email];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 80D83166CA8
X-Rspamd-Action: no action

On 20.02.2026 10:28, Roger Pau Monné wrote:
> On Tue, Feb 10, 2026 at 11:55:34AM +0100, Jan Beulich wrote:
>> When Dom0 informs us about MMCFG usability, this may change whether
>> extended capabilities are available (accessible) for devices. Zap what
>> might be on record, and re-initialize things.
>>
>> No synchronization is added for the case where devices may already be in
>> use. That'll need sorting when (a) DomU support was added and (b) DomU-s
>> may run already while Dom0 / hwdom still boots (dom0less, Hyperlaunch).
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> vpci_reinit_ext_capabilities()'es return value isn't checked, as it
>> doesn't feel quite right to fail the hypercall because of this. At the
>> same time it also doesn't feel quite right to have the function return
>> "void". Thoughts?
> 
> For the non hardwware domain case we could deassign the device from
> the domain?

Will need to check. De-assigning is generally done only from domctl context,
I think. I'm also uncertain what other things may break (in Xen or the
toolstacks) if we take away a device in such a pretty much uncontrolled way.

> And print a warning message for both cases.

Can do, albeit I'm unsure what "both" refers to - I see only ...

>> --- a/xen/arch/x86/physdev.c
>> +++ b/xen/arch/x86/physdev.c
>> @@ -8,6 +8,8 @@
>>  #include <xen/guest_access.h>
>>  #include <xen/iocap.h>
>>  #include <xen/serial.h>
>> +#include <xen/vpci.h>
>> +
>>  #include <asm/current.h>
>>  #include <asm/io_apic.h>
>>  #include <asm/msi.h>
>> @@ -169,7 +171,10 @@ int cf_check physdev_check_pci_extcfg(st
>>  
>>      ASSERT(pdev->seg == info->segment);
>>      if ( pdev->bus >= info->start_bus && pdev->bus <= info->end_bus )
>> +    {
>>          pci_check_extcfg(pdev);
>> +        vpci_reinit_ext_capabilities(pdev);
>> +    }

... this.

>> @@ -376,6 +379,20 @@ void vpci_cleanup_capabilities(struct pc
>>      }
>>  }
>>  
>> +int vpci_reinit_ext_capabilities(struct pci_dev *pdev)
>> +{
>> +    if ( !pdev->vpci )
>> +        return 0;
>> +
>> +    vpci_cleanup_capabilities(pdev, true);
>> +
>> +    if ( vpci_remove_registers(pdev->vpci, PCI_CFG_SPACE_SIZE,
>> +                               PCI_CFG_SPACE_EXP_SIZE - PCI_CFG_SPACE_SIZE) )
>> +        ASSERT_UNREACHABLE();
>> +
>> +    return vpci_init_capabilities(pdev, true);
> 
> I wonder here, in the context here, where the device is already
> assigned to a domain you likely need to take the vPCI lock to safely
> perform (parts of?) the cleanup and reinit.  Otherwise you could free
> capability data while it's being accessed by the handlers.

The lock isn't recursive, so I fear we'd deadlock if it was taken here.
Furthermore this falls into "DomU support needs dealing with"; right
now we assume Dom0 tells us about its final MCFG verdict ahead of
putting devices in use. Once we need to consider devices already in
use, I think we would further need to pause the owning domain. Also ...

> The only current extended capability (reBAR) doesn't have any internal
> state to free on cleanup, so it's all safe.  But a cleanup like the
> MSI(-X) ones would be racy, as they free the structure without holding
> the vPCI lock.  I think we need to be careful, and possibly adjust the
> cleanup functions so they can tolerate cleanup with possible
> concurrent accesses.

... to cover such. (For something like MSI(-X) it might then further be
necessary to mask/disable interrupts, but hopefully we'll never have to
deal with extended capabilities that would require this.)

Jan

