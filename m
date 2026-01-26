Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kGp5BAlZd2lneQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jan 2026 13:07:37 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6346F8801D
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jan 2026 13:07:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1213667.1524117 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkLNF-0007Kp-11; Mon, 26 Jan 2026 12:07:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1213667.1524117; Mon, 26 Jan 2026 12:07:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkLNE-0007Hz-UQ; Mon, 26 Jan 2026 12:07:16 +0000
Received: by outflank-mailman (input) for mailman id 1213667;
 Mon, 26 Jan 2026 12:07:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zrcg=77=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vkLND-0007Ho-36
 for xen-devel@lists.xenproject.org; Mon, 26 Jan 2026 12:07:15 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8be1c392-faaf-11f0-9ccf-f158ae23cfc8;
 Mon, 26 Jan 2026 13:07:12 +0100 (CET)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-65063a95558so6021834a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 26 Jan 2026 04:07:12 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-67-101.play-internet.pl.
 [109.243.67.101]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6584b3e054fsm5114119a12.7.2026.01.26.04.07.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Jan 2026 04:07:10 -0800 (PST)
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
X-Inumbo-ID: 8be1c392-faaf-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769429232; x=1770034032; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d8wchK+W2lB7PEDYwYz5sSFFjyA2cgiCgvkMuw+nG2I=;
        b=WKoTGfp2SJs23kqi+voqDi7RRQnkkCLnUiI8w4Fp5s0LVPWszsbO+dFyJ+m1LnnhaD
         SapF9YXQWLRgiLHbO3oaH9m4R8qmP1seGBRePmNOfAZqT+k2ilE+ZU+AUUbeKqPIBnfp
         zXN9EwDxWbEEbDxgR439zX8hWhF9wWbGyGnWK7nV6jNNowjlwySo8uQq2j2eaVQSEcKI
         RfEMVe/CRL7ey0V9KIV2GoRKHXIE+lUrOOkckhf3tKa5+9QFGyQjoNQhXOUA6Scf+3fa
         I1dEVfC68wHiOOZdd2GYhB5K+3SNiVb6jbTIBPSDPnR0vxVBYJtdN2V/Lsrdgc/jFsWN
         6yCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769429232; x=1770034032;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d8wchK+W2lB7PEDYwYz5sSFFjyA2cgiCgvkMuw+nG2I=;
        b=QkeycGVhfnXekNTXRmSRk1JxZxU38/HWQNQbk89xJivP7Dsye85YerpPdYtDFzFkj6
         1964sAAbg6vtMVrmhS2kAnKgSzih+XZlHcH+XbUo6979EGbLbO86oBH8GaV5p8aVQ43E
         9+A2N4xYqlYCzWgIjuKN1GzkOrrO+h5KeNV73EGIOmEpe57+U4qmk/IIzKLTX6hOi4YG
         xFV/0QABLiC5swskikn7bbhql+ksBfA5HsrPInSWmEnaNgsL0gtKn/NMZ+JFAX2lpfMM
         OV3gmEKElIaxBHTNwpfgWDR7yZYKNr4r98J8DLRR9W/DwxvePqhpPVf8zBG38/wQkJGZ
         b2mQ==
X-Forwarded-Encrypted: i=1; AJvYcCUlN/jBwDARRUX14CR0g0vsmTSNwcp3ejMHcB6+oXKd8PByvtY37+FX7K/x1GvaW6C7jbSbzaM0U1g=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyTvhFGO3Ox7koD2vt8Uv0zC/LVunWix8WQD6thayIXIEhUIUHZ
	okmPX1qJI2vvRelmG9qOtMWo47r9er8G4VpJj17e43GxKYH9lmQ03g+j
