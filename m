Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA410B36ECF
	for <lists+xen-devel@lfdr.de>; Tue, 26 Aug 2025 17:53:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1094822.1450048 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqvyu-0000xJ-8j; Tue, 26 Aug 2025 15:53:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1094822.1450048; Tue, 26 Aug 2025 15:53:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqvyu-0000vq-5m; Tue, 26 Aug 2025 15:53:08 +0000
Received: by outflank-mailman (input) for mailman id 1094822;
 Tue, 26 Aug 2025 15:53:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=n+o/=3G=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uqvyt-0000uy-J1
 for xen-devel@lists.xenproject.org; Tue, 26 Aug 2025 15:53:07 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bf81defd-8294-11f0-b898-0df219b8e170;
 Tue, 26 Aug 2025 17:53:02 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-afcb7a0550cso1008932066b.2
 for <xen-devel@lists.xenproject.org>; Tue, 26 Aug 2025 08:53:02 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afeb7fa311bsm48218266b.69.2025.08.26.08.53.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Aug 2025 08:53:01 -0700 (PDT)
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
X-Inumbo-ID: bf81defd-8294-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756223582; x=1756828382; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=u8VU0tp2VRnLvyS7OuxyLw5eF+NulQWZz+wNWXFxsRY=;
        b=JG31mGjMCXOMWExXoPrVaz1KiFRubo5a3Q08I8cspN2ynPNl698vO+1BRy47TuBBcC
         2ZeIoz89c8NBRghLySDCzp1drjlUs7FFOr+83gAPBEfNGOEeKR25ZvzazThp4LrvU61i
         CY24iDEgNyp59C6QG0yo/fO+Sb5nj13IsSBmfgbrx95ZRiJG3x66OGDLYQFNhogsOO9u
         yTSQQxoeonRc0ByeFB29ZoIEfQtYlJPV/yvnDiAUVDnNhHKdONHq+IR/gxuV2gsDbcrJ
         e0aDvFTt1AGQomIWMlBp2S/1ZrIr8qLykTuiHEFv1nJg9ydtzJ1nBBcP1/Xatp5Tex3D
         U1Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756223582; x=1756828382;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u8VU0tp2VRnLvyS7OuxyLw5eF+NulQWZz+wNWXFxsRY=;
        b=jSpWgf5t4bBjHfJBsons7KxEKxCKlzxskQIVM+/aQjlNDSgSKqmx0lfUiqRUQmYT9e
         VfoOWF/cStOJ4j7G3EdAN92s4Z82+5Ja9AR1eG5ecuybmqzRPFPq5h3Sz0lfKHgOdOtN
         0kuGiNSsyMMt2POP8tFnNBMBOFslm2AZ/YxFlgJZKp6cxm4SHtQIE3o1L4Uff13yO2RL
         SqzcNZ+PHCXGGJCd3Mk7DMKqHv/VDaZklYhAsOpPSkY/Ftj2BdeTe8fung3R6/CUAYCj
         TiRagwpZU9ixtmamStFWttCZBgJ7pQ2shB6OvwKKl5mVp55C18dAqdF1L4uiVHn+0wj9
         DbxQ==
X-Forwarded-Encrypted: i=1; AJvYcCXdtgngPn0eSF88IfuXMxtKonBDAX64hs1L5Sll29w/z1gpB1g2MuPbToaR0F6V3cQ0xkUhV+7OEyc=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx9Downc9NnxuVgS6PjjlKbZGFsPseeDT32WwPQHOfdcpPYubg/
	80L/vK914wvP2SY6FrcJtcDWu46f+ENEGUzWOAT8cuHWrkN2CZIz4my3ryGCqJZWRQ==
X-Gm-Gg: ASbGncvGvikkaKR0BnR/eTdbWw9LcED+9kDVBvtVdP6+H16Hkz88W55/dZ9RP9dxgfF
	WYxZNzmWgugUV6FVy2P0kAxkluNA6qLve9ZEgYMnGDDXts+jDr0SAqPKUsunWg2j0rnQ0e+sUYp
	nXK8QcIeAZSrfbqXGXDw8LyTMXNRE+EUBx/PIrx0vecjvEin1/mO18Nku6DEZgmV8+lePyVe76N
	XUEJ1i4y1By4s75zmUBH7v1kTdY7UVhgA8cQ2L4mjFMMcgY3M9gDKdktfc7/xxCNi+Vwi47PY3M
	kMoroo0OlFy+Cbq8y0yv02+8AA7PwhjamNjOI+TC8SgU27GVviy09wZteK+NuUWU7ifDgz1hTrq
	uxuaI4tRRLpWT83/8VG2Lu39OpqxRitmLD5mKOiL8THNQ7ug1dczPPWrA7KjR2mRH+o5J1g5tH/
	wXF5Ov/E0+mvn1G4QoSg==
X-Google-Smtp-Source: AGHT+IEcnBCfbfOuVbMiwtNZs8qtn/h6aeS2FBMgOOGRybPBdP8+Rni6QxqzM4BCkZyOzUdHRpd7DA==
X-Received: by 2002:a17:907:7242:b0:afe:9f26:5819 with SMTP id a640c23a62f3a-afe9f265912mr333180566b.28.1756223582344;
        Tue, 26 Aug 2025 08:53:02 -0700 (PDT)
Message-ID: <698b0944-0be3-4c04-ba97-a8ef55ebd826@suse.com>
Date: Tue, 26 Aug 2025 17:53:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 00/11] xenstored patches from split hardware control
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Juergen Gross
 <jgross@suse.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 xen-devel@lists.xenproject.org
References: <20250725235858.666813-1-jason.andryuk@amd.com>
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
In-Reply-To: <20250725235858.666813-1-jason.andryuk@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.07.2025 01:58, Jason Andryuk wrote:
> This is a subset of patches focusing on xenstored changes from my split
> hardware control domain series.
> 
> It should address the stubdom breakage from the previous series.
> stubdom was tested in gitlab-ci - xl list shows Domain-0 and Xenstore.
> 
> "tools/xenstored: Use priv_domid for manual nodes and permission" is an
> interesting result of looking to rename some internal variables to
> better align their purpose.
> 
> Any review or guidance on the approach is appreciated.
> 
> Jason Andryuk (11):
>   xen: Add capabilities to get_domain_state
>   tools/manage: Expose domain capabilities
>   public/io: xs_wire: Include event channel in interface page
>   xen/dom0less: store xenstore event channel in page
>   tools/xenstored: Read event channel from xenstored page
>   tools/xenstored: Add get_domain_evtchn() to find evtchn
>   tools/xenstored: Auto-introduce domains
>   tools/xenstored: Use priv_domid for manual nodes and permission
>   tools/xenstored: Rename dom0_domid to store_domid
>   tools/xenstored: Remove stubdom special casing
>   tools/xenstored: Remove hardcoded implicit path

To allow more of this to go in, you'll need to chase an ack for patch 4.
Of course you could also indicate if committing any later changes ahead
of patch 4 would be possible / sensible.

Jan

