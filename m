Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UHa8CZrxeWnT1AEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jan 2026 12:23:06 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CCB0A0427
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jan 2026 12:23:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1215488.1525664 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vl3dD-00007G-UB; Wed, 28 Jan 2026 11:22:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1215488.1525664; Wed, 28 Jan 2026 11:22:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vl3dD-0008Vq-Qk; Wed, 28 Jan 2026 11:22:43 +0000
Received: by outflank-mailman (input) for mailman id 1215488;
 Wed, 28 Jan 2026 11:22:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=y3TT=AB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vl3dC-0008Vk-Rb
 for xen-devel@lists.xenproject.org; Wed, 28 Jan 2026 11:22:42 +0000
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com
 [2607:f8b0:4864:20::732])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a12f2768-fc3b-11f0-9ccf-f158ae23cfc8;
 Wed, 28 Jan 2026 12:22:29 +0100 (CET)
Received: by mail-qk1-x732.google.com with SMTP id
 af79cd13be357-8c7199e7f79so7950585a.0
 for <xen-devel@lists.xenproject.org>; Wed, 28 Jan 2026 03:22:29 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-67-101.play-internet.pl.
 [109.243.67.101]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8c711d2cdbbsm159115885a.28.2026.01.28.03.22.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Jan 2026 03:22:27 -0800 (PST)
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
X-Inumbo-ID: a12f2768-fc3b-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769599348; x=1770204148; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PTmGB00vk7/kp+zIH4DKz/eDu1tVIye+prcQ+wtOs/w=;
        b=NCy30xB25WWyG7nj89w3EvCHW3V/R8xipLnPgcVinkU+VHh9AndlHd27B3FDSsCzk9
         pOYy7S+x6vBETfuhJfgkS4Cll4FsQEzayI2neE3HkeBIE5sx8iH0u9si3ctRl2kYdITp
         n7lke0ZjwPGnOq7B/NjkkiDWKcSYacBjbDIC6xLxEtsXMWoR6FlzFhAQ0742ZVzNt1jO
         P4otzCgCMotQ+Awrc6v90ywhMlaSx8PZLIogFelmmvIWpN4YHSnrwheayq3RAKmHWDT9
         UBqvtpnnWwmr3YYK4eyw00piz4HTYFBipGhVoOzjsyLI3O2MDvhXwdNCctBv+sPmxjnu
         FNyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769599348; x=1770204148;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PTmGB00vk7/kp+zIH4DKz/eDu1tVIye+prcQ+wtOs/w=;
        b=L6oLO9YfBgpPwPsxneEDXez9BwRBqL0HRYLGzhtnb7PbhwFrvWskIqcS50dbzXWUKm
         rZywvTTCYMv/XCj3+0omjdjOjNFGt4RZ3d44djy8Zzx6NC3ke2ZTDyFIswxydcqHuQcQ
         trC8lPlVcfALSfBFOpftRCBZUnaSlULA2BgAUfGLsIGFyttjt1bOi7z247kf7TqqXGHW
         HE/f+iMRGqorgZtgq40AomgB0MU18A5JHy9baOTlwRsnqnKIFjI8Ia6gB1dfxqUVPQjy
         AaAjPvTED2kBkkN37d5Xs+GTEnIHc+327lpxYyZyZ74KW+/JgsaX6YLdX3BnnW5Fv1nK
         c9EA==
X-Forwarded-Encrypted: i=1; AJvYcCUIUILANFIbPNWwtqLhaHyxQKPNdKEoH6B1dUNB9x29gXNAhcrRl6u97MftMZsowPe7pRvVSBT8RbY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwSaW+AgLUWsLF7H/lmIkUDRdEr7wzKnx6OgzLAdZK5tFXz77ty
	lIIe7oxT4Az5YljcicYobUUfYy5OKu8VDd4/0cTaDmnVHWf879T8yFbL
X-Gm-Gg: AZuq6aIY20HRESYrvojgsfJLbGtqqT09j4vxL7UI+WRIb8WovcSMQz4h2aG0on1XPyK
	o1cstG9qBCrOgf/nex4lRZ1pxm8Yj3lvJ70YExqwzhMqGsqar+wwEVIpdON9dYS8s5YC+fWWb1x
	Fz7U/LKMAAgNQu/0PWfdnuptkNlCu6iW1NWByrcypIFgo3LMbGkXcnPJvK4Fi1SUvDoZyBl96Dm
	hFF0UzhP5m0QG9PqdQ8iQOkN6gIMQLG02VMaBlbiwtyNlt5vbtYdus/2X/iMzDtYagRRDKr1sWf
	1qleKyAXxt6TcR2JYriUAJO9rfwDoF5kbE1fgcXAaGU/ENZaRvmZ2EeNOcHgo8aYpdHZVWNLDzu
	rlNQozw+CCLwSvDfuzzOJnSYFNhbp/QerkB4WAmuU5JfMGCU9GM51prL+AniolurPnaklMUWT7G
	9fr7YheeKZ9UfPqGdXrG/8EeacZKtUhnuxr3To/OvPK2ymxWfa0eT3PA7WofXcn7A=
