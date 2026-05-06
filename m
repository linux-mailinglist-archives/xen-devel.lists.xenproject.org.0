Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ONa+FEJK+2mYYwMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 06 May 2026 16:03:46 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D25124DB9C9
	for <lists+xen-devel@lfdr.de>; Wed, 06 May 2026 16:03:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1301791.1575986 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKcqf-0007oL-8d; Wed, 06 May 2026 14:03:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1301791.1575986; Wed, 06 May 2026 14:03:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKcqf-0007ll-4M; Wed, 06 May 2026 14:03:37 +0000
Received: by outflank-mailman (input) for mailman id 1301791;
 Wed, 06 May 2026 14:03:36 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wKcqe-0007lb-2O
 for xen-devel@lists.xenproject.org; Wed, 06 May 2026 14:03:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKcqd-00GN6q-FT
 for xen-devel@lists.xenproject.org; Wed, 06 May 2026 16:03:35 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69fb4a2e-bab6-0a2a0a5309dd-0a2a4507aae8-24
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 16:03:35 +0200
Received: from [209.85.218.45] (helo=mail-ej1-f45.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69fb4a37-229c-0a2a45070019-d155da2dd979-3
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 16:03:35 +0200
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-ba922426c5cso1111326266b.3
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 07:03:35 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-69-121.play-internet.pl.
 [109.243.69.121]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bc55e6ec736sm88041366b.39.2026.05.06.07.03.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 May 2026 07:03:32 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778076215; x=1778681015; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FZ2B5omE2FJvmbX0wffMNpoPqRxUGwdBfTy6QM45qug=;
        b=TQXfXAxEFbs2QObU5Fy+KFu+G/JY+ELjXerdSoz7oOhgD0JfxBBtkEZOWaobgT33qB
         EMC4Evb/Vy7eutrHj+b957VQ9EYNlNJ1Off7lVdoVALHLBAYe0PFPodqdr/9de1W0CGn
         JHwQQD+Ej0v+flaSrPVb5JP5itZmoMhBS3d1MzJ0vVqpbW/h4nmjMIAUbpBLcrOO0CXf
         aVtyqEu4738ncUDxCcofJTropfu6TSDCEI4RMMJukpUuZGaMAfK6Ohl0LBvTlRdGRbqR
         5XIau+rben3wq/7S2gowp+b3eqMgtFKCHb5TImGWNpkrJwz6BnZ89ADSZtjbD1gOv2wl
         qSjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778076215; x=1778681015;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FZ2B5omE2FJvmbX0wffMNpoPqRxUGwdBfTy6QM45qug=;
        b=gw0o2LiN55C0Vi2W5GK1bGbU60O2KScj8+Tk1qBiMQHu2H/DLTNfG22y0VIe6RchFm
         eVg//C17cLzD5Dz5BzLlmjjObAxyL/ogtkFlBJTS0oLwh6D774yvhtXn9EUH3dinQycI
         0tkJKgjNgUvVKolS9rs5FBjiJVg0+Yxbm0UxIiaX3HxURV+Keyh8uvC2LbST4jAZSsMR
         8ZBCcYZdPRAbZdLqi83+jA8u0QejBmf4PauWENAZc/tuAn8pBjUp8hgQuTdL/025q7pK
         6wNikG9gh0Chg7XKf9LTpkm/z2v4MnSJm8XMlTZsdkqZmMkp/qKzgYi+dkvvAHmRlqXX
         4mWQ==
X-Forwarded-Encrypted: i=1; AFNElJ+kZZdzCPx3oNzPn0cha00Z/60Za8+OSxIHUCDd2bSnbdVKKnjJJFnlEgZ6i0xdZ2Sk2nf+gV0Vq/g=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz1IYBZzzAFtra3yYtUrdnXwFrVWb+ZYjTW1I1sxXjPH1nVh/Zw
	Anuyar1WFyrVWtvvnfV+BqS/IvyMsfM1aaHfxGeet5a6VWRpGxN8zEJT
X-Gm-Gg: AeBDieu9iIdjHjTdT74uMAJ7hGuMXg8AHDmm8Sasc3z+3ZxXdkoMkjgcM+nEmscYK8e
	S/RunOSodX6DW7g1h70HA+WOP6csl1SiWJxIJFnPFoFA7wTq6jRqp3To0htU29tX6evN8vI99k+
	h6ye37cPEn2762WbrCG/uw3PAF8/IO2vnSTKhTby9wd8vLxp37Ju6Ordro4UkHHtA0ehistNzfs
	dZqz18UmEZrLO2YS//VIJIKoJMrnZs2gZX3NmCQM6+xwgw6Q6teafx2TCow7LvMjd+9za0L/b24
	ZmaFrsKkE80qYuMFU69i04Enu/hbIsqs+mXqEMgR7F/P0kTU0lh1hPw9+8nsnKug3+vS/Q60r7v
	5rsKZSymMRabHpRjjy9ikOYDKC173eXKh/ggqnzwrEw6B8+xZ8plils+fLxxaoM0WvVFEHQZpk2
	2MZhqCEJRfVtyUvP0wibALTnTxh1uLg7CNE36+taBvV6Kd8m8ZOsIx5V+a1huQMCddBhpGpZW3q
	MEsWxtr/sqk4Q==
X-Received: by 2002:a17:907:1c13:b0:bab:c3b2:8635 with SMTP id a640c23a62f3a-bc56e2091c7mr193733166b.41.1778076212968;
        Wed, 06 May 2026 07:03:32 -0700 (PDT)
Message-ID: <4078b052-d0d7-4398-84c5-3a73577c6b99@gmail.com>
Date: Wed, 6 May 2026 16:03:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 08/11] xen/riscv: rework G-stage mode handling
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1777303844.git.oleksii.kurochko@gmail.com>
 <865ed71ece75e850cdcb47ce9157a668a46a4c4d.1777303844.git.oleksii.kurochko@gmail.com>
 <aec349c3-ae88-4b8c-940e-6d3fd9c115f8@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <aec349c3-ae88-4b8c-940e-6d3fd9c115f8@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1778076215-23B78C48-880476FE/10/73395122804
