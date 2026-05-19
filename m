Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iPGkHcBoDGpXggUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 15:42:24 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF4FC57FE13
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 15:42:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1313039.1583229 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPKi6-0001HB-JP; Tue, 19 May 2026 13:42:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1313039.1583229; Tue, 19 May 2026 13:42:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPKi6-0001Et-GI; Tue, 19 May 2026 13:42:14 +0000
Received: by outflank-mailman (input) for mailman id 1313039;
 Tue, 19 May 2026 13:42:13 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wPKi5-0001Ed-0o
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 13:42:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPKi4-00CoZq-CY
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 15:42:12 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0c68ac-bab6-0a2a0a5309dd-0a2a4503d12a-36
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 15:42:12 +0200
Received: from [209.85.128.47] (helo=mail-wm1-f47.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0c68b4-672d-0a2a45030019-d155802fac86-3
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 15:42:12 +0200
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-488a14c31eeso21891065e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 06:42:12 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45da0fe13b4sm46269996f8f.28.2026.05.19.06.42.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 May 2026 06:42:11 -0700 (PDT)
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
        d=suse.com; s=google; t=1779198132; x=1779802932; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=UTzkNZRv/9acd0+EOTyU7C1Fh720JmA0arbxLOvG6S0=;
        b=VJt+uMMN2tz/A9cgjFDc/mvoIujVzNIjQVs1S5bQJwxky0z+7nWU/yC4wxeRq8Xj/n
         nOVJrV3xYoe8Uv7JPtJF+msrhW7IFm5ocXybFKT1koKWwH0xwlMruy6dQ68EECfqVz40
         SVB4TnB9D0paAExp/RWkKXuDPd5YfEe7wEmbX9dFC6YmbQ5ZzdsPAicYiL/hSBuSZYCt
         IvtWf8Xl/DOqG6gRyz1cC5k8veH+ZFG2SNjcb3QiKsdLn60CW2qbpQfxZxiviYV/LfPL
         g9GdNpnVt3AE4MH5ARsF8lSw/+voaYGm5AhMqX6eXKeXBjQECcdjLSgFVE+bFZiv/zcb
         Fpmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779198132; x=1779802932;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UTzkNZRv/9acd0+EOTyU7C1Fh720JmA0arbxLOvG6S0=;
        b=WPOhgjbGzrmNX2y2FTPMY4J+IVCxVlCYxcRru9D3REO6PJ5T0kBknS5E3rCv4IlFdO
         ezozeNZ7hIILqHLA0oNur+PZFO21i3ACRd34SSPn3/2QHGqqusqPd1XMTnQc/859yal4
         SzZZZQ12w/JAZqAAnSiFE0UxtYKt8WrY7PiMMiNy8cX+SvBuupHoP+N9oBeSk6rWd10m
         TDbZ/T6B2paaSHWuz3TFTmwU+PbFI8iRqxpN8GyMuBIgLSjnsijIP/jcbBZBM6tGh5Wx
         WdbbUdPBcjkwhu2uzaPzfiTIpMvH4lmJaboxhybemx2o60SZeQIEpIRHa+VMLkSdxT9K
         Rp1A==
X-Forwarded-Encrypted: i=1; AFNElJ+Z4HbfImTA4FQ6qqM2TMu7KZEK//cnnDb3y0OiRTxRwf6zsbkzPb+oiqEccGg+10BORUrmkgxj5C8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxX0FpqqADQOo5s90ngRgHaabXiJXzjmeNlww/wPZAExj33PiKJ
	WuXsmU4v1rmIVIefwXyNCIGp2qArmptSh9TUv1Gu3mCE8CSJRgMAzeDkiBt7IxmZUg==
X-Gm-Gg: Acq92OF8TdWYMbmmGK2Fe2HADoo1yHz4a5ydSYNbFsIXHk2p+fgL04pvwSt9oNVCdJo
	vj6S2+bK6RiZfPfc/E3I8pJ35ZZABFbaDkiibfa9W3sXT7RHfZ+8Ed/JLY68ilBssvzv71AoCaX
	uXZNfsX+V+juzYzDsPzV88w/6uNUVT5rTZ+Kqatezn3PvMyorhctrfA8X4RVNLCV3qSyhJs7uph
	bYx5G2sprYFgmjwBwF/+XjuojzlaOk8QWxzODXWOBBBA8PA2chtSuyAM+KM1iYplNApr61vOriR
	7QF+s7NCWI5K3DQLkiVWzLd/gylK6V9tBiBbb732Eo55bvo1qMN2Xemct+rmvHwrJLZp0cpIFa7
	YWjaEbqHI1IvRlHrsqWIHSj30rY4g6XwA/cR8R9iPQoY7o5Ndx7CU/cW8b19gHg8nNonVFQtR8a
	0HLCLw5ij257W6UwGiPLlw99es4hmhqGB5vWRVikkA1cZud0mBgtrsPXd1XB/dAq2oQ2dyYQqbB
	Fpz0mPINi4nJXA=
X-Received: by 2002:a05:600c:1593:b0:48f:f199:79f7 with SMTP id 5b1f17b1804b1-48ff1997aaemr150118725e9.27.1779198131680;
        Tue, 19 May 2026 06:42:11 -0700 (PDT)
Message-ID: <b1007dca-c19e-4dce-b17c-56aedb89c106@suse.com>
Date: Tue, 19 May 2026 15:42:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/26] xen/riscv: implement make_cpus_node()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1778250616.git.oleksii.kurochko@gmail.com>
 <69d2dd26b7c2d00c9d28f898f041f6d1be145e0d.1778250616.git.oleksii.kurochko@gmail.com>
 <3c0e5b33-d3bb-41ea-ba13-43add1d64617@suse.com>
 <acef31a4-de38-4883-a6e5-7c03106147a3@gmail.com>
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
In-Reply-To: <acef31a4-de38-4883-a6e5-7c03106147a3@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1779198132-41197938-B6012480/0/0
X-purgate-type: clean
X-purgate-size: 1128
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim];
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
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: DF4FC57FE13
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 19.05.2026 15:33, Oleksii Kurochko wrote:
> On 5/18/26 6:00 PM, Jan Beulich wrote:
>> On 08.05.2026 16:43, Oleksii Kurochko wrote:
>>> +    {
>>> +        char buf[64];
>>> +        uint32_t reg = cpu_to_fdt32(cpu);
>>
>> Isn't this a byte-order adjustment? If so, how come ...
>>
>>> +        snprintf(buf, sizeof(buf), "cpu@%u", cpu);
>>
>> ... the result is passed to an entirely non-FDT function? (Most pre-existing uses
>> of the function that I can spot store something in memory, i.e. adjusting byte-
>> order makes sense there.)
> 
> But here pure cpu is used instead of reg variable and reg variable is 
> used here ...
> 
>>
>>> +        res = fdt_begin_node(fdt, buf);
>>> +        if ( res )
>>> +            return res;
>>> +
>>> +        res = fdt_property(fdt, "reg", &reg, sizeof(reg));
>>> +        if ( res )
>>> +            return res;
> ... but it we could drop it and use just:
>    res = fdt_property_cell(fdt, "reg", cpu);
> 
> fdt_property_cell will take care if a byte-order adjustment.

I'm sorry, I clearly must have seen something that wasn't really there.

Jan

