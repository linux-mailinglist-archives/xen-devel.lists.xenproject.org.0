Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eAUaNq1Fd2mMdQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jan 2026 11:45:01 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE848729C
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jan 2026 11:45:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1213552.1524016 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkK4p-0008Qt-2s; Mon, 26 Jan 2026 10:44:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1213552.1524016; Mon, 26 Jan 2026 10:44:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkK4p-0008Os-0L; Mon, 26 Jan 2026 10:44:11 +0000
Received: by outflank-mailman (input) for mailman id 1213552;
 Mon, 26 Jan 2026 10:44:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zrcg=77=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vkK4n-0008Om-9u
 for xen-devel@lists.xenproject.org; Mon, 26 Jan 2026 10:44:09 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eb96ea96-faa3-11f0-b15f-2bf370ae4941;
 Mon, 26 Jan 2026 11:43:59 +0100 (CET)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-65813e3bdaaso7507674a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 26 Jan 2026 02:43:58 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-67-101.play-internet.pl.
 [109.243.67.101]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6584b3e08a6sm4821910a12.6.2026.01.26.02.43.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Jan 2026 02:43:57 -0800 (PST)
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
X-Inumbo-ID: eb96ea96-faa3-11f0-b15f-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769424238; x=1770029038; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7lNXKcYdnQ1/qSUu8FaqbTuOxIFbGYXxJIUnr6BKoBU=;
        b=a8C88b6VY0+3iBZlaFCE8CjkzJ9YCCq6SONtRurkbarRr14bdkxbkKH5f2Q9pKO1pp
         Otl27i2S4RiqiwvcaE3Hrk/DDPAMsKmbiHyF92Ge/LGUSLYCFoE1XTF/U6g1EnehKKv3
         tgRDRbWyK+swrYlz2nPHYSCPw91LI0J4rIBlZqUzTYeRiURF4bhSSJ7S42gPSgieedSD
         7peoh2NX7BKmCYNCsIyQ47UfHLSSWDbfO/WhZHoJMwv1ObD05mvLjnDTqqR7vP8D/bFi
         pwtBvLiixM/5JY3Pck3OnY3AKWJXWSfkU+S1RAT1OTwdIJFu8xTzqi09M0D3BQBQ7svg
         a7nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769424238; x=1770029038;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7lNXKcYdnQ1/qSUu8FaqbTuOxIFbGYXxJIUnr6BKoBU=;
        b=ZPBGiWCRlP3mEF9U0VVerLgrPnQ134c0Ss/TLTi/yihVwc890wSHaku12zPtaO4Tja
         5pX7t8FNbAG7ZATFuWvZCXhMMf56b7N5EGsC63AizcAzGU38jQwykS9uJfwads337UEX
         TVGHSkAxjB0jciGJWWe4WMVY6fHZvjjonISBT1B/rlLuWtfK/yt5yfQNljmANLafPeDD
         j82XJdZ6ba76CSX4zoQDR4yoVLN/A/HzoODWHN6wZdo8ls218LYuJtMjsSryjAIRONtX
         1ebWqxc1w/MwjqP9M1MFvT8vE3pwNT212AiYUu+iv/wqHGhDHV8YIaie+0BDru4LSYRM
         4/Mg==
X-Forwarded-Encrypted: i=1; AJvYcCV3qEaMFjt065vmZim64jXP/0NxmEy6UTpJ2ef5pWtiPC5By5aDKXyHw6Y194W4hvuLr9F7kSMhU6o=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzUE6MVFaIcX+B3iB8C+QTcqZxW1R5Zs5qsIAmSPgMZCF/lXFnw
	xo3SVg2yq+juzgqf6trDqyoA6IstbLZw3jThG9XXTXDiLQqfobuoiBGN
