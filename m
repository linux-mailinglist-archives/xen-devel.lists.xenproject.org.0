Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SCUXIYm3gWkrJAMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 03 Feb 2026 09:53:29 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE44ED66BD
	for <lists+xen-devel@lfdr.de>; Tue, 03 Feb 2026 09:53:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1219149.1528084 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnC90-0003Lr-AQ; Tue, 03 Feb 2026 08:52:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1219149.1528084; Tue, 03 Feb 2026 08:52:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnC90-0003JB-7f; Tue, 03 Feb 2026 08:52:22 +0000
Received: by outflank-mailman (input) for mailman id 1219149;
 Tue, 03 Feb 2026 08:52:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qAHx=AH=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vnC8z-0003J5-1U
 for xen-devel@lists.xenproject.org; Tue, 03 Feb 2026 08:52:21 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a57cc44f-00dd-11f1-b161-2bf370ae4941;
 Tue, 03 Feb 2026 09:52:19 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-482f454be5bso4053795e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 03 Feb 2026 00:52:19 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-67-101.play-internet.pl.
 [109.243.67.101]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4830512e0edsm51215485e9.7.2026.02.03.00.52.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Feb 2026 00:52:17 -0800 (PST)
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
X-Inumbo-ID: a57cc44f-00dd-11f1-b161-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770108738; x=1770713538; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QAGfZkbffxOOgsUsGUNz4+gz5ensEn9F2e4yPKGBSQg=;
        b=DLu2xRmBjNH7VWActuPgN17Gz+hI28lfAdTCEA7f5MZPF+WD984N06Xzv6f19itloy
         w6RrxG28dAVxzR2qNNpphzP5izcOnyrUJX/NxxggzyGTBIm6z9iNV/THlndZQn2drpkh
         lrB4imYfi+lULqUmuhbEiB6aFriSdFZaQAUyPjPmsf8iCPSKZW3u5Kwg+nLui2FGmqjn
         EXyH78AgBFScL+c+aNqJt/aMpQ9XzgwRfsmqiuCbHEqHRHmAabNz1xggDHlgD35Sx8HE
         iGXt8UR/wAKVSPSk+Y7ooxip/j+WOdjdcfVD27Nw7ISX6B2p4xmODpDpDoGY3lzM6tU/
         Ecvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770108738; x=1770713538;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QAGfZkbffxOOgsUsGUNz4+gz5ensEn9F2e4yPKGBSQg=;
        b=qEQP8qB66u2/6sMgb8IjUIhiCscG1hJhtKsp4SsEpWKjVI/cq0fzqHE8lPYKUKIgTy
         3ZfriAIHCP4pxvbTr7au2IZ9IvisjcS7rb3P8otUdwDKjvEJXhl8XSn7N2UiZ1G1yN0J
         ddrtEqbJ00SQrVmfJXNC2xZr0REANv2yJKKTqBtA6tgSSksd+B4A9Bw+3Jkm9szXbWvs
         NaP6MqW2EYyOVaLKflpqPsICetdk9qvr2RXiD3TgqXH9E+8wTjAqgXg/Q+cbXTH/v+nq
         iH1lWAwpeCPZKIsrFscNvVR7mqAkJ/9fhZjeoPLZzkr4snNMjWbiYCj6KR6djCUdAgwE
         PQsQ==
X-Forwarded-Encrypted: i=1; AJvYcCUWVbkHj7wWzj8EBcC0i0evXW5VmG1iOf8sTPvGIrlq1Wb3GODjW+1SFLkkqc+IIRfMZxdS7aF/8fo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxM7uIuTGMCeL2s7ABBSYNoo/VZiRoyJnsbo6lQZV2yHBrC4Fvx
	mtauChkl8S6cP26IneLXgwfGsg5a15FewcuDOBlKybP0EXHIb2chwBX2
X-Gm-Gg: AZuq6aI8vpWSxthYlmcgKSQtcGwF3SyJQfiVVOR2XW1+ox4D7fLxalaI46BSVuREbSn
	Nx9/JVXGBYvukc5uOoDBT8k1kG381BezmyZpNJGQhNQKPwUBqcEdccvhI98+XuikE0MjUAxufk+
	8rIkZnNUmg52EAoGbjzS7dG3ZKfIQ0D4vFNBnCJP5CpIMzjE5z8k1Y3A0rqAIRBRxq233y12zUj
	BsYUIIbIfze3Yw96KitCc7B1vUfCEy7NDTPHxZhbE9b67HBrXDLto6r0WbYJeT5WUZvtUhsPSu8
	QOJbKbaEUDv+a29C11mc7nDXJo1eULvnWJ/HyNlUofq2db9gy1bCAn9fGbY9fhbhCqmP+kwoNw5
	cEcgPMtpvzEQ7E54dga+c7wQD7gsn4BDB3BAsTsZkbJMaaYAaYlRM6DJskYhhNSUVdklDHiwoKH
	GQxOJRU7p7jCOEpsWobZ5rMsstfwA1+l5ifZ3chcpw9V2KMjvzNSqbWopAnhYy/tt+brOKQIaBP
	Q==
