Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AI/rAoE+12mbLwgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 07:52:01 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 566C53C661C
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 07:52:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1276667.1562005 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAiHy-00006x-T2; Thu, 09 Apr 2026 05:50:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1276667.1562005; Thu, 09 Apr 2026 05:50:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAiHy-000055-QC; Thu, 09 Apr 2026 05:50:50 +0000
Received: by outflank-mailman (input) for mailman id 1276667;
 Thu, 09 Apr 2026 05:50:49 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wAiHx-00004y-0a
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 05:50:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wAiHv-007Lt1-Oh
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 07:50:47 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69d73e30-bab6-0a2a0a5309dd-0a2a45069b18-28
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 07:50:47 +0200
Received: from [209.85.128.48] (helo=mail-wm1-f48.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <jbeulich@suse.com>)
 id 69d73e37-0df0-0a2a45060019-d1558030ec6c-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 07:50:47 +0200
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-488aa77a06eso7512525e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2026 22:50:47 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488cd153d76sm47786805e9.0.2026.04.08.22.50.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Apr 2026 22:50:46 -0700 (PDT)
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
        d=suse.com; s=google; t=1775713847; x=1776318647; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=RxED7Yk7+bsMH0gSNl2zBw8p1U/zRE5rFSXYVZlbgvU=;
        b=FNOY9Vc9e8BMeCtaEQCGMBU2Zjl8leMB1oSp33vgE8tgBRgEY/67fW4LwrwU3aFcI3
         gwAZd8fnZXuIRzft1BvZer8gPRHPQk7P6at63xvVfJgVhc49L4hbl/1wznHmejPRZe+T
         94lheVEVBUq3HNNeo0Jeenwrsk1lNDQuvMGVJAPWqHcq8/sOkSxoR/OL9XbDJ47+RUs4
         zH32ZF5+zN4Q9HIrq1DohyOfXgD4xz6ch5LfezZbJpQQ0NdG8uVG4HT1vEa+zZsMBbhC
         zT5JW2XS5ku5Qo6wA/LjCj0zAW2LMQYSprXTPEpQIAFyB1sppIv3ZlgxwpT7kpCl0n3g
         WVOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775713847; x=1776318647;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RxED7Yk7+bsMH0gSNl2zBw8p1U/zRE5rFSXYVZlbgvU=;
        b=XJjy0uwKoBG/wL9NPiE5RhSiSM8KjAM9MNWlH5OInz3vUjfcGvUrOxf5OX1EC159xS
         +qhzxqOLapIxEdFcXM6HBytbrvV0lVeesrLI1HndfoeYjjYh34ypTr9ZDGXRPFyUlb2P
         7F+ZKlb7sc3D9t9P9g6T9wafRB/hG31aMJdxrRGH/sXwhHHKG4jzbPB4/SoNvtzEROrb
         54uOe8dOz55pqMZKNUxWQEOCXgLr2lRK0yZNE8DxHrN1ugYlAHA5ZzAaWCUGFgGm2UyZ
         H06llRZNDKCWVSPGrsod2AuxSiaxMtqgsfLRZCDSMJj+SJ1/caFgPAC+CkyTJF6TUiob
         VQ4Q==
X-Forwarded-Encrypted: i=1; AJvYcCXTpgn/LrQt6SuV6TyakYhyeBVEXlNZShbFdSSK6Q0xnGHEg+vP9b3YlasEkJOsJJzxnFuXXLE3sr4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw0t0vUIrZoYHc6DmhhbcB1YjJaOrgDfEWojFfiBEbXw4tOYKnu
	5TOKQFXbG488sBt4Bat+nWF1zEG7+uH/fIcMyfDn6n6Ij0JfYvZnyfOurw+pQwN5PA==