X-purgate-type: spam
X-purgate-size: 6933
X-Rspamd-Queue-Id: D25124DB9C9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]



On 5/4/26 4:23 PM, Jan Beulich wrote:
> On 28.04.2026 16:33, Oleksii Kurochko wrote:
>> --- /dev/null
>> +++ b/xen/arch/riscv/dom0less-build.c
>> @@ -0,0 +1,70 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +
>> +#include <xen/bootfdt.h>
>> +#include <xen/device_tree.h>
>> +#include <xen/init.h>
>> +
>> +#include <asm/p2m.h>
>> +
>> +int __init arch_parse_dom0less_node(struct dt_device_node *node,
>> +                                    struct boot_domain *bd)
>> +{
>> +    const char *mmu_type;
>> +    unsigned long bits;
>> +    const char *end;
>> +
>> +    if ( dt_property_read_string(node, "mmu-type", &mmu_type) )
>> +    {
>> +        dprintk(XENLOG_WARNING, "mmu-type property is missing in guest domain "
>> +                "node. %s will be used as fallback\n", max_gstage_mode->name);
>> +
>> +        bits = P2M_GFN_LEVEL_SHIFT(max_gstage_mode->paging_levels + 1);
>> +
>> +        goto out;
>> +    }
>> +
>> +    if ( !strcasecmp(mmu_type, "riscv,none") )
>> +    {
>> +        dprintk(XENLOG_ERR, "Bare mode isn't supported by Xen\n");
>> +
>> +        return -EOPNOTSUPP;
>> +    }
>> +
>> +    if ( strncasecmp(mmu_type, "riscv,sv", 8) )
>> +    {
>> +        dprintk(XENLOG_ERR, "mmu-type value \"%s\" is incorrect\n", mmu_type);
>> +
>> +        return -EINVAL;
>> +    }
>> +
>> +    bits = simple_strtoul(mmu_type + 8, &end, 10);
>> +    if ( (*end != '\0') || (end == mmu_type + 8) )
>> +    {
>> +        dprintk(XENLOG_ERR, "mmu-type value \"%s\" is incorrect\n", mmu_type);
>> +
>> +        return -EINVAL;
>> +    }
>> +
>> + out:
>> +    if ( bits > (UINT8_MAX - P2M_ROOT_EXTRA_BITS) )
>> +    {
>> +        dprintk(XENLOG_ERR, "gstage addr bits value overflows uint8\n");
>> +
>> +        return -EINVAL;
>> +    }
>> +    /*
>> +     * The correct value of bits will be checked in p2m_init() by call of
>> +     * find_gstage_mode_by_bits().
>> +     *
>> +     * As mmu-type property contains one of string:
>> +     *  - riscv,sv32
>> +     *  - riscv,sv39
>> +     *  - riscv,sv48
>> +     *  - riscv,sv57
> 
> Or about any other riscv,sv<N> with N up to somewhere around 250. I see
> that ...
> 
>> +     * it is needed to add '+P2M_ROOT_EXTRA_BITS' as for G-stage mode GPAs
>> +     * are extended by P2M_ROOT_EXTRA_BITS.
>> +     */
>> +    bd->create_cfg.arch.gstage_addr_bits = bits + P2M_ROOT_EXTRA_BITS;
> 
> ... the value calculated here is later checked for validity, so it's
> really only the comment which may want clarifying a little.

I will update the comment to:

/*
  * The mmu-type property may specify any riscv,sv<N> string, but only the
  * following are currently supported:
  *  - riscv,sv32
  *  - riscv,sv39
  *  - riscv,sv48
  *  - riscv,sv57
  * Any other value will be rejected by find_gstage_mode_by_bits().
  *
  * P2M_ROOT_EXTRA_BITS is added because for G-stage mode, GPAs are
  * extended by that many bits.
  */

> 
>> --- a/xen/arch/riscv/p2m.c
>> +++ b/xen/arch/riscv/p2m.c
>> @@ -45,12 +45,27 @@ struct p2m_pte_ctx {
>>       unsigned int level;          /* Paging level at which the PTE resides. */
>>   };
>>   
>> -static struct gstage_mode_desc __ro_after_init max_gstage_mode = {
>> -    .mode = HGATP_MODE_OFF,
>> -    .paging_levels = 0,
>> -    .name = "Bare",
>> +/* Values should be sorted by ->mode in this array */
>> +static const struct gstage_mode_desc gstage_modes[] = {
>> +    /*
>> +     * Based on the RISC-V spec:
>> +     *   Bare mode is always supported, regardless of SXLEN.
>> +     *   When SXLEN=32, the only other valid setting for MODE is Sv32.
>> +     *   When SXLEN=64, three paged virtual-memory schemes are defined:
>> +     *   Sv39, Sv48, and Sv57.
>> +     */
>> +    { HGATP_MODE_OFF,    0, "none" },
>> +#ifdef CONFIG_RISCV_32
>> +    { HGATP_MODE_SV32X4, 1, "sv32" },
>> +#else
>> +    { HGATP_MODE_SV39X4, 2, "sv39" },
>> +    { HGATP_MODE_SV48X4, 3, "sv48" },
>> +    { HGATP_MODE_SV57X4, 4, "sv57" },
>> +#endif
>>   };
>>   
>> +const struct gstage_mode_desc * __ro_after_init max_gstage_mode = &gstage_modes[0];
> 
> Nit: Overlong line (and, strictly speaking, a stray blank after *).

I will put "&gstage_modes[0];" on next line.

> 
>> @@ -331,8 +324,35 @@ static int p2m_alloc_root_table(struct p2m_domain *p2m)
>>       return 0;
>>   }
>>   
>> -int p2m_init(struct domain *d)
>> +static const struct gstage_mode_desc *find_gstage_mode_by_bits(
> 
> Is "_by_bits" adding much value to the function name? Especially ...
> 
>> +    unsigned char gpa_bits)
> 
> ... seeing that the parameter name is making things pretty clear?

Maybe not too much, I will drop that.

> 
>> +int p2m_init(struct domain *d, const struct xen_domctl_createdomain *config)
>>   {
>> +    /*
>> +     * TODO: This static is a temporary constraint: all guests must use the
>> +     * same MMU mode because p2m_gpa_bits is not yet per-domain.
>> +     * Drop this once per-domain p2m_gpa_bits is introduced.
>> +     */
>> +    static const struct gstage_mode_desc __ro_after_init *m = &gstage_modes[0];
>>       struct p2m_domain *p2m = p2m_get_hostp2m(d);
>>   
>>       /*
>> @@ -341,6 +361,33 @@ int p2m_init(struct domain *d)
>>        */
>>       p2m->domain = d;
>>   
>> +    if ( !config )
>> +    {
>> +        dprintk(XENLOG_ERR, "NULL config is passed\n");
>> +        return -EINVAL;
>> +    }
>> +
>> +    p2m->mode = find_gstage_mode_by_bits(config->arch.gstage_addr_bits);
>> +
>> +    if ( !p2m->mode )
>> +    {
>> +        dprintk(XENLOG_ERR,
>> +                "Unsupported or unavailable gstage addr bits: %u\n",
>> +                config->arch.gstage_addr_bits);
>> +
>> +        return -EINVAL;
>> +    }
>> +
>> +    if ( m->mode == HGATP_MODE_OFF )
>> +        m = p2m->mode;
>> +
>> +    if ( m->mode != p2m->mode->mode )
> 
> Since m always points into gstage_modes[], do you really need the extra
> indirection to compare the two ->mode fields? You could simply compare
> the pointers, couldn't you?

Agree, just "if ( m != p2m->mode )" will work.

> 
>> --- a/xen/include/public/arch-riscv.h
>> +++ b/xen/include/public/arch-riscv.h
>> @@ -56,6 +56,11 @@ typedef struct vcpu_guest_context vcpu_guest_context_t;
>>   DEFINE_XEN_GUEST_HANDLE(vcpu_guest_context_t);
>>   
>>   struct xen_arch_domainconfig {
>> +    /*
>> +     * G-stage GPA address width in bits.
>> +     * Valid values: 34 (sv32x4), 41 (sv39x4), 50 (sv48x4), 59 (sv57x4).
>> +     */
>> +    unsigned char gstage_addr_bits;
> 
> Fixed-width types only in the public interface please.

I will use uint8_t then.

> 
> Also, isn't the field effectively describing the maximum width of a
> guest (physical) address? In which case - simply gaddr_bits?

gaddr_bits would be okay in this case.

Thanks.

~ Oleksii

