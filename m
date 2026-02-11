Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4PGTK0dQjGmukgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 10:47:51 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2330A122E8D
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 10:47:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1227128.1533464 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vq6ow-0000rZ-VM; Wed, 11 Feb 2026 09:47:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1227128.1533464; Wed, 11 Feb 2026 09:47:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vq6ow-0000pR-SE; Wed, 11 Feb 2026 09:47:42 +0000
Received: by outflank-mailman (input) for mailman id 1227128;
 Wed, 11 Feb 2026 09:47:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wIvg=AP=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vq6ov-0000pL-LY
 for xen-devel@lists.xenproject.org; Wed, 11 Feb 2026 09:47:41 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b3e0c226-072e-11f1-9ccf-f158ae23cfc8;
 Wed, 11 Feb 2026 10:47:39 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-48329eb96a7so24601305e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Feb 2026 01:47:39 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-67-101.play-internet.pl.
 [109.243.67.101]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4835a610ce2sm19755445e9.1.2026.02.11.01.47.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Feb 2026 01:47:37 -0800 (PST)
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
X-Inumbo-ID: b3e0c226-072e-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770803259; x=1771408059; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EYnD8wgs7frNdBuiftkMNMh392wHVUhVfUNHizVnTmc=;
        b=Qa5v/bf81BzTFutKurm8nSTP65SwRj6RldxsykSTjpBXE0Jp0BYv3CV7OgtzgqW7AN
         Q5V/VsSU4oXggq8r5T/gGWeTURZ6NTsaGGCFDiZpnenkkGdf9qkX+qc3+RJuVRKwuppC
         Uf1kPtM8uDlGhlIbF84xfPCuzvh41liVXI0n+dmiHp0y6lObEN4bLRRjw15Jnu2Zpq23
         MZXUcmjrt4LlTAXqmUFpxulpqyuqSGZHVl65S/i7vBX5tDqvHfhgb4nJICAG5tBNTAfb
         miWrAIFajSXjAb6HZZRU/oYCTkSmIXtXKF6umm6tVMLhFQC5abAz3+H06aZNEkYtw9+W
         Ua6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770803259; x=1771408059;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EYnD8wgs7frNdBuiftkMNMh392wHVUhVfUNHizVnTmc=;
        b=BgXhgZtZbQByqyD8tXZC98Y9kaXsMDdUBHGvZ9e0Q34vH4norxd205EXOPJIV1Si/r
         UwwKALEar2i5E53WtchKjgy91Qb488nN4bUf7WhhhoZI9C5oRS2MmPht7zT4LQVJN52y
         YsMjcxq6CTSgoA+9W8az+Dmmj4wUIHPGIBlsSHwSbKFlEZmIW6Vr2V3xl5rcZMz6yy0B
         VaXt6EanE8HrrXyO3ehG52uWKb2WExg6yfqN9EYeGPAf9f8DBITGylgOTh34Bz7BXvXl
         GaF4FC42BmVPxUe9Wh/bw9HfG2J08DPlYTwEdurLbogkz7pvoSqwuuL1ZwmniZQNOyIW
         jiJQ==
X-Forwarded-Encrypted: i=1; AJvYcCUm7Vb5w3OcGihsdrTPFEOPb8QOFn73hFiaoDZt3HZfIoKbuYqm6kuyFVCclk2RrQ8w347q5xFRakA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxdu7KN878KnJYRMNgKM58ZvGUh9Kljjzfg7mNQ5t6KXBsZFp12
	d5HcZ3pW5dS646Ylv4PLqhSRkikjGoLxRDhv1j1Gpx0TlOSPUYduuI0i
X-Gm-Gg: AZuq6aL7X2mSiTJc423ryoRHpjc99UyA1OTW7BmYjOMHl5J14FEZpEtYwVZ3BhgYbHK
	6MAMHwjfWjSP4oQ31kM+n19gNBKcVS2WdXC3dy3Ghyi8ZrfL+IdDtBgH3gEnFtfdg4ZD8uyLLN+
	XK21GIekXvfe6Tfqg1PnAOjmO6PCazkqSgdB5o8qYLFfH6BYO0+mHa5RSVdSwhJ1OUCGXSjf3CY
	/r3UddJw4TxRrNk8Yg5/hbP+53eTc4wRTPJmtgpfUN14q++5rE1X0/YrVK1I5uoadKaLe4kqIX5
	2cKkjoiFS1Bn1HZCTkOgb6Hx5DeDgdSn+KT00NtlV8yRv+zvIaLQuEnSDNEHxvfMGRN+kEjpTIQ
	XAUuDGOdtOcy2E5XzHHXRMx07629wAoSTE9tS6IqzlUBjkXYMKglIwWroJNb0DWjRV0tyw3LBej
	y1j1ZILf9SBjIjOSZBrHjMR6OuhHxBLm4RxrNUc2nim7h5ZjlUshCAeX+Ptrn3V7+/qE+C2Ut8s
	Jo=
X-Received: by 2002:a05:600c:4f82:b0:480:4d39:84b3 with SMTP id 5b1f17b1804b1-4835ebecc40mr13040005e9.6.1770803258563;
        Wed, 11 Feb 2026 01:47:38 -0800 (PST)
Message-ID: <3650d684-f6c8-4f73-ad8b-3c6dd64c256c@gmail.com>
Date: Wed, 11 Feb 2026 10:47:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/16] xen/riscv: detect and store supported hypervisor
 CSR bits at boot
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1770650552.git.oleksii.kurochko@gmail.com>
 <cfb2bd81ca9c43f29f5d77a918e1da7a8c55318e.1770650552.git.oleksii.kurochko@gmail.com>
 <a660d245-0c63-409c-8609-ba767fff9e65@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <a660d245-0c63-409c-8609-ba767fff9e65@suse.com>
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
X-Rspamd-Queue-Id: 2330A122E8D
X-Rspamd-Action: no action


