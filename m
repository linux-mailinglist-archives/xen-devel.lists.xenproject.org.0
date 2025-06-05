Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1846DACED57
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jun 2025 12:12:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1006504.1385679 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uN7a3-0007Z4-4P; Thu, 05 Jun 2025 10:12:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1006504.1385679; Thu, 05 Jun 2025 10:12:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uN7a3-0007XC-1M; Thu, 05 Jun 2025 10:12:15 +0000
Received: by outflank-mailman (input) for mailman id 1006504;
 Thu, 05 Jun 2025 10:12:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qREP=YU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uN7a1-0007X3-Nf
 for xen-devel@lists.xenproject.org; Thu, 05 Jun 2025 10:12:13 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8bcfb912-41f5-11f0-b894-0df219b8e170;
 Thu, 05 Jun 2025 12:12:11 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3a525eee2e3so514888f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 05 Jun 2025 03:12:11 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-313318e68b3sm938496a91.9.2025.06.05.03.12.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Jun 2025 03:12:10 -0700 (PDT)
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
X-Inumbo-ID: 8bcfb912-41f5-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749118331; x=1749723131; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SlmIeEJT5BWcNEpDiD24E5X6BVHCrZzAXxRIO4kfmrM=;
        b=Dpi6tS8JzAPOSkrCmnmQkOyae830YkJLQkB/v3bb4x+z3IoSu5O52O0J9+ZgLvLMXz
         vkJvN76ESslNSgGlXLoNQfvjc2DOwob8Si1VucgY1mrADALKmmTRN8vDIyVW1o5NHGtw
         R86mTTM3l1U8qKwtkhynurFUDLPbZivdPZ09ITBEPAah5YIEJfHd0ggBEDNC2H7DQNsO
         Yq1Ks2oBxfr42VJb7WXu4/0jmWluITJzLti04Mg0bVSpXRj5yRchw+l/OrksQAH/Nxsc
         T5uAUU7+voJ1CjpCNfGK3TVraD4BGeLP+wko8WoB77ur0KcGNC/COPDbL8um/3IixQYa
         mPrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749118331; x=1749723131;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SlmIeEJT5BWcNEpDiD24E5X6BVHCrZzAXxRIO4kfmrM=;
        b=c5BHCOC70P9mylyDCrTsuMvgr4Lf+4V16iaTp6qHbXgxjnjGpanvwJYd/sGCVvu0Oj
         ZFyG3FRysKF5EKZvQ2keHAMHHldLgPzL0+LYaxjzsFSU+oScmUO3pvPpgmCCi7XSoJXb
         anFYZubXvZwF3vqfBivXD9tOov0qq3prA2QnE35WLwrlRuo2Ca5pOK/qSxrv77Y1+Pg0
         co5g+BtIzKyUunp4UU7ZnXpG68HWqIun7oUuv9K59EsZXbWxCbTsIsOSDfcnKrJod1R8
         e6AHAoSHEFnyZ/rRq8oANcEe4rtCOZ6V1Yvky3JUANbHxNV7Y337DuwaKbAqQX/4cnmK
         d3nQ==
X-Forwarded-Encrypted: i=1; AJvYcCVrwhnBXlWgzu2/Hw0Fbp5PSGSdU2HWUgk+9ysrPT5aqw6OiOh3AGGmDJqC1+CQxZhQ+2XwyKUQ7o8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzwGBV7JlWmCLXvl/UYNZGQ2keqdvNHG+GMT23Wpg4btdc/wcRR
	fqj7hmu2l70MOgothB3NgxkOFpe/QNcoV+3BskNHwvh9dA2RsHOFbYtyLiBkmVkZKg==
X-Gm-Gg: ASbGncsSGo0F+KFGziPkFPENmPMifWfu+EEh5Pqf9CAGap96rkI/m2YbIjw/AbbpIWd
	PH5ouudR6qLGAJm2GjR/6dKMQTgmiPapAyz4NRpX1J/FE03u/X6VsODGcLug2SEPMuPVLBM/BZO
	DXsEpQGaXCgcVgqPBM5z+5EqXB0zXK6duPvRq30TxKzR8xYx3S41kVrZVqj5L+b4fTYFuq6ZHqo
	EtlZCoAOAlgnB4Fza+cVSh3KaZqnkJ+j57o7xUCwy6zyiq/0IM2qDUquT4dMRpiqgm1oVXYe/nS
	KCfxn+yZsVPwc9xB0ifZPyMsfrudII/iVudSN6hO7N/h91xvCPGr510OLlyDlQ2nVlgh7JKS4Sq
	NmhM83ICRxPyfhNSYvu6uAKprgN/M97WUtW78tpdfVN9a+gE=
X-Google-Smtp-Source: AGHT+IFLbvL1j895C6+YcbIBEQIxK3IbI+Y0CKmk8pjhqLpyGfXp8RYUCkMStHo4eFmN9K4WknVerQ==
X-Received: by 2002:a5d:64e7:0:b0:3a5:1cc5:4a17 with SMTP id ffacd0b85a97d-3a51d96decdmr5160751f8f.42.1749118331195;
        Thu, 05 Jun 2025 03:12:11 -0700 (PDT)
Message-ID: <a328ed24-1d94-4bac-bf35-5b08b10b1f47@suse.com>
Date: Thu, 5 Jun 2025 12:12:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/5] public/sysctl: Clarify usage of pm_{px,cx}_stat
To: Ross Lagerwall <ross.lagerwall@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250527152635.2451449-1-ross.lagerwall@citrix.com>
 <20250527152635.2451449-3-ross.lagerwall@citrix.com>
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
In-Reply-To: <20250527152635.2451449-3-ross.lagerwall@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27.05.2025 17:26, Ross Lagerwall wrote:
> Suggested-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


