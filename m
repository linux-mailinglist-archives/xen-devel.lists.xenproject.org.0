Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4IF9FsWBlGniFAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 17 Feb 2026 15:57:09 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF9A714D57A
	for <lists+xen-devel@lfdr.de>; Tue, 17 Feb 2026 15:57:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1235117.1538164 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vsMVR-0000vO-0c; Tue, 17 Feb 2026 14:56:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1235117.1538164; Tue, 17 Feb 2026 14:56:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vsMVQ-0000tL-Tz; Tue, 17 Feb 2026 14:56:52 +0000
Received: by outflank-mailman (input) for mailman id 1235117;
 Tue, 17 Feb 2026 14:56:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FTcl=AV=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vsMVP-0000sy-08
 for xen-devel@lists.xenproject.org; Tue, 17 Feb 2026 14:56:51 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dcc11085-0c10-11f1-9ccf-f158ae23cfc8;
 Tue, 17 Feb 2026 15:56:39 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4836f363ad2so48279455e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 17 Feb 2026 06:56:39 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-67-101.play-internet.pl.
 [109.243.67.101]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4835dcfafcdsm797295895e9.9.2026.02.17.06.56.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Feb 2026 06:56:37 -0800 (PST)
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
X-Inumbo-ID: dcc11085-0c10-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771340198; x=1771944998; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Cc0HR42lpxhaagfczSf3gYyiSL6+htisCak8cGTmgXs=;
        b=kfo3pxgHmYoTEdx3abOQ0KVKS/H1PmlPrTMnpBwPve0PGViYC0xHOjOum+4IUpdqQe
         oOqvlBJIT94hIqP+Cz6bFVk4pEw9yrOizmcv4aNaQ386x1E60UepL3rXsojD554jD4cp
         0Av1AMrFaDDpb5sPLtOvsQN0MgMTDawxcFJjuU5HYsvwjajmAbsmqbGTsSU+vblZRxRJ
         bhSb3fXUpA59AE1aUFD+ahd7VpH3Y/0gYTMeh7G+G2GTN91FO51PQDAjXTlxk5F5svM/
         6XyxCwfXLyqGLKTtNCxCx9yF8wyUSa7hSVvyF3kBhquumdbzm1Z2kXSvQh7Ma2vAkGhl
         TWBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771340198; x=1771944998;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cc0HR42lpxhaagfczSf3gYyiSL6+htisCak8cGTmgXs=;
        b=EmOTjkF+/BHntRaXcQECPOvxrGQvZbPkUUOD26F8flcmb1QrlCHeoHhn0P8aZTHGfz
         cF47JdpkzBhIet8UVXma+8SlgPpGMPBpqdp11G3G6JSfgtQVsTCU0jqyJUNfBooqgQfe
         DRhe6eEH2bS5uB/LNHov9M7PJPFzR93eOFICplXnV9Iha/sr4KKDP2PfDIbIe56ikDYD
         BmOP/UWWwLfiuMAXiNWGO3ZXH/P9ZA3/QjZ+raFGXs6xYh3c3I+j7c33Ped2K178K/Hu
         eDrTmubJDaliKBv7rb/5TsDWt/WTXFr+uZJptzbbFxuR8KTkqMSnc9EsZeA4lU7jK9kF
         4LTw==
X-Forwarded-Encrypted: i=1; AJvYcCVrpHnSPH68gYQ5xXpTzyRl8BWBX5foxmzZpBtrz5FErrlRlZUCsjIrg89fMFHuZraNK2h7fwxvAK4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzXBBGK+1agbi94CkXuZCxY8AWjvdIyJFbQcJTL71F3va4G9Ebv
	JOwX2Y9UXeBkEF99JLY4N5vj+Dx72LcXDsEIndh41j6KGKhSbQ2UbNaq