X-Gm-Gg: AeBDiesciDgM9ZYybh7N56o/iSaSFGLZamMyxF6lWHmrjG8ZrIBEipDeAdflHg2vlwy
	+D+V3cRu5NX69G1vTUurcSOxsAMP3uhpEQ5Hi0RyX4Jcsoquw+MwKxrSSFCHQv8GxYlhOF0hAoB
	Ty8+PGlms+bpBONrxczmhnNFuGEyHT56TskjNu6XQRilBiptIMFWmuK1AtAUMdqgj3FT8TRfnw/
	TddhGiA4KHDzm9UwUz9tJnFn1Q2tO4Yjc7LPlR6nebEoEpxzX9lw1HqooaJZ4Kegcc4JWgCQNU6
	o2SeEzplYjIoKdygF0zff/capbepiofcXHFQjjXngpNznzO6EClB5efj0qX38K/Mp1EY7+dmtuX
	c+BCFSy7RP7ziL0yJ2EWBUNsySUTo1jxB5INMKFB5XxBqbxUHtb6EcxDx+mGlvoeOPyetuxmqe0
	m3t2nLpcW6mZ267Uyu3GWXAw0J1OrexBZDuTYZnscR6yj/187FyjUKECTlqWpGhDoChT4IGlER3
	/8lPweyWZUeA/p4TB51A9o2Wg==
X-Received: by 2002:a05:600c:4752:b0:488:7ff5:2c67 with SMTP id 5b1f17b1804b1-4889976ea80mr335149145e9.12.1775713846814;
        Wed, 08 Apr 2026 22:50:46 -0700 (PDT)
Message-ID: <19a67ae7-e329-4303-8a80-29fac1c15822@suse.com>
Date: Thu, 9 Apr 2026 07:50:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10] x86: use / "support" UDB
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <deb26054-ec00-483c-bc18-1edc1b4599b3@suse.com>
 <99200edd-3a99-4043-88b7-a7f3ee2c7a44@citrix.com>
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
In-Reply-To: <99200edd-3a99-4043-88b7-a7f3ee2c7a44@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1775713847-5D3273D8-BA88A76C/0/0
X-purgate-type: clean
X-purgate-size: 1628
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,suse.com:dkim,suse.com:email,suse.com:mid];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 566C53C661C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 08.04.2026 20:04, Andrew Cooper wrote:
> On 08/04/2026 1:12 pm, Jan Beulich wrote:
>> With opcode D6h now firmly reserved as another #UD-raising one in 64-bit
>> mode, use that instead of the two-byte UD2 for bug frame marking.
>>
>> While there also make a minor adjustment to the emulator.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> For the patch itself, Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

Thanks.

>> ---
>> One of the table entries in stub_selftest() uses UD1, yet in not quite
>> an appropriate way: The 0x90 following it (presumably meant to be a NOP)
>> really is a ModR/M byte, requiring a displacement to follow. Wouldn't we
>> better adjust that (e.g. using 0xcc instead)?
> 
> That looks too much like breakpoint padding as opposed to nop padding.
> 
> What about:
> 
> diff --git a/xen/arch/x86/extable.c b/xen/arch/x86/extable.c
> index a9b6c6b904f5..24440ccd03e3 100644
> --- a/xen/arch/x86/extable.c
> +++ b/xen/arch/x86/extable.c
> @@ -157,7 +157,7 @@ int __init cf_check stub_selftest(void)
>          union stub_exception_token res;
>      } tests[] __initconst = {
>  #define endbr64 0xf3, 0x0f, 0x1e, 0xfa
> -        { .opc = { endbr64, 0x0f, 0xb9, 0x90 }, /* ud1 */
> +        { .opc = { endbr64, 0x0f, 0xb9, 0x00 }, /* ud1 (%rax),%eax */
>            .res.fields.trapnr = X86_EXC_UD },
>          { .opc = { endbr64, 0x90, 0x02, 0x00 }, /* nop; add (%rax),%al */
>            .rax = 0x0123456789abcdef,
> 
> which also brings it in line with the adjacent example?

That's also okay, sure.

Jan

