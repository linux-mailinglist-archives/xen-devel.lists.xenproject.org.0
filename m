Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2N3LGS/6gmm2fwMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 04 Feb 2026 08:50:07 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EAE19E2D4E
	for <lists+xen-devel@lfdr.de>; Wed, 04 Feb 2026 08:50:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1220118.1528839 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnXeA-0005iH-Ew; Wed, 04 Feb 2026 07:49:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1220118.1528839; Wed, 04 Feb 2026 07:49:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnXeA-0005fD-Bj; Wed, 04 Feb 2026 07:49:58 +0000
Received: by outflank-mailman (input) for mailman id 1220118;
 Wed, 04 Feb 2026 07:49:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S5Vl=AI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vnXe9-0005FX-29
 for xen-devel@lists.xenproject.org; Wed, 04 Feb 2026 07:49:57 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 18fa069c-019e-11f1-b161-2bf370ae4941;
 Wed, 04 Feb 2026 08:49:56 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4806f3fc50bso64675315e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 03 Feb 2026 23:49:56 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483108d79d5sm27492335e9.3.2026.02.03.23.49.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Feb 2026 23:49:55 -0800 (PST)
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
X-Inumbo-ID: 18fa069c-019e-11f1-b161-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770191396; x=1770796196; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+AWtJacmOecgXwlWsBjHoz5h+pUXqwGu/zsgTRJwiVo=;
        b=eibsXriPsdf6Of8WjZUV3lnUn1bQ4qPKfiP2Vypw5jgw/HHofjDJ4kZu1BjeoxBwdL
         ty/55Pz7BkgQvi1zt5eF/O66ZPr6iZg9ssjlWO/RdDfR7LlV6r8azsVe614i+GykFO4q
         RnR851uGd2DLk8DZ6vrTjrtzdhrFdQCawkxIaXAPBdLNYQi1oWQl8exRVx7YeWvXHhrk
         VolwAJk8oDpSYs0wB+nyU23rxHIrdBjsoVGlPyrokwFniFB65zw7ayHujUz4YPfPPD+5
         zx2imxhT+z4uo3gpC/LRLYzNF9omYmyQK4V34u5xnISd1LouI2Cm87xeMs1A6QJkEm0G
         N1VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770191396; x=1770796196;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+AWtJacmOecgXwlWsBjHoz5h+pUXqwGu/zsgTRJwiVo=;
        b=osVySfCGBY87ZVm6vto4oa29gX+h9/7xX0ZNQiG/lJqILPtWAsSgKwWHAZQuoFSiM6
         TAp0QrT9BFhrZIbWwGltHNIXR4mhJfOCOeRhXCyxSjXG3c0nlU2vbWoa9StinAzyj6qf
         YL2yM8iikk+adIBfFCfAHd0y9AxBYk/P2oBMiZp5FX+U13gQbnYO8tpycHM8sG/LIyZ5
         J5373b8/8AbwyTziEQnDqWfHYWQoRMFqapIRZYYxEEgzFNpUMUE3knB+bMYL5Xyfqy5k
         L5Q6876drFYEpYTFR+FInFA4M2ukYCy/wRrzIZt3axR94nKjGNk1KYXBTbZ2ZYmpkr2S
         tLIg==
X-Gm-Message-State: AOJu0YxcySK8rfHOgggzeIquegE4WvhhTyyjJsnGS38NYt2/Betz+mpZ
	sEwDvTurXwzLdSHHJyUq8+lw978lpeo1MLAN2f3TKknNky2V7OKPVH2aseA4hIc2oQ==
X-Gm-Gg: AZuq6aKZF/s3ST/56DaShLGNk7rOcgnau6bcX/TW1UFUXpvpTeLGfZ8wpOmiQSWn6hu
	jpup34y8BIM9yDli3GBDjhaP4x4cZ8Ipulfnv+1Jrb1eNt4YhbrixDicSCcSvFpfcH7I/E3JqOP
	1mwzxpDp9iGxzu7pCce17WqYuWrpbIQz/JNKQk3Ig44bytxSNPUKWJGez35RqrgvEdHQnmJ5o9c
	GLtRNQWR7X1CryFx4tI7t5ZxBt34xV0+/H/kEyaLZcYe+wQIFkQvnVhgXivq/+jTTT28mStYYlW
	kpi2f0Fsb49gi3cLKGnMdEsambWUevOrzqj8idGTewAO2SWklw+kVGEGWLgzVBYPZWWH1kUoawu
	bvF46RUZ/5Hqyqs02beoBDVg6ktfruqaZ+pW3mBfBgaHbsxJ2t/KqvAIB8209us6cp1Uo1VjUqa
	9/pF1kpHStSZoi+v6q2rODTdFxVJAZk3/dpkZFbBgnD8Pc5yRp7peW8SU+Fnbclnc01FTqYsCVt
	Qs=
X-Received: by 2002:a05:600c:6217:b0:47e:e48b:506d with SMTP id 5b1f17b1804b1-4830e93f21dmr30268775e9.16.1770191395544;
        Tue, 03 Feb 2026 23:49:55 -0800 (PST)
Message-ID: <40707659-0365-469d-ac29-2b558d423b24@suse.com>
Date: Wed, 4 Feb 2026 08:49:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/P2M: correct type use in p2m_put_gfn()
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <1ecefc98-f1c2-4116-95bf-a86c3b066843@suse.com>
 <aYL2yt0g8HGdpOTA@Mac.lan>
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
In-Reply-To: <aYL2yt0g8HGdpOTA@Mac.lan>
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
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email,suse.com:dkim,suse.com:mid];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: EAE19E2D4E
X-Rspamd-Action: no action

On 04.02.2026 08:35, Roger Pau Monné wrote:
> On Tue, Feb 03, 2026 at 03:01:27PM +0100, Jan Beulich wrote:
>> Everywhere else gfn_t are passed into respective GFN locking macros: Do so
>> here as well.
>>
>> Amends: 819cdc5a7301 ("x86/p2m: re-arrange {,__}put_gfn()")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

>> ---
>> Easy to spot by adding ASSERT(!gfn_eq(g, INVALID_GFN)) to the respective
>> macros. While imo that should be a correct thing to do (as with
>> hypothetical split locks a valid GFN would really need passing in, in
>> order to be able to figure out which lock to use), we can't do so right
>> now: The lock is acquired ahead of respective checking in a number of
>> places, e.g. in p2m_get_gfn_type_access().
> 
> Could we convert those macros into static inlines?  It's dangerous to
> use macros like those when the parameters are dropped, as the
> parameter is not evaluated at all.

It is. Seeing how the header is used, converting may be possible. There's
one slight concern I'd have with doing so: It would move us one step
closer to giving the impression that the arguments passed are correct at
all use sites (while as long as they're entirely ignored, that's kind of
a hint that they may need checking). I can't point at it right now, but
I'm pretty sure I had come across at least one place where they're pretty
clearly wrong.

Jan

