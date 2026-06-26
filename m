Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sCi2HPtnPmr6FQkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jun 2026 13:52:27 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD9BF6CCA6D
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jun 2026 13:52:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=AKftw1oR;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1346039.1604586 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wd55a-0002bE-7P; Fri, 26 Jun 2026 11:51:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1346039.1604586; Fri, 26 Jun 2026 11:51:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wd55a-0002Yt-3a; Fri, 26 Jun 2026 11:51:18 +0000
Received: by outflank-mailman (input) for mailman id 1346039;
 Fri, 26 Jun 2026 11:51:17 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wd55Z-0002Yn-0S
 for xen-devel@lists.xenproject.org; Fri, 26 Jun 2026 11:51:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wd55X-005MAc-S2
 for xen-devel@lists.xenproject.org; Fri, 26 Jun 2026 13:51:15 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a3e67ad-2eae-0a2a0a5409dd-0a2a4506eba0-24
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jun 2026 13:51:15 +0200
Received: from [209.85.221.53] (helo=mail-wr1-f53.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a3e67b3-08de-0a2a45060019-d155dd35e93b-3
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jun 2026 13:51:15 +0200
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-4627adcf4d6so569851f8f.3
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jun 2026 04:51:15 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-46c1ee0189esm25271005f8f.9.2026.06.26.04.51.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Jun 2026 04:51:14 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1782474675; x=1783079475; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fXVtO2JRaL4gIMWHe3zMS9uEQlYjsOXNmhQmPWFQ4XY=;
        b=AKftw1oRR+1QwjLnyo5BW4d7z2I7qzbZULJ4aSyK4ZV3+APlZhKO58y/Kgm79CwRhi
         68f5c6Kg9c1qKCse6wH1xjSoB8O9GqAnly2U037ks1ZaWYSdmm9cSNA4KatfsZSBWZ/L
         gVavwps6c7hWRPBIxp2Jx+/NXlSLRYO+tMx6OrjGBwnHcdvQ8Iio9mtX0PiWF2UJiyDA
         egJaDm/mxRyrSA9rSixVZMQXnHo25QQzjEqIUUcBcJFQrYERK8498LtNg4wW7H4B95av
         wKx2l/DVMFEeg3t0xQfWAnaSm/U3CbCOJJQaswBI+ijlGLoh9qAuWEYTLOw3LYUyltL0
         49xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782474675; x=1783079475;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fXVtO2JRaL4gIMWHe3zMS9uEQlYjsOXNmhQmPWFQ4XY=;
        b=OMqzLv6rtKttZTN221fOGEQT+9nHCuNSxamPNMONe4rbyBem0diZe8lETop346Eb2a
         sO8XdZDz6tWB3wx7z9tY/z2oqaOIDCF1/+hhX2OTdJr6nq5mZOBCVmSZ5ltEuL91KyPI
         a1fZH35UitsazMFMYb67/TFvnugpAeVceC7MIpXMOieB3na0QDOUaDVE9/d3K7R24ms8
         NGho4GQ7c3tJXK8ZYZI+31QHWfihBFCxoUuFp50QIGog/iUuGdAp5kDDqRvtDbS8Z2Uz
         uKSxCnDtoBYvNXIfAHuCax9Y4YeH6gj5yHNthHT2U9PTasdf2nzwNajAXs2s05HxtDhy
         ehug==
X-Forwarded-Encrypted: i=1; AHgh+RpIEElLzdFbdSwYCkjQT13kTKSu49ew+wcsavp5cMSK3YIL+4znJzI5OWcNVQNmTryruO+8UsPMHVE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxKeE8uTGSdzmxdW05EFvc6yBuNet5f0RXTYlEDZVf5ZSb7++ma
	QhuKJDeDGvXb54kgZLcPG7yLgybEz6jVpzW5jlUNeABXPSuwMbjsK0XlEjmMAMhgdZtb9u9GjqL
	yXf3s6g==
X-Gm-Gg: AfdE7clZTtQAfCRDj9L/5UCM+OgWimbfz4LlCIcZr1O2B6OJZzOHF/WdOd1gOHtYR6j
	PuzkaIPvhs0w6X/A8EW56l6qyqyHnatfA/f90a2Wgl2sT4G5+f6NsfWES0TbONJ2m5Nq2AvoAyx
	A8bn+70R4lqEJ7S/IW2tCmcPU09v4xkcekv+3ZkJtPl6F9zaTkQXm4Jis1s9mfruYRCiMMYnv2/
	AL+g7ewA+TA7X/2PUeWTJRzFbbwlMUm/Wm8GqwNIZR963A5Ufrocos/c9B19woU7By/++DfLiFh
	9v+XYN000qLLCIF+eSz8TGWK/ShwKPJZ9pmoa8YUqiG8dNuOSi398cVxQvqAiWI1F1dQGJaiMcl
	i6UL9mdZXiGgXeb7dq2+EMhJqkOycRBwtHDh4TMaMyLSwNnwclqmwevBsx/cT4Bom47NF8eU1l9
	xRB1aK+Ght7/Nd747Q4iEkPHkia0oP3a9wtZP+q6VF2Nj8ggGdF9slFeU6t0DnV3GrJJv84raH6
	Yyw
X-Received: by 2002:a05:6000:41f7:b0:46f:3046:2bec with SMTP id ffacd0b85a97d-46f30462d77mr2715654f8f.25.1782474675120;
        Fri, 26 Jun 2026 04:51:15 -0700 (PDT)
Message-ID: <e33b1194-395e-4257-bc29-bf36dd22f991@suse.com>
Date: Fri, 26 Jun 2026 13:51:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] x86/efi: discard multiboot support for PE binary
To: Frediano Ziglio <freddy77@gmail.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 Frediano Ziglio <frediano.ziglio@citrix.com>, xen-devel@lists.xenproject.org
References: <20260616172830.111393-1-frediano.ziglio@citrix.com>
 <20260616172830.111393-3-frediano.ziglio@citrix.com>
 <070ff282-5ee4-4c24-b0bc-92d187c40dd9@suse.com>
 <CAHt6W4de1ddW_xMWhbJ15vA171tuHVGJu0TO0bAH845EDQN4gg@mail.gmail.com>
 <4f971b7e-b9ff-44cb-bf29-3939c8659b07@suse.com>
 <CAHt6W4d2ETm1G5rv5h5ESvfLm1F9+xO_v1PE7M5sQdJHxA8p1Q@mail.gmail.com>
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
In-Reply-To: <CAHt6W4d2ETm1G5rv5h5ESvfLm1F9+xO_v1PE7M5sQdJHxA8p1Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1782474675-C772868D-B915CFCD/0/0
X-purgate-type: clean
X-purgate-size: 1552
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:freddy77@gmail.com,m:roger.pau@citrix.com,m:andrew.cooper3@citrix.com,m:teddy.astie@vates.tech,m:marmarek@invisiblethingslab.com,m:frediano.ziglio@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email,suse.com:mid,suse.com:from_mime];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BD9BF6CCA6D

