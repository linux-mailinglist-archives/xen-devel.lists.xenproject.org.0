Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA428C78E04
	for <lists+xen-devel@lfdr.de>; Fri, 21 Nov 2025 12:43:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1168953.1494819 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMPXR-0000XQ-Rk; Fri, 21 Nov 2025 11:42:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1168953.1494819; Fri, 21 Nov 2025 11:42:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMPXR-0000Vb-P9; Fri, 21 Nov 2025 11:42:53 +0000
Received: by outflank-mailman (input) for mailman id 1168953;
 Fri, 21 Nov 2025 11:42:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8OZ7=55=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vMPXQ-0000UA-K7
 for xen-devel@lists.xenproject.org; Fri, 21 Nov 2025 11:42:52 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 354eebb8-c6cf-11f0-980a-7dc792cee155;
 Fri, 21 Nov 2025 12:42:50 +0100 (CET)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-b7291af7190so281401366b.3
 for <xen-devel@lists.xenproject.org>; Fri, 21 Nov 2025 03:42:50 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b76550191c8sm426985766b.54.2025.11.21.03.42.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Nov 2025 03:42:39 -0800 (PST)
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
X-Inumbo-ID: 354eebb8-c6cf-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763725370; x=1764330170; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KdXXoWseEDig4ZDDHv3JHnlRXdfmc7Rr3lXYqSG+944=;
        b=Kotfp8BQDdoJPieNd7jz/oTqx4UKcLrbi4nbdzMRXQ/G5pb3nkB5VEKtxi7LI8uFyQ
         gAZZiEyjr1NmtSVwBdit/HzWUxkZk4AC0Fa8epIR//ZCCP00f3Eo1OTCAotYFjVCPaP7
         ejdudY8wAQ7jVQU/erm5krD83Bahby1jxZRCfZ7a3nYao0GrG00B3LknJjgo5bAwer9l
         o7YRCZ1QOZo1UK1DwPefcOE7FjnZ9K5+mtIxog+sCrcq7o3JRSQU75wTfI4s4Dj2R3Ui
         8Si5t/s6Vx9zMpFN+fEZFalbu6LQGmlxKo2I94UOorGdX1OKMVith1dl1ptpxXc78F3Z
         zCFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763725370; x=1764330170;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KdXXoWseEDig4ZDDHv3JHnlRXdfmc7Rr3lXYqSG+944=;
        b=ojAP30gg/cbM90cG9Hm7MY33wFp1TKxK19B1OS+nv8lkA+09i84b1RP3eh0FMwqwQD
         mgLrloG93q5NJEu4urqXPdV1q+1gkDPYiJGEabgLC5sOOgnHgdSGnhlQOVKRkUlLc6wp
         I1qmmsQ1DvAQuYr+GM8uv125Trd5Xichw+tqvg6pIqF48J1c3QgowAvH5Lx6ucgLjX/p
         SJZO0Fj9EBZoQoHiTBlgXOKzpDbloSurf0dbnUh5TRXytYYaKvvuTRnfNejBOIpfd5Eg
         R96u+zciaX4LmkbO21bvXyJ1fffq919v+aus8LD3HxhapBfjGGHTE9r8BORqVIje9ztr
         HKXg==
X-Forwarded-Encrypted: i=1; AJvYcCUL6244uVLTMLTWZKmFPdoRo5N02Zzu4+GfJhC1hDJPp7SRVtFyLPsNz8oZsxiM1WaDeN4Jqwbj0kE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz5cQ/2AfgAf6j7ieVu4+1CXtJGNcxADTm8CqVhT8x56+MF/Awe
	CTiZHZCGsDidKlJenIf3kFP9Z7q6HM/ABak8ZMp+SGD6j/CwLLNgIiy9NOiC6csfgw==
X-Gm-Gg: ASbGncuKodhhO0B5qRAoGukrhqMTiRg00EwgU8O6VrOg1gTNHZMhJjeFQDxEaF+JGTm
	7P37Wj635EWygNPN1NE61JzJsyIhx1LwODT66kBL7s/4pNkCD0567ckg94FqimZg3zCcnvnCGbV
	L/mPFYszmQSRTSje6Q4cCWkHUB1VgSb6ILu2ref6w8HNcSpZ42hmIGbcoCn49cEV2qRW+S+hRcJ
	aggKApIrxA5TzKrcrEFcsIqsDb66t72JenXH6UK17knQIxZiNOk052ouPo2+d74g5mfcr6Q5H0A
	16G3gfEY2gcggSN+ieFTs7oV0SkoxDriRAz0kelXTqzyC+o7/JBW1CSPEh2O07po0WuSuafuolO
	BrzzytflYe/wqf5NUmTu2zIzcdkEccZb/Dle5wlRnohtaaExraURKoWQndpJPKQ6x/9cIIa2bYD
	lUbqaFFyoDl5FAVgI4noudNmzi90Kno+7zhgRvFgWbGoyen5ZBw0w4lr/uXlkiN6F5jeB2BZHKk
	xQ=
X-Google-Smtp-Source: AGHT+IGpgSjussI3Iz/RwAKhE/DE602cMNVX4TttGF16NR+YSGqZLbeAQHuW06gWLnlLeAu/lFI/AQ==
X-Received: by 2002:a17:906:fd85:b0:b73:80de:e6b2 with SMTP id a640c23a62f3a-b76716955bfmr217385766b.31.1763725360268;
        Fri, 21 Nov 2025 03:42:40 -0800 (PST)
Message-ID: <173c8387-9f4d-4c6a-a930-d11c25b42f91@suse.com>
Date: Fri, 21 Nov 2025 12:42:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/24] xen/xsm: remove redundant xsm_iomem_mapping()
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, grygorii_strashko@epam.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Stewart Hildebrand <stewart.hildebrand@amd.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <20251121105801.1251262-1-Penny.Zheng@amd.com>
 <20251121105801.1251262-2-Penny.Zheng@amd.com>
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
In-Reply-To: <20251121105801.1251262-2-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.11.2025 11:57, Penny Zheng wrote:
> Function xsm_iomem_mapping() seems redundant, and in flask policy, it just
> directly calls xsm_iomem_permission().
> Remove it and use xsm_iomem_permission() instead, with the benefit of a
> cf_check disappearing too.
> 
> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
> Cc: Daniel De Graaf <dgdegra@tycho.nsa.gov>

Any reason for this Cc?

> ---
> v2 -> v3:
> - new commit

So in v4 you dropped the Suggested-by: but kept the code as is. I would have
expected it the other way around, in the absence of Daniel having voiced any
opinion.

Jan

