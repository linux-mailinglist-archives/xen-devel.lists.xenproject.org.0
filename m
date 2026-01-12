Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30D68D1247E
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jan 2026 12:25:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1200119.1516124 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfG2T-0004hX-9O; Mon, 12 Jan 2026 11:24:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1200119.1516124; Mon, 12 Jan 2026 11:24:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfG2T-0004et-5p; Mon, 12 Jan 2026 11:24:49 +0000
Received: by outflank-mailman (input) for mailman id 1200119;
 Mon, 12 Jan 2026 11:24:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Qluw=7R=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vfG2S-0004en-7h
 for xen-devel@lists.xenproject.org; Mon, 12 Jan 2026 11:24:48 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4ce0658f-efa9-11f0-b15e-2bf370ae4941;
 Mon, 12 Jan 2026 12:24:46 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-47795f6f5c0so38135825e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 12 Jan 2026 03:24:46 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d8715b5d9sm133081265e9.5.2026.01.12.03.24.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Jan 2026 03:24:45 -0800 (PST)
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
X-Inumbo-ID: 4ce0658f-efa9-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768217086; x=1768821886; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=JPecrGbU0W+UNpV7R2wFfYgDjoCPL04H5/Dm0sZMGO4=;
        b=egH43rmLcpAuWR2g6VI1MMRDRajEFpt9ohZm4I/If6SQu3jZMWgNCcZKUqFvffwmcg
         1QWmoy/KVScbL7F8zO4E5UyH+Io8dNQ0R1O7Bf4Y3qIr93g1K8Qs7/Nh64Wplv7iHaLB
         IqCAPH3H9zlCzLDH2yXuAykfcrnMb1b7bnemWbffyp4sHhv7oaSFF7vH2etWtHO2jgk5
         SelpO4E+rK+sO4738ueW8AvYDqBmF/5I4kH6r8/xa9O7NkMqh10W/oC75AcK3B/ZDp4e
         nyXrfKTCxyVpL9EaPC/FzBh/UcGfOahGNlx/7Ag5Kwg9d6ycoKfbivv3E/VwECIT95tB
         lzYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768217086; x=1768821886;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JPecrGbU0W+UNpV7R2wFfYgDjoCPL04H5/Dm0sZMGO4=;
        b=VGik+JEXv9h3d1ZrEXkwqSdRS21jVN998+rMkWBfrycE4RieTtnJ9U/6dcfs0kku11
         ol13p9WSC+RnQ6IhS6lGTHl89OvEtJZaUESxfM0QEJwRbU6X6ehEjeHzfirYlx8zN8n4
         0qgCu/remPAw7b4wqR/PnKnZDplyKlpqaVlgGJ/gD+rLOaFWIVe14cKb8UmWJdAOlGcZ
         X1fyv1nvehSCyherxcWNvG76rxQU6O8S/81rOANfNFfHKJRtJ//hORxutCh12DYetB6P
         XW7Ms2UIGcjJtDmgD9MfGlfxc30ZEtqjW2yQcHHYUxHc34QvpDLKVi4QyJ7Z0B6C00la
         pYWA==
X-Forwarded-Encrypted: i=1; AJvYcCUOOBETez89K+fT4w/fo5gVREPCMN6wgy1z7DU+/XbKlAt6VVPkzwAGFhHYbMIict+0gLIX2l6dpGs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwU62+pezodPwiQYCZmdOjGoiDsl3W7JtvlMqG8XMyfU4XTHJ33
	cH0yA6DStIRwLFLQs65ZdidOwq7RafXxbW9KKfDzOUVL7oYTk8bwgZkYVDGXpRRx0Q==
X-Gm-Gg: AY/fxX4Dq3Im+MfFd1UG8SOkGonK5F6fn6o4WbC8riD7nr98vJLv5Xs3F7t/pT6y13s
	mIPXK1ZIGPahFtjdZnXOFNvPfWSgMzBZAe7/dILTcOv1amF+lp1GWDCsNLETUNzmheihp8gktXx
	00oPRSJ3qMQoJStan/v38yRv+EonysQ+C/S5A38SINlmIrMVYOTIrELyhpS5WnzZ5TW09QSMkYe
	Z2LE7mQsLoDapgkIQ/PT6J43pKei1+Jwqs6O+AMy+PdV6FfdFnUxblyvsUCRxgGfcpy2XXqsMwc
	AES/UrKlhYzsHF6nJGBIumoTO0lDrsh1bfnPRBSFoS5neHKdhZzkihK0OcdwPKmYCrG1wQC4+yE
	wdHeddQyh4wflLtXGauGInbmGFu9k60MU8FMbQPvJDP7f6/mK30Xi4IFgoeik2k6PRhEJHSIW33
	0Sk7ythyPvyrpK6RPETAnnDRiyqVd6bu9B78qDj40umtLddVWYoteMkwJi/IfMSvA2IG2gU1AP+
	0Q=
