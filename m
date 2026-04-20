Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sMcaCdwT5mnRrAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 13:54:04 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6381942A499
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 13:54:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1285720.1566902 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEnBr-0007EX-Fi; Mon, 20 Apr 2026 11:53:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1285720.1566902; Mon, 20 Apr 2026 11:53:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEnBr-0007Bz-Co; Mon, 20 Apr 2026 11:53:23 +0000
Received: by outflank-mailman (input) for mailman id 1285720;
 Mon, 20 Apr 2026 11:53:22 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wEnBq-0007Br-Ps
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 11:53:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEnBp-00D9Ea-N3
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 13:53:21 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69e613a8-5cb7-0a2a0a5109dd-0a2a450ab26a-8
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 13:53:21 +0200
Received: from [209.85.167.45] (helo=mail-lf1-f45.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69e613b1-56b3-0a2a450a0019-d155a72da9b0-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 13:53:21 +0200
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-5a413f83226so3500098e87.1
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 04:53:21 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-69-121.play-internet.pl.
 [109.243.69.121]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a4187e1131sm2966774e87.42.2026.04.20.04.53.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Apr 2026 04:53:20 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1776686001; x=1777290801; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=F6H3LGVDr8D8S8rCAGyuzjagZqrXLNiPcD99pdHmT1M=;
        b=LFsYp6bCrZjmVuGal3FVIrpfv59fgFAg9TUOz9N3W+GCGJkaQj0oqRztoLGA38VYs9
         ugkaFS3QRLmhjuOkXgJfRA8l2NkMVCYuCNaqXTTebzjW5TMPk4/FtPc0BIlPZddZAISH
         ywAmcEVcGVyY7AQRubtctwPdpeUwZxne0SGvCShgWS8F2mJ3pOL9YXcF9ImIZSOc29zl
         1SwYyDfku4eiFjNpNWjAdK/f1pxKK/Y/Nfdbn9Q1ryCZ92Fifx0rk1eYX7pEgSRRU341
         vgs5CgktuFGV6SrLqN0jqQqxACv75AHT3+OpRlrXtkYc/XWI53ce7upLNEkLcAVucIWf
         e4Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776686001; x=1777290801;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F6H3LGVDr8D8S8rCAGyuzjagZqrXLNiPcD99pdHmT1M=;
        b=HzbyeeojogUwC5Lu5zjJ1ZjEpvMh8GYgaO7LErfSW47yiSVD4O+fyd0Pb8DXT/8M9M
         YnDs415whKoZRqAQGntSSA4Cn58z+sC9mLa61VzB1ksozD/sMiJDpMGsldBvj55psFtP
         JfncfT6UVAe+Uh9Mc5qP50oXbhVFOZOHbjd2NiXFNigftdRKPiecf2OQ5+z6cPvfOeEj
         H6LzonWJ6QseTJIwwLxo8AgwmIRbDo6tfMfQ7W8xyHgp70Nu+HyZnLOQCrY1cDfT7gW0
         QJ1UJIfLP+qbfzvS2j8AASMAycIeWND3nJBz3rpuzsCEq568eSxDJe0m50nFh20h/Iv9
         rvDQ==
X-Forwarded-Encrypted: i=1; AFNElJ94lNX2t+/AjV7R778CxSWQRA7MlyQe3NpPLJWsoc6PQGwAu1W1+bz+fXJ6KQnZ0Pyu9LB2piWOqm8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwYTJuw//0GOk0BvfB9Qw35ZvpDAcWQOxMEcIIH6WP4nKq/sOcG
	Hd2LuhQTrebRv/Xy+PP75LrOLIRJm7oa8DNgnJ8IPI0V12vdRcEafsd7
X-Gm-Gg: AeBDiethsPFX6/mD2Oj7VhUGgG01Xd6tOvkZwX7ytj5QSo5tBSBNdc7xIlUTFgmgjaD
	8y7xuAnANpEL3FU6ldXEgteVeTPchFwb8RjfqY5vkSUDQ1mmqf5vuQYNl2OGH99CQzR0lVr8Wk5
	BNxdfI7/H3iGcx/qXAaUZ/HMxbAkFfP0fR6TDOjGW2XGv9WsqmN8DnqsepVUdNyLfX/q00vcWq1
	y31BEIkImuL4uz8PaO/0gEMuojJ/Gn1yxNVhjhyoxiH9BsHGC/T+1maw/98m/BJxLknzf/uIbNy
	Wst3Q4VHpV9+bu7ykWYSZHb9TdYAAHh1y6CXoubBYAcD2o909upEaR3XmvXqqavGJoiZFvavTKr
	5xHAvPVlBETO0WtB2YVyhJ7wyvVMMG3Y+hNcOrIb2oecpj0KTtY7fCxrySdz3GNOJUECyMsqdTa
	16SuE/4ZscJ1mscIBGqM7I9dzE4EoVyzNR757oKmzpl+U1rhu5328ASya0ON6/PzpHG1QVMrDfv
	WkHJkV85Bvj5w==
X-Received: by 2002:a05:6512:1113:b0:5a3:ff:cf83 with SMTP id 2adb3069b0e04-5a41717478fmr3367428e87.7.1776686000498;
        Mon, 20 Apr 2026 04:53:20 -0700 (PDT)
Message-ID: <d08317b4-b5a7-4d14-8e63-a2b0111c65c3@gmail.com>
Date: Mon, 20 Apr 2026 13:53:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 18/27] xen/riscv: add vaplic access check
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
 <0fc9adf790d4f981e8117bd9759c7e64bb11e439.1773157782.git.oleksii.kurochko@gmail.com>
 <0519fb8a-48e3-4f36-8d6c-a966080ffb55@suse.com>
 <f0503bd6-3ea3-42da-9211-02836addc176@gmail.com>
 <e70e141b-fe40-41f2-9101-e65758e7f7b6@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <e70e141b-fe40-41f2-9101-e65758e7f7b6@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1776686001-CE5748B7-93F3E1E2/10/73395122804
