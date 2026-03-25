Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CI8/GusCxGnOvQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2026 16:44:43 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B64353284DE
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2026 16:44:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1262666.1555090 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5QP7-00088S-G5; Wed, 25 Mar 2026 15:44:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1262666.1555090; Wed, 25 Mar 2026 15:44:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5QP7-00085o-DL; Wed, 25 Mar 2026 15:44:21 +0000
Received: by outflank-mailman (input) for mailman id 1262666;
 Wed, 25 Mar 2026 15:44:20 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w5QP5-00085i-Vn
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2026 15:44:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w5QP5-00HHu8-7z
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2026 16:44:19 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69c402c9-5cb7-0a2a0a5109dd-0a2a450aafe0-28
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 16:44:18 +0100
Received: from [209.85.128.48] (helo=mail-wm1-f48.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <jbeulich@suse.com>)
 id 69c402d2-1772-0a2a450a0019-d1558030ccd2-3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 16:44:18 +0100
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-48540d21f7dso36245e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 08:44:18 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b919cf1c4sm566552f8f.23.2026.03.25.08.44.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Mar 2026 08:44:17 -0700 (PDT)
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
        d=suse.com; s=google; t=1774453458; x=1775058258; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KAXkFHitePAjIh78QIydTDK9P765JV4CvSKwPMwQLgI=;
        b=UOPaz+mg2br8JwegKLGF9v5a88P0uO8JxBziXoTxKq5EMS4Oe7++/+0Qh9LMf7uqdi
         NKVO2jinToZ06S13gLthE9KFDmWSxG4plimM8lcW0PeOfjC95AhWy2A1r9y5inFLLov0
         clxwm9F62fFyIidiCee9ep4vjtl96Y2Mbl9W0Dsf492J0wFbQQU+3ZUH/1eB1XNf3oIl
         gsqdexys3d3RFhdJEPY/rlT+ctVMSUkNS8KwJUiivr23q6Npc0ga54CRrVlSt3b47W0a
         B6ZWhorwG5c0iYH3OZWfClTgHwzzY5hSy6qAkVvzgTYYWIKtDr5hFwaYkmV17DSFkbqK
         nz1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774453458; x=1775058258;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KAXkFHitePAjIh78QIydTDK9P765JV4CvSKwPMwQLgI=;
        b=k/HlS2bw2yuwhMEy1Jwu89NcN0TluXYbH8zIzpDBjn4Ga5sgT/2Fh3cL4Za+j4x2Kg
         8+GhU+CzIlbVF8Z2QP92D4kfvPgD3aN5583qxt5b7UM/12PV23FpBm5ohIMhWUB1/nNj
         XygHtuLDpT7wGgZtauEzNv3e9E8Sx09X/IlWf5x1yEBKVQ81xRVwfb5pPAR8+ncY7w/Y
         Qp5Hx/EjOvX7ctLjFXDnzAqNt2CvLmkOLfZepvZY64aQYk0QqKLb78+6c4HpqEvz/pSt
         IMpz9mU+xEsVKf3/y/zQvun0LoAVkrVW0SEbPsu6hd//LlIobHalZ5/h8ZlOtlgJipn3
         xvHA==
X-Forwarded-Encrypted: i=1; AJvYcCWFmXlPF2YsTUelimgCBkUpmqjCBnq0Dllb1wU+KuCUBmED0eI//+wORb1rgzKWdUqtRgTj+PVr8RM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwWn7M5MahSAlDalMyUUIyHLM3CvuXwgliLsSj6zJNYkEhgSwP4
	1HI98wA1rHiJT0xF63UzL919Bu+YEOlKvZvCohwWvXoL9RaEhsUB613dCi0D8wMTTw==
X-Gm-Gg: ATEYQzwn/Idy3cEG+s4NvF1QJ/MkUFAMphiFIAumobYZ40ILP2AIBCUK1P+UQVpj3kp
	7GmsVtfrfYQX4eqygwTgblzEny4K/C7XFphIf8MfVlIYuZnwgVWgOzn8RmTVVdrSqzsmCMcdvyE
	aj7jhO1Yw0mv10htzTE2cqo7QyWMw2H3p3mNtgx2AXt1gsvLt3wSOV0V57WuOpBA+s9U2FnovAJ
	2xF6ur3YP0ZtXljS1j1mtpNDdIlKy3cHKLTrishAp21T307C/PJFZEx7owUCSUNOc1im8OF0M6j
	hJk+Rydj67C5sv3VvPLNZitVBi8L/qCudFpWFGsh2sUvjb2DHnxcOHOPb9dJd9UPdDLbMivttRQ
	zUmhlCoGn+OiZhD16wkrM2MjfEy8S6kxTeC1WNRoFrliU7sLIu8Jrk4rm91Uy6j6ap6zxdOkGbu
	TiukXsbl75v/fsxLGGp+r7bViL2kCqF8yD6ec3+gQIHDukDYWP+aXiE1JhZrVKHScKBdFt0NdwO
	q7MRpZimnhV3fAvOkx7lvZmGg==
