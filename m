Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QPzGBkVAsGkehgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2026 17:01:09 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DF2025433A
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2026 17:01:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1250261.1547728 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzzVp-0004Oe-5r; Tue, 10 Mar 2026 16:00:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1250261.1547728; Tue, 10 Mar 2026 16:00:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzzVp-0004Ml-39; Tue, 10 Mar 2026 16:00:49 +0000
Received: by outflank-mailman (input) for mailman id 1250261;
 Tue, 10 Mar 2026 16:00:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eHsH=BK=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vzzVn-0004Mf-Vd
 for xen-devel@lists.xenproject.org; Tue, 10 Mar 2026 16:00:48 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4c636630-1c9a-11f1-9ccf-f158ae23cfc8;
 Tue, 10 Mar 2026 17:00:45 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-48334ee0aeaso106670615e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 10 Mar 2026 09:00:45 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-67-101.play-internet.pl.
 [109.243.67.101]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4852470c697sm115928445e9.31.2026.03.10.09.00.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Mar 2026 09:00:44 -0700 (PDT)
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
X-Inumbo-ID: 4c636630-1c9a-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773158445; x=1773763245; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AQV8fZ84ZRFEpZsKly3NgEQ81YLTvarXOg/rJ1/KrGM=;
        b=kjdNPiDr/0vTz7EHCuB8qc26VNR02x9P5X/Nie+nvYbqzyw/JEQkZs1TBdIup3nSzO
         cJqpVbq9/q7k8OczsKSoLz7wIB5qMZvUxOKt9SlMIO6kJvXiukVZYT3fHXiNpZtbFAVx
         PqrsKZ8vlbvOWhZ4uceiXJaSvpcy1BFzRjMot0o/tFXJe2igixED/Tyrn8accQcSWILU
         jLBM5P1Q/DCDjjI55da9jWlSpHucOfeN2xRJVMqt9NvzLGbUNDJd/fPnBQretcxhmybp
         BGeTKYpHwHJ5Rv4ORHg+QbZXxBOYwGEJNX0LmK8xHlRa+d9ZbTp07A5Y9p+HJ5iK637C
         uypw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773158445; x=1773763245;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AQV8fZ84ZRFEpZsKly3NgEQ81YLTvarXOg/rJ1/KrGM=;
        b=MyszPuNCq6UXkHO0OFXlHmEFebHO78nywxG7/xJm9fpcwuvNMFmfNguPLFWPwBrgoE
         qRS9CLYf/zg6iMj4iEQ+KqrIB8Bjby9K9omWY1lg5jNuewwpn6xQKWINY8XlDEVNK8Y/
         G2IJYY3NsjIFr4MTyXVYrj7WQ69DKx34zv11+T30j0uos2sLUHfkYR5Ml7OEMSav+A7P
         qwklf4Ahm6LGT+CJbCZMa4oT+IloqHpTKpc7SeLi9twl++TvfF1vinAOowzPp13P52Js
         RXhLGFESIAxTFjQBoPo2vdcMRB5oZ0U9Lj0r4SPRoWqhOTS5ytzL7RDP/LyxBRXv19hQ
         Sgag==
X-Forwarded-Encrypted: i=1; AJvYcCW4Av+Uhlask9kuY2O5OQlbLTcPMeIqB+nIcNez2geaH50dS8ZGxcUpC++UqqQbDBZv/6Taqd228j8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzqUNIBKxpYkZ82+zBfqgCPS6IE5QsoJTckLSfP7OYK8YCY2P+K
	mk9MkklYjKwnKm1gA6sQJj7g5KZ5pqgM9p/FbRuvSeuWNv+39IIbECmB
X-Gm-Gg: ATEYQzwAi0Ane0SWwD9Ijs6AVE8eDfsMt0AFBKJJXsSbMFe1XJ6EFBOHRb9cKwV0TQZ
	PoyQ+D+gmT/kYhq/tVpZr6dkc8K+luuA59OxcVWwLnOx+lGj5cA5KoHvIUkoYUY+knxhPeYXB07
	Kuj7m8xMaAak+KmjGTAeteAT37uuNFg3vcQTuSCkYHJSwPWAyQw9MxekaZKAoo1/GWoM16E3eTe
	zj2BHK56XMjiSnkVPUmb+gBTJ/U5fMqo1e4DSxaWneAw70F2B2gIvRUSg9Md0pQ13poNhht2P+i
	pQXIvf+/3n1vlC7DZ4BPQNcCc+rmcBCy1726XU99Z2clhDVrGPtChXFSDehIHWsYXWUH2gIZqKS
	/J9GrNLnahdv3nmgrmk+joy1MrZj97eOJCFBoBwi9tiNH2MAL6W6/XacHKSLTlCw36PQ3eRtz2q
	dYkxVzryE70rjJ7NokB+lNU7/ex4O6Dtm3wKOJsbinewODARstTSZWJUdb0jLqhah+V+gAuDvc3
	dHCEFs=
X-Received: by 2002:a05:600c:3b92:b0:485:3b00:f939 with SMTP id 5b1f17b1804b1-4853b00fa43mr148729915e9.8.1773158444677;
        Tue, 10 Mar 2026 09:00:44 -0700 (PDT)
Message-ID: <5d15bc9b-ead9-4690-b5cd-3b63d83537b6@gmail.com>
Date: Tue, 10 Mar 2026 17:00:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 01/14] xen/riscv: detect and store supported hypervisor
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
References: <cover.1772814110.git.oleksii.kurochko@gmail.com>
 <3201951150104f17593e16c7ba00ada51ac1e10f.1772814110.git.oleksii.kurochko@gmail.com>
 <2de7f459-00b3-4968-aaa2-9067cb0c4aa4@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <2de7f459-00b3-4968-aaa2-9067cb0c4aa4@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 7DF2025433A
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
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.997];
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
X-Rspamd-Action: no action


