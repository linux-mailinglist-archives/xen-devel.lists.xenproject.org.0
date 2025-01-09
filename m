Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96336A0727E
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jan 2025 11:13:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.868005.1279545 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVpX4-0000V9-DG; Thu, 09 Jan 2025 10:12:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 868005.1279545; Thu, 09 Jan 2025 10:12:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVpX4-0000Sm-Ad; Thu, 09 Jan 2025 10:12:54 +0000
Received: by outflank-mailman (input) for mailman id 868005;
 Thu, 09 Jan 2025 10:12:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pS5t=UB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tVpX2-0000SZ-NR
 for xen-devel@lists.xenproject.org; Thu, 09 Jan 2025 10:12:52 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 48e0291d-ce72-11ef-a0df-8be0dac302b0;
 Thu, 09 Jan 2025 11:12:51 +0100 (CET)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-385df53e559so551419f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jan 2025 02:12:51 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a8e38bf78sm1378448f8f.48.2025.01.09.02.12.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jan 2025 02:12:50 -0800 (PST)
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
X-Inumbo-ID: 48e0291d-ce72-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1736417571; x=1737022371; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=HutWFCHfjg+cZh6uAdegPj1KJlyQXIvkp6rp0EMGEk4=;
        b=NJy45MNpBV/hSR+vgyyZMtw1S2O0NIU/XM012tohqJerxxbRZkLqabbH4LKkj3BSF2
         0zWObFMKaahlZa5puWtoedi8ZrdUER3ozbKdklLBW8L6fkOKc5dFNC1BuSTwiCxOjobZ
         f6Xfrv4ZNy7lScOKhoqCVFZSLi/kUYY03ThgbZzHGy/5oDti9WtTmCJGg/wxUrf6I/aH
         j61EVXTc1BvQeGuqziczzMaMMS10IdIPCUdgRX+72wCLja6xDRW5omoi/eX+VsA+aFAr
         gWY3H5in6rNmAREcw5DPSPnyD06kWnjGObDCDEo8ZcSVjfOvDOkbQ6IgPxL3yH5+tEtX
         h1Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736417571; x=1737022371;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HutWFCHfjg+cZh6uAdegPj1KJlyQXIvkp6rp0EMGEk4=;
        b=k7v5vzTyiGEpz0gpqFaBhmaTZvLu7xHyl00NgiAlWxMx5iKTXvSpZ09Jm3QPp6q6pX
         I+ZQyYTWZDkIwXAHr1D8h+pIpMc6EHO0qsUpwxJZfQ5zQcgJM0j7yZ53ml3Ju66djllg
         cxP6AU20MG5Ivp7ZFCPsbbgJadOFASlDjKkpkWd/gAcpDaSPIbScm+paoEhiNRtIiL2T
         h5JPx4GAJ5LVwvO9AtUQtpwD+XWa9u2/Kpbe6QVPQO3GGpvMyondmVV6aBkseIX73mWu
         aF0FywBw9XVnK6Qs9/M7U213IULryQu44JPpzvHrkKJuizTfJcXAyX3Rg5FzH3kAWzdc
         +51A==
X-Forwarded-Encrypted: i=1; AJvYcCXKQLVwgfV1iCVW48O68lThX7rHP+S9frvklLKyzRfjV7becVCeiw6YEAcQLxcpSOYaHXPlpyRFavg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyJUJs1FGsZzjXx0wyPQVmW/mkA9moP+T7jHRgGP+0c+uWYEOfE
	TN8ve5fK6eRfcxy1nt3ixUQCMDY8AnJNfsEnAFLxzzwzDmDwyUus0dD2omfntg==
X-Gm-Gg: ASbGncvZT5p+ZDx7OD2WXiTqwN4gHUKndBlON0hFgFEV2iMkhY9Mbg/umSXGqXeHVXX
	TQENlfO8oSf0rglzwX8tPStVL++05Ev6ejFej/RtxygFA1JeAOcCz3aVsvY/g+ks+O1f3Uw2hDQ
	cFbVXCx+C1CoyxNtkTC6fri/iBmR7QXV9rXOzbv3Fa5Qj/qi9FSFdqZSrTQAnvWyBp7YoAjvAs9
	FJ2sHCYhjwSiUd/lzl8ARRFPjeM9xElCu7OwTukO1yWWJ7pZ9WbcLv2yp/XfJJffP8MALDsAcKA
	rmcjDdYJsjAHGbPX/asqwp6KezoHr2FbpfbgfxBvYw==
X-Google-Smtp-Source: AGHT+IHoqeeIjIH+cUDDKTzxX+BVbip27/Tw88BAlSRMEf5AcZtLmdbKOQalZnwiDjulf94GyhxlsQ==
X-Received: by 2002:a05:6000:4b04:b0:386:4a24:1916 with SMTP id ffacd0b85a97d-38a87317c6dmr4492266f8f.55.1736417571217;
        Thu, 09 Jan 2025 02:12:51 -0800 (PST)
Message-ID: <69360d8f-61e8-4bdc-b7e4-be67dbdd719b@suse.com>
Date: Thu, 9 Jan 2025 11:12:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 04/11] xen/x86: get processor max speed from DMI table
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: stefano.stabellini@amd.com, Ray.Huang@amd.com, Xenia.Ragiadakou@amd.com,
 Jason.Andryuk@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <20241203081111.463400-1-Penny.Zheng@amd.com>
 <20241203081111.463400-5-Penny.Zheng@amd.com>
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
In-Reply-To: <20241203081111.463400-5-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03.12.2024 09:11, Penny Zheng wrote:
> When _CPC table could not provide processor frequency range
> values for OS governor, we need to read processor max frequency
> as anchor point.
> 
> For AMD processors, we rely on parsing DMI table to get processor
> max speed.

That sounds entirely fragile. There are better sources for this info,
aren't there? See e.g. amd_log_freq().

Jan


