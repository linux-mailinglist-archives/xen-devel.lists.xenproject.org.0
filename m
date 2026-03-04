Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2A6MCtxHqGlOrwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 04 Mar 2026 15:55:24 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E7A9202050
	for <lists+xen-devel@lfdr.de>; Wed, 04 Mar 2026 15:55:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1245536.1544898 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxncq-0004rA-M5; Wed, 04 Mar 2026 14:55:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1245536.1544898; Wed, 04 Mar 2026 14:55:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxncq-0004o2-I8; Wed, 04 Mar 2026 14:55:00 +0000
Received: by outflank-mailman (input) for mailman id 1245536;
 Wed, 04 Mar 2026 14:54:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YDHP=BE=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vxnco-0004nu-K5
 for xen-devel@lists.xenproject.org; Wed, 04 Mar 2026 14:54:58 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1bbdc2b8-17da-11f1-9ccf-f158ae23cfc8;
 Wed, 04 Mar 2026 15:54:56 +0100 (CET)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-65baa72399fso9195521a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 04 Mar 2026 06:54:56 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-67-101.play-internet.pl.
 [109.243.67.101]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b935ae94441sm749234866b.50.2026.03.04.06.54.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Mar 2026 06:54:55 -0800 (PST)
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
X-Inumbo-ID: 1bbdc2b8-17da-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772636096; x=1773240896; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b8TcMBZ3yGouGfj8M+MDoejSezqgCzwzBRxv90RmjcY=;
        b=lk3lKjuqUCeIqKHZpbwXj/QQaDchhRUEVaigvCR/DW0lAH5bpKOj/+b0vli3zutbLQ
         VwIWzYDL24cJcI7SmAe1ZsGcmdaytkeHFhJu15MBhqDF+KOrsk/jGF22EStLkkHXJ28P
         CFYgDlp112llOMSehRZVHe42t5tKT6pSZvGYbVY8LRFqVYr40WwSWHANd2M1LnOzIUZ5
         MjFXW41IoKusjKpak7Jd24U5W1XGWGd7SnBt46jdiv9/Wy9pcS3vOWxW8XOXTLjEekU7
         mi2AJQ3UCbH+iOVn2Z3JOFo+eN4DUmAM5ZVgnWDAm6yHfIwMmofbdjLmVIf3v9eZccr5
         +vEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772636096; x=1773240896;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b8TcMBZ3yGouGfj8M+MDoejSezqgCzwzBRxv90RmjcY=;
        b=Fwn50ocwpyMUndjsiz7AJsQtEY/sc/OzKGm1Koxf4bp8lz0KjNkBxKHgZorkSuE4jj
         X0A+ZgQBB3bxp3PHCMsnDSts+DQM9dcxe9D2N+1pfJn7R0BYwpL/OgzkNSfd3qtQniXK
         oeRj1+Dd8ud+IVnJaQGqRcn4zKGaW72+dDG8+kh2Mo6ijp+aqhM0jdahxB5QUtnje36A
         m/SMThNlEinFRlpQNt5JyVLQzroDbhnokDTnFHowDmZutiJspxdCg9kRhJUZLaco+aHf
         RBONRSF2TrLHtu5Ji7KZRJEpxTA9szk0LOhbxG64pjFMQZn3nZNLCr0T6aDdJg3MTaLN
         E5Lw==
X-Forwarded-Encrypted: i=1; AJvYcCUldcjMvR9eOMUS2Gppqdm9XYPJnrJeZ2t4tSXFihkyDAuyNjJT3HCt9+KMsILO5//U1jW1Edatd2A=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxR20TmprZhnFm+hSBQ4sBKZh1iT1a8WRy0Q/J369Ra6kB6H4ha
	WIXMiCj5FFnutrS6yWmgZgOJiAkpdcVEePEwrnpMShs7/daiTIVGakAS
