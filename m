Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF5F0854C90
	for <lists+xen-devel@lfdr.de>; Wed, 14 Feb 2024 16:22:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.680984.1059471 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raH4x-0005QG-ME; Wed, 14 Feb 2024 15:21:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 680984.1059471; Wed, 14 Feb 2024 15:21:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raH4x-0005NK-Is; Wed, 14 Feb 2024 15:21:43 +0000
Received: by outflank-mailman (input) for mailman id 680984;
 Wed, 14 Feb 2024 15:21:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=l+oD=JX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1raH4v-0005NE-K4
 for xen-devel@lists.xenproject.org; Wed, 14 Feb 2024 15:21:41 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bfd2886d-cb4c-11ee-98f5-efadbce2ee36;
 Wed, 14 Feb 2024 16:21:39 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-40efcb37373so44274045e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 14 Feb 2024 07:21:39 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 l12-20020a1c790c000000b00410bc833c2csm1596919wme.1.2024.02.14.07.21.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Feb 2024 07:21:38 -0800 (PST)
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
X-Inumbo-ID: bfd2886d-cb4c-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707924099; x=1708528899; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5oyh52a4Z6LZhtZWfw+fMmAMgPOOv0etXEzm5yIXrbg=;
        b=MAfvTt8tQS7CWSTGF3naHFTPj367adXokWHYLYxFMhUOmMEj/CECHjajtUMZgyAEUt
         gYE5eS1jtuJNvOTmWG2YslsP+zXnWKu6NpB7DMfRP+w5LQCADI3ZKdPyH3okLZtxObPW
         Zej/9cstPFEvt8+Ha2iBDqDprOZ9plTSL/kQAdD8lFAw7QC65FAkWJWhz9UkU2JvLhNa
         m0ckko/g3D6I2g9jPPJFDe0RO6t0OQKDpvgoCbTltFecqEjfAKJuh03JsmXpPp2GXNCO
         rqkrg0KSmS0ppoRwiC4iNv1WYjjff9Ao/DMyC+sfbylvf84Kjn4/7L5/QDS3mfZadOLX
         IwJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707924099; x=1708528899;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5oyh52a4Z6LZhtZWfw+fMmAMgPOOv0etXEzm5yIXrbg=;
        b=G+Gg1AjfqVV6SOeJ7TSOpzbOGhHDkqcCh4HUtBDnHImKEklLaxW12UjRW8U9zI/DtW
         demjIAuLng6OjvaGiYXiWwFaSx5E9dzwTvdv7GxqtqW/tnvBL62Os6t2DF7+F8wyFLSl
         +6U1V1zm8PLPgJ0Dyu+GxZtr7De6P7fs0OWZOxuIrH/5BQd2ZdeGDTP3zaSETYbetstf
         DKcmjGImHBqPuPa4CcM+maCvkCIPdsspnvkjbutnNo9mKcsQul0hAsGXhlo+v8uXYKfD
         PaDA/UYowK79fU0l7PGJ7rzQE7Sla+s2Zy9vGsqulnsN1sACLX4SCmfi8ep8b9qQomQi
         yQiQ==
X-Forwarded-Encrypted: i=1; AJvYcCV4aKVOZqiTx/zXmRrnrDZOT0Asc3C1VOZKOOv8E8byqgGhHRa8RI6B/TgxT3J0iqwr4PyA3hEhHDmWY025cyqPKmIRNhq6D4rrVBstL/M=
X-Gm-Message-State: AOJu0Yx0c0uPs6sJdrkFKrzemPdbi03cdrqFnySn26hyBkupds+mGPsr
	zUs6qVwrvXipuOhZqUcAHyDcfld920VD6p2z+217Thr+WME41axLul98kFn7Cw==
X-Google-Smtp-Source: AGHT+IHzO2QdQXydBdzZ3QSdjAVJIJ6Urlan047+Md4GAyZvGTlau+Puts0aj9uMNb7FnW4uDYOaoQ==
X-Received: by 2002:a05:600c:5198:b0:411:f03e:588b with SMTP id fa24-20020a05600c519800b00411f03e588bmr1504258wmb.0.1707924098732;
        Wed, 14 Feb 2024 07:21:38 -0800 (PST)
Message-ID: <5e0c9d51-b630-4f03-809a-19ad570b4fb4@suse.com>
Date: Wed, 14 Feb 2024 16:21:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] build: Replace `which` with `command -v`
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20240214143411.37957-1-anthony.perard@citrix.com>
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
In-Reply-To: <20240214143411.37957-1-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.02.2024 15:34, Anthony PERARD wrote:
> The `which` command is not standard, may not exist on the build host,
> or may not behave as expected. It is recommanded to use `command -v`
> to find out if a command exist and have it's path, and it's part of a
> POSIX shell standard.

Just to mention it: It hasn't always been. In IEEE Std 1003.1-2004 it was
still an optional thing. First mention of it being non-optional looks to
be in 1003.1-2008, which is slightly newer than the oldest gcc/binutils
we presently support. Still even on the oldest systems I'm still building
Xen on every once in a while, the command form is supported. So not an
objection, merely a request to be a little more precise in the description
of v2.

Jan

