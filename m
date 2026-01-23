Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2J+ZKgk7c2kztgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 23 Jan 2026 10:10:33 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5A797307E
	for <lists+xen-devel@lfdr.de>; Fri, 23 Jan 2026 10:10:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1212076.1523386 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vjDAX-0007oD-Up; Fri, 23 Jan 2026 09:09:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1212076.1523386; Fri, 23 Jan 2026 09:09:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vjDAX-0007lg-S8; Fri, 23 Jan 2026 09:09:29 +0000
Received: by outflank-mailman (input) for mailman id 1212076;
 Fri, 23 Jan 2026 09:09:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5Rm/=74=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vjDAV-0007la-Rx
 for xen-devel@lists.xenproject.org; Fri, 23 Jan 2026 09:09:27 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3744f6a2-f83b-11f0-b15e-2bf370ae4941;
 Fri, 23 Jan 2026 10:09:26 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-47ee2715254so10673615e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 23 Jan 2026 01:09:26 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-67-101.play-internet.pl.
 [109.243.67.101]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435b1c24f15sm5256725f8f.18.2026.01.23.01.09.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Jan 2026 01:09:25 -0800 (PST)
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
X-Inumbo-ID: 3744f6a2-f83b-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769159366; x=1769764166; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=s58SY+7x1BZaLsDJ3kgAt3pm4Ke7/V4OsvokX/cUX1o=;
        b=NiKkoFnwtFyIwgsCC8FROeCQKU+4Vhf6I0RYIlprDsCcmKs7PPwFwx3MkmN9ZBeF2f
         Xh118GrgysLShhJZuoeNzga9zZKpvXNG+Dc7SqeUU/9ImbY0V2Gh/ezxjFLw46ZCEgkE
         PSUdLpb8kcu5IyH3Oa3jzB0R5k+XLscj0IcnE0/u1KmyRyRjmJcWIRa/8wQKB2NiPhhB
         1zPgzM/gyb+rPKEqnHiikoFuJep/f7nQz9k5OwUIsUVqMe2syahcA+yHOtg2yX8cY+j2
         yprYxgk610870JI0KFnegGu+IPLBZNAlsTzJEiJBx/ECJsAOIKg1rM5B8ayXKYnxuzgR
         VOPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769159366; x=1769764166;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s58SY+7x1BZaLsDJ3kgAt3pm4Ke7/V4OsvokX/cUX1o=;
        b=aHn98Il1sX3CwQOEYacvqp7EBuBI6hT0qYarCtCYgDW4nh+/sfXIYcUp94ocxsoLNV
         u8f2DjLEWS2ghQG0JteTYhEE5zJ0UW71zRALICPfprSqjibpadhGhwcE47KeCgKdmSrh
         D78oof4JMh5rtaQEL6CQsZKQfZ7d6+gz97PxoekTGWwX8x3bxi6o6bnHU/H2dbfUIv6X
         oGt+qxOEp74G6y5tfCZ9Ni0TVtn++lPf762tJcsrplSQUTgNWvPSq1E259GJlO+ZRCsl
         YqYPBfQ0JysUP8StM0v2mfR7SK00mqN4sxUom62XdGMZldw+AuO1uEVvs08Ze7u2m8L6
         ciLA==
X-Forwarded-Encrypted: i=1; AJvYcCVKurfXcM17vCcRe3KHDsjxw9Hz/UXY2/n+RWDyx2BSLPQX/L9xd78kJ8XbBQjrP/h8qx8558WZOlA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxfBf84Y1imxmL6entb5PsRTxXB4rPOUEhvVYvutB+L/W+ydeNs
	SQSH6kfFTDc/CwS9kk1mUbjtg2WLKN0ulCQquYPnl9Hl0t+pTR4f28qT
X-Gm-Gg: AZuq6aJj/u08nJeQNtC2Kl1fwUUQhJgtoW+I4a/3LrGZv4PI+E2Ksp/JXPXG1d+Uevy
	9WK5qYejShdi/W8dNrJgQdTVcpG2GPYXvVQe+Aa6JGnl3SWB/PodmJTpODrPDms6IqZ89f75yUU
	soqTk4ICNeJRd5voB1EVf75xy0DMORrpiDPqnEJK1TITAkFa5WFyGX+/Mtko0c92Wbna0pO3/Ey
	CG1218I8khT6sYF0aWMrmpGxiZfgeQyii+AgzQ8l0U8QS/1kMvzjylZLwGPN6MPsqmMYdD1Zqs/
	KppKrN741ww2GaQQyKA9rVUJq9u8/ZfNoZu4SWJbpZracZt+yVAdW10CuM9/26+Lygy/sv9eTVI
	5/9AfVrcPrHlv17rj9/kypYKKN8A6/6/TSspuy5mBM8Nn0SYGfmZnk6MCg1NVKpx1ja3HHxN3OZ
	hSzQgYV34LHfHcfkb+IeoB1rcMUz4rC1Xw/6MpK1iOnFFDFP3MsE1TZyCaiVRVO5i1wlVxWosrl
	g==
X-Received: by 2002:a05:600c:a18e:b0:480:3b4e:41ba with SMTP id 5b1f17b1804b1-4804f8235damr15437175e9.18.1769159365449;
        Fri, 23 Jan 2026 01:09:25 -0800 (PST)
Message-ID: <dac2520a-ba66-4514-b03f-04ea8b440913@gmail.com>
Date: Fri, 23 Jan 2026 10:09:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
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
Content-Language: en-US
In-Reply-To: <843ba134-099c-49a1-8561-5e364b630bc8@suse.com>
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
	NEURAL_HAM(-0.00)[-0.999];
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
X-Rspamd-Queue-Id: E5A797307E
X-Rspamd-Action: no action


