Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 527DBB39D79
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 14:39:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1098716.1452705 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urbuM-0000sA-43; Thu, 28 Aug 2025 12:39:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1098716.1452705; Thu, 28 Aug 2025 12:39:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urbuM-0000p3-0t; Thu, 28 Aug 2025 12:39:14 +0000
Received: by outflank-mailman (input) for mailman id 1098716;
 Thu, 28 Aug 2025 12:39:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pYI3=3I=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1urbuK-0000ow-Oh
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 12:39:12 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fdb1a26f-840b-11f0-8dd7-1b34d833f44b;
 Thu, 28 Aug 2025 14:39:08 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-afeec747e60so75733766b.0
 for <xen-devel@lists.xenproject.org>; Thu, 28 Aug 2025 05:39:08 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afeae4ca4bdsm574880366b.5.2025.08.28.05.38.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Aug 2025 05:38:28 -0700 (PDT)
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
X-Inumbo-ID: fdb1a26f-840b-11f0-8dd7-1b34d833f44b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756384712; x=1756989512; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=RiMbH07W8Ix/UhvaopBy/0jMJ0gRe8Zewj6uCvPu7dc=;
        b=bNSfEEut5ZvkaOgZCFplg8cnemJQ3xIEDhBMnMOZUJKWbNYPT04xkoOpfbswOFBPAj
         Vt+Kd7KalMiMbzcqVo0b4mP9IiR20zdx3f/avMGY9UKEXJ5jhnNX2kh/H+QNp6PwvKvN
         V6rvqWWaAcZSXwLg/G0hhnkA3+6P2FaR+FHI0zDRB1kzQjpYa23qcUI9jCrZlbWWF+vK
         i7P+o68ZtZCgm0e/8zzEIZaMso7VmWEsuDJOhxq1E9COkzdFu/N0M1RPhNzpdHc5IRp6
         IuX+cqoQC0Y6EXd8noWhbZJBGjBpvHQQLmH37+9QZXgkJzXvzKrkaUfWSR0O/zx3OsuY
         Xm8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756384712; x=1756989512;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RiMbH07W8Ix/UhvaopBy/0jMJ0gRe8Zewj6uCvPu7dc=;
        b=aY8jNQW90VfmuQ+tEWSLtNBGZ+7mS1jtoGdX/ZWFeQx6i1430zKggEP6xXpsdyY0Be
         t7f+VSWioFQ7LynAHpTw0h+FbDbzRrXjo4r2W0QeeIBPuGrn3mLHDNF3IGzGW74d77vB
         1hfUKH6JX9roAzGPhBFJzwrlAcF3JJ97/cO7lDRZuFe3n2inArFaz1uso4Qhx7bo/pNK
         59+HdynLhSF56Fu94sCc37NEqJE6YhFQTxUcMHnaqlBOXfN77MlWRAVZM8qq+43RyQXd
         CMfO5UqrIKJRU1BAlfbDOFRP34P9TZCDMuiS7tPO4ZiMRdqW3pXq+L/txMTyOQJXsEX1
         ztPQ==
X-Forwarded-Encrypted: i=1; AJvYcCV5O7vRaXJ+Kw2dr/I/pXPN1fdWYefbrH1lg7jcdovwm2gwd2SLIAg4Rf0Oec0djM+AdbrkhjmgZfE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzBqoj7JYeNxqHhYy6sW067g8R/6aTxJ94KV4kDdf79pHEUl+K2
	zN76mNaJHMrXQRfEgJnubQmQwiVxWZGk/+dfeAZJlTeVQUBp054yH1uq5uLUmCTMTg==
X-Gm-Gg: ASbGncsY9ZrFI8YXVdjv5uPVNIjqTNXg0CJztQz1yQh78VKZ7t8M9YkNyasU2ycr4in
	5cxmJvGiGdrKZlpGceIrUV21jnVTfiDf5KsiNdzciXkMAJQNyhg07HOHNlwv5/krXfIC2HOGjbS
	0TbNdg+NcWauYA8KspXi/T4m/3LXF1A128mSFi5qprQS7iAIerXqMwt/u/WKuWN9J0cfVFiLSUP
	fZQ4fkXsYrrjxJY7McOUgZZT7G7RQnZ2Iq5o47hMkN5K2cJ0JGW6B8q//ebSmWEdNybSFyTfCSL
	kNFNy7rSLvLf4roB50k6k+o/GKzFrPOAKmPhnkeBVivcyConlQGZ6yWJeFr/nMLeVzDKziId2QG
	UQDSWyJ6ipMqHU+crH5Dp+Bt98HvJxgvARrv16P+F1sOeGTLSPVU6anmhZM4V18c3kdyynAjjgd
	TKbJ376vGiyrxoCXLABg==
X-Google-Smtp-Source: AGHT+IGQdXPS3x6/DcZ8Ubj9HVB5LJq32uWzD7ls49+8F05rXtGlWT4aEJyicF1blY24xdIoVPi7cg==
X-Received: by 2002:a17:907:3cc3:b0:af9:7f4f:775e with SMTP id a640c23a62f3a-afe295ca548mr2187879166b.51.1756384708691;
        Thu, 28 Aug 2025 05:38:28 -0700 (PDT)
Message-ID: <43c65b51-ed9b-4ec5-b1dd-ae3a047cba86@suse.com>
Date: Thu, 28 Aug 2025 14:38:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 8/9] hvm: Introduce XEN_HVM_MEMMAP_TYPE_HOTPLUG_ZONE
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1755785258.git.teddy.astie@vates.tech>
 <3fe81c78b95f60353a84b8394883ecfeee066732.1755785258.git.teddy.astie@vates.tech>
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
In-Reply-To: <3fe81c78b95f60353a84b8394883ecfeee066732.1755785258.git.teddy.astie@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.08.2025 17:25, Teddy Astie wrote:
> Allow specifying in memory map a region which can be hotplugged.
> 
> This will be used by a future memory hotplug feature.

Why could this not be done the ACPI way, with the regions properly specified
in SRAT?

Jan

