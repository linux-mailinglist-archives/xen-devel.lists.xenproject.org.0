Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OKO9IFn6n2n3fAQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 26 Feb 2026 08:46:33 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E227F1A204B
	for <lists+xen-devel@lfdr.de>; Thu, 26 Feb 2026 08:46:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1241274.1542379 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvW4P-00071a-Ed; Thu, 26 Feb 2026 07:46:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1241274.1542379; Thu, 26 Feb 2026 07:46:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvW4P-0006zn-Bq; Thu, 26 Feb 2026 07:46:01 +0000
Received: by outflank-mailman (input) for mailman id 1241274;
 Thu, 26 Feb 2026 07:45:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S+Ht=A6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vvW4N-0006zh-Rr
 for xen-devel@lists.xenproject.org; Thu, 26 Feb 2026 07:45:59 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2fbefd02-12e7-11f1-9ccf-f158ae23cfc8;
 Thu, 26 Feb 2026 08:45:57 +0100 (CET)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-436317c80f7so1164038f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 25 Feb 2026 23:45:57 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4398bb96b90sm15279805f8f.9.2026.02.25.23.45.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Feb 2026 23:45:56 -0800 (PST)
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
X-Inumbo-ID: 2fbefd02-12e7-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1772091957; x=1772696757; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=q+zbg/wrmfQLotK9BDINriCYgovWYoxERgIqBDQuA6A=;
        b=PxPUWsMGiOymbA4z8XbLd9Mz/UPunA0iARA+yvzWOVhnCEI3QgJCtXLeDwBPdKN9q5
         pugFfw7SdB+Nhndnv4E6AKYzNERudE4xIklYSRtewa2hkFM8lznSWcuVXsFDQqiLoOKE
         nFPxSCUwC08JPCSBkdoTPtoqPeYeC6qZb4Y7svLu9ZdBoWbG10aPmM7fwCmlsXuofPBD
         BgqdfZyTmeRIbAWUtkR/DwanXAcFAdPkOcTiD9cgA/uWqhhWTL2YMvTZO9bXS43JTNr/
         0eqqQSNW+pNC30b56t7Lw54vOGjE5ap4kqSpQmCl+AftZoP6I9/TQ8btV6wbPyXKDrWw
         ZF5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772091957; x=1772696757;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q+zbg/wrmfQLotK9BDINriCYgovWYoxERgIqBDQuA6A=;
        b=hj34eFA3Z+QOPspyPP+D267QF1Ion0U6KOQam2M5pxx1U6VPeW8ntIKxfLWyeRPQot
         UTpgAaULsQZp7KF+3FZUvTIb3JiWxrhzGIB/OLq/B2AsanhcNZk1J08Ohq5BK/030xKl
         GZJYDbfEpEIKiijP9E+0iWSw84arPXfBB4C0u2911UZN2/5za/YAnpJbxCrBJI8QKrsY
         42NTEd2mqanLmQ7m6yU9kN6HsF16XYcCpcva2s4Lp5D5WLkHYIVf5VPpclp+W4LfhRlO
         QR13z3Ef/SF2gJaWuW/AjjmPuTtVllBjXBuQuVoEReAliulV2UsvnOtluvqzw9u0wBfT
         y/kw==
X-Forwarded-Encrypted: i=1; AJvYcCXLKUG8erc7mSVlx2aMFU2inQ1YL2fdnEdWS0IonfZNKynixMC2tgLsVwSt+OvT/F2s5QwJzc//0P0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywr1162bWqVKgXgOEWNbGS6M1Qa1pHNEGud5TwQOp5bB4llJyYS
	ZgOWtHuE37Pbj4r0IgEfw8oK3GX95jDpSG82vE6+QQuADSO9uepyTb5mGqDrloFrvA==
