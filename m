Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB905968B12
	for <lists+xen-devel@lfdr.de>; Mon,  2 Sep 2024 17:31:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.788151.1197597 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sl91C-0003vN-Ht; Mon, 02 Sep 2024 15:31:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 788151.1197597; Mon, 02 Sep 2024 15:31:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sl91C-0003sU-Do; Mon, 02 Sep 2024 15:31:02 +0000
Received: by outflank-mailman (input) for mailman id 788151;
 Mon, 02 Sep 2024 15:31:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uQw9=QA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sl91A-0003sM-Ue
 for xen-devel@lists.xenproject.org; Mon, 02 Sep 2024 15:31:00 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5a6d48b6-6940-11ef-99a1-01e77a169b0f;
 Mon, 02 Sep 2024 17:30:58 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a8a16c53d3cso64795166b.1
 for <xen-devel@lists.xenproject.org>; Mon, 02 Sep 2024 08:30:59 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a89892335b2sm567632966b.217.2024.09.02.08.30.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Sep 2024 08:30:58 -0700 (PDT)
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
X-Inumbo-ID: 5a6d48b6-6940-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725291058; x=1725895858; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tQnmxGJFYJbeEoVD/D8fu+XXX2gjCpogs+oIevKw74w=;
        b=H2TMPlpAyQnkxocciG6tHQpbB0QKftZ45TH7UasQq5qFRHH7PzgNjTiDdQD4SyKh26
         +svD2r1XnAnpcr5/4ppZkzrRTk2aQJi/7feC/Gk4s2oK/fgEU3sZnIzl5OStnO6oLsAf
         ldmirZOnPTbsB9XaTCBP2M93I4eNGgISOb3gezqLbzXe8uzajmy8miRSCIpE2vEFMA7E
         /0+eTK2ibydi6uRp2HQOnfg43XqIShS+W5MIayONSHJtbWvjODjtoOc9E7K/hYcVv5Nz
         QsLlJ9HzBUChaTDXGlwOUMDw5uTx3AVUFzLYmSSnzWsm7weXoYm5W4k2Sy2KzXg5r+tr
         THAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725291058; x=1725895858;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tQnmxGJFYJbeEoVD/D8fu+XXX2gjCpogs+oIevKw74w=;
        b=JwOza1PPr2Fdjx25D7azpDMyhyuy0h8FLEUAm4meSgTPlbHkXyfcVes5iEviz7bW5o
         EgGf/DNp6iz5SCas53/s6MRiTSspnWEQVnCbnTNG/dm2tEjZLkRdxWwXPiVjajg8rVKb
         5JBkb3v9G50QxcH2dgUP4we9He3jCWUGDmXS25loQqDzocSVPBxlQWjb0Nz1jH+A6+i6
         wZb2vQd9svJNS9SK7x/pNrAv5ZEc/3iuo+XSNqtglheWM8/1d/qJgtj56poXdqQFRdeD
         7n38mRSTRs1EEcLpIAJbuZDcIu7CFe+AOVw1akGg9C6HwJPsWR5gdbPUnM/GxK3nGNCt
         t3MQ==
X-Forwarded-Encrypted: i=1; AJvYcCWOKq7XEyvTQq0YjRS62g32rTIPgq1KwJylONgD7LRHaMIj2fETKuQfCSm6iHmbz84J6SrMh+cTRdw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzB9xcD5kwZ5Fk9Hdh4UExvZTcsEkjKkLAhHtpC6WkWw8G/QCTE
	VL6SSQLYt9zI8tJInXgKjHQ0FC98VnbuVmNas7+AmGQlurf7S0XPkSN68c2lPS3wxbDKtuUWhLE
	=
X-Google-Smtp-Source: AGHT+IFnjWmfLheEfE8YdraKS9lhgohNa7gmRSXGxuPuP3UlgoTauxJH+2JTmXGw3xvjyLnKicZ3kw==
X-Received: by 2002:a17:907:3f20:b0:a87:1026:3807 with SMTP id a640c23a62f3a-a897fad505amr1072384266b.61.1725291058232;
        Mon, 02 Sep 2024 08:30:58 -0700 (PDT)
Message-ID: <70daa7ae-cac0-4e3a-9882-b90592d7dda2@suse.com>
Date: Mon, 2 Sep 2024 17:30:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] x86/boot: Use <xen/macros.h>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Frediano Ziglio <frediano.ziglio@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240902133232.3302839-1-andrew.cooper3@citrix.com>
 <20240902133232.3302839-3-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240902133232.3302839-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.09.2024 15:32, Andrew Cooper wrote:
> ... rather than opencoding locally.
> 
> This involve collecting various macros scattered around Xen (min()/max()
> macros from kernel.h, and _p() from lib.h) and moving them into macros.h
> 
> In reloc.c, replace ALIGN_UP() with ROUNDUP().
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



