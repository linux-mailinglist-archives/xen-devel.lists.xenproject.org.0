Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BF68D19EAC
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jan 2026 16:33:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1201953.1517571 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfgNw-0000dt-Cu; Tue, 13 Jan 2026 15:32:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1201953.1517571; Tue, 13 Jan 2026 15:32:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfgNw-0000am-9Y; Tue, 13 Jan 2026 15:32:44 +0000
Received: by outflank-mailman (input) for mailman id 1201953;
 Tue, 13 Jan 2026 15:32:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=i8AK=7S=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vfgNu-0000ag-I8
 for xen-devel@lists.xenproject.org; Tue, 13 Jan 2026 15:32:42 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1924dcdc-f095-11f0-b15e-2bf370ae4941;
 Tue, 13 Jan 2026 16:32:41 +0100 (CET)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-64b5ed53d0aso11341674a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 13 Jan 2026 07:32:41 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-67-101.play-internet.pl.
 [109.243.67.101]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6507b8c4c15sm20438885a12.4.2026.01.13.07.32.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Jan 2026 07:32:40 -0800 (PST)
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
X-Inumbo-ID: 1924dcdc-f095-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768318361; x=1768923161; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=P2uMcWi4FiTHA8GDmA4Tql4mVTb/WHCmilSUeqLJnKU=;
        b=U6Y29kaqT1ogyJByLRRAht92rNkk/D7bNxfH/w6sYkeBGBdYK4MIwuRPt/haXvoiJO
         m69XTCgMMLUyMi2DO1nVDgOcOKOKwoc1VHIne5aeuJse//ChbqCw9MXM8Us9GvQzD/6l
         jw8t7IwFB7VBxwdaCCIJn42wVvBHSl/1jVy156slIh25SDrZgbSkUOD/YHm6qrAuyMW/
         F6Zsb3iIXNVIlIy2D+wcrwALqTFtQ9zZs6DLiV8XlDH+xbLAu5nm71VBvj3r9PL+zF7W
         QtpAHGNUHmMim8XP+MRgLc73CMe0tp+5DHTiOT57vV+jtmHIa+2OL1hQVYsgPDqvZEKh
         YGKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768318361; x=1768923161;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P2uMcWi4FiTHA8GDmA4Tql4mVTb/WHCmilSUeqLJnKU=;
        b=f9WSKyWdiIHedkvOwLIhni4sXztF3pS2taor1fYB/Jv0Ot6OmZNrKhNoWKsdqcq8gD
         lWCzF0kuRbVh4RFdzGUzdgctXG6oWr/j8JG7ua92LA54/3bD4EZ5lzw25DInhh+6uQdV
         PbwB499uGp9SRW565pd4ZMFp2ZqUIv+k3fuDhRDkEiqm7sVxJW4EW3oefTlGr6jEHO2a
         DmS/nZeqwCuHFC+QzVC3w7w9zyX8bUlZRQP4tZmUZ4xhClU259eBS762qFcwMHtBXhlp
         zfth398av7Xz6TTvZwAQXe8+7NgTrDh1dA2jWPZx5pqCSV3NztqOSEvVPU5sshRUxhX5
         R0zQ==
X-Forwarded-Encrypted: i=1; AJvYcCXA3xSZaBUFQeG/iuBz6brfbM834J1K5/Uc4lfWHRKAd2iLeSXxOCVXcUrDdQK8XemvzrAHL5UqbC4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzkrykU8z0wKdvowfLSbHtQAtfIfM0sRbHyAcbb2oYW3TMiHlEO
	Z2HECuR9vTPg8KAp4uEehLSjsu7WWOz6ys4AIJA2UX/PV/nlPBNvXixO
X-Gm-Gg: AY/fxX4ISzBr+/pu9j88H2+eKwkR/n2BdDqa/LmnT3jNJV72sI0v75qM5zuUuNmmYob
	41mKvmfcW8pYSymWj2WeJhxtfBTuL9aSltuGoKyExcSI1XMPe1yLhuWZcT1bVBv7GDgzS/qIWnX
	MnKZYeF0E6nikpxTCSRLOZehNuVHrnhE+MDcFRq/Who5lHPsS2WmyWYoIjCILa3JWQa5XDlLj71
	vyfof/JIPjaMbBl63DXarJcpkh/S2g1cf9kTArioBX6Ysz66+05g436X3aNrpkJNSsSBDnlnGdP
	IQZKb4NQ/YAFe/jz/jVi1Fd2etb5bYbqoliIj8rL/bOHG4PDoj6XID0sJB7PZtfcwTgTMP/3MkD
	Q7moHIzgU6TUT7u5ljZH1sXt8hwQk4AEiA0ux0hbDAaVOC0idWpDHSxCJmmo92vK+cbHuVz/NvH
	JWnNhp1YMuhmRDfNG4y7Pnuu59nRM7LFiMTYWI+ylRcHk6GqTa+RtYB7Yp+MmEVFQ=
