Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F3F8B98D8
	for <lists+xen-devel@lfdr.de>; Thu,  2 May 2024 12:31:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.715743.1117602 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2Ti6-0004rT-Qh; Thu, 02 May 2024 10:30:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 715743.1117602; Thu, 02 May 2024 10:30:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2Ti6-0004on-Nb; Thu, 02 May 2024 10:30:42 +0000
Received: by outflank-mailman (input) for mailman id 715743;
 Thu, 02 May 2024 10:30:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=G3ja=MF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s2Ti5-0004oh-MS
 for xen-devel@lists.xenproject.org; Thu, 02 May 2024 10:30:41 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 05caf24c-086f-11ef-909b-e314d9c70b13;
 Thu, 02 May 2024 12:30:40 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-41b5e74fa83so52147515e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 02 May 2024 03:30:40 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 j12-20020a05600c190c00b0041c120dd345sm1473860wmq.21.2024.05.02.03.30.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 May 2024 03:30:39 -0700 (PDT)
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
X-Inumbo-ID: 05caf24c-086f-11ef-909b-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1714645840; x=1715250640; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/rq7/ynN2o7FWKC7uxnqCcCkIGlhG+l7/ws7B6xYfa4=;
        b=VI2rMbXIrvRDwmA9PWelQ2/vsZVEobSyiZlAda2maEfhO8h7FQ3/lgpZV04STBjglu
         IC9b6Qp4Sf2LF7vKjlA6jkUXlSQwExEyTXq4ZmfDFgYR6XDjyML2KY9J2DYKeng7qdwm
         nBtGB0ay1qXAbVtHXm+CNfsTtM5AlLqEdFkVxbDW2iLm5AYsL6MAd+74NOOCXkz/U7SK
         x4i+6yqw3suVxicOetdOPnVJDaHkjDrNZu+DsNCmBMqqIEN7LpyXCVdzUDwO4Ua51P6k
         3DUO67grHL6gqEWT+cZf0Q25M1FMTH1f5Vetxcg2/QTZ2QmI4rjAeT87nUrD6hJIxhX4
         rhqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714645840; x=1715250640;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/rq7/ynN2o7FWKC7uxnqCcCkIGlhG+l7/ws7B6xYfa4=;
        b=kDo5CirRLQKTIsuxUBdZ8qd55xsexeLv7QhdgBFX5+v/eK3/5AgPeMyGwIcn3ySIKU
         hMxE1+jkuFO2J6VRL92BV3aldyty0ZQd3GdRPOq8a+oNHwyMNQi9cWhSNQAFS8uHZW+J
         AqajL5D5CkjSqYWL+qhZ6ZzGJ2iFjUN+X+6VUJs9VmbobDl6j+w90h44ww9EsPrUwsRs
         5tnn/b4M9k87O/5J9iyO76sTQ4HINxprrKjpCpIJI2vb3lKnjbzssFLW2sSSqls/UcDO
         HOXY4SgNVBgSuqy5BxEK4VnY7i8FMszNXrTzSskQQLo13fmBDaKn2HODCIAKAt7CqZNO
         mujQ==
X-Forwarded-Encrypted: i=1; AJvYcCUpvC2tvRrwq2S7WnW85lPRiOr/iOvf9tO04G6L0SDloJoSpRNcdBNCihdvSDyBcsbnwdsZq6rBzrPUreN8Q4lQsxAz6ZDZiTDLxI5uPcI=
X-Gm-Message-State: AOJu0Yw/ITEpqjhD6lLsceXXp2VjaYQ5RhbvicdCRF8Pj0zuMeq74Hl9
	w2xJ6Tyj3IV6Imuv4eoHH5csCtU6OrsAv3hcGbT+ClDjTngCEjbaTfmu7j6PnA==
X-Google-Smtp-Source: AGHT+IF6z6BXLMBnB4ym4My21VZCZnICg1ooYHpgMoNG9iwD3uOi34qk6r69v3vRKUERpkUUbEYqfA==
X-Received: by 2002:a05:600c:1c26:b0:41b:e84d:67a3 with SMTP id j38-20020a05600c1c2600b0041be84d67a3mr3272754wms.0.1714645839909;
        Thu, 02 May 2024 03:30:39 -0700 (PDT)
Message-ID: <be052201-8e3c-4bd4-800b-08a5f717dcdc@suse.com>
Date: Thu, 2 May 2024 12:30:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] xen/arm: Fix MISRA regression on R1.1, flexible array
 member not at the end
Content-Language: en-US
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: "consulting @ bugseng . com" <consulting@bugseng.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20240430110922.15052-1-luca.fancellu@arm.com>
 <20240430110922.15052-3-luca.fancellu@arm.com>
 <327c7e42-9b59-4925-b746-0b59dbb5a3fb@suse.com>
 <91B23E5F-7515-4C4E-9FBD-57654980905F@arm.com>
 <de09e134-0150-49ca-8338-a0f4759c218b@suse.com>
 <29573F6B-BE27-4A65-A310-35883A39F989@arm.com>
 <af1116ad-6401-403b-a3b8-abe421e2e3da@suse.com>
 <2DF15520-B0A4-4972-92F6-FCB6BB852292@arm.com>
 <4fee2998-e29b-43bb-855a-8600dbef9f13@suse.com>
 <6A50BE71-7F92-4B7B-9A58-1D3A084FDA3C@arm.com>
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
In-Reply-To: <6A50BE71-7F92-4B7B-9A58-1D3A084FDA3C@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.05.2024 12:12, Luca Fancellu wrote:
>>> In any case it would be used soon also for other architectures using bootinfo.
>>
>> Oh, would it?
> 
> PPC people have plans on putting that interface in common:

I'm aware, but ...

> https://patchwork.kernel.org/project/xen-devel/patch/451705505ff7f80ec66c78cc2830196fa6e4090c.1712893887.git.sanastasio@raptorengineering.com/

... I can't spot any flexible array members in this patch.

Jan

