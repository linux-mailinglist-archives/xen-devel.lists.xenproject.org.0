Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F20B6A98238
	for <lists+xen-devel@lfdr.de>; Wed, 23 Apr 2025 10:06:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.964093.1354963 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7V7X-0005lT-EF; Wed, 23 Apr 2025 08:06:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 964093.1354963; Wed, 23 Apr 2025 08:06:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7V7X-0005iN-Ah; Wed, 23 Apr 2025 08:06:15 +0000
Received: by outflank-mailman (input) for mailman id 964093;
 Wed, 23 Apr 2025 08:06:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rvAI=XJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u7V7W-0005iF-6b
 for xen-devel@lists.xenproject.org; Wed, 23 Apr 2025 08:06:14 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cd3e1288-2019-11f0-9ffb-bf95429c2676;
 Wed, 23 Apr 2025 10:06:04 +0200 (CEST)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-391342fc0b5so4988015f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 23 Apr 2025 01:06:04 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39efa4330casm17638567f8f.22.2025.04.23.01.06.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Apr 2025 01:06:03 -0700 (PDT)
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
X-Inumbo-ID: cd3e1288-2019-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745395563; x=1746000363; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=S9Pg5n5h4ZV9IY9mDeyUobCy60JGXOGx+sidZcbIJws=;
        b=c1qyhA9ioa4IfxtDA8d6D4yZ9iRLuOgCIzZkr8iBoTOVnKLQparNS+TDYrdtKXF5NR
         9dN2Do/1uhSMwjVffnw8vQK5v5f0hLaaW2qzTygFx0jw6DA+LyUbYg8OaXiRfaZC8GM3
         7IscF0j2uWVdQaR3sPyn7EtO3BZwOEAGWTAEg50hL3+3jQtqYFrscu3lQshNKzrpjwsd
         2dj0VHRk88kAjVe5b2VPy2h/vnA0+AyY03ezjSa+7hg3YR6ONRBwXGnGDnFDtI86B9RD
         eBi7fXdNFKtYiwcrEs4LkZxVwWRRa7UM7e8rNCARhG3fjaRqR33JKCH/8L+7/PB/pD0H
         3+5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745395563; x=1746000363;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S9Pg5n5h4ZV9IY9mDeyUobCy60JGXOGx+sidZcbIJws=;
        b=i6qnRaKtUBnKvu54S+PCIu54qa06qBZtkXYCpC3AUds8rMWSi1ICFtFO5hfm1yYz0v
         IOxfXv5E+bLAkGdFTtqkVaie7btj1wJFaHyYloU+mpakkv0LaZycemW7UTUxhYDa+XAM
         SfVfGguVLf0ATeZ3s8IHRg3DjwBFg67UEIW7bHF9/vtmgaYJMVDVi6bqXLj8ESYjp5If
         CgJDgRuU3oWHce5ao/xP+39Sb4PMkuEGKTwfl4YTGU4JjuoUMZ/33doOGQAQBYmfzJi4
         RdHb1xSb8ZvhZssiRgs6j7zZPxgQRRTE1/XwGdaapMwnb619yMU5q22BLgB/v1Ws43Av
         1mLg==
X-Forwarded-Encrypted: i=1; AJvYcCV2wC8zsxD+U36sMWEEGpHwPFQCzgXZQzxcRizKkrbOBajbmbrtu0pdKIJkiO/lcrlR4sQXQ4W8nJc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyhN95jSSajn54lm5Kh8iiLAR90oubeujBRu1dPBv2GJR+4xoAP
	pTd7y9tIOL1cmOLkVA3sJc8POmOzwBO4pM4aw2zMbgfhYldDGnm0NzOfC2dDMA==
X-Gm-Gg: ASbGnctlRV6nm0hhNWyyvwv9z3DuQS/RmW/qvIouaaIGv+OoLr6BTkOWJ14EP88qqT+
	UXzPNdE6xkb7byUBlKv1IcYURl6QXx3YnRpft9AYJs92HEOCXvjs90oViT6FhP5vGndFEO/VQI/
	QHGZVdV3N2zzAugV6NcYUNnZeNGSpSh5qW0lNColq+oy9tjkH9lYMBhXIUhQjuwQv4Q6zo0QNC1
	Alvn6X0JD0qwO5Plpb7OGF1lp42eKzqSHQaETwzbNv7zi6ZIKXvOD9jD4Mpa8zSruXo3Po+BkuN
	3A2nOFf60y4JGaSS9kOCv5K8aQpLagPqE+giyY61/PGm57g+ItidVxmNBkYOQZv3gnVaEZR8A1E
	bMjXPS5iHFGT0EmoL03LDRcNU0w==
X-Google-Smtp-Source: AGHT+IEOa/txAdFhAUHySvbC4/jy7l4N0QaAOZpSpuK5PeB+4XWP7Dd+qoTA+2l0oC0PW0j8hqydcA==
X-Received: by 2002:a05:6000:4284:b0:39c:2678:302e with SMTP id ffacd0b85a97d-39efbae5c77mr15690563f8f.45.1745395563428;
        Wed, 23 Apr 2025 01:06:03 -0700 (PDT)
Message-ID: <d16d1bc9-4f38-42bc-93c8-39ec0f319a56@suse.com>
Date: Wed, 23 Apr 2025 10:06:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] x86/alternatives: Rework information passing into
 nmi_apply_alternatives()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250423010237.1528582-1-andrew.cooper3@citrix.com>
 <20250423010237.1528582-4-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250423010237.1528582-4-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.04.2025 03:02, Andrew Cooper wrote:
> nmi_apply_alternatives() is soon going to need to dispatch to multiple
> functions, and a force parameter is not a good way of passing information.
> 
> Introduce ALT_INSNS and ALT_CALLS to pass in at the top level to select the
> operation(s) desired.  They represent what will happen when we've separated
> the altcalls out of the general alternative instructions infrastructure,
> although in the short term we still need to synthesise the force parameter for
> _apply_alternatives().
> 
> Move two externs to reduce their scope a little.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



