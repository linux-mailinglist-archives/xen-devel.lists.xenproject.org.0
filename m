Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KJhxHnxv6GmbKQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2026 08:49:32 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5DB744297F
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2026 08:49:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1289893.1569574 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFROS-0006zz-Ib; Wed, 22 Apr 2026 06:49:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1289893.1569574; Wed, 22 Apr 2026 06:49:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFROS-0006yL-F4; Wed, 22 Apr 2026 06:49:04 +0000
Received: by outflank-mailman (input) for mailman id 1289893;
 Wed, 22 Apr 2026 06:49:03 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wFROQ-0006xn-Tr
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 06:49:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFROO-00EAk7-Of
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 08:49:02 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e86f5c-e002-0a2a0a5209dd-0a2a4503d654-20
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 08:49:02 +0200
Received: from [209.85.128.43] (helo=mail-wm1-f43.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e86f5d-672d-0a2a45030019-d155802be14d-3
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 08:49:02 +0200
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-488a8ca4aadso69124715e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 23:49:01 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488fc0f82bbsm712556195e9.3.2026.04.21.23.49.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Apr 2026 23:49:01 -0700 (PDT)
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
        d=suse.com; s=google; t=1776840541; x=1777445341; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=sukIVtaISOCAupv7+uOd75pGbHe8wPJUlRz6/XgoFcM=;
        b=YT4yKZdfkP7fT8V/1c9shy9odTsYhbuuBQhFYufHMR7OS/xoPsgHMZUdSkooONiBDO
         DYu1pOmp3voSQz+3J0VToXc+wc3U7cnr7RysXcGUhHmQzGTo/dOLO9A9S63Z6foDWOju
         dSaBrVYJaeUcb2zzyvlVykSlBInTbjeMlX/+W93SqTRkY4WyzUCZLhpAIjOGzOX9au1/
         wm/AA9H3ei/A2upfcIJu3//YJ1cONer8snwN1elQDuq3p5SmWDpNXXlVsafsw/LEMDVh
         SBhdKVffLZSssk78iwxWsoi4jfZcd7DSvZbXAQjV8pt/6tazJaX+gSlhHz0RxNjEeYFC
         SPxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776840541; x=1777445341;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sukIVtaISOCAupv7+uOd75pGbHe8wPJUlRz6/XgoFcM=;
        b=ngpAOa22RKdxQ4fYxBRAJtlNpzeer3OsQO7f0XM1MutydQFBRQW8QKz4Ssxu37KX3v
         PFywCJDVxqUdrQge8ZoDxYFTBUm9jK8MXv3pU6H/Oi7+rzTu10kLP4Lwqtd3pxTGOrQs
         Ej9J0iHsKsP8fk3VfDzSA3cLdVNjbIqSXY0aO2u8ulDC8UQiGQnBHzJMcdlaOboPUDLt
         8kYtoVu+CsOpdRqa3EOz3pG5TpOqmFuwNZ9eRys6sv36FC5OlHUq6a+seaRLl8EPgHUj
         mlHxZZTaX7pyRm2haX4ddh2H1rlMXgNlxI9DOZtEfyiJHZzZ/1PpVpJusFGX7fnwA5Km
         kLYg==
X-Forwarded-Encrypted: i=1; AFNElJ8TYQ1DCh7IjseMRmwA/1i6j/KDRCPgMkQvJdq3hfrM22WzeGCWGK//ZLNs66i4mocZQQQ3GnMGRMU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzuRQSeb2+YfRoCy8kMdSab83OY84aodk1qAHAV1RyKIqzyeIZi
	tkdfIof7cujAHdePC4LX2T/u8QJHOLcQaTEoXjx0gsGG6/4ZTy9eU2uYLQmkzh0Azw==
X-Gm-Gg: AeBDiescevwqpgbM4UwjoYYbWk1Hd2OBB7W8tQ2TOWupvR4iAkPbBHuC+fCNqyG0kdU
	qMMdNBkKddjr8B/i4SpfsvjxRi8CtiERH/TLHiMdtQqTZ/Dr0b/RQaBdVR43AaVG9MpwuIcCiX+
	f2sgO/Pk7BNVNrraxDaUeOmCbNVZPG6frvUqHk/ER2NOoW22zKSeC15WViIEhH3EY/6Y5727Ycw
	awwsi9pwXOywSLJyhGOlvGv0eODrt6tXdKc+jHbPVeDkiNPtzCruACEj6o0PMAGIs6lrgnk9/jZ
	Lc3XSS5Urv8NS/+SCEtaAKiNkUyD95ngpHOsiRB3ui2y60aMiuOfE32YU5flx/qg2OqqRxTPKjZ
	iv+P4RIbvuJaxCcus9lxQCgt9Mmxx7a2TOosB7dWmZ0wfIbj8z5f/RF7JPQ9g9E+zse3jk1XUvD
	4W6bAeq4gtqK9JDamSEE/j120uaJ28r+PqS7cJVlfbdaNVWXPX4dIAqhnIkNJYnpDYnCoCTxUH4
	0XoiDzjvhkzv+R8IBcI9nGRdQ==
X-Received: by 2002:a05:600c:3110:b0:487:2439:b7be with SMTP id 5b1f17b1804b1-488fb7389dfmr316683005e9.6.1776840541321;
        Tue, 21 Apr 2026 23:49:01 -0700 (PDT)
Message-ID: <170028cb-ce5c-4677-88e4-32f57f372fea@suse.com>
Date: Wed, 22 Apr 2026 08:48:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] xen/efi: Config parsing: Free the same page count as
 allocated.
