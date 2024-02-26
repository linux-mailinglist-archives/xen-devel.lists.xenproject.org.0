Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 884E8866B9D
	for <lists+xen-devel@lfdr.de>; Mon, 26 Feb 2024 09:01:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.685291.1065750 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reVug-00059Q-HJ; Mon, 26 Feb 2024 08:00:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 685291.1065750; Mon, 26 Feb 2024 08:00:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reVug-00057C-EY; Mon, 26 Feb 2024 08:00:38 +0000
Received: by outflank-mailman (input) for mailman id 685291;
 Mon, 26 Feb 2024 08:00:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hPQ6=KD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1reVuf-000576-DT
 for xen-devel@lists.xenproject.org; Mon, 26 Feb 2024 08:00:37 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1f977dc2-d47d-11ee-8a58-1f161083a0e0;
 Mon, 26 Feb 2024 09:00:36 +0100 (CET)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a3e72ec566aso334260366b.2
 for <xen-devel@lists.xenproject.org>; Mon, 26 Feb 2024 00:00:36 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 z23-20020a170906241700b00a3fb62260e3sm2170726eja.72.2024.02.26.00.00.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Feb 2024 00:00:35 -0800 (PST)
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
X-Inumbo-ID: 1f977dc2-d47d-11ee-8a58-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1708934436; x=1709539236; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=EA1HOX6hhzoxW91ktlrtGSHXMNTU0IR+9VU1mSSBE+g=;
        b=ZBi3sd0LfZh2J1sedLOvEP6Z/DZexFcfBO9kTzNFDfLt5+k28SVckfVMMS0PEZayRk
         JJpSskA75NgHwpGItyeByLzB5Em2/TzFYxv5bnOjkxp4A3Jjd35RWbmHI/XwqCf9CZ9x
         onfsL6j55kmHPGvpZ8ibsU9aCzzyG4qKw8TBzJpmrHg4xg+OhEW9ApGvgwdhszoSc8Vz
         A0a9ZAnqJmtZP/t6epFpwW+y9vFw+FfW++Js/dV+vYoGA5VDsylaoVIIoIYYJejIM2ff
         fwJWqaJB/mKG+I2NXwNciOEo4g16Pd4TK7ZQj3tX8Qd5Zf3zc7vo6iwuV5cJStpR7cex
         Zw5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708934436; x=1709539236;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EA1HOX6hhzoxW91ktlrtGSHXMNTU0IR+9VU1mSSBE+g=;
        b=HYl9Tw9pJgcTL2OS2+/BtEfROM9ssR1vttT4dluVgCDYfUL6ni1qY9LwXhTsSroQ+p
         juDPUFppv9DOLrsQbOQE4RExNStx+CWzUOu6awock3rpQBxQV65cCAX/f5Y5qDOIe7sw
         5SZPKZJAhVw8X9V2XUe2SMswrab05L/w3dNKgbPRN2Q93X+OR8RUUmchE2dJhyNpYJqO
         05JICPmNxLZ/ydcPU3BaSawK8dfwqYkqHb9D/2Xmp3OPTmXWNL9Ang1t7uyTC0PR3NUp
         Bny8UMlWVe0341VE/pKVsn0lmzHD0akGVwTZiOrfUfvlrpTUbmEpwQzrN6obokscrtcW
         bQ/A==
X-Gm-Message-State: AOJu0YzqZ8UchjfeKK/zk99EJJfRYrEhSbyA0KdNOyd5USDX33Jo3r8b
	6REk9dWRxRLB0C95Hi5+wiJlgnbcqqK5QI2hekpQ7u4dRWAqDrays83cSaNiTQ==
X-Google-Smtp-Source: AGHT+IEpVN6+gaA1w7f2vk1TiHp24Pukl8qKgW9xRUA/aU99oaKVX/55/wuJQJAPTMf9s4l0GB0xMA==
X-Received: by 2002:a17:906:3515:b0:a43:6ce2:3836 with SMTP id r21-20020a170906351500b00a436ce23836mr480994eja.31.1708934435788;
        Mon, 26 Feb 2024 00:00:35 -0800 (PST)
Message-ID: <004877c8-9aea-44b9-aa93-65665b0d3a8d@suse.com>
Date: Mon, 26 Feb 2024 09:00:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 1/2] xen/console: drop return value from
 consoled_guest_rx/tx
To: Stefano Stabellini <sstabellini@kernel.org>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: xen-devel@lists.xenproject.org, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>
References: <cover.1708680104.git.nicola.vetrini@bugseng.com>
 <4998ec735bd7e5a50a229507e2b92ae56ec1ba4b.1708680104.git.nicola.vetrini@bugseng.com>
 <alpine.DEB.2.22.394.2402231456350.754277@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2402231456350.754277@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.02.2024 23:56, Stefano Stabellini wrote:
> On Fri, 23 Feb 2024, Nicola Vetrini wrote:
>> These functions never saw a usage of their return value since
>> they were introduced, so it can be dropped since their usages
>> violate MISRA C Rule 17.7:
>> "The value returned by a function having non-void return type shall be used".
>>
>> No functional change.
>>
>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> 
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

The cleanup is certainly okay, but would one of you mind clarifying in how
far this code is relevant for certification? I don't expect there are plans
to run shim Xen in any projected production uses for which certification is
relevant? (The subject prefix is also unnecessarily wide here, when it's
only daemon code which is affected, not console code in general.)

Jan

