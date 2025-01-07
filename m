Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C468EA044AD
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jan 2025 16:35:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.866544.1277837 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVBbN-0006Jm-Bn; Tue, 07 Jan 2025 15:34:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 866544.1277837; Tue, 07 Jan 2025 15:34:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVBbN-0006H0-8U; Tue, 07 Jan 2025 15:34:41 +0000
Received: by outflank-mailman (input) for mailman id 866544;
 Tue, 07 Jan 2025 15:34:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1r68=T7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tVBbL-0006Gu-GM
 for xen-devel@lists.xenproject.org; Tue, 07 Jan 2025 15:34:39 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e791a2e4-cd0c-11ef-a0df-8be0dac302b0;
 Tue, 07 Jan 2025 16:34:38 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4361b0ec57aso155977895e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jan 2025 07:34:38 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43656b3b1f6sm641670845e9.31.2025.01.07.07.34.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jan 2025 07:34:37 -0800 (PST)
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
X-Inumbo-ID: e791a2e4-cd0c-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1736264077; x=1736868877; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8dE4UY1pEK6j334jROg3v1j1Cwtpd/V3ZexOdykQq4g=;
        b=MBgV+g0LLtzlDE6XzSRlbG4qUGEskNUx/y3ouDYRuLzwb1RS212U3jqMEpq+7h5b5/
         0WQg0g8pRLrbLvTSIbNgAnl1EfsQsZLJ4RAC9Eh5vAiTkElMhr4q6Q4rG35VuaqAF2B/
         gmcp2iGr3966mmfzxbqqJ24q2Gwf46xHpli7hWGRqWzUTVyMVqVIzmvrxsod0kS+tZLp
         2ZplAh9u+S2ijzPKKYn9cJS9zADm9sjJ0xSd67BhTLjw7Z1KJmy45gfiXeAHtv6UTMvX
         1g0eX0btnQiijstPq248jJdnDPeMMiZNBu1yeuMnbtF6JNaHfWQ4R5EhOfiMVazU8qd1
         /qxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736264077; x=1736868877;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8dE4UY1pEK6j334jROg3v1j1Cwtpd/V3ZexOdykQq4g=;
        b=wxqlrtj/UE/YbE4XAvWkN3zczBRC5cVo/LpJdMe0jIsEG0he9wpih6YJ9j1/LkiT7z
         xqhDujszVsir71SeBKzvINoTtAqhVeWQxMnqjiNqx/i+JQbuBwuutD3BfVUMpUralZ2y
         seNIxu8lWcjyWUpDp5gFrYigpv8zf8S2iQFLRk9w5zwkfzKBaZmt9TVZusSRd8HarLD2
         x5Zk7gVcBZ3iwsI2QAdnWBRnhoESg0Vlq5jpzv6HrbUlJHR2VBxTBycfjU4/Q+JKTscK
         PD5fiFC6Z3H+meiRKYuSSqquotVFiwtypscMdpLodZlhlatn03I8r30sv4qGHjR6B7pQ
         3cFA==
X-Forwarded-Encrypted: i=1; AJvYcCXq2+OEGkAxIPdHgTVnBuz1PuFW37wjrdvP1aYMrSDujkhS2yc0faCJS/n5kiOJD3gfjjsuIeKTtBQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwiKt3rqhDnDYnxb1LznsO03sIUAmVQ0eBeacWpIoxTHx0vyPkh
	562MNwUEM5YzMmK02HOXifWY6ydn7FsiQqRSDD5pDtKOmAiAi3eDNW+liamIUA==
X-Gm-Gg: ASbGncvM5emDaDCNRojLYzwSHk7MLfF/6Gcq8DRYDVJZ/t7+TZQ9zvKA1pbZpVYFYYz
	UHox1oLbyQImviV5mr8d8K46Go/Ysvki2MLh4AGQO0qxHFi+4c1bG1RKVsSvgP+WgE9dw+a386Z
	Ee8dApLvC/pNahSP5zEhwbp+563S6/cgjDhlPfUMjDtbJ4k1gaXZBNRXIiUqXWB77X4sxMiyUuh
	GmQFNzqdGrEIAglGKavhfI8IWXEnJLOfAVs0cGJoe/4jo9RMctCF0LWaUkr5u9eDKzxLuJJHcfG
	praxEGzGOL6JnXM3ciwgSsHz+0Dj+A7LMoayQxbTbQ==
X-Google-Smtp-Source: AGHT+IEZ4VYpvCrpHE2KRFeP6X5SVq7N1sLz2dLKHTL0pahcNVQqHTN6O5vBGlzEzzELDspx4pw6OQ==
X-Received: by 2002:a05:600c:1c9f:b0:435:32e:8270 with SMTP id 5b1f17b1804b1-43668642f9dmr532372675e9.14.1736264077507;
        Tue, 07 Jan 2025 07:34:37 -0800 (PST)
Message-ID: <577427ff-61e2-4fc9-8853-a7eec3f69bb6@suse.com>
Date: Tue, 7 Jan 2025 16:34:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/7] xen/events: don't allow binding a global virq from
 any domain
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250107101711.5980-1-jgross@suse.com>
 <20250107101711.5980-3-jgross@suse.com>
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
In-Reply-To: <20250107101711.5980-3-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07.01.2025 11:17, Juergen Gross wrote:
> --- a/xen/common/event_channel.c
> +++ b/xen/common/event_channel.c
> @@ -120,6 +120,13 @@ static uint8_t get_xen_consumer(xen_event_channel_notification_t fn)
>  /* Get the notification function for a given Xen-bound event channel. */
>  #define xen_notification_fn(e) (xen_consumers[(e)->xen_consumer-1])
>  
> +static struct domain *global_virq_handlers[NR_VIRQS] __read_mostly;

Nit: While you move this line around, it would be nice if the attribute
could then also move to its canonical place (between type and identifier).

> +static struct domain *get_global_virq_handler(unsigned int virq)
> +{
> +    return global_virq_handlers[virq] ?: hardware_domain;
> +}
> +
>  static bool virq_is_global(unsigned int virq)
>  {
>      switch ( virq )
> @@ -479,8 +486,13 @@ int evtchn_bind_virq(evtchn_bind_virq_t *bind, evtchn_port_t port)
>      */
>      virq = array_index_nospec(virq, ARRAY_SIZE(v->virq_to_evtchn));
>  
> -    if ( virq_is_global(virq) && (vcpu != 0) )
> -        return -EINVAL;
> +    if ( virq_is_global(virq) )
> +    {
> +        if ( get_global_virq_handler(virq) != d )
> +            return -EBUSY;

Hmm. While this eliminates the problem for the common, race free case,
the handler changing right after the check would still mean the bind
would succeed.

Plus this way you're breaking a case that afaict has been working so
far: The bind happening before the setting of the handler. With a lot
of unrelated if-s and when-s this could e.g. be of interest when
considering a re-startable Xenstore domain. The one to take over could
start first, obtain state from the original one while that's still
active, and be nominated the handler of the global vIRQ only in the
last moment.

Jan

