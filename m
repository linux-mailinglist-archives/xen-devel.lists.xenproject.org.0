Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 097ECB39AB8
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 12:57:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1098354.1452425 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uraJE-0005ge-Il; Thu, 28 Aug 2025 10:56:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1098354.1452425; Thu, 28 Aug 2025 10:56:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uraJE-0005db-Fg; Thu, 28 Aug 2025 10:56:48 +0000
Received: by outflank-mailman (input) for mailman id 1098354;
 Thu, 28 Aug 2025 10:56:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pYI3=3I=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uraJD-0005dV-Au
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 10:56:47 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b0ab542e-83fd-11f0-aeb2-fb57b961d000;
 Thu, 28 Aug 2025 12:56:46 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-61caa266828so1651930a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 28 Aug 2025 03:56:46 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61c78e49c90sm6982983a12.45.2025.08.28.03.56.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Aug 2025 03:56:45 -0700 (PDT)
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
X-Inumbo-ID: b0ab542e-83fd-11f0-aeb2-fb57b961d000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756378606; x=1756983406; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5KQGDpdyzpGsq3yrgJsk2OobwzHfCnLsR4h/xFJ1OAI=;
        b=JmYierkZQfDFtyVM3ex5xMxHbK+TxhBxzHpg7xBuHeoSBDymfeB2zOI0LKHw80YfS+
         WuizZBxMOx5s0HUctag2i9X/akeNLYI6WreuYqRjRB9bh3q00G+oJ1eHXf367mJreXJl
         r6Z5jiDpCTSSdwD3n8cKWTzU8PLqYsfRGl42ZlFa4uSWnHq9//ahjbEWC/2l+ACn3GNd
         +9aaf7oSm/zii4+ncmyUHjbow45Yrr4T2TEnBc8nlXMhUprSc9Cze5D12dbuHfFevXwf
         O2pbXmcouN/sR8eO2bL1p86PsC+vAeTw8Ex/ZAnbVLjvOfwjF9IpYaBRpKk/aGmrQ7+5
         uv2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756378606; x=1756983406;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5KQGDpdyzpGsq3yrgJsk2OobwzHfCnLsR4h/xFJ1OAI=;
        b=RMp2HEwTcB/6BET2UGkqPUKRQjvREfTxH7J9Ap4wMPOBxHOVLcBeN0SwzHBjYuc8pZ
         jlRtAFKyVGtq5l+joXC9f6EoQATmBW0EV3r5Emv4dqZ8n3WEe8dyYr6JdG7d9RhVnnPB
         kLUeZY/VvUC97L87MaOQJTWZAuaJsKhCXhhEPQHjdN0AJKnBn0JjMzJF0lcVSm17IbfC
         OuZHiiaRuhQ5fC62eZIPXWPLxZKZYpHDTiKP5qcFvsGdRZBLl7Ozj7DSjOoH7O+Jt9/z
         7W++3JydrSEEUxrDgNwqTSKtFpOxCGUTLh+Lc9LZmS1TTdLXfnHGP4/3rJiXtZTCVBj7
         jQ5w==
X-Forwarded-Encrypted: i=1; AJvYcCX7CIq+DGc15HVKacjQOAUoO371Q9Ebk3TGTs2rwfUplsNB9CzI8hukhMuC2Ywpgv4OSUk8G4PNOGE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxQ6k2Nj2vwA6LBCtDZtW+A+94RpPy4nTKLw2Mz3vrpNVi3VnDg
	/i4PVh5R2onP33DXDPYP1C1AkgsguUpB4gCEy78NMplU0KAm7q+P7V2Eqy5VLXAZ+w==
X-Gm-Gg: ASbGnctt/QaN3xcLQimkVx+F58HEigXLdv/E6ozKcZZJAs/v4yLoSROXy2LsZKR7dLt
	S4A1D+2kdENeBKQe8YK/j9wziBqS77jP+PPJvr9tAghgpS8/hr3BThAuQwMRIQxwKiHJKcx+/aO
	cS4gCg7NWdiA68xaRRMNE1qFWFoifKXj0GiLAH6JsHx75tJ/6pGJaMY2l7DGQoiwsVcVArWtHCb
	k/DP3UvbsfgbKNhSrCCxb2lr+H4H/K0F6xOYyrgBB9YROg8s1KZ9n4y4RDGo3BMdGcjHlFMOab2
	iJfQynoXMGwyctNGWbqNSwHp0XT0ZItgdXCjNTtM6ioitdwAmnQS95fJsw/8TBnKRP2jzO8ea6g
	QiYRv1Z9kwTFpw2KQvfXrEFDS+bZOoPdWTle0RcePDhfU/fys0mNVjYuT2PTY/CleFxOfANG4NM
	QUs7VNbL0=
X-Google-Smtp-Source: AGHT+IGre8su64e+qOiYVUnqCE7iWSPXaQC07YK0hn7/9R6c+CFydWljel0af6TTWheJ9UWlILEVUg==
X-Received: by 2002:a05:6402:42cf:b0:618:bc4:5777 with SMTP id 4fb4d7f45d1cf-61c1b48f533mr19057785a12.9.1756378605766;
        Thu, 28 Aug 2025 03:56:45 -0700 (PDT)
Message-ID: <bc500e36-30fd-4231-ace9-697e5644e12d@suse.com>
Date: Thu, 28 Aug 2025 12:56:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 5/8] xen/cpufreq: get performance policy from governor
 set via xenpm
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, xen-devel@lists.xenproject.org
References: <20250828100443.1776675-1-Penny.Zheng@amd.com>
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
In-Reply-To: <20250828100443.1776675-1-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.08.2025 12:04, Penny Zheng wrote:
> Even if Xen governor is not used in amd-cppc active mode, we could
> somehow deduce which performance policy (CPUFREQ_POLICY_xxx) user wants to
> apply through which governor they choose, such as:
> If user chooses performance governor, they want maximum performance, then
> the policy shall be CPUFREQ_POLICY_PERFORMANCE
> If user chooses powersave governor, they want the least power consumption,
> then the policy shall be CPUFREQ_POLICY_POWERSAVE
> Function cpufreq_policy_from_governor() is responsible for above transition,
> and it shall be also effective when users setting new governor through xenpm.
> 
> Userspace is a forbidden choice, and if users specify such option, we shall
> not only give warning message to suggest using "xenpm set-cpufreq-cppc", but
> also error out.
> 
> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


