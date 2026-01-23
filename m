Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kBIsNnpPc2ncugAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 23 Jan 2026 11:37:46 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46FDD74637
	for <lists+xen-devel@lfdr.de>; Fri, 23 Jan 2026 11:37:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1212129.1523427 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vjEXn-0003Dx-Ft; Fri, 23 Jan 2026 10:37:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1212129.1523427; Fri, 23 Jan 2026 10:37:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vjEXn-0003BA-Ce; Fri, 23 Jan 2026 10:37:35 +0000
Received: by outflank-mailman (input) for mailman id 1212129;
 Fri, 23 Jan 2026 10:37:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5Rm/=74=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vjEXm-0003B4-To
 for xen-devel@lists.xenproject.org; Fri, 23 Jan 2026 10:37:34 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8159f973-f847-11f0-9ccf-f158ae23cfc8;
 Fri, 23 Jan 2026 11:37:24 +0100 (CET)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-435a517be33so1270871f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 23 Jan 2026 02:37:24 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-67-101.play-internet.pl.
 [109.243.67.101]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435b1e7164dsm5712409f8f.23.2026.01.23.02.37.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Jan 2026 02:37:23 -0800 (PST)
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
X-Inumbo-ID: 8159f973-f847-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769164644; x=1769769444; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xxDB0Ao+8SsVgIyA2jfmZIaZYgtRGz93592jqfkqzck=;
        b=JnAcA+qn76Sr7MVwE1AIHuj8nNfy1BsL8HU4LxRSGtZt8wfYn1YAHb40MfTCt+Mjhn
         8tDfXwcdIoeaqfLomRmeAFys616WW8jVmZBF2QrZXwGC+DdAye5AX3tAMwwSRR2QP39/
         SEyleZWzUyzyu0kZunZc3GmuzI1EHt7SFm7DkRHvjxnIwPnbpj7wMWQtlMEt1MP/zZcC
         mvcJrORvSKjJ+Wkq9Bz7E0hAsmN/Fk/oDwVD9EvtgqO675jSGhZUGhYut7j+oOBkeI6t
         FYZgR/OssflceU4uNweI1SLQ01hNNDhrLpl6zOORgDCSAmCYH8fphuURYEAfdCwo6WEs
         e/4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769164644; x=1769769444;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xxDB0Ao+8SsVgIyA2jfmZIaZYgtRGz93592jqfkqzck=;
        b=dHbtjAcPIltrrpXLfejPMZzRybijq8f5lYsmJFYFGWp+1R6WNOP/18ZgmYJYQLhGg9
         eZ1HXcX18AaWuk+gFUZ7eXZfHbEqJ9u3JT6U6wB5CRsI6lSxtwYXJ7mUUKwYHwaBz7Vl
         hYivckce+mz8cjCdMV4mkCON2uPf8GgJ/1XKz4n35HOIPmU1F5nGqWGXmykqCYx9mJ2/
         83KZPVGq6rUKy7pxcFmXGwKBQGMKlL1HH10raaJYAqfOzqm3ooIan3x3i5PEwxOEzIPe
         Kqy8siVOWsXIlKkGHPp5H24HVH26rZx7LQCP2i5C+wj8VSDLehn0n5AZeL8U9ubN60f2
         UKwQ==
X-Forwarded-Encrypted: i=1; AJvYcCVdoy5rXKYf2v7jDBuxUNqV+2I87Emckmm8eBJT4MmOYuOElwZ6XFWFBox0XiAXOt1lOeBlqcuhY1g=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyKXfrbIkhjk5cGaLWtMOXspnF3TyRMGm3DfIEgqnw/xfwKTrWK
	yz4VbVHYaqbpNb3xquTPJbybVu4bxr/C0q17qQ/z3GEPn5awqKcri4v/
X-Gm-Gg: AZuq6aLIyXeLHmgsQ8PgDX+GmXtE8+BMy3KKGBUTXe24sIcGiEUvwMCGxeuhdJoMHo/
	ehX8pPeJVI99ugC+nqCemnZQ222pJkRdixfdtO0f9IK705BQBC7vFQxFyFXICaqJjUyD8/m2vLN
	pX/okK+QR5GGL8aGw6QaPPmls/dgFz9IWmZenkCbFFk8OQRO4NTi5PLm5rrzciFzn9UpN2apJ6z
	BERX8vwAM1CQi1EbKRuHcwGK5XKpQfVN/oA548IwWTjeNCN3/vtQP4ksaKblrtIMUOwmMQ4DNtE
	7sJKGmRsB4y0o2/kv1jAODxNzekdN4nHL0Jfp4AUWiIH1fno5xYX+fs0QclWNEQsgfvy7Nb52jH
	ceHyGlKEJ6m8FyqA0Cuz9zfAMfECUQyeCLVpQrg/vVf1Ttl68iJBsMGcS9SFObLT1NSYY4OMyIn
	64ImSR79/G7XGtmLr6nUB9AqiuOhXBXYfnxaFlpfIAhVpdNsqMvSnWz+weCNDy+7A=
