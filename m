Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mA3eOvAtymkA6AUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 30 Mar 2026 10:01:52 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C8BA356D10
	for <lists+xen-devel@lfdr.de>; Mon, 30 Mar 2026 10:01:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1267309.1556833 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w77Yy-00037f-5u; Mon, 30 Mar 2026 08:01:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1267309.1556833; Mon, 30 Mar 2026 08:01:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w77Yy-00035F-36; Mon, 30 Mar 2026 08:01:32 +0000
Received: by outflank-mailman (input) for mailman id 1267309;
 Mon, 30 Mar 2026 08:01:30 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w77Yw-00034n-2Z
 for xen-devel@lists.xenproject.org; Mon, 30 Mar 2026 08:01:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w77Yv-00EBZI-DD
 for xen-devel@lists.xenproject.org; Mon, 30 Mar 2026 10:01:29 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69ca2dd6-e002-0a2a0a5209dd-0a2a450cb86e-6
 for <xen-devel@lists.xenproject.org>; Mon, 30 Mar 2026 10:01:29 +0200
Received: from [209.85.128.47] (helo=mail-wm1-f47.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <jbeulich@suse.com>)
 id 69ca2dd9-f93d-0a2a450c0019-d155802fa4be-3
 for <xen-devel@lists.xenproject.org>; Mon, 30 Mar 2026 10:01:29 +0200
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-48538c5956bso40798715e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 30 Mar 2026 01:01:29 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4873061ef41sm167216895e9.3.2026.03.30.01.01.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Mar 2026 01:01:28 -0700 (PDT)
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
        d=suse.com; s=google; t=1774857689; x=1775462489; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=oZeMVZq3dQAUfClGA/R2uQq6s60jStnII12uavj4k9I=;
        b=ajCsNEuf6b9fUqCq+7iqY7OkXaTwuyYazjn8S59zcN1RlLqaU5HcPV0+7XOIRWm/o9
         vmkQxY93O9jtCaGXFm5lGnIpbydq8JcMhXDSe6f7nm3jnyoqS2CZ8odfDtPtYqbu/olu
         uwK9OCjEKC+FDT/NDezTfHSDRIMn6eLDjJezzGi6RZQWoQ1vVR+wNiTvih5ZvhliboYh
         xDd9PLcmYAR9SIlcFzM8Mx0WR4wStFdXly1ArZE9u8IZjW7/6CKGDtwHgUa1HAmA1r9P
         cF8JRHuxk1zwULQcOFn+MKXvlzOPbcdMtTQWbjxWiJLz0MKtfogrYM4FzZfCPGEg+hfW
         PcWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774857689; x=1775462489;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oZeMVZq3dQAUfClGA/R2uQq6s60jStnII12uavj4k9I=;
        b=NzzYdY2B9hi/fWImwe8pPuroTImQvYe3JPOfIImvbZHlRirEmqCOKQpWAjj/ndYjDe
         fZmcg00d/pu3KS0mQE3GWeta2mY0m6Za7JOY77ZxiDreyQB5qxe579JV0jORLLklPyOk
         nJ0mUsWaimUoM4Fhk5iUexPIq6HsaJOCRca5yupFBJ6YBlynKnAaMkaskKPhSvNZzoq2
         SCoqEHHL5I6Uz0OBE32LFx4aDxn4ZmvpZG3iEULvA0Z5HqwDOc7uTaThZuDP3RnIaQ/v
         tDQtC7omPpDt0ZDAMGud5HOMGGhd18tgxwWZmbkQ7oTBfPbl/EKjfQ6isK7bX6/ggk2b
         6KdA==
X-Forwarded-Encrypted: i=1; AJvYcCWLPHrMxGDSV7oAPq6JtWrFns6TIdyW7gt43UnLmd1+iWWk0cVe5Lw1Oe6n7iGHSSwRQIutCsCxXFQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxPYM1lQMCQ9Jk2ceuXwIxuUkUx9iCPZhW+WDLTzLLpABwLC9cg
	YvW5fzPG+pKNfUCaUDYEnSwJq0M8jNBb3oiZw+UCGJO1uJygwRKElt9/90nvM1SA9A==
