Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AK32Keq+wmmjlQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 17:42:18 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A7DB3193C8
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 17:42:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1261151.1554265 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w54pQ-00055I-Fv; Tue, 24 Mar 2026 16:42:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1261151.1554265; Tue, 24 Mar 2026 16:42:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w54pQ-00052W-DD; Tue, 24 Mar 2026 16:42:04 +0000
Received: by outflank-mailman (input) for mailman id 1261151;
 Tue, 24 Mar 2026 16:42:03 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w54pO-00052O-T4
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 16:42:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w54pO-00F56U-8m
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 17:42:02 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69c2bed4-bab6-0a2a0a5309dd-0a2a4505d720-18
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 17:42:02 +0100
Received: from [209.85.128.51] (helo=mail-wm1-f51.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <jbeulich@suse.com>)
 id 69c2beda-5aeb-0a2a45050019-d1558033b9f5-3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 17:42:02 +0100
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-48374014a77so55129545e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 09:42:02 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4871102369fsm35795505e9.6.2026.03.24.09.42.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Mar 2026 09:42:01 -0700 (PDT)
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
        d=suse.com; s=google; t=1774370522; x=1774975322; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=TIOX8H5dGts7j4vtonCkFRYzN/dkOPpAxMuWZdkOdC0=;
        b=N63DhziulhGDm3EvJS42bOl2uqqhExvelR44/rn1XleTT2gnSkR4Ohl2vdQ+82gP3L
         F8MbwdBL6zTWeoXyABjS+P2EED6HI2jN8kbKQJaEyotLS2Nw/dFKLDqRXGYApl3HmyqX
         9h6Z//0wcpxA2byqGb+3/yDEr0RaF7QzjXjG1FTLwNxuBC2IOD9Q5LoML746fjqamnAY
         Ng6Cl+eGEGeXY2hR6rI7jHjO1ip+D1Nr5Ofy6g1DwvIhm58iJstMDE5n10RWcBRsq0QY
         cNX7GJX8hA6k6/pwf0DDcnLKORir7ISgX7fNFQha7JbyX7GIdgiejU1givMlmcQLjSLP
         UMgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774370522; x=1774975322;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TIOX8H5dGts7j4vtonCkFRYzN/dkOPpAxMuWZdkOdC0=;
        b=IvMoWWdfcA185YON2FeU1iRtQNj9FfwkEGB5e0IAoexcqOQOJz+rkSmYw68oGOjTIF
         e7LjcH4e70dwyeXQeahaEEfyEIrvKxj8ussCoIcCCo5Q/RJ7asqi7SdV8SoC9ADGLMOI
         6Krf82FbchIbif3kANmBDKtsohebSCTqwQakx3lrfi+vs9QkBKPT9DY64JtZQG41lcdd
         mcnB/9D3jxmiKk3ZtvbjEWa4soBpZXqlYNJ1grllWSvpDwOowF45s4s9+tGKRTBTrk5/
         Zp2ue1f6L9guxrucS/dSuSIeUSRiGRnaT/0MLLSmHyTChKezP9poe3r65mhq6f4iNt58
         sHwA==
X-Gm-Message-State: AOJu0YzRX8qiEiwKH9GOY5ZSjeyCmdqhWFEPe2LEg6JbAUuLpjDULPig
	ZbVxDhzqy6C1uBbdzL7vAPk3UmqRYiyzCpv67wnQIfeEkWaLj6vkZ0hOsQ845eFPWw==
