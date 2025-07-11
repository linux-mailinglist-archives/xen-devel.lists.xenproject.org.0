Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CC29B013D8
	for <lists+xen-devel@lfdr.de>; Fri, 11 Jul 2025 08:43:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1040540.1411953 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ua7TD-0007Uk-K4; Fri, 11 Jul 2025 06:42:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1040540.1411953; Fri, 11 Jul 2025 06:42:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ua7TD-0007SP-HV; Fri, 11 Jul 2025 06:42:55 +0000
Received: by outflank-mailman (input) for mailman id 1040540;
 Fri, 11 Jul 2025 06:42:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Yw5d=ZY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ua7TC-0007SI-8a
 for xen-devel@lists.xenproject.org; Fri, 11 Jul 2025 06:42:54 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 44b08689-5e22-11f0-b894-0df219b8e170;
 Fri, 11 Jul 2025 08:42:52 +0200 (CEST)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4550709f2c1so1981975e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 10 Jul 2025 23:42:52 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31c3e9741c5sm4767445a91.14.2025.07.10.23.42.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Jul 2025 23:42:51 -0700 (PDT)
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
X-Inumbo-ID: 44b08689-5e22-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752216172; x=1752820972; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=JtifieaBxf0kbsQSlczJt3fvMyQeH8opOU0TsxJtZGQ=;
        b=bPSdgACXk7u0EUXJKRN0uiJlIkLEPs/baoeGcNuZG99GLrWxt8pVw4jTO3zJsEO+JT
         oA/9DqjcOAuA7A3KuV/DRh5yHWZnHwbkneMgsLpQux+CEa/tKsQtLCw0zqFCT5BqY0C9
         XWwcU78PFL895MlbMCXD1ZUpfHDibLmvb7/14IMELwUsimBlkpFfulEbWzSXjML4NoLg
         6ROQ3Oq2FYNkQkBTwiaRVlCwVmCx9YxTQXS63nVJ3ftaoa7YhtelQriizqvg+dPJCTuG
         60wuTKI0QMg2JpkF7yONbEnPF+9hE2L0k83NPuZ2XT8IGu7V4VhYT8YdkgntaCbpsGh1
         A4MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752216172; x=1752820972;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JtifieaBxf0kbsQSlczJt3fvMyQeH8opOU0TsxJtZGQ=;
        b=vqcWzZe9f/ALHKYFCPd1XejeNMrI8oC62rZkIKrdHTUxCOe7S2swGVFe8K2Is2L47V
         U/sCRS7GFQ3acGGdUo2y8mA7l3gpowgR5nqa/1SfGCmPhxOTFqlVBwQSVDjeelIEkXKt
         wluV9M1vCrtP1wq8BiY4T9CMKxPthpAidMRTyXYccQRei24+Lb6gfIee3DrJh9GG9UFe
         E+yZWOv2TTvlVeoocPHLmBrV8WOjsAMRjGzqXO9k2I8ctK78LILhn4Z9l8Z1BYaAMP0t
         ZME6SMcnyQ21hhlpVfCnzCLNyIrRdXqCPpGseahUEjVE3IpoGxm4mLOf0Cj2b2zHMM52
         XhtQ==
X-Forwarded-Encrypted: i=1; AJvYcCWdfrdnkBC1bEgrQm5XjJxi77aRwv61ghAVZQ3E4qRhUKOYKNRToVR4j2SpY9q1AYqvr2KNQZOJaPc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwtpW/QdkqX8Rj3Apr921NVtL9wWMY4Jkj6uynwZZ09BxBokiBb
	kJhEfEXBX4UAV5hZuF4Whu519ekxzlYuh06eceTWIgmxwa6i603iLKv3FietR4rBiA==
X-Gm-Gg: ASbGnctyvjRbW+51YBATnf2W0vhkUd0p9AwxghKZvY1BO9rfVimXu9eHrFedaivXeck
	SohOGodOYQ63ChG0GO1V0smG7VA28OIBVBowI8Yr/q8h3tsOvqZ2ace6wSnyjhxOPWyrUT1Nv3B
	228nh2vyrB9YYm4cZ0+FLxQr/82/8ycrizKIGbbX7ysRf3Lsc5eRJdDFGW4cQn5pJVe8AEztCX0
	127NIQg2aO0zPvU3doDmJW0U8KscyDWe7KmzKoRYkg103RrlrGdVPyVY8s2n9KctaugKE+9YWQr
	3DXiW6lbCDfcNWqET0K6OMAydiHxhytU5QPlKdm9P/rDNYt3cHT7XdHNYxLnTTOzum1gF0tUAPh
	/1WJf/nm/cGH7PaCEz+L9Z/xvWCymMvNSG3TpG51WaB37aKlzfp9ZWdDZk8xsd0yiaVFj/PtSOi
	IrzEyap7c=
X-Google-Smtp-Source: AGHT+IFfynWsAPxTfoLimLvd3awI0kPtHyIR1g7iWxVcpE0HF2HWeouigXr4pdtLzLlW8SebZ+IxtQ==
X-Received: by 2002:a05:6000:2285:b0:3b4:9b82:d44c with SMTP id ffacd0b85a97d-3b5f1880fa1mr1573257f8f.22.1752216171759;
        Thu, 10 Jul 2025 23:42:51 -0700 (PDT)
Message-ID: <5e394472-5e44-4eaa-8009-7f2667f2df89@suse.com>
Date: Fri, 11 Jul 2025 08:42:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 02/19] tools: drop "has_num" condition check for cppc
 mode
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, Anthony PERARD <anthony.perard@vates.tech>,
 Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
References: <20250711035106.2540522-1-Penny.Zheng@amd.com>
 <20250711035106.2540522-3-Penny.Zheng@amd.com>
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
In-Reply-To: <20250711035106.2540522-3-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.07.2025 05:50, Penny Zheng wrote:
> In `xenpm get-cpufreq-para <cpuid>`, ->freq_num and ->cpu_num checking are
> tied together via variable "has_num", while ->freq_num only has non-zero value
> when cpufreq driver in legacy P-states mode.
> 
> So we drop the "has_num" condition check, and mirror the ->gov_num check for
> both ->freq_num and ->cpu_num in xc_get_cpufreq_para().
> 
> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


