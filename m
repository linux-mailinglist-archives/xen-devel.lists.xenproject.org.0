Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D0387F9F42
	for <lists+xen-devel@lfdr.de>; Mon, 27 Nov 2023 13:08:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.642025.1001072 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7aPn-0006cE-MY; Mon, 27 Nov 2023 12:08:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 642025.1001072; Mon, 27 Nov 2023 12:08:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7aPn-0006aH-Ja; Mon, 27 Nov 2023 12:08:39 +0000
Received: by outflank-mailman (input) for mailman id 642025;
 Mon, 27 Nov 2023 12:08:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hhMp=HI=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1r7aPl-0006WS-PI
 for xen-devel@lists.xenproject.org; Mon, 27 Nov 2023 12:08:37 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b1166611-8d1d-11ee-9b0e-b553b5be7939;
 Mon, 27 Nov 2023 13:08:36 +0100 (CET)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-333030a6537so329911f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 27 Nov 2023 04:08:36 -0800 (PST)
Received: from [10.80.4.253] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 e2-20020a5d4e82000000b0032d893d8dc8sm11869959wru.2.2023.11.27.04.08.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Nov 2023 04:08:35 -0800 (PST)
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
X-Inumbo-ID: b1166611-8d1d-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1701086915; x=1701691715; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6LYqMCRLIUgHv0pWFBtHxSHZ2T9QlV3NnXMKmuv+8Yo=;
        b=KZjROAfF815hwkmHVx3r+y4A8gQ8Aj0echfCkW1TbfjuhRBcyWAyTCueQtsQdHpSiT
         Zwxd8QcpF1uR9J1kcVXHb07BqJi+fB/0Ti6oK1tJU8gERFOCj6674IJ05XbihwRpxI97
         gALq00VLcitPnWfe8lVbt1hMIrUKHoposDJgw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701086915; x=1701691715;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6LYqMCRLIUgHv0pWFBtHxSHZ2T9QlV3NnXMKmuv+8Yo=;
        b=i2obkaUnsOAn0ht5YSclKVTIHaId8ywmEXmmnKELbO6Bt4vcmD6Qw625uy1ufyDqn+
         Xu2+erXsVqJZPttQ33FElm3fa6cCTNBYONVUrRbdtA38lkvAFGS6zjZXd38PdAmqjbGE
         /qM1i5ecX2P0NZhI3oz1pVPbHPzIKyjSkolT4HU9hj8LR96rP10Nek1/yMSsjZwAAfbG
         l0lqncCpEVIjCEibcF9JVCdahJ3HT8RnqTDDGn5tVvAnRZAz84/XHBojBXd39gh+on17
         OgrDzX9bcoE4Me5pBlXjzkxtSGRtcag10r8AjaFltr7FanlgIIdMUeXs8ehycUfgil+7
         uRWg==
X-Gm-Message-State: AOJu0Yys02uDog3bjfZvfAhDVBjOEoYEPvJZ5gXhEGnXhPGgjVl00Oto
	cv3n+SM418CwJeULY5OXHtHEag==
X-Google-Smtp-Source: AGHT+IGFY84REDSslq0VvQoZpogf2Q/URvIgrtPBUjETspUr/b2q+hsgARritCxRbtiEZB+DBhJGsQ==
X-Received: by 2002:a05:6000:120f:b0:333:86d:c28a with SMTP id e15-20020a056000120f00b00333086dc28amr283829wrx.40.1701086915584;
        Mon, 27 Nov 2023 04:08:35 -0800 (PST)
Message-ID: <f028ce00-207a-41b7-b2b2-dff25d7fe7c2@cloud.com>
Date: Mon, 27 Nov 2023 12:08:34 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] xen/x86: On x2APIC mode, derive LDR from APIC ID
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <20231123173057.1325-1-alejandro.vallejo@cloud.com>
 <e96e7f7b-d2d5-496a-9a2b-e8da2017a282@citrix.com>
Content-Language: en-US
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
In-Reply-To: <e96e7f7b-d2d5-496a-9a2b-e8da2017a282@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 24/11/2023 22:05, Andrew Cooper wrote:
>> diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
>> index 5cb87f8649..cd4701c5a2 100644
>> --- a/xen/arch/x86/hvm/vlapic.c
>> +++ b/xen/arch/x86/hvm/vlapic.c
>> @@ -1061,13 +1061,26 @@ static const struct hvm_mmio_ops vlapic_mmio_ops = {
>>       .write = vlapic_mmio_write,
>>   };
>>   
>> +static uint32_t x2apic_ldr_from_id(uint32_t id)
>> +{
>> +    return ((id & ~0xf) << 12) | (1 << (id & 0xf));
>> +}
>> +
>>   static void set_x2apic_id(struct vlapic *vlapic)
>>   {
> 
> const struct vcpu *v = vlapic_vcpu(vlapic);
> 
> seeing as you've got the expression used twice already.
> 
> With that, the following logic is shorter too; you can get away with
> dropping the vcpu_id variable as v->vcpu_id is the more common form to
> use in Xen.

Twice? I can see a vague raison-d'etre in lapic_load_fixup(), but
there's a single occurence here.

> 
>>   We must preserve LDRs so new vCPUs use consistent
>> +         * derivations and existing guests, which may have already read the
>> +         * LDR at the source host, aren't surprised when interrupts stop
>> +         * working the way they did at the other end.
>>            */
>> -        if ( GET_xAPIC_ID(id) != vlapic_vcpu(vlapic)->vcpu_id * 2 ||
>> -             id != SET_xAPIC_ID(GET_xAPIC_ID(id)) )
>> -            printk(XENLOG_G_WARNING "%pv: bogus APIC ID %#x loaded\n",
>> -                   vlapic_vcpu(vlapic), id);
>> -        set_x2apic_id(vlapic);
>> -    }
>> -    else /* Undo an eventual earlier fixup. */
>> -    {
>> -        vlapic_set_reg(vlapic, APIC_ID, id);
>> -        vlapic_set_reg(vlapic, APIC_LDR, vlapic->loaded.ldr);
>> -    }
>> +        vlapic_domain(vlapic)->arch.hvm.bug_x2apic_ldr_vcpu_id = true;
>> +    else
>> +        printk(XENLOG_G_WARNING
>> +               "%pv: bogus x2APIC loaded id=%#x ldr=%#x (expected ldr=%#x)\n",
> 
> %pv: bogus loaded x2APIC ID %#x, LDR %#x, expected LDR %#x\n
> 
> If you properly capitalise x2APIC, you should capitalise ID and LDR.
> The other changes are matter of taste, but make for a less cluttered log
> message IMO.
> 

"bogus x2APIC loaded" is meant to be a sentence followed by key-value 
pairs. Uppercasing the keys is fine (albeit unnecessary, IMO), but you 
choice of word order feels backwards.

> 
> This is a long list of minor niggles, but they're all style/comment
> issues, and nothing to do with the logic itself.  I'm happy to fix them
> all up on commit, and here is the result with them merged:
> 
> https://xenbits.xen.org/gitweb/?p=people/andrewcoop/xen.git;a=commitdiff;h=953dcb0317d20959ffee14e404595cfbb66c607a
> 
> for you to glance over.
> 
> ~Andrew

Except for the 2 bits pointed out, the others are cosmetic changes
I don't particularly mind. Jan spotted a typo in the second comment 
block in lapic_load_fixup() that should be corrected too.
(s/fix fix/fix/)

Cheers,
Alejandro

