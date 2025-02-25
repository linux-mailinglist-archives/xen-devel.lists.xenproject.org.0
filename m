Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF64FA437AD
	for <lists+xen-devel@lfdr.de>; Tue, 25 Feb 2025 09:31:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.895497.1304125 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmqLo-0004JC-Ub; Tue, 25 Feb 2025 08:31:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 895497.1304125; Tue, 25 Feb 2025 08:31:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmqLo-0004HM-RS; Tue, 25 Feb 2025 08:31:36 +0000
Received: by outflank-mailman (input) for mailman id 895497;
 Tue, 25 Feb 2025 08:31:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wvcP=VQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tmqLn-0004HG-Ju
 for xen-devel@lists.xenproject.org; Tue, 25 Feb 2025 08:31:35 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ec0c96b1-f352-11ef-9aae-95dc52dad729;
 Tue, 25 Feb 2025 09:31:34 +0100 (CET)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-38f3486062eso4491071f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 25 Feb 2025 00:31:34 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-390cd8e72e6sm1501231f8f.68.2025.02.25.00.31.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Feb 2025 00:31:33 -0800 (PST)
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
X-Inumbo-ID: ec0c96b1-f352-11ef-9aae-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1740472294; x=1741077094; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=m+AqKId69+XfojEGWFmbZ3mAxbPw8loXkWqL0OB3N7c=;
        b=BVq1WdMPC8ynUorvSMByfDype+/cj8+en3LM3EbfHlV6LXAjp9i6bnQIVoLbscN4wg
         qxNnvAPgmYwllyTr1cVxo/BNJjgHeJ06qWw4IgNnRxTXiDqYu3HH0e8tN/KMil8YZo/e
         EjAs/3rdRj2YWj6Cb8fDtYUh2ioKTMNDs06lLSyLJ9M//GFml6nFk6JAqbOYeMHCLoBo
         HeEG9nLBgp+iNQAMGB5ewHFIR4LGw/s4VAloZXX5tWKD9VR9wKcVXDcOj1maBm8j6m9D
         nVIdrAhxtG2qckZsYBVLLC1+xWuLHsRTrPqGpmsxOejbEE+5C000y1s29HTsBAlpxwca
         ircQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740472294; x=1741077094;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m+AqKId69+XfojEGWFmbZ3mAxbPw8loXkWqL0OB3N7c=;
        b=QAmgC1vbkcSo/uobeILWpIN8hRrPCu02baP/WQXulmabx6FGWIX7IuTRF28mDQfKMt
         gU9l40mL7tIKgO88bwsFatiXxXodFLNMZt6cxb/Ieov8HEDW6TxkcU4A+xyiFLOA+VWl
         ZnpYKkFBmEalNsLDxJj46z5huIdBmIAcPn9xXMjMUbLpC60jYTL9USHhK7THIRS8zfJv
         IonUi4teuplozGPajIXmi2f7JTBG9q/pVZO70Wc16POSavkLi0SOHtoKlv076y0184OT
         hVKRWSxU52Ez+BjD9hn56tq3zL/WXdIgxgiDcuVYU0LuyjfaZ44bBNhnsEsSjkt1OpRD
         Y+DA==
X-Forwarded-Encrypted: i=1; AJvYcCWml61EnNKwnd3acgZAz4DnqVTQzGzb2KhrgFK0dr+AFZSK7S79Y4DgZzt+hvsSn8XnN9KrTg0ACVM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx57XiF29jY6ZIfPE4LzYWUPCu0G2jxMPDDEY1LDV1RKAQHTmWl
	vREDmX2J11RzNe0k59bQkwnbq8cHEMTrrJxy2W0ZgOxeupqHei9EvnvlF226Ig==
X-Gm-Gg: ASbGncu3/FPi1cDLBa4W0QLtdvtBW1ABidzCPjCiRt2JYIErhbRQ2Y1x6Bd2xT9jgJ+
	TsvTiYypefWZP7nZGGeCfefdn5vRU4lsn9a0yblae/oSHULtwqvVFBAQvcYndcqNZJaNjh7MPee
	u7PdYLviRnCS3QSeUlN7koXD2xf2dkCRzIQ8YLUh/9nyXG60nhMVUfXzNj2qD+sgB40ViPyP6ww
	G+OgPQTJiZyXGnM/wdPQF7DxWpbt17P/PrHe49N1vTVsQODmHYI3G+fJ9A1GFZhiuOi1Ntrh6KV
	3k/3XQYRplNPl2n/YntD0XFRE78AIDDldHegEO+XRDM0/Qlan8jjt6yWJly4ebrXoLDkvB8tFXs
	nolGWH4G1n4k=
X-Google-Smtp-Source: AGHT+IHePi2g04T1sWVfbi5HRZyGPetrRzspH9X6ZUh83tybNq9NxtbPMwlf+WyVBdciu/9o+9F/EQ==
X-Received: by 2002:a05:6000:1867:b0:38f:4fa6:68df with SMTP id ffacd0b85a97d-38f6f0d1fa2mr14518433f8f.51.1740472294088;
        Tue, 25 Feb 2025 00:31:34 -0800 (PST)
Message-ID: <56aa1fbe-ebbf-4e03-b164-51710a75bde3@suse.com>
Date: Tue, 25 Feb 2025 09:31:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] x86/IDT: Rename X86_NR_VECTORS to X86_IDT_VECTORS
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250224160509.1117847-1-andrew.cooper3@citrix.com>
 <20250224160509.1117847-4-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250224160509.1117847-4-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.02.2025 17:05, Andrew Cooper wrote:
> Observant readers may have noticed that the FRED spec has another 8 bits of
> space reserved immediately following the vector field.
> 
> Make the existing constant more precise.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

I don't mind this, so
Acked-by: Jan Beulich <jbeulich@suse.com>
I can't help the impression though that the majority of places will need
touching again if vector space was enlarged, to use the alternative larger
constant then.

Jan