On 26.06.2026 11:48, Frediano Ziglio wrote:
> On Thu, 25 Jun 2026 at 12:18, Jan Beulich <jbeulich@suse.com> wrote:
>> On 25.06.2026 12:15, Frediano Ziglio wrote:
>>> On Wed, 24 Jun 2026 at 15:18, Jan Beulich <jbeulich@suse.com> wrote:
>>>> On 16.06.2026 19:28, Frediano Ziglio wrote:
>>>> Otoh you discard call sites of functions without discarding the functions
>>>> themselves, violating Misra's "no unreachable code" rule. Eclair may not be
>>>> able to spot this, but imo we should still adhere to the rule. Proper
>>>> coverage analysis, for example, would likely turn this up.
>>>>
>>>
>>> That makes sense. Given that most code in head.S is now discarded most
>>> data sections are now not used and the only thing left will be the
>>> trampoline.
>>> It'll take a bit of time to search for removed symbols.
>>>
>>> About the "no unreachable code" I think we are violating that anyway.
>>
>> Perhaps, but we should get the number of such violations down, not up.
>>
> 
> It was not meant to be an excuse, more of a question if the problem is known.
> The "It'll take a bit of time to search for removed symbols" was a "I will do".
> I now have the fixup patch for "x86/efi: discard multiboot and PVH
> support for PE binary" (the commit we are talking about here). About
> sending an updated series, what is the best way to send a fixup patch?
> Send the fixup as separate? Merge into the base patch and remove the
> "acked-by"? Keep the "acked-by"?

R-b would need dropping. A-b is more of a judgement call.

Jan

