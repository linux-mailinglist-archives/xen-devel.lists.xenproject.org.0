Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79515A64605
	for <lists+xen-devel@lfdr.de>; Mon, 17 Mar 2025 09:45:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.916300.1321412 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tu65o-0006EG-Ap; Mon, 17 Mar 2025 08:45:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 916300.1321412; Mon, 17 Mar 2025 08:45:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tu65o-0006B8-7H; Mon, 17 Mar 2025 08:45:04 +0000
Received: by outflank-mailman (input) for mailman id 916300;
 Mon, 17 Mar 2025 08:45:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UoSe=WE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tu65m-0006B2-FP
 for xen-devel@lists.xenproject.org; Mon, 17 Mar 2025 08:45:02 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1ca5344f-030c-11f0-9899-31a8f345e629;
 Mon, 17 Mar 2025 09:45:00 +0100 (CET)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3912e96c8e8so2616011f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 17 Mar 2025 01:45:00 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395c7df31f6sm14200636f8f.6.2025.03.17.01.44.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Mar 2025 01:44:59 -0700 (PDT)
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
X-Inumbo-ID: 1ca5344f-030c-11f0-9899-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742201100; x=1742805900; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=DRuBZFGfatYr2umfXK6eEoqM5ZOffWvPvHWDs/WUvzw=;
        b=ILXNK6Y10VG8B87pe8SF28ZosGPVazeUcdk6i2fiwApu50/ML6WclpopVOFc3Ybom7
         /uHWlpWxWvSHIMhrFGwD1pJJJotA9msVhlRiYh5jSfDnKpIaA8GKyLFx7+DTrlqc7tNN
         O1lJ8pDKM0v3K4R1ftFdR0+cCTTk9jDeIc1oIRVApwhICQQB3qXwTckzCurcMY7eOc2s
         MW1KgY6ARUvFL4FzppMpGvTJCrZ6EGJiaAqFYeMDV6WBtpsp+AugyIT+pAH4TSh+qdkL
         pf30Ow9WkhR0xIZwVyufBmikwmg2euHMtlCgvCcf7hFcvgq0aszCd7nAONZXLl9QOWkN
         of3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742201100; x=1742805900;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DRuBZFGfatYr2umfXK6eEoqM5ZOffWvPvHWDs/WUvzw=;
        b=dh3HsKR7r5CEDw1M/JGSvTqR+uk8j/dNsW6TtXLt7T7e4huZ6SoR647ToA0/3Ks2EE
         4GcJtwH895qLYWa/2JbAtl32BduVd82RgjKuPXOdfB4u3GW3BF6MwB/mP73gMsObMlaT
         ZRXEaSxRAOdl5Tq604L3A2C0mH51GCOBU3lK+niIDrxlaMjHRikqmrk5qMzeTfhWlowo
         +CMI2uOtaBAEXe2phvYO4shAzdpr0pzHmrJID++wsp4MxNDGCK0f9GX04XcCardDwnJf
         EO6Pg56E0RqiK5/fGGoMAfdDDcu29GYE5kSJ12X+O7vmewiTbacYHfPZ1SXqYdu7tLF1
         Ae0w==
X-Forwarded-Encrypted: i=1; AJvYcCUeLEE9rWI6+n1vuGD2nwIi5B6GdEGaXD9mc+m5iHiAhJONZvQxHTmdtjYgRwWqI3mMqtQNS+ZAJnU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyVux+cZTN8fGpt0gzbX5En1C/Mo1KFacGgvyzMR585zfBx9dU6
	zc7yPfc1NlcDIYiF22Mv9av1r+3x0VbXSpAEdVtLEV6dpNd4PIdJrMgVaJGA8g==
X-Gm-Gg: ASbGnct8Mz5vcA5qTQyX7NWdYmjq+7ONoxzQDGZ9G99Ztd25XbJ8aDCgDmz+NbSAsd9
	wiCAH32jxa5plc5D3PvL9Hxz/xtOltyX4l7jHrxCc6+Cs3m6qbFrRYfYVILgnYvnii+htHn0Sek
	NFHGvG9jJKXxBJN3yDjmEYGdyKE93WlhxqjjcEs8BfWdS+H54FfJ0hX4AUJr7Y/kW+fNjUm2ONh
	ahXpN895OImbqUone10Raj1c+vC7cVwiE31zCnrcj0SaB4VJrmuCRsRHwSOrFCWK0Xb9EF+4Buz
	IQyHSi0gOjyKvuzMho+lLYLFGaParHehWG5ZWLtn2c5IXW+ZBr0/m7L22xRyhdVKc+k5xNWDqYe
	DAT88oeA6zttbCc+OK0hB3Sp6KNjsrw==
X-Google-Smtp-Source: AGHT+IGPL61VsSX25u7cSTRSnPjS3nfNKhDNKK3AWE7jCosR3+cJwxpX8wFlUqYO5I7tmKVSHQUzvQ==
X-Received: by 2002:a05:6000:402a:b0:390:f2f1:2a21 with SMTP id ffacd0b85a97d-3971f9e4985mr12896663f8f.37.1742201099985;
        Mon, 17 Mar 2025 01:44:59 -0700 (PDT)
Message-ID: <f1762c9b-169e-47bf-8844-034bee9c821f@suse.com>
Date: Mon, 17 Mar 2025 09:45:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/debug: Move activate_debugregs() into debug.c
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250314180750.73925-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250314180750.73925-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.03.2025 19:07, Andrew Cooper wrote:
> We have since gained a better location for it to live.
> 
> Fix up the includes while doing so.  I don't recall why we had kernel.h but
> it's definitely stale now.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



