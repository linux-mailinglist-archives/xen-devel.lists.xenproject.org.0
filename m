Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3D9D880E5B
	for <lists+xen-devel@lfdr.de>; Wed, 20 Mar 2024 10:12:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.695828.1085991 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmrzO-0001tQ-Hy; Wed, 20 Mar 2024 09:12:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 695828.1085991; Wed, 20 Mar 2024 09:12:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmrzO-0001qn-Ep; Wed, 20 Mar 2024 09:12:02 +0000
Received: by outflank-mailman (input) for mailman id 695828;
 Wed, 20 Mar 2024 09:12:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LUpO=K2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rmrzM-0001qf-Pk
 for xen-devel@lists.xenproject.org; Wed, 20 Mar 2024 09:12:00 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e7b5ea4c-e699-11ee-afdd-a90da7624cb6;
 Wed, 20 Mar 2024 10:11:59 +0100 (CET)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a46d0a8399aso115369966b.1
 for <xen-devel@lists.xenproject.org>; Wed, 20 Mar 2024 02:11:58 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a4-20020a170906368400b00a46006bc7e9sm6978439ejc.159.2024.03.20.02.11.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Mar 2024 02:11:58 -0700 (PDT)
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
X-Inumbo-ID: e7b5ea4c-e699-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710925918; x=1711530718; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=m8DgjMHAPNLrp/oH1catHKQq2B4nnG9SaOpJp6mkQRQ=;
        b=gAD3hJO0zllKbQUrQNdsR9f3PzmTQn2y3IfnVa7wZFOJVpJVnrmHNBu3JMlRa1D+Gl
         mFBxzyCECQJcZPks9pDNfUasFxfeH2fw7CP1oSeID6JaBzbo7GbDW2yHZwMBjM2mIUCA
         QiS4tHKd4Rta7BrVM68jMYEm3Wvl8T46iP1MfyWd4xuFbzItfDRDy8Wu6Rf+lMeJKWOB
         Xh3qVLjzdG0J5fY40qMq7wzY6sKe6EH97UxJMHaCBD5B/LNEUbrBkHzOFeEFqmbIXRmS
         0BaI67KyGe8T8qLRV7FIxTUskmAjf3qghGt5riNXKJK0LLQCkOLboZC6jE7cLkcEujhQ
         YCDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710925918; x=1711530718;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m8DgjMHAPNLrp/oH1catHKQq2B4nnG9SaOpJp6mkQRQ=;
        b=BxXRN+GubAqYkKym0AF939y4nRIQqqaSKALZVqkf3WKQcdufCOFRq1lnrl8D3jK/Ij
         bqzDQeFnBd1mYGfF2fxkbUoEKcdg3yDtzaEtaBOU7xdPqB2aQC2d3MVxKY8/7ud/L6Gn
         rSpSkRkba/MIB2NaXJNKW4jfmMfpm8/Gmi92kiQbsbke7WG8lBZC3Zo8yflXL8MCVvbS
         WDo9U8JsuU8Cl1mmvLJ4sjQKgFrHhnEpCFnUL7/iME4C5+g7K4i4IqWd2x8UaUks2TEA
         XmRBbHbYDTZWOV2tCQRyx+UFw3vPplj2LD2zxBFmNmCyWbS3g4ougpl2rAI7H8DgzgwC
         wOEw==
X-Forwarded-Encrypted: i=1; AJvYcCUgDA14OZ5TAiC++XwwtIb6GN85GVjuKpMHorpT9PuuwvPtZvxp+IeiWpRLpwxWT3BI/UYlRaI9jSevOMV7+CiURVLEmL/sAp/KnzTfI94=
X-Gm-Message-State: AOJu0YzuEQa1C5idHDjiJ8dP+q/tdIbLFlgJZ+7i8WTj8RD9+1dQk+/s
	y6DYg0uhplAZw6/R9HdLa0CT3xKHZil5QiefOlFsHVQj1bwmgeKvkDTMPG0gBg==
X-Google-Smtp-Source: AGHT+IGNAFWT1rc1h04T18SBS33wQpI3Tc3Svs8798sZs5l/ZSPowgYohaQYY98B8VYXjXTm2NxcJg==
X-Received: by 2002:a17:907:9449:b0:a46:f6f2:6861 with SMTP id dl9-20020a170907944900b00a46f6f26861mr964796ejc.36.1710925918342;
        Wed, 20 Mar 2024 02:11:58 -0700 (PDT)
Message-ID: <4ce30a38-5b5c-4d4c-a0c4-8c1a63759203@suse.com>
Date: Wed, 20 Mar 2024 10:11:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 2/2] xen: address violations of MISRA C Rule 17.1
Content-Language: en-US
To: Simone Ballarin <simone.ballarin@bugseng.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1710923235.git.simone.ballarin@bugseng.com>
 <f7c2f12ab1b62301cfea3a28707178950f480932.1710923235.git.simone.ballarin@bugseng.com>
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
In-Reply-To: <f7c2f12ab1b62301cfea3a28707178950f480932.1710923235.git.simone.ballarin@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20.03.2024 09:51, Simone Ballarin wrote:
> MISRA C Rule 20.7 states: "The features of `<stdarg.h>' shall not be used"
> 
> The Xen community wants to avoid using variadic functions except for
> specific circumstances where it feels appropriate by strict code review.
> 
> Functions hypercall_create_continuation and hypercall_xlat_continuation
> are special hypercalls made to break long running hypercalls into multiple
> calls.

Here and below: These aren't "special hypercalls". They're internal helper
functions.

> They take a variable number of arguments depending on the original
> hypercall they are trying to continue.

Am I misremembering or did Andrew outline a plan to eliminate the variadic-
ness from these? From certifiability perspective avoiding the need for a
deviation would likely be preferable?

Jan

