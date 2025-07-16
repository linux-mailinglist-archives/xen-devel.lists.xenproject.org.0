Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7641AB07863
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jul 2025 16:43:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1045294.1415384 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc3MF-0007DX-P6; Wed, 16 Jul 2025 14:43:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1045294.1415384; Wed, 16 Jul 2025 14:43:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc3MF-0007Az-Lf; Wed, 16 Jul 2025 14:43:43 +0000
Received: by outflank-mailman (input) for mailman id 1045294;
 Wed, 16 Jul 2025 14:43:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=L52i=Z5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uc3ME-0007At-54
 for xen-devel@lists.xenproject.org; Wed, 16 Jul 2025 14:43:42 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 43e8a025-6253-11f0-a319-13f23c93f187;
 Wed, 16 Jul 2025 16:43:41 +0200 (CEST)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3a4f72cba73so658515f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 16 Jul 2025 07:43:41 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b3bbec94a82sm13702061a12.8.2025.07.16.07.43.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Jul 2025 07:43:39 -0700 (PDT)
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
X-Inumbo-ID: 43e8a025-6253-11f0-a319-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752677020; x=1753281820; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=p3J/qlQM8J6O2t8N4GGPOjA+woYKtWY4gghR0G70ask=;
        b=CKWZg8Qogp3cXmKgbL4Hooqfva8FohIuajBO4P0F7K7G5FB5mOXxkKfSAO2WmXPm9G
         307qYkkDYhwyyW+UHZoMr+iansPOq9uK3brLOA1JjFymiTX9xLebPz17mr85FX9d8meD
         LCqO+a/Bn2gOLF3iquBvHi7H6hPAFHtl0FgzH4OcQyArtAq931H4LpfZe7GdPz7DKa/1
         vGYr6kMWj5O3CgQ0q8sR9GGBw4H5u3y8ZYLfoDVJoDKpK4p4PnLgCkwAbtHSqVFhk4O8
         cvLu2aT+L6WQHIQEViwAJgK6vBqhiJk+DcAkMaVaHhwQRtGuwaAGGQPD59U6bI1ul9Or
         1ptg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752677020; x=1753281820;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p3J/qlQM8J6O2t8N4GGPOjA+woYKtWY4gghR0G70ask=;
        b=Q+SF6RycvqY6SA4kFCVmJ6CHzJ5JbMfy2Nw74NNCwILp1vh+WmzH5hJ0rLviDfJ4pW
         8/zJgh4GOcGuFmSOfdDMQdc18TszFYg5T4rvkF+br1rnGWc0JxVkJiYl8fRFWzObyNrm
         CCEAKpnAtwCW1pE6S06gVCxC7uVZTaKWS9zAMCcqRsKquw14/xVb2ZorYnmBLp84CUYd
         jYoObLLRTn85zGa2drIG0OO+QW/JzwedGuJDDJ5lzyfMM/yg23LuBc9/gZBfAs/nC1M0
         R0GZmS4izzmEiDmp1CHQPP7codCa2O/i6L8jcPDdz3nduO/b7nBZrNicvxcFBJdGSBhL
         DVBg==
X-Forwarded-Encrypted: i=1; AJvYcCXTqTzGCbWP599VmB/E2EHq0R7A2jTxd2N8HECNcR9wpmjnnk9dp2/JLdw9OPrKOJwbE5NWcP3672Q=@lists.xenproject.org
X-Gm-Message-State: AOJu0YybwNGL1IeXwn2GYxx3FhgUtWSHgDPCyc/LsWc5MaSCoy66kbHn
	YPATAxxTmq9EAGgtQodOg1+BXQ1/y+xijZvoPtQ+J+pQZzRz98eWqFVILD7itD7okA==
X-Gm-Gg: ASbGncs2zFqGXZ1GddH44Vd9ltKhvfjLwq1HzgZireaQamhZC9Lwn5EZxUZP9RYgdGD
	c4IyCWpqHrAHGanbN+Pc8Af+k+dUIEC57j8tWbg/l7/MB8jRxu6jjgTs7n18lMTt8UunwHLA4E/
	ZJouO6rGWfWCMWZMuJ2Pl3o1jNwB3JCeZ8IUVceoYEloWJDxf/pnKWLwLT6yWt7uRnRZ3JDAmm0
	IN/hintqEHE+1C4AkpHvokmkSgMsxLr8Z+D9ULHJPflGgKnM4RNPSSULbh5jN3PLu/fxToLA3+a
	wwJgvRY3IBTElW3KCWHviHb81bg7GJ9duCVmC132hQSDQ0XPDXMgjxzlqzJA6D3meBNuYkl4Ir6
	w4rcKhe0DmDKrdAsPAFYjfBziADp+IOrdE5tNIcLBzDblOLZpkhVVxfkX71X1UB/c9dVh3WPrVH
	VPKeBPIgI=
X-Google-Smtp-Source: AGHT+IHVe3WNaqPPrzmwXwI810lXw+WVTaF4FIfawf1b1z7IFPPDKPaboCwKCWozbSf8H4L/xx0qVQ==
X-Received: by 2002:a05:6000:26c9:b0:3a4:e1f5:41f4 with SMTP id ffacd0b85a97d-3b60953aebbmr6504598f8f.17.1752677020454;
        Wed, 16 Jul 2025 07:43:40 -0700 (PDT)
Message-ID: <09887347-4b42-46f9-8462-0b76babb2617@suse.com>
Date: Wed, 16 Jul 2025 16:43:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 03/19] tools: optimize cpufreq average freq print
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, Anthony PERARD <anthony.perard@vates.tech>,
 xen-devel@lists.xenproject.org
References: <20250711035106.2540522-1-Penny.Zheng@amd.com>
 <20250711035106.2540522-4-Penny.Zheng@amd.com>
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
In-Reply-To: <20250711035106.2540522-4-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.07.2025 05:50, Penny Zheng wrote:
> Unlike Cx/Px states, for which we need an extra loop to summerize residency (
> sum_cx[]/sum_px[]), we could call get_avgfreq_by_cpuid() right before printing.
> Also, with later introduction of CPPC mode, average frequency print shall
> not depend on the existence of legacy P-states, so we remove "px_cap"
> dependancy check.
> 
> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