On 3/10/26 9:11 AM, Jan Beulich wrote:
> On 06.03.2026 17:33, Oleksii Kurochko wrote:
>> Some hypervisor CSRs expose optional functionality and may not implement
>> all architectural bits. Writing unsupported bits can either be ignored
>> or raise an exception depending on the platform.
>>
>> Detect the set of writable bits for selected hypervisor CSRs at boot and
>> store the resulting masks for later use. This allows safely programming
>> these CSRs during vCPU context switching and avoids relying on hardcoded
>> architectural assumptions.
>>
>> Use csr_read()&csr_write() instead of csr_swap()+all ones mask as some
>> CSR registers have WPRI fields which should be preserved during write
>> operation.
>>
>> Also, ro_one struct is introduced to cover the cases when a bit in CSR
>> register (at the momemnt, it is only hstateen0) may be r/o-one to have
>> hypervisor view of register seen by guest correct.
>>
>> Masks are calculated at the moment only for hedeleg, henvcfg, hideleg,
>> hstateen0 registers as only them are going to be used in the follow up
>> patch.
>>
>> If the Smstateen extension is not implemented, hstateen0 cannot be read
>> because the register is considered non-existent. Instructions that attempt
>> to access a CSR that is not implemented or not visible in the current mode
>> are reserved and will raise an illegal-instruction exception.
>>
>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>> --- a/xen/arch/riscv/domain.c
>> +++ b/xen/arch/riscv/domain.c
>> @@ -2,9 +2,66 @@
>>   
>>   #include <xen/init.h>
>>   #include <xen/mm.h>
>> +#include <xen/sections.h>
>>   #include <xen/sched.h>
>>   #include <xen/vmap.h>
>>   
>> +#include <asm/cpufeature.h>
>> +#include <asm/csr.h>
>> +
>> +struct csr_masks {
>> +    register_t hedeleg;
>> +    register_t henvcfg;
>> +    register_t hideleg;
>> +    register_t hstateen0;
>> +
>> +    struct {
>> +        register_t hstateen0;
>> +    } ro_one;
>> +};
>> +
>> +static struct csr_masks __ro_after_init csr_masks;
>> +
>> +#define HEDELEG_AVAIL_MASK ULONG_MAX
>> +#define HIDELEG_AVAIL_MASK ULONG_MAX
>> +#define HENVCFG_AVAIL_MASK _UL(0xE0000003000000FF)
>> +#define HSTATEEN0_AVAIL_MASK _UL(0xDE00000000000007)
> It's not quite clear to me what AVAIL in here is to signal.

It signal that these bits are potentially available for s/w to be set.
If you want to suggest the better naming and can change that in the
follow-up patch.


>   It's also not
> quite clear to me why you would use _UL() in #define-s sitting in a C file
> (and hence not possibly being used in assembly code; even for asm() I'd
> expect constants to be properly passed in as C operands).

I thought it is always be good to use _UL() for such type of constants as
ULONG_MAX also uses UL, but not in form of _UL() macros. If it would be
better to drop, I can do that in follow-up patch.

>
>> +void __init init_csr_masks(void)
>> +{
>> +    /*
>> +     * The mask specifies the bits that may be safely modified without
>> +     * causing side effects.
>> +     *
>> +     * For example, registers such as henvcfg or hstateen0 contain WPRI
>> +     * fields that must be preserved. Any write to the full register must
>> +     * therefore retain the original values of those fields.
>> +     */
>> +#define INIT_CSR_MASK(csr, field, mask) do { \
>> +        register_t old = csr_read_set(CSR_##csr, mask); \
>> +        csr_masks.field = csr_swap(CSR_##csr, old); \
>> +    } while (0)
>> +
>> +#define INIT_RO_ONE_MASK(csr, field, mask) do { \
>> +        register_t old = csr_read_clear(CSR_HSTATEEN0, mask); \
>> +        csr_masks.ro_one.field = csr_swap(CSR_##csr, old) & mask; \
>> +    } while (0)
>> +
>> +    INIT_CSR_MASK(HEDELEG, hedeleg, HEDELEG_AVAIL_MASK);
>> +    INIT_CSR_MASK(HIDELEG, hideleg, HIDELEG_AVAIL_MASK);
>> +
>> +    INIT_CSR_MASK(HENVCFG, henvcfg, HENVCFG_AVAIL_MASK);
>> +
>> +    if ( riscv_isa_extension_available(NULL, RISCV_ISA_EXT_smstateen) )
>> +    {
>> +        INIT_CSR_MASK(HSTATEEN0, hstateen0, HSTATEEN0_AVAIL_MASK);
>> +        INIT_RO_ONE_MASK(HSTATEEN0, hstateen0, HSTATEEN0_AVAIL_MASK);
>> +    }
> The 3rd macro parameters are now redundant. At the example of INIT_CSR_MASK(),
> you could now have
>
> #define INIT_CSR_MASK(csr, field) do { \
>          register_t old = csr_read_set(CSR_ ## csr, csr ## _AVAIL_MASK); \
>          csr_masks.field = csr_swap(CSR_ ## csr, old); \
>      } while (0)
>
> This would reduce the risk of incomplete editing after copy-and-paste, or
> other typo-ing.
>
> Note also that ## being a binary operator, ./CODING_STYLE wants us to put
> blanks around it just like for non-pre-processor binary operators. I'll
> try to remember to make that adjustment when committing.

Good point. Thanks a lot!

~ Oleksii