X-Gm-Gg: ATEYQzww12qk+1rzayQAQAcU5i41C62w4YVzSHdfBG40AtcgblczO5wD3e23fRV9DB/
	8p+yF5HCaCYXncGLuisv4QJ32rFckgmF1+KqcxH1KmCOGpi+/EXE8L6Hs6ra1zmi335XsnAJbDN
	dXKfgwqoXNbR1hc4rTCLnz6w+HVvBY83JyfZU3Nup/PfN3Skc/t4hCrp7w5qATAHLEqO8vjS7fQ
	iyc4avPA/3LDefev9CrqW9MrgGBQe89yEEiNhzzs8Y+290MPzGeU8e2eOS/hL3QxJ9YHcOhkLIr
	qRaV5vpqluv1co8dJyb5dPJ7NXPP5Z8oVO+Dpb5FUfK8tETy6XiY0FWXn22tCCoYwl2F0J23eWn
	AYzoEPoDVBNNEJZWnT4D8fQLSQVtvQCZBpvU0PwQXkwp0fKfBigpw28qncg/XMWFTxS+CR2l4n5
	XiMzlE3RnYFjoMcKplVk8TqhDt3AE1q1igG0Rmj5F0pfpnM26Ppk4TW6HuNL/fatSY/dGYc8ynE
	iF/SncOiFJQPVA=
X-Received: by 2002:a05:600c:4e0b:b0:485:fbd2:f72 with SMTP id 5b1f17b1804b1-487290a9254mr168328545e9.1.1774857688478;
        Mon, 30 Mar 2026 01:01:28 -0700 (PDT)
Message-ID: <45bd794d-62bb-4680-8f7f-4dc98ccb4c4e@suse.com>
Date: Mon, 30 Mar 2026 10:01:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] CHANGELOG: add xenstore quota support
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Community Manager <community.manager@xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20260327152103.438997-1-jgross@suse.com>
 <49a3c6fe-db8a-4814-8638-6242dfee495d@citrix.com>
 <f172ffac-777d-4280-9538-a4d0e20ffc06@suse.com>
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
In-Reply-To: <f172ffac-777d-4280-9538-a4d0e20ffc06@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1774857689-F7EA3734-459CFF9A/0/0
X-purgate-type: clean
X-purgate-size: 977
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jgross@suse.com,m:oleksii.kurochko@gmail.com,m:community.manager@xenproject.org,m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,xenproject.org,citrix.com,lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[keepachangelog.com:url,suse.com:dkim,suse.com:email,suse.com:mid,citrix.com:email,changelog.md:url];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	NEURAL_HAM(-0.00)[-0.841];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 5C8BA356D10
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 30.03.2026 09:59, Jürgen Groß wrote:
> On 27.03.26 18:39, Andrew Cooper wrote:
>> On 27/03/2026 3:21 pm, Juergen Gross wrote:
>>> Signed-off-by: Juergen Gross <jgross@suse.com>
>>
>> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>
>>> ---
>>>   CHANGELOG.md | 2 ++
>>>   1 file changed, 2 insertions(+)
>>>
>>> diff --git a/CHANGELOG.md b/CHANGELOG.md
>>> index c191e504ab..566fe510c5 100644
>>> --- a/CHANGELOG.md
>>> +++ b/CHANGELOG.md
>>> @@ -9,6 +9,8 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>>>   ### Changed
>>>   
>>>   ### Added
>>> + - Support of per-domain Xenstore quota in C xenstored (includes
>>> +   xenstore-stubdom), libxl and xl.
>>
>> A minor point, but "Support for", mainly for consistency with the rest
>> of the section.
> 
> Fine with me.
> 
> Can this be changed while committing, or do you want me to send V2?

I'm fine making the adjustment while committing.

Jan