To: Bernhard Kaindl <bernhard.kaindl@citrix.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
References: <127e7a4e0bf360d7ffe8be94022840a353a307b2.1776787216.git.bernhard.kaindl@citrix.com>
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
In-Reply-To: <127e7a4e0bf360d7ffe8be94022840a353a307b2.1776787216.git.bernhard.kaindl@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1776840542-A396D938-CF2F463F/0/0
X-purgate-type: clean
X-purgate-size: 4749
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:bernhard.kaindl@citrix.com,m:dpsmith@apertussolutions.com,m:marmarek@invisiblethingslab.com,m:xen-devel@lists.xenproject.org,m:julien@xen.org,m:sstabellini@kernel.org,m:volodymyr_babchuk@epam.com,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: D5DB744297F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 21.04.2026 18:13, Bernhard Kaindl wrote:
> When reading the config file or the config section, we may need to append
> a terminating NUL byte to the config buffer if the last byte is not a
> control character.
> 
> This may cause an additional page to be allocated by efi_bs->AllocatePages()
> if the config file or config section size is a multiple of the page size.
> 
> For this case, increment file->size by one so the number of pages to be
> freed by efi_bs->FreePages() is the same as the number of pages allocated
> by efi_bs->AllocatePages() when the additional byte is allocated.
> 
> I moved the dcache flush after the NUL termination so the flushed range
> covers the final buffer contents.
> 
> I didn't add a dcache flush for the copied cfg buffer in read_section():
> that buffer is created by memcpy() and then consumed only by normal CPU
> reads in the EFI loader, so there is no non-coherent producer or other
> observer that would require cache maintenance.
> 
> Fixes: df75f77092c1 ("EFI: avoid OOB config file reads")
> Signed-off-by: Bernhard Kaindl <bernhard.kaindl@citrix.com>
> 
> ----
> PS: The same fix applies to its backport to 4.21 and other branches,
> for example:
> 
> stable-4.21:
> Fixes: feb99494bf59 ("EFI: avoid OOB config file reads")
> 
> stable-4.20:
> Fixes: 05b8f716aa32 ("EFI: avoid OOB config file reads")
> 
> PPS: A review using GPT-5.4 (just a data point for review) confirms what
> I've found by manual code inspection:
> 
>> The fix in boot.c:882-886 and boot.c:913-928 is consistent with the existing
>> free sites at boot.c:790-797, boot.c:1564-1567, and boot.c:1638-1641: Once the
>> config buffer gets an extra terminating byte, using the incremented size for
>> PFN_UP during FreePages is the right fix.
>>
>> I also checked the parser helpers at boot.c:584-641; they already operate on
>> a bounded buffer and treat NUL/control bytes as terminators, so the synthetic
>> extra byte does not create an obvious parsing regression.

To avoid something non-obvious was why I deliberately left file->size
un-incremented. But yes, I failed to recall that ->FreePages() takes a
size.

> --- a/xen/common/efi/boot.c
> +++ b/xen/common/efi/boot.c
> @@ -858,7 +858,8 @@ static bool __init read_file(EFI_FILE_HANDLE dir_handle, CHAR16 *name,
>      what = L"Allocation";
>      file->addr = min(1UL << (32 + PAGE_SHIFT),
>                       HYPERVISOR_VIRT_END - DIRECTMAP_VIRT_START);
> -    /* For config files allocate an extra byte to put a NUL there. */
> +
> +    /* For config file buffers, allocate space for the terminating NUL byte */
>      ret = efi_bs->AllocatePages(AllocateMaxAddress, EfiLoaderData,
>                                  PFN_UP(size + (file == &cfg)), &file->addr);
>      if ( EFI_ERROR(ret) )

I don't really see why this or the other comment you alter would need
touching. But of course it'll be the EFI maintainers to judge.

> @@ -877,10 +878,12 @@ static bool __init read_file(EFI_FILE_HANDLE dir_handle, CHAR16 *name,
>  
>      FileHandle->Close(FileHandle);
>  
> -    efi_arch_flush_dcache_area(file->ptr, file->size);
> -
>      if ( file == &cfg )
> -        file->str[file->size] = 0;
> +    {
> +        file->str[file->size] = 0; /* NUL-terminate the config data buffer. */
> +        file->size += 1;           /* Free the same page count as allocated. */

_If_ we want to go with incrementing file->size, then I don't see why
it can't be done using the increment operator. That specifically exists
as a shorthand for "+= 1".

As indicated above, I'm not convinced though that we really want to
alter file->size. I'd instead add 1 in the few instances of
"efi_bs->FreePages(cfg.addr, PFN_UP(cfg.size))". Sadly the adding of 1
is conditional in read_section(), so maybe a "need_to_increment"
boolean wants adding next to the need_to_free one? Then a small helper
function may be warranted for those few instances of freeing cfg.addr.

> +    }
> +    efi_arch_flush_dcache_area(file->ptr, file->size);

A separating blank line wants maintaining here. But is this change
really needed at all? Besides being unrelated to the purpose of the
patch, the flushing - aiui - exists so that buffers handed on to
domains (Dom0) are in proper state. The config file isn't exposed to
Dom0, though. (Furthermore I question the effectiveness of this flush:
Speculation and prefetching can easily lead to the data being brought
back into the cache. Such flushing likely requires unmapping first,
and the concept of "unmapping" is a questionable one in the first
place while still running in boot services context. Cc-ing the Arm
maintainers for possible input.)

Jan