X-Gm-Gg: AZuq6aKXmxE9RMgMmn0ES93S6tWqxzl3ewQjoHjluvd2MX8yylqHOswcII9azS5IEKs
	8EyMaIxJYTmSNWy8NY9ZvUtJy1Iee5TwsZ/zbxyqy6EtsYmMOr/4jU+zEXv1+ipmHFyXUfQolCE
	0jYRCWXIs++1WfZkHw4pKlCfzrIae5TEiRWn27KN8Rj8ADEpd2HO9fzRA27OSIQQ7kc0MIc8gKi
	PyAHk0fzvChc+NupoZB1o+CLwwy1S7gIquMy0KyrEZ3d/yJ7rxjsiW8n6PeZju/oHTE9BemR6AA
	2AiYuOPuPgU6yTVNYgVDQFEGjGPklpYTpI/bl1EA5ADr9ksIDAFYvszzbuwpup8yatJ3STZ5Wh5
	F69+Swk39bkv8c75dg+w+jFTG4y1kLRQVcSRmIO5J5jNgxf4pHPliJOipb+tchPiSv57CrMxw67
	ZDSjRggmTQqurbSAvw4DXGxlIIoSDfnOIg/fIXqllKzS1VKYTjZPAYeSYSqNonzV7bXLKXT8COL
	A==
X-Received: by 2002:a05:6402:4306:b0:658:1224:3d5b with SMTP id 4fb4d7f45d1cf-658709c0267mr2987332a12.1.1769424237992;
        Mon, 26 Jan 2026 02:43:57 -0800 (PST)
Message-ID: <5e3cd0da-d8d0-4232-9612-14ea70bd66e4@gmail.com>
Date: Mon, 26 Jan 2026 11:43:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] xen/riscv: dump GPRs and CSRs on unexpected traps
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <0b57db49d40b336429dd4fd63faf18f6bb17ac1a.1769179393.git.oleksii.kurochko@gmail.com>
 <9a68c272-1c76-4f1f-89ff-ff86d5181bcc@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <9a68c272-1c76-4f1f-89ff-ff86d5181bcc@suse.com>
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
X-Rspamd-Queue-Id: 4DE848729C
X-Rspamd-Action: no action


