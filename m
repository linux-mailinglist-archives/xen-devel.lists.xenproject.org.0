Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CBA3A22D6C
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jan 2025 14:15:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.879548.1289754 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tdUNq-00062h-M0; Thu, 30 Jan 2025 13:15:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 879548.1289754; Thu, 30 Jan 2025 13:15:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tdUNq-000601-IO; Thu, 30 Jan 2025 13:15:02 +0000
Received: by outflank-mailman (input) for mailman id 879548;
 Thu, 30 Jan 2025 13:15:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zr8Z=UW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tdUNp-0005zt-0W
 for xen-devel@lists.xenproject.org; Thu, 30 Jan 2025 13:15:01 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3565db6f-df0c-11ef-a0e6-8be0dac302b0;
 Thu, 30 Jan 2025 14:15:00 +0100 (CET)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-ab6ed8a3f6aso59384966b.2
 for <xen-devel@lists.xenproject.org>; Thu, 30 Jan 2025 05:15:00 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab6e47a7fc2sm119308866b.37.2025.01.30.05.14.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jan 2025 05:14:59 -0800 (PST)
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
X-Inumbo-ID: 3565db6f-df0c-11ef-a0e6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738242899; x=1738847699; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KwpFGvRRs+3NF+GLon9isEJU2HhAwCR7pDMivKby9zY=;
        b=P3Mx6Jq3/0Nzv4WHsmS1Sm6cBmvREf4C9QHvWP2ruUo5+zJt6vIbPYHiKdWsHFtlIT
         CTtnQHiqtpBQ3TrUrq1HR34sTxg2QU+rRA2YGTNQ695Kxz9cgc53qGgBt51Ds5zNCDO3
         3V/q405ttRgQSOIz8UI2+FRbyOZJLH0uRA2wYhRnzDc/BCIXayVlq4KCz3/emYJMTk87
         2Vi47i5dvmSn7DTOCMMJ7q6yYRgBpF4wSvA3MgAzDgQAWKH36ZYqYmUevGh8CPkKbtUA
         gwpV7JzNq019FWH5yFDSZ6Y2qD1c30Dx1hYwMyyjos4BC6H/wYWjLLXBYFOQcHKlgKP8
         BoYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738242899; x=1738847699;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KwpFGvRRs+3NF+GLon9isEJU2HhAwCR7pDMivKby9zY=;
        b=YKry49nIsspY27F5nK6SvMM75bn1Hs1CKbgphsLfl7o2upP80vUK7Rz6Q2gxAmjV8V
         9de1S4tN6oeXmywtuo3IJI1Cs/KgMJqOdf9JauhzbR2LYIw2afa1UOl4W0cOAfPiucLz
         KFbHtr+lvnZbG4fqYbnxr3/HIfYQ+vOwqX+IObRhQzKX5GBiSlzXFAEJyp9fhI/eHN14
         Dm/XfusX2nFaspXAvHNFYJ2GRAheEUOpOWI6S10Ns5okSVFWvi3+zvISRZRM+jVo/Ggh
         A6M0Q1aiSrIUaFl0FNuuT561D29JZwuvKTaFXZUVcUSRi7f94ZjYMIIHSaMn6rCtQ+ef
         yoLQ==
X-Forwarded-Encrypted: i=1; AJvYcCVEfkRwzdQfSgfNnIeYOtgsH+2535phSXpG44TLxhlj5/rLoBZQntXq1sFux2/8fkKcduvyEC0HcO4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxcEFmUSDI5RIu9TemZApkBnECP8WL4qBEwzAfMy2m0PCpNCOKN
	sv/VYCDDa9lVpxLOg1z0FWS3UYHZiivV68FjsYtaHISrQdsmsyO+Q9LTQBGhKQ==
X-Gm-Gg: ASbGnctp/46XoZqzEqgqnhFnH3wSWH4Tb2XHi5A3iIMk2Xbnsxe4KhAmubzTtxz7Jdc
	FoUzrDmOZcCY2VOygtYMI/PKKRFeGJgxHYjFJIZZ/3tXCfqsglU3yuAdtRGgHlDHTCRsJhffLGu
	QgauA7L6SGIeGGAodTmvnVUMXur6rXkZqj7DE07U7wJ/kwNr9+AkZifkvlV6KHPGN9gsoftJ5OF
	sZiabZFZ6jT/BTZJhz8IEZvZkSnAvHxv0LU7Uiii73HxXXBB57NVhyfB0Q6VtmM+EQ7PksvxmjX
	Bg9CTa2goEGoEK7DpzpY8mrrKiUNGkjVjnAwKWErsTHJTeTqLu7WBibJt4wGNNzmwK9wbGev5SX
	D
X-Google-Smtp-Source: AGHT+IGNz1W7lX07gSEzFb/LwnSiee3zZpyw3i0PptaHZkUhHff4bsW65lsdMGFkxSqy/fAr5q1wjA==
X-Received: by 2002:a17:907:94d1:b0:ab6:eec9:5c08 with SMTP id a640c23a62f3a-ab6eec95d8emr113153666b.10.1738242899577;
        Thu, 30 Jan 2025 05:14:59 -0800 (PST)
Message-ID: <99b26eb1-eed7-4eb0-8be5-d1e971eede8a@suse.com>
Date: Thu, 30 Jan 2025 14:14:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] automation: rename CONFIG_MEM_ACCESS ->
 CONFIG_VM_EVENT
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1737452864.git.Sergiy_Kibrik@epam.com>
 <e43444e0cd04bf08edf47ee4c56d0aa675d19534.1737452864.git.Sergiy_Kibrik@epam.com>
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
In-Reply-To: <e43444e0cd04bf08edf47ee4c56d0aa675d19534.1737452864.git.Sergiy_Kibrik@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.01.2025 11:23, Sergiy Kibrik wrote:
> Following the renaming of Xen build option.
> 
> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
> ---
>  automation/eclair_analysis/xen_arm_config | 2 +-
>  automation/eclair_analysis/xen_x86_config | 2 +-
>  automation/gitlab-ci/build.yaml           | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)

This can't really be separated from the changes doing the actual rename,
can it? Aiui the build (randconfig ones in particular) may break between
the two patches, or what is being tested may end up being different.

Jan

