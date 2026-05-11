Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iHavKfXdAWptlgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 11 May 2026 15:47:33 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1953450F45F
	for <lists+xen-devel@lfdr.de>; Mon, 11 May 2026 15:47:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1306213.1578277 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMQyc-0003NX-2V; Mon, 11 May 2026 13:47:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1306213.1578277; Mon, 11 May 2026 13:47:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMQyb-0003Ke-Vx; Mon, 11 May 2026 13:47:17 +0000
Received: by outflank-mailman (input) for mailman id 1306213;
 Mon, 11 May 2026 13:47:16 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wMQya-0003KY-Mb
 for xen-devel@lists.xenproject.org; Mon, 11 May 2026 13:47:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wMQyZ-00DJLC-VI
 for xen-devel@lists.xenproject.org; Mon, 11 May 2026 15:47:15 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a01dddc-bab6-0a2a0a5309dd-0a2a450ae674-18
 for <xen-devel@lists.xenproject.org>; Mon, 11 May 2026 15:47:15 +0200
Received: from [209.85.128.51] (helo=mail-wm1-f51.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a01dde3-56b3-0a2a450a0019-d1558033e13a-3
 for <xen-devel@lists.xenproject.org>; Mon, 11 May 2026 15:47:15 +0200
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-488a8ca4aadso39865255e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 11 May 2026 06:47:15 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48e6d8d3113sm87638315e9.2.2026.05.11.06.47.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 May 2026 06:47:15 -0700 (PDT)
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
        d=suse.com; s=google; t=1778507235; x=1779112035; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wg0W2iAQ1/HBRB5CGJb70HRfS4RhUAa3wrK7q77R4aU=;
        b=Lyek5Z4JKTwmKyhjJ/Izy5Kc33+euFq7cQpXwTdBWF7mr6FTfgieSFoC1hxwJDOx/n
         LfZfZEquJ+HIASevfHnE0XE2QrHS3/Sd6biyAgMq9aPOyrbgkn+FBUTv25brL/81eJ78
         F5/8vI+B/4tmKeiJ4TAZHEzqvoUBnYEAy9qofotI5Pz3f1MRgsSz4NhFyEE5xW7h7OVk
         n+RYiAzibhk0w8tFANkQTBDz4uy/b/bCubSzUVLMD36IiNmlpZag2rLPDjVQgOGqo7Aa
         NBDcF3DhDXswBl079y/KH/jQw7vykzumRyGwPbnzjghyL7e71fcDPlekmSNTgdvyUxIT
         GNwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778507235; x=1779112035;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wg0W2iAQ1/HBRB5CGJb70HRfS4RhUAa3wrK7q77R4aU=;
        b=F8yOUdvImNvGDkYkx/GTqgicb8JySAIK0BN65ObYylG8gS400KGtOCrRdveDSdhwW8
         iY6q+7A6yqAz5N96QNnYI7BM9Cx+TwXl2Aae39niA1UUPDXLm25Zuo4iMiW7hhXCs981
         BCSxKQGzMJHyG9rVjO2HwFzjwrWJaHC8zaXJZnDBa06JS8hdRORXN94SNNcI8Lmm2a0A
         yZ32G6HBEu6WnPNUwBdBUD8+QgPE4xkLyYVNITtcYuq0xuyfCnwd5XuyQBk5ShyTE+Pw
         moqjGlMyWHnZbNhqwbRvCjYEdJL0Og0bp15Vf8lD8FSjrnEbJprKQ4GDQou8ZpD5Cfrp
         g6Bw==
X-Forwarded-Encrypted: i=1; AFNElJ++mYvCO/z6OOF3PEMdTEOQ5PK+Mogrl9KHP5/IMnM41uc7Es29wDLV1LwB1vq0n/8WTt+Oox4tSLU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yykm1o9jsU/AshQHs7Xs6VWKdZTcCWpPmzTpRz2orNe52sLL/zq
	Wh8Zp/+o9T+bTKI1loXtrVl3sFR9JpF6eU6F38BLsCrI7705/iAjM/mquZGL5OW3ag==
X-Gm-Gg: Acq92OFUCn3/oFcwuZiPYUMSl8ECgjhStMox2saqHhiM0ObRKJzHzEJTTqAYpQrcsqT
	S3qTFIpcGU1LjO4tbpXNiqDR1gc86+5WawqtU7MOBMHx3LCeMkDXgomXhT7fC1WBj0jcWUlsG33
	NusB4l0qgj1cqcvk9//FnkQNCmD8BmZjUbAlSbuZtt29ePYkr4vaZaaX80SVfWR+cX+kPkYJMfM
	1+ssNdqwV2bxj3bZkUlGIk9/nWaAK6SrY9eZGAf2oRPz5A+SgLPxbWIXB3f5J8iCBHbkEi59s0h
	oIcDK0lF0+HWXDhWCrwtjtUqLZFNNn2sZ2tAAhHxGG2+XvfQBDSb0ks7TQcQHHSkhBXpdTqmMcP
	+miQCqSDDrs0kW+30lqUUjkumsmBrUpwAzfjlC5LjQ22Lf53jvej1YgnZUbcyztblMcVVm+NVG+
	9TjCe/ZAhW1PXSnuHQNIDogKdu+uNuCppxrwwCipPLWDUP1U9tTIK1XmNCRYbICHRW+adX05MET
	NVkpDBkbTmRqaFeufdq2n2EVg==
X-Received: by 2002:a05:600c:37c6:b0:48e:7f22:d90 with SMTP id 5b1f17b1804b1-48e7f7de432mr94241785e9.4.1778507235424;
        Mon, 11 May 2026 06:47:15 -0700 (PDT)
Message-ID: <a0cd1cd4-12d9-44aa-8204-c607e597c396@suse.com>
Date: Mon, 11 May 2026 15:47:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] symbols: explicitly specify source file name for symtab
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <f921abc1-1f1a-4ef1-b21b-a65b5d50eafd@suse.com>
 <da3020e0-cfa8-425c-95a4-1dfe8394000a@citrix.com>
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
In-Reply-To: <da3020e0-cfa8-425c-95a4-1dfe8394000a@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1778507235-71B6F8B7-0703080A/0/0
X-purgate-type: clean
X-purgate-size: 1358
X-Rspamd-Queue-Id: 1953450F45F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[xen.org,kernel.org,vates.tech,amd.com,citrix.com,gmail.com,lists.xenproject.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:oleksii.kurochko@gmail.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

On 11.05.2026 15:41, Andrew Cooper wrote:
> On 11/05/2026 11:00 am, Jan Beulich wrote:
>> --- a/xen/tools/symbols.c
>> +++ b/xen/tools/symbols.c
>> @@ -66,6 +66,7 @@ int token_profit[0x10000];
>>  unsigned char best_table[256][2];
>>  unsigned char best_table_len[256];
>>  
>> +static const char *srcname = "xen-syms.S";
>>  
>>  static void usage(void)
>>  {
>> @@ -356,6 +357,7 @@ static void write_src(void)
>>  	printf("#define ALGN 4\n");
>>  	printf("#endif\n");
>>  
>> +	printf("\t.file \"%s\"\n", srcname);
>>  	printf("\t.section .rodata, \"a\"\n");
>>  
>>  	printf("#ifndef SYMBOLS_ORIGIN\n");
>> @@ -679,6 +681,8 @@ int main(int argc, char **argv)
>>  				unsorted = true;
>>  			else if (strcmp(argv[i], "--sort-by-name") == 0)
>>  				sort_by_name = 1;
>> +			else if (strncmp(argv[i], "--source-name=", 14) == 0)
>> +				srcname = argv[i] + 14;
>>  			else if (strcmp(argv[i], "--warn-dup") == 0)
>>  				warn_dup = true;
>>  			else if (strcmp(argv[i], "--error-dup") == 0)
> 
> Why does x86 need to plumb the source name in, but the other
> architectures don't?
> 
> xen-syms.S suffices for both x86 builds AFAICT, so can't it just be
> unconditional?

It could. Yet I'd prefer the distinction between xen.efi and xen-syms to
be recognizable (in case any dependent local symbol would show up).

Jan

