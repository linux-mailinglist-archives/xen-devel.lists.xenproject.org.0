Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xGzWCHJGT2pxdQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Jul 2026 08:57:54 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6173672D6A9
	for <lists+xen-devel@lfdr.de>; Thu, 09 Jul 2026 08:57:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=VMFGMOXB;
	dmarc=pass (policy=quarantine) header.from=suse.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1357556.1611934 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whihO-00074n-F1; Thu, 09 Jul 2026 06:57:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1357556.1611934; Thu, 09 Jul 2026 06:57:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whihO-00072l-CC; Thu, 09 Jul 2026 06:57:30 +0000
Received: by outflank-mailman (input) for mailman id 1357556;
 Thu, 09 Jul 2026 06:57:29 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1whihM-00072c-Qh
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2026 06:57:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1whihK-00DjDB-Gl
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2026 08:57:26 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a4f4642-5cb7-0a2a0a5109dd-0a2a4508c0bc-48
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 08:57:26 +0200
Received: from [209.85.221.45] (helo=mail-wr1-f45.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a4f4656-edec-0a2a45080019-d155dd2db8d4-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 08:57:26 +0200
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-47362928f65so444885f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jul 2026 23:57:26 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47aa0f21328sm49655932f8f.32.2026.07.08.23.57.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Jul 2026 23:57:25 -0700 (PDT)
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
        d=suse.com; s=google; t=1783580246; x=1784185046; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+k0C3q49/KKBZ0MnIjWWzf2c4PRxgP3HEjn68PXLNqs=;
        b=VMFGMOXB2/FCyIF8ThnYyHkN4Uj6vj759dPoWwCf/EeCSzOinbnwoqK2m8x2fTUqCM
         DFkgakVvSO+ZLOB2omU8uLD71R06qlq5HuHPrWxHULlNN8kLRd2p235YqCaGZvQTRwEA
         kbRMaKA1zaLn6wQgeNWNhhNvJTKapeFTwhSHG3v7BupSdMPDBX3kLGCXmSlabuayzjLU
         hf/HgE0ktbQMjAXIpJekaxTa3h/Cmfe8Rqs9/x9vS7oJyqZGhB+oN5rb51CbaSnLgBtb
         xvwU5ZTLO9kAleHHHtb9dG3WLnRBSxfbxAH2ca7IiNI5K0Q7FlSLZ7aS2DVlpWTH0KZ+
         U8kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783580246; x=1784185046;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+k0C3q49/KKBZ0MnIjWWzf2c4PRxgP3HEjn68PXLNqs=;
        b=p351tEBBOd7UIPvi9abXoN95uDK2E++BM66M+I66wYYZ+/zCl18BgDzEWtR7XrDPTG
         /LzuuDq4zpUpfJMFkWVsokM+kr6dKYpoNJ1TZCcSUjMu9AHIZ/u/OdBsEfkcNVT10Zet
         WxCJWkzkP1lCRtt44LWzvthvLe3+s8MSaH+VRuhwnxh4LLItWPNtWIwWzpjv5VB16UZd
         DiQ+ZGf7+H2KRbcl3HauJwKvRksa5TD5uB7A77B6hKqK9iQaEuxHSHF2tFPKm1mFMBne
         9OvNEN3T9qDXZCn+I1kfO92zPa3HE/JcNrdXuRlCmmOhG4l5WSBx1oC1ajT6PF1n4GhB
         rjlA==
X-Forwarded-Encrypted: i=1; AHgh+RpitZA8ExqipRORKq5zXS8BuMOI3/e8lYvBv0F4PfgD6kt8z+8WdWswewV395Uzvbh1wYHm1bf+xmg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyScCe00kqouBkw2c9jFjM+m6xlWfM50oy4moIJHMOgF4VUnrkk
	RyBR0gDNbhcJjUHURVmLSjjJGa2/uqLFYEDGX8linGaxhv8SedGpDemS6MYFiVn//w==
X-Gm-Gg: AfdE7clxKfGtqvBN1n70FSzlB8F5YM7EWpDMOc7roplYRRJfiCgHfLvnC4P3+u2N30N
	emWh2ZWkkrLw2LMaPr1Za+Q7QCtqOYn6U/CV9s+v3agAMkl4H/vdXv8FXxymlqQ2662rXDbvV6h
	TCHRJBWbiyPHRdBipEgEWfuYfMlgXtpXe82pt+Trhj3O/jMkVQU5TAHqlTwOtni+eNP4hQsvklP
	hclTGdLsOgj/m8Fj6ayVARC3m6vGjEnSnSjJyzBOv+jIUnx9dFwIWJAR1jboK44SsHOBbY8+QLE
	KnPeo4dr573ivfjNWVxpvqr3opArMBcezxrwNwgaQ2Oqw/k2UDDTMJhoiGQhxtqGyfr5+6Kgc7w
	ULgizMGJEcCfbMFPnUH+29Oi2bMikmU368n7AOMNwbm6PyjnjFoTkNFRYXKNIiiV/Q/7h8hxF5p
	1IKobiBfz2t/778GB/7yjKNpzscOlr2kddizYF4WkXzDtnlRXUzD6g1nxJcNqRh4bG1w5Ajs2WW
	f4I
X-Received: by 2002:a05:6000:4709:b0:475:f0d1:eb69 with SMTP id ffacd0b85a97d-47df07c5accmr6149484f8f.54.1783580245776;
        Wed, 08 Jul 2026 23:57:25 -0700 (PDT)
Message-ID: <ec7bc0ef-e267-4240-ad73-13dd17e1575b@suse.com>
Date: Thu, 9 Jul 2026 08:57:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.22] dom0less: Prevent division by zero in
 handle_passthrough_prop()
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <cce2493855ce3b610a2d36cbcd149292254170aa.1783436517.git.dmytro_prokopchuk1@epam.com>
 <e494980c-485e-4dc6-ba84-e40fd53442d6@gmail.com>
 <21ec0511-bf7e-44fa-b6f6-99d9c4085eda@suse.com>
 <c8769518-3f84-4c73-920d-975b7efaaf92@epam.com>
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
In-Reply-To: <c8769518-3f84-4c73-920d-975b7efaaf92@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1783580246-423203FC-6A1B0FFC/0/0
X-purgate-type: clean
X-purgate-size: 2574
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:from_mime,suse.com:dkim,suse.com:mid,lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FREEMAIL_CC(0.00)[kernel.org,xen.org,arm.com,amd.com,lists.xenproject.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dmytro_prokopchuk1@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:xen-devel@lists.xenproject.org,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6173672D6A9

On 08.07.2026 19:04, Dmytro Prokopchuk1 wrote:
> Hello Jan,
> 
> On 7/8/26 09:15, Jan Beulich wrote:
>> On 07.07.2026 18:08, Oleksii Kurochko wrote:
>>> On 7/7/26 5:16 PM, Dmytro Prokopchuk1 wrote:
>>>> --- a/xen/common/device-tree/dom0less-build.c
>>>> +++ b/xen/common/device-tree/dom0less-build.c
>>>> @@ -154,6 +154,13 @@ static int __init handle_passthrough_prop(struct kernel_info *kinfo,
>>>>    
>>>>        /* xen,reg specifies where to map the MMIO region */
>>>>        cell = (const __be32 *)xen_reg->data;
>>>> +
>>>> +    if ( (address_cells * 2 + size_cells) == 0 )
>>>
>>> Considering that this calculation happens second time here ...
>>>
>>>> +    {
>>>> +        printk(XENLOG_ERR "Invalid address/size cells combination (both 0)\n");
>>>> +        return -EINVAL;
>>>> +    }
>>>> +
>>>>        len = fdt32_to_cpu(xen_reg->len) / ((address_cells * 2 + size_cells) *
>>>>                                            sizeof(uint32_t));
>>>
>>> ... I think it would be nice to calculate that once.
>>
>> Hmm, originally I meant to simply stay silent here. But now that you say this,
>> I'd like to express that I find this 2nd calculation of the same expression
>> bogus. If the goal is to deal with both values being zero at the same time,
>> check that (and nothing else). If instead the goal is to truly prevent the
>> divisor expression from ending up 0, that (and not a shorter surrogate) would
>> need checking. In particular, the multiplication by sizeof(uint32_t) can
>> convert non-zero to zero.
> Yes, you are right. Need to check whole expression.
>>
>> At that point the question then would be whether overflow (and hence
>> truncation) in any of the involved expressions shouldn't also be detected /
>> rejected.
> Testing zero is useful, but not enough - the expression (address_cells * 
> 2 + size_cells) * sizeof(*cell) can overflow and wrap around to a small, 
> non-zero number. Source code analyze showed that Xen only supports cell 
> sizes of 1 or 2, and there is a ASSERT_UNREACHABLE() in dt_read_number() 
> which prevents from using wrong cell values in DEBUG builds.
> 
> I would propose the next checking:
> 
>      if ( address_cells < 1 || address_cells > 2 ||
>           size_cells < 1 || size_cells > 2 )
>      {
>          printk(XENLOG_ERR "Invalid address/size cells combination\n");
>          return -EINVAL;
>      }
> 
> This will cover zero check, and overflows.

It'll need to be the maintainers of this code to judge whether this is
appropriate here.

Jan

