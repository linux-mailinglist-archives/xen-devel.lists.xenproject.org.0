Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9852280CAC0
	for <lists+xen-devel@lfdr.de>; Mon, 11 Dec 2023 14:21:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.651802.1017657 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCgDi-0001em-Fn; Mon, 11 Dec 2023 13:21:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 651802.1017657; Mon, 11 Dec 2023 13:21:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCgDi-0001d4-D2; Mon, 11 Dec 2023 13:21:14 +0000
Received: by outflank-mailman (input) for mailman id 651802;
 Mon, 11 Dec 2023 13:21:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mRXB=HW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rCgDh-0001Dk-0l
 for xen-devel@lists.xenproject.org; Mon, 11 Dec 2023 13:21:13 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 26cbcb4a-9828-11ee-9b0f-b553b5be7939;
 Mon, 11 Dec 2023 14:21:11 +0100 (CET)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a1f8f470903so181711066b.1
 for <xen-devel@lists.xenproject.org>; Mon, 11 Dec 2023 05:21:11 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 sf22-20020a1709078a9600b00982a92a849asm4859104ejc.91.2023.12.11.05.21.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Dec 2023 05:21:10 -0800 (PST)
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
X-Inumbo-ID: 26cbcb4a-9828-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1702300871; x=1702905671; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zJ6m0w9p7Dnzz78IqQQo1hT1wC1kP6Likj8D68/E4MU=;
        b=g/y8wHI1Beb0bxdm3T7Mw5ffkB+xVlNWSnT0C+fJPrX7MHXNoRJ+SBUMb99izsFwjD
         Yf1cPUNAzeu/7kvhB/1QE4nVpCgvqGMrKs+LyCxSrHWsWlBkS56ZApdAQsss4T/33OfB
         0WK9dKiUGLuafmF5Latb1LsqWrfYlDt3ZhYNXosAJUDSBWLjdpu61E9BSK0JMBIvDLe+
         APcSECbsuxxUbn4B/IWW6Oa3cVOPlslDq0DEyk3ZHOTh5cNlhRMIwdvRxADZNFYTay0Y
         vg2btu8QVfgD7/ZrRY/ZgcZaKYr3rCJ+AZP47PVyJjb7BzSD9FmNc1JSwgtocn1Ln3m5
         gDag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702300871; x=1702905671;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zJ6m0w9p7Dnzz78IqQQo1hT1wC1kP6Likj8D68/E4MU=;
        b=NMGV5wK4qx6XgLwwUxPC6h92Z8nKaI9WcBA8Y3BbPb+8FiCTH5fYY4RoAfCR+2yCag
         P47g50WWgg7iKv7mOVSkWhCYNGXT2QP8NdFLHDyqLgYwg8SBAz1GJvXtKTKynDvSLmaC
         owBr2ozBzcNWkPPZAWqLxZRNYpSncX+5FJMOz0C+9k0+bRkfHnQeycH+C3SGr+2QUpdR
         9ZPSaao3knUBYMDFXoRwaQxKtp2Dd6A8VN/HIg6H0LWBYtWOLgkRh7H7+1RqQzvENywD
         y+U0V+7BWk//XAjX3r3xvTXnre5+oHMweuVxr2t5q0ke/H4btwFv8T+Pq7TU1oWtJPFm
         J+4Q==
X-Gm-Message-State: AOJu0YwTbjZl+PavA3oeKy6LqqSax0SEWaERba7bt5DIuZUX2EPVfx2l
	MmJKut19O3fs6HlB6w1IGAQz
X-Google-Smtp-Source: AGHT+IGxaTsQSjK6Ghn2ZN3pZytCiMVZ3/Q6a4OiDGRV0JmvO+PMko8kHxujp9Jx0mx4FSETiXkueg==
X-Received: by 2002:a17:906:5346:b0:a14:d6e2:fb1f with SMTP id j6-20020a170906534600b00a14d6e2fb1fmr2515275ejo.10.1702300870900;
        Mon, 11 Dec 2023 05:21:10 -0800 (PST)
Message-ID: <a0e8923b-c1bc-450f-a31a-232af31462d7@suse.com>
Date: Mon, 11 Dec 2023 14:21:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 3/5] x86/mm: remove compat_subarch_memory_op()
Content-Language: en-US
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: xen-devel@lists.xenproject.org, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1701936906.git.federico.serafini@bugseng.com>
 <285de0decf8ffe4277ce7e14a2561a693103f72b.1701936906.git.federico.serafini@bugseng.com>
 <alpine.DEB.2.22.394.2312071634110.1265976@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2312071634110.1265976@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.12.2023 01:34, Stefano Stabellini wrote:
> On Thu, 7 Dec 2023, Federico Serafini wrote:
>> Remove remove compat_subarch_memory_op() declaration: there is no
>> definition and there are no calls to such function in the XEN project.
>>
>> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> 
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Acked-by: Jan Beulich <jbeulich@suse.com>



