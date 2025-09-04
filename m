Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9758EB432C2
	for <lists+xen-devel@lfdr.de>; Thu,  4 Sep 2025 08:47:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1109628.1459149 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uu3kk-0000l5-6O; Thu, 04 Sep 2025 06:47:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1109628.1459149; Thu, 04 Sep 2025 06:47:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uu3kk-0000id-3X; Thu, 04 Sep 2025 06:47:26 +0000
Received: by outflank-mailman (input) for mailman id 1109628;
 Thu, 04 Sep 2025 06:47:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iTa/=3P=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uu3ki-0000iX-M1
 for xen-devel@lists.xenproject.org; Thu, 04 Sep 2025 06:47:24 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 02c193a0-895b-11f0-9d12-b5c5bf9af7f9;
 Thu, 04 Sep 2025 08:47:23 +0200 (CEST)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-61e425434bbso1107521a12.2
 for <xen-devel@lists.xenproject.org>; Wed, 03 Sep 2025 23:47:23 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61cfc579ba9sm13332754a12.52.2025.09.03.23.47.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Sep 2025 23:47:22 -0700 (PDT)
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
X-Inumbo-ID: 02c193a0-895b-11f0-9d12-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756968442; x=1757573242; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=BvwuWPj50yyYb925F4Do7r/Dc7OvE9RkImlXpbDhMh0=;
        b=ZOjISwGUQxx2YZfVHjws/kb4Xn+daVnEjzyoRoGQGoyhnz0kMHGrUCJttnjwlbngH1
         K4NIEdl6EbMqFHSllri0KUpY2GjRWHrw2QZeakf7FCrVcXSUOU+o77iUYUzZqg4fH855
         Q28/ogoH98pbSL6VKwq+NVX75uI4rLNEc5RfSW002LQvbL+DlvfhLucuFLBfUU7bEl20
         xVpGDcZ5rmWvLSqjxLap+bthf1vmgEPO15+NvtsZ5pTpdXZ/V6u+VqLjX8hqBDYoywdb
         I1U8jn8aay6nG9NJwNIBK2NQLb9Dl4/IdXAfcLJGRDyiB9g9Qal4FzSvKWSXX9YKfAZt
         9G8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756968442; x=1757573242;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BvwuWPj50yyYb925F4Do7r/Dc7OvE9RkImlXpbDhMh0=;
        b=tiFWbSsaztwGiYcuN8ogiyjkzGt4Zdx+4zFOgvi5OXML52jj5na9AD4/B7YAjksF8g
         gm25q/96LFYp2PkqKESrilnbDfaRxbiH0bQ7OpJl6yLcyA4fCh5Qf910/HAIJ3ftkYfo
         YUHdpx8BYi0Hz70h4OH8YQsvi2plMchKhAkAkuHZLXSeLRLTl26GnYtGCBfpWUhHMoXW
         3iZ6chof+Glvedd9UgGv2gBvm5KgWIItkwCTBfhx1QxvCpo7n1qLGYWSw2vfWMb4We09
         cwCTJgpOIQ2nm051Ip7Je/d5fH0INyuGNhWVL9Raqi7KMPvWO55A8G7ikzhlTWFlml3z
         oGLw==
X-Forwarded-Encrypted: i=1; AJvYcCUCn8ya7hMOXrAUKwWuAz0hCpth8qRF5onZkAreWABzHwYLi0xwev4v4da4Q21cEn49oh1wgm67RBs=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx5b8wUT13nRQ7abARIyH5FYAzvTp3b77vGmDelV57oBTlv98E/
	GKSncyoaJoneRgxgI1D7o6RpaTKzQCXKNwfG53+Y1HVawSisK8WHP14hLWM9K/wGWw==
X-Gm-Gg: ASbGncuAvjDivHDElt79k06VlinbtOUiPyEX+rcZ6aGR+P3v3xJm9K5XX05+QEQ5MYJ
	E3XRPXL7+zZSMu5/mKqmlIk2k9TsJWMYqFi150AkuB8W5gDm6sZioD/iOSJNNu4vPgzkMnNK0xf
	Z6D8CKHNd0cQzhdh8W7NZF6qdttwe902WG0BfS3o3z4Tb44Digt6kIyidxVf7vLnMzEV3J4iARd
	ZfReDUKItvPxV2UovhoQfy7uSAdDMWeaDRYAAFEyTGdwF0TiUtT+HniJPn54esTV5XSDtGHmRmw
	/Ggz2Z62hqZa4rEdPSDriKK8FxtsCClw7REoYuCMk0edG9c37p3S45T+V9mzvDx+rsG3zsiWl5R
	GFw5Jz2yQySBDfcy/m4jg0en7pKWbxj3+aIhGj0pPDCfO2mj/grxySepmBhsk00G5PUSzr0fjAy
	eBI9jhdwJHh2u6cXtKRkmRvEjHxIdH
X-Google-Smtp-Source: AGHT+IFs/6oH8jSeJ5JpojCE+rZi8Hs6ZPCsxEWPBgCcG5LSB2bchOq7R6L3A5ow9FcRvEgsB/zPwg==
X-Received: by 2002:a05:6402:43c8:b0:61c:9970:a841 with SMTP id 4fb4d7f45d1cf-61d26d7874dmr14405465a12.25.1756968442523;
        Wed, 03 Sep 2025 23:47:22 -0700 (PDT)
Message-ID: <2bf9064a-e10d-481a-bbdf-b269db2e4746@suse.com>
Date: Thu, 4 Sep 2025 08:47:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 8/8] CHANGELOG.md: add amd-cppc/amd-cppc-epp cpufreq
 driver support
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Community Manager <community.manager@xenproject.org>,
 xen-devel@lists.xenproject.org
References: <20250904063518.2097629-1-Penny.Zheng@amd.com>
 <20250904063518.2097629-9-Penny.Zheng@amd.com>
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
In-Reply-To: <20250904063518.2097629-9-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04.09.2025 08:35, Penny Zheng wrote:
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -33,6 +33,7 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>     - Support in hvmloader for new SMBIOS tables: 7 (Cache Info), 8 (Port
>       Connector), 9 (System Slots), 26 (Voltage Probe), 27 (Cooling Device),
>       and 28 (Temperature Probe).
> +   - Support amd-cppc/amd-cppc-epp cpufreq driver

s/Support/New/ ? Otherwise this reads as if the driver had been there already
(no matter that this is in the "Added" section, but the adjacent entries are
ambiguous already as to "added" vs "changed").

Also a full stop please at the end, like all other entries here have it.

Both can easily be adjusted while committing, of course.

Jan

