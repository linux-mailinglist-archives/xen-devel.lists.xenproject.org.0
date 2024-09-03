Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C58E9693AB
	for <lists+xen-devel@lfdr.de>; Tue,  3 Sep 2024 08:30:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.788620.1198047 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slN3k-000484-0S; Tue, 03 Sep 2024 06:30:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 788620.1198047; Tue, 03 Sep 2024 06:30:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slN3j-00045I-Tu; Tue, 03 Sep 2024 06:30:35 +0000
Received: by outflank-mailman (input) for mailman id 788620;
 Tue, 03 Sep 2024 06:30:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8q7v=QB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1slN3i-00045B-Cg
 for xen-devel@lists.xenproject.org; Tue, 03 Sep 2024 06:30:34 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 05ca9f91-69be-11ef-a0b2-8be0dac302b0;
 Tue, 03 Sep 2024 08:30:33 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5c245c62362so2399486a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 02 Sep 2024 23:30:33 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a898922301csm642463866b.215.2024.09.02.23.30.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Sep 2024 23:30:32 -0700 (PDT)
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
X-Inumbo-ID: 05ca9f91-69be-11ef-a0b2-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725345033; x=1725949833; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SprKBqDtUvIeJtYO2eHPZhP7jkWCETpolfqiLHo718Y=;
        b=XhKz+XxKm+3+Zq4iPwv2DjDzF9ZHt/I+apFDUqfYQ6RTD7DyN03wmmf6Tykvm4sAl4
         REYQpi7Bf/2tDKyY6WP5JN6kQLwFds6VJxmwsVhRJMvkPZsDAvdT8TtNHE8bGg1CPnZV
         NClkc6lZ+Z7x3njTfUAez+RgvPJUBev92iS/NV1xl1419N5djayBb0M3I3k/MGXFn7NP
         MCTiMZ4nzIG1SEwFntrAQNem9jHgShxksF3qBqZ11fggrYpkuhBmEnmCevpuhwWh5MYg
         o1sdqwwxwO1QDaN+AgrcdRPLP9Eelzp5nINHjRtge0aifIi+ejLKTOAMdxGgIh1ZeLqV
         1kbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725345033; x=1725949833;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SprKBqDtUvIeJtYO2eHPZhP7jkWCETpolfqiLHo718Y=;
        b=e2srHchk9b+Dn+PWrJhGvyPrKPqKQtH9c0vom62PejFTrAyV8jLL2A+zj3887QtuUF
         etWWxYGbG8I3X/4S2LGOPmPyPXW4hPLMy4KP3ur63sYB13MY/YOTTOb78OEGx1aq0Q/y
         UMtoa+BcYDL44l4Jq4h6IMzu2cKrFghRjITR/lz2Dokvz8k8CmrhRBFPqpelDVv+9Gy0
         UjysGiNgkFfcXa88+U31OLS+LPv2aBkaFjcAs+/MBTpw4ZkY29mHW/EShO82CJ0rJdE/
         tLT3wDiKf9YIeFi21YxTNWHuGH+xHxufY+gcBDGeVso0+227XfuxpHyPy61J9B5sadQv
         fMWQ==
X-Forwarded-Encrypted: i=1; AJvYcCWJZu5w4lTrvCwTkmy2sIm4aeTSCQS4b9QaDI9G86VgT5ACJoxpEsYweTbJcex9kFQa3vI3OKth2Tg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwMncC+y7odeYhfS1bkTv5gMbjdgT9KYRIrd4R8gOPK6p55d7s9
	PQwgiCHfdH3FWLSHhW6K8rAXIGKaGqG9iS2ojyZXoIjM4GOWbCgj/rmGHNmVdw==
X-Google-Smtp-Source: AGHT+IFLnkF9i61G8rSBseByrvUITfEhdV9WK47zskUgWC46R6K7fqSQLkJ2VBU6cgUNtUZdiKMUfA==
X-Received: by 2002:a17:907:2d0a:b0:a86:acdd:8238 with SMTP id a640c23a62f3a-a897fad7de6mr1169042366b.67.1725345032855;
        Mon, 02 Sep 2024 23:30:32 -0700 (PDT)
Message-ID: <d539cb31-3593-44ab-9352-dafade5241b8@suse.com>
Date: Tue, 3 Sep 2024 08:30:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/boot: Use fastcall for 32bit code
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Frediano Ziglio <frediano.ziglio@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240902133232.3302839-5-andrew.cooper3@citrix.com>
 <20240902165421.3429603-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240902165421.3429603-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.09.2024 18:54, Andrew Cooper wrote:
> This is marginally more efficient, but is mostly to get rid of the use of
> stdcall in cmdline.c and reloc.c
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

> v2:
>  * Fixed up to work properly.
> 
> I'm tempted to rebase this ahead of "[PATCH 3/4] x86/boot: Use
> <xen/compiler.h>" and remove the transatory opencoding of __stdcall.

Fine with me either way.

Jan

