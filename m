Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B29FFB51AAF
	for <lists+xen-devel@lfdr.de>; Wed, 10 Sep 2025 17:02:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1118426.1464203 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwMKp-0005Zy-NU; Wed, 10 Sep 2025 15:02:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1118426.1464203; Wed, 10 Sep 2025 15:02:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwMKp-0005Yr-Kb; Wed, 10 Sep 2025 15:02:11 +0000
Received: by outflank-mailman (input) for mailman id 1118426;
 Wed, 10 Sep 2025 15:02:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8l2o=3V=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uwMKn-0005Xy-CA
 for xen-devel@lists.xenproject.org; Wed, 10 Sep 2025 15:02:09 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1e62cb98-8e57-11f0-9809-7dc792cee155;
 Wed, 10 Sep 2025 17:02:07 +0200 (CEST)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-61cb4374d2fso10570618a12.2
 for <xen-devel@lists.xenproject.org>; Wed, 10 Sep 2025 08:02:07 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-62c01bdb66esm3268561a12.47.2025.09.10.08.02.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Sep 2025 08:02:06 -0700 (PDT)
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
X-Inumbo-ID: 1e62cb98-8e57-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1757516527; x=1758121327; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SvOd9m8kJxDcIg/axlV3ZS3HHk2oHeXldMDYZsTyLv0=;
        b=YoxK8CNI8YXtYAL7L1f6DAFGDkaaxvCJiemt0CEyGrRwJWl5HdHY1QRvo/D9OiJZKY
         07wEnP/HFv0o3dsJim54Xq/Yyxyy6Olr94JQBRu/k0yLCa0FKc84ierPhnQcl5Zjn4O5
         y8jvcpXvR5EJM2YIsN4gXObzOVDKv/DTmZaYrwy2/G3aWHUYWt/2NR4s9HKXsugr//QF
         /nM5xMgEow3fxEy2Sn+udLQjRvQOCf4/H51HfgVlmRpAeOOGFFDSqSqP+FTOwK9/kxM9
         XIfPBZguDcqLwUZrE7287gso5yNu4Qx707VGb6b/vNoO39XurDIXRQ/PEo52008wW130
         ciFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757516527; x=1758121327;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SvOd9m8kJxDcIg/axlV3ZS3HHk2oHeXldMDYZsTyLv0=;
        b=U0yablo4vnx8N1qgxUxr2eCPZcSnsWsnnQM4yWHNnuNw5OZo1SYsf9uTvsczEAoT7p
         sV8j9sbEgArVex3HLXmiHREQcpI4OrX1jUypqzLUi9eNFW5YJG7wPeNR/v18FCai0mAP
         7EkN0QxX2rONUXuE+DBBjEABynGGla54iQznRzXFj5GwgIFDnxq4OjA6wMtsFK+Zg7G5
         ly9ZCQMWp5CuvZFeSL76+5sLueKRZoKUTZbGMLWq0hwH/5nTtYi9xIzGWDSQ4x6amczY
         5IjY5Xgv+ToUu0M9IeKDQJleHlaZoE5HmtT+YieF9ltk7YTkJ78Y4wdJyTEN9Ni419Wf
         EJCg==
X-Forwarded-Encrypted: i=1; AJvYcCVlZAbu4yPIBkzOCdXty/YdOQQMV5qLfGHNbhW3EDY6PCpGlQqGeuQq0l5tRnwsDDf6aT/K24coaxc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxnX1+D66efMxTVDns9mIW00qnW5vNNkgekTH+HXmtqVSFyR+J0
	aVrdLgEWutotsfr1EVbRCm6yWLV94LE13ak0eauQUB0hQzfU1Gxw190LI0HnNfu56A==
X-Gm-Gg: ASbGnct+OYW5YVXVnqH2ZeCvFrB9rNzU+N9W8/gYKXrdoiuUYLOkRcR8ymDfDhswT3D
	2PI5uuzzSMUBntXnWGjWI+ffo8eoizkH8nNolxovS7iaR4t2ZL5WyxjjfHLLvTvp2koZrfYkMN3
	CHRhb4r9e45UEEBGFO2NH3uDedP1mdI6na5OdguiEzJoWaPkCvlK6XRyQnXGOZw2TQGIFIlCmZT
	+7MQIrG5cP6V0nrosSOuOT5WT5aNdh+kpNH7eNAD1dyJtCG4akULY2C+0EArlQT6fF9E8oj8TLs
	EkqiSzSlG1ReQ7po+s2gGN3jMOU8SsP7RXTjtMr4cEDTFRsucoYOJsOdic+o8cbl7K5Rh4zFetm
	FAaDJyFR6atZUoxqGNFy/8NiwNVMjVSFiY6D4Ie7sDgbHnlhEbatw5ilNbD6FKATZ4nRWf8qIGw
	13H3P41bBFbqZwFicIcw==
X-Google-Smtp-Source: AGHT+IGDD6uEdgk1A8IYUrI7JBWrFpb7xC/+/HSY3g6IZDxOZ2sekopUWMiayGMRjq3ZGKhBn/z26A==
X-Received: by 2002:a05:6402:5210:b0:62a:85cb:44ca with SMTP id 4fb4d7f45d1cf-62a85e9ca8emr9248414a12.34.1757516526501;
        Wed, 10 Sep 2025 08:02:06 -0700 (PDT)
Message-ID: <2c559b3a-9991-4aab-ad65-645ac0cca5ab@suse.com>
Date: Wed, 10 Sep 2025 17:02:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] libacpi: Remove CPU hotplug and GPE handling from PVH
 DSDTs
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Grygorii Strashko <grygorii_strashko@epam.com>,
 Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20250910144921.29048-1-alejandro.garciavallejo@amd.com>
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
In-Reply-To: <20250910144921.29048-1-alejandro.garciavallejo@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.09.2025 16:49, Alejandro Vallejo wrote:
> CPU hotplug relies on the guest having access to the legacy online CPU
> bitmap that QEMU provides at PIO 0xAF00. But PVH guests have no DM, so
> this causes the MADT to get corrupted due to spurious modifications of
> the "online" flag in MADT entries and the table checksum during the
> initial acpica passes.

I don't understand this MADT corruption aspect, which - aiui - is why
there's a Fixes: tag here. The code change itself looks plausible.

Jan

