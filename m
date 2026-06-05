Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id viJ9AnF7ImraYAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 05 Jun 2026 09:32:01 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F93A646000
	for <lists+xen-devel@lfdr.de>; Fri, 05 Jun 2026 09:32:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=Yzt6G4D3;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1329065.1593274 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVP1y-0004HS-Ou; Fri, 05 Jun 2026 07:31:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1329065.1593274; Fri, 05 Jun 2026 07:31:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVP1y-0004FI-LS; Fri, 05 Jun 2026 07:31:50 +0000
Received: by outflank-mailman (input) for mailman id 1329065;
 Fri, 05 Jun 2026 07:31:49 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wVP1x-0004F6-4s
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2026 07:31:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wVP1w-004voC-Hb
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2026 09:31:48 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a227b62-5cb7-0a2a0a5109dd-0a2a4502c408-6
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 09:31:48 +0200
Received: from [209.85.221.47] (helo=mail-wr1-f47.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a227b64-af86-0a2a45020019-d155dd2fe4ad-3
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 09:31:48 +0200
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-45ef372c58aso911560f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 00:31:48 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f2f2710sm18175800f8f.14.2026.06.05.00.31.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Jun 2026 00:31:46 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1780644708; x=1781249508; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=TkT1yuUnaOpkAgQd6/ok2I+qDGODhgBRws+6q5K4/DM=;
        b=Yzt6G4D315IPX6hdx2H7CsP4vFs+H+wAElvuQTo3FdhA8BZLwKbUYel/6rdgdAYl6n
         SMzmLeSO16UF+i/4gzuOAjd9nmkZFu2llHsMhx9y63Oy4kez1jB/QUjAyO+WjRRL0nPN
         vhbOsGLRUgjNZ/qY7tV5IdbLqG0CcNSK33iXS9ShuqnWSZbQ53idiIShMJzhJ9fDIeNN
         DtwNrLR2gMoPyW2rZjmSl+eIeJAHjlGQISUUJx+qTbT1A6FbDTwQ1E+dtDdhGbvTsbip
         7AhRS3Lg7EdhopCD0r1JOIGs1xDNUQaa00GSHkw8JA7XIR8S3s9cOwHdvW0N0gWg2AOy
         YfRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780644708; x=1781249508;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TkT1yuUnaOpkAgQd6/ok2I+qDGODhgBRws+6q5K4/DM=;
        b=mDqzfscBF0C1MeuW9v6zGAFEKjr+iOnU3HlYBojzQQdWPVK1U5q3w4ELc17+ngx7Hk
         6V9UP76CytJKQP1sgMzHMlImQdpGreW+6X1V3s+8zF/PHhoHItAJLL7VRI0uju+Ll+F3
         D7az8hMq0SmV1EqY4v8VGi7IPre04g+Uysl4fURezHuCBSNonTftWF6XypyWJxAtlI9o
         k5qgjiPxI3I1uulx4apWm5qzIb56RUfyWPxze5ynrFXSm3ae/MfvXeH+aI6khaRCXZS7
         NwAiBk39HCilO4CoLFlK5mEvVrYN3qG8tRQukhiY4gT7/Jr8HczVsiOUTiBPiAaq7fGs
         YdKQ==
X-Forwarded-Encrypted: i=1; AFNElJ+UmtyaY5wxpbWs3zy5qzpZEA8PMt0OM4HyV6fu98HP1Pwnmj/f0a17xyBkSRIm1A5y0NiT5jSSdbU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy4ooITh2jwEupp8e+jINMB9CAFcknXBfsyo8jUvCI24Ld2q/qw
	p2sVZNPbcSbIpHqdUKF25qsMxvNyViWtAMXMAlBzWaF1+CKoG/wX8PIz1c6P/mSa9JmAhtnpX0Y
	bHOg=
X-Gm-Gg: Acq92OGdHjc89DOP5oofRmkuipA96lyrVZnnVRS/eQN+z3MWYWhJwdgEia3/8egUZzy
	FlpmeEwLq+GMuwwVf1p46UvB8IXVWgM169f7B31lHGnVSdFR0BuQ/nTXvFRMBJABisT9qCHTFSZ
	AgExeymezzdirLKrVDTEQoBTCEQkraVXHhM+grkBk8UA3DDLQ4dxgWI4JM9go/DVMcStvooxCe6
	TOK7lT7ukc2ivonVI6jD08O/L2RM2qxS1r/OQXyavMeylT/D9bIsgqIqTT/8JjXzUsWlMKnV1Es
	IkcSniEhQpym2ga/rCE2ZRmu45e3G9vhpAhxUu2NDJPCpWHULGAXaTggeyF+AqoaSr5u2mRTbkv
	Xe6gNES1URVsjoscwXyXEAJqGxRoiHRs+UAl1qXDvjunjqj/gCLvoCfnIpy09qFyTZVnG63PyI6
	g6CslSeCh4AajhUCjN1w+FQl22nrC4QElaGWmdz9sY2v8IKCuMKUSU70Ee8zhUMTLfQYnHp2d96
	tEnAH6GPuD2Cs2aP8CnRWSK/rQLdaXjOxds
X-Received: by 2002:a5d:4647:0:b0:460:1a36:deac with SMTP id ffacd0b85a97d-460306320cemr2980619f8f.24.1780644707208;
        Fri, 05 Jun 2026 00:31:47 -0700 (PDT)
Message-ID: <88c0f573-087b-4f66-9045-1f480e4aa83c@suse.com>
Date: Fri, 5 Jun 2026 09:31:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 17/26] xen/riscv: generate IMSIC DT node for guest
 domains
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1778250616.git.oleksii.kurochko@gmail.com>
 <19d30d3c34a6ac9aeb668e1fc56301620b177db0.1778250616.git.oleksii.kurochko@gmail.com>
 <3da2f796-4dc7-408a-9ec9-f0e8bb02b1a9@suse.com>
 <f4d899ba-8a27-48dd-a724-55557b345647@gmail.com>
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
In-Reply-To: <f4d899ba-8a27-48dd-a724-55557b345647@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1780644708-82F6E161-235404E3/10/73395122804
X-purgate-type: spam
X-purgate-size: 4471
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:from_mime,suse.com:dkim,microchip.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7F93A646000

