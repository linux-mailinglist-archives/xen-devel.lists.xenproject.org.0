Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kK4kMyMa2WnfmAgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2026 17:41:23 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 343BE3D985E
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2026 17:41:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1279379.1563818 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wBDyi-0004Mz-7b; Fri, 10 Apr 2026 15:41:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1279379.1563818; Fri, 10 Apr 2026 15:41:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wBDyi-0004LX-4R; Fri, 10 Apr 2026 15:41:04 +0000
Received: by outflank-mailman (input) for mailman id 1279379;
 Fri, 10 Apr 2026 15:41:02 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wBDyg-0004LR-Kw
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 15:41:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wBDyg-00HZzn-10
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 17:41:02 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69d919eb-e002-0a2a0a5209dd-0a2a4506ecb6-46
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 17:41:02 +0200
Received: from [209.85.128.48] (helo=mail-wm1-f48.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69d91a0d-0df0-0a2a45060019-d1558030ec1a-3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 17:41:01 +0200
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-488aa77a06eso34707225e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 08:41:01 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-69-121.play-internet.pl.
 [109.243.69.121]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488d58a8445sm76853365e9.6.2026.04.10.08.41.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Apr 2026 08:41:00 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1775835661; x=1776440461; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kooGstmI1qm/7v7twweO2WYTPflN8QuP2Iov/2zS4kc=;
        b=kLudQ+afaWbZBzq92iBDK9+gq3l4UwM4ftloHW76zJ+kD3hcatmH6c7NtJ/GYQzMuL
         eIAo7wDpVPIZI1DSwwhPfcNEVEw1/ivcfxCp0l4LKKH3HxRUZQKeE9/hJAZ/mASUCr5o
         B5B4/FetItM+K6AbVj+VmIBnalrB42V8QBIsTANZj7yzgyUvblds1/x06116F9KScYpv
         oBd0xtSjlrQI7pkqWiO+2XDymxCtHD/a94LqV+3kyV3LXt6WuFxqXrRfWW7zhB8h4R8j
         WUXfwPCSubgN16rkcQQmYJAN0fLmY21H4biG/r0dTe3KX89LLps9Ko+4bvnIGNaCdacc
         FbRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775835661; x=1776440461;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kooGstmI1qm/7v7twweO2WYTPflN8QuP2Iov/2zS4kc=;
        b=d3jy0uAxuev2smlZ2vJE7zazy0yHI5wzZkqvO9huiY4AmZ7cH0xK3ZgBa7CF0/4aPJ
         z1VCEDdHD3WIokH8qSQd/BX227BaNSuBOlHt1S6RPpLWheLrsqv5Fg/3tu0A4vm+dD3J
         py5OueUvUUckar+zBQrHW0H/EahfvViFxtqsdyhve0mdNFANHhWjHe/4rOZrJjmxfYVo
         K66eYi6bXPbcpnNTqJGKKglicRtompsTVvBeQDmhdzgNN0Xg0Ex7gNYAZ0PKPmRgq1up
         OxRBeHsyUd/2q2QNmCFsL/TWCxrXnLIc1XwyunXovpFG/mS2mFVnd4PjWXCgho7LBQM1
         fEKg==
X-Forwarded-Encrypted: i=1; AJvYcCUmO8dviD+COavmOKZMQuzzddMMPpjZfyq8BiJXeqZoF8ryGFU6D4pvnPHP1KNH0xpi1s+GKRfQOmM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzdmeeV4UAS5/ZHfYZV+HIiWBGBgA7sWgc2QHgFIUNAIMszVt2x
	aIi1rslcRIYL7IpctcsBvIV4g8onHQiNMguksUmKz8dR7CaohpFs+sTa
X-Gm-Gg: AeBDies2ltV0McmtErolyB+nPBYU433l++rd2ShMzQbkqaMw5iAP4wbilAWSlrxkdyX
	JyHcA1Ko5jNlLVw6hn+TWbnudvgErbJwQW91iTwfss7wRJUPHmvghTFHII31pHMQH+CyS5nqAj4
	ZUCFxlddt860lUMNzqKQOXH9HDAyVLdgg6HzkR0idaaDwE48j1SI83vQhCGxDH8evStKXXbzG8b
	3L8XeZwR7kbv91JMkmng5mhMM9Q9j7GbVaAFeJowpRQqboiMu6yCbuobjfg60ZquZXfVq9lqdNi
	vhwoUCHjw0Box8Xwv8X1MpRZnIeEoR1C7eQlZr5JYiNMztF4VevEAMrSHWeOtRfoKjELrIXF5Y1
	l4QyjEa6xU6KwuxBeAVXkClSlMFRaIw56p6hNMrTPUdrOm504t0+sioscaZm49Gi74m3Qon26rk
	kHjFVmXT2cJiERf742Gd3f1nlYNDHbMGqxLC4KdmsJ4xRNTb/6XwyMsXORlf0CZblGzVBmS6O5f
	hQ=
X-Received: by 2002:a05:600c:608e:b0:488:78f2:6b0 with SMTP id 5b1f17b1804b1-488d688a11amr48305075e9.29.1775835661226;
        Fri, 10 Apr 2026 08:41:01 -0700 (PDT)
Message-ID: <b2c8e859-a91a-469f-b674-0942d240f0d9@gmail.com>
Date: Fri, 10 Apr 2026 17:40:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 10/27] xen/riscv: generate IMSIC DT node for guest
 domains
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1773157782.git.oleksii.kurochko@gmail.com>
 <8154eae081d14da89f27bad581270cc5bba6ccfc.1773157782.git.oleksii.kurochko@gmail.com>
 <93e8407e-cff0-42cc-8cfd-2d82f536a886@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <93e8407e-cff0-42cc-8cfd-2d82f536a886@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1775835661-5E12E3D8-AE8F947F/10/73395122804
