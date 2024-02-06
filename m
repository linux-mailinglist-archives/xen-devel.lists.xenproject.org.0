Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85C5D84B1CE
	for <lists+xen-devel@lfdr.de>; Tue,  6 Feb 2024 11:01:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.676735.1052992 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXIG3-00032I-NW; Tue, 06 Feb 2024 10:00:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 676735.1052992; Tue, 06 Feb 2024 10:00:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXIG3-00030N-Jz; Tue, 06 Feb 2024 10:00:51 +0000
Received: by outflank-mailman (input) for mailman id 676735;
 Tue, 06 Feb 2024 10:00:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gccX=JP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rXIG2-00030H-4v
 for xen-devel@lists.xenproject.org; Tue, 06 Feb 2024 10:00:50 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9957abba-c4d6-11ee-98f5-efadbce2ee36;
 Tue, 06 Feb 2024 11:00:47 +0100 (CET)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-33929364bdaso3322045f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 06 Feb 2024 02:00:47 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 i6-20020a5d5586000000b0033b376b9219sm1669211wrv.92.2024.02.06.02.00.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Feb 2024 02:00:46 -0800 (PST)
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
X-Inumbo-ID: 9957abba-c4d6-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707213647; x=1707818447; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CnoR/Y6jLIkW24zcJAjTd/HCAh644Diy4laGIgxK7Yo=;
        b=UnS9m+e4jNuwxpi6zGrfvFwERPrcdf5wHKAAOGDazc5sfl4GfXpoAqIULmilKOLudL
         TB1D6VqXdEPVprijdEQxUBgiPYFy6tHWbxgeMalRCwPZdNwA2i+ifevL5zqDbMQ/JufN
         OHnTuw/h7GI5z9VZFX5gzfZkW8I/PZa/Ha+KrF4rtcL2ZQKw1AEuFCTaODQLeCOYvwsx
         FtajmdbIMNf7SQHKDRYBaMJKSbiysCWXwupNJKkWIKjHKGj+S9pHEfIgRiP8PDtibKDC
         SUnjA3U68s4fxBJ1HuTYGORSC1nxJb8WcenIJDHOySbRjVWK4JPV1WR4+1Gx8Ss9F96z
         RG8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707213647; x=1707818447;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CnoR/Y6jLIkW24zcJAjTd/HCAh644Diy4laGIgxK7Yo=;
        b=VdR6TCJY3Tgd7PRgC0PGxVobmdFTQsgNrty7mI0B8ZVLr6qfCtJYZYflnANOyfQVB4
         11AQ8nd3+5ZHAp2E0QomYR9n2ETFLbbeb2d0ZGbt2wWd2YjOuBx7TEO4KCUzEa6kKKmF
         4UVlo8HaLgS8VojMaXVXUbxarL5uI2khzahzr9xsrNAtR8HhF8Ga+TJYe0dgOWuOZZw8
         PDtS/hfcXg3aW7FCTrkP8L/M95oZ7mom24Z8BtBu6JMxFTOK6OV7q81YqFdfkpRirXmn
         TpU5JgnuxKba6TJBnH3qUAP0RSmdrPRgg2LzLweM9nB6PV+G1EgGSM/T8djchTXgfTd+
         0q+Q==
X-Gm-Message-State: AOJu0YzRP7a/vGLO8bk/9lVfsjoPvfAZ/3+fvlpUrr2jTBGqiRTTjRfd
	RUt/bAYV/692lLpdUGq4dNbGlLnT3G8snGHhHOWjzi1FU1g8OiEK8xVLBTaVFg==
X-Google-Smtp-Source: AGHT+IGAyaTsV3w+n8j+ZBTN5O3TUkWWZfuulzEZLCMVXUydfbhEMfxn/FI7QmKYjZib8jr7K781ZA==
X-Received: by 2002:a5d:47a2:0:b0:33b:4967:4d2 with SMTP id 2-20020a5d47a2000000b0033b496704d2mr621910wrb.41.1707213647103;
        Tue, 06 Feb 2024 02:00:47 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCVqOC7/imqtbA88h+nNBQu287CLUd2YtHrQmSZipNSpe1dIi7MGfoeIv1Csk5wEV2pCKi9auKzXIHZQF9b8LEMvzdAY5Nz7QsInGCGSRLaFdoK00y4Oy/kiWwsjbHC7rYQH6D3zalY6UXF/06ahdenzw6yztklnR3Tq5NuQIlzi71sqvQ11
Message-ID: <a7c27052-1feb-4536-9fcf-716f4ae5114f@suse.com>
Date: Tue, 6 Feb 2024 11:00:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] Use more specific constant
Content-Language: en-US
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <20240205104740.14905-1-frediano.ziglio@cloud.com>
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
In-Reply-To: <20240205104740.14905-1-frediano.ziglio@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.02.2024 11:47, Frediano Ziglio wrote:
> __HYPERVISOR_arch_1 and __HYPERVISOR_paging_domctl_cont for x86
> have the same value but this function is handling
> "paging_domctl_cont" hypercall so using the latter mnemonic in
> the code is more clear.
> 
> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

I can't reconstruct why it was done like this. arch_do_domctl()
uses the "more specific" constant in any case.

Jan


