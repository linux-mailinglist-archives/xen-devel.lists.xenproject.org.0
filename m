Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75FED84CBD5
	for <lists+xen-devel@lfdr.de>; Wed,  7 Feb 2024 14:43:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.677600.1054308 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXiCh-0005d9-Lx; Wed, 07 Feb 2024 13:43:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 677600.1054308; Wed, 07 Feb 2024 13:43:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXiCh-0005ar-JI; Wed, 07 Feb 2024 13:43:07 +0000
Received: by outflank-mailman (input) for mailman id 677600;
 Wed, 07 Feb 2024 13:43:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EHwQ=JQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rXiCf-0005af-Hj
 for xen-devel@lists.xenproject.org; Wed, 07 Feb 2024 13:43:05 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d161b6af-c5be-11ee-8a49-1f161083a0e0;
 Wed, 07 Feb 2024 14:43:04 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-410177e41a8so3525465e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 07 Feb 2024 05:43:04 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 n10-20020a5d484a000000b0033b43d7394bsm1549474wrs.55.2024.02.07.05.43.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Feb 2024 05:43:03 -0800 (PST)
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
X-Inumbo-ID: d161b6af-c5be-11ee-8a49-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707313384; x=1707918184; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=w35KGoAZ1nHlL9t8pX78QfY6RGIg1FbLlK/ZBQm81iA=;
        b=KYqyrHZ7QOm4nMnskFKNGUJKMbNMMScSOmjbYpxyQOONG8O8A3DUHGlBS8p8+U7XRm
         OIaFYSXsOYnIRvNMixgRY3Eb+q9lFPl5KHKY0USinnT1NRSRqNPU7ulEdivWP0PieCbt
         Go/cZvbAuKIS3iolBZkEPCuACen5ZGs+f9Jd+IIOuP9SPQh2IEcidIdyu5RIBWHU5oR4
         Y1dmIEomCehja46iiy7jX5EjDFDQqe6txff9sWGW3ZLZNORbZLo9cdelSwoxPcdrgoCW
         7WlnU0WUISC4kTTgnRbUBakXq/81iWkBEF4f7xklvoo8IxFj6XtS4I4qQ/w/Vmfh+NBp
         dgfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707313384; x=1707918184;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w35KGoAZ1nHlL9t8pX78QfY6RGIg1FbLlK/ZBQm81iA=;
        b=JouECdIEJucO0CbejGlbta6NOe0Q55uWCjdHcSm0kIFQiVhyUW4AVeW3/AxZPg25Lc
         XdoKipF4oxDZUwH7iAzVEihmfyk8gqVNa/o7Dh6o0OaYQUSW9Sj1Yl4HDAVYNGr1sWfT
         DUBvQkha3PlQ0BSLPTIn05QZZlNubRt5D4vMULr/whYxXMKsg18pVLMXjp7EIvaUX00V
         pQ1+Y3JG/LumuOiGZbZE3KWGkxKv2zE/DbE6QTbkkvL5NWFjPwS1rpXUUe1r5V3CpA/P
         PpHOp+IjPWhWds76d+6iaGBt690elyqESBdRaCWC9hsyWLqE7ElLH62sq44hiqc73+r/
         SRyQ==
X-Gm-Message-State: AOJu0Ywb3A/BC1M/X/8padBKN4GJjXwnTikII8LRspsdljn6Zf+1Dxhj
	ZqnnZ7owBMkk8QYdYEF2hnp0ytKziS6cPxQchRFZdhcZUG4awghssSUVgNmgTg==
X-Google-Smtp-Source: AGHT+IGhQkJZqlqi6yW+I6EXTHNWpdRdf9y0oYiaikIQg2MUuoXV5GZkrJjZvtBmPTS9Nnca+FKGOA==
X-Received: by 2002:a05:600c:3516:b0:410:273:c662 with SMTP id h22-20020a05600c351600b004100273c662mr1851611wmq.17.1707313383904;
        Wed, 07 Feb 2024 05:43:03 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWt84xqOnYEtxj/eC2S0h0GwYsOa0LvXNjrKpoDmgsIWZiod5YGAJ8XLegTHeRwf/w4SvfCK7iMZ62C8zAaGmdvMPt7HnJw52v+tA+g6ztEL+5h1XflorsaHFMJpfTPfMCq/f56cyyK0kagP6g3CmrRzucbn2AByBtuIorpDQrwxmeL/31drqczH41ExWdxGB/7JwM+dxCPbYpEsQY=
Message-ID: <9d96ef9c-1fc8-4405-914a-fcddb8ba1d4a@suse.com>
Date: Wed, 7 Feb 2024 14:43:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] config: update Mini-OS commit
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20240207133106.6185-1-jgross@suse.com>
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
In-Reply-To: <20240207133106.6185-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07.02.2024 14:31, Juergen Gross wrote:
> Update the Mini-OS upstream revision.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