X-purgate-type: spam
X-purgate-size: 4939
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 343BE3D985E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/1/26 5:05 PM, Jan Beulich wrote:
> On 10.03.2026 18:08, Oleksii Kurochko wrote:
>> Guests using the IMSIC interrupt controller require a corresponding
>> Device Tree description. Add support for generating an IMSIC node when
>> building the guest DT.
>>
>> Keep a reference to the host IMSIC DT node and reuse its compatible
>> property while constructing the guest-visible node.
> 
> Again raises a migration concern. Presumably a guest would then be able
> to migrate only to other hosts with the same compatible property.

Right, but I don't think we can do too much and it is the simplest 
approach just to migrate to hosts with the same compatible property.

If you concern is about DTS property then for IMSIC it will be always 
riscv,imsics according to the RISC-V DT spec. (IIRC, the only other 
option could be qemu,riscv). Actually, I can just hard code 
"riscv,imsic" explicitly instead of re-using of host name.

If your concern is that we will migrate to a host which doesn't support 
IMSIC at all then we should or (a) don't migrate to such host or (b) 
provide an emulation of IMSIC. And option (b) would be terrible from at 
least performance point of view.

>> +static int __init imsic_set_interrupt_extended_prop(struct domain *d,
>> +                                                    void *fdt)
>> +{
>> +    uint32_t len = 0, pos = 0, cpu, phandle;
> 
> At least pos and cpu should be of fixed width types.

I thought that uint32_t is fixed width type, isn't it?

> 
>> +    uint32_t *irq_ext;
>> +    char buf[64];
> 
> Move this one into the loop's scope?

I will do that.

>> +    int res;
>> +
>> +    irq_ext = xvzalloc_array(uint32_t, d->max_vcpus * 2);
>> +    if ( !irq_ext )
>> +        return -ENOMEM;
>> +
>> +    for ( cpu = 0; cpu < d->max_vcpus; cpu++ )
>> +    {
>> +        snprintf(buf, sizeof(buf), "/cpus/cpu@%u/interrupt-controller", cpu);
>> +        phandle = fdt_get_phandle(fdt, fdt_path_offset(fdt, buf));
>> +
>> +        if ( phandle <= 0 )
>> +            return phandle;
> 
> <= is odd to use on an unsigned type. Arm, in a similar situation, uses != .

Agree, it should be !=.

> 
> Yet then - if 0 is an error indicator, aren't you converting this into a
> success indicator for the caller?

I read incorrectly the comment of what fdt_get_phandle() returns. so it 
should be:
         if ( !phandle )
         {
             res = -ENODEV;
             goto out;
         }

goto here as xvfree() should be called in this case.


> 
>> +        irq_ext[pos++] = cpu_to_be32(phandle);
>> +        len += sizeof(uint32_t);
> 
> As before, preferably sizeof(<expression>) to clarify the connection. It's
> pretty obvious here, but still. Yet then - do you really need to maintain
> "len"? Why not use ...
> 
>> +        irq_ext[pos++] = cpu_to_be32(IRQ_S_EXT);
>> +        len += sizeof(uint32_t);
>> +    }
>> +
>> +    res = fdt_property(fdt, "interrupts-extended", irq_ext, len);
> 
> ... "d->max_vcpus * 2 * sizeof(*irq_ext)" here?

Agree, it could and would be better.

> 
>> +    XVFREE(irq_ext);
> 
> This can be just xvfree(), as the variable goes out of scpoe just afterwards
> anyway.
> 
>> +    return res;
>> +}
>> +
>> +int __init imsic_make_dt_node(const struct kernel_info *kinfo)
> 
> So this function is unused until the next patch. Acceptable as long as Eclair
> (or other) scans aren't done for RISC-V, but generally you may want to try to
> get used to order patches such that this is avoided.
> 
>> +{
>> +    uint32_t len;
>> +    const void *data = NULL;
> 
> Why the initializer?

No, need any more, I had a case before so just missed to clean up properly.

> 
>> +    int res = 0;
>> +    void *fdt = kinfo->fdt;
>> +    const struct dt_device_node *host_imsic_node = imsic_cfg.host_node;
>> +    uint32_t *next_phandle = &kinfo->bd.d->arch.next_phandle;
>> +
>> +    res = fdt_begin_node(fdt, host_imsic_node->full_name);
>> +    if ( res )
>> +        return res;
>> +
>> +    data = dt_get_property(host_imsic_node, "compatible", &len);
>> +    if ( !data )
>> +    {
>> +        printk(XENLOG_ERR "%s: Can't find 'compatible' property\n",
>> +               host_imsic_node->full_name);
>> +
>> +        return -ENOENT;
>> +    }
> 
> Move fdt_begin_node() down below here?
> 
>> --- a/xen/arch/riscv/include/asm/imsic.h
>> +++ b/xen/arch/riscv/include/asm/imsic.h
>> @@ -57,11 +57,16 @@ struct imsic_config {
>>       /* MSI */
>>       const struct imsic_msi *msi;
>>   
>> +    /* DT node of IMSIC */
>> +    const struct dt_device_node *host_node;
> 
> Does "host" in the name carry much of a meaning? Maybe better dt_node, to
> (potentially) distinguish it from a NUMA node which also may need tracking
> for an imsic at some point?

Maybe, not too much. Lets rename it.

Thanks.

~ Oleksii

