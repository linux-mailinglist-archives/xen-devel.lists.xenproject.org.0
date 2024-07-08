Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FDDD92A537
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jul 2024 16:57:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.755468.1163829 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sQpnK-0008Ce-0c; Mon, 08 Jul 2024 14:56:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 755468.1163829; Mon, 08 Jul 2024 14:56:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sQpnJ-0008AN-T5; Mon, 08 Jul 2024 14:56:45 +0000
Received: by outflank-mailman (input) for mailman id 755468;
 Mon, 08 Jul 2024 14:56:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=suqh=OI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sQpnI-0008AG-JH
 for xen-devel@lists.xenproject.org; Mon, 08 Jul 2024 14:56:44 +0000
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [2a00:1450:4864:20::231])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 49749436-3d3a-11ef-8776-851b0ebba9a2;
 Mon, 08 Jul 2024 16:56:42 +0200 (CEST)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2ebed33cb65so51157731fa.2
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jul 2024 07:56:42 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fac1535b89sm186858165ad.137.2024.07.08.07.56.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Jul 2024 07:56:41 -0700 (PDT)
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
X-Inumbo-ID: 49749436-3d3a-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1720450602; x=1721055402; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=PZu5lU1bZm0wn0+gvaQQcQeORqghi90Aa3WEid/B6BQ=;
        b=BYTTMtYF7uWAr9lcZ3m1qiTg0/vAgJdKZGhmm2JWyGQSdMMpQAVY/seqF05hOU4xCA
         VJ3b6AfUjQ8RdTf2TUesz4IDuk88JCrIED/n67D6aQRUv58ntRZMI3x4Y+VL5dQMojBd
         xOcNBiMdM5q5SeXlFw2qcl17jFcTy0MqZy2TfgRIErs239O57V4T2dncwPFMtWBgZgfU
         BilC6DrOlUSUuE4FGRH1Q5MNP+EK08TnVYgRp7dE/aQDoys2I6rOXctR7Oa95O5pApmy
         IAOLEceVoEqeNyT3TMiQ8LfHoAhBCDKyZObZ4SWc8uMEQrnBkBYhXwMAVpo3lyLzhFZ6
         2PlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720450602; x=1721055402;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PZu5lU1bZm0wn0+gvaQQcQeORqghi90Aa3WEid/B6BQ=;
        b=mSx5O5WVzvnaZwORghvgS6xcK/5JyZyjEyvURL6OzvFP1VhnxwLJKpPzGsTYNGEQGr
         BBXkh9EqKBNQrbmUoTPwveWs6FLwaPTQ7q8V9FbBSGFOGhWNEUB8O7+67aVuxWSj6E0m
         AVl5bdECfG3n5wGLKJfNxHXwMVECnqXswveoYUVQSK5hK4F5ifvdzoC9II+bUi28lolc
         HVPmJfNdmrmMCzSaxeGX2WOD3fcfQ60yK6R7qi9BRxDTksTRQ909U7GVpyTbiQsNYCNY
         xQp44jfSmsT9TJidYe2jBHuAzUvgqTHrdaExid50u9hxaSWjU4DqKj2US6oYIpUJcowV
         gz0g==
X-Forwarded-Encrypted: i=1; AJvYcCWq+69Yvj1CT8gp61aV8z+LVux7sVwdy74NtAGcsMGbGvIPIl1wX/NbdMd9pJNp0uuO3O8sbq5hW1d/8HlDUy3k53Wkg2TkQUSZy4qbNyU=
X-Gm-Message-State: AOJu0Yyahd7SjKvqdnpjdYyJEFYyZk/t3ieP6gZxfd8ivY8NHQZs2Fqg
	hc1m9Kr0CvOdo8zqys7J2l32SZlmO0lXeRs6tktSwULf5FWLvbW7NN7mI+jzvg==
X-Google-Smtp-Source: AGHT+IFfZVrErqLsR4IuR4xLWoAb5bmfWfOFmR2FBPwrj6ShDDvSFRIjya241TXlJWZp/A2HD6onTw==
X-Received: by 2002:a2e:8456:0:b0:2ec:56ce:d51f with SMTP id 38308e7fff4ca-2ee8ed42d0dmr73137031fa.20.1720450601734;
        Mon, 08 Jul 2024 07:56:41 -0700 (PDT)
Message-ID: <3b2c9019-b907-44d0-b767-315f7d42a2a1@suse.com>
Date: Mon, 8 Jul 2024 16:56:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v12 1/7] xen/pci: Add hypercall to support reset of
 pcidev
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony@xenproject.org>, Juergen Gross <jgross@suse.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 Stewart Hildebrand <Stewart.Hildebrand@amd.com>,
 Huang Rui <ray.huang@amd.com>, xen-devel@lists.xenproject.org
References: <20240708114124.407797-1-Jiqian.Chen@amd.com>
 <20240708114124.407797-2-Jiqian.Chen@amd.com>
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
In-Reply-To: <20240708114124.407797-2-Jiqian.Chen@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.07.2024 13:41, Jiqian Chen wrote:
> When a device has been reset on dom0 side, the Xen hypervisor
> doesn't get notification, so the cached state in vpci is all
> out of date compare with the real device state.
> 
> To solve that problem, add a new hypercall to support the reset
> of pcidev and clear the vpci state of device. So that once the
> state of device is reset on dom0 side, dom0 can call this
> hypercall to notify hypervisor.
> 
> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
> Signed-off-by: Huang Rui <ray.huang@amd.com>
> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
> Reviewed-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

Just to double check: You're sure the other two R-b are still applicable,
despite the various changes that have been made?

As a purely cosmetic remark: I think I would have preferred if the new
identifiers didn't have "state" as a part; I simply don't think this adds
much value, while at the same time making these pretty long.

Jan