X-Received: by 2002:a05:6000:4313:b0:432:8504:b8a9 with SMTP id ffacd0b85a97d-435b1627fe9mr4813089f8f.62.1769164643931;
        Fri, 23 Jan 2026 02:37:23 -0800 (PST)
Message-ID: <a209becf-16cc-4f5c-80cd-b2add65243bf@gmail.com>
Date: Fri, 23 Jan 2026 11:37:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/riscv: dump GPRS and CSRs on unexpected traps
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Romain Caritey <Romain.Caritey@microchip.com>, xen-devel@lists.xenproject.org
References: <f6f7ec863e92ade433f23ae0061391d2ef731f41.1768579139.git.oleksii.kurochko@gmail.com>
 <843ba134-099c-49a1-8561-5e364b630bc8@suse.com>
 <dac2520a-ba66-4514-b03f-04ea8b440913@gmail.com>
 <5aafd748-96fb-444a-b297-96b5cca86b2d@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <5aafd748-96fb-444a-b297-96b5cca86b2d@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:Romain.Caritey@microchip.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,microchip.com,lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.998];
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
X-Rspamd-Queue-Id: 46FDD74637
X-Rspamd-Action: no action


On 1/23/26 10:39 AM, Jan Beulich wrote:
>>>> +}
>>>> +
>>>> +static void dump_csrs(unsigned long cause)
>>>> +{
>>>> +    unsigned long hstatus;
>>>> +
>>>> +    printk("\nDumping CSRs...\n");
>>>> +
>>>> +    printk("Supervisor CSRs\n");
>>>> +    print_csr(CSR_STVEC);
>>>> +    print_csr(CSR_SATP);
>>>> +    print_csr(CSR_SEPC);
>>>> +
>>>> +    hstatus = csr_read(CSR_HSTATUS);
>>>> +
>>>> +    printk("\tCSR_STVAL: %016lx%s\n", csr_read(CSR_STVAL),
>>>> +           (hstatus & HSTATUS_GVA) ? ", (guest virtual address)" : "");
>>>> +
>>>> +    printk("\tCSR_SCAUSE: %016lx\n", cause);
>>>> +    printk("\t\tDescription: %s\n", decode_cause(cause));
>>>> +    print_csr(CSR_SSTATUS);
>>>> +
>>>> +    printk("\nVirtual Supervisor CSRs\n");
>>>> +    print_csr(CSR_VSTVEC);
>>>> +    print_csr(CSR_VSATP);
>>>> +    print_csr(CSR_VSEPC);
>>>> +    print_csr(CSR_VSTVAL);
>>>> +    cause = csr_read(CSR_VSCAUSE);
>>>> +    printk("\tCSR_VSCAUSE: %016lx\n", cause);
>>>> +    printk("\t\tDescription: %s\n", decode_cause(cause));
>>>> +    print_csr(CSR_VSSTATUS);
>>> As before, imo justification is wanted (in the description) for logging
>>> VS* values.
>> It is hard to describe in general why they could be needed. The best I can
>> come up is:
>>     Dump VS* CSRs to provide full guest exception context. When handling traps originating
>>     from VS-mode, host CSRs alone do not describe the fault; VSCAUSE, VSEPC, VSTVAL, and
>>     related state are required to diagnose guest crashes and hypervisor misconfiguration,
>>     and to correlate host-side handling with guest-visible exceptions.
>>
>> Does it good enough justification?
> I think diagnosing guest crashes doesn't belong here. An unexpected trap is
> entirely different from a guest crash. Hypervisor misconfig I might buy, just
> that I don't (yet?) see the connection to the three particular registers you
> name in the suggested text. (As mentioned before, this may simply be because
> of my lack of a proper global picture of RISC-V.)

One of the options which could be stored in VSTVAL is a faulty instruction, so
without checking VSEPC we could understand what is the instruction and check
what is in HS-mode register to understand if enough permissions were given to
VS-mode to use this instruction without trap to HS-mode.

Considering that even if a source of trap is faulty instruction it doesn't
guarantee that VSTVAL will contain this faulty instruction, so we should go to
check VSEPC and then use objdump to understand what was faulty instruction.

VSCAUSE could be useful for the case if for some reason guest doesn't dump
VSCAUSE to its console, at least, we could get some extra information what was
wrong during execution of faulty instruction.

Also, there are a cases when from hypervisor some trap redirection to a guest
happens and VSCAUSE is used for this purpose, VSTATUS and VSTVEC are used too,
so it would be nice to check them too if such redirection leads to another trap
because of incorrectly set VSCAUSE, VSTATUS and VSTVEC.

I don't really see any reason to print VSATP, at least, at the moment. So
I can drop it.

~ Oleksii


