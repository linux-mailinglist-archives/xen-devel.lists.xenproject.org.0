Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F369D5058
	for <lists+xen-devel@lfdr.de>; Thu, 21 Nov 2024 17:03:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.841582.1257072 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tE9eh-00028D-0Y; Thu, 21 Nov 2024 16:03:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 841582.1257072; Thu, 21 Nov 2024 16:03:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tE9eg-00025T-Tv; Thu, 21 Nov 2024 16:03:42 +0000
Received: by outflank-mailman (input) for mailman id 841582;
 Thu, 21 Nov 2024 16:03:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0oSv=SQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tE9ef-00025L-Gd
 for xen-devel@lists.xenproject.org; Thu, 21 Nov 2024 16:03:41 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2b386a43-a822-11ef-a0cc-8be0dac302b0;
 Thu, 21 Nov 2024 17:03:38 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-43193678216so9772305e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 21 Nov 2024 08:03:38 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-433b4642b8dsm60759255e9.41.2024.11.21.08.03.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Nov 2024 08:03:23 -0800 (PST)
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
X-Inumbo-ID: 2b386a43-a822-11ef-a0cc-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjozMzAiLCJoZWxvIjoibWFpbC13bTEteDMzMC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjJiMzg2YTQzLWE4MjItMTFlZi1hMGNjLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyMjA1MDE4LjE0NzE5Nywic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1732205017; x=1732809817; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LzVz0zJp0BozBPebvSWuaRM2ULwnW/TLOLQgwOJr0/M=;
        b=WgoWqLHRVKjjw+MtAJTZwF+nnTaJlMvHXc1IiZiod/6n+fvbRzQL7HU9Pp1rPrbns0
         OS8d04Cy3WUo9+E0LKlRXhFCX2+RIJl20FeD6TEOjmIJc1ituggBo0KMXr4AUYrJlaFj
         z281tafIaBRrAd3tK30HjcO8PAVyNoXbL49OHGUas12uA2F4aDNiztVJXZMgNruPTYqQ
         tlIgRLncWNhGLxl/T8fPZyt9MDs82hvsYUNy7J6U2OQ/DVV/Od02DjR4zHv7I10X1+P6
         HNVj5IJYHoYXGTpeL/RPCPgeH0ANz3QVWyUWR+wkbFlVKD+vh7IAyk1tsUxPVFk8+imt
         CYJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732205017; x=1732809817;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LzVz0zJp0BozBPebvSWuaRM2ULwnW/TLOLQgwOJr0/M=;
        b=UCotNDFElR7nZ+I7p05EAxB2HM/8U4djzCobJzl+ZkzeOpr2vJ+9jrAa1bqW+Exioe
         /auc0qw666vhHnHb7pROvWjH0gyAWFDC95vGxDH89q8Va3qGY/6JdYJ1tc2MYNf9tEGJ
         ep4OjU5jZiUCfL/p8KWmTxIK4APPpYnMChPuL/GJD8Rz4h1+hduT6c72CiNWYREq7T+w
         tPdhit7uuIFsxQs7YoqQarEZKVDF081uBHyXXFJOe38DD+RbuQxdPy9K71G7lCPN+u/5
         RJjTsobNyWCWUOGn07PzJMCE8PeNlNTQj+kIhjl29M18lumC5c925gRUMN9aQY8dHGoC
         sSpg==
X-Forwarded-Encrypted: i=1; AJvYcCWpgBhmYwvBmUm0K/qqT4B6XIFJD7hCgS8yW2Sv2jJnnZUXx6I9nKpw8W34ITO6npn1wl1FTkVbv0g=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxXQuEVq4bzRFTiP8jwkG5CiJrx3uHODj7zCbzVyBgZChP1mcF5
	qKSDOPtiiGLeZJGVbC4+7UunEETsubR3SFA/tBbSfp9LJExNP6DqrOhh+6LGFw==
X-Gm-Gg: ASbGncveoAEuCeKHYBsufOgTbOGsyI+O/9OiBJaB0rpF4cBNDU4QoJ5KKD0XqswMwDO
	Jl1opXHAJSXsgtosyYW2NDwpTiLrHIEksHaMxz8oM2ACtZf4ZrxgrbaL/ujqldwCV6jfbd4Cs6/
	fMWFckF3qJjTO9TozaQlgxzCzRjura7vvAYS3ZzQWCmA35rrTCZzrTA6jRh9A8W6FpxL+5zv3kp
	KQrEuSCRU4dsi1dP7c/vVnilcMEWsoJBgI7+rxYWVVTXX/TJvoJjTGpwX0zhG3EMjLbvO/OAbsK
	joanPKE3kNG78kwZXR2h5cNILpJUYSvHE1I=
X-Google-Smtp-Source: AGHT+IH6Uee5YVk+qhQXlWBe12ZSvTjTP34XhoL7Xq875/JZ3/jPaJSyvBMivIsmGEndHTTPjmazIQ==
X-Received: by 2002:a05:600c:4685:b0:431:1868:417f with SMTP id 5b1f17b1804b1-433489d577dmr72172035e9.17.1732205005785;
        Thu, 21 Nov 2024 08:03:25 -0800 (PST)
Message-ID: <b2d3a42f-b599-455f-ad15-716dd7552208@suse.com>
Date: Thu, 21 Nov 2024 17:03:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/pv: limit GDT and LDT mappings areas to max number of
 vCPUs
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20241121111218.50984-1-roger.pau@citrix.com>
 <Zz9YM_MB1AoLqSIE@macbook>
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
In-Reply-To: <Zz9YM_MB1AoLqSIE@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 21.11.2024 16:56, Roger Pau Monné wrote:
> On Thu, Nov 21, 2024 at 12:12:18PM +0100, Roger Pau Monne wrote:
>> The allocation of the paging structures in the per-domain area for mapping the
>> guest GDT and LDT can be limited to the maximum number of vCPUs the guest can
>> have.  The maximum number of vCPUs is available at domain creation since commit
>> 4737fa52ce86.
>>
>> Limiting to the actual number of vCPUs avoids wasting memory for paging
>> structures that will never be used.  Current logic unconditionally uses 513
>> pages, one page for the L3, plus 512 L1 pages.
> 
> This is not true, I was confused with the logic in
> create_perdomain_mapping().  When create_perdomain_mapping() is called
> with pl1tab == NULL and ppg == NULL it just allocates the L2, but not
> the L1 tables.
> 
> So the purpose of the create_perdomain_mapping(d, GDT_LDT_VIRT_START,
> ...) in pv_domain_initialise() is even more dubious now - as it just
> allocates a page to use as L2.  I'm tempted to just remove it if you
> agree, since I don't consider this useful.  The allocation will
> already be done at vCPU initialization.

If it's done implicitly there, removing is likely fine. It feels like it may
have been necessary to do this explicitly earlier on.

Jan