On 1/26/26 11:09 AM, Jan Beulich wrote:
> On 26.01.2026 09:38, Oleksii Kurochko wrote:
>> --- a/xen/arch/riscv/traps.c
>> +++ b/xen/arch/riscv/traps.c
>> @@ -99,12 +99,81 @@ static const char *decode_cause(unsigned long cause)
>>       return decode_trap_cause(cause);
>>   }
>>   
>> +static void dump_general_regs(const struct cpu_user_regs *regs)
>> +{
>> +#define GPR_LIST \
>> +    X(regs, ra, " ") X(regs, sp, "\n") \
>> +    X(regs, gp, " ") X(regs, tp, "\n") \
>> +    X(regs, t0, " ") X(regs, t1, "\n") \
>> +    X(regs, t2, " ") X(regs, s0, "\n") \
>> +    X(regs, s1, " ") X(regs, a0, "\n") \
>> +    X(regs, a1, " ") X(regs, a2, "\n") \
>> +    X(regs, a3, " ") X(regs, a4, "\n") \
>> +    X(regs, a5, " ") X(regs, a6, "\n") \
>> +    X(regs, a7, " ") X(regs, s2, "\n") \
>> +    X(regs, s3, " ") X(regs, s4, "\n") \
>> +    X(regs, s5, " ") X(regs, s6, "\n") \
>> +    X(regs, s7, " ") X(regs, s8, "\n") \
>> +    X(regs, s9, " ") X(regs, s10, "\n") \
>> +    X(regs, s11, " ") X(regs, t3, "\n") \
>> +    X(regs, t4, " ") X(regs, t4, "\n")
>> +
>> +#define X(regs, name, delim) \
>> +    printk("\t %-4s: %016lx" delim, #name, (regs)->name);
> No semicolon here please; that should be supplied at the use sites of
> such a macro.

I thought about this option, but decided it would be fine to do in this
way as it is a local marco and isn't expected to be used anywhere else,
so it will help to avoid a bunch of semicolons where X macro used now.
Anyway, I am okay to rework that.

>
> As to the format string: If past the leading tab you want an extra
> padding blank, why not "\t%-5s ..."? Question however is why this deep
> indentation is wanted in the first place. I'd suggest to omit the tab
> in particular.

I will check how it will look, probably we could really just drop \t and
use only "%-4s".


>
>> +    GPR_LIST
> What use is this macro? All it does is hamper readability, by requiring
> the line-continuation backslashes in its definition.

Agree, it doesn't really useful to have GPR_LIST. I will just leave X macro
and open-coded what is now in GPR_LIST instead.

>
>> +#undef X
>> +#undef GPR_LIST
>> +}
>> +
>> +static void dump_csrs(unsigned long cause)
>> +{
>> +#define CSR_LIST \
>> +    X(stvec, CSR_STVEC, " ") X(vstvec, CSR_VSTVEC, "\n") \
>> +    X(sepc, CSR_SEPC, " ") X(vsepc, CSR_VSEPC, "\n") \
>> +    X(stval, CSR_STVAL, " ") X(vstval, CSR_VSTVAL, "\n") \
>> +    X(status, CSR_SSTATUS, " ") X(vsstatus, CSR_VSSTATUS, "\n") \
>> +    X(satp, CSR_SATP, "\n") \
>> +    X(scause, CSR_SCAUSE, " [%s]\n", \
>> +      decode_cause(v)) \
>> +    X(vscause, CSR_VSCAUSE, " [%s]\n\n", \
>> +      decode_cause(v)) \
> Anything that can help save space (as indicated, output may go to a limited size
> screen) should imo be leveraged. IOW better no double newline here, nor ...

For it could be useful visually separate group of hypervisor-related registers.

>
>> +    X(hstatus, CSR_HSTATUS, " [%s%s%s%s%s%s ]\n", \
>> +      (v & HSTATUS_VTSR) ? " VTSR" : "", \
>> +      (v & HSTATUS_VTVM) ? " VTVM" : "", \
>> +      (v & HSTATUS_HU)   ? " HU"   : "", \
>> +      (v & HSTATUS_SPVP) ? " SPVP" : "", \
>> +      (v & HSTATUS_SPV)  ? " SPV"  : "", \
>> +      (v & HSTATUS_GVA)  ? " GVA"  : "") \
>> +    X(hgatp, CSR_HGATP, "\n") \
>> +    X(htval, CSR_HTVAL, "\n") \
>> +    X(htinst, CSR_HTINST, "\n") \
>> +    X(hedeleg, CSR_HEDELEG, "\n") \
>> +    X(hideleg, CSR_HIDELEG, "\n") \
>> +    X(hstateen0, CSR_HSTATEEN0, "\n\n")
> ... here. In this latter case it's questionable anyway, as apparently you
> have this here to separate from the GPRs being logged subsequently. Just
> that right here you don't know whether your caller actually means to do
> so.

With this one, I agree that it is not the best one place for double newline.
It was necessary to avoid printk("\n") before GPRs dumping.

In general, I am fine with dropping the double newline and using a single
newline, as this separation is probably only useful to me.

>
> As to grouping: How about further putting hedeleg and hideleg on a single
> line? Maybe also htval and htinst?

Good point. I will apply theses suggestions.

>
>> +#define X(name, csr, fmt, ...) \
>> +do { \
>> +    unsigned long v = csr_read(csr); \
>> +    printk("\t %-10s: %016lx" fmt, #name, v, ##__VA_ARGS__); \
>> +} while (0);
>> +
>> +    CSR_LIST
> Same remarks here as above. The issue is actually worse here, as CSR_LIST
> uses "v" which it isn't passed.

I will declare local variable v in dump_csrs() and use it. Considering that
this macros is declared and used only inside this function I think I can
not pass it to X macro.

~ Oleksii


