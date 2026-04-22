Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YDyqJ5do6GlZKAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2026 08:20:07 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 102D644258E
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2026 08:20:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1289879.1569565 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFQw3-0008Sz-Ec; Wed, 22 Apr 2026 06:19:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1289879.1569565; Wed, 22 Apr 2026 06:19:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFQw3-0008R0-B3; Wed, 22 Apr 2026 06:19:43 +0000
Received: by outflank-mailman (input) for mailman id 1289879;
 Wed, 22 Apr 2026 06:19:42 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wFQw2-0008QS-Ki
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 06:19:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFQw1-00633e-P8
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 08:19:41 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e86879-bab6-0a2a0a5309dd-0a2a450ba83a-22
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 08:19:41 +0200
Received: from [209.85.221.46] (helo=mail-wr1-f46.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e8687d-212f-0a2a450b0019-d155dd2ee577-3
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 08:19:41 +0200
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-43d43e09de5so2770046f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 23:19:41 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488fc0f82bbsm709405915e9.3.2026.04.21.23.19.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Apr 2026 23:19:40 -0700 (PDT)
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
        d=suse.com; s=google; t=1776838781; x=1777443581; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=f1j3VGZmGl4alO4dFyZPaBT0PwjvTsbbcxOWNsc+MJs=;
        b=clzfIeaQEItwczSxBiLljhXL8Vr5O2O5nACEbgGtkJ2pH3pLN4F+WxuW3Kmrw6kLbs
         7MK6enqnsGSpdArGsS1qMWbxipyURyFPeaocqz7dcZrxakOjDe3E+Q5rD56pcxSV/i9t
         j1NWHhDBWQ9pgcQgMrbOiOneXb3IwTx+hB4Bupan+/bE8HsJOfLlZAgwcCh5IkNEyCzY
         rO/rxoJtXIZTxic6NpF0ese2hrr4wgl2fi59cmVrC6V/yYQa7k3hI+GCx+8UBkW1t4rh
         SVYObVXhWyFVMdGRi1fAWRLexZdCDxwYq4+9SARDLp4ToPM/pMiNF5bIfT7BX8nQGIKT
         6AJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776838781; x=1777443581;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f1j3VGZmGl4alO4dFyZPaBT0PwjvTsbbcxOWNsc+MJs=;
        b=iuqEvG8/iMn3vx8R8jZ9AL1wJ6roNHWDvYLSjddXqJWPdCQZObmR5xgaGbRb35XMWq
         io09GAcJCgWenY1LMEh513mcjwNtLa+0+7g7GUGGKaMi/6rcP1l8uYm4UFrMsPa1yxDu
         TrcFzYigg+B/UZLo9dkM8PIJhoiGkFBj5QEm6D1FanNcQbFXuKPc3bAj3/3wOgb/bc3/
         ca0RzR17xqUwH8+7KSBvJEN/XFzNclKfVWIm+Ift9AsnGz0OG2BjQtR8riXHhTAKaGUb
         R+oNEL8Q7EliCj1NDhhC79lmKo2Hn4F6DC6Ajfcwwv3GC7L3llftv1o9ymnE+a3zzsw5
         CLvw==
X-Forwarded-Encrypted: i=1; AFNElJ87ZHeKU78Af+yWcC8VKfJ1ryve8qLniQN2oQHMoqVxOhHjXvSmXrPDx/GF5VlqkbV9fuphnxwaURE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzMOishmZ0gDRfCB47qysV2/OapAahhLO8Cf2SwQytxBGvOyjgP
	pX1gr1G2NpmdF6n9/8RvWe3I21tHrg/STBnb4krCUUssW4xgSfP/j8zQhCQ9A1d0Pw==
X-Gm-Gg: AeBDietzTWmLj45oWlG+5mJ/gISwnPKZRNkefhuoW9ry8oDosJ/H0hC4ssZbUN1m8nq
	uVwpUeq+C9Zvw0Hs8vtBswv2yNCq52l/ytck6b654rlaQeEtcelBiVwySqaCE4LgIQiV58vizQX
	eIExfCUjNsknxGR4qTDRZAOTcU9y1kbDiJyrX1tLwnsKQSh5cO09YU4Reu7DwV+SipeXP1qoAvv
	uAzxjJ7B2DoCwph26QDUGhbmGHCqIqThD3d0miGvEOGVLvOlQK4IzpXhT9K/ZfElwQOCdIYNndc
	gpurkiMDrrePCfLjl5QB8wjnCCBy2BemXH9+/ApYyBaGJqDZ2c0awdNyKVoc1UWtkhNc3FhiYs0
	fTdzyRNE+4hG329ZIJaH+jib3w6VfGqEz49iDYcvehjtgPwID+DMg5yGEFkB+zW6DKserIGA18J
	sAMry7SVqChvCJVLk/QdglGKvZVKjpMlgfuAvKxRx2PgufxBQAW5OwUnylAzhXzDJ5Q1fn65Lks
	dvDfOP2V6EWNcBq0GY8/CNZo+bbWyeVtQdz
X-Received: by 2002:a05:600c:5295:b0:485:364e:9328 with SMTP id 5b1f17b1804b1-488fb77d12dmr296357505e9.16.1776838781007;
        Tue, 21 Apr 2026 23:19:41 -0700 (PDT)
Message-ID: <0b8e4040-398a-4be5-9fb7-6045bca345a2@suse.com>
Date: Wed, 22 Apr 2026 08:19:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/9] tools/libs/store: add support to use watches with
 a depth parameter
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>, Julien Grall
 <julien@xen.org>, Jason Andryuk <jason.andryuk@amd.com>,
 xen-devel@lists.xenproject.org
