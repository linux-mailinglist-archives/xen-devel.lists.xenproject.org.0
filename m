Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aMo7I+4kEGoYUQYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2026 11:42:06 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA9E5B160B
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2026 11:42:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1316522.1585914 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQMNw-0003Bz-PJ; Fri, 22 May 2026 09:41:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1316522.1585914; Fri, 22 May 2026 09:41:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQMNw-0003AY-Lr; Fri, 22 May 2026 09:41:40 +0000
Received: by outflank-mailman (input) for mailman id 1316522;
 Fri, 22 May 2026 09:41:38 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wQMNu-0003AS-PW
 for xen-devel@lists.xenproject.org; Fri, 22 May 2026 09:41:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wQMNt-00E7da-Vt
 for xen-devel@lists.xenproject.org; Fri, 22 May 2026 11:41:38 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a1024ca-5cb7-0a2a0a5109dd-0a2a4501a2aa-28
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 11:41:37 +0200
Received: from [209.85.221.43] (helo=mail-wr1-f43.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a1024d1-c1f2-0a2a45010019-d155dd2bd803-3
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 11:41:37 +0200
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-44e1ebb3122so4390743f8f.2
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 02:41:37 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45eb6cd151asm2575040f8f.13.2026.05.22.02.41.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 May 2026 02:41:36 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1779442897; x=1780047697; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=mvs9EKNx66wxPurTbgSTe8g22KjiF2kCa8E7RV4Cf1w=;
        b=H/o4HcgnfhY4UGPDI5xF8+gL39h+suh5O7aQQ8Won9zjFVhMn2lsH1+d3V5uHbFyYy
         vwGB23rHW528/JVBuQzk2CgBlEZydtyNl9nsww5JyBc4GiC2KWy9bWbvtuT6qhYv27QQ
         tEKgY0ea8AjrHD2vxAugQWXcuHLY7LtKmUNqFR1CFt3hPX5n4E/rTrZV5C+j/PZ1X/r2
         CinKhBEPUU9o1QF+9puihAgJ/e0u8u//q27ZPhdA+RCPdwpAUwqI0FvGssXiSDMBB6kC
         HW6rmNL2IlH8x9nhDXOvY61YXs5k2yTQgyqmBWG1b1tSVqwjVSjSn5rGjEpR6iiIJAR+
         dQgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779442897; x=1780047697;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mvs9EKNx66wxPurTbgSTe8g22KjiF2kCa8E7RV4Cf1w=;
        b=VKfNe6LsoEyrEb2uGno92geDc3kkSlMFKkJG3fIleCEdiK2/LqxFTriAnn0KMWQVxV
         TAY7C/orhoE2AneSrkXVOOC84eVeg8XhVtB9+Bby2xg7R0CQA3qZM9N0PUwZ4likaRwD
         lflpKrTRptuBqo1G0TLkebIEY0FS7P7OXFhVZi1ibDm0MAyHVsIjNMehkWg6uFcU5lM2
         9XJxsQvqADXvAf+VXDHiQF0qdpKuflieKz6Yj1Xvt9tktXWQknMHqnrJoAu1QCJGogfi
         1rc74KIBl/9Ua0+M7ImU26pGZ2wQXOhWwjJnfQbaJnfIp1DvGTk9apgR2d3p4vJwU6lr
         TUiQ==
X-Forwarded-Encrypted: i=1; AFNElJ8h08wtds1o3C4wtOcoV09pnWJfqaRd8RDUEiUtcXHMsLSL3zNalIiLtI4q22bMNwseApNjtKKV0mQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw4Mwg7gO3FhiaPfbRrRio5m4TUZpYujv71yoR3KeFgdC6Lj2Uu
	gR7HSKZ06WRTg5n0n5N4hSyEnWA03Vt4ovo0nHYAEsX58bv3K/lR4vz0QpfTVfZARA==
X-Gm-Gg: Acq92OFtj51E5HRWn5OXkTfdARSQvPj9C0J78H6BEjBtXTUul9XUvngBaCb+oPhzoPX
	sbNED2d/dNHAChXSJxfVJFPI7xzCjDyrYnNIxDkHVcEGFZJvqVCnUM1tZjAojeEZIvF5b11WJMd
	+w0ThSwz/YrIcfXiXhP1DrdY0UsTqxF3FGyXrH8zYHUM02lPO/iF/Zekp9BezG0IDpkeXSSReM5
	JIPIUdPY457ut2Q7iGo2HlnjNbofR763qhktfZ8HLJRiiO7v6mbqetVfNpwpFc2Cse74FPXGI5r
	Ek8818hhQgP+Py6Ea6jK0x9GzvLq8E5/EQwmtirfH7vym4Ih1a1OxNV2JBTmtCQ+tyiUlaz/CWL
	MXQKiTHNt1HqU9OHatkCo6eQglZXymIPeIpyRzQSMPF8/7UxozuB21u8ZS+A4bh8WNLKGoOAtlb
	/CVABXE5IP0+vY+2YHKc7arDiMUX2eJ6Hu9soa2cL0C/wRvc6UblSOdQ+td9KqBxVYfWFLK+1i2
	YFBHN4y4sQpzhjqMllEG6R1Vg==
X-Received: by 2002:a5d:5f54:0:b0:43d:67f4:91aa with SMTP id ffacd0b85a97d-45eb3af66e2mr3835573f8f.40.1779442897167;
        Fri, 22 May 2026 02:41:37 -0700 (PDT)
Message-ID: <11cbd069-8e2b-4678-a80c-82d0d4318f70@suse.com>
Date: Fri, 22 May 2026 11:41:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v1 5/7] x86/hvm: Move INSTR_* constants to hvm.h
To: Ross Lagerwall <ross.lagerwall@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>, Teddy Astie <teddy.astie@vates.tech>,
 xen-devel@lists.xenproject.org