X-Received: by 2002:a05:620a:7103:b0:8b2:ed02:21ea with SMTP id af79cd13be357-8c70b90fee5mr590373385a.67.1769599347874;
        Wed, 28 Jan 2026 03:22:27 -0800 (PST)
Message-ID: <8ec02eba-3271-45ce-8157-0d444ed9da62@gmail.com>
Date: Wed, 28 Jan 2026 12:22:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] xen/riscv: dump GPRs and CSRs on unexpected traps
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Romain Caritey <Romain.Caritey@microchip.com>, xen-devel@lists.xenproject.org
References: <27ab0f8eb6fd6ecef1eeefa4a05e4fe1f43acbbe.1769427484.git.oleksii.kurochko@gmail.com>
 <cf8f345c-185c-4b6f-aad2-7ac1b67fc018@suse.com>
 <debe7d0f-b1a5-4f45-a73d-0a84d136f9c0@suse.com>
 <a2f80fd1-0a6b-4ed4-9d19-bb052fc18228@gmail.com>
 <88edf7a2-c5f1-41fd-9ceb-8cc0c345b7e6@gmail.com>
 <132efa57-bd11-47b9-b3c8-0c09589f70b2@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <132efa57-bd11-47b9-b3c8-0c09589f70b2@suse.com>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 6CCB0A0427
X-Rspamd-Action: no action


