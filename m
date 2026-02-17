Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +PLWOK5llGkFDgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 17 Feb 2026 13:57:18 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5560D14C2FC
	for <lists+xen-devel@lfdr.de>; Tue, 17 Feb 2026 13:57:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1234973.1538039 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vsKda-0005WV-Gt; Tue, 17 Feb 2026 12:57:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1234973.1538039; Tue, 17 Feb 2026 12:57:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vsKda-0005Ts-DU; Tue, 17 Feb 2026 12:57:10 +0000
Received: by outflank-mailman (input) for mailman id 1234973;
 Tue, 17 Feb 2026 12:57:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FTcl=AV=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vsKdY-0005Tk-Qg
 for xen-devel@lists.xenproject.org; Tue, 17 Feb 2026 12:57:08 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2a456d3f-0c00-11f1-b164-2bf370ae4941;
 Tue, 17 Feb 2026 13:57:07 +0100 (CET)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-b8fb6ad3243so568832166b.1
 for <xen-devel@lists.xenproject.org>; Tue, 17 Feb 2026 04:57:07 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-67-101.play-internet.pl.
 [109.243.67.101]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8fc76c6b8bsm337379166b.65.2026.02.17.04.57.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Feb 2026 04:57:05 -0800 (PST)
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
X-Inumbo-ID: 2a456d3f-0c00-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771333027; x=1771937827; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=l9Td0RwiqH7W+OFADA59hO79Au5U3pUL9PHcyzfrzqE=;
        b=WRJZ/dUNGD5iFcGkz3dUzrIB8jbkl+wMyg+RTCaz84sDjb27M6YvxiV0MHEubtDxu/
         RLN5jhtKSIC1ZMleLJCA07AfOmgd+XpClQsQhrMQuyq/FNrQuw8corQ4cvdpLKhVROMV
         ckYJuQgLrSEYwF2ZuHTTF86kfzJZ+7km3IURQqslOdUED6Wfqf2UaJK9AHRdoIviJLyq
         XyrZhm9B4VF0YO8EL0/4pyl2zuCe4/8XyDscdb6gPeZl9PfQOhUt9MwX2hvvKJoVkhvV
         H/051oGwm7YZlJnkA0aluQYccYMciyPwquTMGl91fIMqrUNX0S4paQkoVNtyMhRGg72+
         V9Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771333027; x=1771937827;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l9Td0RwiqH7W+OFADA59hO79Au5U3pUL9PHcyzfrzqE=;
        b=EKP5/5h8yM/57LYLArGXz4T5MaUireHdCGBSkgObSYZP1Ws7qKkQJnEbmEVbceDBoj
         Y8tVyq4bQgZ52kktQzTIy4RwKPYwEMDYXZ+w637euJ4R4Izvgw2V+FoN9hFL8qisz6gK
         CBAZY2gZHhzYXtw2cZgidPIDGgBB0bJQu0TxiZwpzU+t0f9KfuF0Tsa4znlxx/lrGWuS
         +JYSGJPM3Twyxj01S0Fa7D4KMEkK+FyIdW5eHBdys3mknLBuuRagzBhjisg7xKRVxAGe
         0NvgcWkPuE7GtDnC9h+GirWSqT0XTGFB3PoRFh7Mdi/x1vPmrh3VoBiUSsIxpJNGVXXh
         eMcA==
X-Forwarded-Encrypted: i=1; AJvYcCUL3RVIjhdI9nCnY0T69emT/GHfzfEbeLiw6SU3LZfw/zRnYoLqOgcRb/7FM9jsU8E33UT93vpd5lc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwYXJU01PgJnl2D1obph9sCiYQWbn1zFWaTGTgl3iK0eY9vLHa/
	QiA1aSSDHqbLfMVNQfLeJHFfoq6aHnZnIVZrSU7hXYrigmKlVLzRVzPl
X-Gm-Gg: AZuq6aJdux84yz25N+We1IxX/ix0daaKt9TsePVmi0qJk9P1j/TZvi2hzCxtthrotv+
	46XMqeM6/FuZAYEtPc7S27r5dno0wmYc0nwdOm7efhk7v3QAxkS75pvKGx4Z3jMMbIEfOJIRb2E
	T7TuH6mN8YAH5NwG+fOkTO8g1akoKG1h2q6EGvZsirRK6E/O1e3cNP5HtivnzJ8hFE2AUekSu2x
	KoZkI7tS/kvruMXk9ru8Dg9NC33NEoiRbFKFE4jnLBDqJh961HCJh9O9BNF1+B9vKRogLlwaROE
	B3sEC0ib8klP6egW9zr9NfBd/gdYdNUAyEruNujZG4Y+pdRgtG0eq8JWydq9BalnLuQd7ilkW4V
	yPeSALHNMenknDy9lkZZZo5+gPoAFNvkpIhsRXqkgmocwDkTcgwuZW80Njt2wkL9g8a1mbHCKWI
	9WnIf+U9V77tw6S3iJnhoRuCy6ZHEPmnd3JdZZR2oIpJv53FrpTNIjOr/E6atbUWi4cAlOEsgie
	Xs=
