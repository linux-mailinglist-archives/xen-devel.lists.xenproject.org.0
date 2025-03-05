Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34917A4FA27
	for <lists+xen-devel@lfdr.de>; Wed,  5 Mar 2025 10:33:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.902024.1309999 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpl7s-0003zE-Jm; Wed, 05 Mar 2025 09:33:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 902024.1309999; Wed, 05 Mar 2025 09:33:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpl7s-0003y6-H3; Wed, 05 Mar 2025 09:33:16 +0000
Received: by outflank-mailman (input) for mailman id 902024;
 Wed, 05 Mar 2025 09:33:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2gZc=VY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tpl7r-0003w9-O8
 for xen-devel@lists.xenproject.org; Wed, 05 Mar 2025 09:33:15 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dc27f0fa-f9a4-11ef-9898-31a8f345e629;
 Wed, 05 Mar 2025 10:33:13 +0100 (CET)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-390df0138beso3424191f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 05 Mar 2025 01:33:13 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-391218ed8ccsm1429390f8f.91.2025.03.05.01.33.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Mar 2025 01:33:12 -0800 (PST)
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
X-Inumbo-ID: dc27f0fa-f9a4-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741167193; x=1741771993; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=g3z7UXZOAnWvtwuH2Cll3VoL+1a65SayxdiiDZ/NXAY=;
        b=b3/DkO8v/B7GGUqmEmJSKjYY2zBAUv1Fc2fQ9gISLHzoBswDyLeMPa9E0CX6+dCu8b
         Ars86DnV0y0jvUeRAmgUofaZZ2Y/2Fq/7JuhVed2b6Fyvr96gjoTvFsix/UOHi3pgTxX
         3bfjkrMzknFNJ92qJtoTZ3jwlDZFPGxlCU7m/OvVqeyx7I0ipg9x1iIPBSjZaMxY2xxx
         I1gSFaVNBXK5e/HYRI0cGTMVAwhC9s/PHGmosC8j4QKQNYn6OVjFuxXXzt8ZHXlpiQyT
         MEKJ9OnwGhglEVT+i5/3JRLl+BHbU9vm+f6a+r+6atf2vpWET2WLtPKoovyjxI0igwn3
         pspw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741167193; x=1741771993;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g3z7UXZOAnWvtwuH2Cll3VoL+1a65SayxdiiDZ/NXAY=;
        b=XWiNwYEwMkKnGhls4LpC5Ea+PPSH+kTq1055VtUR12p0wguixeOtzb0EqPxxZ9jrQn
         h9hzHS103WiXrXyP+/G9jn1oDCv3EKtSUtWoi5k0bkHV0copcAcXJzU4/kRS4yeOcjpG
         uGJBNQyfzus94mSH0/rCk6W4fUEZbjsp6SK+McQr+LE4yVedNCjqR6TFCHKk2N3fnQJV
         LOOmW+a0IBhHhtcu80uVq72i73Zb+s163asSIZGySOyd+wMVksK4nu9LEdw/uyALKiPQ
         T3MNMlp/vsOTLb6OOgSsVXwGmVI1r1O5CVGoCNE4tWMywzyYTltiQnM1PgRC785iCAd7
         Z76A==
X-Gm-Message-State: AOJu0YxgfPrJqted1t7QCmhJZtfDna+x6hyBnNS13ilbvV1K5q4YW/0h
	rwbtFtPnhtDOH5FfnGDmAP6vJ1av7OAdQhNeJDlS5T7E7qVgGD9H2cECtX5CfQ==
X-Gm-Gg: ASbGncuciytmBitD0IhDMgo54uhBWE/kCPFL1quvqejfmNFXC8qZYr3r0LlKlL/738p
	omH91uxsUTJTlJulFiZ0aDsjHGrSP1B9/7do6rXmsKnZnmdTiigVQ8+KOnSdIA8DcDcJIqgXU1+
	/w9Jx6eX+kPaKqNo3R/EKIBlkpHtJylqzts3gHgZvmOhNvpY7YV2sizL34RkPKwR+8k2WA1EU6z
	hvJEAFuIIUJzFB+jW4x9iXAzMLhRTLlRR8m5qf+HDUG6W+V9x9wiDy/U5Hp7OLuqhCCQmxuABMq
	P+w17vN1wryDkzqxFncWlduXUXjWOW28gq/bwZV+xrKzGHZKbVgsPwwsZSg99uNzKUjcyJ6Au7H
	/fYvCvGETxx4Oy+nQBDsrYAsbGgmpfw==
X-Google-Smtp-Source: AGHT+IE6vRjqPQaeTFoBi0yc1yoo18IYu/ypU+ERGUWAANc4VMWTkMUOoEngVlPdMkNkEIjLZ20pSQ==
X-Received: by 2002:a5d:5f91:0:b0:38d:cf33:31d6 with SMTP id ffacd0b85a97d-3911f724876mr1725850f8f.3.1741167193093;
        Wed, 05 Mar 2025 01:33:13 -0800 (PST)
Message-ID: <d33b219a-d436-4304-aecf-af92311dbe51@suse.com>
Date: Wed, 5 Mar 2025 10:33:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/public: remove some unused defines from xs_wire.h
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org
References: <20250305085646.26472-1-jgross@suse.com>
 <41e7c2ff-ee66-4269-9771-fc274e7a051d@suse.com>
 <f1f9ef43-ca01-4b69-ba04-696f53e4a990@suse.com>
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
In-Reply-To: <f1f9ef43-ca01-4b69-ba04-696f53e4a990@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 05.03.2025 10:27, Jürgen Groß wrote:
> On 05.03.25 10:14, Jan Beulich wrote:
>> On 05.03.2025 09:56, Juergen Gross wrote:
>>> xs_wire.h contains some defines XS_WRITE_* which seem to be leftovers
>>> from some decades ago. They haven't been used in the Xen tree since at
>>> least Xen 2.0 and they make no sense anyway.
>>>
>>> Remove them, as they seem not to be related to any Xen interface we
>>> have today.
>>
>> How sure are you/we that there are no out-of-tree uses of them? They
>> aren't in e.g. a __XEN_TOOLS__ protected region after all. (I don't
>> mind their removal, but in public headers I think we need to be
>> double careful.)
> 
> The reasoning is all in the commit message: those macros haven't made
> any sense since ages.

Well, the reason I asked is that I consider "makes sense" as pretty
subjective.

> In case someone is using them, the usage is either wrong or not related
> to Xen. I have checked Mini-OS, Qemu and Linux kernel for uses and
> didn't find any.

Okay, probably fair enough then:
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

