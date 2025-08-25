Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 097EFB33E90
	for <lists+xen-devel@lfdr.de>; Mon, 25 Aug 2025 14:01:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1093081.1448650 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqVsN-0001iA-TX; Mon, 25 Aug 2025 12:00:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1093081.1448650; Mon, 25 Aug 2025 12:00:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqVsN-0001gA-PG; Mon, 25 Aug 2025 12:00:39 +0000
Received: by outflank-mailman (input) for mailman id 1093081;
 Mon, 25 Aug 2025 12:00:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J9Dq=3F=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uqVsM-0001dq-5o
 for xen-devel@lists.xenproject.org; Mon, 25 Aug 2025 12:00:38 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1aa1deb3-81ab-11f0-b898-0df219b8e170;
 Mon, 25 Aug 2025 14:00:33 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-afcb7a0550cso737618366b.2
 for <xen-devel@lists.xenproject.org>; Mon, 25 Aug 2025 05:00:33 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61c312a585asm4906435a12.16.2025.08.25.05.00.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Aug 2025 05:00:32 -0700 (PDT)
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
X-Inumbo-ID: 1aa1deb3-81ab-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756123233; x=1756728033; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=U/q40CYBr21pr1e2QTGhNCNMo302M58nIazAwUfTJxw=;
        b=X8GVZUXAFJV1VuhTMbadIqN3J0VOPuFGK4Z8zYzz8VjJZOrhxemMDKQS4EyYmrt3BL
         44i1//7YSBqjk0EJvPlt1Jl+x5F3Lf/eqQs7WZmat4oBkSoloPTywMS8LN2FfddiwEm2
         zHgcvZlIK9draMjrLtUGoTW+yevn2tYXHPgphhhBa/g9YkYj+2Tbd+V2FnF7XLqFez/d
         5z+7ggRFYKB2WyTaLT+0bmB/LFIdnAOQy3dSl48PwIDvWElVxF6adGvGZp3rx1J59YTz
         PHkbVFTISDWh8OeUSJeyMJFOAH/fOyTsXV+LwKJWtFdJxrORrVw8X8nmYLSulNRyudL3
         sE3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756123233; x=1756728033;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U/q40CYBr21pr1e2QTGhNCNMo302M58nIazAwUfTJxw=;
        b=BUkwYgO8mocREzDgvDmqxv0mZ9qF8g/TZrCnokfLgfh1vtJGfe4d7GRkltjw7P8E1P
         e1qQMj4Hoeqk2fCzNC6kmseQVAfxEbuEcwxvHu6/3+U/gHHcBDlytd2BzwcggMbj39Gz
         Wd6eQ2GqwP+j5ulPjCk2dWhsWlXzfJsoS4Vcvks9Qz9ptkcfWoTZXoAvSesNjAiXLJg2
         kVc2cM2uNAtEbKeLm1R1i/sAK+J1WFdIt57CVXrjqi0FKCXhNaxG+6Hnx/yG6mEaVtNG
         RpAyXBQ33yehdz2s0u09TuejA2F2ddTiYheFz+Cm6LbV4Fm7QBOBlQLnQw4EhPj1sStf
         q+9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUa79hve31FFSM6vxpoA0QRU6VifxkznakPjMZTfgMdyjGkrUmumyvXaHtZVQl7AqWNEqoPBV9fQUA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwacWYH28WFgIbRdwgw9yb5nddfLdAA2s6KmHNBWgtI9Df7dJj1
	jMTpGrj5tpIbmtpvW/1KjNF7XNn44hS2Itm5gNtcG0jbZoQbABCfoT+6NH1y4qtr8Q==
X-Gm-Gg: ASbGnctSYe6PARt/2O3q8PuRqhBCdZI7XO/ST2MWckzgLOQb1+fjc1NSRL9+ymi3cGM
	28Q3hU0bgBiXZ0chEBe/gPUt0eXdE9cMODcfrCUNAfc9ZexxQmHNgrFJPybD/q32Q+ny94ktaNI
	xf6TMmJUpPTZ/QKH2hlUgItB1v/2DtNLk5Q5d74IX0iBnZ1zjkqWuuGJ9F9A/bKmx0J9wuPr/hF
	425NSGGMmilsotDdZ08FDHZFtJjgxBHAjJB3ZJJxl0o+B+/T40tgxsehCFJfeGTPC2x/SSnPkcZ
	NVe6bcx8Ze0rh6WdEXCnXdSq+oAQIahXlkU6ABFU63wpIL/oDOqF9lKL/1q1v6GV0XSCjhe2Eu6
	uOMZU3AABg0pKtSC5oDbeEpvmGIhhe44MwJBlBD2RWWLV+SwYJ7uABNq5Vup4Z6gTWMcdO4nWhG
	iXXzWmUgI=
X-Google-Smtp-Source: AGHT+IFM4V5qJIPGNnThiJ/BsryrD9SoHPyujAck6mAfAiZk3qPWEjmjD3Igd+I61FXfLdk0W0Spuw==
X-Received: by 2002:a17:907:3f97:b0:ae3:bb0a:1cd8 with SMTP id a640c23a62f3a-afe28fc55damr1144493566b.19.1756123233005;
        Mon, 25 Aug 2025 05:00:33 -0700 (PDT)
Message-ID: <1797679c-582f-4b75-a036-ad3bb00bad4d@suse.com>
Date: Mon, 25 Aug 2025 14:00:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v1] xen/flask: limit sidtable size
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250822095123.998313-1-Sergiy_Kibrik@epam.com>
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
In-Reply-To: <20250822095123.998313-1-Sergiy_Kibrik@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.08.2025 11:51, Sergiy Kibrik wrote:
> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig

I wonder whether we wouldn't better move XSM's controls to a dedicated Kconfig
file there.

> @@ -418,6 +418,25 @@ config XSM_FLASK_AVC_STATS
>  
>  	  If unsure, say Y.
>  
> +config XSM_FLASK_SIDTABLE_LIMIT
> +	def_bool n

This makes little sense; just "bool" would have the same effect. Yet then
you can combine that with ...

> +	prompt "Limit the size of SID table" if EXPERT

... this line.

> +	depends on XSM_FLASK
> +	---help---

No triple dashes around "help" anymore, please.

> +	  Limit the number of security identifiers allocated and operated by Xen.
> +	  This will limit the number of security contexts and heap memory
> +	  allocated for SID table entries.
> +
> +	  If unsure, say N.
> +
> +config XSM_FLASK_MAX_SID
> +	int "Max SID table size" if XSM_FLASK_SIDTABLE_LIMIT
> +	default 512

Hmm, wouldn't the default better be what we had so far? As per the justification
you aim at a special case (embedded) with this limit.

> +	help
> +	  The maximum amount of SIDs allocated by Xen. Default value is
> +	  approximately double the size of contexts that default Xen policy can
> +	  potentially have.

Do we need two controls? Can't 0 mean "no limit"? Or else what use is permitting
0 here as a value?

Jan

