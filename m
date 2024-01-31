Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C43A843A36
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jan 2024 10:06:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.673834.1048309 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rV6Xr-0004Zk-7H; Wed, 31 Jan 2024 09:06:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 673834.1048309; Wed, 31 Jan 2024 09:06:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rV6Xr-0004YD-4b; Wed, 31 Jan 2024 09:06:11 +0000
Received: by outflank-mailman (input) for mailman id 673834;
 Wed, 31 Jan 2024 09:06:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=q596=JJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rV6Xp-0004Y3-FP
 for xen-devel@lists.xenproject.org; Wed, 31 Jan 2024 09:06:09 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f8010727-c017-11ee-98f5-efadbce2ee36;
 Wed, 31 Jan 2024 10:06:07 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-40faff092a2so9182575e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 31 Jan 2024 01:06:07 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 fj5-20020a05600c0c8500b0040f44b5c847sm961153wmb.45.2024.01.31.01.06.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 Jan 2024 01:06:06 -0800 (PST)
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
X-Inumbo-ID: f8010727-c017-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1706691967; x=1707296767; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ztPObBMvm2jHeKYmDPmPd33ggMPo7dFXuG+6CAB2Vqc=;
        b=FO04rgxHJKDJgHFf9S177sMjfU110FhFqge/zL7S4VGHdGJOj6i91IxoBv2SL08dxm
         x6vH5IxSo4/pVGxboqy7olHxKgpjipTSB6jk86W5JBrWUnzsw/JJKaEThV+3xW+98Wz0
         VKUZWgUAVgEuLIi/PjphT/22WQOUSh39YWltiA1G7mSnAxYdAS0NdsiAPuHuj0zr4GrG
         7kpfJVzHQ8z4zI9uZPHZffUspPNI7DtIPzunZWz1RG4tHoF2bldKWUp73fXRsb8aNkIX
         3wmQA4Foi7VRDw4zeMedmG6YNFS2Nf9xr1NLwwczxM5ShzaFNyE0gnakFQTBJBWcp6AY
         W2iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706691967; x=1707296767;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ztPObBMvm2jHeKYmDPmPd33ggMPo7dFXuG+6CAB2Vqc=;
        b=YNj0F0S6+EqfVi/8GI0j8PjbJWF8RzQN1c4h90SlvkRSB+b6Fw0oMni1/YsYXN//IU
         Zoq3eMSOrUu9a00BF6X3hB5VylDnUndbjvTDyH4kBA4g4H7YkpKA+3YtwmH0YhUV0n32
         R+NJGim8WYGgcjRMbtknWrgSQpgupTZZ7ASmQcuUbyP7lGQCYTEmcwkH9D3535NnxHVZ
         d0PFviNXC5+LR99PvnDWLHO5MIrKl3gwj0+jxSRcWZmyi3JnhYQYplfZ8ccKV93vDxbb
         5rIAWb4NrE0lUKVTFdGgBxPvYoAzNvLYH++D1yzNPKM5ZLTSHRkBd0ShYqo86balO1fd
         D1Aw==
X-Gm-Message-State: AOJu0YxaRm1iViQjLzXXgErLfZR2NSXlB8rjEqMBpenThDdLYnMRqcz/
	KHP+yLkb+v8qOSm/kw4tb078cjjpBI4lqCiDj/sd20yTjmt+Sr7jtptsU+l28A==
X-Google-Smtp-Source: AGHT+IFxmq7MHkoCXYW6NsF/eJrCkYZbFH7dlmmxHTRSVXaL+w86S81ReRdVmh5fuKKLkcqCX0cRuw==
X-Received: by 2002:a05:600c:241:b0:40e:a7cf:10e0 with SMTP id 1-20020a05600c024100b0040ea7cf10e0mr892891wmj.20.1706691966909;
        Wed, 31 Jan 2024 01:06:06 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUR1YZ/8a7A35JMUXU+Hx3RTFeS3YcWhl83hBuy3gB2ybGFce3fhMDx138M1ib2zb15ZLM1BbPZFWQoxGmgu92p8iHrDcNAdUoVCUHxnp5bSWGqKlB+YBZ4l7wlJEs0Xi6vXyVD7pNWX0yD4KaW76BlU7gqRPsHV5YSlX8s2ISKtBgv
Message-ID: <25b705d0-76e1-4328-bd5f-7204d08ffb86@suse.com>
Date: Wed, 31 Jan 2024 10:06:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen: Drop superfluous semi-colons
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <George.Dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Julien Grall <julien@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20240130221808.104878-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240130221808.104878-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.01.2024 23:18, Andrew Cooper wrote:
> All these cases happen to be benign, but drop them anyway.  This is one step
> towards making -Wextra-semi work.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