X-Gm-Gg: AZuq6aL3SAyuyq3VBmMN/PLqVEWlIGHqpF9t/LnPYcK468f/MwqOOl5e9gSn1N1LZPC
	Vl4GXUTacye47yN+bvz9C3Dem6ZEFr2vo9r9m65QImOvuryZnSbkKf0RuafUf5DXIKo+k8GXFXW
	TR+W5WRaW3KOnWnPTMUaNj9I09yIFPS9YmxVw+Jj0z44Lv9X/KS9hn+TwZ6YJ60+a5KQh7nTaeT
	HZoMp6m9lUFpHDfC1mbnBi9+/JwF/DD28G5kdKcOLqctrHSdQaVb1JuQlCzlQ0C/zNZYqKACA+a
	VpHYJIL64eQ5St8X2k4bXbUMpbNhz07Rm6Gw/Mna6liBaZpkYzzCqqr2ar1xf6+Ma3/fFUA0/ej
	6JoXJHEZJRtqMoAFE/AcxymmwAwqt/H8ddaKfjC1Lvtx00CTO6eHzrzQ1FZ3M097dh36RhS94vB
	BwRawOxAJ0LTJS/1k9D5jvwEUGAN4TQfajDqvFfiKqfp3s9wuMgGf7ds0y/kWwUUwH/IT8bg3RU
	To=
X-Received: by 2002:a05:600c:6211:b0:477:93f7:bbc5 with SMTP id 5b1f17b1804b1-48373a09741mr255372255e9.10.1771340198191;
        Tue, 17 Feb 2026 06:56:38 -0800 (PST)
Message-ID: <c1bed773-5e50-4576-ab7f-685237d9f8d8@gmail.com>
Date: Tue, 17 Feb 2026 15:56:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 04/16] xen/riscv: implement vcpu_csr_init()
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1770999383.git.oleksii.kurochko@gmail.com>
 <7c58dfbac99694811e4276858b48baa211331229.1770999383.git.oleksii.kurochko@gmail.com>
 <07e6d8a4-c825-4d65-ab27-60ced2f25e79@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <07e6d8a4-c825-4d65-ab27-60ced2f25e79@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
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
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: BF9A714D57A
X-Rspamd-Action: no action


