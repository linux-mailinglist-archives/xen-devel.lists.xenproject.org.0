Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cDwKMEv4RGoQ4QoAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 01 Jul 2026 13:21:47 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2145E6ECBE7
	for <lists+xen-devel@lfdr.de>; Wed, 01 Jul 2026 13:21:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=rAiEnPkE;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1349807.1607449 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wet0Z-000474-UO; Wed, 01 Jul 2026 11:21:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1349807.1607449; Wed, 01 Jul 2026 11:21:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wet0Z-00044z-Rb; Wed, 01 Jul 2026 11:21:35 +0000
Received: by outflank-mailman (input) for mailman id 1349807;
 Wed, 01 Jul 2026 11:21:35 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wet0Z-00044t-4X
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 11:21:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wet0Y-008Jx0-0h
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 13:21:34 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a44f838-bab6-0a2a0a5309dd-0a2a4506ad4a-28
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 13:21:33 +0200
Received: from [209.85.128.54] (helo=mail-wm1-f54.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a44f83d-08de-0a2a45060019-d1558036b1ce-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 13:21:33 +0200
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-493b7612475so4175865e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 04:21:33 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493bfe7427dsm30066585e9.2.2026.07.01.04.21.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Jul 2026 04:21:32 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1782904893; x=1783509693; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yYqd0TQWneNELNrgVFcNFC5RMvVEYdbDE3gPcNnxkYg=;
        b=rAiEnPkE1WoQgGlw/THW13s+1Z15Omo5RxLlADdvewcaHrBpx0zNtfWYb6KpWGmoVb
         L46RdnBLFSrfRKIhZAeAiAAjADo9LDEYZzE6TjlKg2EsxZnPu97BqT7mCoKcubvg4Bzp
         GmNPy8KxXOurKKtxBv7CMm0ee4OFygj0yhziClbV6XLxj06UEGzcIH8+dTYIpCzcg0pe
         SauiNG4EqBPISQ1m4jTTnFeRzGajjd3x9SJ6Qcb3vai6ypfvEfEAi8Z59WzAKNlWFU1C
         zupAW2VK5kYARy9T6gbhO8419PeY/5YerqHJVi89XZE/yjkmPNFJQkfP/1am+5KHE6uo
         WTvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782904893; x=1783509693;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yYqd0TQWneNELNrgVFcNFC5RMvVEYdbDE3gPcNnxkYg=;
        b=mIMNBC1fICVhJmIMRWETPMN1PIGv39QRw6gDefG9Q6OxVrpa5X+/s6ojY6K4zvltic
         LCUNoUblrRYDhj3HspcgTi7H67x6cuDtOjkwURP/kWpKHJ/Wvt3N10v/yCIKIBZhc+jb
         S7xic9JQTECgC8C4bABV8aB9NrnOZ9FlpqK+V9w6UC+TbeZxMkunfo6TYgBoWiHkqagq
         GDka/PWnZ3IAoUTsvVcSNmsOMyxDNn03tdUGhJQn+Poc53fF7uyJxNs739pkYj8bboJv
         1JJXvEsQZDLgfvw5P9vqrK5y3c9FadLrmUCRoyUqlsKKWH6yjsAVyCqUP+HRR8FYo+S+
         uUuA==
X-Forwarded-Encrypted: i=1; AFNElJ8VEl2BEmJ4C0xND0jKlND2JUJXzOCZ4JVaQFwSn5ZqnVMVjWIyBLw0NpEkqPESzJeeoLtIMUZP6M0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxD0fbwfFY6k1hzVKyl4zG1/YzXvux+w1HhAe+e5gHd4K5zMBFR
	KhwGkuJIIkVILByvY2nTx+MlkZxSB2Ca2HEqiwE+N9Xs8o6mFmnLxweQ
X-Gm-Gg: AfdE7ck3FRxABGDa0dCcyRqiSyrV2Y49Z1sXMFixpKZsoELWRwptmOLrqQbW+BQZXvs
	2ze8dOECUQ283WnK/OQ/Dh4B1k024XKiEhpyQ96eAZKynIY8MylQTlx6ou5jEWLY2EPbJurM7w6
	cIdio37vj4F8JZIpLIAKh87V7j97q4DpevkAtn053TgvdUILAVjqNhzN8aWE9lFEdAblA9qeT7J
	iPeNCJFxBRqXPj3M27/QfUFlSpZnlWKRubooEpYTNhZLDXqjPXWVkWXqVHhuH4pHBmupzx7nKKg
	z8+qUSOi1zL/7BL3vtutifYyhpcOacTw8+vgT1AVKgaPLctf8e/reZ/HAl//HmEI0Q0vFvL8H5U
	W672Y6ENRiA4Ycq0QRo87Cq4rp/18DVe2CdqPVoF1dTtmuKHjdpC6A8B2jaWUGcw+lFVN363nAh
	z3nMZWF9zDwdvmD+b7ioqtHzUJ88X/o5DvYIG8uZKL8+tPAcagG2229JnhyWvr5P1FUZ8=
X-Received: by 2002:a05:600c:6692:b0:490:d354:bd00 with SMTP id 5b1f17b1804b1-493c2b90632mr18178965e9.25.1782904893118;
        Wed, 01 Jul 2026 04:21:33 -0700 (PDT)
Message-ID: <018771c4-043d-4b29-ac40-284ee8692334@gmail.com>
Date: Wed, 1 Jul 2026 13:21:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 19/25] xen/riscv: generate IMSIC DT node for guest
 domains
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1782487661.git.oleksii.kurochko@gmail.com>
 <424c223b97e9d27aa4ef4e05e2d5c8d0c426324c.1782487661.git.oleksii.kurochko@gmail.com>
 <77d3cf2c-3ed7-45f8-8e76-72520e71306b@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <77d3cf2c-3ed7-45f8-8e76-72520e71306b@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1782904893-C553968D-055D0C2C/10/73395122804
