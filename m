Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SB31GD0Tg2kPhQMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 04 Feb 2026 10:37:01 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7EE6E3ECC
	for <lists+xen-devel@lfdr.de>; Wed, 04 Feb 2026 10:37:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1220308.1529019 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnZJS-0006Jo-7y; Wed, 04 Feb 2026 09:36:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1220308.1529019; Wed, 04 Feb 2026 09:36:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnZJS-0006Hk-4O; Wed, 04 Feb 2026 09:36:42 +0000
Received: by outflank-mailman (input) for mailman id 1220308;
 Wed, 04 Feb 2026 09:36:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ke1/=AI=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vnZJR-0006He-6T
 for xen-devel@lists.xenproject.org; Wed, 04 Feb 2026 09:36:41 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 01437435-01ad-11f1-9ccf-f158ae23cfc8;
 Wed, 04 Feb 2026 10:36:39 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-43615d9c507so911854f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 04 Feb 2026 01:36:39 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-67-101.play-internet.pl.
 [109.243.67.101]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-436180640f2sm4813162f8f.39.2026.02.04.01.36.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Feb 2026 01:36:37 -0800 (PST)
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
X-Inumbo-ID: 01437435-01ad-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770197798; x=1770802598; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d8FhrIYvrBOrKBYpV2bfmalL8B4kMQdKJZx2ydgP9aU=;
        b=QZAM78nkocSE8OFlsXHtVQRCzA8xN4kUP162J3BXDBWEweakr3JifgEy15nFM0B3Yl
         w3/EZwdsmcv9VHV0Mtf4R4r5NOPrLXnPDHhq2G+azwD5eHiyygYXvh3pMUoyvq3gmvxD
         PEQPZSKT9D2NHh1d7Kj2uUOoJVLc254cOINidhSD/FrCcqC6f0ln3jFgVrQE+dd22Bkf
         CYN123CVWylnWD+wxTF1VMILXZNHSMb8iVkrkTs1DhetZexec6/OuK7yJOlQKOmtvkIT
         9ivCZUdpaqV6NY40zN9YCNXl47peF+4iPiB28ElUOeTOtp5AhtEItf4v7OVzJal8w4vK
         9nFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770197798; x=1770802598;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d8FhrIYvrBOrKBYpV2bfmalL8B4kMQdKJZx2ydgP9aU=;
        b=gpCBY+jWS9psXnLDVxqoxMGiLxKvaMo2n7IVHZPVPIRpYFYv2ND+Uzj5tzwZlIvGUn
         y7+PPNdvXcnaaoPJydHIHmnzvQoIFgg5Y+JKTYnHp5Ksi6vHgvoYhyCVrj+3pdvEkoPP
         ssSHbJtW4qeDoHHQUpBuMmDXtS72HVyeMbKgi7nqaaSZxEGB2yozzdltU5083CqVKnYH
         3IfXU46MdQrIzmAmfa0GCfuWEQ1Vm7nY+s5GDBbhLBkOzmUXgqMrwXo6L4GO8Uey1w9U
         SaOdrPMqn9VpgHIzwq5MdFvDbPpyRkpzwQlbR80Qmn4sB7k80DzzLhm7YSjtLw4fc/fk
         aC2A==
X-Forwarded-Encrypted: i=1; AJvYcCU7+BU55iWNUKRBoqMojKRredmQJPzoZaBzBrL5abtCgCEr8FpARRvAL/DNEtFU56KuoVAAa/TCaJI=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz1jnYtVbTnVKlrCXs94Fg/JpsmT1TMsm/5FsEuktSoqAcHYaRS
	jPdO6fEZD8W6eXO5RaKt8QfQpQSTL+q2F1pgIt1ZF9KEy+f+W8ZliOtu
X-Gm-Gg: AZuq6aIHtHer6bPKQi3VJfg1myhqC9Q3zHJvgSMsHbZ5jeUrfxlrc+x25KTwvHKUkhT
	Lwv89KHaHKndSw0oTSY8wMoVNQsPPQrfMQVBsHL4Nlb/MF2f858+QaWIt7UAVlIWfdjBoYxosiE
	RozxyT01DViLgnPZIBnTa/6745zwYSvd4Zdno3GxwEJFVOS51JPfAtmdmIrwl0D9axs5bivRN4a
	W/syRiG/nSy8I56U88WGq6I+5AKwSTbg/v5K3yyceXVMG0Y9Kn0ZUUwxH8nZxoHERJDN11yxotp
	tCG9X7uXqe1yxdp2qPIo/jfFhbekbOZK8IwESNhZk5/sySY37DYJekduD6iivwjx/h3/afLFD+n
	wTyPLJCM/IHVGNOKPYFD0BFmGTTcusT3MxfV+5j7hhiUXk/FA0cJ3JpApx/slL9O5K6ld3VHV/G
	tFGl9gEJPUo1cGOUFReoKZaLKWEOsEtfXnV0HOVA3d/riOf2Wb7LljofdP5C8bq6s=
