Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0NJEMVFUBGp/HAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2026 12:37:05 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22685531688
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2026 12:37:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1307766.1579349 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wN6x5-0007vu-Do; Wed, 13 May 2026 10:36:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1307766.1579349; Wed, 13 May 2026 10:36:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wN6x5-0007uT-Ax; Wed, 13 May 2026 10:36:31 +0000
Received: by outflank-mailman (input) for mailman id 1307766;
 Wed, 13 May 2026 10:36:29 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wN6x3-0007uN-LG
 for xen-devel@lists.xenproject.org; Wed, 13 May 2026 10:36:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wN6x1-00BYSE-5t
 for xen-devel@lists.xenproject.org; Wed, 13 May 2026 12:36:28 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a045421-bab6-0a2a0a5309dd-0a2a4502e210-28
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 12:36:28 +0200
Received: from [209.85.221.51] (helo=mail-wr1-f51.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a04542c-af86-0a2a45020019-d155dd33a46e-3
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 12:36:28 +0200
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-43d734223e4so4073134f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 03:36:28 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45491da03a7sm40225880f8f.33.2026.05.13.03.36.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 May 2026 03:36:27 -0700 (PDT)
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
        d=suse.com; s=google; t=1778668588; x=1779273388; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=K5DeNQ+P3aDKY/gxbWlqjCRir9DtqEU+hexTZ6Msi0c=;
        b=GtoUGq08gs/oSprDjXG+/PFLnup6ELv+xxy6vbqSnIG7lHMIb+CSd3PBQGHFOIh0Db
         jeakA8Gx/4K2OtoKNf/UWYO92QIfgPDBWyGX4XE5NXIAtlxNKZ0T7lu0vK5T+5GxS116
         BWGmQg/yaxs9rvkb6A0eC6WGSp0gMpDgpvtQNbmxwiTkUPO7qLkfqRgSpvFzQbm1iTep
         BV2We7YVfvb9eRbU6iYyM8qKc0hlERhp8w1OcJbxqlC8O6JwGvLHGqyPXkio0mJgZMCR
         zdpmM7M8Fx9jJ/5t2NqMIB+/a2LeAA1sQfODdHyO0Ci3ltkS+c3aEjn9ndnXSog7YsT8
         FT/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778668588; x=1779273388;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K5DeNQ+P3aDKY/gxbWlqjCRir9DtqEU+hexTZ6Msi0c=;
        b=YhkfsbXdT4MkKcGWq6+1BEkyA1stAI6zuxw/hg/w6aeE7PSZmqkcuhefMt1wUJP+Ic
         No7HYo3LHpvb9fWtpMazhhsQezC1kZL/9g+9XYByqwJyJRUb7PnriFa+s80sLvCuoorI
         YYu8NjRD3ttc3oiHqAfECILhoa0usuZ+9L36LB1754oRMvH5ekJKw9ZJ5zwFJU+bljIu
         rWkhyZYRp+25/6GOZxZDrO4fhVNlvLpLN0axIsD+Q+v9FVijFmbjS9RTJlS0rUAiHKUa
         Pv/iveD0iC6k4t6q4LG+lP5+AE2nRYtN0oABJ/mAD1etXiiuTIxBid/r0JMTDCYP5Da8
         HqGg==
X-Gm-Message-State: AOJu0YxZ1umv+opsLhd/QChcJ33ijisXtwT54eowqIGLdO1R7BKxurLa
	tTqZkZ4L6c6dXsa3or9++kNokCUdZUQykUyTO11I/ZOscQNxk1yz20YcgFDlGJvePA==
X-Gm-Gg: Acq92OH0sYr+lLYbMaLT52yF2dqhUXdW3iVH2n4ijZZwFcp8pl4VKgC2OPvFOCVbqqU
	6FBOmDop/FCCyyS8WZM2e3znDiTpaWupCA5URytWy/ov6P781Tk0kVyqfR9YmM9M4xq2nQLqS5j
	n6UI6/qACjQs7KkCCxC5AsrklY0sh/CKow8wlxyktALprNaCIutfT/NGln2GAYEFrj4OC77SlML
	HvdU+qGw5H3BgoX7vV/n5lJwZWlTTPg/Zc7iLBon9c6QNAluEudmmARnXGR938TrGxsDJt0u3v2
	/RQP4kRaIntQayWDB7/a2D95JKMBK2CGOy9zx+tv2GgUe5Lh8cHkEAtCkvqlYLOOszO6qhkNWEg
	/oR3XH6so+Lfz6LMrfcYtMtiox2mhgLzwdLkLRmd//Z2tSej6EzYvM78v1K20Mhl+X/Iqnges19
	VdlYFPVVuv4XgdwJ3gtFXe/LIBOxoNfTLFc+U/ixDmg5u/UogQmjKXnFj1I28Nm5CXIvzClqidE
	jY41y+bxGd0LgY=
X-Received: by 2002:a05:6000:2f83:b0:448:d2f8:be2a with SMTP id ffacd0b85a97d-45c46ef76bdmr4703662f8f.19.1778668587982;
        Wed, 13 May 2026 03:36:27 -0700 (PDT)
Message-ID: <35e23e0f-5439-4516-906c-4310cd05a4a9@suse.com>
Date: Wed, 13 May 2026 12:36:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.22 1/5] x86/time: use RTC century byte when
 available
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <b36b6f2f-2b0e-462d-9846-4a1b4d7edef9@suse.com>
 <2723456f-5d8c-4a2a-9876-e65d35579936@suse.com>
 <agQ7B0JQqisZ55jp@macbook.local>
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
In-Reply-To: <agQ7B0JQqisZ55jp@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1778668588-8137C161-66984141/0/0
X-purgate-type: clean
X-purgate-size: 937
X-Rspamd-Queue-Id: 22685531688
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:teddy.astie@vates.tech,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[lists.xenproject.org,citrix.com,vates.tech,gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

On 13.05.2026 10:49, Roger Pau Monné wrote:
> On Tue, May 12, 2026 at 04:58:43PM +0200, Jan Beulich wrote:
>> @@ -1280,6 +1281,8 @@ static bool __get_cmos_time(struct rtc_t
>>      rtc->day  = CMOS_READ(RTC_DAY_OF_MONTH);
>>      rtc->mon  = CMOS_READ(RTC_MONTH);
>>      rtc->year = CMOS_READ(RTC_YEAR);
>> +    if ( acpi_gbl_FADT.century && acpi_gbl_FADT.century < 0x80 )
>> +        century = CMOS_READ(acpi_gbl_FADT.century);
>>      
>>      if ( RTC_ALWAYS_BCD || !(CMOS_READ(RTC_CONTROL) & RTC_DM_BINARY) )
>>      {
>> @@ -1293,7 +1296,12 @@ static bool __get_cmos_time(struct rtc_t
>>  
>>      spin_unlock_irqrestore(&rtc_lock, flags);
>>  
>> -    if ( (rtc->year += 1900) < 1970 )
>> +    if ( century )
>> +    {
>> +        BCD_TO_BIN(century);
> 
> Don't you need to move the BCD_TO_BIN() translation with the rest, so
> it's not done unconditionally?

No, the century field is always BCD.

Jan