X-purgate-type: spam
X-purgate-size: 3099
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[d000000:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
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
X-Rspamd-Queue-Id: 6381942A499
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/16/26 3:01 PM, Jan Beulich wrote:
> On 14.04.2026 13:45, Oleksii Kurochko wrote:
>> On 4/2/26 3:10 PM, Jan Beulich wrote:
>>> On 10.03.2026 18:08, Oleksii Kurochko wrote:
>>>> --- a/xen/arch/riscv/aplic.c
>>>> +++ b/xen/arch/riscv/aplic.c
>>>> @@ -38,6 +38,7 @@ static struct aplic_priv aplic = {
>>>>    
>>>>    static struct intc_info __ro_after_init aplic_info = {
>>>>        .hw_version = INTC_APLIC,
>>>> +    .private = &aplic,
>>>
>>> Isn't this the host instance again? How can you ...
>>>
>>>> --- a/xen/arch/riscv/vaplic.c
>>>> +++ b/xen/arch/riscv/vaplic.c
>>>> @@ -127,6 +127,20 @@ int vaplic_map_device_irqs_to_domain(struct domain *d,
>>>>        return 0;
>>>>    }
>>>>    
>>>> +static int cf_check vaplic_is_access(const struct vcpu *vcpu,
>>>> +                                     const unsigned long addr)
>>>> +{
>>>> +    const struct vaplic *vaplic = to_vaplic(vcpu->domain->arch.vintc);
>>>> +    const struct aplic_priv *priv = vaplic->base.info->private;
>>>> +    const paddr_t paddr_end = priv->paddr_start + priv->size;
>>>> +
>>>> +    /* check if it is an APLIC access */
>>>> +    if ( priv->paddr_start <= addr && addr < paddr_end )
>>>
>>> ... use that here? Or asked differently, again: Where's the virtualization,
>>> i.e. the abstraction away from host properties?
>>
>> With the current use case it was easier to choose such approach then
>> provide the full abstraction.
>>
>>> Furthermore, is it really sufficient to check just the starting address of
>>> an access? Shouldn't the last byte accessed also fall into the range in
>>> question?
>>
>> I think that it is okay, my understanding is that *paddr_end technically
>> is another range.
> 
> Of course it is. But a multi-byte access crossing the paddr_end boundary
> isn't purely an APLIC one. You can reject such for simplicity, but I'm
> unconvinced that you can claim you will be able to correctly handle it
> without proper merging.

Lets say guest has the following description of vAPLIC in its DTB:
  aplic@d000000 {
    phandle = <0x06>;
    riscv,num-sources = <0x60>;
    reg = <0x00 0xd000000 0x00 0x8000>;
    ...
  }
What means vAPLIC's MMIO range is [0xd000000, 0xD007FFF]. If some is 
trying to access 0xd008000 it is not an MMIO address which belongs to 
vAPLIC so vaplic_is_access() should return 0.

IIUC, you concern is that if someone will try to access 0xD007FFF which 
from this function point of view is legal. I think it is okay to return 
here 1 what tells that this address is from our vAPLIC range as it will 
be rejected that on vaplic_emulate_{load,store}() side as addr (more 
accurate offset got from addr) should be properly aligned:
     const unsigned int offset = addr & APLIC_REG_OFFSET_MASK;
     ...
     if ( offset & 3 )
     {
         gdprintk(XENLOG_WARNING, "Misaligned APLIC access at offset %#x\n",
                  offset);
         return -EINVAL;
     }

Is it okay? Actually I think we could add ( addr & 3 ) check in 
vaplic_is_access() function too...

~ Oleksii

