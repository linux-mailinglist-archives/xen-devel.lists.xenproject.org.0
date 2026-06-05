Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /U7sA36NImpsaAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 05 Jun 2026 10:49:02 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D97E646904
	for <lists+xen-devel@lfdr.de>; Fri, 05 Jun 2026 10:49:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=GG58tRBB;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1329232.1593436 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVQEL-0001Y8-Mg; Fri, 05 Jun 2026 08:48:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1329232.1593436; Fri, 05 Jun 2026 08:48:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVQEL-0001WQ-JI; Fri, 05 Jun 2026 08:48:41 +0000
Received: by outflank-mailman (input) for mailman id 1329232;
 Fri, 05 Jun 2026 08:48:40 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wVQEK-0001WK-0v
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2026 08:48:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wVQEJ-00A8ka-DJ
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2026 10:48:39 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a228d67-5cb7-0a2a0a5109dd-0a2a450893fc-2
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 10:48:39 +0200
Received: from [209.85.221.53] (helo=mail-wr1-f53.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a228d66-63b5-0a2a45080019-d155dd35a843-3
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 10:48:39 +0200
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-45ef5146b56so1755409f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 01:48:39 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490bc3cc0f8sm140552815e9.8.2026.06.05.01.48.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Jun 2026 01:48:37 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1780649318; x=1781254118; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fFFMkiV3OpdVx4/iAhK/+ENDZ6duH2ourMHbDBTLvAo=;
        b=GG58tRBBPaQeqtxc6seFYLGPZwzOqNDCWhVo8FC/o10Ova9UVvXNIJTqkXt1HCH02b
         uaGcGdMcGDlrwGikdpVsvlhvoLi86JO+E/Vif/x9tjSyvPfVzXso06j9Kg1cQ00zUHIQ
         yVA3WLOnx3lx4xT7ZkNwfkMPUMqKNyLYgbrFVtloqCpw0JlBKGYJKW0XK/qB0Ei119M5
         LJH5uZ1ztQKh4x0aMHJKOG/NAbVkI3w/X/y6QTQRDKAXL8OgC1MR+zio3rXjBsT+642f
         rgxmkueMMUzLkiRmZTQZHFpGXiDVfxCLMgBSAnUqsUX7dg8XkgqygPQa/lrrYYXH5VK2
         +ozw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780649318; x=1781254118;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fFFMkiV3OpdVx4/iAhK/+ENDZ6duH2ourMHbDBTLvAo=;
        b=iE1NnvSkl0P0LAuMWTeCvytqZZg2+tvFNASw7moUPoET3QwQrA5sMQqOsRQvoC1n55
         y25leHYsJCsqYh97iXZxwirfGGL+TIyW3AdHxAmVqq1rS6l8pw9R4ATp1UtAWW7eTx+A
         DPa5XpJJxRydeKI0BZcRQOvrD/v9js5uNoHEhNtiztraBxQKgCosZmNxBqRzLoDTGT4x
         KrEhcrX33N81YJkrqyYVxddI9Kpy7oYapC22UmIgW3wSmINBWoGu1ALEUPWxGUSYnCBH
         MhVnHZNxDQMpjcZUtdVPbdLmBpDKc9wJ6b4ewRWEzADPyxEWpmKZouw3G4VggevPJdLo
         q5Rw==
X-Forwarded-Encrypted: i=1; AFNElJ9uHHDKXzO7iw3KQ7N90VPu4g1ae2KKidlNYf12+6WBfYluTS8EHuSqGdwzZjY4uTGFmJskZTcVQEY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx3h0tzxqEvZpmf8/Nv+60MfIwdpssHbVrYGY8Yu8qsyHLdpgWL
	R64cAhXfx1WaG/8Yy4j1rsmzn58aQb05gDEi8K9e30a/xgGwIH1n4aqO
X-Gm-Gg: Acq92OFZAKs2S85EXplrJD/HrEzIkOtwQ0HNRInm+ciOflGNyflqfm/0V6puYpy7/ex
	xPeS9ZHqSsuGEiMPZrdHFgT+uQnFoYP/LshMkCIxlV4n/TVdBUAp10i99YN0tLuBQe/pERnNBha
	KBLj+FOajISO92iNX8IUro4+1bGPaA/bCNr8DzntUzfhgkDz5/rwVILnxO6wkti+t67mz1NwWdf
	Zqf119IZSLjXzMduzua9vS+Fp02BgDTT9nIHeKfiBTEZX0nu7v9nfUVoCxW5+/mhnwBLvv2FoDo
	D2SUvFgYA0OpAxHGPoUWAYnOOxa+tfKIFiqeBJ8k7YPSW5atB1NdZh05PdzRxkXketz2iFkOhv9
	/hFjXhBS0lUXIwHTw7WXdkNInu+dB/fV1llecbai4dtScWJi5dkIZZ7TL8EGHsJwOoz2zAyHXAN
	43FvCtFynSEyD+Kq+7b7w3yRCq+QBJxkeoWFdytTu5QsVItWZGV9YJC4n2nlirxNpvVrO3YgGW2
	v8u6bkMDtNc/7SK
X-Received: by 2002:a05:600c:4509:b0:490:c28c:e077 with SMTP id 5b1f17b1804b1-490c2d33c0fmr21095135e9.17.1780649318365;
        Fri, 05 Jun 2026 01:48:38 -0700 (PDT)
Message-ID: <aa3053d4-692b-49cd-8e61-40db808e6a8b@gmail.com>
Date: Fri, 5 Jun 2026 10:48:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 20/26] xen/riscv: add missing APLIC register offsets,
 masks to asm/aplic.h.
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1778250616.git.oleksii.kurochko@gmail.com>
 <736349477470f316da7020c4c1c7e92e37470d31.1778250616.git.oleksii.kurochko@gmail.com>
 <efeb7cd6-e66c-47bb-8497-d695e19dffa2@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <efeb7cd6-e66c-47bb-8497-d695e19dffa2@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1780649319-C5F80DB1-F6D99D79/10/73395122804
