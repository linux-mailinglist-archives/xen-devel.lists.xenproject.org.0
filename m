Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F6FAFE10D
	for <lists+xen-devel@lfdr.de>; Wed,  9 Jul 2025 09:14:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1037764.1410296 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZP0n-0003dg-GL; Wed, 09 Jul 2025 07:14:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1037764.1410296; Wed, 09 Jul 2025 07:14:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZP0n-0003bf-DB; Wed, 09 Jul 2025 07:14:37 +0000
Received: by outflank-mailman (input) for mailman id 1037764;
 Wed, 09 Jul 2025 07:14:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6dDj=ZW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uZP0l-0003bZ-Dg
 for xen-devel@lists.xenproject.org; Wed, 09 Jul 2025 07:14:35 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5d9211b7-5c94-11f0-a317-13f23c93f187;
 Wed, 09 Jul 2025 09:14:34 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3a4e742dc97so368151f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 09 Jul 2025 00:14:34 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31c30037acdsm1188358a91.9.2025.07.09.00.14.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Jul 2025 00:14:33 -0700 (PDT)
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
X-Inumbo-ID: 5d9211b7-5c94-11f0-a317-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752045274; x=1752650074; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=UE0zYVKMZ6mdrkKp3F3TSocgVxU9vhHzETuASnLQd9E=;
        b=VPrv6yIeOW3IasKpdLAATw38ctZWjnQDGwfIj2Cm3nxVSAdSelUHiCroNoa5B2EZPp
         UVjs21x5pzie8CViAkz5bP2VNs9gHQFts1oacT/IpUeN0OeageHzFycoOV19k+RFE13p
         d4d21dXhsn8xX7dfRzyOJv6gMi5DB+K3wh4hTht72M1LJpcnTi2SiyclUwofTGsZMe8Y
         uFRtOJdh2jaL5t7buCkVsspC8kV4292Mq9mGP/huSQehUAgpUiVse9ftKoqVF8M7Pz7H
         r8E48inJUSHw8AuNTGYCuBh/YpHMkNSftnLWz7Ka+5N0uaHWjYoOkJ9qwvXk50Z4UfUV
         YQQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752045274; x=1752650074;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UE0zYVKMZ6mdrkKp3F3TSocgVxU9vhHzETuASnLQd9E=;
        b=tdn2M5oF6dfIMSCa1ELrDzGQnn9xDb4Eep5AV2JMoZYm8c8YD4O34e4qewB8AdFAEc
         sHCLG7bRBnR9/H4QaoAjGaF0uTptRVntgMIW+DY+3oBmBE3ow7hdhJppnp1Sc/KtZQqY
         Iqmp+PNLeJglKniEhK4jrwgW+v0m6hzu9YMZvuHwANVMWpaWXJaG0bc+/ezHMPHscmOH
         vJpIP/hO1++ZwmMNHdFILaEKAvPrzoE8ooFshxCImMNrDUG9cHXL3nG7HuCB9vskxEef
         XUYSsWoM8XBzrSO6i/CCFmlAWhUo3uVPL2cpo0eb4TUwup55gY40xr1eiEgRN2d7IuGY
         lkoA==
X-Forwarded-Encrypted: i=1; AJvYcCU9UU16eng330Jub1yJsPBB3en2xeErjDY704qeSTf2rKvNtYHeOZg+dsxUTfbbRTUNwMQ0BIdGfYg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzSUraXIKHfc2rCp9QAQbkSQlBsY8O79ecow+zXV7y7HDC6f7/n
	s3YZl/kvmV19q2QoHW5eW+CV5j2qhLlsuDm2XjGaCiu717kkUk5DqX8x/203zPOHng==
X-Gm-Gg: ASbGncsgz7Xj0fmbm/j8NMFvikW6MXdKZrXyshK5gwoiulOYQZc5wlZksHgBNkaBQcu
	zCV9pkPtFpnLB6SsRy0b/NDrrS4R3iMShDVLXmLSNZZgXXBOjFyPRf8qSWGoC4MJOFxEKVg1Rfw
	rSsalAlYCgnrAmTFwD7PhNzncaDw0WEi6zI5N6cR5UGW0AvjSLiLSlbxSKWU/Ne1sWxXuBDqnq6
	9lQNlZeey4gWi2ioiG/mpP2JNbI8Ym4of/rSJKe5bgtjc4vrRJIWc8L1jUCD/+wWKuMfHk0Fo/y
	HvG3trWjBy3cBhn6JUhVbgi/7TI3o/tDeU4j2tzG3LDFor2R//7uSTXN/je5fDda3Z/Zv/laUoS
	tA02N0UDw239fqZ39I9V4+je0iwQa11rsFAn0JTYww3oN0Q19wt4KPMgU0g==
X-Google-Smtp-Source: AGHT+IH1yWy3ENt1+u5HlgxALuJCzYPeQ+SgZEpqkBGdvzFjDsNpekoEOtEYo4rZBMROxPDDcuTMSA==
X-Received: by 2002:a05:6000:40e0:b0:3a4:cec5:b59c with SMTP id ffacd0b85a97d-3b5de034ac1mr5306711f8f.25.1752045273828;
        Wed, 09 Jul 2025 00:14:33 -0700 (PDT)
Message-ID: <b908396a-50a0-40f7-b6a7-096c35cb24ec@suse.com>
Date: Wed, 9 Jul 2025 09:14:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] iommu: remove unused external variables
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <7e74f3da4e5529e33a4ec5426c0aaa7ca603a1c5.1752013287.git.dmytro_prokopchuk1@epam.com>
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
In-Reply-To: <7e74f3da4e5529e33a4ec5426c0aaa7ca603a1c5.1752013287.git.dmytro_prokopchuk1@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09.07.2025 00:23, Dmytro Prokopchuk1 wrote:
> These external variables ('iommu_pt_cleanup_lock'
> and 'iommu_pt_cleanup_list') are no longer used
> in the codebase. Remove them.
> 
> Fixes: b5622eb627 (iommu: remove unused iommu_ops method and tasklet, 2020-09-22)
> Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


