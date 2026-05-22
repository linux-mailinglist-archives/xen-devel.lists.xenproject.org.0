Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yFSgFcDzD2qXRwYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2026 08:12:16 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAFBC5AF67B
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2026 08:12:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1316292.1585681 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQJ63-0005YA-Ql; Fri, 22 May 2026 06:10:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1316292.1585681; Fri, 22 May 2026 06:10:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQJ63-0005VJ-KO; Fri, 22 May 2026 06:10:59 +0000
Received: by outflank-mailman (input) for mailman id 1316292;
 Fri, 22 May 2026 06:10:58 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wQJ62-0005VC-FP
 for xen-devel@lists.xenproject.org; Fri, 22 May 2026 06:10:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wQJ61-00FvU7-BV
 for xen-devel@lists.xenproject.org; Fri, 22 May 2026 08:10:57 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0ff36d-e002-0a2a0a5209dd-0a2a45058d00-12
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 08:10:57 +0200
Received: from [209.85.128.48] (helo=mail-wm1-f48.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0ff370-aaa8-0a2a45050019-d1558030cd07-3
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 08:10:57 +0200
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-49042aeeb75so5638215e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 23:10:57 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49041740ce6sm14484595e9.0.2026.05.21.23.10.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 May 2026 23:10:56 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1779430256; x=1780035056; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Vr+hb+WkMc79ZoAuYkUjo1uULOV4gEl7hC1nxznXQ5M=;
        b=Y1Yo0jqrs+NZgXyDjj+MrCmDQ7RGRjH5sfVYXX5IGBtpfDwnp59QXbl3XGmykivnI/
         tKhqOTGTvHylGY6EUBsyKXOEmLeaB7gj2eK2xczeiuC4UkFJINtPy6hlNP9xDQYx8Rv+
         yt+Qx4zYm8xo3tObh7eJZKtJ/HFZrrbTjc3bJaHTLm6rXPm2mMJnW9lAd6nTq6VxvIZL
         XJ6WAcmkx4keU5muvUPxN53Vh/5FIFnasGvRIsZUc+rmzeUfD6mO8ROBFf5VvikMwjMS
         D3uXWMb3c5MlpzxvAB9RvVxQVxmaLtM4ZrOOA76zPk4FCTmBfOTdN145JBlp5NJY09Tt
         JjOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779430256; x=1780035056;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vr+hb+WkMc79ZoAuYkUjo1uULOV4gEl7hC1nxznXQ5M=;
        b=WYD7fCvdJHJ2VEpWq2Caak/01P2lYIyGxnxVRVEjZrA2vqAl87qODG6WxykWjToocd
         IiVGaUXzN+LcqKgQzisCWn/PwplRWKX1ZXR2Hgu89Pg5axcXXAM/iKSypaR5YnHv/Jyk
         7DtSGlRKtmUXLEN4Ewk1pN5Ep3+DhwiAgQAvWE8jjjH7T2xfWz7f00jqE9sXbjdnUId+
         TODyqh90yZzujrZM9CTuMCr5MnUyv0mPlErZKGr+Xen/6ES3J0E3bfZMbmysdDgpO9v/
         tmI4BR6cXVm/K0rsMCEPS6Q9oD7X/ocD5Z++QTfAZFUVpmuu1/4gnpyhA9XxFSkJjwQd
         qx4Q==
X-Forwarded-Encrypted: i=1; AFNElJ9cSYRbgZPRzwAGmeTSAbXuxDzvHTr6OT+HkQy7z83Ll4n5ftm6LW9vjJJxfRZSAtFd/PRlrTzrhII=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxCH0jTaWuoqbgBllZ/dzB9jxZngD7r/OscOTEC5rSljvFKQrcK
	gxNSvqMlLYT4OT06x7p8ClnwsH61c8G1HhOyYXldwFBYZ58/fn3QTfvQijccHMUfHw==
X-Gm-Gg: Acq92OF6D9HUu763NwJyEy9tts0Ea9BhG1Gb8kDbiztq24nr34DszlBk6zjlgEpD8Lj
	RnraYpbFDgnsvJYFEMQyt5BizHCirBM2/A7C1IlyzHYXCtUNJokAjdscrOD1L4BMgjgnTYR7iYC
	V/sXlM0OaXKE7SXyAo7VwQacL/9r1Fiv9l9qlOVH0jAxmyTBN58JHGy+gTG+c9Pqwsgv2kMGQ3p
	HLWIYkCAACm+tF8mbaw/xSWvYXkhYxEM3dmmK95tUdN3pMoTzNtDvHpq0aE9cC2enIXtoN4io4Z
	plwkkaChnR12Qfz1Ow2e1Jpt3Ga+o8qzdY4AYFuiciIjuGu1eokRN7oZO7G3Vc0WblqIFJBvVfb
	aYm+2w3wnerj3IrOsuwtzEDmwkuYx5JMZUJJO7AgGb7EuIA58JfMox9RLJr4UW1U2zCjMdSAEmv
	T9M553iSfCGNpu5eZOAZA+i2w7yArqB/r+z5gOuPTKaylzh+Kskzw59PhHvMPqePQNd6VNN4jwJ
	7G9yNETGDNd/js=
X-Received: by 2002:a7b:cb8b:0:b0:490:3fdd:d353 with SMTP id 5b1f17b1804b1-490424ad5d3mr15379015e9.8.1779430256659;
        Thu, 21 May 2026 23:10:56 -0700 (PDT)
Message-ID: <dc95a208-6721-4735-84af-4a3864e9d468@suse.com>
Date: Fri, 22 May 2026 08:10:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/decompress: resolve MISRA R5.5 identifier/macro name
 conflicts
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <69ef81a2f85b35e6231ae389bf271cad2bbd7dfc.1779394622.git.dmytro_prokopchuk1@epam.com>
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
In-Reply-To: <69ef81a2f85b35e6231ae389bf271cad2bbd7dfc.1779394622.git.dmytro_prokopchuk1@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1779430257-E1F9C443-AA99A470/0/0
X-purgate-type: clean
X-purgate-size: 1283
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dmytro_prokopchuk1@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: AAFBC5AF67B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 21.05.2026 22:18, Dmytro Prokopchuk1 wrote:
> Convert 'malloc' and 'free' macros in 'decompress.h' from object-like
> to function-like form.
> 
> The object-like macros '#define free xfree' perform unconditional text
> replacement, causing conflicts with struct field 'free' in 'page_info'
> unions. Function-like macros only match when followed by parentheses,
> allowing 'free' to be used both as a macro and as a struct field without
> conflicts.

At the same time function-like macros cannot be used to e.g. pass the
(underlying) function pointer to a function. Likely there aren't any
such uses here, but imo this aspect needs covering in patches like
this one.

> Applying function-like form to both 'malloc' and 'free' ensures consistent
> macro style.

Not quite, seeing ...

> --- a/xen/common/decompress.h
> +++ b/xen/common/decompress.h
> @@ -9,8 +9,8 @@
>  #include <xen/types.h>
>  #include <xen/xmalloc.h>
>  
> -#define malloc xmalloc_bytes
> -#define free xfree
> +#define malloc(a) xmalloc_bytes(a)
> +#define free(a) xfree(a)
>  
>  #define large_malloc xmalloc_bytes
>  #define large_free xfree

... these two in context? IOW if you mean to achieve consistency,
convert these (and whatever else, if anything) as well?

Jan

