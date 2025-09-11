Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53012B5305F
	for <lists+xen-devel@lfdr.de>; Thu, 11 Sep 2025 13:27:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1120011.1465120 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwfSs-00053T-JX; Thu, 11 Sep 2025 11:27:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1120011.1465120; Thu, 11 Sep 2025 11:27:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwfSs-00051z-Gb; Thu, 11 Sep 2025 11:27:46 +0000
Received: by outflank-mailman (input) for mailman id 1120011;
 Thu, 11 Sep 2025 11:27:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dUpj=3W=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uwfSr-00051d-Qg
 for xen-devel@lists.xenproject.org; Thu, 11 Sep 2025 11:27:45 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 50c43d2e-8f02-11f0-9809-7dc792cee155;
 Thu, 11 Sep 2025 13:27:35 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-b045d56e181so91147266b.2
 for <xen-devel@lists.xenproject.org>; Thu, 11 Sep 2025 04:27:35 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b07b32f2f00sm110953366b.93.2025.09.11.04.27.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Sep 2025 04:27:34 -0700 (PDT)
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
X-Inumbo-ID: 50c43d2e-8f02-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1757590055; x=1758194855; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=D3k9V7BvoneZ+R9aMKc7bJA7A/iHy7smlcJ7KB07gDM=;
        b=Hft1aNhFuLcFxWIeVDAb0PFsCOOlYP6i19t8e8GQthKnjzi92V1KpV7PxXkZCAeSoe
         WZjFQHw1tu/BcUVJLt0/0SqGlquldZg5xLSQoer9hZ/pnWk2oYOGjt/RZ4996WFlcZpn
         PfsRdlbR4Y2hqph1mTwnNsF2y2poOn9iucPaezN2Dmnyeb7LQ80tTks2cZMHV3Urvfzs
         HZKbhKt8o9mlXHZUybHREllTCU9tCu2iAUNJkr8gvqlQLV1g32CpjhuGPpehPu5RRh9F
         BauDFfRG41yLxile4RVL8wgLCAmMPO4QiCSkfJFEs6O76wRB0zlEZhWW8iBcbCijp1CM
         p10Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757590055; x=1758194855;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D3k9V7BvoneZ+R9aMKc7bJA7A/iHy7smlcJ7KB07gDM=;
        b=FviQuqgp13BY48/6SEH/SUKWRNXkie+NTt3MKz1LfvBFElktyToYW66RB7KCEwkctH
         cryG7EDrdT/WpWdf8E/q/xYwNc0UlSGl4OuUO19qSvsruthst7jd3dtFgiZrSX3HCZMA
         Jn8b3f2/hSEakm90haXnFCIqv2DHtD/tmIrB8MIf0iAOMqopUcsUfLF8Ttn7xMady9xs
         fXkVTjMDikfe+m7fe+aNreq8o2WqgvF6B3WUo6YmUlubDUnVsfK6l0ixLYXNPrcvh1/M
         TzWj6aQhp/puYk+Mur4bhnsbDV98bPSJwuaBKDr/VJKLJ3PvlyElIZYNc/9rFv5BNdkz
         XoFg==
X-Forwarded-Encrypted: i=1; AJvYcCXnne2XmYovvVQYI3aITi3UCtfQd2ORAtfGAyv6umOVAg+FFRs89fwOM2PLaZzcmGVPAA1kXu8jbNA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzISfD9tW9O1SoteMTghfbeKJVTaw36fhWJ0PVthE54HUkcfA8K
	xQSAIwU5vFefwD8PHzwTziwErz9EaREgrbmfBCKHJaKXy3gzQ8iJZmgd9m2zggoLcyFUDqSoU/r
	Afbg=
X-Gm-Gg: ASbGnctEPh9M+K/u5VgOJ6dhKMlj59Gy1oVkP7evQaKFgCzGN9V9jgEjnzKGGFZ1V/S
	X7n8Szhu1Qvum5E6999jSHrajH/5KRtsCzOg81isWzvKCUltxmTbh2vHX70UEgSHEczZhIz+IW1
	AQKJBkJO278XeTkXJH7eo1Zb2FGpDtsrTCMILg7VPH0v4TRDES6TiMDK/qyFL1zqhR/LScnFadj
	bP0dGdO/yNzL5BOaXnWJL9moF2CzI/lUNn7oSSF/SQBLOP/WRV9Ub1oZPrD3WYo6Z33IQ1SWAlq
	sLfF/mpKzcJyUXUbAyzV7dkHdjY2h0SCRXKW0/tOzZPluQjI5YsgV4rrV0RBEiESZf5sJ6jrlYx
	Ng84SVaYMFADl+lzIxY17tjcFNcpHkdL74qhYEqzBdo4aQFC3SjPaikxV4SKpNlvZlLk3KW1hI4
	EsdTgZdrOBiO13kwPDkw==
X-Google-Smtp-Source: AGHT+IEB4R4H+f3wOlx1oU548+arFi4icehlzbGM5eEGWPK1h06bTMcdo1qjw2lkWlkkDRiRRvuXUw==
X-Received: by 2002:a17:907:96a7:b0:b04:a39:9b98 with SMTP id a640c23a62f3a-b04b13bbd11mr1792929766b.5.1757590055006;
        Thu, 11 Sep 2025 04:27:35 -0700 (PDT)
Message-ID: <2d4bed7a-352b-4090-a07a-fd617e2f932b@suse.com>
Date: Thu, 11 Sep 2025 13:27:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 16/26] xen/domctl: wrap arch-specific
 domain_set_time_offset() with CONFIG_MGMT_HYPERCALLS
To: Penny Zheng <Penny.Zheng@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: ray.huang@amd.com, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20250910073827.3622177-1-Penny.Zheng@amd.com>
 <20250910073827.3622177-17-Penny.Zheng@amd.com>
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
In-Reply-To: <20250910073827.3622177-17-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.09.2025 09:38, Penny Zheng wrote:
> Arch-specific domain_set_time_offset() is responisble for
> XEN_DOMCTL_settimeoffset domctl-op, and shall be wrapped with
> CONFIG_MGMT_HYPERCALLS
> Wrap XEN_DOMCTL_settimeoffset-case transiently with CONFIG_MGMT_HYPERCALLS,
> and it will be removed when introducing CONFIG_MGMT_HYPERCALLS on the
> common/domctl.c in the last.

As I keep seeing this same wording, I finally have to say something there as
well: For one, the last patch doesn't introduce CONFIG_MGMT_HYPERCALLS on
common/domctl.c. In instead makes the building of common/domctl.o conditional
upon that control being set. And then, "in the last" (btw - last what?) is as
unhelpful as "in the next patch" or "in the previous patch". When writing
commit messages, you want to make sure they make sense all on their own, no
matter in what order patches are committed (in particular possibly piecemeal
and interspersed with other patches). Possible replacement wording:

"Wrap XEN_DOMCTL_settimeoffset-case transiently with CONFIG_MGMT_HYPERCALLS,
 which will be removed again once common/domctl.o's building as a whole
 becomes dependent upon that setting."

> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>

Acked-by: Jan Beulich <jbeulich@suse.com> # x86

(i.e. specifically _not_ the common code change)

I also wonder what our (Misra related) position is towards leaving declarations
around in cases like this one, where they're not in support of DCE-ing of code.

Jan

