Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB61C9C6A87
	for <lists+xen-devel@lfdr.de>; Wed, 13 Nov 2024 09:26:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.835118.1250961 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tB8hL-0005jF-EY; Wed, 13 Nov 2024 08:25:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 835118.1250961; Wed, 13 Nov 2024 08:25:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tB8hL-0005gR-Aw; Wed, 13 Nov 2024 08:25:59 +0000
Received: by outflank-mailman (input) for mailman id 835118;
 Wed, 13 Nov 2024 08:25:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=REvy=SI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tB8hK-0005gK-M0
 for xen-devel@lists.xenproject.org; Wed, 13 Nov 2024 08:25:58 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e3c0794d-a198-11ef-99a3-01e77a169b0f;
 Wed, 13 Nov 2024 09:25:50 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4316f3d3c21so53857335e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 13 Nov 2024 00:25:50 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381ed997313sm17556924f8f.53.2024.11.13.00.25.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Nov 2024 00:25:49 -0800 (PST)
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
X-Inumbo-ID: e3c0794d-a198-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjozMmYiLCJoZWxvIjoibWFpbC13bTEteDMyZi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImUzYzA3OTRkLWExOTgtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxNDg2MzUwLjE5MzA5Mywic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1731486349; x=1732091149; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9ZL0qshxlWsaXovFlitVepSEwKiZv5vxK1dNxdLmwq8=;
        b=DpRPjthPGTWVQAt0ls/e2N6q3E7z2Ol1Vwm9xDr5K6jBIJEhZkbw3E7NrenE4VU+WL
         j8+EqsDu3baYOBu6bLZujw9emLoMfiQaEqFUWoRj6Ev1OnP0r1z7SFhQRgo3Z0gJvItI
         H63lGE2rbmEF/yUBm5GLdbzO445LjjUrTtUzheAnzhTcsZhpNutN7rGUzxo7OCFaSWD5
         6wmyLsyRZoYmnGyfWhH7GrIGP1onhuFrZS5VRdwJRAh4934K0gboYu7YDgFkEivfMz/c
         ND/T+h9LZAwhG/cZWbGdHedu4E8BF77D79h3RlENapwXQSHqcCDjE+mLL4Leo05i6FtE
         Z0yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731486349; x=1732091149;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9ZL0qshxlWsaXovFlitVepSEwKiZv5vxK1dNxdLmwq8=;
        b=EIlzv7fFHVHg97CdOTIUPFztDfDgQ9x2o01hF/HP/gkgmB+y5iqVeiR6cSNFPoYRDJ
         fl2li/TVnCH3HNzi4ko4Gis4DPduhvy+X0s+0h/Iy/EZANFOrQv5FrIyDgAnAJEVNryc
         o9gjuPOAIsC9w2R+QMmKj1svscdGJvmwWwgIWTM5kooQlt5Fvp3Xa11pBCZF8+gHocXF
         71T7KxyewaSiCjXESatz0H802NUr/gndzAevjCBycGy3Eh/CZx3+Fu2AqmiFxAt3SYBr
         KRKHBlWxZqfew90ilpcy0py9WCev2MXjeVxFTHSGPQ0C7KK1YIwPH3csjCjyRJfnNlUR
         T0Fw==
X-Forwarded-Encrypted: i=1; AJvYcCUJHEw8V2JQcJvxgO1G3HCDusggxscIyMM1MFDsWTnzjwGRVQBKRnsiylgGTYQFp36rLnKTw0AfeNs=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx42IfJmLkC+nIZfXrDRQxsZ1LlMsFIQoTiJ83KEvH/w9HTBciE
	5YHux3feo0qr/tgsBifRDJABubaH11WMc2YQurtcHyoPeFa+7y/nR2k1MoM2DQ==
X-Google-Smtp-Source: AGHT+IEBumYpQKePT2lORKRPWoZZwuwiXsSTA45yfAjXJGSIW1QlzB++uLl1wEeC0Og8R3yMbd5PRg==
X-Received: by 2002:a5d:5d89:0:b0:374:c84d:1cfe with SMTP id ffacd0b85a97d-3820811105bmr4242482f8f.21.1731486349553;
        Wed, 13 Nov 2024 00:25:49 -0800 (PST)
Message-ID: <35b585a0-7d19-4b02-8ad6-90c7df3ae6ac@suse.com>
Date: Wed, 13 Nov 2024 09:25:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] xen/multicall: Change nr_calls to uniformly be
 unsigned long
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Roberto Bagnara <roberto.bagnara@bugseng.com>,
 "consulting @ bugseng . com" <consulting@bugseng.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240621205800.329230-1-andrew.cooper3@citrix.com>
 <20240621205800.329230-3-andrew.cooper3@citrix.com>
 <660fc551-c6bc-456f-8e9e-80b3e592fece@suse.com>
 <alpine.DEB.2.22.394.2411121912400.222505@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2411121912400.222505@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.11.2024 04:15, Stefano Stabellini wrote:
> It is challenging to create a solution that satisfies everyone for this
> patch. However, we should add R8.3 to the clean list as soon as possible
> to enable rule blocking in GitLab-CI. Failing to do so risks introducing
> regressions, as recently occurred, undoing the significant efforts made
> by Bugseng and the community over the past year.
> 
> Unless there is a specific counterproposal, let us proceed with
> committing this patch.

Well, I find this odd. We leave things sit in limbo for months and then
want to go ahead with a controversial solution? Rather than actually
(and finally) sorting out the underlying disagreement (of which there
are actually two sufficiently separate parts)? Plus ...

> On Mon, 24 Jun 2024, Jan Beulich wrote:
>> On 21.06.2024 22:58, Andrew Cooper wrote:
>>> Right now, the non-compat declaration and definition of do_multicall()
>>> differing types for the nr_calls parameter.
>>>
>>> This is a MISRA rule 8.3 violation, but it's also time-bomb waiting for the
>>> first 128bit architecture (RISC-V looks as if it might get there first).
>>>
>>> Worse, the type chosen here has a side effect of truncating the guest
>>> parameter, because Xen still doesn't have a clean hypercall ABI definition.
>>>
>>> Switch uniformly to using unsigned long.
>>
>> And re-raising all the same question again: Why not uniformly unsigned int?
>> Or uint32_t?

... this question of mine effectively represents a concrete alternative
proposal (or even two, if you like).

The two parts where there appears to be disagreement are:
1) When to (not) use fixed width types, as presently outlined in
   ./CODING_STYLE.
2) How to type C function parameters called solely from assembly code (of
   which the hypercall handlers are a subset).

And maybe
2b) How to best express such function parameters when they're (sometimes)
    shared between native and compat handlers.

Of course 2) is affected by, as Andrew validly says, there not being a
formally clean ABI definition.

My fear is that if this gets committed as is, it'll be used as a handle to
force in further similarly questionable / controversial changes to other
hypercall handlers. Which is why I think the controversy needs sorting out
first (which admittedly is hard when the ABI is fuzzy).

Jan