X-Google-Smtp-Source: AGHT+IH432z5H5gsj5zkDnT/1Jxoo9DGAL4oQA+m//LxTQ/HmvyZq+/OZMUKDD/tPCZskt+2vVCi5w==
X-Received: by 2002:a05:600c:a314:b0:479:3876:22a8 with SMTP id 5b1f17b1804b1-47d84b2d285mr181768245e9.16.1768217086164;
        Mon, 12 Jan 2026 03:24:46 -0800 (PST)
Message-ID: <f0dcc4e7-3053-4386-a162-579ecf68240f@suse.com>
Date: Mon, 12 Jan 2026 12:24:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/altp2m: altp2m_get_effective_entry() should honor
 ap2m->default_access
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org, Tamas K Lengyel <tamas@tklengyel.com>,
 =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>
References: <dbab519006501b3971fa913310a06755a14c4548.1767982955.git.w1benny@gmail.com>
 <ec57461b-dde6-413d-a825-3538f46a1209@suse.com>
 <1916d0a7-ff9a-49f1-8564-2767226fca9c@citrix.com>
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
In-Reply-To: <1916d0a7-ff9a-49f1-8564-2767226fca9c@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12.01.2026 12:18, Andrew Cooper wrote:
> On 12/01/2026 11:09 am, Jan Beulich wrote:
>> On 09.01.2026 19:28, Petr Beneš wrote:
>>> From: Petr Beneš <w1benny@gmail.com>
>>>
>>> Commit 7e5b662 fixed p2m_altp2m_get_or_propagate() to use the altp2m's
>>> default_access when propagating entries from the host p2m. However, the same
>>> fix was not applied to altp2m_get_effective_entry(), which has the same issue.
>>>
>>> When altp2m_get_effective_entry() prepopulates a superpage from the host
>>> p2m, it incorrectly uses the host p2m's access permissions instead of
>>> the altp2m's default_access. This causes problems when the superpage is
>>> later split (e.g., when setting mem_access on a specific 4K page): all
>>> 512 entries inherit the host p2m's access rights instead of the altp2m's
>>> default_access.
>>>
>>> This issue became apparent after commit 50baf2d, which causes the host p2m
>>> to use superpages more frequently. Before that commit, the host p2m
>>> typically had 4K entries after VM restore, so the prepopulate branch was
>>> rarely taken.
>>>
>>> Symptoms include memory-access events firing for unexpected pages when
>>> using VMI tools with altp2m, particularly after VM resume.
>>> The issue can be worked around by booting with "hap_1gb=0 hap_2mb=0".
>>>
>>> Fixes: 7e5b662 ("x86/altp2m: p2m_altp2m_get_or_propagate() should honor ap2m->default_access")
>> You didn't even Cc Tamas, who I think once again will need to ack this.
>> Already with the referenced change I didn't quite understand the
>> reasoning.
>>
>> However, two formal points: Please use 12-digit hashes, as demanded by
>> sending-patches.pandoc. Plus I don't think Fixes: is quite right here.
>> That earlier change of yours didn't mean to do more than it did, by its
>> title and description. We relatively recently introduced Amends:, which
>> may be a suitable fit here.
> 
> I beg your pardon?  Fixes are and Amends are synonyms.

This is news to me. To me a "fix" addresses a bug in the referenced commit.
Whereas making a related change which isn't strictly a bugfix to the
referenced earlier change is what Amends: was introduced for. If both were
synonyms, why would you not have objected to the introduction of Amends:?

>  You cannot use
> them like this, and you absolutely cannot expect contributors to know
> your personal interpretation of the words.

"My personal interpretation of the words" has become the community's with
the committing of the change introducing Amends:. And I think I can expect
contributors to read sending-patches.pandoc?

Jan

