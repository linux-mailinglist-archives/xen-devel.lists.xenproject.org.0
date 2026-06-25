Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VF8CHDIYPWrKwwgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jun 2026 13:59:46 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95B346C5560
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jun 2026 13:59:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=JXDroEhI;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1345549.1604392 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wcijK-0002Dg-2W; Thu, 25 Jun 2026 11:58:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1345549.1604392; Thu, 25 Jun 2026 11:58:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wcijJ-0002BL-Vz; Thu, 25 Jun 2026 11:58:49 +0000
Received: by outflank-mailman (input) for mailman id 1345549;
 Thu, 25 Jun 2026 11:58:49 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wcijI-0002BF-VJ
 for xen-devel@lists.xenproject.org; Thu, 25 Jun 2026 11:58:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wcijI-003cYv-8N
 for xen-devel@lists.xenproject.org; Thu, 25 Jun 2026 13:58:48 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a3d17ef-e002-0a2a0a5209dd-0a2a4502c44a-26
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jun 2026 13:58:48 +0200
Received: from [209.85.221.43] (helo=mail-wr1-f43.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a3d17f7-5a27-0a2a45020019-d155dd2ba8a5-3
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jun 2026 13:58:48 +0200
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-4631679f204so463450f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jun 2026 04:58:48 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-46c9787dddbsm14542073f8f.3.2026.06.25.04.58.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Jun 2026 04:58:47 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1782388727; x=1782993527; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=VgaRhSXevnMm9oMm+Kf4wda22FuiE6H2iz33JnJ+iNs=;
        b=JXDroEhIegMAFBi8FEBq3bGHK/QYNeCxoZxmtXD7QsHKRDf3ul0HslGfcdiJMVSvZG
         vvw1BkJSDlgDIyHFS5beXyIbJtJtL/w7GlpmAAYdq+ofuUUBpNbjWGqbtdnXj3Brci4T
         chxdafas7QtLeStT7akduW/yog+1BUUG65MXiASmlyXEi8WRCwUSoW2Bd0xLKSZiIGfi
         KQxMFOCxKjfuIDWwcyPZGeZqzrftzeHIyWoaUi+oRjmB+ov2rgrB9nl1A03urBhKnzn7
         1ZMaV+RxrIBezYSfTJ2rnSn/lzpI8yAzPiKMgXOHrEpzASOrGqnhrR+hPqeFkZeVImNF
         ZFNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782388727; x=1782993527;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VgaRhSXevnMm9oMm+Kf4wda22FuiE6H2iz33JnJ+iNs=;
        b=Op5Wh/aQNtXfRky4djNZkA95aftdcUf4aehs9U7z9mHfr0r1FNfsBB5NCgiyAPLPFN
         yUZzCCIp/WTnK9viOpBtTuFSRgXnuxQGHJv6oU1uwzLAUBcMiHYbiBsuNxCULq4HpG90
         Qcr3bshavlpelX8bnU3qgLXbaJw3VWIhlY0UnSaqpJFcB+h7pfbI6QUfFos1WEaUXLsE
         B5JaZZ/jjSqIAz0E23eagL9kzihdjO5igiB3JxWgNUhUD7SGIodr9DrU75K8/71ZP9Xn
         LSs1HCO2R2xdTBmZ6IZJ6L53TJDqcvzbqf6h4/OiX1QJWKdvbXZPdrysUIzraJmSi1iZ
         Qkrw==
X-Forwarded-Encrypted: i=1; AHgh+Ro6J+vb7VPSZQaIb+ZVTJdOtFmSpKEzMVs2LM5w3CR3hWTC2hCjcJ25ilkW7RKpbxMstGvsMXjDwr8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzbXmJpWt0s7Zby2ogdPalrniyvT/tMBlzh9B9TQgDVA2lBtl6H
	7cuSKfSoUipEXYvE6JoBwY5kXelIQdYg7b9fA4YkqIkGVwX0zxGqn91/vR2uaWdALd78TQ0kNqK
	DIWH0rg==
X-Gm-Gg: AfdE7cnQkUmdvD6BQmZG352j/dNEYyd6ZdLa7kWThtd5+f+7A7E1N5p6kJkpubJ2a3/
	rt/ieBB+RsKtJboKBBp0sfNpb1jAmWxkbbLdJijbd4oPi8YlQXVmUt69mzeZ+K/p3spSA18Nr4a
	YpJgpRiIJlPMYhyjaHNxx/7ADGxGVIFvoI4QQ+LqrlQ8cLqXKODS7owNPKy4jubw/vzJvqC+2oa
	dTtsYKB/jBczdxoMiqfhbocZtwQ293VG9CmbENSas9xy/lap1kk4xQDU9MOFA2dN72J0UlXGjWM
	L6XNKi0xojxJBAvGTwpkzN5uuSlDh4mJJ4hqm0xyy1+JYOPM3ev2q7uWQyY2MTQojcUkZhn5Oon
	jrc83Ffk73zhuHSGvtuK7YPCKLjjAL7yTzVSB+lMq6xLkLSDLIdmoE3QkN0iy1H9bIrxR42kwyK
	jJ7S5XQV1F/7ewsVGKo8cfqgwdbXBk7QpNa7Rw4ZVrfJZL1O96LtEb7ZbmpKwA04+mV/gzYlJdV
	rJ7
X-Received: by 2002:a05:6000:2904:b0:462:caf6:8d06 with SMTP id ffacd0b85a97d-46a7e9f3ea0mr21398579f8f.3.1782388727505;
        Thu, 25 Jun 2026 04:58:47 -0700 (PDT)
Message-ID: <6b4564ff-49b4-4332-b2ac-5ae093b62de1@suse.com>
Date: Thu, 25 Jun 2026 13:58:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/6] nestedsvm: Fix CR3 MBZ check
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>, Teddy Astie <teddy.astie@vates.tech>,
 Ross Lagerwall <ross.lagerwall@citrix.com>, xen-devel@lists.xenproject.org