X-purgate-type: spam
X-purgate-size: 2779
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5D97E646904



On 6/3/26 5:36 PM, Jan Beulich wrote:
> On 08.05.2026 16:43, Oleksii Kurochko wrote:
>> --- a/xen/arch/riscv/include/asm/aplic.h
>> +++ b/xen/arch/riscv/include/asm/aplic.h
>> @@ -15,6 +15,11 @@
>>   
>>   #include <asm/imsic.h>
>>   
>> +#define APLIC_REG_OFFSET_MASK   0x3fff
> 
> This I can see this as wanting to live separately. Yet ...
> 
>> +#define APLIC_TARGET_IPRIO_MASK 0xff

This could be dropped as I don't use this mask anymore.

>> +#define APLIC_TARGET_GUEST_IDX_SHIFT 12
>> +#define APLIC_TARGET_EIID_MASK  0x7ff
> 
> ... what (set of) register(s) do these apply to? Perhaps ...
> 
>> @@ -26,6 +31,36 @@
>>   #define APLIC_SOURCECFG_SM_LEVEL_HIGH   0x6
>>   #define APLIC_SOURCECFG_SM_LEVEL_LOW    0x7
>>   
>> +#define APLIC_DOMAINCFG         0x0000
>> +#define APLIC_SOURCECFG_BASE    0x0004
>> +#define APLIC_SOURCECFG_LAST    0x0ffc
>> +
>> +#define APLIC_SMSICFGADDR       0x1bc8
>> +#define APLIC_SMSICFGADDRH      0x1bcc
>> +
>> +#define APLIC_SETIP_BASE        0x1c00
>> +#define APLIC_SETIP_LAST        0x1c7c
>> +#define APLIC_SETIPNUM          0x1cdc
>> +
>> +#define APLIC_CLRIP_BASE        0x1d00
>> +#define APLIC_CLRIP_LAST        0x1d7c
>> +#define APLIC_CLRIPNUM          0x1ddc
>> +
>> +#define APLIC_SETIE_BASE        0x1e00
>> +#define APLIC_SETIE_LAST        0x1e7c
>> +#define APLIC_SETIENUM          0x1edc
>> +
>> +#define APLIC_CLRIE_BASE        0x1f00
>> +#define APLIC_CLRIE_LAST        0x1f7c
>> +#define APLIC_CLRIENUM          0x1fdc
>> +
>> +#define APLIC_SETIPNUM_LE       0x2000
>> +
>> +#define APLIC_GENMSI            0x3000
>> +
>> +#define APLIC_TARGET_BASE       0x3004
>> +#define APLIC_TARGET_LAST       0x3ffc
> 
> ... these? And then is ...

Yes, it is applied to target register.

> 
>>   #define APLIC_TARGET_HART_IDX_SHIFT 18
> 
> ... this also covering some part of them? Can't they (a) live together and (b)
> have some kind of connection to what they apply to?

Agreed, they could live together. The intent was simply to keep all MMIO 
definitions in sequence, but I'm okay with grouping macros related to a 
specific register together.

> 
> And then why is there again a mix of *_SHIFT and *_MASK?

This APLIC_TARGET_GUEST_IDX_SHIFT - could be dropped I've already 
reworked that in different branch and use *_MASK instead so I will 
re-apply that changes in this patch. But APLIC_TARGET_HART_IDX_SHIFT is 
used in to not open-code 12 in calculation of shift value for group_index:

static void cf_check aplic_set_irq_affinity(struct irq_desc *desc, const 
cpumask_t *mask)
{
...
     value |= cpu << APLIC_TARGET_HART_IDX_SHIFT;
     value |= group_index << (lhxw + APLIC_TARGET_HART_IDX_SHIFT);

Thanks.

~ Oleksii



