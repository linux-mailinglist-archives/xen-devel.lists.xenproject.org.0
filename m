Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qJLnKCpGlGmcBwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 17 Feb 2026 11:42:50 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13E9B14AF71
	for <lists+xen-devel@lfdr.de>; Tue, 17 Feb 2026 11:42:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1234795.1537914 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vsIXO-0008Nh-H8; Tue, 17 Feb 2026 10:42:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1234795.1537914; Tue, 17 Feb 2026 10:42:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vsIXO-0008LM-EP; Tue, 17 Feb 2026 10:42:38 +0000
Received: by outflank-mailman (input) for mailman id 1234795;
 Tue, 17 Feb 2026 10:42:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RxGT=AV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vsIXM-0008LB-7w
 for xen-devel@lists.xenproject.org; Tue, 17 Feb 2026 10:42:36 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5e04a8a1-0bed-11f1-9ccf-f158ae23cfc8;
 Tue, 17 Feb 2026 11:42:33 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4837634de51so13427935e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 17 Feb 2026 02:42:33 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4835d99497asm689740955e9.6.2026.02.17.02.42.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Feb 2026 02:42:32 -0800 (PST)
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
X-Inumbo-ID: 5e04a8a1-0bed-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1771324953; x=1771929753; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=EM2wYwcEcOK12C+VSaBqk9oND2UOqpGWaO8Rkrxm9n0=;
        b=SHBguVv+R14c+vZNqX0ZaigobFVPbv4f1JmAsKVDthuttGLjJ01e4wu1A4nj6umWvX
         5LDf3yxgkv+z8zdGYBLB6uWmp2xFLoJF88+zu24JkwgIuFa27edc7tobGU9j+rAlyzXv
         6FY8McWfI87DfZts+mci8+ddrLaO7A6ibiM3YbSzNjMZv/T7iB4mOHXMHfgJJET0fAIx
         aSiPHsyluSNykpd3Q3jBEceqPLsGIeWO5F56YG4UXRr5pfhIvonMpxbvHsxYMiJh0GS+
         JUmUWL4j/V+iee8CcXrXejsyIFVT6TsKN7Jh/rw0c9XKzYIuP1AGN/ER+v8pwUQ54g4r
         eRiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771324953; x=1771929753;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EM2wYwcEcOK12C+VSaBqk9oND2UOqpGWaO8Rkrxm9n0=;
        b=WjpcZz/p37UVnGGDkzQh7ALOd2PFJRI3FRb1TK/Q63+wSUdMn3Q1Z3kSl9QEeAAC6D
         Xcfld8juszF591u6eIhKxFLXcYjwa/tI5lho3/CMRhZ1ZcMlPki3DQ0disC7m8sGkN2d
         mAvKb/ofsRXrMyDwQx0lwjDGrOajWilXjV3fjFNuHNlku5TjrP/ajvxbbeNJ2jdcf64+
         bWeZGsIELBuYeyqk/r4PUK3kupkGMJq2U5PMywSarh/5CEHWq94kTmzbOgFIWobmZ8BI
         mAeaknAJgvHxQHDUQUTEyvNVQFahRyciOYuwYWQQfJJ7AgEXfU6hJI8tjj4bmhDb5Qsv
         yDXg==
X-Forwarded-Encrypted: i=1; AJvYcCXmfEVHKRTKOAZUOHh69tJ6CXAssxtD85Cry/sM3dzho9nGmQ7shqCs80KBCmX8tb/aCBxyQc0rr3Q=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyol4JV/OCqVuEUktvKocXtLRBdrdbo8vfd1PqcLJnh02JLtME0
	kaQkYmqF/4cyMy9sYK/eUimNkhUQFduNvgl1jLnw9T1QkVT4CUJsmdMJ82y36kXv/g==