X-Received: by 2002:a17:907:7253:b0:b8e:a143:3ae1 with SMTP id a640c23a62f3a-b8fb450a4e5mr778868366b.54.1771333026470;
        Tue, 17 Feb 2026 04:57:06 -0800 (PST)
Message-ID: <030dbe54-a2c8-4f54-ae3f-6a09762c25ef@gmail.com>
Date: Tue, 17 Feb 2026 13:57:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH v4 01/16] xen/riscv: implement
 arch_vcpu_{create,destroy}()
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
 <42534cb6aabf25cf551a13ae1288045e1ac08f9e.1770999383.git.oleksii.kurochko@gmail.com>
 <06208b1b-9107-4ae6-acbf-c69659354da4@suse.com>
Content-Language: en-US
In-Reply-To: <06208b1b-9107-4ae6-acbf-c69659354da4@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email];
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
X-Rspamd-Queue-Id: 5560D14C2FC
X-Rspamd-Action: no action


On 2/17/26 12:28 PM, Jan Beulich wrote:
> On 13.02.2026 17:28, Oleksii Kurochko wrote:
>> Introduce architecture-specific functions to create and destroy VCPUs.
>> Note that arch_vcpu_create() currently returns -EOPNOTSUPP, as the virtual
>> timer and interrupt controller are not yet implemented.
>>
>> Add calle-saved registers to struct arch_vcpu which are  used to preserve
>> Xen’s own execution context when switching between vCPU stacks.
>> It is going to be used in the following way (pseudocode):
>>    context_switch(prev_vcpu, next_vcpu):
>>      ...
>>
>>      /* Switch from previous stack to the next stack. */
>>      __context_switch(prev_vcpu, next_vcpu);
>>
>>      ...
>>      schedule_tail(prev_vcpu):
>>          Save and restore vCPU's CSRs.
>> The Xen-saved context allows __context_switch() to switch execution
>> from the previous vCPU’s stack to the next vCPU’s stack and later resume
>> execution on the original stack when switching back.
>>
>> During vCPU creation, the Xen-saved context is going to be initialized
>> with:
>>    - SP pointing to the newly allocated vCPU stack.
>>    - RA pointing to a helper that performs final vCPU setup before
>>      transferring control to the guest.
>>
>> As part of this change, add continue_new_vcpu(), which will be used after
>> the first context_switch() of a new vCPU. Since this functionality is not
>> yet implemented, continue_new_vcpu() is currently provided as a stub.
>> The prev argument is going to be set by RISC-V ABI (prev will be stored in
>> a0) when __context_swtich() will be introduced and called from
>> context_switch().
>>
>> Update the STACK_SIZE definition and introduce STACK_ORDER (to align with
>> other architectures) for allocating the vCPU stack.
> Yet you don't really need STACK_ORDER, as you use vzalloc() (unlike in
> particular Arm, but also x86). If there's no expected other use of the
> constant, I'd suggest to omit it, to avoid the false impression that
> RISC-V is like (again in particular) Arm in regards to how the stack is
> being allocated.

Yes, this is the only one usage of STACK_ORDER constant so it could be 
omitted.

>> --- /dev/null
>> +++ b/xen/arch/riscv/domain.c
>> @@ -0,0 +1,58 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +
>> +#include <xen/init.h>
>> +#include <xen/mm.h>
>> +#include <xen/sched.h>
>> +#include <xen/vmap.h>
>> +
>> +static void continue_new_vcpu(struct vcpu *prev)
>> +{
>> +    BUG_ON("unimplemented\n");
>> +}
>> +
>> +static void __init __maybe_unused build_assertions(void)
>> +{
>> +    /*
>> +     * Enforce the requirement documented in struct cpu_info that
>> +     * guest_cpu_user_regs must be the first field.
>> +     */
>> +    BUILD_BUG_ON(offsetof(struct cpu_info, guest_cpu_user_regs) != 0);
>> +}
> Nit: Generally we have this kind of function at the bottom of source files.
>
>> +int arch_vcpu_create(struct vcpu *v)
>> +{
>> +    int rc = 0;
>> +    void *stack = vzalloc(STACK_SIZE);
>> +
>> +    if ( !stack )
>> +        return -ENOMEM;
>> +
>> +    v->arch.cpu_info = stack + STACK_SIZE - sizeof(struct cpu_info);
> Perhaps better sizeof(*v->arch.cpu_info), to connect lhs and rhs?
>
>> +    v->arch.xen_saved_context.sp = (register_t)v->arch.cpu_info;
>> +    v->arch.xen_saved_context.ra = (register_t)continue_new_vcpu;
>> +
>> +    /* Idle VCPUs don't need the rest of this setup */
>> +    if ( is_idle_vcpu(v) )
>> +        return rc;
> I'd suggest "return 0" here to make clear it's a success path. Then
> possible uses of "rc" earlier in the function also won't affect this.
>
> With all of the adjustments (happy to carry out while committing, as long
> as you agree)
> Acked-by: Jan Beulich <jbeulich@suse.com>

I am okay with suggested adjustments.

Thanks a lot!

~ Oleksii


