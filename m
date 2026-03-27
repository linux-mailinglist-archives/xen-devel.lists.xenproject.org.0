Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ACnMCoSKxmlELgUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 27 Mar 2026 14:47:48 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 762D33458C8
	for <lists+xen-devel@lfdr.de>; Fri, 27 Mar 2026 14:47:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1265677.1556478 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w67Wn-00030F-I1; Fri, 27 Mar 2026 13:47:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1265677.1556478; Fri, 27 Mar 2026 13:47:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w67Wn-0002yB-F2; Fri, 27 Mar 2026 13:47:09 +0000
Received: by outflank-mailman (input) for mailman id 1265677;
 Fri, 27 Mar 2026 13:47:08 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w67Wm-0002xd-8D
 for xen-devel@lists.xenproject.org; Fri, 27 Mar 2026 13:47:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w67Wl-002rfW-4Y
 for xen-devel@lists.xenproject.org; Fri, 27 Mar 2026 14:47:07 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69c68a4b-2eae-0a2a0a5409dd-0a2a4507c436-42
 for <xen-devel@lists.xenproject.org>; Fri, 27 Mar 2026 14:47:07 +0100
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <jbeulich@suse.com>)
 id 69c68a5a-fd74-0a2a45070019-d1558035c515-3
 for <xen-devel@lists.xenproject.org>; Fri, 27 Mar 2026 14:47:06 +0100
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-486fd3a577eso19108745e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 27 Mar 2026 06:47:06 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-487271be661sm15312185e9.35.2026.03.27.06.47.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Mar 2026 06:47:05 -0700 (PDT)
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
        d=suse.com; s=google; t=1774619226; x=1775224026; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=mrsqabFDGCS4QDEge6h/NqjrtgpOfCibn08AUIYnCPE=;
        b=BIcTD56a67ikJecaGND66/fiAYwbZjzWK64GYaZQ1wBExWeGmlqJrg/309t+n3AfJE
         UPFaDvlYwNKVcBmVOskMmJ1x133MfgTtba0rwrUNFdDpenpaVSLoyDhurI3WLIJwWzKH
         94keoV6SHqfa6HXIOQy1aYO3nFiKZuP/FkSomyPVcFDBCqGcUNTW2wWSz8q9ibQjLxzf
         090XKwEwSRd/Ajocola/3hV+UIinanfUzAS9tu2Unlm2jMJIX1Y4i/uq65VqfYsXXSlg
         +E3euTYszqWNWJ90bD36dCgUZSi9tT00sT2cGxC0MmTWVjRs/3qCubBnpWRI+dF53QQZ
         uUoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774619226; x=1775224026;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mrsqabFDGCS4QDEge6h/NqjrtgpOfCibn08AUIYnCPE=;
        b=f+sjXNfJuwenVo8r3gs34syzPIWZT1USvAKRo9cgV8AtqFp0OKlYCtwLjHH7fCtMbf
         E/I6zgONsyfPD1bNFeaooz9XOol6v8jWW3ovr+IYp1owvtohchCWockxY8SullyduU+8
         rTSBegjznCoB23d8EWW+KBjgKC0wNnPv0RHZDSSVtX5clHXes7IVIOa6AsjXd3hfS2O1
         I5HFXoavd1/AuLwwCR5y3iiWlNnCjTRoKStSsXjQ/BeOojy/R+LwqpCBNTaamy9XDhF/
         v1FzeLSqqnUXTV3Pdj47kfm8Qw9HXJBretQ5V/Q9xYMmLrS/WcueP+MyKaPr1MLMdJIo
         psJw==
X-Forwarded-Encrypted: i=1; AJvYcCXIJIJoPLYYnTauq+80WC3qHB7+8EQ76WIRCDCgk9BOnZPGEEHndqs2mwZYaQV360L7rCAVs/xT5zc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwOUc5UC5xVsPCXjIqqA2ifTws6M/2DcxUkLfAwP9DfIquQm3gJ
	tqyWIpXg1JX9EUSgU+1fou5yEjXl4MOyonoG+f4urO5igvNpjHjgPPaZn2Y6xae7Gw==
X-Gm-Gg: ATEYQzwxuMdHOKtzCPPstZFvgQgWDV5CVA+tZGIhELqNC92AStZK0hBpP+PAYO186ZS
	Jbtr/d9mGeaSysZTKOhaYJOOR+HgBFzE4MAaIQC0Tmaz5Vu4fzYDvcU61brVEPfcLfl/dcETovf
	HTcJvi2Ed/72eX8zMllAdo/ZCkCz8ty7ZjBaUbCDqau3yAnu5jTAsSUguz0B92rZpaM1TBu2C+6
	BPEH5U1tmT/ii+NwKtKbCLQRurQcTr5VQRnkIpbN4L9mHR87MBbQFcC1XEr+tyOeLvGUGhT1kpr
	8kzUbAsJwHWlaZKhOr9P2+9gqxFOeSeQNh+WQv+vEGX2BeBE/JCNd/64C4BQQ3fW1swkZy+Yxpz
	ZrjIYigFz/ejl1y94FOU9OnXh+C5IcnxFtoPBRLK6Ze1tpXJv6bKF5j+vF5x4TuBcTPwP2Psm08
	RnJoeIR/LT5CUlYb7l10crCj37gPanymeeow90hjK3j9AoZuWCVhvlbA8R+sQa3hwJ0i3atOCUu
	E7+ITiUDCOcRVqLPP7iGAwaog==