On 1/28/26 12:08 PM, Jan Beulich wrote:
> On 28.01.2026 12:01, Oleksii Kurochko wrote:
>> On 1/28/26 11:34 AM, Oleksii Kurochko wrote:
>>> On 1/27/26 10:27 AM, Jan Beulich wrote:
>>>> On 27.01.2026 10:14, Jan Beulich wrote:
>>>>> On 26.01.2026 12:43, Oleksii Kurochko wrote:
>>>>>> Provide additional context when an unexpected exception occurs by
>>>>>> dumping
>>>>>> the relevant Supervisor, Virtual Supervisor (VS), and Hypervisor CSRs,
>>>>>> along with the general-purpose registers associated with the trap.
>>>>>>
>>>>>> Dumping VS-mode CSRs in addition to host CSRs is beneficial when
>>>>>> analysing
>>>>>> VS-mode traps. VSCAUSE, VSEPC, VSTVAL, and related VS state are
>>>>>> required to
>>>>>> properly diagnose unexpected guest traps and potential hypervisor
>>>>>> misconfiguration.
>>>>>> For example, on an illegal-instruction exception the hardware may
>>>>>> record
>>>>>> the faulting instruction in VSTVAL. If VSTVAL is zero, VSEPC should
>>>>>> always
>>>>>> be inspected, and can be used together with objdump to identify the
>>>>>> faulting instruction. Dumping VSCAUSE is also useful when the guest
>>>>>> does
>>>>>> not report it, or when the hypervisor redirects a trap to the guest
>>>>>> using
>>>>>> VSCAUSE, VSTATUS, and VSTVEC, allowing verification that a
>>>>>> subsequent trap
>>>>>> is not caused by incorrect VS state.
>>>>>>
>>>>>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>>>> Acked-by: Jan Beulich <jbeulich@suse.com>
>>>> Hmm, wait, there's another anomaly:
>>>>
>>>>> I still have a question though, which can be addressed incrementally.
>>>>>
>>>>>> --- a/xen/arch/riscv/traps.c
>>>>>> +++ b/xen/arch/riscv/traps.c
>>>>>> @@ -99,12 +99,70 @@ static const char *decode_cause(unsigned long
>>>>>> cause)
>>>>>>        return decode_trap_cause(cause);
>>>>>>    }
>>>>>>    +static void dump_general_regs(const struct cpu_user_regs *regs)
>>>>>> +{
>>>>>> +#define X(regs, name, delim) \
>>>>>> +    printk("%-4s: %016lx" delim, #name, (regs)->name)
>>>>>> +
>>>>>> +    X(regs, ra, " "); X(regs, sp, "\n");
>>>>>> +    X(regs, gp, " "); X(regs, tp, "\n");
>>>>>> +    X(regs, t0, " "); X(regs, t1, "\n");
>>>>>> +    X(regs, t2, " "); X(regs, s0, "\n");
>>>>>> +    X(regs, s1, " "); X(regs, a0, "\n");
>>>>>> +    X(regs, a1, " "); X(regs, a2, "\n");
>>>>>> +    X(regs, a3, " "); X(regs, a4, "\n");
>>>>>> +    X(regs, a5, " "); X(regs, a6, "\n");
>>>>>> +    X(regs, a7, " "); X(regs, s2, "\n");
>>>>>> +    X(regs, s3, " "); X(regs, s4, "\n");
>>>>>> +    X(regs, s5, " "); X(regs, s6, "\n");
>>>>>> +    X(regs, s7, " "); X(regs, s8, "\n");
>>>>>> +    X(regs, s9, " "); X(regs, s10, "\n");
>>>>>> +    X(regs, s11, " "); X(regs, t3, "\n");
>>>>>> +    X(regs, t4, " "); X(regs, t5, "\n");
>>>>>> +    X(regs, t6, " "); X(regs, sepc, "\n");
>>>>> Does this sepc value differ from ...
>>>>>
>>>>>> +static void dump_csrs(unsigned long cause)
>>>> What is this function parameter for?
>>>>
>>>>>> +{
>>>>>> +#define X(name, csr, fmt, ...) \
>>>>>> +    v = csr_read(csr); \
>>>>>> +    printk("%-10s: %016lx" fmt, #name, v, ##__VA_ARGS__)
>>>>>> +
>>>>>> +    unsigned long v;
>>>>>> +
>>>>>> +    X(htval, CSR_HTVAL, " ");  X(htinst, CSR_HTINST, "\n");
>>>>>> +    X(hedeleg, CSR_HEDELEG, " "); X(hideleg, CSR_HIDELEG, "\n");
>>>>>> +    X(hstatus, CSR_HSTATUS, " [%s%s%s%s%s%s ]\n",
>>>>>> +      (v & HSTATUS_VTSR) ? " VTSR" : "",
>>>>>> +      (v & HSTATUS_VTVM) ? " VTVM" : "",
>>>>>> +      (v & HSTATUS_HU)   ? " HU"   : "",
>>>>>> +      (v & HSTATUS_SPVP) ? " SPVP" : "",
>>>>>> +      (v & HSTATUS_SPV)  ? " SPV"  : "",
>>>>>> +      (v & HSTATUS_GVA)  ? " GVA"  : "");
>>>>>> +    X(hgatp, CSR_HGATP, "\n");
>>>>>> +    X(hstateen0, CSR_HSTATEEN0, "\n");
>>>>>> +    X(stvec, CSR_STVEC, " "); X(vstvec, CSR_VSTVEC, "\n");
>>>>>> +    X(sepc, CSR_SEPC, " "); X(vsepc, CSR_VSEPC, "\n");
>>>>> ... the one logged here? Nothing changes the register between entry
>>>>> into the hypervisor and coming here?
>>>> Down below here you have
>>>>
>>>>       X(scause, CSR_SCAUSE, " [%s]\n", decode_cause(v));
>>>>
>>>> which actually (largely) duplicates what do_unexpected_trap() has
>>>> already
>>>> logged.
>>> Missed that, then it would be better to remove this duplication and leave
>>> only printing of CSR_SCAUSE in dump_csrs().
>>>
>>>>    If dump_csrs() gained other uses, the dumping of scause likely is
>>>> wanted, but then likely no scause value would be available to pass
>>>> in? So
>>>> maybe its dumping actually wants to be conditional (and the parameter
>>>> wants to be a boolean)?
>>> Good point. Honestly speaking, I don't know if it will be any other
>>> usages
>>> except this one. But to keep things generic I think it is good idea to
>>> add conditional dumping of scause.
>> As an alternative, we could simply remove the dump_csrs() argument and always
>> print SCAUSE. When running in hypervisor mode, SCAUSE should contain the reason
>> for the trap. Even it is lets say just hypercall and not something faulty, it
>> will contain "Environment call from S-mode" what looks okay to be printed.
>>
>> I tend to prefer this approach slightly. What do you think?
> It means that it'll be logged twice for an unexpected trap. As said, I can
> only recommend to limit the volume of the output in such situations, as
> sometimes all people may be able to get you is screenshots.

It will be logged once, basically, mu suggestion is:

-static void dump_csrs(unsigned long cause)
+static void dump_csrs(void)
  {
  #define X(name, csr, fmt, ...) \
      v = csr_read(csr); \
@@ -156,11 +156,7 @@ static void dump_csrs(unsigned long cause)
  
  static void do_unexpected_trap(const struct cpu_user_regs *regs)
  {
-    unsigned long cause = csr_read(CSR_SCAUSE);
-
-    printk("Unhandled exception: %s\n", decode_cause(cause));
-
-    dump_csrs(cause);
+    dump_csrs();
      dump_general_regs(regs);

~ Oleksii


