Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mJD1NhRznWmAQAQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 24 Feb 2026 10:44:52 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E3F8184DD9
	for <lists+xen-devel@lfdr.de>; Tue, 24 Feb 2026 10:44:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1239682.1541078 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuoy6-0006kE-Pm; Tue, 24 Feb 2026 09:44:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1239682.1541078; Tue, 24 Feb 2026 09:44:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuoy6-0006hy-Lg; Tue, 24 Feb 2026 09:44:38 +0000
Received: by outflank-mailman (input) for mailman id 1239682;
 Tue, 24 Feb 2026 09:44:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1YgY=A4=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vuoy4-0006hc-So
 for xen-devel@lists.xenproject.org; Tue, 24 Feb 2026 09:44:36 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6ac1027b-1165-11f1-9ccf-f158ae23cfc8;
 Tue, 24 Feb 2026 10:44:30 +0100 (CET)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-b8f8f2106f1so714667066b.2
 for <xen-devel@lists.xenproject.org>; Tue, 24 Feb 2026 01:44:30 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-67-101.play-internet.pl.
 [109.243.67.101]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b90bfd4e95csm71038466b.41.2026.02.24.01.44.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Feb 2026 01:44:29 -0800 (PST)
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
X-Inumbo-ID: 6ac1027b-1165-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771926270; x=1772531070; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WqmQ6jFGZrNR2V9YqQrVtdEdL9fl9OpH9HzHzlzwtLw=;
        b=h51LN5bzh9k1AccETb8kr8NDjW8T8jpg4c8nvlIwjS1rcnSe3YysYQdz4fAqRleRv0
         io7HqedipUsSliKLOFVabinuGJWY3igyofnGj5GvIEv0MkqvNnBVNIQc6rYgmu1GVgMb
         yvnmE1z85tmTHZ8TOX1gXzOLgaC53DdXhDLZOrLGUy+WgkSwGq8Ppts5UICAzjUxWah6
         R3NkEfM/Pj8BaYQwaqEhIzo5nHxtHvuWiIqs7YqKRuH6O8BSZJsAPCZS85tTh3qZavbT
         yFtyx5EQEQGxxGBah3k6b28YCeBx7kHgyWdmkc9T2/vQp18904m2jm/+Pjq3dDSS+smd
         GjMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771926270; x=1772531070;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WqmQ6jFGZrNR2V9YqQrVtdEdL9fl9OpH9HzHzlzwtLw=;
        b=cVXhr5kTR14Q+SXZNk8hOXkQuDu5xbhGyR+BW3yNv7kao4gBGeqgnFtmHf3ki12Jyn
         ozHg/ee06uIMwJGrfr+RZwwgs+TnKk0GbWlikXOMY5N9cxfYRhlqV8Ol7F9WHRJLSmKC
         EOI1NMJb0bGnqX4sdiHBAvmq5pgkOtttpmZym1zgisLell3Lfwi35IxJvpDpH5KZcOhK
         W6/FwUMcMfuFalXLSAfVUvQOluKslmijLjzvWUPYBjtRssZxtR5xzAjZaAyruB+Uxyyi
         FgOO/RrX4AF9Alq8NZX1+EDxuxwOVtR0OuEh+ZKpwV/lCUq4W/cZtF3sKIcvGX1XcoHd
         aiLA==
X-Forwarded-Encrypted: i=1; AJvYcCUALZS5cguEXovvRB1odxlc0ybnb2TAfYLEulu/U4xMFEjA1lCKtVT7AQPQcV/wH0XFbFvUpVmlrEk=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx5spQWImULjxvtUrzAfh9I/ZRVMtB/LF/Z1Y3P1tSdgprkTdNd
	kX+IuXLGllg/viH3OZJqZZjMj4Zv46yVy/eUZvRbxbEValFUicbkBPis
