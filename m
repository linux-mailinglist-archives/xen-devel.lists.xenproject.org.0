Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17FBA8C581D
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2024 16:37:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.721607.1125174 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6tHV-0008VL-Rm; Tue, 14 May 2024 14:37:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 721607.1125174; Tue, 14 May 2024 14:37:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6tHV-0008TY-OX; Tue, 14 May 2024 14:37:29 +0000
Received: by outflank-mailman (input) for mailman id 721607;
 Tue, 14 May 2024 14:37:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VieR=MR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s6tHU-0008TO-Et
 for xen-devel@lists.xenproject.org; Tue, 14 May 2024 14:37:28 +0000
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [2a00:1450:4864:20::230])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7c73acbc-11ff-11ef-909d-e314d9c70b13;
 Tue, 14 May 2024 16:37:27 +0200 (CEST)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2e6792ea67dso59884421fa.3
 for <xen-devel@lists.xenproject.org>; Tue, 14 May 2024 07:37:27 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a17b015f7sm742302166b.146.2024.05.14.07.37.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 May 2024 07:37:24 -0700 (PDT)
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
X-Inumbo-ID: 7c73acbc-11ff-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1715697447; x=1716302247; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NvP4yLvMnC1cVmbWzh4ZmXRmEhCmleFWN5rjcW+9gLk=;
        b=cy6KICB7SOYiTfsVdqYgDDqMCFbdohsH1Eftvw71duBozVZg+mKzpr66l2FO7soMr3
         tCynWqF2rRPSHsra1wOnPeuY3LpSdZoUNykRRqA0XpHSbM+T2GNq1glVc1wKI5yqmcuI
         XRb3fqeLZeCLJoVKQY07UU4hYvGKMCMa1Y/N2TUjPHwr+MgOGP2084MWb78oR8GtvmpY
         csTKOgEAS7A2ZvBsXfiUitZwhi6Vmunqrhk+jCtann2sjqmNk0caw5M8w8eexI3dI9US
         UYgDcVSZRva0zFw/i54fitzYInNKZlk4SiVhEXnHlMcbsrEY8md1V2p4epM5X9+b0CpV
         DGEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715697447; x=1716302247;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NvP4yLvMnC1cVmbWzh4ZmXRmEhCmleFWN5rjcW+9gLk=;
        b=VBmc0Up6X6/3yjId0q3yYeoBrEqOfMGiL/R01AimLC6BO+Ugwxxph13WHnoxnrGt+1
         hKhlT8P8xMMR2S8Ty+W0zGn6LFiEikoSgazuCLRcMWBWpnV3Q809NYv99fpOwuTwTX7K
         PEwo7VEH7jny4dz7kJH1BPqN4EB3v+GFd4MB03w7sjd6EVGyFPpuKcuwu8m3q0wRzQm8
         r+XzhBITzuLqryJP0lcpnwR3zw7mswiuLwYjFCGy/zLmlGHQdweao1FjZMiNBRmPOs+K
         pqare7uirsgtcbXzeaj+AVt4huauBjKOkKI8CzFKghTGzLugP68AInQoVX0s+e3jV+y4
         VdaQ==
X-Forwarded-Encrypted: i=1; AJvYcCUoOXNXLT/pNe/z1ledbJF24xDkxGfmKkrXE6ktXm+sIt+61sTrwQhQHVQsPsJ3yJFdj+16sl+S4v/7qzQDMT/m/fknFcIfOPYducnc7cc=
X-Gm-Message-State: AOJu0YzEG2r/xa/3aXChHL/PEavuUsYQQ9BE3aWRfSOqYqV5nZBS513t
	M/WU6kQCS5w7u1QZTdI+voMfTTFif8iw+SNPHhvzEg7ussXdzuYSNm+7nWuA+w==
X-Google-Smtp-Source: AGHT+IEpGbgpVtl1MrlgrhkFmH7Ws7TmA7NO09ezKniJIOZaPhS6KFYni+aCG8FO0L3axAHki4m3rw==
X-Received: by 2002:a05:651c:2114:b0:2e1:cb0f:4e1e with SMTP id 38308e7fff4ca-2e51fc34061mr120325021fa.2.1715697445009;
        Tue, 14 May 2024 07:37:25 -0700 (PDT)
Message-ID: <74be423c-1210-452e-9450-f8006282144e@suse.com>
Date: Tue, 14 May 2024 16:37:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.19 v2 1/3] xen/x86: account number of foreign
 mappings in the p2m
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20240508112323.38946-1-roger.pau@citrix.com>
 <20240508112323.38946-2-roger.pau@citrix.com>
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
In-Reply-To: <20240508112323.38946-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 08.05.2024 13:23, Roger Pau Monne wrote:
> Such information will be needed in order to remove foreign mappings during
> teardown for HVM guests.
> 
> Right now the introduced counter is not consumed.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
Yet I think it shouldn't be committed (much) ahead of patch 3.

Jan

