Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89D68A66E6E
	for <lists+xen-devel@lfdr.de>; Tue, 18 Mar 2025 09:37:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.918633.1323281 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuSRH-0005or-KM; Tue, 18 Mar 2025 08:36:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 918633.1323281; Tue, 18 Mar 2025 08:36:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuSRH-0005n6-He; Tue, 18 Mar 2025 08:36:43 +0000
Received: by outflank-mailman (input) for mailman id 918633;
 Tue, 18 Mar 2025 08:36:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kmRG=WF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tuSRG-0005mw-0s
 for xen-devel@lists.xenproject.org; Tue, 18 Mar 2025 08:36:42 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1c940c8b-03d4-11f0-9aba-95dc52dad729;
 Tue, 18 Mar 2025 09:36:40 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-43ce71582e9so19900875e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 18 Mar 2025 01:36:40 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d2bb5f987sm73640365e9.24.2025.03.18.01.36.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Mar 2025 01:36:38 -0700 (PDT)
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
X-Inumbo-ID: 1c940c8b-03d4-11f0-9aba-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742286999; x=1742891799; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vGfQQJDphIXigITeWcIR2RVzSsr8UtitPQEr7R1fYwM=;
        b=Tp2fy9yIUygCcN2VjOqrsVNiahYBSQKfTiA/EjT7NSaMYPz+jNRRSYibnQ4S7aPm/A
         4hH+Q27BJm6cG1ZGC5N4TUg23CmE/0K6azKnYkKmImf45LMUGVgA6b31kiZKQqgY4IpJ
         +X2J7ZvQCX/eak/EK5my5siZy/5X7YxLy/lqlpQUoudnHWZbYvPPqEq4ZAAMGz0FllU2
         ny//SAyy1h6eNLq6CRJyQGybAGTQADmPYE9rO+2MBDaOepfjlyEiu2Hfm742qU1dedk4
         zEUxXxgIRjuS1j4wML5vqkX7sREvFySU0QvyXysCORc1boz0Y/z172TNmOl2rADvWA9o
         ZnaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742286999; x=1742891799;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vGfQQJDphIXigITeWcIR2RVzSsr8UtitPQEr7R1fYwM=;
        b=FXbbQMFwnuc7HXeUDvbOLTbNHfVnzGb2ueKb18/0s4oTCUxsjlgvrICFqul4BkMYnA
         KWAu6ClP1voVjI8kLk7QWuE3f5/hiQZIVi3eiH169VVC0nIjO2yDfhJOdOgcvrY5Z2tL
         rdvR4BEiC8W0s1B4Julsq7LK4cpCbGfsG+35RXJq5UgatgE5MLaL0wNN1sgGYACrWJR7
         7abgiVN8UD/C026jf9diOMb+bM+DdZvu4U7ENTtEYPdQg9gYkKPhFNABDvnuKvLz6got
         SHmddTy93La499Rjqr1TPwW7VxyId5ndfo4Vu1j0wwLEuDC8K4qTkrzgonVJkSgeD0AO
         EVWw==
X-Forwarded-Encrypted: i=1; AJvYcCXRV8ZHObdBYjFgspXSCKIYcAKYm8HOm563RRFlSTUrIWQGE5nYUfABJZgc0uBpKXaYDawKr1gsfio=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzWdxcgeaKESiwmK5MTEyF6+iQxCTUYAdyIK2jCwpWlmCOjJQMF
	n97JLCCpQgL+2tJg29kDbghEvOobhHyBirb4KCvmHgf6PzSPTaX4JcHw7UWQhw==
X-Gm-Gg: ASbGncvtulSkj8/SrQ6qYSWFlzMEPj+LmC6rd47dtMLsTTutGoEthvJv+gQMt+wNeWj
	rSZ3Xp2eZK5ULl6uaM7PGR76CtL/UmLfyqbcz9npwpABvSEx1cLcmKX+l/TMp44qz9rQdHhKads
	ypsWDDXxPvIKpzs7yXRql5yIrQDbg61XOeuIEaTWsShEgR2cOx8NB2flPw3LkFbcsfl5vUFUJG0
	VaZv/bb3rTCyNdHQwY+t43et4uaiVFIfo4afWvzhhhnb3c35VjPUDRNy5T9noIdv3GdNyAUYD92
	/Qgp4ikaQmV0Gexb9vpIzk2QiBNItQYCkgijCmlnSxWuwxl6UdA70unx+jD+WJko759h00fVuxu
	Gf6inyP37AEV0E0D7JGlEvRyks6HmUw==
X-Google-Smtp-Source: AGHT+IGHORhwAs0Xc0YD9wi9SIW5s1ZcXPBxNlQsKQDMIZxt2+QQT/3WSMsJSJ4HSLPH81WxLBISvA==
X-Received: by 2002:a05:600c:3c9e:b0:43c:f8fc:f697 with SMTP id 5b1f17b1804b1-43d3b97f44cmr10428315e9.9.1742286999083;
        Tue, 18 Mar 2025 01:36:39 -0700 (PDT)
Message-ID: <38076c0d-8e1a-4d16-b22c-b1db9460ed1c@suse.com>
Date: Tue, 18 Mar 2025 09:36:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/msi: always propagate MSI writes when not in active
 system mode
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
References: <20250318082945.52019-1-roger.pau@citrix.com>
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
In-Reply-To: <20250318082945.52019-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18.03.2025 09:29, Roger Pau Monne wrote:
> --- a/xen/drivers/passthrough/amd/iommu_intr.c
> +++ b/xen/drivers/passthrough/amd/iommu_intr.c
> @@ -546,7 +546,7 @@ int cf_check amd_iommu_msi_msg_update_ire(
>      rc = update_intremap_entry_from_msi_msg(iommu, bdf, nr,
>                                              &msi_desc->remap_index,
>                                              msg, &data);
> -    if ( rc > 0 )
> +    if ( rc >= 0 )
>      {
>          for ( i = 1; i < nr; ++i )
>              msi_desc[i].remap_index = msi_desc->remap_index + i;

I understand that Marek's testing has made clear that this change is needed,
yet I don't understand it. If we didn't allocate a new index, why would we
need to update in-memory state, when memory is preserved across S3? (This
lack of understanding on my part is why I didn't associate the last
paragraph of the description with this extra change, when you first sent it
in this shape on the original thread.)

Jan

