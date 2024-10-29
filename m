Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D49F79B4446
	for <lists+xen-devel@lfdr.de>; Tue, 29 Oct 2024 09:32:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.827124.1241632 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5heY-0007Pr-GE; Tue, 29 Oct 2024 08:32:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 827124.1241632; Tue, 29 Oct 2024 08:32:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5heY-0007O9-CW; Tue, 29 Oct 2024 08:32:38 +0000
Received: by outflank-mailman (input) for mailman id 827124;
 Tue, 29 Oct 2024 08:32:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=E68c=RZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1t5heX-0007O3-HA
 for xen-devel@lists.xenproject.org; Tue, 29 Oct 2024 08:32:37 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 59e1181a-95d0-11ef-a0c3-8be0dac302b0;
 Tue, 29 Oct 2024 09:32:36 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4314f38d274so68381855e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 29 Oct 2024 01:32:36 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4318b55f50csm166292855e9.17.2024.10.29.01.32.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Oct 2024 01:32:35 -0700 (PDT)
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
X-Inumbo-ID: 59e1181a-95d0-11ef-a0c3-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730190756; x=1730795556; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=K/qOK6tCJPY12sV6UaSGMBHPTcaI/MeIurGvWv4Eyxk=;
        b=DRoTCZU6VkXoQZ4yrlejHmQzOLDmz7tFASCnFK0jOgO7A2KVqQvM3ikucwm8azmZ27
         ImobJszRG9Sp1jhmOXxgi6sqkk6iNHMm/tTGslA3rr//uypH0b905saWoysOU/KczecD
         O4grVX9zp9U5PxPEmKPRDOb7c04rVLx0dzNJU4pyx8Og09q5dRFtIV61AAIoPpzpvg7d
         2wCx2jLyWYyGUCbYRscpM5PBU4sF6+SvZ55RnOt/+5r+jiO/8yE9Bp4aZnIhwgZYHQgV
         SK9CUVrKxkbaSzm02q8OmNOGEDIa0qfmgjZd+jmJLIsRtaZTm1F8wTBmhyj75t6xewk0
         M2qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730190756; x=1730795556;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K/qOK6tCJPY12sV6UaSGMBHPTcaI/MeIurGvWv4Eyxk=;
        b=APrxbJaa8xgCLtyKKhZ1rgpAqp0S8orIuwxBWiXuWcJqfxhOOrIhfXoe/qm6PzbKw9
         NY76PmDRNFc7fXOvbXHhEtqhjmqXQ9EC52kH/KEapXK19gSbXmjYphzQ9I5Rno7LD9N4
         PIjDXYy8rUN0qXlcEAxId9OFw8zs7nBiASHEGK3+339e+A8xPhtBggffYHUrDZCBHxao
         uHQEOFiUZvRddAA8C5FGtMLon6EVkcQ6L06XxVJGipWTudO2YNQE5HhjgZkmbR0sjGup
         9z9lD59QHG9iRTXwM6z6imIzPUPU8YM3jMgCi9a4fqXt7mH1+uTUiKpPN9Bfax9PP+uy
         5cWw==
X-Forwarded-Encrypted: i=1; AJvYcCWaiJBoqomU7NSLfpOLpqxgLBD2FWGBuym1ur+pRdtUChv7QS9HYD0BoQkRqZrPYp2SxN7kSWeBrgU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy9qcCsDnfgV6kRxYXMbJMiUKNYw0cJ+GpO3pMkGKvWmPoAeVr2
	Oo3WQqr4ljd7YnWxPsWBEowVFvLq1qYAjiSjI3fHRmKIrwF/DGjqt/77Yh+z0Q==
X-Google-Smtp-Source: AGHT+IFVxAhRD8e0BHuVJpRT9ogdnRnrV0ltpe17bKM11AvbxhlyUzfHea30qa22T/LWdKXjE3+rKw==
X-Received: by 2002:a05:600c:4f56:b0:431:562a:54be with SMTP id 5b1f17b1804b1-4319ac98af1mr112198785e9.9.1730190756146;
        Tue, 29 Oct 2024 01:32:36 -0700 (PDT)
Message-ID: <dd81f45a-bb3f-4c65-a517-3ec2c56a9912@suse.com>
Date: Tue, 29 Oct 2024 09:32:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/14] x86/mpx: Adjust read_bndcfgu() to clean after
 itself
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20241028154932.6797-1-alejandro.vallejo@cloud.com>
 <20241028154932.6797-12-alejandro.vallejo@cloud.com>
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
In-Reply-To: <20241028154932.6797-12-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.10.2024 16:49, Alejandro Vallejo wrote:
> Overwrite the MPX data dumped in the idle XSAVE area to avoid leaking
> it. While it's not very sensitive, better to err on the side of caution.
> 
> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> ---
> Depending on whether the idle domain is considered ASI or non-ASI this
> might or might not be enough. If the idle domain is not ASI the XSAVE
> area would be in the directmap, which would render the zap ineffective
> because it would still be transiently readable from another pCPU.

Yet that needs to be known / decided before this change can sensibly be
acked.

Jan

