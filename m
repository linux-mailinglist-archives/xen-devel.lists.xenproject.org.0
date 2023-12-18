Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78479817816
	for <lists+xen-devel@lfdr.de>; Mon, 18 Dec 2023 18:04:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.656285.1024372 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFH2C-0000Ma-5M; Mon, 18 Dec 2023 17:04:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 656285.1024372; Mon, 18 Dec 2023 17:04:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFH2C-0000KG-2F; Mon, 18 Dec 2023 17:04:04 +0000
Received: by outflank-mailman (input) for mailman id 656285;
 Mon, 18 Dec 2023 17:04:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=h3b+=H5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rFH2A-0008KY-UG
 for xen-devel@lists.xenproject.org; Mon, 18 Dec 2023 17:04:02 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 716de30f-9dc7-11ee-98eb-6d05b1d4d9a1;
 Mon, 18 Dec 2023 18:04:02 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-40c517d0de5so37772875e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 18 Dec 2023 09:04:02 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 gw18-20020a05600c851200b004063c9f68f2sm41986948wmb.26.2023.12.18.09.04.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Dec 2023 09:04:01 -0800 (PST)
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
X-Inumbo-ID: 716de30f-9dc7-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1702919042; x=1703523842; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q1JbI75M+ZXmGjjQUcIafal5xOGn1/ryxUMTL8QIsSo=;
        b=goB0TbIm3Jbat0HcWnxF7W9ysa5JcabDeZeGQbJn4YSbJP+6hZGmsMTjJKS4OhWc94
         5dtwQIwUGlM4EMm6MnOVsJ4zEBq+zhlEbqLAUnPd60mHOSSSdH4zAcjg++FUQYEpMp99
         fdD+YARFn70aTry74RCpJKIo2ChKPyvv7T9nK6AATPuHg4nzjNOfvsI7JcTx7lGoyvEV
         9sPUVV7lHYVdxdBwkN2HssLmWgF7odTQB+/OJ4nnMvCvsZnLSu8MuTKtV0BbmoF3ZodD
         yi+X9Uo7NuVfCKrjIuszeX6DvYhs3wPYc/6iu6DPoR6I/YQTXRTJYKSN/Wke7dBGO2K+
         33wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702919042; x=1703523842;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q1JbI75M+ZXmGjjQUcIafal5xOGn1/ryxUMTL8QIsSo=;
        b=rlvTKZE6iCXFrPSpEYjZjN7SsdE09mtliR1XZCV0XMbMqSW4kRb2WQjVejdcHiuDyY
         GgAwXH2L6ZF3F9RDxqILjbZGn8+zodQph02Zzf0a3m7q79kP/VqIec8Wrgn/pBAfr1E4
         2ChB7jvw0fnc5PH8HwMqAiPVQMAhHMrrVcdmsIkzy+24Ks7RZcsngT9V7IdG6FgRI+2K
         w40X7cK7pQj79vDA6PAkwjfjPns8KnIswkEaBxxGtJvsT3KwVAI6dKp6NCKxqp/xlWEc
         Me/bJzXijUwelbiqadxTypz/kiuNL3vG262xT9SXHJeqAoEZIC5mRjRmUFdWB6BrugDV
         8CXg==
X-Gm-Message-State: AOJu0YyXKtTSik4MyYCuZHqaG4AUEztudTD/UAApUqLwt1OzJiqG1lJS
	z6HmkjRDSYW39SsUFE+AZOM9
X-Google-Smtp-Source: AGHT+IF/CN5nVRHlxU76PBda4+e+7Ekh/yKJVpOkzC+TDLO5qB4Kzir9moQLl2IvgBNa3forcrR7Kg==
X-Received: by 2002:a05:600c:35cf:b0:40d:1c37:c521 with SMTP id r15-20020a05600c35cf00b0040d1c37c521mr471197wmq.145.1702919041854;
        Mon, 18 Dec 2023 09:04:01 -0800 (PST)
Message-ID: <32563f17-cd3a-4292-b8b0-cb2302859714@suse.com>
Date: Mon, 18 Dec 2023 18:04:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 2/5] x86/ioapic: use NULL as a null pointer constant
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: xen-devel@lists.xenproject.org, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1702553835.git.nicola.vetrini@bugseng.com>
 <01968117d9fc3eee6d6eca0d340d9d2edd4d6dd4.1702553835.git.nicola.vetrini@bugseng.com>
 <alpine.DEB.2.22.394.2312141330230.3175268@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2312141330230.3175268@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.12.2023 22:30, Stefano Stabellini wrote:
> On Thu, 14 Dec 2023, Nicola Vetrini wrote:
>> Resolves violations of MISRA C Rule 11.9.
>> No functional change.
>>
>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> 
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Acked-by: Jan Beulich <jbeulich@suse.com>


