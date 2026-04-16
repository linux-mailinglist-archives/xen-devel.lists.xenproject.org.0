Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2C5EI+LQ4GkkmQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2026 14:06:58 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D432140DD94
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2026 14:06:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1283295.1565571 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDLUH-0002kb-CU; Thu, 16 Apr 2026 12:06:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1283295.1565571; Thu, 16 Apr 2026 12:06:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDLUH-0002iU-9q; Thu, 16 Apr 2026 12:06:25 +0000
Received: by outflank-mailman (input) for mailman id 1283295;
 Thu, 16 Apr 2026 12:06:24 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wDLUG-0002iO-7D
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2026 12:06:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wDLUF-00D5eX-KD
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2026 14:06:23 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e0d0b7-2eae-0a2a0a5409dd-0a2a450684d6-20
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 14:06:23 +0200
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e0d0bf-7371-0a2a45060019-d155802de15b-3
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 14:06:23 +0200
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-488a8ca4aadso94447865e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 05:06:23 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488f5827da4sm46366075e9.14.2026.04.16.05.06.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Apr 2026 05:06:22 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1776341183; x=1776945983; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=OSD3zUFx/ctCBb2wQKW1zDMHEnHeNUWwFMTWS59r6q0=;
        b=dynS7eHF5do3sI6aJzKwq6QcntWJvvk0njuYa3K1LkG4lLT0H4Fc4sIl2juYm0//9S
         vvm7rGneOwJHf7RLpLMQYAm97kLpQSrZFYzxCv5BwWOBP/AI1WYxoiecL3sF9SPcNZAv
         ZMV+3J8awfntnE4rbNgawMOv3E6EvLVIZSgDnzhmQR7os3XzeCjd4vphBsXI/XIjx08Z
         9MXe7TSzIT+zpTwM9hHQXatFCIN9SpEkFB0JluD44bjTcKaQMkfLIEDxqE5eAQaC7luk
         A2q6ih+tWSQx7KtssBZBAO6xq+jBSp8HWTT6xhSxV7u3uRWrT9EWpQKGZQ3B9gWF9whd
         KtzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776341183; x=1776945983;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OSD3zUFx/ctCBb2wQKW1zDMHEnHeNUWwFMTWS59r6q0=;
        b=reKAl7ckN4obSWiIuwHw4GdX9mUvCmmb6wZqailWAH97GqTQPnERBqt/w2mJ33NMbB
         bVo+s/bFSvpoaBPSQK8gzcVhyVXLyJD7vOv7+m8IOTQSFKvQqzmUO/7T9Vd00MRw7oYb
         2bdlDZoEGH7nq3NkMtCT5klDTKRJUZ9Wz6YEJ/mdQn/aH8uUAXfv+jubxLCgmYgNZbhR
         aHrcDIhc/Ik4gDkvCJWm4m6wHnWNVXUoexp+wD1viMxyWLRJ3k0tmeuNN36yuyawbcSb
         crg274f3bH9xZuw4gAwoTbwwptFpu33GG6heQOR6ChFWAlGD7MN94Av6ecx/rq9bao5u
         LQPw==
X-Forwarded-Encrypted: i=1; AFNElJ+YWZ9fO2ySXzITaAdQJkA7Er+gdEinzWvHlqV9LnyggykFoopCiGkfZchEJmShTaLD9JwgfJPXrrY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxbLaXG6rd7Fj6enBo/b0kYeQaiLKWDArrCwYgPa7stVt+BtM2f
	BWvU54avsOE3tJtekAa8zzx5LX7sbGSzOvzFH5RdN7HvqlQ0MCHWnsHJ8aPPjitMBw==
