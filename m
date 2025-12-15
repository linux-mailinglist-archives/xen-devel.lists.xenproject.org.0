Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F266CCBE360
	for <lists+xen-devel@lfdr.de>; Mon, 15 Dec 2025 15:12:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1187067.1508487 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vV9Iq-0003xy-6B; Mon, 15 Dec 2025 14:11:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1187067.1508487; Mon, 15 Dec 2025 14:11:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vV9Iq-0003wW-2O; Mon, 15 Dec 2025 14:11:56 +0000
Received: by outflank-mailman (input) for mailman id 1187067;
 Mon, 15 Dec 2025 14:11:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0ibL=6V=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vV9Io-0003wM-4F
 for xen-devel@lists.xenproject.org; Mon, 15 Dec 2025 14:11:54 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 00e101b7-d9c0-11f0-9cce-f158ae23cfc8;
 Mon, 15 Dec 2025 15:11:52 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4777771ed1aso26635305e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 15 Dec 2025 06:11:52 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-430f1fa232csm15343605f8f.6.2025.12.15.06.11.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Dec 2025 06:11:51 -0800 (PST)
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
X-Inumbo-ID: 00e101b7-d9c0-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765807911; x=1766412711; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Rua8TyvBHPfiCCfpfnlGRR0IiDMfB1BUicr1d2iJq+Q=;
        b=asPbtzJ79SCiTVSrw0A/vTfN8xWir1oz4YBz+sb7lCaQHK9tq/Y2OO22+q9Ui6Dgeg
         Yd9Isa/VBQHuCZXsxKihPtcOmO7j723pcEn6Dd/5GXbr5AwRKvR1W6Due21NmrEbFrCo
         sKA1RwSq4pbyNK2mPQLf2G9/lCaN/XLrfW9IWcga73G0HnACq+J8tOZFjmrHmIUG6a1T
         HkW2CEVFghgulzdcX2n0CdRNSkiuDUk02n5VmRDsnIXi6a1QONrhWALWe9560BpS+BKT
         gYN/j2WO/JvYvsLbq0LQvmey+qMokZtnmW0GbEU1sqQmsmf1qfF8brX5E7MPN3kT+Vqc
         Clxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765807911; x=1766412711;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rua8TyvBHPfiCCfpfnlGRR0IiDMfB1BUicr1d2iJq+Q=;
        b=aGOX9O0MgRdXUA321qRIpePp/yvQHV7+Ew7ZsXAVVaABAy2LSRyH5ZyWjmEGPP4axp
         HjFLgKVVUo4/O/ElOwmuXngLxQreQzbjHOXVnARHhaDkXeh0hw1rj6tQjPAVfdhXJsmo
         5hI289NvnqEVm7H/ngrqdfR7WTpOcDfHt/rJwzUMx3kcNj9gx9oHAttFBDq4V9KvKgCq
         5laaXRAMHNCGo6FVdqDzbXn5w5QJGQWl0uKeruok3R+2uQyFsr+Y3JG5TDI7syDk3kO9
         QqTEcqjsRQ3uPcSkxzEHiAudkROt8On+JAwCjrs2yV0ipxLbE9cnXOHiyage4o9+1AGp
         aExA==
X-Forwarded-Encrypted: i=1; AJvYcCW0fFMFCu9TCOphemk+xbha9YzBNR9w5EqaNDfqL1hYY0xby982S4cRrR4t9Bx+2fdn9oKk47v29RI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxZjq4ImHcyo9Qx8W76efpd/TX4NA1Z+IxGkxqmmGhvNsT7/yRi
	ci80XGv1UhvVlD9/d34FY6pZ2GJ+XDh0736R3yJcXlAqXVDPbm6roSFSLRuMICO/Yg==
X-Gm-Gg: AY/fxX6cZJfvLK7Ws0+ZlyPQnndr4s08LedbMzTeqGE/0qhUk1eaQO5d0RhxJ7ZLk1D
	bF4zEjqB0+AG7VTYTOlr6Xg3y1LC3RKYUTjnCfZKmWN4hh1ZBLEfEB5xCMNYGe04r77+dbvOZhM
	vbks5WvguZfrUcdL/9bRILXr5CaqyDfmoLIzTrT20CIMwbydkALUPdfEe8oEcBuzjbFOBzcMHRB
	aIS7ECC9dbXfhtUkscDxZJeYR1YeD32WXNEo2vcldkLWVi68egD8Gvll1XIID8MglAYGxlgEKqn
	g/08uiQwNJK2C8stfCPYJ2L3kk0S2ciqK51LbIw+bfAMrz3s1KfIzk/jEgYelVIwMs3yMjtdF3U
	HjhYGuPcxc7aMlPLbQ+oM8+Pu75R5YxYiF+b+pHrrSb7RyZUlQ0p3PvIq9T+CMkl18yDlcwp5t/
	OpzAnwbyeAEK1pwLE0Mxrjd9QzoEnBJHjl2MN91u6tiqCfVvpO7GVDWseP/DgaJ5moKBkFw2I5o
	dQ=
X-Google-Smtp-Source: AGHT+IFelnAXioZPsFx84Nz1O+B+BVYB70gu7qbELOL/ukfRvpA6J6nCI9N4mq1JgqaOtZD5PSEkqQ==
X-Received: by 2002:a05:6000:1865:b0:430:fd84:3171 with SMTP id ffacd0b85a97d-430fd8433afmr3405024f8f.22.1765807911523;
        Mon, 15 Dec 2025 06:11:51 -0800 (PST)
Message-ID: <92e6ecac-7a5f-4831-8116-0c34856f1175@suse.com>
Date: Mon, 15 Dec 2025 15:11:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] libxl: Fix device_add QMP calls with QEMU 9.2 and
 newer
To: Anthony PERARD <anthony@xenproject.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
References: <20251215135124.11410-1-anthony@xenproject.org>
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
In-Reply-To: <20251215135124.11410-1-anthony@xenproject.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.12.2025 14:51, Anthony PERARD wrote:
> From: Anthony PERARD <anthony.perard@vates.tech>
> 
> QEMU used to ignore JSON types and do conversion string <-> integer
> automatically for the command "device_add", but that was removed in
> QEMU 9.2 (428d1789df91 ("docs/about: Belatedly document tightening of
> QMP device_add checking")).

And older qemu accepts integers as well?

Jan

