Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA42C88BB3F
	for <lists+xen-devel@lfdr.de>; Tue, 26 Mar 2024 08:31:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.697934.1089197 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rp1Gm-0002kW-5n; Tue, 26 Mar 2024 07:30:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 697934.1089197; Tue, 26 Mar 2024 07:30:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rp1Gm-0002iz-30; Tue, 26 Mar 2024 07:30:52 +0000
Received: by outflank-mailman (input) for mailman id 697934;
 Tue, 26 Mar 2024 07:30:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NDFk=LA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rp1Gk-0002it-Tx
 for xen-devel@lists.xenproject.org; Tue, 26 Mar 2024 07:30:50 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c4b31124-eb42-11ee-afe3-a90da7624cb6;
 Tue, 26 Mar 2024 08:30:49 +0100 (CET)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a467d8efe78so615122466b.3
 for <xen-devel@lists.xenproject.org>; Tue, 26 Mar 2024 00:30:49 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 m21-20020a17090679d500b00a4739efd7cesm3946656ejo.60.2024.03.26.00.30.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Mar 2024 00:30:49 -0700 (PDT)
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
X-Inumbo-ID: c4b31124-eb42-11ee-afe3-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1711438249; x=1712043049; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vY6lfL+FD2/BZpYC8TH1rYKbp15hqcnqajBcGqcjOzw=;
        b=Alt2hDJgN3sH6Q6bHOxpF/yBwOTd7SJ3YuwHfpOc2SlVnQyIEw9chb3fM5mPGlMWF3
         zPhd4F4yv9Eon9JaKiKLq3u0taTsRlqZQZUCt7rM6Q9wmXVfKEJEvaNK/lhIuBuNJvJs
         Xr2yVzERvDJ6R0h69DLMZ/FTCSy8QQEyvbVIagrs/XW3ik9/mokK76EDcPFEVpME93XT
         RE9BW1rs7s6kkm64TCZORJ7BDg5jORR5gW+umYIikBCHF2s5eJn1ZKWjDDPScOG6HqMv
         /ZVJ/DVEAU6mbiUiHngQWji/ijbjI7OiWx+5Xra7ptSCnTaM+nhFzGeklEyKqxes77hN
         y7Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711438249; x=1712043049;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vY6lfL+FD2/BZpYC8TH1rYKbp15hqcnqajBcGqcjOzw=;
        b=l1qAKRqEbzBdD8rNwU5OkY8dOErVopGLx9a38lNq9dKEN2Cm4XQVhJ00IfCK+45WYp
         5PBVIUt3eG5NevW6FSVDObHbt8x4ezLIlC/g7xFs0CYEHy4y3sLtwMLyvFyXqWhA5FJ8
         ydvLz/c3VpPseLbY+ahT3Y3DXyqLOnJV17NQlKW1g9cm7ftWkHouYK35EMDFy/gSo6XW
         vRsYpWH487moLpFIwCPo7y2Qa56OICZo3Tr/Gz6mWo4NeozZ/fwUrLSPtPYSkGTSIh8j
         e24bRv7sXnWpp1QHhxBTzRhmBTf/oV9JRRrS3Vc4FCgjXQQtxhu97y3MVzd9fwl+NGfH
         eeHg==
X-Forwarded-Encrypted: i=1; AJvYcCXT53gRjZA5/ilFHHRzHnD5352D83+TaZkwCth6yk1ITXBushdDKdawI+bolTxDl24tgN+OwJeAjAKDNHUb3mVynzM6nEaz47OSLFYar0M=
X-Gm-Message-State: AOJu0YyIxVe0zgxHF1vuUrBf/wcOCOVRxgPcq5tGpJMKt+fP5DFb+nzM
	GrWoE/Q1Xq22u3WYvXIPfZTUL36AJb5ddg2Xwc6OXrAteoH13iScRBkvf0Y1rg==
X-Google-Smtp-Source: AGHT+IFuPHrzEvS6fePHcXM5JcU5A75Uvc6euw9Oh3jUe6qCu7nsExuaixLLYdmTq1KuwIafsHOOTg==
X-Received: by 2002:a17:906:2555:b0:a46:420f:8ecb with SMTP id j21-20020a170906255500b00a46420f8ecbmr5593295ejb.62.1711438249215;
        Tue, 26 Mar 2024 00:30:49 -0700 (PDT)
Message-ID: <2d39b5da-8d9f-41de-a0aa-25f0d9ac8f31@suse.com>
Date: Tue, 26 Mar 2024 08:30:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/5] tools: Move MB/GB() to common-macros.h
Content-Language: en-US
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
 Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
References: <20240325204515.250203-1-jason.andryuk@amd.com>
 <20240325204515.250203-4-jason.andryuk@amd.com>
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
In-Reply-To: <20240325204515.250203-4-jason.andryuk@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25.03.2024 21:45, Jason Andryuk wrote:
> Consolidate to a single set of common macros for tools.
> 
> MB() will gain another use in libelf, so this movement makes it
> available.
> 
> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
(and perhaps also Requested-by: or some such)


