Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4248B16D6D
	for <lists+xen-devel@lfdr.de>; Thu, 31 Jul 2025 10:23:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1065030.1430362 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhOZ7-00026D-8z; Thu, 31 Jul 2025 08:23:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1065030.1430362; Thu, 31 Jul 2025 08:23:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhOZ7-000243-6E; Thu, 31 Jul 2025 08:23:05 +0000
Received: by outflank-mailman (input) for mailman id 1065030;
 Thu, 31 Jul 2025 08:23:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lm68=2M=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uhOZ5-00023w-Lb
 for xen-devel@lists.xenproject.org; Thu, 31 Jul 2025 08:23:03 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 92b75510-6de7-11f0-b895-0df219b8e170;
 Thu, 31 Jul 2025 10:23:01 +0200 (CEST)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3b7825e2775so101812f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 31 Jul 2025 01:23:01 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b422bb09d1dsm914930a12.58.2025.07.31.01.22.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Jul 2025 01:23:00 -0700 (PDT)
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
X-Inumbo-ID: 92b75510-6de7-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753950181; x=1754554981; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wO8l7zwKZjaMOZBibCk8qJwuis6zorRcDprhdNdBBxM=;
        b=AUd52iJ4XsJAgIPwoxe+3e1gki2ih85NbA79BMb7PLdaYz63eFVlUN+YbxVPDfFScZ
         tE9SQuZ8N0pcR7Od7m+5SIo9u34JXca7r8FOx/JofdTO4+J9BC7mXvUxKUaB/+zgg+rq
         66mp73D6RBE/gtLogk/DPICMRDmKIi3lcYTAAniQ0t37eUEQoGjn3qOBuvnlYfQ+Fh6C
         SjCwKaBnhWebMNMm6fGDV3/inhuDWqegIg6bM8aZzUy913WVQ1IcPAkJyP/5CnN/eSfW
         bTnsnRghpU51/npB+sf6b2xFX0HEOHuHBXFtPbhtlxf1p1IOWFXftoC5BQ4key+9TWdS
         /02A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753950181; x=1754554981;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wO8l7zwKZjaMOZBibCk8qJwuis6zorRcDprhdNdBBxM=;
        b=t0PdBDD7TA6JpthVfdXlWC7hJ9RnQv0dm2AU9oElk9/HdymyJbIbiixq0HNzmw2tpn
         p/ztyBYagzgZWtC9SlC0qVk1xyhJ2us92KAYHCyvVdVSByKIBVlx8kqvu9+nE4BBrfo+
         kgUEKfVxF73uZ8OYT81AVxb5YqZCmfRztWzhXIGywYVnYI5zKNb+Hvip+X0rd94dz++k
         tOlhb8HP+pe1G1y1I/KvlWAABSajla3caCuVdhvI4dxGXaUGN967R/hCFtJGGDfXnM3Q
         7Kt8pmvxA3UB3D5kZXcaWLNX6Ou6ff9zBB10W0/AGgutdbk57B3Z+s6u3tmnn40fw9AC
         K2xQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGBIVL3UzP8c1jiIGrgD67gk2ULbUpAL5rE5Jhxq0T2Njw7pv1nQbphPqROvxXrE96ofmGQk572Ak=@lists.xenproject.org
X-Gm-Message-State: AOJu0YygiHfaBDl3iBcJsKHGX/LbhCw80IksC1A4fzcU6Rm2isISMYyt
	P9tOg6Dkrqu7vrBxu2eYCOaVNNdPtvdCMUq+l8TIbqLvJbrMafSOw6H2VsvEo/MZ+g==
X-Gm-Gg: ASbGncvs+90Dfp03ADWHHjme8ul+hwKBuJUwSfH/ZNyQppmdILxqdPOReAFv19QLjcA
	lUYXPIuurGxwDJk+i74ti2pnxm+GWqGDJ92V0rYi5wel6alr8KsNpxDRJ3C9QpDaFINCa9NJ5z2
	8ZdgxqR2ClU3vYDig/kAhtZCPxR6AHWFk2KLFaa8qp2gtERHKLIHvxfm2+fY23tyNelb4crmHhe
	svIm5NfUpr9dYhJyB/UJLMP4xvnIpK6l+ELSqLPNdE1G7X1NRF2GO8YlbOiZZyT2Dhk3xqVKYnX
	gkKUu04Y35HtgSZdEY+k++dahXZ5wB2aPTq/3xXFZObG72yQHAxwB3zcRLC6J+c2ZHMcgTdGuD1
	olDIPI0FerdHlNIgUu/MahYHrxIJhy9NLcWbPfNDa0eXFXmQel42q1J9mAWtSrbZqJO7v0BAUZ5
	8SK3oiZhM=
X-Google-Smtp-Source: AGHT+IHc91KHl5EknDVB7rt5digGF1fDKUoRJQc4GytKx+GWVEw398TVZhT95Rd7HEmWLN0LuAbKlA==
X-Received: by 2002:a05:6000:4201:b0:3b7:6d95:56d2 with SMTP id ffacd0b85a97d-3b794fe5acamr5017500f8f.7.1753950180999;
        Thu, 31 Jul 2025 01:23:00 -0700 (PDT)
Message-ID: <8d2d444c-29cb-45da-9bf0-03dac4d01cb8@suse.com>
Date: Thu, 31 Jul 2025 10:22:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] common: Make livepatch dependent on HAS_VMAP
To: Michal Orzel <michal.orzel@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250731080522.810468-1-michal.orzel@amd.com>
 <20250731080522.810468-3-michal.orzel@amd.com>
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
In-Reply-To: <20250731080522.810468-3-michal.orzel@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31.07.2025 10:05, Michal Orzel wrote:
> It should not be possible to select and build livepatch if HAS_VMAP is
> not selected. This is the case on MPU systems.
> 
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

I agree this is necessary for now, so
Reviewed-by: Jan Beulich <jbeulich@suse.com>
But in principle live-patching ought to be possible without MMU as well,
just that the code will need suitably enabling? If so, it would be nice
if the description could somehow express this.

Jan

