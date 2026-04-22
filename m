Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ID2IEM116GmVKgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2026 09:16:29 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A69BA442DAB
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2026 09:16:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1289923.1569601 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFRoX-0004zz-2u; Wed, 22 Apr 2026 07:16:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1289923.1569601; Wed, 22 Apr 2026 07:16:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFRoX-0004wz-0H; Wed, 22 Apr 2026 07:16:01 +0000
Received: by outflank-mailman (input) for mailman id 1289923;
 Wed, 22 Apr 2026 07:16:00 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wFRoW-0004wt-4e
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 07:16:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFRoV-00Ecjq-HS
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 09:15:59 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e875af-e002-0a2a0a5209dd-0a2a4507b1c8-2
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 09:15:59 +0200
Received: from [209.85.221.52] (helo=mail-wr1-f52.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e875af-229c-0a2a45070019-d155dd34a976-3
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 09:15:59 +0200
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-43d75312379so3776815f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 00:15:59 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43fe4e3a79esm45683595f8f.17.2026.04.22.00.15.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Apr 2026 00:15:58 -0700 (PDT)
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
        d=suse.com; s=google; t=1776842159; x=1777446959; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=N+9FqO6TkJwggBfMP1KZWhMRhDsZxtXZKwRr3GgLsbc=;
        b=YnbD121XE66IJvB5U/3oqdQtc1ErnRml78NwEVcMz3oL9wvsdCNpt8q7GxWyKVd+AG
         QdZGifNlnmlydyvoWCLvO0ovQ8Olwb3gO0JZ8W2wJKkuYaL30l9P2Sv6xkjNpsMa9mkn
         1Tx5P5gRbTSGChHfnpy6HqylR11dHrfFojCuPM/97IWpxuRWCp0s2Qjje9ji2m5Wlrmi
         lob7d3GI0nECt/zyEqUkmDkWXHAIYo0WMrhDXISBhyTXLZMzvLFKQXiJn9qUan69mF2l
         kLst1eicS/w2cKhBvZECF6RMWFRwx7a+19TX1vM1CWqMgBylVMBzKn6BpYAREJkhj3dL
         ALng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776842159; x=1777446959;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N+9FqO6TkJwggBfMP1KZWhMRhDsZxtXZKwRr3GgLsbc=;
        b=G0rRrJUcgc5Y/mEV6EkHG5MYC969mo6ZOaTKPMcc7OJVBcTE0vqR+WRITLt4QmJReg
         fWcvucITbtI/a7PNgSmnVGrwi2cJzf1vrG+nnOYiW9n50HpX7NIjD0qZS4V68HSDPxQf
         cHWCTMr2apyxlt7yMsH2/+6OGe3eIULmHCUn5bphw+3fZ/1VVdiCJ42Z7e6kB197/sC4
         JqNgmOFl3chxtlWudOJS7BlX6YnEuy/zQcGVcLndfdpej5Btyw/D8rfRUKlF7J9aNdzL
         HsYCNiBRrYMYTWrebWl9RNble7XCILNZHSwwbydEYtombrtHoGAUwssmZj52mw7aq7Ec
         wYig==
X-Forwarded-Encrypted: i=1; AFNElJ/9Y4sJPlNokTuSwot4wDB0PQBptIYNYOJxnlnd6eNMCeXXx6qAvCHTz8EZfxc39H1L0JsKh1D4ig0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyaBcOD4/iAZtxgNVHCi9C2Zy1tRCmrFErOSmY0k0qYiTSX3uFq
	iTHMXvqfBW5dxLOLi9mkX+Kq+KRjry/kMAPh/q2IVuyP62Of9DetA364IHolPt2WYXFW2LUg69E
	O6lMy8Q==
X-Gm-Gg: AeBDies8A4yD/JaIymz+WZlHRegV4IgTiBK0FVJnkIxj/OuJ8HyaN2zhGxVaQYAwD9c
	Mj6FFO22fTxnNDAdOtXrjeSqZehLC6IzJ7WcGZ7o407f1mWa1ZTJtfngT+saq0cNFc9SHsVakY6
	V68osLX7Yafm5kbyyIhL5xMj88WZ70lXuZ5kAwbZak1qe9lv8BZIoCyNtBJk2JY7IASlDdcxNz0
	iRz80CvLt/MSW3+3sVmd2U6fY+6CcNv3Gs+KW9H4/HYPA3v5A6nmSe6d269ufiya5subEZhzi31
	i6r/i/FAhAcgk6tKJ9+f8TpgZY7cjIFo3/zEjM8Qmwaswvnyg54HZqbw7sTsIbR9lFAJ3Q5ERvB
	rJ2sNFh55dblNsDIMQV+oCuZdWKHIq5lqoRjhyYeEiwRkfYBFPx1SCAplqcNQ0LtaSi/biamglV
	nvyU6pFHipu/+O4OswLDjzi4x/JgpMDu7r2KHU7mszL0aKJh25xrbNjy0e/xT2GNi1h8kll0B8T
	CkDiq2wBvv6vBkXjKxqln/rSUffb09Jy34V
X-Received: by 2002:a05:6000:290c:b0:43d:772d:2b61 with SMTP id ffacd0b85a97d-43fe4073831mr31046438f8f.15.1776842158618;
        Wed, 22 Apr 2026 00:15:58 -0700 (PDT)
Message-ID: <bb1d52a4-c344-4653-b10f-0781c2900cb0@suse.com>
Date: Wed, 22 Apr 2026 09:15:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tools/xenpm: fix FreeBSD build
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>, xen-devel@lists.xenproject.org
References: <20260421153224.36368-1-roger.pau@citrix.com>
 <2204fbae-be5b-4f56-ad2a-cd5692db81cb@suse.com>
 <aeedB31aEBJb2Pa8@macbook.local>
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
In-Reply-To: <aeedB31aEBJb2Pa8@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1776842159-23D7FC48-71BAA9DA/0/0
X-purgate-type: clean
X-purgate-size: 1536
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:dkim,suse.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: A69BA442DAB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 21.04.2026 17:51, Roger Pau Monné wrote:
> On Tue, Apr 21, 2026 at 05:35:57PM +0200, Jan Beulich wrote:
>> On 21.04.2026 17:32, Roger Pau Monne wrote:
>>> --- a/tools/misc/xenpm.c
>>> +++ b/tools/misc/xenpm.c
>>> @@ -1377,7 +1377,7 @@ static int fetch_dts_temp(xc_interface *xch, uint32_t cpu, bool package, int *te
>>>      {
>>>      case 0:
>>>          /* This CPU isn't online or can't query this MSR */
>>> -        errno = ENODATA;
>>> +        errno = ENODEV;
>>>          return -1;
>>
>> "No such device", however, isn't quite what we want to convey here. If no
>> better error code can be found that's available on FreeBSD and Linux, I'm
>> inclined to suggest that we stick to ENODATA where available.
> 
> Seems like a lot of complexity, for very limited usefulness.

What's complex about

#ifndef ENODATA
# define ENODATA ENODEV
#endif

(perhaps with a brief comment)?

>  The only
> usage of errno is to be printed in the error message, and for the
> purposes of this function ENODEV is already unique in the function, as
> ENODATA was.

Right, but "No data available" is more precise than "No such device".

> FWIW, I think ENODEV is not that far fetched: the CPU being offline
> or the MSR not being present seems like what you would convey by using
> ENODEV.

Yes, there is a connection. Hence I'm not outright opposed, yet I think
we can do better.

Formally Anthony is the maintainer of the file, so in a case like this
one maybe he ought to have the final say?

Jan