References: <20260421074211.308473-1-jgross@suse.com>
 <20260421074211.308473-4-jgross@suse.com>
 <df1be497-ff9b-4f08-ad83-54df9799dd1b@amd.com>
 <be385a95-79ed-486d-8676-9a83dc2c7799@suse.com>
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
In-Reply-To: <be385a95-79ed-486d-8676-9a83dc2c7799@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1776838781-06D77F3B-10CD3B08/0/0
X-purgate-type: clean
X-purgate-size: 1881
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email,suse.com:dkim,suse.com:mid];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jgross@suse.com,m:anthony.perard@vates.tech,m:julien@xen.org,m:jason.andryuk@amd.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 102D644258E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 21.04.2026 18:08, Jürgen Groß wrote:
> On 21.04.26 15:54, Jason Andryuk wrote:
>> On 2026-04-21 03:42, Juergen Gross wrote:
>>> Add a new xs_watch_depth() function to libxenstore allowing to limit
>>> the scope of a Xenstore watch. It can be used only in case Xenstore is
>>> supporting the XENSTORE_SERVER_FEATURE_WATCHDEPTH feature.
>>>
>>> For convenience add a xs_watch_try_depth() wrapper, which will call
>>> xs_watch_depth() if supported and xs_watch() otherwise.
>>>
>>> Cache the supported features of Xenstore in order not having to get
>>> them from Xenstore for each call of one of the new functions.
>>>
>>> Signed-off-by: Juergen Gross <jgross@suse.com>
>>
>>
>>> diff --git a/tools/libs/store/xs.c b/tools/libs/store/xs.c
>>> index 06462445e0..cb3508a86a 100644
>>> --- a/tools/libs/store/xs.c
>>> +++ b/tools/libs/store/xs.c
>>
>>> @@ -1001,8 +993,8 @@ bool xs_watch(struct xs_handle *h, const char *path, 
>>> const char *token)
>>>   # define PTHREAD_STACK_MIN 0
>>>   #endif
>>> -#define READ_THREAD_STACKSIZE                     \
>>> -    ((DEFAULT_THREAD_STACKSIZE < PTHREAD_STACK_MIN) ?     \
>>> +#define READ_THREAD_STACKSIZE                    \
>>> +    ((DEFAULT_THREAD_STACKSIZE < PTHREAD_STACK_MIN) ?    \
>>
>> This is an unrelated whitespace change, and not mentioned in the commit 
>> message.  It should probably be dropped since the surrounding lines are no 
>> longer touched.  Alternatively kept and mentioned.  With either of those:
>>
>> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
> 
> Thanks.
> 
> Whoever is committing this: I'd rather expand the commit message with:
> 
> While touching the file fix a whitespace issue.
> 
> Shall I resubmit this patch, or can this be amended while committing?

Of course it can be.

Jan