X-Gm-Gg: AZuq6aLD0GqMG9j4z/Pi+yrCrtNPl+P9QgIECKY532pR02CoY8RkfE/1RFin/up6wL1
	hROxb9wpY6I7ebTiKRMgJLTl+qWPF/o1xI92vpfztUyR90okSdEuspvE1NHO+za814rk98HRId9
	UGS4ySPjEqpMOZVohc6R4VRtzqUEuWW5ucpvi/x3uJhXyfKIm9vYaxNuh2fgSKY9fcVln3uQ4U0
	wiXuB9/cITxBRXR74ZdYqe1rQK/4YdXTDaVnY4dmJdu5f3FSDL4o8+xK8oGncE1aTFjmKjAuWPh
	PL5FkMTZWDBbjdMhQyNMe/rrmdb3s3Hr4bopED1MuTdsyyN/zdFg//tq25wOEEzVtlv8JJUk1nV
	ixO2Y5EAATO0DFr7fPNSryIgoudosEm4BJaoABer7PL7LSnfCSRqHe6ypPsdvxNwtSWygsn6QRp
	4xQ1qO/9fU2V0BuCgFKuVrQkNycRV8PqFB0JWEIuRkQXr89TpTw/vULtsbWjiuu5YkdC5Lj7RTp
	X4ZppXmTtmLNw==
X-Received: by 2002:a17:906:2092:b0:b88:dc6:395d with SMTP id a640c23a62f3a-b9081b9f204mr513986466b.48.1771926269985;
        Tue, 24 Feb 2026 01:44:29 -0800 (PST)
Message-ID: <e084cd6f-e76d-40c1-9e30-97e10acae012@gmail.com>
Date: Tue, 24 Feb 2026 10:44:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 01/14] xen/riscv: detect and store supported hypervisor
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
References: <cover.1771590794.git.oleksii.kurochko@gmail.com>
 <4f36d83e58bfba807660ebc1fc48e71ae056805a.1771590794.git.oleksii.kurochko@gmail.com>
 <bf8d5b4f-937a-4d6f-86ba-1ab07f53eb51@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <bf8d5b4f-937a-4d6f-86ba-1ab07f53eb51@suse.com>
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
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
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
X-Rspamd-Queue-Id: 4E3F8184DD9
X-Rspamd-Action: no action


On 2/24/26 9:07 AM, Jan Beulich wrote:
> On 20.02.2026 17:18, Oleksii Kurochko wrote:
>> --- a/xen/arch/riscv/domain.c
>> +++ b/xen/arch/riscv/domain.c
>> @@ -2,9 +2,39 @@
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
>> +};
>> +
>> +static struct csr_masks __ro_after_init csr_masks;
>> +
>> +void __init init_csr_masks(void)
>> +{
>> +#define INIT_CSR_MASK(csr, field) do { \
>> +    register_t old; \
>> +    old = csr_read(CSR_##csr); \
> Can't this be the initializer of the variable? Can't ...

I agree that this is change is okay to be done but I am not sure about ...

>
>> +    csr_set(CSR_##csr, ULONG_MAX); \
> ... csr_swap() be used here, too?

... as after re-reading spec again I am not sure that we can do in this way
at all.

Initially I used csr_set() instead of csr_swap() or csr_write() as csr_set() to
take into account a writability of the bit, so it won't touch a bit if it
is r/o.
But it seems like this approach won't work with**WLRL or WPRI fields as these
fields aren't r/o, but they only support specific value and for example:

- Implementations are permitted but not required to raise an
   illegal-instruction exception if an instruction attempts to write a
   non-supported value to a WLRL field.
- For these reserved fields, software is required to preserve the existing
   values when writing to other fields in the same register. Overwriting them
   with 1s could be considered non-compliant behavior.

So it seems like we can't just do csr_swap() with all 1s and it is needed
to pass a mask to INIT_CSR_MASK() which will tell which bits should be
ignored and don't touched.
For example, HENVCFG and HSTATEEN0 has WPRI fields.

reserved_bits_mask = 0x1FFFFFFCFFFFFF00;
tmp = csr_read(HENVCFG);
tmp=(~reserved_bits_mask) |(tmp&reserved_bits_mask); csr_set(HENVCFG, tmp);


>> +    csr_masks.field = csr_swap(CSR_##csr, old); \
>> +} while (0)
> This whole macro body would also better be indented by one level, to not leave
> in particular this closing brace as a misleading one.

Do you mean that it should be:

+void __init init_csr_masks(void)
+{
+#define INIT_CSR_MASK(csr, field) \
     do {
          ....
     } while (0)
#endif

I will update it.

>
> Happy to make adjustments while committing, provided you agree. With the
> adjustments (or clarification why any of them shouldn't be done):
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

If what I wrote above make sense then it seems that I have to send a new
version of this patch.

Thanks.

~ Oleksii