On 1/19/26 9:34 AM, Jan Beulich wrote:
> On 16.01.2026 17:16, Oleksii Kurochko wrote:
>> Provide more context on the exception state when an unexpected
>> exception occurs by dumping various Supervisor, Virtual Supervisor
>> and Hypervisor CSRs, and GPRs pertaining to the trap.
>>
>> Signed-off-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>
>> ---
>> Changes in v2
>>   - Address coments about print_csr() macros and dump_csrs().
>>   - Add dumping of GPRs pertaining to the trap.
>> ---
>>   xen/arch/riscv/traps.c | 82 ++++++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 82 insertions(+)
>>
>> diff --git a/xen/arch/riscv/traps.c b/xen/arch/riscv/traps.c
>> index e9c967786312..4e0df698552f 100644
>> --- a/xen/arch/riscv/traps.c
>> +++ b/xen/arch/riscv/traps.c
>> @@ -17,6 +17,13 @@
>>   #include <asm/traps.h>
>>   #include <asm/vsbi.h>
>>   
>> +#define print_csr(csr) \
>> +    printk("\t" #csr ": %016lx\n", csr_read(csr));
> This prints the CSR_ prefix of the internally used constants. Is this useful
> (rather than extra clutter)?

No, the prefix isn't really useful. It was printed so only because all CSRs registers
defintions start on CSR_*.

>   Unlike for the GPRs this also prints the register
> names in upper case. That may be fine, or may not be.

I will follow then like it is written in RISC-V spec for consistency.


>   The values printed also
> won't align, which may make reading more difficult.

Do you expect the similar alignment like for GPRs?


>> +#define print_gprs(regs, reg1, reg2) \
>> +    printk("\t%-7s: %016lx %-7s: %016lx\n", \
>> +           #reg1, (regs)->reg1, #reg2, (regs)->reg2)
> Yes, two per line is certainly helpful. Why not also for some of the CSRs.

It is less clear how it would be better to group them. I thought about
CSR_STVEC: ....    CSR_VSTVEC: ....
CSR_STTATUS: ...   CSR_VSSTATUS: ....

So group them in S-mode mode register and VS-mode register.

>> @@ -99,12 +106,87 @@ static const char *decode_cause(unsigned long cause)
>>       return decode_trap_cause(cause);
>>   }
>>   
>> +static void dump_general_regs(const struct cpu_user_regs *regs)
>> +{
>> +    printk("\nDumping GPRs...\n");
> Register names alone will be meaningful enough? Be mindful of serial line
> bandwidth as well as screen resolution.

Agree, we could drop this print. (Then probably the same could be for Supervisor CSRs
and Virtual Supervisor CSRs, etc as it is clear based on the name which one CSR it
is)

>> +    print_gprs(regs, ra, sp);
>> +    print_gprs(regs, gp, tp);
>> +    print_gprs(regs, t0, t1);
>> +    print_gprs(regs, t2, s0);
>> +    print_gprs(regs, s1, a0);
>> +    print_gprs(regs, a1, a2);
>> +    print_gprs(regs, a3, a4);
>> +    print_gprs(regs, a5, a6);
>> +    print_gprs(regs, a7, s2);
>> +    print_gprs(regs, s3, s4);
>> +    print_gprs(regs, s5, s6);
>> +    print_gprs(regs, s7, s8);
>> +    print_gprs(regs, s9, s10);
>> +    print_gprs(regs, s11, t3);
>> +    print_gprs(regs, t4, t5);
>> +    print_gprs(regs, t6, sepc);
>> +    print_gprs(regs, sstatus, hstatus);
> The last three aren't GPRs. Why would they be logged here? (All three also
> being logged in dump_csrs() would further require some disambiguation in
> the output, for people to not need to go look at the source code every
> time.)

Agree, that it would be better to print it with the CSRs. It was print here
only as they are in the same structure with GPRs.

>> +}
>> +
>> +static void dump_csrs(unsigned long cause)
>> +{
>> +    unsigned long hstatus;
>> +
>> +    printk("\nDumping CSRs...\n");
>> +
>> +    printk("Supervisor CSRs\n");
>> +    print_csr(CSR_STVEC);
>> +    print_csr(CSR_SATP);
>> +    print_csr(CSR_SEPC);
>> +
>> +    hstatus = csr_read(CSR_HSTATUS);
>> +
>> +    printk("\tCSR_STVAL: %016lx%s\n", csr_read(CSR_STVAL),
>> +           (hstatus & HSTATUS_GVA) ? ", (guest virtual address)" : "");
>> +
>> +    printk("\tCSR_SCAUSE: %016lx\n", cause);
>> +    printk("\t\tDescription: %s\n", decode_cause(cause));
>> +    print_csr(CSR_SSTATUS);
>> +
>> +    printk("\nVirtual Supervisor CSRs\n");
>> +    print_csr(CSR_VSTVEC);
>> +    print_csr(CSR_VSATP);
>> +    print_csr(CSR_VSEPC);
>> +    print_csr(CSR_VSTVAL);
>> +    cause = csr_read(CSR_VSCAUSE);
>> +    printk("\tCSR_VSCAUSE: %016lx\n", cause);
>> +    printk("\t\tDescription: %s\n", decode_cause(cause));
>> +    print_csr(CSR_VSSTATUS);
> As before, imo justification is wanted (in the description) for logging
> VS* values.

It is hard to describe in general why they could be needed. The best I can
come up is:
   Dump VS* CSRs to provide full guest exception context. When handling traps originating
   from VS-mode, host CSRs alone do not describe the fault; VSCAUSE, VSEPC, VSTVAL, and
   related state are required to diagnose guest crashes and hypervisor misconfiguration,
   and to correlate host-side handling with guest-visible exceptions.

Does it good enough justification?

~ Oleksii


