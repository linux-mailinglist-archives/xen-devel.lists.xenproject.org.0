Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25538845A09
	for <lists+xen-devel@lfdr.de>; Thu,  1 Feb 2024 15:21:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.674467.1049399 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVXwT-0005VZ-5F; Thu, 01 Feb 2024 14:21:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 674467.1049399; Thu, 01 Feb 2024 14:21:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVXwT-0005T1-2b; Thu, 01 Feb 2024 14:21:25 +0000
Received: by outflank-mailman (input) for mailman id 674467;
 Thu, 01 Feb 2024 14:21:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XFwQ=JK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rVXwR-0005Sq-M2
 for xen-devel@lists.xenproject.org; Thu, 01 Feb 2024 14:21:23 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2cda519a-c10d-11ee-8a43-1f161083a0e0;
 Thu, 01 Feb 2024 15:21:22 +0100 (CET)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-55efbaca48bso1327702a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 01 Feb 2024 06:21:22 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ev20-20020a056402541400b0055a8fe70387sm6856536edb.1.2024.02.01.06.21.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Feb 2024 06:21:22 -0800 (PST)
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
X-Inumbo-ID: 2cda519a-c10d-11ee-8a43-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1706797282; x=1707402082; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9bIqj/x+kRtQHMH7oFV6HTCiWYHXei4IpsdLUZpA3ac=;
        b=O9Lm3MGY1790qmS18+KgOFjBY7j6xnKcmtyor6rVRuDcagJVZix9kPyiuiPkceob0k
         U3tiFSzJ65x8iVS8/dSrBIbNb2HH9DpJ1y61cPSpIrDe6RKOVGRVoxx9YT16BwQc3/SI
         PyVfBpBi19wzY47lelteiuFCSSb1i3hJSzH7IyPkE8sLMfh7cHQi/6R6oiWa/iF0fpwA
         4yOuR3brwEcnABSj7nIwgDjUHg1urpf/eJ8e/3PDfaV5S9xYV+3ldIfrTFJtlJ2oaJxx
         AfXEJi2YBzLdefVeJenOieHuZpF9zHefFoRbSl6v39+NAwA2+wQyGOYvwo9o8me0voMV
         4lJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706797282; x=1707402082;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9bIqj/x+kRtQHMH7oFV6HTCiWYHXei4IpsdLUZpA3ac=;
        b=HUnHYKdImpq4pe5lCjlqAvXkwOlMLV+bI+y7vCAOnR9hLNUbJtuaaiZKHb3p349hZj
         J1YXqsXukNdqehUzBYMeNU5XNtENvnJGOkvHwA3w+d+ewNJVQ4OZTMiZhnbTJhOaTm2k
         MwvuXyS/Qm3xObX1FAaBbezCRG8YSz3olmVnc9+3rZULbf9JqkIGWA7a/56U2JJp1aUT
         rgPDR8JRRtjIxW4fsbMfdUxhyyYMRbMjifP5HNUffl6w0p64vGu0N52i2sDuOIlxb/Fd
         XbiSFhiAh67por84vPFL00+nBiabHcuSEni9nZVUoj8+rWts5Vz1ZP24WTTERqaUUcFM
         T7ng==
X-Gm-Message-State: AOJu0YyE2GjWmLBi6xddNbwn4C5SMnMJFd7JC62vTIzpZMarA1H43Y4N
	LttyUqKP0bvrbOGnhwUBJ5U7bWLbi5ywRVObnLhc+pJqDTB4eAE1n2wOBcG86g==
X-Google-Smtp-Source: AGHT+IHCDcO+re9/6Et4j8ebOHRgtecY3ijparwiGLDuHCxKvvYmoiX3hLEoeuPhAczJQE0sHExA6Q==
X-Received: by 2002:aa7:dad4:0:b0:55f:9337:7a22 with SMTP id x20-20020aa7dad4000000b0055f93377a22mr3417898eds.12.1706797282349;
        Thu, 01 Feb 2024 06:21:22 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWFab+X+uzE+y11Wu0iDF0hKJmFcX1Tb7+ot0Zuwaty3uexfiBTXOG7YXtL/+WA9U2WN0WYx29MS838tRnolMZ2MUizM5coZc6/QlMK2Ra4et5kigclXvGcKtNezq6lMGZCcn5ppjw+q7vZ5lMEdqqKbjQ8ansIm0crGbiRRRRJZl0C1C+dgJT19ysQuEVtKKNhRtlplQ4v5VTXexPg6PFfBNi012w9hVeWRnzOuYlBZTtB0zeW5Qk=
Message-ID: <a881fe27-0e3e-49ad-8340-71fabf92ea7e@suse.com>
Date: Thu, 1 Feb 2024 15:21:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 08/15] xen/page_alloc: introduce
 init_free_page_fields() helper
Content-Language: en-US
To: Carlo Nonato <carlo.nonato@minervasys.tech>
Cc: andrea.bastoni@minervasys.tech, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20240129171811.21382-1-carlo.nonato@minervasys.tech>
 <20240129171811.21382-9-carlo.nonato@minervasys.tech>
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
In-Reply-To: <20240129171811.21382-9-carlo.nonato@minervasys.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29.01.2024 18:18, Carlo Nonato wrote:
> Introduce a new helper to initialize fields that have different uses for
> free pages.
> 
> Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>

Acked-by: Jan Beulich <jbeulich@suse.com>