X-Gm-Gg: ATEYQzygIvO/d8rCbcn9rWtCOnLoe1zz+ooIqHNhKOsd3Au0OfqvhRNUMpbFgHSsBnP
	x4Vev3Mxqaun7oPJsR8Q33dWZYs5KFPcf/jRYVNrWantwd0PfnVXq/QDuoDQhW1JTi/igPHhJ6C
	/DlVhuhKHKeY+e1IvQds5hkJBd0UktuxC6N1kTLk1g70bkh9egy/EV2UIFjO7xpUn1VALrvPZIw
	pQk0mHrVSXj57PXUWiWhLYEmUf0PK3lGZuPwIMtw9takTBxYRl/rRQo084R5V5IGkjAL6PU2mRk
	zfOgNkZJ0NBSQm58L2f0xtw7QEuPvcqge3YDFAw542G6CNQ3h4rH9Jmj3q5EDKxrIZWFjmRL2jF
	4I3PVRM4vF7by7pc5ZHOHg6mGr/rrmr/Mk8qePG+vwJIuuVsdGpYvn7q0yi4KlH2angvo06Lxyv
	uZoB1EV/remeQCQ9mzaEmv3VC730gRvSa2IxGrSJzvvuF8l7kX/oOFbXVvV+WKRI2Mh6MaCEGLQ
	cIrwI+x5DzESQg=
X-Received: by 2002:a05:600c:3f07:b0:480:1d0b:2d32 with SMTP id 5b1f17b1804b1-48715fea9bbmr6636985e9.12.1774370521626;
        Tue, 24 Mar 2026 09:42:01 -0700 (PDT)
Message-ID: <2c28fdb7-57aa-4683-9474-a1204e9070b1@suse.com>
Date: Tue, 24 Mar 2026 17:42:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] unlzma: avoid UB shift
To: Mykola Kvach <xakep.amatop@gmail.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Kamil Frankowicz <kamil.frankowicz@cert.pl>
References: <cb5ad24b-03a5-4c1b-9d98-8df534854b2f@suse.com>
 <CAGeoDV-zq+=HWg1v53KXyPR+kxBPpE2jUruc=JFVSjXTKv662w@mail.gmail.com>
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
In-Reply-To: <CAGeoDV-zq+=HWg1v53KXyPR+kxBPpE2jUruc=JFVSjXTKv662w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1774370522-21293488-BEE82D45/0/0
X-purgate-type: clean
X-purgate-size: 1834
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xakep.amatop@gmail.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:kamil.frankowicz@cert.pl,m:xakepamatop@gmail.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[cert.pl:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:dkim,suse.com:email,suse.com:mid];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.994];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 1A7DB3193C8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 24.03.2026 17:24, Mykola Kvach wrote:
> On Tue, Mar 24, 2026 at 5:27 PM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> Shifting signed quantities has restrictions. Since the wrapping macro of
>> read_int() type-casts the result anyway, switch function return type as
>> well as the local variable to the corresponding unsigned type.
>>
>> Reported-by: Kamil Frankowicz <kamil.frankowicz@cert.pl>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> We've inherited that code from Linux, and the same code still exists
>> there. As I'm entirely uncertain whether they would even care, I'd prefer
>> to not take the route of posting a patch against Linux first.

As following from this, imo we want to diverge from the original as little
as possible. IOW ...

>> --- a/xen/common/unlzma.c
>> +++ b/xen/common/unlzma.c
>> @@ -30,10 +30,10 @@
>>
>>  #include "decompress.h"
>>
>> -static long long __init read_int(unsigned char *ptr, int size)
>> +static unsigned long long __init read_int(unsigned char *ptr, int size)
> 
> nit: Since we're touching read_int() anyway, would it make sense to also
> tighten the helper's interface, i.e. make ptr const and use size_t for
> size?
> 
> That would better match the actual usage: the buffer is only read from,
> and size is really a byte count, usually coming from sizeof().
> 
>>  {
>>         int i;
>> -       long long ret = 0;
>> +       unsigned long long ret = 0;
>>
>>         for (i = 0; i < size; i++)
>>                 ret = (ret << 8) | ptr[size-i-1];
> 
> Separately, the loop could also be written without the temporary i, using
> a simpler reverse traversal, for example:
> 
> while ( size )
>     ret = (ret << 8) | ptr[--size];

... I'd suggest that you submit patches against Linux, for us to then
re-sync.

Jan

