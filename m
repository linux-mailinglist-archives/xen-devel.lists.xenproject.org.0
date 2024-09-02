Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBB33968282
	for <lists+xen-devel@lfdr.de>; Mon,  2 Sep 2024 10:56:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.787664.1197109 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sl2qx-0006Jz-Vx; Mon, 02 Sep 2024 08:56:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 787664.1197109; Mon, 02 Sep 2024 08:56:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sl2qx-0006Hw-TB; Mon, 02 Sep 2024 08:56:03 +0000
Received: by outflank-mailman (input) for mailman id 787664;
 Mon, 02 Sep 2024 08:56:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uQw9=QA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sl2qx-0006FG-7k
 for xen-devel@lists.xenproject.org; Mon, 02 Sep 2024 08:56:03 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2e6b084f-6909-11ef-a0b2-8be0dac302b0;
 Mon, 02 Sep 2024 10:56:02 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a868b8bb0feso477825666b.0
 for <xen-devel@lists.xenproject.org>; Mon, 02 Sep 2024 01:56:02 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a89c8bd1055sm270912466b.210.2024.09.02.01.56.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Sep 2024 01:56:01 -0700 (PDT)
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
X-Inumbo-ID: 2e6b084f-6909-11ef-a0b2-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725267362; x=1725872162; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Ji8jEtoDn/3789KvACmyxviOat2xXMDXBgqUL92NPVw=;
        b=BY44XDboDmcMjk+fubDrVbaGKuktYgO6DdCEDaNNgPFr/Hb0MyM6X5RTiPMeLa/OQs
         0d5rSSmSahmAtqRzC3PGrAPzF31ZNnd42l76/jxITNeZgIeHm4RuASbayqjFZlP3KWwe
         /e44skFTBbBoo6yKOccqF6EngB7iLWhJTL83BV2HZmVMTE3njy0LQ8121FjIknhitHPS
         vqmUWWiRFeDXNerUTsCWCoNPrn8jxG/DgdOWl2GFbQ1z7OBezyj15ozAfqGJf7xIntQX
         qW6qubcvafrX4/YkUePJ36edEjaLPgx2HWdP6Q1+qs2iR5DkYVrDHu4hrwl7MCu+Xj2L
         hqBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725267362; x=1725872162;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ji8jEtoDn/3789KvACmyxviOat2xXMDXBgqUL92NPVw=;
        b=B0CpoqMmhzYiSWyYd1JiR9Y2LznDwLEhmU2ji2+sQqZAuLaGcmOyd+tcKgVG2C8XuA
         +Cky1Ns/ZNJ/SZQoYqWoI6wp8YkBhickpA5+aGNyVu8FKPYMMrAhJF2skpg69r3pUz8+
         funjTXhwzE+oTu5XHvd19/Rg5hUp/kWw63sILakzcgLwhPO0k6Zqae+7m2uHkq5I/Zd9
         bndFYd45rQRcPxfPk7mpnN1AoFqrQVxDfzu3P4WP1xOsYcDuS2tMlLEuxT1z6PQVK7Ke
         ooJxtn+kf7PWFya48Vn6eQN+hNbilvXQ9zSQ7JgSjUUh9IpL3lpmYUzGHL3gIxBCOTAU
         +6Jg==
X-Gm-Message-State: AOJu0Yzt5XKgPoRQjZogoazUEcZ+8ysC3IsjS0H+Irs95JBZkJFrQjkf
	Q2UAqIz++gy8ucvir+fPXiy4K07bD0tc4eXRoOLisrID+vFc5MLeW3k3aAdN2w==
X-Google-Smtp-Source: AGHT+IFKWzJXX4vgVPoAHuJZDrwl7B/D6e3Wlpsw+fr1FFCDl4n030EdKSxrFGNW15vIT4WiTqwdTw==
X-Received: by 2002:a17:907:9723:b0:a86:88f7:679c with SMTP id a640c23a62f3a-a89a37a7ff3mr549596366b.41.1725267362025;
        Mon, 02 Sep 2024 01:56:02 -0700 (PDT)
Message-ID: <4ec51cb2-1598-428a-bfc4-9f68d24ba453@suse.com>
Date: Mon, 2 Sep 2024 10:56:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] x86/time: prefer CMOS over EFI_GET_TIME
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Andrew Cooper <andrew.cooper3@citrix.com>
References: <20240830095220.49473-1-roger.pau@citrix.com>
 <20240830095220.49473-3-roger.pau@citrix.com>
 <ca2aa9b3-44cf-4a44-9111-1d7e8c9b4dff@citrix.com>
 <ZtV7Nzp7AxXh0NQF@macbook.local>
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
In-Reply-To: <ZtV7Nzp7AxXh0NQF@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 02.09.2024 10:45, Roger Pau Monné wrote:
> Is #PF the only fault that we can expect from EFI_GET_TIME?  That's
> what I've seen on some of the systems, but I wouldn't for example
> discard #GP or #UD as also possible outcomes?

I've definitely seen #GP in stack traces. What I can't say for sure is
whether those were _only_ because of our originally wrong stack
alignment, when firmware code wants to use XMM registers.

Jan