X-Google-Smtp-Source: AGHT+IFpW5QQqNUz/oJj/+xCcH1TnefRzaIiw5OIDQtHuTisSSPF8I7dIvXbf/K8JbdxiGa5Um+urQ==
X-Received: by 2002:a05:6402:2811:b0:649:927c:337c with SMTP id 4fb4d7f45d1cf-65097dfd568mr19112396a12.14.1768318360383;
        Tue, 13 Jan 2026 07:32:40 -0800 (PST)
Message-ID: <1acea58d-79f5-4fca-bd6a-1eaca72093f3@gmail.com>
Date: Tue, 13 Jan 2026 16:32:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH v1 09/15] xen/riscv: add vtimer_{save,restore}()
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1766595589.git.oleksii.kurochko@gmail.com>
 <c553efa44f384dcb9a49684c586a762b2a1444c9.1766595589.git.oleksii.kurochko@gmail.com>
 <9d02934b-d448-4ec0-af0d-b4ee9a918e03@suse.com>
Content-Language: en-US
In-Reply-To: <9d02934b-d448-4ec0-af0d-b4ee9a918e03@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 1/8/26 11:43 AM, Jan Beulich wrote:
> On 24.12.2025 18:03, Oleksii Kurochko wrote:
>> Add implementations of vtimer_save() and vtimer_restore().
> And these are going to serve what purpose? Are they for context switch, or
> for migration / save / restore? In the former case (supported by the naming
> of the function parameters), I think they want naming differently (to avoid
> confusion). See how x86 has e.g. ..._ctxt_switch_{from,to}() and then
> ..._switch_{from,to}() helpers.

Based only on the name it is clear for what ..._ctxt_switch_{from,to}() will
be used, ..._switch_{from,to}() isn't clear just based on the name how it will
be used.

Anyway, I am okay to change vtimer_{save,restore}() to vtimer_ctx_switch_{from,to}()
and then follow for other stuff to follow the same approach (as I used for everything
*_save() *_store()).

>> At the moment, vrtimer_save() does nothing as SSTC, which provided
>> virtualization-aware timer,  isn't supported yet, so emulated (SBI-based)
>> timer is used.
> Is "emulated" really the correct term here? You don't intercept any guest
> insns, but rather provide a virtual SBI.

I wasn't sure that it is the best one term.
Probably then just "virtual (SBI-based) timer" is better to use.

>
>> vtimer uses internal Xen timer: initialize it on the pcpu the vcpu is
>> running on, rather than the processor that it's creating the vcpu.
> This doesn't look to describe anything this patch does.

Hm, and why not?

In vcpu_vtimer_init() we're initializing timer (it was incorrect to use
"internal Xen timer" though) on CPU is stored in vcpu->processor by calling
init_timier().

I will update this part then to:
  Initialize the timer contained in|struct vtimer| by calling|init_timer()|.

>
>> On vcpu restore migrate (when vtimer_restore() is going to be called)
>> the vtimer to the pcpu the vcpu is running on.
> Why "going to be" when you describe what the function does?

Because it isn't called now. The part inside (...) could be dropped.

>
>> --- a/xen/arch/riscv/include/asm/vtimer.h
>> +++ b/xen/arch/riscv/include/asm/vtimer.h
>> @@ -24,4 +24,7 @@ int domain_vtimer_init(struct domain *d, struct xen_arch_domainconfig *config);
>>   
>>   void vtimer_set_timer(struct vtimer *t, const uint64_t ticks);
>>   
>> +void vtimer_save(struct vcpu *v);
>> +void vtimer_restore(struct vcpu *v);
> Misra demands that parameter names in declarations match ...
>
>> @@ -65,3 +66,17 @@ void vtimer_set_timer(struct vtimer *t, const uint64_t ticks)
>>   
>>       set_timer(&t->timer, expires);
>>   }
>> +
>> +void vtimer_save(struct vcpu *p)
>> +{
>> +    ASSERT(!is_idle_vcpu(p));
>> +
>> +    /* Nothing to do at the moment as SSTC isn't supported now. */
>> +}
>> +
>> +void vtimer_restore(struct vcpu *n)
>> +{
>> +    ASSERT(!is_idle_vcpu(n));
>> +
>> +    migrate_timer(&n->arch.vtimer.timer, n->processor);
>> +}
> ... the ones in the definitions. No matter that RISC-V isn't scanned by Eclair,
> yet, I think you want to avoid the need to later fix things up.

Sure, I'll fix that.

Thanks.

~ Oleksii


