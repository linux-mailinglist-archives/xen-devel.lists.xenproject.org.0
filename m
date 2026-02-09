Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oISPGbUFimluFQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 17:05:09 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4F231124B2
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 17:05:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1225681.1532244 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpTkv-0002nn-JK; Mon, 09 Feb 2026 16:04:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1225681.1532244; Mon, 09 Feb 2026 16:04:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpTkv-0002lg-G5; Mon, 09 Feb 2026 16:04:57 +0000
Received: by outflank-mailman (input) for mailman id 1225681;
 Mon, 09 Feb 2026 16:04:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bBDp=AN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vpTkt-0002lZ-M2
 for xen-devel@lists.xenproject.org; Mon, 09 Feb 2026 16:04:55 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 12ca6861-05d1-11f1-b162-2bf370ae4941;
 Mon, 09 Feb 2026 17:04:54 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-43284ed32a0so3137599f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 09 Feb 2026 08:04:54 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4362974527fsm28866284f8f.31.2026.02.09.08.04.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Feb 2026 08:04:53 -0800 (PST)
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
X-Inumbo-ID: 12ca6861-05d1-11f1-b162-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770653094; x=1771257894; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lNx3t7qTat4e7Ba7p52LVIoxXbsVTE0WxDMZbNg9lYE=;
        b=Ht4LmX8lgslsd72ium+cDVC0ZvmvblHzNVXs/jkDQCvDjTwKP+oHLKfdSiLKw0k16G
         Sh/ZDVvLuFtrVD28OfNzBa+8jZqfKlwXBaiKLJQYKPChHrvmtXh6HyutjSo3+FUGacK9
         ByTrvOgA/O9PF3DfKHiUMXEyR20n17KtQCQJjNXuzKZrB6kmhmhoWwvlEpfaoufVyp07
         uf6KRJzTtXakYcAynD3oYh7XqTUNlpxYpnBgJWyNLGzJUBkTEpASX9Yd6u5IDSlKq9Eh
         AlFy+KAhx1P4giExO5fl4c4b6ZCgdnMoR4ZXQGqydDNktj1VHsscbMwOAwY/CdPXZNh6
         Fmow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770653094; x=1771257894;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lNx3t7qTat4e7Ba7p52LVIoxXbsVTE0WxDMZbNg9lYE=;
        b=fLFIOKs9gB1N50PbUCR5lNIyA4vaBAks8hwQWXmxnUiaLkH42nSG01uxkYg6DUBetq
         utI7CiEXA7WNQLYmS/wza6XatorD0yV47P8s26ZflXU18zTVELeYAAkmnsOMc23F60T4
         ua1VlDd/ek+VS++YRXyTY4zuou6z6fZqFTaQ+CZhW9wqQl5YrnSAxaU3zJVKjxwCQbxB
         7ne9V6MTWs6KNFDu0ABtNBFT7xC3xwwoefJwyU12KLT1WxJXI99tfqYLahpVcVJ/Wxf/
         Ub/83tO9rteNFMvGaDCxko5gryt2xSjCRksSvj0Ge2tltHOJAh6q+NqOtOo7HvfdcQhz
         2Wtg==
X-Gm-Message-State: AOJu0Yx0V/LZYb8OLg5xdCNLcBLx6O3lz4Wi+ZmMhkhrQk4a+b+KTsGZ
	Oz7bulgyig3RfWaw4aAtUxSjLq2Jx+NJVktE4nthP/Nmg3T51qSFltX2YqjP3MB5tQ==
X-Gm-Gg: AZuq6aIM7LwzL/4AqgY+3FbDBPvlsm78rbdVcRuAb+JsdQy590uvQCXAOeTfopDMNmV
	xr5EJLLzGMS4yEjs11SqsJFf5NIn3mMuhUsIn4o/Sk3wdIhxu3KFWlNZ2fDLK85PQCS9Mq8twLy
	IEkZbV0bkY7hdH5iWkNHenCxCOpZzl8bwEiMp8P//q19btCL8/YnHtQgRWN+pvnDpGggxjc76vV
	tk3VdnTKUBN2OpGxks1RFLH1bkm0negp1hSEK5mJImtA1gWHNSmirXDRDYmMNuOeIjcO667IaJM
	XV+447fsRxbiSQmR1LN0Y5GYRG+Znv2b9Yefvf70w8DotRU1CzEqz4b+3Vf9LawZ5UyeBf/MnuN
	LFOn7i1zW3WjeSyZ6pWVlZWg6ulbQCWL5JUQFoiKXAurLPuIom7Yot3GYfPQZ3KwRVJ8XvIrFCO
	FMS1Q6IvctHAoaWKOrTD6SkXm9wsJfNChaBzk9t/mQiZLgL/gv9f4IGsZx0dYrhSaP18r09tKuL
	Zw=