X-Gm-Gg: ATEYQzwXUPysakK8lmPqCuijmPWKctRjNl45LX79+qXGMs0cdBXoR9q+pXNdPYOpVQu
	6nJ+ED8uHnOFFL+5SASz/7PvWbA4hDGIVQKbMw9TBL+HNL7o2zpnRgfO74wU8Hp6Rm/S8BoLg2t
	k45Z+HuTMgmGzIqQHE7RR20LCY7fc17B+e06Iv+EairDHh1KICPa/h69IFMI3duZ9nEr85gzj20
	QtMf7bsmxtWLEJqJ51KXHXAZ0ZChb80S1xB/IclbQ+Yojil2jcmruLaL3wVF2tMmVij3b+5+c/F
	+jbpu0f5BdrSgJd7cM2s9Mm4BPOQhHk3SC/W7tdG1ZY1FZicCCW8yfWj3rFVu97EcfR92vq1oHV
	6SPymO9hLwyz90iDxEZrorfya/G+m9lfIduPH8fK4kjQPdDK9dnM4ZlYNJcqxpagVOqVRdvjBa0
	+hEVEbwUR3esN9+WFBRh0b97A3Oy6P6nrk4mmoM6aGbhQq8Tab/YKKtTMZ57sME354Fb2cPlqzb
	c9dwEPyr/XcPw==
X-Received: by 2002:a17:907:6d28:b0:b88:47b4:7626 with SMTP id a640c23a62f3a-b93f11c65e4mr135595666b.27.1772636095424;
        Wed, 04 Mar 2026 06:54:55 -0800 (PST)
Message-ID: <7e1f3962-2dd0-4843-8976-40452437a52a@gmail.com>
Date: Wed, 4 Mar 2026 15:54:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 01/14] xen/riscv: detect and store supported hypervisor
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
References: <cover.1772016457.git.oleksii.kurochko@gmail.com>
 <a17b6a117726904a9384dc7d9cc140672d3b0453.1772016457.git.oleksii.kurochko@gmail.com>
 <4b67f8cb-43d4-4f18-b2b6-156e21330887@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <4b67f8cb-43d4-4f18-b2b6-156e21330887@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 7E7A9202050
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo];
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
X-Rspamd-Action: no action


On 3/3/26 1:23 PM, Jan Beulich wrote:
> On 26.02.2026 12:51, Oleksii Kurochko wrote:
>> --- a/xen/arch/riscv/domain.c
>> +++ b/xen/arch/riscv/domain.c
>> @@ -2,9 +2,56 @@
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
>> +        old = csr_read(CSR_##csr); \
>> +        csr_write(CSR_##csr, (old & ~(mask)) | (mask)); \
> I (now) agree csr_swap() can't be used here, but isn't the above
>
>      old = csr_read_set(CSR_##csr, mask);
>
> ?

Agree, csr_read_set() could be used.


>
>> +        csr_masks.field = csr_swap(CSR_##csr, old); \
>> +    } while (0)
>> +
>> +    register_t old;
> Since the macro uses the variable, this decl may better move up.
>
>> +    INIT_CSR_MASK(HEDELEG, hedeleg, ULONG_MAX);
>> +    INIT_CSR_MASK(HIDELEG, hideleg, ULONG_MAX);
>> +
>> +    INIT_CSR_MASK(HENVCFG, henvcfg, _UL(0xE0000003000000FF));
> This raw hex number (also the other one below) isn't quite nice. Can we have
> a #define for this, please? It doesn't need to live in a header file if it's
> not going to be used anywhere else.

Sure, would it be okay to define them inside this init_csr_masks() or at the top
of the file would be better?

>
>> +    if ( riscv_isa_extension_available(NULL, RISCV_ISA_EXT_smstateen) )
>> +    {
>> +        INIT_CSR_MASK(HSTATEEN0, hstateen0, _UL(0xDE00000000000007));
>> +        csr_masks.ro_one.hstateen0 = old;
> What guarantees that only r/o-one bits are set in the incoming hstateen0? I
> can't help thinking that to determine those bits you want to use
> csr_read_clear() (or csr_clear()).

Good point, then after INIT_CSR_MASK() it will be needed to do:
   csr_masks.ro_one.hstateen0 = csr_read_clear(CSR_HSTATEEN0, _UL(0xDE00000000000007));
   csr_swap(CSR_HSTATEEN0, old);

Probably, csr_swap() isn't needed as it would be good to have all writable bits by
default 0. Of course, except r/o-one bits.

Thanks.

~ Oleksii