X-Received: by 2002:a05:600c:6303:b0:47e:e59c:67c5 with SMTP id 5b1f17b1804b1-4830513aed8mr37686575e9.8.1770108738194;
        Tue, 03 Feb 2026 00:52:18 -0800 (PST)
Message-ID: <404d5f05-99e4-41a6-971f-a2b18c4147b0@gmail.com>
Date: Tue, 3 Feb 2026 09:52:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] xen/riscv: introduce struct arch_vcpu
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1770036584.git.oleksii.kurochko@gmail.com>
 <98214488c67fac866ba519c368aef697da2d2bb6.1770036584.git.oleksii.kurochko@gmail.com>
 <f0773662-808c-44d2-b4c7-8858fb8d365c@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <f0773662-808c-44d2-b4c7-8858fb8d365c@suse.com>
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
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:xen-devel@lists.xenproject.org,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,lists.xenproject.org,xen.org,kernel.org];
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
X-Rspamd-Queue-Id: DE44ED66BD
X-Rspamd-Action: no action


On 2/2/26 3:08 PM, Jan Beulich wrote:
> On 02.02.2026 13:57, Oleksii Kurochko wrote:
>> --- a/xen/arch/riscv/include/asm/domain.h
>> +++ b/xen/arch/riscv/include/asm/domain.h
>> @@ -24,6 +24,55 @@ struct arch_vcpu_io {
>>   
>>   struct arch_vcpu {
>>       struct vcpu_vmid vmid;
> Nit: This being already here contradicts the title saying "introduce".

I'll update then the commit message.

>
>> +
>> +    /*
>> +     * Callee saved registers for Xen's state used to switch from
>> +     * prev's stack to the next's stack during context switch.
>> +     */
>> +    struct
>> +    {
>> +        register_t s0;
>> +        register_t s1;
>> +        register_t s2;
>> +        register_t s3;
>> +        register_t s4;
>> +        register_t s5;
>> +        register_t s6;
>> +        register_t s7;
>> +        register_t s8;
>> +        register_t s9;
>> +        register_t s10;
>> +        register_t s11;
>> +        register_t sp;
>> +        register_t ra;
>> +    } xen_saved_context;
>> +
>> +    register_t hedeleg;
>> +    register_t hideleg;
>> +    register_t hvip;
>> +    register_t hip;
>> +    register_t hie;
>> +    register_t hgeie;
>> +    register_t henvcfg;
>> +    register_t hcounteren;
>> +    register_t htimedelta;
>> +    register_t htval;
>> +    register_t htinst;
>> +    register_t hstateen0;
>> +#ifdef CONFIG_RISCV_32
>> +    register_t henvcfgh;
>> +    register_t htimedeltah;
>> +#endif
> When you add these right away, any reason other high-half registers aren't added
> as well? HVIP (above) and VSIE / VSIP at the very least have such counterparts,
> iirc.

No specific reason. It was added early in the RISC-V port when I was considering
supporting RV32, but as you know I later decided to focus only on RV64, at least
for now. Therefore, it seems better to drop this `#ifdef` from the `arch_vcpu`
structure and re-introduce when RV32 support will be added.

>
>> +    register_t vsstatus;
>> +    register_t vsip;
>> +    register_t vsie;
>> +    register_t vstvec;
>> +    register_t vsscratch;
>> +    register_t vscause;
>> +    register_t vstval;
>> +    register_t vsatp;
>> +    register_t vsepc;
>>   };
> What I'm generally concerned of: With the registers all being put here in one go,
> without any of them actually being used in this patch, it'll likely be harder to
> track that they're saved / restored / initialized correctly (once uses appear).

Then if it will really better I'll introduce in this patch series only vsatp register
as it is used in the further patches. (or even will just introduce vsatp in Patch 3)

I will keep the patch [1] separately in the patch series with introduction of vtimer
things and drop only an introduction of vsatp there.

[1] https://lore.kernel.org/xen-devel/cover.1769099883.git.oleksii.kurochko@gmail.com/T/#ma33af3ff4b2b033f86aa964902ebcab8705fd114

~ Oleksii


