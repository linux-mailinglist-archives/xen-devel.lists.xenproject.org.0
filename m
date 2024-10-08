Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C341299479F
	for <lists+xen-devel@lfdr.de>; Tue,  8 Oct 2024 13:49:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.813035.1225832 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sy8ho-0002s8-Jq; Tue, 08 Oct 2024 11:48:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 813035.1225832; Tue, 08 Oct 2024 11:48:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sy8ho-0002pi-H6; Tue, 08 Oct 2024 11:48:44 +0000
Received: by outflank-mailman (input) for mailman id 813035;
 Tue, 08 Oct 2024 11:48:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Vy9o=RE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sy8hn-0002pa-RN
 for xen-devel@lists.xenproject.org; Tue, 08 Oct 2024 11:48:43 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 44626749-856b-11ef-a0bc-8be0dac302b0;
 Tue, 08 Oct 2024 13:48:42 +0200 (CEST)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5c5b954c359so6361777a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 08 Oct 2024 04:48:42 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a993ea3b890sm436639666b.167.2024.10.08.04.48.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Oct 2024 04:48:41 -0700 (PDT)
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
X-Inumbo-ID: 44626749-856b-11ef-a0bc-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1728388122; x=1728992922; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5FlZ+2220PNV0hgipAHf1HFiXKJ01L13PeHf5yRAK7c=;
        b=B+dxREMjvqk3edXl4tYL38ZdpfaF9X4/R38+Sd5eraIGYSbxSU9KW5K/ux9jf08sVO
         MBbcGNXySHm5ZTRe/4iufTY4XkrmcvqP83x/9gHQ/m3AiKUPf6ZsObkFhXFIU/E6aN5O
         CI1SiZLsBUsITGNnhSzG2ghn+ArY9HbAbcpnye0xaLADUqiytZ20jgixku2V2SLZmLTA
         zjyx9IpMJvr2GK/DtdgSf1JBCERpq5mkAxpFChLDmtDGg7SC2UljENIhzziMA/Szz/5R
         aIlmqfxMSvEym1eAqzHw9zI1QDANhraJd7Y6S6cvvZ/jvK1RlHBB+GzacUiZVjJ2nwBw
         JAbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728388122; x=1728992922;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5FlZ+2220PNV0hgipAHf1HFiXKJ01L13PeHf5yRAK7c=;
        b=OL4Gro23He7ReUTkpNQ1U7/WTyfwslSYS8Gci2YRoK3bN8rL29e9gLF0rqgxQOt8sW
         R56qjPM28nuF6MfwTy4r1xMiPAfd5PcEfnrLz0ANJMSHgybMQs/VvYiGnijrJ/c3ePui
         Lphs+cE3VX9NqnFEvR1g6es1cJNX/uOus+8D7orQydU9BLFx8tp9PpMybPOo9637CsFw
         0i2WAqf2twe8xsFiZQCbNCWEGwrHbs5yMITnC7bPo6bjH6r1KqU77XrFmS9WSeuHSL7A
         iPHJ5PajHUHsN1u/LowjlIwAKs5Unv7DqOBgLsVP4gTT8sCqSZhvgr9sMOLtcDcMi0Vc
         78xw==
X-Forwarded-Encrypted: i=1; AJvYcCXsT48+XNYygZ8XpHBYFB2VIAwu17hqqe0qb5rk16mkMZ2IxXH3pr3pwswBbjRcvTZ6bzetO46KILE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwIjkycjy9HOz9KEo0krAeVm60LtCyr/WLouANahMrZxQ7B6AsF
	EV612V6viwE52KZz56j8oeq5pTw3qo6+XFzqYSriR1ngs1+Oan8Li1RkeJUBQw==
X-Google-Smtp-Source: AGHT+IF5mUqzkTJE/j109mGmy0XS3vDZ4u1qE4Me0FVp1Qdk3oWsMSV52z6rBOY8mgxySa+01H3Yvg==
X-Received: by 2002:a17:907:94c3:b0:a7d:a680:23b5 with SMTP id a640c23a62f3a-a991bd79fc2mr1821299266b.33.1728388122188;
        Tue, 08 Oct 2024 04:48:42 -0700 (PDT)
Message-ID: <2a020197-e061-4d8d-9d49-df7878153d85@suse.com>
Date: Tue, 8 Oct 2024 13:48:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] MAINTAINERS: minor file line update
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>
References: <20241004111127.897937-1-frediano.ziglio@cloud.com>
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
In-Reply-To: <20241004111127.897937-1-frediano.ziglio@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04.10.2024 13:11, Frediano Ziglio wrote:
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -517,7 +517,7 @@ F:	stubdom/
>  TEE MEDIATORS
>  M:	Volodymyr Babchuk <volodymyr_babchuk@epam.com>
>  S:	Supported
> -F:	xen/arch/arm/include/asm/tee
> +F:	xen/arch/arm/include/asm/tee/
>  F:	xen/arch/arm/tee/

I think this is a change which actually wants ack-ing by the maintainer
named here, not THE REST. Cc-ing Volodymyr.

Jan

