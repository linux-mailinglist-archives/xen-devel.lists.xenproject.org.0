Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WPGyDZted2n8eQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jan 2026 13:31:23 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96EFF88442
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jan 2026 13:31:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1213685.1524147 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkLk7-0003Fp-Vp; Mon, 26 Jan 2026 12:30:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1213685.1524147; Mon, 26 Jan 2026 12:30:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkLk7-0003Cx-SX; Mon, 26 Jan 2026 12:30:55 +0000
Received: by outflank-mailman (input) for mailman id 1213685;
 Mon, 26 Jan 2026 12:30:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zrcg=77=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vkLk6-0003Cr-1q
 for xen-devel@lists.xenproject.org; Mon, 26 Jan 2026 12:30:54 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d9f4e3b0-fab2-11f0-9ccf-f158ae23cfc8;
 Mon, 26 Jan 2026 13:30:51 +0100 (CET)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-6505d3adc3aso5889066a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 26 Jan 2026 04:30:51 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-67-101.play-internet.pl.
 [109.243.67.101]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b885b419642sm631794466b.28.2026.01.26.04.30.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Jan 2026 04:30:50 -0800 (PST)
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
X-Inumbo-ID: d9f4e3b0-fab2-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769430651; x=1770035451; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EyildIuXxv/uG9YHlNUGiziuUzm2zMO0Buecs/Heoz8=;
        b=XXSmocMugVn8lPobBSD4PZmOmK3BUYeFyGPL5oZ32afYWL59ihbR7HDqspJVKJWXB7
         a7igBr20k+zOr+U6RtDXnHQf7VTwVMhOSl01jr3JAu8L31u0jcjXZ3eN9ycBplSkOhuc
         0xUmhVhsquTeZ57NleNSJFWwITIXiZ/ZfJL7sv2h1W3hZ7LJa5gx4RtYSc2KYt+3amGY
         rVPk+4KD2aMupBCLMZRh6KOa9GuNld1n6YV6XklCIC0HJHvk5rDCsUAI1/2ErKlvQWlq
         gpp7LT7W8an4e+6eNi6kyDYbvBzH5gDIJwxaXNOFZWal6zwwEPavPDwd6sRV5E0FWNGM
         Bxjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769430651; x=1770035451;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EyildIuXxv/uG9YHlNUGiziuUzm2zMO0Buecs/Heoz8=;
        b=YK+4fS3pL5aaEmKwX4Ue91Hae+IEJYSAcI7qpqDeHYo/NerikYxhw3P04AG3MoNhIp
         AH6nkKfAAJjnXRjS9qFboFBn1FgJK8cCkaNBkWRbx4YSOSUrZNWi3iev5R74ITMGxoE/
         9t122WWfTD5DCmkOKNMe73nAMjJKqafn6J/vE/n7yOj3QQ+NX0r2QSfHCPSMvbnAJM6r
         WIuxrftJUDotIV5VcHhf8pDERgOORa06NR5BrcD1dKcQlYhwCaQAw5erYePwsIh4YrCQ
         C8M8WmFZIoKNfG8/NSVw8vBLdKyMU37jiQkCG7ePnZc/YgYU1jxpd4V0Efu9IHMr/tG1
         G/iA==
X-Forwarded-Encrypted: i=1; AJvYcCX6jzl49e3Q6T8N35YRyw0tI/Tp2GkNrot/2Ft4+WhHUYGjr3Awf0bb/KF62n5U0QZsSNqC0RTVCWA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxpJ1ckFS62VNIFLZUG3PJQeSat0cNLBTfYFHxytn1gYUby2skU
	gnovd14XYonlZGORMF1lwqvdoG1Dz+FE4LLi5VfwELrdRlmkpjMMAASy