X-Gm-Gg: AeBDieux3rptmq/0pUnfvNYw9/EHknOxcyXfd8fJr29nEGVXJfVNnQsY9FIQtQPmWvK
	p7ubaEljg0TVlrmM3eBsweAG/FjBpjvOSfl7gORXLZD9gsM03D/eXh+EPEc7yEYrYpIphzfkEsM
	d+IYwzv0TnBglbrI9B+kSxXdrSzl5P+kSm0xxOCmZgSg02A2Ipu52bbj2dsXFHWv4wDKxUKZHUs
	hUljlwZdVxxSdRN/1+8DUqFLKMAQGb1pUM4lM+fm/7Aob/OCQYM2xch9ipxhxClZyQ+kIKwAMb0
	E9+z46YyThLVv4d5ZmD4jvGKFl2Qn/F6oyvSriKSlUKblAEppW2tc43dm8SaSVR3DiWaGPERpI2
	dGlhzolePTKEtXla2adM1lQCyEuypkeDE07LJxekBuXjbqkkvefnQgOURTgFVGQadPtTrXONroX
	e7HIBGsmfVMG2fkPjLuJGoZRtXYl8F9l7xpiO8fk1r91k15wUPFa2WMWontkXW2HzYUw9AJt3in
	004v817atXAGxn4Q7Q9sCaaTw==
X-Received: by 2002:a05:600c:4504:b0:485:3b9e:caa7 with SMTP id 5b1f17b1804b1-488d6864f6dmr354751795e9.23.1776341182858;
        Thu, 16 Apr 2026 05:06:22 -0700 (PDT)
Message-ID: <5c47f23b-6f51-41e1-b8a4-83f80882d97b@suse.com>
Date: Thu, 16 Apr 2026 14:06:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 12/27] xen/riscv: introduce aia_init() and
 aia_available()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1773157782.git.oleksii.kurochko@gmail.com>
 <74f15b1db86139b36b721ef9d12b998fe4f0f348.1773157782.git.oleksii.kurochko@gmail.com>
 <8393b8fe-6ba9-439c-ae15-a84409d0976d@suse.com>
 <e1be0f4d-5090-4f2c-a05b-30b9ed6e1490@gmail.com>
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
In-Reply-To: <e1be0f4d-5090-4f2c-a05b-30b9ed6e1490@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1776341183-CFB7DD75-76376763/0/0
X-purgate-type: clean
X-purgate-size: 2345
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.996];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: D432140DD94
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 13.04.2026 11:32, Oleksii Kurochko wrote:
> On 4/2/26 11:00 AM, Jan Beulich wrote:
>> On 10.03.2026 18:08, Oleksii Kurochko wrote:
>>> aia_init() is going to contain all the stuff related to AIA initialization.
>>> At the moment, it is just Check if SSAIA extension is available and if yes
>>> set is_aia_available to true.
>>
>> And (future) users of aia_available() can't directly call
>> riscv_isa_extension_available()? Nor can aia_available() be a convenience
>> wrapper around that call? It's only ...
>>
>>> --- /dev/null
>>> +++ b/xen/arch/riscv/aia.c
>>> @@ -0,0 +1,25 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>> +
>>> +#include <xen/errno.h>
>>> +#include <xen/init.h>
>>> +#include <xen/sections.h>
>>> +#include <xen/types.h>
>>> +
>>> +#include <asm/cpufeature.h>
>>> +
>>> +static bool __ro_after_init is_aia_available;
>>
>> ... a boolean, yes, but still.
> 
> My purpose was to have a variable which represent that AIA is 
> initialized properly. Maybe, it makes sense to rename this variable to 
> is_aia_inited.

I'm generally having trouble with the non-word "inited". How about
"aia_usable"? Fits ...

> The idea is that in future patches VGEIN will be also initialized in 
> aia_init() and if wasn't initialized properly then just keep 
> is_aia_availabe be set to false and in such case we will have that 
> is_aia_available != riscv_isa_extension_available(NULL, 
> RISCV_ISA_EXT_ssaia).

... this as well. And ...

> Note that regarding VGEIN it is arguable that it should be initialized 
> as generally it could be that there is no VGEIN what means that h/w 
> assisted guest interrupt files aren't available and s/w one should be 
> used. But s/w guest interrupt files aren't supported.
> So I mean that with the current implementation if VGEIN isn't 
> initialized I will tell that AIA isn't available what generally isn't 
> quite true.

... this. Question of course if what aia_usable (or whatever its name)
being set to false means to Xen's own operation. If Xen would still work
okay (without being able to create guests), perhaps the name may want to
be "aia_guest_usable" or some such. I.e. as I said on a number of
occasions: A variable wants to be named to accurately express its
purpose, without the name growing excessively long.

Jan