X-Gm-Gg: AZuq6aLpYoJtSiKBzKlQgC0R1jD2tbd+gJf3xYrTNWmAOdmXs8vEsGBkW3eRGXkZQWN
	HJ4BFeefm0jOBmcAE9M/FfbVsmD5GAnqr3yBPsNY6cOEbPqAp26OPV3dRKd8SrbJ2ULayPsf1pp
	S4D0tYDTEwGZNblXNwLN3pmnpY92mWd958/7Y5MwZuh93VTlQ7h5jiat8gXUtgp2VqZAehUoVTH
	UIm5K932kDesAR3xlapUfROo8iUBP/NO4noRCkM5L15bvp0kcJZB22pnXfIWreS6ph1+UsjhgPf
	uYes9AY413YepeupSVNrkMDWphylTSyogJlO441SZ4GA+krSky0zS/dyNVfdoc6SuajncUqN5mV
	UdqxEg+v9vT1NElB6YWxjiMXfS/ofJqUVmbuvrjSxNYXle7GoismTUBMcwVI5Yf0krLFjNzDsKn
	Y3DRzD71zhNy19oP4Y09epxLFP+gm0pZxQnRJt/weDfoxuFaJaVfvC11kqTLlcCIg=
X-Received: by 2002:a05:6402:3547:b0:658:1a41:13c with SMTP id 4fb4d7f45d1cf-6587068091dmr2498022a12.1.1769429231339;
        Mon, 26 Jan 2026 04:07:11 -0800 (PST)
Message-ID: <72ea419e-c864-48f2-82a7-a4e0aaeb9551@gmail.com>
Date: Mon, 26 Jan 2026 13:07:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/16] xen/riscv: implement
 arch_vcpu_{create,destroy}()
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Romain Caritey <Romain.Caritey@microchip.com>,
 Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <cover.1769099883.git.oleksii.kurochko@gmail.com>
 <08b582179ebc4241140000972d89209c84c90fa4.1769099885.git.oleksii.kurochko@gmail.com>
 <4e2bf819-81f6-40f8-9bc3-c53aabf0967c@vates.tech>
 <06ee98c0-ec69-4955-a070-b0f611c8152e@gmail.com>
 <d3d3a894-4d84-47b4-b40f-604b2d3b5848@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <d3d3a894-4d84-47b4-b40f-604b2d3b5848@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[mailman];
	TAGGED_FROM(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:Romain.Caritey@microchip.com,m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,microchip.com,lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 6346F8801D
X-Rspamd-Action: no action


On 1/26/26 12:47 PM, Jan Beulich wrote:
> On 26.01.2026 10:00, Oleksii Kurochko wrote:
>> On 1/23/26 12:30 PM, Teddy Astie wrote:
>>> Le 22/01/2026 à 17:49, Oleksii Kurochko a écrit :
>>>> +    v->arch.xen_saved_context.sp = (register_t)v->arch.cpu_info;
>>>> +    v->arch.xen_saved_context.ra = (register_t)continue_new_vcpu;
>>>> +
>>> You probably also want to set the first parameter of continue_new_vcpu
>>> (struct vcpu *prev), or otherwise I don't think we want the "prev"
>>> parameter in continue_new_vcpu if it's always going to be 0.
>> It will be set by RISC-V ABI (prev will be stored in a0) when __context_switch()
>> will be called in context_switch():
>>     void context_switch(struct vcpu *prev, struct vcpu *next)
>>     {
>>       ASSERT(local_irq_is_enabled());
>>       ASSERT(prev != next);
>>       ASSERT(!vcpu_cpu_dirty(next));
>>
>>       local_irq_disable();
>>
>>       set_current(next);
>>
>>       prev = __context_switch(prev, next);
>>
>>       schedule_tail(prev);
>>     }
>> First call of the __context_switch() will lead to jump to continue_new_vcpu()
>> function which will have a0=prev.
> Problem being that none of this code exists yet, and hence it's rather hard to
> see how things will eventually fit together.

I am trying to avoid a large patch series, and this needs to be introduced
before we can implement context_switch(). At the moment, I'm trying to introduce
everything that I need for dom0less domain creation and context_switch() isn't
really needed at this stage and continue_to_new_vcpu() isn't really needed to be
implemented at this stage as well as context_switch().

The best I can do at the moment is either to write a better commit message
explaining how this will be used, or, specifically for continue_new_vcpu(), to
avoid introducing it for now and not initialise the ra register until the
remaining pieces are ready. But considering that I've already done in this way
then better commit message(s) should work.

~ Oleksii