X-Received: by 2002:a05:600c:c4a4:b0:485:1878:7b8c with SMTP id 5b1f17b1804b1-48716056512mr55924185e9.18.1774453458218;
        Wed, 25 Mar 2026 08:44:18 -0700 (PDT)
Message-ID: <5e121a98-fcd1-4d20-aa6c-a02af7f7eef4@suse.com>
Date: Wed, 25 Mar 2026 16:44:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] x86/acpi: Integrate BGRT preservation with status
 reporting
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Soumyajyotii Ssarkar <soumyajyotisarkar23@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 sarkarsoumyajyoti23@gmail.com, xen-devel@lists.xenproject.org
References: <20260324123312.11076-1-soumyajyotisarkar23@gmail.com>
 <20260324123312.11076-3-soumyajyotisarkar23@gmail.com>
 <751e1d3e-d95a-4129-8baa-450a53d15efa@suse.com> <acQADhcNzkVBm3C3@mail-itl>
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
In-Reply-To: <acQADhcNzkVBm3C3@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1774453458-51488900-E3EBB464/0/0
X-purgate-type: clean
X-purgate-size: 2245
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FREEMAIL_CC(0.00)[gmail.com,citrix.com,apertussolutions.com,lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:marmarek@invisiblethingslab.com,m:soumyajyotisarkar23@gmail.com,m:andrew.cooper3@citrix.com,m:dpsmith@apertussolutions.com,m:roger.pau@citrix.com,m:sarkarsoumyajyoti23@gmail.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: B64353284DE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 25.03.2026 16:32, Marek Marczykowski-Górecki wrote:
> On Wed, Mar 25, 2026 at 04:16:25PM +0100, Jan Beulich wrote:
>> On 24.03.2026 13:33, Soumyajyotii Ssarkar wrote:
>>> @@ -327,6 +328,11 @@ static int __init cf_check acpi_parse_hpet(struct acpi_table_header *table)
>>>  	return 0;
>>>  }
>>>
>>> +/*
>>> + * Invalidate BGRT if image is in conventional RAM (preservation failed).
>>> + * If preservation succeeded, image is in EfiACPIReclaimMemory, which
>>> + * won't match RAM_TYPE_CONVENTIONAL check, so table remains valid.
>>> + */
>>>  static int __init cf_check acpi_invalidate_bgrt(struct acpi_table_header *table)
>>>  {
>>>  	struct acpi_table_bgrt *bgrt_tbl =
>>> @@ -754,5 +760,7 @@ int __init acpi_boot_init(void)
>>>
>>>  	acpi_table_parse(ACPI_SIG_BGRT, acpi_invalidate_bgrt);
>>>
>>> +	efi_bgrt_status_info();
>>> +
>>>  	return 0;
>>>  }
>>
>> Does this really need doing from here? If you called it ...
>>
>>> --- a/xen/common/efi/boot.c
>>> +++ b/xen/common/efi/boot.c
>>> @@ -1911,6 +1911,22 @@ static bool __init cf_check rt_range_valid(unsigned long smfn, unsigned long emf
>>>      return true;
>>>  }
>>>
>>> +void __init efi_bgrt_status_info(void)
>>> +{
>>> +    if ( !efi_enabled(EFI_BOOT) )
>>> +        return;
>>> +
>>> +    if ( bgrt_info.preserved )
>>> +    {
>>> +        printk(XENLOG_INFO "EFI: BGRT image preserved: %lu KB\n",
>>> +               bgrt_info.size / 1024);
>>> +        printk(XENLOG_INFO "EFI: BGRT relocated from %p to %p\n",
>>> +               bgrt_info.old_addr, bgrt_info.new_addr);
>>> +    }
>>> +    else if ( bgrt_info.failure_reason[0] )
>>> +        printk(XENLOG_WARNING "EFI: BGRT preservation failed: %s\n",
>>> +               bgrt_info.failure_reason);
>>> +}
>>>
>>>  void __init efi_init_memory(void)
>>>  {
>>
>> ... out of this function, it could be static and no stub (misplaced in
>> the earlier patch) would be needed either.
> 
> It was here before, and I complained about it, because it printed the
> invalidation reason way later than the actual invalidation.

Sadly now I complain about this call out of acpi_boot_init(). What's wrong
with logging the BGRT stuff together with the memory map?

Jan