References: <20260526124027.573412-1-ross.lagerwall@citrix.com>
 <20260526124027.573412-2-ross.lagerwall@citrix.com>
 <b9ddc37c-216b-4c18-8d77-03ce641d2614@citrix.com>
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
In-Reply-To: <b9ddc37c-216b-4c18-8d77-03ce641d2614@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1782388728-4CF017C5-DDC4F85E/0/0
X-purgate-type: clean
X-purgate-size: 2078
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:teddy.astie@vates.tech,m:ross.lagerwall@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,suse.com:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
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
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 95B346C5560

On 26.05.2026 15:01, Andrew Cooper wrote:
> On 26/05/2026 1:40 pm, Ross Lagerwall wrote:
>> The existing code checks for any reserved bit set while the APM only
>> considers it invalid if an MBZ bit is set. Relax the check to match the
>> APM and hardware.
>>
>> Some of the reserved bits were observed to be set running Rocky Linux
>> 10.1 on Xen on Xen.
>>
>> Fixes: 9a779e4fc161 ("Implement SVM specific part for Nested Virtualization")
>> Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
>> ---
>>  xen/arch/x86/hvm/svm/vmcb.c | 6 ++----
>>  1 file changed, 2 insertions(+), 4 deletions(-)
>>
>> diff --git a/xen/arch/x86/hvm/svm/vmcb.c b/xen/arch/x86/hvm/svm/vmcb.c
>> index 975a1eaef806..9ada491e57db 100644
>> --- a/xen/arch/x86/hvm/svm/vmcb.c
>> +++ b/xen/arch/x86/hvm/svm/vmcb.c
>> @@ -347,10 +347,8 @@ bool svm_vmcb_isvalid(
>>          PRINTF("CR0: bits [63:32] are not zero (%#"PRIx64")\n", cr0);
>>  
>>      if ( (cr0 & X86_CR0_PG) &&
>> -         ((cr3 & 7) ||
>> -          ((!(cr4 & X86_CR4_PAE) || (efer & EFER_LMA)) && (cr3 & 0xfe0)) ||
>> -          ((efer & EFER_LMA) &&
>> -           (cr3 >> v->domain->arch.cpuid->extd.maxphysaddr))) )
>> +         ((efer & EFER_LMA) &&
>> +           (cr3 >> v->domain->arch.cpuid->extd.maxphysaddr)) )
>>          PRINTF("CR3: MBZ bits are set (%#"PRIx64")\n", cr3);
>>  
>>      valid = hvm_cr4_guest_valid_bits(v->domain);
> 
> The APM does say MBZ for VMRUN, but the end result of a VMEntry (virtual
> or otherwise) must be a legal CR3 value.
> 
> For 5.2.1 CR3 Register (Legacy) and 5.3.2 CR3 (Long), the APM states:
> 
> Reserved Bits. Reserved fields should be cleared to 0 by software when
> writing CR3.
> 
> What's the real behaviour for trying to set a reserved, non-MBZ bit in
> CR3?  On Intel it's strictly a #GP, and I really hope it's the same on AMD.

As to Intel - are you sure? The MOV to/from control register page has this:
"When PCIDs are not enabled, bits 2:0 and bits 11:5 of CR3 are not used and
attempts to set them are ignored."

Jan