X-Received: by 2002:a05:6000:4211:b0:430:8583:d182 with SMTP id ffacd0b85a97d-436180575efmr3336352f8f.29.1770197798153;
        Wed, 04 Feb 2026 01:36:38 -0800 (PST)
Message-ID: <b960f295-6143-4947-bcc5-529ed3cf6f99@gmail.com>
Date: Wed, 4 Feb 2026 10:36:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/16] xen/riscv: introduce sbi_set_timer()
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Romain Caritey <Romain.Caritey@microchip.com>, xen-devel@lists.xenproject.org
References: <cover.1769099883.git.oleksii.kurochko@gmail.com>
 <2fd4da2ad7c4af2241368edba739b24d0e976552.1769099885.git.oleksii.kurochko@gmail.com>
 <a8ab7bd7-3e17-43e2-bbe1-3503b6eda7ac@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <a8ab7bd7-3e17-43e2-bbe1-3503b6eda7ac@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:Romain.Caritey@microchip.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,microchip.com,lists.xenproject.org];
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
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: C7EE6E3ECC
X-Rspamd-Action: no action


On 2/4/26 7:50 AM, Jan Beulich wrote:
> On 22.01.2026 17:47, Oleksii Kurochko wrote:
>> --- a/xen/arch/riscv/include/asm/sbi.h
>> +++ b/xen/arch/riscv/include/asm/sbi.h
>> @@ -29,6 +29,10 @@
>>   
>>   #define SBI_EXT_BASE                    0x10
>>   #define SBI_EXT_RFENCE                  0x52464E43
>> +#define SBI_EXT_TIME                    0x54494D45
>> +
>> +/* SBI function IDs for TIME extension */
>> +#define SBI_EXT_TIME_SET_TIMER          0x0
> Nit: Do you really mean to have the time extension IDs above ...
>
>>   /* SBI function IDs for BASE extension */
>>   #define SBI_EXT_BASE_GET_SPEC_VERSION   0x0
> ... the base extension ones?

I will move it after SBI_EXT_RFENCE_REMOTE_HFENCE_VVMA_ASID to be aligned with how
extensions are declared.

>
>> @@ -134,6 +138,20 @@ int sbi_remote_hfence_gvma(const cpumask_t *cpu_mask, vaddr_t start,
>>   int sbi_remote_hfence_gvma_vmid(const cpumask_t *cpu_mask, vaddr_t start,
>>                                   size_t size, unsigned long vmid);
>>   
>> +/*
>> + * Programs the clock for next event after stime_value time. This function also
>> + * clears the pending timer interrupt bit.
>> + * If the supervisor wishes to clear the timer interrupt without scheduling the
>> + * next timer event, it can either request a timer interrupt infinitely far
>> + * into the future (i.e., (uint64_t)-1), or it can instead mask the timer
>> + * interrupt by clearing sie.STIE CSR bit.
>> + * The stime_value parameter represents absolute time measured in ticks.
>> + *
>> + * This SBI call returns 0 upon success or an implementation specific negative
>> + * error code.
>> + */
>> +extern int (*sbi_set_timer)(uint64_t stime_value);
> __read_mostly or even __ro_after_init?

I will add __ro_after_init to be in sync with sbi_rfence.

>
>> @@ -326,6 +358,14 @@ int __init sbi_init(void)
>>               sbi_rfence = sbi_rfence_v02;
>>               printk("SBI v0.2 RFENCE extension detected\n");
>>           }
>> +
>> +        if ( sbi_probe_extension(SBI_EXT_TIME) > 0 )
>> +        {
>> +            sbi_set_timer = sbi_set_timer_v02;
>> +            printk("SBI v0.2 TIME extension detected\n");
> Is this really relevant to log especially in release builds? IOW can this at
> least be downgraded to dprintk()?

Probably not, it could be useful for debugging to understand what kind and version
of extension is used. I am okay with using of dprintk().

Thanks.

~ Oleksii