X-Received: by 2002:a05:6000:2311:b0:435:907f:e439 with SMTP id ffacd0b85a97d-436293422dfmr17885674f8f.18.1770653094024;
        Mon, 09 Feb 2026 08:04:54 -0800 (PST)
Message-ID: <f3474905-427a-4d0c-b087-38082bf7e2e6@suse.com>
Date: Mon, 9 Feb 2026 17:04:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/shadow: Delete the none.c dummy file
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 Alejandro Vallejo <alejandro.garciavallejo@amd.com>
References: <20260209104104.7840-1-alejandro.garciavallejo@amd.com>
 <aYnyY2MArv4vTXsY@Mac.lan> <DGAJI3UYR98J.FU94VABOFZ5N@amd.com>
 <aYoDiDiJ4rRLxhmw@Mac.lan>
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
In-Reply-To: <aYoDiDiJ4rRLxhmw@Mac.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:tim@xen.org,m:alejandro.garciavallejo@amd.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:mid,suse.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: C4F231124B2
X-Rspamd-Action: no action

On 09.02.2026 16:55, Roger Pau Monné wrote:
> On Mon, Feb 09, 2026 at 04:35:04PM +0100, Alejandro Vallejo wrote:
>> On Mon Feb 9, 2026 at 3:42 PM CET, Roger Pau Monné wrote:
>>> On Mon, Feb 09, 2026 at 11:41:02AM +0100, Alejandro Vallejo wrote:
>>>> It only has 2 callers, both of which can be conditionally removed.
>>>>
>>>> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
>>>> ---
>>>> I'd be ok conditionalising the else branch on...
>>>>
>>>>     IS_ENABLED(CONFIG_SHADOW_PAGING )|| IS_ENABLED(CONFIG_LOG_DIRTY)
>>>>
>>>> logdirty patch: https://lore.kernel.org/xen-devel/20260209103118.5885-1-alejandro.garciavallejo@amd.com
>>>>
>>>> ... to avoid the danger of stale pointers, with required changes elsewhere so
>>>> none.c is only compiled out in that case.
>>>>
>>>> I'm not sure how much it matters seeing how they are all unreachable.
>>>> ---
>>>>  xen/arch/x86/mm/Makefile        |  2 +-
>>>>  xen/arch/x86/mm/paging.c        |  4 +-
>>>>  xen/arch/x86/mm/shadow/Makefile |  4 --
>>>>  xen/arch/x86/mm/shadow/none.c   | 77 ---------------------------------
>>>>  4 files changed, 3 insertions(+), 84 deletions(-)
>>>>  delete mode 100644 xen/arch/x86/mm/shadow/none.c
>>>>
>>>> diff --git a/xen/arch/x86/mm/Makefile b/xen/arch/x86/mm/Makefile
>>>> index 960f6e8409..066c4caff3 100644
>>>> --- a/xen/arch/x86/mm/Makefile
>>>> +++ b/xen/arch/x86/mm/Makefile
>>>> @@ -1,4 +1,4 @@
>>>> -obj-y += shadow/
>>>> +obj-$(CONFIG_SHADOW_PAGING) += shadow/
>>>>  obj-$(CONFIG_HVM) += hap/
>>>>  
>>>>  obj-$(CONFIG_ALTP2M) += altp2m.o
>>>> diff --git a/xen/arch/x86/mm/paging.c b/xen/arch/x86/mm/paging.c
>>>> index 2396f81ad5..5f70254cec 100644
>>>> --- a/xen/arch/x86/mm/paging.c
>>>> +++ b/xen/arch/x86/mm/paging.c
>>>> @@ -634,7 +634,7 @@ int paging_domain_init(struct domain *d)
>>>>       */
>>>>      if ( hap_enabled(d) )
>>>>          hap_domain_init(d);
>>>> -    else
>>>> +    else if ( IS_ENABLED(CONFIG_SHADOW_PAGING) )
>>>>          rc = shadow_domain_init(d);
>>>
>>> If you want to go this route you will need to set rc = -EOPNOTSUPP;
>>> prior to the `if ... else if` on the HVM case.
>>
>> Maybe this instead
>>
>>     else
>>         rc = IS_ENABLED(PV) ? shadow_domain_init(d) : -EOPNOTSUPP;
> 
> But even for the PV case we cannot call shadow_domain_init() if shadow
> is compiled out?  I think you want:
> 
>     if ( hap_enabled(d) )
>         hap_domain_init(d);
>     else if ( IS_ENABLED(CONFIG_SHADOW_PAGING) )
>         rc = shadow_domain_init(d);
>     else
>         rc = is_hvm_domain(d) ? -EOPNOTSUPP : 0;

Wouldn't this still leave NULL pointers in places where they can be rather
dangerous with PV guests?

Jan