X-purgate-type: spam
X-purgate-size: 4806
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FREEMAIL_CC(0.00)[microchip.com,vates.tech,wdc.com,gmail.com,citrix.com,amd.com,xen.org,kernel.org,lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:Romain.Caritey@microchip.com,m:baptiste.le-duc@vates.tech,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2145E6ECBE7



On 6/29/26 5:19 PM, Jan Beulich wrote:
> On 26.06.2026 17:46, Oleksii Kurochko wrote:
>> --- a/xen/arch/riscv/imsic.c
>> +++ b/xen/arch/riscv/imsic.c
>> @@ -13,8 +13,12 @@
>>   #include <xen/const.h>
>>   #include <xen/cpumask.h>
>>   #include <xen/device_tree.h>
>> +#include <xen/domain.h>
>>   #include <xen/errno.h>
>> +#include <xen/fdt-domain-build.h>
>> +#include <xen/fdt-kernel.h>
>>   #include <xen/init.h>
>> +#include <xen/libfdt/libfdt.h>
>>   #include <xen/macros.h>
>>   #include <xen/sched.h>
>>   #include <xen/smp.h>
>> @@ -34,6 +38,16 @@ static struct imsic_config imsic_cfg = {
>>       .lock = SPIN_LOCK_UNLOCKED,
>>   };
>>   
>> +/*
>> + * Number of MSIs available to a guest. Determined by the host interrupt
>> + * controller, so it is identical for every domain -- hence a single global
>> + * rather than a per-domain value.
>> + */
>> +static unsigned int __read_mostly guest_num_msis;
>> +
>> +#define GUEST_IMSIC_COMPATIBLE "riscv,imsics"
>> +#define GUEST_IMSIC_NUM_MSIS 255
> 
> Considering its use this isn't named correctly - it's not the number of MSIs
> guests get to use.

I will rename to GUEST_IMSIC_NUM_IDS then it will be fully aligned with 
dts property name.

Then it makes sense to rename guest_num_msis to guest_num_ids.

> 
>> @@ -285,6 +299,11 @@ static int imsic_parse_node(const struct dt_device_node *node,
>>           return -ENOENT;
>>       }
>>   
>> +    if ( dt_property_read_u32(node, "riscv,num-guest-ids", &tmp) )
>> +        guest_num_msis = tmp;
>> +    else
>> +        guest_num_msis = IMSIC_MAX_ID;
> 
> Why is guest_num_msis __read_mostly, not __ro_after_init? Merely because the
> function here (wrongly) isn't __init?

Yes, because of the function isn't __init what I can agree is wrong. I 
will change that and s/__read_mostly/__ro_after_init for guest_num_msis.

> 
>> @@ -522,3 +541,121 @@ int __init imsic_init(const struct dt_device_node *node)
>>   
>>       return rc;
>>   }
>> +
>> +static int __init guest_imsic_make_reg_property(struct domain *d, void *fdt)
>> +{
>> +    paddr_t size = IMSIC_MMIO_PAGE_SZ * d->max_vcpus;
>> +    __be32 regs[4] = {
>> +        cpu_to_be32(GUEST_IMSIC_S_BASE >> 32),
>> +        cpu_to_be32(GUEST_IMSIC_S_BASE),
>> +        cpu_to_be32(size >> 32),
>> +        cpu_to_be32(size),
>> +    };
>> +
>> +    return fdt_property(fdt, "reg", regs, sizeof(regs));
>> +}
>> +
>> +static int __init guest_imsic_set_interrupt_extended_prop(struct domain *d,
>> +                                                          void *fdt)
>> +{
>> +    unsigned int cpu, pos = 0;
>> +    __be32 *irq_ext;
>> +    int res;
>> +
>> +    irq_ext = xvzalloc_array(__be32, d->max_vcpus * 2);
>> +    if ( !irq_ext )
>> +        return -ENOMEM;
>> +
>> +    for ( cpu = 0; cpu < d->max_vcpus; cpu++ )
>> +    {
>> +        char buf[64];
>> +        uint32_t phandle;
>> +
>> +        snprintf(buf, sizeof(buf), "/cpus/cpu@%u/interrupt-controller", cpu);
> 
> May I, btw, suggest you get into the habit of using ARRAY_SIZE() in favor of
> sizeof() with snprintf()? That's because sizeof() isn't correct to use if
> wide strings (and hence swnprintf()) come into play.

Oh, right with wchar_t buf[64] sizeof(buf) won't return 64...

I will apply your suggestion and use ARRAY_SIZE() here instead.

> 
>> +int __init vimsic_make_domu_dt_node(struct kernel_info *kinfo,
>> +                                    unsigned int *phandle)
>> +{
>> +    int res;
>> +    void *fdt = kinfo->fdt;
>> +    char vimsic_name[32];
>> +    unsigned int vimsic_phandle;
>> +    unsigned int num_msis = min(GUEST_IMSIC_NUM_MSIS + 0U, guest_num_msis);
> 
> As guest_num_msis (supposedly) doesn't change anymore after it was set, why
> would this need calculating again for each call here? Can't you apply the
> upper bound right in imsic_parse_node()?

Agree, I will add the following to imsic_parse_node() after 
guest_num_msis is init-ed:

guest_num_msis = min(GUEST_IMSIC_NUM_MSIS + 0U, guest_num_msis);

> 
>> --- a/xen/arch/riscv/include/asm/guest-layout.h
>> +++ b/xen/arch/riscv/include/asm/guest-layout.h
>> @@ -3,6 +3,12 @@
>>   
>>   #include <public/xen.h>
>>   
>> +/*
>> + * Base address of the guest's supervisor-mode IMSIC. The value is the address
>> + * typically used for IMSIC by QEMU.
>> + */
>> +#define GUEST_IMSIC_S_BASE _UL(0x28000000)
> 
> As you mention it explicitly: Is there also a user-mode IMSIC?

I am not aware of such.

I mention it explicitly as machine mode IMSIC exists and it is a 
separate DT node for that.

Out of scope: there is a reserved bit in MISA register for user-level 
interrupts but I don't see that AIA uses that bit.

Thanks.

~ Oleksii