On 2/11/26 8:49 AM, Jan Beulich wrote:
> On 09.02.2026 17:52, Oleksii Kurochko wrote:
>> Some hypervisor CSRs expose optional functionality and may not implement
>> all architectural bits. Writing unsupported bits can either be ignored
>> or raise an exception depending on the platform.
>>
>> Detect the set of writable bits for selected hypervisor CSRs at boot and
>> store the resulting masks for later use. This allows safely programming
>> these CSRs during vCPU context switching and avoids relying on hardcoded
>> architectural assumptions.
>>
>> Note that csr_set() is used instead of csr_write() to write all ones to
>> the mask, as the CSRRS instruction, according to the RISC-V specification,
>> sets only those bits that are writable:
>>      Any bit that is high in rs1 will cause the corresponding bit to be set
>>      in the CSR, if that CSR bit is writable.
>> In contrast, the CSRRW instruction does not take CSR bit writability into
>> account, which could lead to unintended side effects when writing all ones
>> to a CSR.
> Hmm, I wonder in how far the wording there is precise. In a subsequent
> paragraph there is:
>
> "For both CSRRS and CSRRC, if rs1=x0, then the instruction will not write
>   to the CSR at all, and so shall not cause any of the side effects that
>   might otherwise occur on a CSR write, nor raise illegal-instruction
>   exceptions on accesses to read-only CSRs."
>
> To me, a read-only CSR is a CSR with all bits read-only. With this
> interpretation, the two statements conflict with one another. Is this
> interpretation ruled out somewhere?

Good question. Actually by read-only CSRs RISC-V spec means that a CSR is
read-only by its design:
   The standard RISC-V ISA sets aside a 12-bit encoding space (csr[11:0])
   for up to 4,096 CSRs. By convention, the upper 4 bits of the CSR address
   (csr[11:8]) are used to encode the read and write accessibility of the
   CSRs according to privilege level as shown in Table 3. The top two bits
   (csr[11:10]) indicate whether the register is read/write (00,01, or 10)
   or read-only (11).
But logically it seems like if CSR is read-only then technically all CSR
bits are read-only as anyway an exception will occur if CSR is read-only.

So CSRRW* can't be used for such read-only CSRs as write always happen
and it will lead to an exception.

I can add in the commit message that the quote about CSRRS considers only
not read-only CSRs if it makes sense as if CSR is read-only then we won't
calculate a mask for it.

>
>> Masks are calculated at the moment only for hdeleg, henvcfg, hideleg,
> Nit: First one is hedeleg.
>
>> hstateen0 registers as only them are going to be used in the follow up
>> patch.
>>
>> If the Smstateen extension is not implemented, hstateen0 cannot be read
>> because the register is considered non-existent. Instructions that attempt
>> to access a CSR that is not implemented or not visible in the current mode
>> are reserved and will raise an illegal-instruction exception.
>>
>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>> ---
>> Changes in V3:
>>   - New patch.
>>
>> --- a/xen/arch/riscv/setup.c
>> +++ b/xen/arch/riscv/setup.c
>> @@ -32,6 +32,8 @@
>>   unsigned char __initdata cpu0_boot_stack[STACK_SIZE]
>>       __aligned(STACK_SIZE);
>>   
>> +struct csr_masks __ro_after_init csr_masks;
> setup.c would be nice to only have __init functions and __initdata data.
> Really up to now that's the case, and I wonder why the makefile doesn't
> leverage this by using setup.init.o in place of setup.o. This variable
> would likely better live elsewhere anyway, imo: Somewhere it's actually
> (going to be) used.

I put it here as I wasn't able to find better place. If it is okay to have
it in domain.c then I'm okay to move this variable there.


>
>> @@ -70,6 +72,28 @@ static void * __init relocate_fdt(paddr_t dtb_paddr, size_t dtb_size)
>>       return fdt;
>>   }
>>   
>> +void __init init_csr_masks(void)
>> +{
>> +    register_t old;
>> +
>> +#define X(csr, field) \
>> +        old = csr_read(CSR_##csr); \
>> +        csr_set(CSR_##csr, ULONG_MAX); \
>> +        csr_masks.field = csr_read(CSR_##csr); \
>> +        csr_write(CSR_##csr, old)
> See my remark on the earlier patch regarding locally used macros. You
> shouldn't ...
>
>> +    X(HEDELEG, hedeleg);
>> +    X(HENVCFG, henvcfg);
>> +    X(HIDELEG, hideleg);
>> +
>> +    if ( riscv_isa_extension_available(NULL, RISCV_ISA_EXT_smstateen) )
>> +    {
>> +        X(HSTATEEN0, hstateen0);
>> +    }
> ... be required to put braces here. (Then I'd further recommend to make "old"
> local to the macro's scope.)
>
> I'm also inclined to recommend to avoid an inflation of X() macros. Give
> each such macro a somewhat sensible (yet still short) name. This way you'll
> avoid Misra rule 5.4 ("Macro identifiers shall be distinct") concerns, in
> combination with rule 20.5 ("#undef should not be used"). Note that we
> didn't accept the latter rule, hence why I'm only saying "concerns", not
> "violations".

Thanks for explanation MISRA stuff.

I will rename X() here to INIT_CSR_MASK() and add do {...} while(0) to deal
with if()'s brackets.

~ Oleksii