On 2/17/26 3:23 PM, Jan Beulich wrote:
> On 13.02.2026 17:28, Oleksii Kurochko wrote:
>> --- a/xen/arch/riscv/domain.c
>> +++ b/xen/arch/riscv/domain.c
>> @@ -6,10 +6,74 @@
>>   #include <xen/sched.h>
>>   #include <xen/vmap.h>
>>   
>> +#include <asm/cpufeature.h>
>> +#include <asm/csr.h>
>> +#include <asm/riscv_encoding.h>
>>   #include <asm/setup.h>
>>   
>>   struct csr_masks __ro_after_init csr_masks;
>>   
>> +#define HEDELEG_DEFAULT (BIT(CAUSE_MISALIGNED_FETCH, U) | \
>> +                         BIT(CAUSE_FETCH_ACCESS, U) | \
>> +                         BIT(CAUSE_ILLEGAL_INSTRUCTION, U) | \
>> +                         BIT(CAUSE_BREAKPOINT, U) | \
>> +                         BIT(CAUSE_MISALIGNED_LOAD, U) | \
>> +                         BIT(CAUSE_LOAD_ACCESS, U) | \
>> +                         BIT(CAUSE_MISALIGNED_STORE, U) | \
>> +                         BIT(CAUSE_STORE_ACCESS, U) | \
>> +                         BIT(CAUSE_USER_ECALL, U) | \
>> +                         BIT(CAUSE_FETCH_PAGE_FAULT, U) | \
>> +                         BIT(CAUSE_LOAD_PAGE_FAULT, U) | \
>> +                         BIT(CAUSE_STORE_PAGE_FAULT, U))
>> +
>> +#define HIDELEG_DEFAULT (MIP_VSSIP | MIP_VSTIP | MIP_VSEIP)
>> +
>> +static void vcpu_csr_init(struct vcpu *v)
>> +{
>> +    v->arch.hedeleg = HEDELEG_DEFAULT & csr_masks.hedeleg;
>> +
>> +    vcpu_guest_cpu_user_regs(v)->hstatus = HSTATUS_SPV | HSTATUS_SPVP;
>> +
>> +    v->arch.hideleg = HIDELEG_DEFAULT & csr_masks.hideleg;
>> +
>> +    /*
>> +     * VS should access only the time counter directly.
>> +     * Everything else should trap.
>> +     */
>> +    v->arch.hcounteren = HCOUNTEREN_TM;
>> +
>> +    if ( riscv_isa_extension_available(NULL, RISCV_ISA_EXT_svpbmt) )
>> +        v->arch.henvcfg = ENVCFG_PBMTE & csr_masks.henvcfg;
>> +
>> +    if ( riscv_isa_extension_available(NULL, RISCV_ISA_EXT_smstateen) )
>> +    {
>> +        register_t hstateen0 = 0;
>> +
>> +        if ( riscv_isa_extension_available(NULL, RISCV_ISA_EXT_ssaia) )
>> +            /*
>> +             * If the hypervisor extension is implemented, the same three
>> +             * bits are defined also in hypervisor CSR hstateen0 but concern
>> +             * only the state potentially accessible to a virtual machine
>> +             * executing in privilege modes VS and VU:
>> +             *      bit 60 CSRs siselect and sireg (really vsiselect and
>> +             *             vsireg)
>> +             *      bit 59 CSRs siph and sieh (RV32 only) and stopi (really
>> +             *             vsiph, vsieh, and vstopi)
>> +             *      bit 58 all state of IMSIC guest interrupt files, including
>> +             *             CSR stopei (really vstopei)
>> +             * If one of these bits is zero in hstateen0, and the same bit is
>> +             * one in mstateen0, then an attempt to access the corresponding
>> +             * state from VS or VU-mode raises a virtual instruction exception.
>> +             */
>> +            hstateen0 = SMSTATEEN0_AIA | SMSTATEEN0_IMSIC | SMSTATEEN0_SVSLCT;
>> +
>> +        /* Allow guest to access CSR_ENVCFG */
>> +        hstateen0 |= SMSTATEEN0_HSENVCFG;
> I continue to be puzzled by the use of = vs |=. If you use |=, best do so
> uniformly. Then inserting new code ahead of the one you have now is not a
> problem. I wonder anyway why you don't do (omitting commentary):
>
>          register_t hstateen0 = SMSTATEEN0_HSENVCFG;
>
>          if ( riscv_isa_extension_available(NULL, RISCV_ISA_EXT_ssaia) )
>              hstateen0 |= SMSTATEEN0_AIA | SMSTATEEN0_IMSIC | SMSTATEEN0_SVSLCT;
>
> As to CSR_ENVCFG - what's that referring to? I'm aware of menvcfg, henvcfg,
> and senvcfg. But I'm unaware of plain envcfg, and there's also no CSR_ENVCFG
> constant in riscv_encoding.h afaics. I assume it's senvcfg that you mean
> here.

I referred to CSR_SENVCFG, I just automatically applied the way how it is defined
in Linux kernel and Linux kernel abstracts it as CSR_ENVCFG as it could be booted
in M-mode or S-mode. There is no such definition in Xen as we don't use it.


>   And then - is this CSR unconditionally available? The "Supervisor ISA"
> isn't called an extension, yet at the same time it's also part of the
> separate "privileged" specification, not the general one.

I don't know, the available specs aren't precise here. Considering that
OpenSBI(menvcfg) or Linux(menvcfg or senvcfg) uses them unconditionally
then an assumption that CSR_*ENVCFG unconditionally exist could be done.

Anyway, a ENVCFG bit in hstateen0 depends only on RISCV_ISA_EXT_smstateen
(or Ssstateen extension) then it is okay to set that bit and even
CSR_*ENVCFG isn't implemented a trap to Xen will happen and it should be
handled somehow separately as I mentioned above Linux kernel uses them
unconditionally.

>
>> --- a/xen/arch/riscv/include/asm/domain.h
>> +++ b/xen/arch/riscv/include/asm/domain.h
>> @@ -48,6 +48,12 @@ struct arch_vcpu {
>>       } xen_saved_context;
>>   
>>       struct cpu_info *cpu_info;
>> +
>> +    register_t hcounteren;
>> +    register_t hedeleg;
>> +    register_t henvcfg;
>> +    register_t hideleg;
>> +    register_t hstateen0;
>>   };
> One question about the ordering here: It looks to be alphabetically sorted
> right now, yet I wonder whether that's optimal. Some CSRs might typically
> be used together, in which case they may best live close together (for
> chances to be good that they end up in the same cache line).

Make sense, I will group then hedeleg and hideleg.

Thanks.

~ Oleksii