References: <20260518131404.3716969-1-ross.lagerwall@citrix.com>
 <20260518131404.3716969-6-ross.lagerwall@citrix.com>
 <a5b2561f-0225-4f18-bc74-7f66227bc807@suse.com>
 <6a6dd703-cb9f-4a13-b0da-ff1a9d841bc5@citrix.com>
 <4aac1424-1a65-4af2-b9cd-0ec70eee042a@suse.com>
 <9cd57494-3b11-4e75-a8bd-4fe2767f0490@citrix.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <9cd57494-3b11-4e75-a8bd-4fe2767f0490@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1779442897-AE342FF4-0764C774/0/0
X-purgate-type: clean
X-purgate-size: 3570
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,suse.com:mid,suse.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ross.lagerwall@citrix.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: EEA9E5B160B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 22.05.2026 11:14, Ross Lagerwall wrote:
> On 5/21/26 12:57 PM, Jan Beulich wrote:
>> On 21.05.2026 12:12, Ross Lagerwall wrote:
>>> On 5/19/26 10:49 AM, Jan Beulich wrote:
>>>> On 18.05.2026 15:14, Ross Lagerwall wrote:
>>>>> --- a/xen/arch/x86/include/asm/hvm/hvm.h
>>>>> +++ b/xen/arch/x86/include/asm/hvm/hvm.h
>>>>> @@ -851,6 +851,35 @@ static inline void hvm_sync_pir_to_irr(struct vcpu *v)
>>>>>            alternative_vcall(hvm_funcs.sync_pir_to_irr, v);
>>>>>    }
>>>>>    
>>>>> +/*
>>>>> + * Encoding for svm_get_insn_len().  We take X86EMUL_OPC() for the main
>>>>> + * opcode, shifted left to make room for the ModRM byte.
>>>>
>>>> With all of this moved, the comment wants adjusting, at the very least by
>>>> putting "e.g." in front of the function name.
>>>>
>>>>> + * The Grp7 instructions have their ModRM byte expressed in octal for easier
>>>>> + * cross referencing with the opcode extension table.
>>>>> + */
>>>>> +#define INSTR_ENC(opc, modrm) (((opc) << 8) | (modrm))
>>>>> +
>>>>> +#define INSTR_PAUSE      INSTR_ENC(X86EMUL_OPC_F3(0, 0x90), 0)
>>>>> +#define INSTR_INT3       INSTR_ENC(X86EMUL_OPC(   0, 0xcc), 0)
>>>>> +#define INSTR_ICEBP      INSTR_ENC(X86EMUL_OPC(   0, 0xf1), 0)
>>>>> +#define INSTR_HLT        INSTR_ENC(X86EMUL_OPC(   0, 0xf4), 0)
>>>>> +#define INSTR_XSETBV     INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0321) /* octal-ok */
>>>>> +#define INSTR_VMRUN      INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0330) /* octal-ok */
>>>>> +#define INSTR_VMCALL     INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0331) /* octal-ok */
>>>>> +#define INSTR_VMLOAD     INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0332) /* octal-ok */
>>>>> +#define INSTR_VMSAVE     INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0333) /* octal-ok */
>>>>> +#define INSTR_STGI       INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0334) /* octal-ok */
>>>>> +#define INSTR_CLGI       INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0335) /* octal-ok */
>>>>> +#define INSTR_INVLPGA    INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0337) /* octal-ok */
>>>>> +#define INSTR_RDTSCP     INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0371) /* octal-ok */
>>>>> +#define INSTR_INVD       INSTR_ENC(X86EMUL_OPC(0x0f, 0x08), 0)
>>>>> +#define INSTR_WBINVD     INSTR_ENC(X86EMUL_OPC(0x0f, 0x09), 0)
>>>>> +#define INSTR_WRMSR      INSTR_ENC(X86EMUL_OPC(0x0f, 0x30), 0)
>>>>> +#define INSTR_RDTSC      INSTR_ENC(X86EMUL_OPC(0x0f, 0x31), 0)
>>>>> +#define INSTR_RDMSR      INSTR_ENC(X86EMUL_OPC(0x0f, 0x32), 0)
>>>>> +#define INSTR_CPUID      INSTR_ENC(X86EMUL_OPC(0x0f, 0xa2), 0)
>>>>> +
>>>>>    #else  /* CONFIG_HVM */
>>>>
>>>> I further wonder whether putting this in hvm.h is a good idea. Is there
>>>> anything wrong with using a brand new header, e.g. instr-enc.h?
>>>
>>> No objection to that. I do wonder though if using the instruction encoding like
>>> this is the best way of passing through the instruction to the fast path in
>>> hvm_emulate_one_ctxt() since I think in some cases the instruction encoding
>>> may not match the actual instruction that triggered the VMEXIT.
>>
>> Do you have an example? If so, that would indeed be at risk of being misleading
>> or actively confusing. (Of course INSTR_VMCALL wants renaming, as was already
>> suggested.)
>>
> 
> VMEXIT_CR0_READ may be triggered by MOV-from-CR or SMSW. There are probably
> other examples...

Like LMSW, then also relevant to VMX. I think these indeed better wouldn't use
the wrong INSTR_*. On SVM with decode assists, SMSW can be identified, but
LMSW / CLTS are ambiguous without fetching the insn.

Jan

