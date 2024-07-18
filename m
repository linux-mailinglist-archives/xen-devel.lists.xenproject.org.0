Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A32DC934D91
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jul 2024 14:57:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.760488.1170344 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sUQha-0007To-L9; Thu, 18 Jul 2024 12:57:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 760488.1170344; Thu, 18 Jul 2024 12:57:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sUQha-0007R9-Hu; Thu, 18 Jul 2024 12:57:42 +0000
Received: by outflank-mailman (input) for mailman id 760488;
 Thu, 18 Jul 2024 12:57:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3WUc=OS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sUQhZ-0007R3-Na
 for xen-devel@lists.xenproject.org; Thu, 18 Jul 2024 12:57:41 +0000
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [2a00:1450:4864:20::22c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 50ae4a00-4505-11ef-bbfd-fd08da9f4363;
 Thu, 18 Jul 2024 14:57:40 +0200 (CEST)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2eedeca1c79so9080011fa.3
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jul 2024 05:57:40 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fc0bba6fc7sm92389615ad.68.2024.07.18.05.57.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Jul 2024 05:57:39 -0700 (PDT)
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
X-Inumbo-ID: 50ae4a00-4505-11ef-bbfd-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721307460; x=1721912260; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Ka23dX3a+9UCnzxhLCXehkNWsS0FHC7AuqraVYGsPrk=;
        b=Pt0ko6xavLaKy2I8nnK/W/8H3hA3KBrY7xAJ5iYFkN9XltRs7t73ap+CdeH4002udA
         VINTeWxlOKBfvEg8uPJoSzrY/hNunBPAaXcOqK7wNI/OiUlNosJ2wxZYxqGqTc46mxlA
         geyuMfKJnDz0BAmbGZNwD8Netrx/IoDg5v1tdo2ulNYZIoIDURxQdUIAofHPYxpo4OsH
         ffcNXMTGyBACPYV16JYiuXVmydi+JJRjAXzk3AsenhdyS17x74fr69Q1dt5BvlhnT3DR
         cTvZs4K2WKSyiFBvzNIkvCC6rf60lEyl5M83AOweG71LemSmLBAvL5Bd5dKvo87OJLNX
         efzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721307460; x=1721912260;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ka23dX3a+9UCnzxhLCXehkNWsS0FHC7AuqraVYGsPrk=;
        b=ssIM/fWSmRiRqutBG7OVHp8bzbP9/MokpdmJPLkYCwuZRBdx1tMvKcUw1EzZW2bJc+
         XvqqpwIzwL0s1iQg6yF2Nsh3fOs9Q8rRSy/zBbD70TLqcdl4bVwSYI3bSfD06NHS2c+n
         njCCtP2X4O/ranutUPxNM8Nn7VLUWmkhKYiPbjNAoa+PdJZGHqL8N4xvsUDgV/yOAySb
         PC85Kz2dwvOAUiZ76/aY5vm1SztIWbxu7aTyL4+hRUvMfiBPqJRkOc1mmh4c54XdcuNg
         H0XtpK/xOnEmqGSaU8QpvTEk60JlL9MRhA2XytNYuRfV+JAwZG/CXGkoHkJB+ZdV1QQ0
         fXyw==
X-Forwarded-Encrypted: i=1; AJvYcCWrUwMrN4SE0pj8m5vNtp4LUC3sc/gXHYwS76PRveFD/Bg76PM0s0fAqVITtVft/2qFchChiF6Q70sSlkbXT956hnSZjds26r2TT9pt9qY=
X-Gm-Message-State: AOJu0YwAruS6ItImyVJ6gdz2omRQYFU4tDjTKqMhmOb4uB/yvEGaaaX6
	zR2be2D3L+8CwRTbVmaAbT4EzgKINnVf95555kpIzL/gWX9ILH9k3UgrCdPbxg==
X-Google-Smtp-Source: AGHT+IGtOZwGcKw6hbi942ThB/vDwF4RpTCmBE0gRGRWNGGz/n0ZzoTw6Xp4J61ctkzBX/sxf+xYkA==
X-Received: by 2002:a05:651c:209:b0:2e5:61f4:2c11 with SMTP id 38308e7fff4ca-2ef05d47780mr18717061fa.45.1721307459776;
        Thu, 18 Jul 2024 05:57:39 -0700 (PDT)
Message-ID: <896414c2-1c87-48e7-a79e-518443ecb5cc@suse.com>
Date: Thu, 18 Jul 2024 14:57:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: drop CPU POOLS section
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20240718125251.27163-1-jgross@suse.com>
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
In-Reply-To: <20240718125251.27163-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18.07.2024 14:52, Juergen Gross wrote:
> The CPU POOLS sections in MAINTAINERS can be dropped, as the SCHEDULING
> section has the same maintainers and it is covering the CPU POOLS files
> as well.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