X-Gm-Gg: AZuq6aIwdUbs24BAMMPEKy+cjy3UUFh7USsqlxH+B7o7gXBD375S3RmpKMttKWBbChl
	ToG3dVqG5fqAJSlpeXU/vMPtGXspRWdBpLxRomCXHuDjtDn+CZRjh7WczXGNYjjCbHoAPDYBgiF
	Czx4NFcFwixCqSWlLfGLorSu4cqk0rkYG3ympPNFV00uTggdMMgvrTEUIjSS86BwQCBdYbQSC2L
	k3k2Zu/I+6K6jxND0L7QlHX4mCUZEUQrajAuBi7oIRdXMwUOuGe8T7wmgR9b8NwZ2ps1fH0EGuD
	8gRlYy0LsErSnvvSQbwQ3YSpBTNgoBUY5sa3vJmF0LI1FOt+JgZI5FLCOhRAp1627lYTJNE9BAJ
	W/n3NFC5CwNFoWbo9EBZ+84oeGNP7U9aYaK8U6Pdo8Bys/ZhQm1KXqIkZ2GWqYHXzi9MlMJ1/mC
	RXTpM9WpPrFfeXF5uQtcMPffXQDT/yTguRi03h232BmnN5z31bLchqOFuG9H6rsWU=
X-Received: by 2002:a17:906:c14c:b0:b76:8164:88b5 with SMTP id a640c23a62f3a-b8d2e841f12mr317774666b.46.1769430650926;
        Mon, 26 Jan 2026 04:30:50 -0800 (PST)
Message-ID: <20f2bf2c-9b28-4a60-ad35-9640f5d3dfad@gmail.com>
Date: Mon, 26 Jan 2026 13:30:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/16] xen/riscv: introduce struct arch_vcpu
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
 <ef706b474a23cb24a7bc119f8206e9df527b7287.1769099885.git.oleksii.kurochko@gmail.com>
 <e4801098-4525-40a7-91e2-7ffeb7a6d859@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <e4801098-4525-40a7-91e2-7ffeb7a6d859@suse.com>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,riscv-non-isa.github.io:url];
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
X-Rspamd-Queue-Id: 96EFF88442
X-Rspamd-Action: no action


On 1/26/26 12:41 PM, Jan Beulich wrote:
> On 22.01.2026 17:47, Oleksii Kurochko wrote:
>> --- a/xen/arch/riscv/include/asm/domain.h
>> +++ b/xen/arch/riscv/include/asm/domain.h
>> @@ -22,9 +22,62 @@ struct hvm_domain
>>   struct arch_vcpu_io {
>>   };
>>   
>> -struct arch_vcpu {
>> +struct arch_vcpu
>> +{
>>       struct vcpu_vmid vmid;
>> -};
>> +
>> +    /*
>> +     * Callee saved registers for Xen's state deep in the callframe used to
>> +     * switch from prev's stack to the next's stack during context switch.
>> +     */
> What is "deep in the callframe" intended to convey? I'm in particular wondering
> about ...
>
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
>> +        register_t gp;
>> +        register_t ra;
> ... sp and ra, which presumably don't live anywhere "deep"?

context_switch() is invoked relatively deep in the call stack, so the stack
pointer in use when context_switch() executes can also be considered to be
deep in the call frame. The same applies to RA: after the first
__context_switch() call, RA will point to the next instruction within
context_switch().

I can update the comment and drop the wording about being “deep in the call
frame” to avoid confusion. In that case it would simply read:

+    /*
+     * Callee saved registers for Xen's state used to
+     * switch from prev's stack to the next's stack during context switch.
+     */

>
> Also, what about tp? The 't' in there isn't the same as that in "t0", "t1", etc.

tp stores pcpu_info[] and it isn't expected to be changed during (or between) function
calls.
In this structure we are dealing only with registers which should be saved according
to RISC-V ABI convention:
  [1] https://riscv-non-isa.github.io/riscv-elf-psabi-doc/#_integer_register_convention
The exception is for RA (as it is also used to jump to continue_to_new_vcpu() when vcpu is scheduled
first time). During a review of the [1], I think that GP could be dropped as it shouldn't
be preserved across calls.

>
>> +    } xen_saved_context;
>> +
>> +    /* CSRs */
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
>> +
>> +    /* VCSRs */
> Why the V? These are normal CSRs dedicated to VS use, aren't they?

I meant VSCSRs, yes, it is normal CSRs dedicated to VS use.
I'll drop the comment as from the name it is clear that VS-mode CSRs.

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
>> +}  __cacheline_aligned;
> I continue to question the presence of this attribute.

I will drop it until I could really measure that it boosts performance.
At the moment, it is just an assumption.

~ Oleksii