X-Gm-Gg: ATEYQzwc4y9wfn/Im87KUlfc7nsk/mUTDEomKoBq8clo/glX2ohhjzpERGs/izHeB9n
	8DjnHIehMvBMQ05ZW/hw04oV7jbm7MR2hBRHQ6RUYuoFUcrnNfd8CHUMDSftfkNpj4ACjRnC6pQ
	aVfEvHMfLIrj/GaVWskZ9xOfheGL8sbXFfPHwCTc/mG6+dLJUs42gdfHFSGQupJhETfetpTakB0
	r7F0Yo+VL7v5PHyspcn0H1XH9RivtKAKrmsz81s+FRYdSF1zVXzB6h+sNcUR1t/E4IPioQljH20
	R/R5dWrDi8pyzaAUoL8y8iNiv5WTxSiJA6Bimfz0R4xUkKzDvnufMYEPJKOOo2UQ2I+QSbPjwuo
	a7TSPw4aBHttLObeeFR7Gua2aT4axpPf98qaKzjJKV7I/iUxu6TvdNxDBrKe67Ply1K5DxPWUQi
	4LFtaYfpfiiJva6NqkTUfpw/abqDeVZ7JLYR151HDkWfbioynYX6OJYyX/pJjMbcOQGjzbyc79n
	rFHvprRkTNz6ek=
X-Received: by 2002:a05:6000:dc6:b0:435:96a1:ee4d with SMTP id ffacd0b85a97d-439971b2fdcmr2413040f8f.14.1772091956812;
        Wed, 25 Feb 2026 23:45:56 -0800 (PST)
Message-ID: <4dfd042c-2d33-4202-94f5-83b174a2e894@suse.com>
Date: Thu, 26 Feb 2026 08:45:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/mm: Remove claim that INVALID_{MFN,GFN}_INITIALIZER
 is for older toolchains
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260225125940.3804137-1-andrew.cooper3@citrix.com>
 <46a711cb-1853-44f6-a9a5-4d6252a8a995@suse.com>
 <63ee91a5-914c-4a09-9ef7-1e55beedb3e3@citrix.com>
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
In-Reply-To: <63ee91a5-914c-4a09-9ef7-1e55beedb3e3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: E227F1A204B
X-Rspamd-Action: no action

On 25.02.2026 17:35, Andrew Cooper wrote:
> On 25/02/2026 2:34 pm, Jan Beulich wrote:
>> On 25.02.2026 13:59, Andrew Cooper wrote:
>>> This was never because of a bug in GCC.
>>>
>>> C requires that static objects are initialised with constant expressions;
>>> _mfn(), as a static inline, is not and cannot be made to be.
>> Of course, and I think the comments were meant differently. What wasn't possible
>> to use (with -std=gnu99) due to the referenced bug is apparently
>>
>> #define INVALID_GFN ((gfn_t){ ~0UL })
>>
>> Now that gcc5 is our baseline, do we perhaps want to use that and do away with
>> INVALID_GFN_INITIALIZER?
> 
> Oh.  Yeah that's very much not what the comment suggested.
> 
> Changing like that almost works, but there's one snag.  common/memory.c has
> 
>     BUILD_BUG_ON(INVALID_GFN_RAW + 1);
> 
> and with the _RAW constant wanting to go, the obvious:
> 
>     BUILD_BUG_ON(gfn_x(INVALID_GFN) + 1);
> 
> doesn't compile as it's no longer a constant expression.
> 
> It's not clear what to do here.  I don't think we want to keep
> INVALID_GFN_RAW around for just this, but nor am I completely happy
> dropping the BUILD_BUG_ON() either.

One option may be to have separate forms for release and debug builds,
with the debug one open-coding gfn_x. Except that this doesn't work: In

    BUILD_BUG_ON(INVALID_GFN._gfn + 1);

the expression is a constant-expression, but not an integer constant
expression.

Hence the next "best" thing I can think of is

    if ( gfn_x(INVALID_GFN) + 1 )
        BUILD_ERROR("bad INVALID_GFN");

It's not quite clear to me whether it would be worthwhile to abstract
this further, e.g. by introducing BUILD_{ERROR,BUG}_IF(). If so,
perhaps we would want to spell out somewhere that BUILD_BUG_ON() is to
be preferred whenever it's usable.

Jan

