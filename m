Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA5C9C051B
	for <lists+xen-devel@lfdr.de>; Thu,  7 Nov 2024 12:59:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.831747.1247116 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t91Ae-0006XX-Mt; Thu, 07 Nov 2024 11:59:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 831747.1247116; Thu, 07 Nov 2024 11:59:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t91Ae-0006V0-J3; Thu, 07 Nov 2024 11:59:28 +0000
Received: by outflank-mailman (input) for mailman id 831747;
 Thu, 07 Nov 2024 11:59:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aElt=SC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1t91Ad-0006Us-Kw
 for xen-devel@lists.xenproject.org; Thu, 07 Nov 2024 11:59:27 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bb5925d9-9cff-11ef-a0c6-8be0dac302b0;
 Thu, 07 Nov 2024 12:59:24 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-43193678216so7959585e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 07 Nov 2024 03:59:24 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381ed97ec9fsm1575177f8f.42.2024.11.07.03.59.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Nov 2024 03:59:23 -0800 (PST)
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
X-Inumbo-ID: bb5925d9-9cff-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjozMzYiLCJoZWxvIjoibWFpbC13bTEteDMzNi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImJiNTkyNWQ5LTljZmYtMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwOTgwNzY0Ljg0MDc4Miwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730980764; x=1731585564; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qkxdXELn6uGvYAe2la3v5eI3YvZUMuagryUdI6NwtYU=;
        b=Hm2XnrJRvZqmCRK8U+AqzPLk/qnRia4qlmQeqFpVLYoLNDyW8YlpUTqMiuz9f6dIyr
         REduE6u4VfJTRt3saKc5ILmw8d+VBDJvJPKqAVsqmWNpK6MsLmigRXJ9bqODfu9Tm5BN
         l2gKGiD7qYIPhiBIyAy9OEpYIA7p895SmenHuXv8F2G6zh7S5RDOGhFQTWnhcAag6cKG
         ldc3GxqHzv/Nc7tanz62o1ia84GTGIEGC/da97TMtdMoZ8wuDPI4QNpuzLTKGlCfGO5y
         P0nAuoVO4OfIfaSlXF7u66prqnxrO+zYOBfr2mVZl9VoNBZKD1/gSDpz38ZIUeydc6ty
         xv3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730980764; x=1731585564;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qkxdXELn6uGvYAe2la3v5eI3YvZUMuagryUdI6NwtYU=;
        b=D3QgacoS8vyUt2773Pux9Ro3fqHejNUDuDOWLIw7rOn6wzgGOLZ0M3yfHvRIV0gHXi
         Kkj12/133ybRZn5N3K3Arf9vDdCyAwKGEvQqXw7lQwcAiGUvar+bTafmhPoPglcyIaAD
         +TQ2HR6ToQHRnt6uM7ayl1482tUCs0KBpNcwLaHPntLXkPed2+cynXZubduDw8EBkSkX
         WdmEK52ZnxPU471PhFB8UJLyd49KWSaQQjhprCW7Zu1Rp0eyk9BhawrbYc5X1czH1Nf5
         eW+/vYdMYcH4zAq2femE4P61zP/m6o3HJB6Kh4rHINkAu50w3iKIVXAb6wjd/FKm4HPa
         q6zA==
X-Forwarded-Encrypted: i=1; AJvYcCVdlGRdQvo6onMvpNhQHH5cSTb4BPMex7NxomZvU9udF9ioQ3hXsIARPm7uPpHGYQojxqgT34Kcph4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YytAVdA51qjrfmr9EBxvsWOpQwRzcV+EJvXVd0uZI/ya9D0BLw7
	JmxXj4VZmmD4hvkx32TPGIU+pU0fDmXCyMicd6E1Nx+6on0XMtN8e93QEUKnuQ==
X-Google-Smtp-Source: AGHT+IHHYSJeOPw/WlQ++Azx+McRQ2WkjwcqY9yb/3NiSV1HI4CLiwuBFmlDS//p4cFz7pmJ0XSXdQ==
X-Received: by 2002:a05:600c:350b:b0:42c:e0da:f15c with SMTP id 5b1f17b1804b1-4319acbb947mr344459005e9.20.1730980764153;
        Thu, 07 Nov 2024 03:59:24 -0800 (PST)
Message-ID: <554040b0-bbeb-46db-80cb-6ac512b2edbe@suse.com>
Date: Thu, 7 Nov 2024 12:59:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] x86/setup: remove bootstrap_map_addr() usage of
 destroy_xen_mappings()
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20241106122927.26461-1-roger.pau@citrix.com>
 <20241106122927.26461-4-roger.pau@citrix.com>
 <c8620982-37b5-4556-9061-5dbf5778a43a@suse.com> <ZyyqibpW2dFg5hOQ@macbook>
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
In-Reply-To: <ZyyqibpW2dFg5hOQ@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07.11.2024 12:54, Roger Pau Monné wrote:
> On Thu, Nov 07, 2024 at 12:23:51PM +0100, Jan Beulich wrote:
>> On 06.11.2024 13:29, Roger Pau Monne wrote:
>>> bootstrap_map_addr() top level comment states that it doesn't indented to
>>> remove the L2 tables, as the same L2 will be re-used to create further 2MB
>>> mappings.
>>
>> With that I assume you refer to the 2nd sentence in the comment immediately
>> ahead of the function. According to my reading, it may imply what you say,
>> but it certainly doesn't "state" this. Imo the problem was latent already
>> before, if BOOTSTRAP_MAP_{BASE,LIMIT} were changed to cover at least one
>> full L3E range. Which isn't to say that ...
> 
> Hm, maybe I've implied too much from that comment.  What about
> replacing the first paragraph with:
> 
> "bootstrap_map_addr() needs to be careful to not remove existing
> page-table structures when tearing down mappings, as such pagetable
> structures might be needed to fulfill subsequent mappings requests.
> The comment ahead of the function already notes that pagetable memory
> shouldn't be allocated."

SGTM.

Thanks, Jan


