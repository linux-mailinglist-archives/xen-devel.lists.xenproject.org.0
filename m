Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50BFC91D9C7
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jul 2024 10:16:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.751314.1159220 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOCCw-0002pk-C5; Mon, 01 Jul 2024 08:16:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 751314.1159220; Mon, 01 Jul 2024 08:16:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOCCw-0002ma-8Y; Mon, 01 Jul 2024 08:16:18 +0000
Received: by outflank-mailman (input) for mailman id 751314;
 Mon, 01 Jul 2024 08:16:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kQX2=OB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sOCCu-0002mU-J0
 for xen-devel@lists.xenproject.org; Mon, 01 Jul 2024 08:16:16 +0000
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [2a00:1450:4864:20::22a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2ec3138c-3782-11ef-b4bb-af5377834399;
 Mon, 01 Jul 2024 10:16:14 +0200 (CEST)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2eaae2a6dc1so34274181fa.0
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jul 2024 01:16:14 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2c91d3bcb30sm6131518a91.41.2024.07.01.01.16.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Jul 2024 01:16:13 -0700 (PDT)
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
X-Inumbo-ID: 2ec3138c-3782-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1719821774; x=1720426574; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6yXVr6w+0VZGpOuJfCDBEjv+7S2U2lpZLUn/HwVs0DM=;
        b=Rwm/696DkAsrqI+XbSwXaMcp9nqExOKwkpKIrofc7SjQxcscnEa8PgpmoO1pKwZeF0
         jlA9UGWm3Vz3SXnNoSNjNg/eSZ20sRSPJi2sDumt55Sc8kvKGKKupBLJMCG5inS3dRZv
         XIlfIh6ODXmI6Zxo3HZWcF0C0pfYOj+jtFXSmRWvZbi9Ektu4NKhtxkeJt7iO3yYxCAr
         gIkP4ncZkYk1QY8jDGhmaTtvmZf3DvLrOd2cAuzOUQv+rreEDS34IGeKACop06zEqBOo
         iw9c/XZuoaqt/UidJaAFLWH3vuDgKoGqKOiTeLHt5tVD+/UCwBS35IN592SUN5xOXHmz
         fJhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719821774; x=1720426574;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6yXVr6w+0VZGpOuJfCDBEjv+7S2U2lpZLUn/HwVs0DM=;
        b=eUYOeRfBVQfjSG5SVUL4T598WDfihXjT2VrWp2tCbdYTNPuJ+zfPiTu8i/guMTr2zG
         80iaOi7pJJBtzttEbclmcB0t4ECEtvsCP23xvZlAX60n4cUvY5qmrVCiR9JgLeF2V6/g
         nNNy8fJZOHnMDpyrFnsAhaByfw2Pfn6l//8GCctm5ikUl26S6BrsCUyyCmsqBc5/pgmY
         AeP5SfPvlU8dLbg/L2rMhAlA4/qjpoGFc9V9ZRemym4Qc7Uayk81tko+0yRhzM7OP+Zv
         fysqu+zCXD514tGCt3Iim3ia0JLW3FVT+gQbqIcwxZxNKLDwR92WZFQ/5NekjLkAChI/
         CNbQ==
X-Forwarded-Encrypted: i=1; AJvYcCU6NTj+bRvBLuz2SN/LYPhTAwg02N0bSK4QuM3H3C82gz5OB/8X4R0GJTeyRBISdkpKYTzxD7xBpeId0LzFQYkGWunDBnZjzmqbCHY75d0=
X-Gm-Message-State: AOJu0YyJHgo+2sMX3eXWShxhO6EyIfLQUnsfKUenrDvG3m8ElZcUttM/
	ycggZcZeWoFzRppCyauQah/lBR4mTSgQtx1o5sRfabkW2V0UlsVSwXrDHok6uQ==
X-Google-Smtp-Source: AGHT+IHAtwEjQ0l0t+LIOhkchHi7UX39oMDo/mLkAN9bQwJp5Obil4grkVSzAjvVYLZpgPhFkoHlZA==
X-Received: by 2002:a05:651c:2223:b0:2ee:4d37:91df with SMTP id 38308e7fff4ca-2ee5e3bb7fdmr48235211fa.27.1719821773668;
        Mon, 01 Jul 2024 01:16:13 -0700 (PDT)
Message-ID: <6e4b7711-5017-49a8-9f7d-e20c497f2561@suse.com>
Date: Mon, 1 Jul 2024 10:16:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] xen/event: address violation of MISRA C Rule 13.6
To: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1719308599.git.alessandro.zucchelli@bugseng.com>
 <d48b73a3c5c569f95da424fe9e14a7690b1c69f8.1719308599.git.alessandro.zucchelli@bugseng.com>
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
In-Reply-To: <d48b73a3c5c569f95da424fe9e14a7690b1c69f8.1719308599.git.alessandro.zucchelli@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25.06.2024 12:14, Alessandro Zucchelli wrote:
> --- a/xen/include/xen/event.h
> +++ b/xen/include/xen/event.h
> @@ -183,13 +183,14 @@ static bool evtchn_usable(const struct evtchn *evtchn)
>  /* Wait on a Xen-attached event channel. */
>  #define wait_on_xen_event_channel(port, condition)                      \
>      do {                                                                \
> +        struct vcpu *v = current;                                       \

First: As recently indicated elsewhere, any new latching of "current" into
a local var should use "curr" or something derived from it (see below), not
"v".

Second: Macro local variables are at (certain) risk of colliding with outer
scope variables. Therefore the common thing we do is add an underscore.
Disagreement continues to exist for whether to prefix them or have them be
suffixes. An affirmative statement as to Misra's take on underscore-prefixed
variables in situations like these would be appreciated. Sadly what the C
standard has is somewhat tied to the C library, and hence leaves room for
interpretation (and hence for disagreement).

Jan