X-Gm-Gg: AZuq6aLjqYak8uKjGvnHWeTYuATP8kbFYqR3Asu1P+PnJmrV7Cd07hLWfvmN1A8xean
	tJHJyPqyKAhCDSDfACm9jNcuaDzYw0dMHzLT0rg6UiWQIHySeauBFHexmDM6j5xUysGNTo1HlaD
	guOijtRy8iT5EVg/+Lz+hUai5stqU7bhoWAZzD+kMokrJfLtF5CdJcdOjTpl7nT+C4w1m0MQBs8
	78YiVRaGV3NVl+2B15Ne48+sKQTbqHUEtUHyv7MFxh8lMmhscj9Y0aeiI8U9PDWluwoVcywFqgB
	KxNrLk/e/+/NSc1jZA0fSrmnQCRaYAId0t73DfG9MRkKxwOD6BbVpUeRotp6MSV9QwNGM2TCtkg
	zRjtTUQbU4FNMMWO6FqB1LSPTZitssOiSssZ2tMqMBR0vdHy0F53S2Dq5TTv/xGpFuF7hMCJoV/
	Beyovg14PNMTDKX994c6Kz5ZU8pCRW0+tTyQ+JEojuiBAGlStdpx+gdtgkk8x0lqiOexKGAxmrK
	5kpokVSl7ZjqjY=
X-Received: by 2002:a05:600c:1991:b0:480:2521:4d92 with SMTP id 5b1f17b1804b1-483710858bcmr258742935e9.24.1771324953181;
        Tue, 17 Feb 2026 02:42:33 -0800 (PST)
Message-ID: <a729085b-6a2f-49fc-8784-a0fe88cd90a2@suse.com>
Date: Tue, 17 Feb 2026 11:42:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/6] xen/riscv: implement copy_to_guest_phys()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1770821989.git.oleksii.kurochko@gmail.com>
 <cb50d76c627cb666317b23ae136ca43bfbfd04c5.1770821989.git.oleksii.kurochko@gmail.com>
 <1edea973-4ca1-491f-a9bf-9c2b09bbe615@suse.com>
 <69cef6db-cd39-457f-a5f1-b2f0078b57e7@gmail.com>
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
In-Reply-To: <69cef6db-cd39-457f-a5f1-b2f0078b57e7@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:mid,suse.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 13E9B14AF71
X-Rspamd-Action: no action

On 17.02.2026 11:25, Oleksii Kurochko wrote:
> On 2/16/26 3:57 PM, Jan Beulich wrote:
>> On 12.02.2026 17:21, Oleksii Kurochko wrote:
>>> --- /dev/null
>>> +++ b/xen/arch/riscv/guestcopy.c
>>> @@ -0,0 +1,112 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>> +
>>> +#include <xen/domain_page.h>
>>> +#include <xen/page-size.h>
>>> +#include <xen/sched.h>
>>> +#include <xen/string.h>
>>> +
>>> +#include <asm/guest_access.h>
>>> +
>>> +#define COPY_from_guest     (0U << 0)
>>> +#define COPY_to_guest       (1U << 0)
>>> +#define COPY_ipa            (0U << 1)
>> Like already asked elsewhere - is "ipa" a term commonly in use on RISC-V?
>> To me it's Arm terminology, which you don't want to copy as is.
> 
> As we discussed in another patch thread, IPA isn't really used for RISC-V
> and I will rename it to GPA.
> 
>> Also, don't you prefer to use BIT() everywhere else?
> 
> Yes, BIT() would be better for consistency.
> 
>>> +#define COPY_linear         (1U << 1)
>>> +
>>> +typedef union
>>> +{
>>> +    struct
>>> +    {
>>> +        struct vcpu *v;
>>> +    } gva;
>>> +
>>> +    struct
>>> +    {
>>> +        struct domain *d;
>>> +    } gpa;
>>> +} copy_info_t;
>>> +
>>> +#define GVA_INFO(vcpu) ((copy_info_t) { .gva = { vcpu } })
>>> +#define GPA_INFO(domain) ((copy_info_t) { .gpa = { domain } })
>>> +
>>> +static struct page_info *translate_get_page(copy_info_t info, uint64_t addr,
>> The caller has to pass in a domain here. I therefore recommend against
>> use of copy_info_t for this function. Or wait, this is misleading, as
>> the consuming part ...
>>
>>> +                                            bool linear, bool write)
>>> +{
>>> +    p2m_type_t p2mt;
>>> +    struct page_info *page;
>>> +
>>> +    if ( linear )
>>> +        BUG_ON("unimplemeted\n");
>> ... of "linear" is missing here.
> 
> Yes, for this once cases it will be used vcpu as an argument passed by "copy_info_t info".
> I will add the comment above suggested below BUG_ON(linear).
> 
> Btw, I think it makes sense to change linear to GVA to be more close to RISC-V spec?

And to better match the rename to GPA that you talk about above.

Jan

