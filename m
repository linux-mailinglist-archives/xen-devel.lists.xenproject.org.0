Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDA55A717F5
	for <lists+xen-devel@lfdr.de>; Wed, 26 Mar 2025 15:01:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.927851.1330611 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txRJU-0005OH-TH; Wed, 26 Mar 2025 14:01:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 927851.1330611; Wed, 26 Mar 2025 14:01:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txRJU-0005LH-Po; Wed, 26 Mar 2025 14:01:00 +0000
Received: by outflank-mailman (input) for mailman id 927851;
 Wed, 26 Mar 2025 14:00:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SgUP=WN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1txRJS-0005L7-Lj
 for xen-devel@lists.xenproject.org; Wed, 26 Mar 2025 14:00:58 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bd58ac23-0a4a-11f0-9ea3-5ba50f476ded;
 Wed, 26 Mar 2025 15:00:57 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-43cf06eabdaso63630515e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 26 Mar 2025 07:00:57 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d7ae6a319sm13803325e9.0.2025.03.26.07.00.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Mar 2025 07:00:56 -0700 (PDT)
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
X-Inumbo-ID: bd58ac23-0a4a-11f0-9ea3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742997656; x=1743602456; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=J/YkBCNDG5AJayj0A2z2q3xg0RgGE5rehh637fLxSYs=;
        b=M2GYyhUJCbjpl/UotSs0N0LWPbX7sjih3z33e9IbA6JSbc9TSTjOEJ9KLjDrrxHNmK
         mUcUnqK5eyFtHzDgUmNMfhxSSb8C/xoNR+hIuIuEI3tMoLuYZ7jn69b6zac49g8FCUgD
         NjTVcaqkzd4zP7dIrWDaptF0RIHUeIYbIXKbW5QBdlCO4NPovRmMjxSsHV0G0XmvtMMj
         Hus/HVaoftTG5AFPgvNNfFbTRrhZZgC+7rTJS03oS6H3yIglz1SNVfbKQSfhQiq67inf
         lGXXv94dv79W34eJJjxZJxMvVZvbEe/mbTFOxSN05N775QgWmXGuwZ474qIsmaplmQst
         OoFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742997656; x=1743602456;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J/YkBCNDG5AJayj0A2z2q3xg0RgGE5rehh637fLxSYs=;
        b=U2WvkigMs19fmM4WXdlFR7elpIkaIKLQu3B6rDENvDOh9wqDfAee+O006UdLV9pR3S
         NcYsDCSoerU06AwP2Y2B7UpaDCA1K/J2/BCBuf89euMGSk2MqPhX41a2WimikrS2ME8S
         m1aR/dRHdEZzV1KjSJhMzi+bDxIiof1fGgflHBEAX1/tdze8FD28Q4Qo87XHoyxHZTMW
         MBxPARVOju7hVCmxW6POEGGbDzhjpX1WORA3TTKBbz3WYRkH+wpMaFtB6I2bqFCDJh3m
         C7W5CI5Qnug2BO6pzuIlk6IurAp49L6Kw8O6znzQpihjVb0VWn9Ijy4ms2vSCTIme1Tp
         JOtA==
X-Forwarded-Encrypted: i=1; AJvYcCU9YyN3JCkuOfPW/P2ksOgW7SqNiScQasho4UFjv2ivtKG7qKNBf7wiVizJU5cwy9TpQLQvN5yVtWs=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw2pKCUlqcCfGpTgUmpmsu0t2KmBgDcf9Fy6FoZQ9mtbc2xf2lc
	9WFx0RGIXEYd/p+uYGVRdHO5wE6X5QtN0WP/xw1IyKTWA1Npwd65irgjdXL18Q==
X-Gm-Gg: ASbGnctDe0sZFvBcunWunv770W42vyI4IEgq6n4pYmrKs9R7VkEIpxfwqS8ukJ8syyP
	9qtsEOLJYt7WKPquzmXBocE1geSl4TuzgEquSuFnLUAntPtWqTPn250la2quV11/SXcMpg46N9k
	DZR9+1LP04Z2BGvX+VN1hEEPzc3HccCYz4KrEVlJc+vV1iov9R5db8hsiwZxXnMaSh8+Ur0U5dh
	Ko7UUnn7GVzSFHIhb9LRyP6k8KOn3EoFuhnpaniH4bADw8zXd4KNcU1zWfgOfgz151xvnVnkQm7
	AWmIvX0rHtx9puJLBWGRHYjHay+KSG4xfTzuXyWnjm4Mh6EQZm3U5qsdCLL2ExCegfIF1r3DvZ0
	aalmm5gFFZuULrTOFyLGZONulz/aoEw==
X-Google-Smtp-Source: AGHT+IFQ8wXIvESNmKYHLYp6tjBzJTSQK2uSuR5ydyCCacQ5ezbAeeFLEP065r2ysITMQ0mB/EA6aQ==
X-Received: by 2002:a05:600c:154a:b0:43c:fa52:7d2d with SMTP id 5b1f17b1804b1-43d50a37825mr199162015e9.20.1742997656294;
        Wed, 26 Mar 2025 07:00:56 -0700 (PDT)
Message-ID: <3680cff3-5dc9-439d-a154-1abaee94c3ec@suse.com>
Date: Wed, 26 Mar 2025 15:00:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 6/8] xen/console: rename console_rx to console_focus
To: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 dmukhin@ford.com, xen-devel@lists.xenproject.org
References: <20250318233617.849903-1-dmukhin@ford.com>
 <20250318233617.849903-7-dmukhin@ford.com>
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
In-Reply-To: <20250318233617.849903-7-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19.03.2025 00:36, dmkhn@proton.me wrote:
> Update the symbol name in preparation for the semantic change
> to the physical console input owner domain identifier.

As you say, no semantic change here just yet, but then ...

> --- a/xen/drivers/char/console.c
> +++ b/xen/drivers/char/console.c
> @@ -465,12 +465,9 @@ static void cf_check dump_console_ring_key(unsigned char key)
>   * and the DomUs started from Xen at boot.
>   */
>  #define switch_code (opt_conswitch[0]-'a'+1)
> -/*
> - * console_rx=0 => input to xen
> - * console_rx=1 => input to dom0 (or the sole shim domain)
> - * console_rx=N => input to dom(N-1)
> - */

... this (correct) comment is replaced by ...

> -static unsigned int __read_mostly console_rx = 0;
> +
> +/* Console owner domain identifier. */

... this (right now) incorrect one.

Jan

