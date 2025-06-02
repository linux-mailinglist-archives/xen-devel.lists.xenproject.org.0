Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA887ACABF3
	for <lists+xen-devel@lfdr.de>; Mon,  2 Jun 2025 11:50:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1003098.1382561 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM1no-000059-M0; Mon, 02 Jun 2025 09:49:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1003098.1382561; Mon, 02 Jun 2025 09:49:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM1no-0008Ud-Io; Mon, 02 Jun 2025 09:49:56 +0000
Received: by outflank-mailman (input) for mailman id 1003098;
 Mon, 02 Jun 2025 09:49:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QAfa=YR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uM1no-0008UR-0K
 for xen-devel@lists.xenproject.org; Mon, 02 Jun 2025 09:49:56 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id efd7b18b-3f96-11f0-a300-13f23c93f187;
 Mon, 02 Jun 2025 11:49:55 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3a375888297so2452021f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 02 Jun 2025 02:49:55 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3124e3221a4sm5235214a91.42.2025.06.02.02.49.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Jun 2025 02:49:54 -0700 (PDT)
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
X-Inumbo-ID: efd7b18b-3f96-11f0-a300-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748857794; x=1749462594; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6J7jrEHwDaD2opq0DC3D0SbKBfw8bYn4hQxM9MZ7fKI=;
        b=OBCAUoQkcIxvCCiA4UEV0bt0MXzCBUt7f/E7WYWEuDDiUYW3SXFD06wUrd/cqxxNXD
         UNYDo/8ScB4pIxEEnyCl62qUIAliCmG0/hZoKCaMMLRmtNMtsNrUaJZWwhC5afBtkoVx
         2+65XkiK9I7XYuOLz89qpznH7NLgSjOLKdE5yeQe6i05PMbpj4Gb1Ayey25soPqC/s/e
         NgdwkyXBOiuO/43851Hnsq5ziW081+A81w9H+NWFnUzjrowHGk5xahTDJrGWQSngPrtv
         G8uC8rUSRKakWwebn2cUeJfC1otF+BXGCP6ojdYif4nh6GrjOXZ2e/vh68Hslx3fCn9G
         f/CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748857794; x=1749462594;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6J7jrEHwDaD2opq0DC3D0SbKBfw8bYn4hQxM9MZ7fKI=;
        b=g5BlQhyMmDbDuFpPjY4BXTK2KsXsdQYe7OrHpRqaT5DvaWNZZJzOLXXz8zVEJiKbeB
         bsSN7bn5GOosQtCKDHORzFtlMB5abnY695gyoFBsWvdI171N9tf6bsebj3F60iUonp73
         bDEoQ2WjCicaYK86abJe9t0QMrJznY0UW25EE2yXjvLWgBG42HxEoYaANdEj2AUc5gUl
         UDlG8SbvO0m62i3d8m6Z4UIiqEv8Yx5sNVpXi0seDx5ioxA4KC0fst7F7Tl/EZ2F38bR
         R8mzqYeG6y4wvuSMuPE8+r9l1VIYdQ/dQ1k5PADMI8Ad21dJCkoxFVhOzBArSs/iqws5
         PCig==
X-Forwarded-Encrypted: i=1; AJvYcCV9OAwWnFJ+GV/kvHwkdpnfIcWkzTIhOhyLT9CNGVCsJLUOnIbNfPpXunhFDU3Y+cqvKPwnbaDNk3c=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz1+gdn6nTp8WA3attzr50y1BmX5Q/8wndJ5von2SOUk3Y9l4pX
	/d8lk2sBs3du/a8K1npsH0l7buNwKIrzLN+PURqZ+ceWkyUQWFCh2meCZTX2UpXU/A==
X-Gm-Gg: ASbGncu6vnun5JA8+dgeSaDCOULN1Y661uQN9EilHwn/8K1PHTNyljKfmnjYN4k7BCW
	OUAS6mQdiFig2S1owBvxQVB4IwVTk764x+yEnYyD8Nc0K9A9zY9szWZi2a/HFz37frXhb2dLFtQ
	ixsTOWktHrQ3S3FU2UNsZFqLZziZ2T2cWExw2HYsiv/lEff/iWb4w9kVSzRJRbkjLZIXl6dV8Ga
	1GMIo3L5VK3KFwq9dFmFllVfFkVwFzRRSgi94MioGQdi4SYj/IcSgfM3E8wi5tQQgQDfbTutPJU
	/SyB+30UjWMAhrYTwHQhCh7+c6eM8nSUmxSSlCf4Ot3R2eVtUN71vhOnrkE4o5PQl2nBgBpOadG
	e5NvjQ8JIWpihkHBGCVI6zSWBEeed6zi/5Hmp
X-Google-Smtp-Source: AGHT+IF+lK5FcWHjtda8xZeMitGQLit2iTxTgpxZIEuoKqJpoeQNvJfENSXISVNW1FPrPDXIgd/bQA==
X-Received: by 2002:a05:6000:2289:b0:3a4:cec5:b59c with SMTP id ffacd0b85a97d-3a4eedcd0a4mr15258280f8f.25.1748857794585;
        Mon, 02 Jun 2025 02:49:54 -0700 (PDT)
Message-ID: <5e69c4cf-dc13-4ff0-ad2a-94807d751ef7@suse.com>
Date: Mon, 2 Jun 2025 11:50:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] x86/alternatives: Factor out access to ideal_nops[]
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250522150015.555492-1-andrew.cooper3@citrix.com>
 <20250522150015.555492-2-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250522150015.555492-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.05.2025 17:00, Andrew Cooper wrote:
> --- a/xen/arch/x86/alternative.c
> +++ b/xen/arch/x86/alternative.c
> @@ -86,6 +86,11 @@ static bool init_or_livepatch_read_mostly toolchain_nops_are_ideal;
>  # define toolchain_nops_are_ideal false
>  #endif
>  
> +static const unsigned char *get_ideal_nops(unsigned int noplen)

Right here this wants to be init_or_livepatch. I didn't go check whether
subsequent patches add a truly non-init caller. If so - fine as is;
otherwise with the attribute added:
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