X-Received: by 2002:a05:600c:3d87:b0:487:1fbf:e0a1 with SMTP id 5b1f17b1804b1-48727d5a2bamr42394035e9.4.1774619226373;
        Fri, 27 Mar 2026 06:47:06 -0700 (PDT)
Message-ID: <d7ef8378-9cce-4be6-b513-7dede80fe7d0@suse.com>
Date: Fri, 27 Mar 2026 14:47:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/4] xen/riscv: add exception table support
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1773419622.git.oleksii.kurochko@gmail.com>
 <c6d30625371d56bb8345c987ac6d8095cc7301d2.1773419622.git.oleksii.kurochko@gmail.com>
 <db8fd1fa-2db4-4df4-8e21-1412783786b2@suse.com>
 <09c5badb-f58b-4331-8138-cba99eba17b0@gmail.com>
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
In-Reply-To: <09c5badb-f58b-4331-8138-cba99eba17b0@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1774619226-56CAA303-226EAB3F/0/0
X-purgate-type: clean
X-purgate-size: 3489
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.894];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 762D33458C8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 27.03.2026 13:47, Oleksii Kurochko wrote:
> On 3/24/26 3:04 PM, Jan Beulich wrote:
>> On 13.03.2026 17:44, Oleksii Kurochko wrote:
>>> --- a/xen/arch/riscv/Makefile
>>> +++ b/xen/arch/riscv/Makefile
>>> @@ -3,6 +3,7 @@ obj-y += cpufeature.o
>>>   obj-y += domain.o
>>>   obj-$(CONFIG_EARLY_PRINTK) += early_printk.o
>>>   obj-y += entry.o
>>> +obj-$(CONFIG_HAS_EX_TABLE) += extables.o
>>
>> Simply obj-y please as long as the select is unconditional.
> 
> I see your point and at the moment there is no also other options how
> to handle case(s) for which exception table is introduced now. But if 
> potentially another mechanism will be introduced what will be the point 
> to have extable.o code in the final binary?

I'd like to suggest to keep things simple as long as they are simple. It
might be different if you firmly knew the other variant is going to be
needed pretty soon.

>>> +static bool ex_handler_fixup(const struct exception_table_entry *ex,
>>> +			                 struct cpu_user_regs *regs)
>>
>> Nit: Bad indentation.
>>
>>> +{
>>> +	regs->sepc = ex_fixup(ex);
>>> +
>>> +	return true;
>>
>> Nit: Bad use of hard tabs.
>>
>> And then - why the boolean return type, when this can't fail anyway?
> 
> As potentially we could have other handlers which might return not only 
> true, so it will be easier to handle return type inside fixup_exception().
> 
> But if you think there is no any sense to have for handlers the same 
> signature then I am also return void instead of bool for 
> ex_handler_fixup().

It's not like there's no sense in that at all, but again - let's keep things
simple as long as they are simple.

>>> +struct exception_table_entry {
>>> +	int32_t insn, fixup;
>>> +};
>>> +
>>> +extern struct exception_table_entry __start___ex_table[];
>>> +extern struct exception_table_entry __stop___ex_table[];
>>> +
>>> +#ifdef CONFIG_HAS_EX_TABLE
>>
>> Why, when this is a RISC-V specific header and HAS_EX_TABLE is selected
>> unconditionally?
> 
> To handle the potential in future case that CONFIG_HAS_EX_TABLE will 
> become conditional.
> I thought that it makes sense to be in sync with common/virtual_region.c 
> also uses ifdef around exception table related information.

But that's common code, which has to deal with mixed needs of the various
architectures.

>>> --- a/xen/include/xen/xen.lds.h
>>> +++ b/xen/include/xen/xen.lds.h
>>> @@ -219,4 +219,14 @@
>>>   #define VPCI_ARRAY
>>>   #endif
>>>   
>>> +#ifdef CONFIG_HAS_EX_TABLE
>>
>> No real need for this?
> 
> Here I can agree that there is not reason as if CONFIG_HAS_EX_TABLE is n
> then no one is expected to use exception table so the section is empty 
> and don't occupy any extra space in binary (except potentially some 
> space because of alignment).
> 
> 
>>
>>> +#define EX_TABLE                  \
>>> +        . = ALIGN(POINTER_ALIGN); \
>>
>> Strictly speaking the original 8 (in x86 code) as much as this is more
>> than we need - each element is a struct of 2 4-byte entities, after all.
> 
> For the  current struct - yes, we can do . = ALIGN(4) but if the 
> architecture will add uint64_t inside (or unsigned long) shouldn't we 
> then have ALIGN(POINTER_ALIGN)?

Along the lines of what I said above, here things want to be consistent.
The alignment effected should be possible to justify by just what is in
the tree, without resorting to any unknown future.

Jan

