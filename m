Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YJ1zKjny6GkdRwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2026 18:07:21 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2243D4483E2
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2026 18:07:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1290857.1570318 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFa6D-0007Cs-Qp; Wed, 22 Apr 2026 16:06:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1290857.1570318; Wed, 22 Apr 2026 16:06:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFa6D-0007AQ-Nh; Wed, 22 Apr 2026 16:06:49 +0000
Received: by outflank-mailman (input) for mailman id 1290857;
 Wed, 22 Apr 2026 16:06:47 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wFa6B-0007AK-CV
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 16:06:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFa6A-0013Mu-EE
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 18:06:46 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69e8f206-bab6-0a2a0a5309dd-0a2a45068d9c-18
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 18:06:46 +0200
Received: from [209.85.167.42] (helo=mail-lf1-f42.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69e8f215-7371-0a2a45060019-d155a72ab80b-3
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 18:06:46 +0200
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-59e5aa4ca41so5568350e87.2
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 09:06:46 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-69-121.play-internet.pl.
 [109.243.69.121]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a41974167fsm4503696e87.60.2026.04.22.09.06.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Apr 2026 09:06:44 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1776874005; x=1777478805; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E2VCIFFdkqyEam0s3fRcy75nsTVdfFenk05cYG41k2o=;
        b=F5KtPh2tICVddZM20co7353GP1hkHKV2EWhX381kOASxcjCxU5a3Mmzo72jJU3m4g4
         nBL3/8Ooo50d3ndOC4PNG7O8FB+JpU0gnVVW9GJHBq9L/siX9OzOU8D4lmKDCEANFp9y
         xHA5BQBzm6++oJKvl/dMzGviMwU/QldLAtOlfanoMRbDAzA48Mlp6/CHVStOWlfPJhTI
         KqIwD4Cz0Fpg6DGfAt6V1+Tde+z+xCxuPjPWV2m3Ixgz08I4Uhf/v54RDz6uXMbygCRu
         bCyqFguYoq80NXvutehC6UacGgTl6pqYzcN/fRu4Wj1xctA/bUdoTFw/N5zhgm8HADws
         0wsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776874005; x=1777478805;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E2VCIFFdkqyEam0s3fRcy75nsTVdfFenk05cYG41k2o=;
        b=LX+iViPqA1Ax/zAYvOutxe/oOWvZT9KXhk3z4Q47xL82upCKGt30qArDfz6eadOSN6
         DOpnHshSJJFxdBpsrZoPR+VDMBZSrAcwtVzuT82Km/6YgtfjLnImRrlb7Vs+v4h5q3w3
         eVKztywh4VIVN6yZT4QPH2jImlmGZsAGtn5sKxaB7T9IL4rX8x3gMoSKCjOuul9porMG
         0/1YXU0QpYJUGDPzmi6GKsszYwlR8tI9rAbCcb2GQZRdcMY60oAYFAL5RzjBVBbyudzD
         oP4jF8weVdsoj4qOsxrLZIu+LauRCfTH8opjHo15QyzpWC6rxLBcotdCieiPdGHo0i7n
         tMGA==
X-Forwarded-Encrypted: i=1; AFNElJ8sSXWwKY9tDpo5M3s25Bl/muj6pzypAbRjYhaOderHuSLAZwrjr7HiXY+fFpmb7VmzWbIYwILFGFY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzJVVfAjYFFpwdi7pmSXECu4/otNp76B0w+6I2aln15HY5CZrDS
	3cH5Vvb8vJEfnPzHr4in21QKt2w7p97vx7+Is9/TJsxVqmCd3kosVFUa
X-Gm-Gg: AeBDietagfCdi881ugqzydp2mNDPLpd2GPfd5enW0Y/aC+VqNeXG9cxVifn662fpbiO
	EAkv4UPy03Z0UvPnX0Q4ZoepT7RwD0+t/R6/7uvEmJU3lEHUIk5NFhJrdmoV4W1mt1iD61NYJTF
	vg/1rE1ouXmEhmICyrUUrGAq+YtmuK45C0C6scf5DOFwM4rvqXtz9VREBSX9JhZ6zE3qah6VC58
	/nwSqd6W4fpQaKQ8ybwGJ+CuieZ+Xm/CcWSgwtQc52uaD00Jxbg1FAYwlANe0wk2864fhjDt6Q/
	wC/mvxZnbMknuc+tfHvT2vN4pdnUXexeeM9AOw/rt1ClQoa3ORAPlBuENXrMF2y7q4U65vIaL2Y
	CiGONgqBiG2PyR7Dwo3USodMXEGM+UXgibdM6reA8E172UDKIIIDUIdYaxNcY+gS8/AHC8fNDQQ
	00r1LkLjZX1CQhYVVv6yXE/PYEEHFgwMP7lmMoMJ7A3B2tRZm2Pd2ep185DujUb1aUqwqcbKFUb
	nvnvAVEOPnVqg==
X-Received: by 2002:a05:6512:1092:b0:5a4:6f3:ddd with SMTP id 2adb3069b0e04-5a4172cc199mr6605137e87.13.1776874005025;
        Wed, 22 Apr 2026 09:06:45 -0700 (PDT)
Message-ID: <ee107b3b-0957-49b4-beb3-8467b9bb7476@gmail.com>
Date: Wed, 22 Apr 2026 18:06:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/12] xen/riscv: rework G-stage mode handling
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1775836193.git.oleksii.kurochko@gmail.com>
 <94c914766171b732524d2d64c283e566595a4d22.1775836193.git.oleksii.kurochko@gmail.com>
 <d03f915e-8066-42dc-aac0-14ac6eb523f7@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <d03f915e-8066-42dc-aac0-14ac6eb523f7@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1776874006-91F84D75-73310388/10/73395122804
X-purgate-type: spam
X-purgate-size: 1651
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
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	MAILSPIKE_FAIL(0.00)[192.237.175.120:query timed out];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 2243D4483E2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/21/26 11:39 AM, Jan Beulich wrote:
> On 10.04.2026 17:54, Oleksii Kurochko wrote:
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
>> +static const struct gstage_mode_desc modes[] = {
> 
> As before, I'm of the clear opinion that this is too generic an identifier
> for use at file scope.

I can rename it to gstage_modes or p2m_modes to make it better suite 
file scope.

>> --- a/xen/include/public/arch-riscv.h
>> +++ b/xen/include/public/arch-riscv.h
>> @@ -56,6 +56,11 @@ typedef struct vcpu_guest_context vcpu_guest_context_t;
>>   DEFINE_XEN_GUEST_HANDLE(vcpu_guest_context_t);
>>   
>>   struct xen_arch_domainconfig {
>> +    /*
>> +     * G-stage MMU mode for the guest (e.g. "sv39", "sv48", "sv57").
>> +     * Must be set; an empty string is invalid.
>> +     */
>> +    char gstage_mode[8];
>>   };
> 
> I have to say that I find it odd to use a string literal for this purpose.
> Specifying the number of wanted address bits would feel more natural. Plus
> the strings named aren't valid G-stage modes afaict - they lack the x4.

I will change it to unsigned char gstage_mode and put there on of the 
value of HGATP_MODE_SV39X4, HGATP_MODE_SV48X4. Or just address bits as 
you suggested will be fine too.

~ Oleksii



