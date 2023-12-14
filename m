Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB3F581328C
	for <lists+xen-devel@lfdr.de>; Thu, 14 Dec 2023 15:09:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.654602.1021694 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDmOf-0000dR-Sj; Thu, 14 Dec 2023 14:09:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 654602.1021694; Thu, 14 Dec 2023 14:09:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDmOf-0000b8-Q9; Thu, 14 Dec 2023 14:09:05 +0000
Received: by outflank-mailman (input) for mailman id 654602;
 Thu, 14 Dec 2023 14:09:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xmUX=HZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rDmOe-0000b2-6p
 for xen-devel@lists.xenproject.org; Thu, 14 Dec 2023 14:09:04 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 55458806-9a8a-11ee-9b0f-b553b5be7939;
 Thu, 14 Dec 2023 15:09:02 +0100 (CET)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-54cb4fa667bso11286016a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 14 Dec 2023 06:09:02 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 bd18-20020a056402207200b00542db304680sm6758770edb.63.2023.12.14.06.09.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Dec 2023 06:09:01 -0800 (PST)
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
X-Inumbo-ID: 55458806-9a8a-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1702562942; x=1703167742; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GmWhQM7YanA96EdTlyUm4HZCcbp7a4LN4ZYdiGu2HCo=;
        b=W7PFIya3czJ1zKqUbFdx+G2kIPU+0gkQeZMLMb3YJGRZzeLKztNwy1rCi9cFl7wnW+
         +u1zh/rCLERkaETs4kl+NlCjz1cZSYfZ6sbtsstIGGkfqshk+XesnsuJwH5oBVBIjZDG
         6xstYXm7erx3y9+lNTiuTNnxr/huGkMmLZU1wz/Ycmqp0pP7WeRYLy+5kKspFJwDHyyH
         6sr9SKaWteKubnJT4L6wxYb7Z9RsqymytpP1enqZ/SOWwy+rZFXqReV9g37L2PoT7GQB
         CuWc16KS5CkqIc8VNyivzNZhriYw658Doa9xWcQgy72NC9FwNeilJ3i/zSpqX/etMdap
         nJGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702562942; x=1703167742;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GmWhQM7YanA96EdTlyUm4HZCcbp7a4LN4ZYdiGu2HCo=;
        b=wedwsu6kky4nrz/nISSjHp/ZxZUcqUCM3I2lrK6YU4AwXQgcaaw6uDrO14EMfooV0r
         zOf2oiqG/18/3ESYNW2xGn1hVS1APC0u4jUXrs5TD28q8ry5gcoxgoNM0ilUjMPuTVsd
         3ncCsIOU51IhwyidB7Tm+S+biQ305W4HlXOzGV0iQf+3HVElTRsXC8UsFW2iTRxN7vP5
         ETZM5xeiixdlFOrRCDOCvFFZjDfOLDi6bBR0HD14ydzD7iNUZ/iUvaanD12Tryn/amm3
         vJomhhoiCe1G7xQ4ry5Pa/JkuS+egMIOJa93mwlj/hl9O4wTH6KKpP55SM4Xccn+beRr
         XCSQ==
X-Gm-Message-State: AOJu0YwqSdcYAdBF+G87iLFlFlB89vOtiMuiUCHH/saPNarPPScTQ3AY
	2YtxPi9ZLQsrhX11QrcwM/WE
X-Google-Smtp-Source: AGHT+IHOYu0IywXbblt3CyuLRmfX20sR4w0FYIK3Sb82an6dLAkB3ONBB29ARo77faotdVflSw1trw==
X-Received: by 2002:a50:9b43:0:b0:54b:c09e:ff40 with SMTP id a3-20020a509b43000000b0054bc09eff40mr5535730edj.8.1702562941876;
        Thu, 14 Dec 2023 06:09:01 -0800 (PST)
Message-ID: <479cd511-c01b-4460-bafc-2d3943956914@suse.com>
Date: Thu, 14 Dec 2023 15:09:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 24/39] xen/riscv: introduce asm/irq.h
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1700761381.git.oleksii.kurochko@gmail.com>
 <e9fc98cad562dad495ac1eb87b98be77cda72524.1700761381.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <e9fc98cad562dad495ac1eb87b98be77cda72524.1700761381.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.11.2023 11:30, Oleksii Kurochko wrote:
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> Changes in V2:
> 	- add ifdef CONFIG_HAS_DEVICE_TREE for things that shouldn't be
>       in case !CONFIG_HAS_DEVICE_TREE

Is there going to be a RISC-V build without this enabled (selected)? If
not, I'd recommend against such pointless #ifdef-ary.

Jan

