Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9483C9D0B4E
	for <lists+xen-devel@lfdr.de>; Mon, 18 Nov 2024 09:58:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.839162.1254978 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tCxaP-0006Ah-Cl; Mon, 18 Nov 2024 08:58:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 839162.1254978; Mon, 18 Nov 2024 08:58:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tCxaP-00067w-9y; Mon, 18 Nov 2024 08:58:21 +0000
Received: by outflank-mailman (input) for mailman id 839162;
 Mon, 18 Nov 2024 08:58:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=i7IS=SN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tCxaO-00067q-0C
 for xen-devel@lists.xenproject.org; Mon, 18 Nov 2024 08:58:20 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3fdd6d45-a58b-11ef-99a3-01e77a169b0f;
 Mon, 18 Nov 2024 09:58:16 +0100 (CET)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3823e45339bso948627f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 18 Nov 2024 00:58:16 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3821ae161b5sm12340969f8f.74.2024.11.18.00.58.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Nov 2024 00:58:15 -0800 (PST)
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
X-Inumbo-ID: 3fdd6d45-a58b-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo0MjkiLCJoZWxvIjoibWFpbC13cjEteDQyOS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjNmZGQ2ZDQ1LWE1OGItMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxOTIwMjk2LjQ0OTQyNSwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1731920296; x=1732525096; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8RdBtlZDrFbDSXsAJA/Mbsbr4mYFQZDkWIGKaPDcbE4=;
        b=SffPJwqmFYLGCZSyYRohm8HyZXiJyT3b1xa2ReB4K8VxXIMePndCz0nSAR+Eh7UtBd
         zUIjGTg9oLaoG23F10qU6f8vl89iIOHpGpmyQGo74pC0YPy4FpodYYyk/AoMG6Qrs0S/
         hxv24GfWC7WFAqVcvnrCzYCdzGdIkFbBCbxW1+WM+MSRiNF+TDlUodTu7rdrujEyohM0
         mGHwvkhtfONNXkGfYrc/JPPpdXQ/pk+Kk+R4EKR03hBIsUprBzZjTbEZ19c/44h/TqUb
         +Gl4ZRfLLDK/RhPiNvdO7OXEso9L+hwQohCtyzsNslDRk0do8D4CZrYzP2Ugl0N5MbUi
         9TDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731920296; x=1732525096;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8RdBtlZDrFbDSXsAJA/Mbsbr4mYFQZDkWIGKaPDcbE4=;
        b=dt6gSVtm73ZfBUUtugs2VhZ6jNkPsgKLYVaPCBVbmpu8opjJzOCJEXQWpCqsP7xwh2
         ilwGtg8ZxWybKhgOqT8r1hoDAY0ciUzvGi3xZx0nX1p9DHSwg7YSKyId78i89Df9+gU6
         RextOuU8FouCYEQozZ8ttJgAz+KDmTOTg14OwuG4rEYceTAKKl3SA1FMLPkkRUin9MaW
         l/dICqszIfvCf9NbOqL/m203ZJ94ckF3rDxWUvMRFbpYVKI0IOxzOFODP41m8ghDOTa3
         mvQ1OFq/jlnrTcD0/02aP0SvQq3/4NN0sr6MI0GCXOY3QCIl74m4cNJzYyT05hYlr+Xe
         gA+g==
X-Forwarded-Encrypted: i=1; AJvYcCU7Svp/V3ksdvZqYY8Mzqsf11Sj5HTFy5QWAjtNcqSVH53cALcVF+FOeD6WxTKb+05N/cTojS6rISk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxFxb3pDZfVm7RjDXvIIoUSNOKPWNSmlBYUa9Nug4ARD2ftjqBw
	0erCK3WcV/oWyVCDPzVTy4ZWD+7n7DfD2G5u3JrTdfT+BMPhqQ+IoGOK9jnuyGCF2e2wNrcrRFo
	=
X-Google-Smtp-Source: AGHT+IFNHh6qT8MWTtlxZel2NXnNF8PODY+O9vLPU2n4Ini1/W+Ian5+xx8azu1Esceh+gRLCqIHSg==
X-Received: by 2002:a05:6000:4029:b0:382:4460:49c2 with SMTP id ffacd0b85a97d-38244604d59mr3065749f8f.33.1731920295858;
        Mon, 18 Nov 2024 00:58:15 -0800 (PST)
Message-ID: <782b24a0-a960-4667-a183-1e270841d2a8@suse.com>
Date: Mon, 18 Nov 2024 09:58:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] misra: increase identifiers length to 64
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: alessandro.zucchelli@bugseng.com, simone.ballarin@bugseng.com,
 consulting@bugseng.com, andrew.cooper3@citrix.com, julien@xen.org,
 roger.pau@citrix.com, bertrand.marquis@arm.com, michal.orzel@amd.com,
 xen-devel@lists.xenproject.org
References: <alpine.DEB.2.22.394.2411151617580.1160299@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2411151617580.1160299@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.11.2024 01:23, Stefano Stabellini wrote:
> Currently the identifiers characters limit is arbitrarily set to 40. It
> causes a few violations as we have some identifiers longer than 40.
> 
> Increase the limit to another rather arbitrary limit of 64. Thanks to
> this change, we remove a few violations, getting us one step closer to
> marking Rules 5.2 and 5.4 as clean.
> 
> Also update the ECLAIR config that was actually set to 63 as character
> limit.

What I don't really understand: With the Eclair config already having said
63, how come we did see patches aiming at dealing with the limit being just
40? IOW - how would those (supposed) issue even have been spotted.

Jan