On 04.06.2026 16:21, Oleksii Kurochko wrote:
> 
> 
> On 6/3/26 5:21 PM, Jan Beulich wrote:
>> On 08.05.2026 16:43, Oleksii Kurochko wrote:
>>> Guests using the IMSIC interrupt controller require a corresponding
>>> Device Tree description.
>>>
>>> Add support for generating an IMSIC node when building the guest DT.
>>> This allows guests to discover and use the IMSIC interrupt controller.
>>>
>>> Co-developed-by: Romain Caritey <Romain.Caritey@microchip.com>
>>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>> ---
>>> Changes in v2:
>>>   - s/imsic_make_reg_property/guest_imsic_make_reg_property.
>>>   - s/imsic_set_interrupt_extended_prop/guest_imsic_set_interrupt_extended_prop.
>>>   - Use initalizer for regs[] array in imsic_make_reg_property().
>>>   - Move buf[] insde the for() loop.
>>>   - Correct check of returned phandle.
>>>   - Drop local variable len.
>>>   - /s/XVFREE/xvfree in imsic_set_interrupt_extended_prop().
>>>   - Drop initializer for local variable data.
>>>   - s/uint32_t/unsinged int for pos and cpu in imsic_set_interrupt_extended_prop().
>>>   - Drop next_phandle as it is now in common code.
>>>   - Introduce vcpu_imsic_deinit.
>>>   - Refactor vimsic_make_domu_dt_node() to avoid usage of host IMSIC dt node.
>>> ---
>>>   xen/arch/riscv/imsic.c                    | 127 +++++++++++++++++++++-
>>>   xen/arch/riscv/include/asm/guest-layout.h |   2 +
>>>   2 files changed, 128 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/xen/arch/riscv/imsic.c b/xen/arch/riscv/imsic.c
>>> index ceea6778d9dc..19cbacdf96e1 100644
>>> --- a/xen/arch/riscv/imsic.c
>>> +++ b/xen/arch/riscv/imsic.c
>>> @@ -13,9 +13,12 @@
>>>   #include <xen/const.h>
>>>   #include <xen/cpumask.h>
>>>   #include <xen/device_tree.h>
>>> +#include <xen/domain.h>
>>>   #include <xen/errno.h>
>>> +#include <xen/fdt-domain-build.h>
>>>   #include <xen/fdt-kernel.h>
>>>   #include <xen/init.h>
>>> +#include <xen/libfdt/libfdt.h>
>>>   #include <xen/macros.h>
>>>   #include <xen/sched.h>
>>>   #include <xen/smp.h>
>>> @@ -35,6 +38,11 @@ static struct imsic_config imsic_cfg = {
>>>       .lock = SPIN_LOCK_UNLOCKED,
>>>   };
>>>   
>>> +static unsigned int __ro_after_init guest_num_msis;
>>
>> How come this is __ro_after_init, when it's ...
>>
>>> @@ -291,6 +299,11 @@ static int imsic_parse_node(const struct dt_device_node *node,
>>>           return -ENOENT;
>>>       }
>>>   
>>> +    if ( dt_property_read_u32(node, "riscv,num-guest-ids", &tmp) )
>>> +        guest_num_msis = tmp;
>>> +    else
>>> +        guest_num_msis = imsic_cfg.nr_ids;
>>
>> ... written by a non-__init function?
> 
> __ro_after_init should be dropped. I will use __read_mostly instead.
> 
>   Plus are you again inheriting a host
>> property into guests without saying why?
> 
> Based on the discussion for similar place around vAPLIC code in the 
> previous patch I will add here or the comment why or introduce 
> VIMISC_NR_IDS and use it instead.
> 
>>
>>> @@ -524,8 +537,120 @@ int __init imsic_init(const struct dt_device_node *node)
>>>       return rc;
>>>   }
>>>   
>>> +static int __init guest_imsic_make_reg_property(struct domain *d, void *fdt)
>>
>> Same question again as to __init throughout here.
> 
>  From Arm code I understood that libxl creates the interrupt controller 
> node in userspace before handing the FDT to Xen so this and related 
> functions won't be called by userspace.

Hmm, okay, on the v3 submission I'll have to keep that in mind, and call
paths will need checking accordingly.

>>> --- a/xen/arch/riscv/include/asm/guest-layout.h
>>> +++ b/xen/arch/riscv/include/asm/guest-layout.h
>>> @@ -5,6 +5,8 @@
>>>   
>>>   #define GUEST_APLIC_S_BASE 0xd000000
>>>   
>>> +#define GUEST_IMSIC_S_BASE 0x28000000
>>> +
>>>   #define GUEST_RAM_BANKS   2
>>
>> Is this going to become an unannotated collection of (seemingly) random
>> numbers?
> 
> Could you please clarify what kind of annotation you would expect to see 
> here? It's just an address, which is typically used for IMSIC by QEMU, 
> so I chose the same notation for the guest address as well.

Well, how could I have known? The description says nothing, and there are
also no comments. The numbers here look entirely arbitrary, and if someone
wanted to change them, it wouldn't be clear at all what constraints need
taking into consideration.

Jan

