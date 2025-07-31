Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 426EEB1705C
	for <lists+xen-devel@lfdr.de>; Thu, 31 Jul 2025 13:28:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1065494.1430863 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhRRo-0006mk-6j; Thu, 31 Jul 2025 11:27:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1065494.1430863; Thu, 31 Jul 2025 11:27:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhRRo-0006ks-44; Thu, 31 Jul 2025 11:27:44 +0000
Received: by outflank-mailman (input) for mailman id 1065494;
 Thu, 31 Jul 2025 11:27:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lm68=2M=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uhRRm-0006km-R4
 for xen-devel@lists.xenproject.org; Thu, 31 Jul 2025 11:27:42 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5e9deec2-6e01-11f0-a320-13f23c93f187;
 Thu, 31 Jul 2025 13:27:41 +0200 (CEST)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3b7892609a5so529099f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 31 Jul 2025 04:27:41 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b422bb19c8csm1288371a12.66.2025.07.31.04.27.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Jul 2025 04:27:40 -0700 (PDT)
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
X-Inumbo-ID: 5e9deec2-6e01-11f0-a320-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753961261; x=1754566061; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7Gy3tgfpPOH3NaMBatzIwiRcwvVtsWGIIktLRDIuJIw=;
        b=QAbdLwXSxuHWM50oKv7uLMtrrsW5s1IYRoGMD3CXMlbdIt3htioNPTOJYYjV7Nu8xo
         P/xBYrCRF9LBAM6nHt9taPcvc8TNeryZFEVNPsNwfOLxkWvbIQNPPKF6uNYjUsQzWot+
         5pNAaBn3r1rCSOK85kQt5XOY8EgWsHJkerzKx2p+TGAqSDZSMaGkp1PonBW+eeajsbtm
         qLp2ImvUQGvNiwqVjrDIdS0RaZLteRLnp1GqMEQbN2Gdqe0S/naLPkT5mhJvqgrp135A
         o8hTOd46Dhq1FmOH5vvipPXafxQvgrPHR9jy7rbRjB1CbMv/q59wvDFOnJYuP9nHSzh0
         egNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753961261; x=1754566061;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Gy3tgfpPOH3NaMBatzIwiRcwvVtsWGIIktLRDIuJIw=;
        b=PUTP5Wk0blbuh5gamvEOeT6pgCxOeRpB/BOXMPEOGLvRb7owWKFZc04RxcMUeAPR7S
         8jv8O7X/Wl+KTscYZGDM1+THsTJZUIiYtIKxcdswIr7VSAdMFH198T5alx5T1NGneqeD
         km48Jp0Emg4skCZCyF9F9PbywDsio7u4KiTvh6z26ZMmzuHPCNkTBk/kGvcZ+FAAUXaj
         9VTKz7pTAsA+LRW1/LGAjy1lyABITQpUdov3DWP4SoRHkOY+NvoHQQ3vnH0vTcrKMYwd
         bqxCDbMTQEwnL7Jml6L7+42v6z9K2aOP4Lvp8dhYotcewSxts9RZ6OYvhZ8paO09oc77
         QFOg==
X-Forwarded-Encrypted: i=1; AJvYcCX4ICA25Q+Rpldwlrp3CAJ1+zIuwyfm4mZgWVx0E+LrHjWVoenIC99K+rzH6mXiDdfYkaffDbRkD8k=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwcG1udxg3NMyKXdRjL3yEmLCnc8tbp+EJAxGUT2QkWzgGVrgUD
	VS4wNODfUnqaEyeSHQXd36rGP3nRqhOPk9U8mko36KSOYXWzw2NvEL4T8HUY2OvXGg==
X-Gm-Gg: ASbGnctLnOSm8IyNBg2ADI+NbFRdPE2N2eOdece4xXSAKf7B3ZjHYh7hyJnoGAZBifz
	4MAkPm9xwS7b85P0LlFJPNMj7FgdtfE/lAZEZxNHOvz07PzvbioTiHDBBB0Ep4wmsvuyZNwdbCJ
	j5r8QCaO32+hBth6k7YOlQKh1DHeZWSwQ5zVvuPiFkCoc8pNp4Y+vdUkeasFjyYRDfUBkLGP6Cw
	r5ZB7u/Jj0SziP1LJZAeT9lzKxxjU/MeCfwrA9RalS6AaWJZ/K/mTrDnFY/Shx+eR8GII45vkj7
	5CqMI5JftYDe+goeTcBfo3R+Oq//hYjLbo+N3X8xzSgyNJo4niz2/aXpjKVrpgapOfbA7/fJIuy
	2y1KbgHvXi9YRW0bM+kxrrtrYYl6wQKKT6wxq9fZ2UF7cRHxCdw8N5FE5jFe/aMit8jp60HdJFG
	zo5ATU274=
X-Google-Smtp-Source: AGHT+IFbJIYzvAIdvL7tKZUeg+bHeoOrp1uLHW3rhFfPV2VRydJ7zkBu4SwWMUgkXG1HI+wtD8HyiA==
X-Received: by 2002:a05:6000:22c5:b0:3b5:def6:4f7 with SMTP id ffacd0b85a97d-3b79501e523mr5580422f8f.30.1753961260607;
        Thu, 31 Jul 2025 04:27:40 -0700 (PDT)
Message-ID: <037ba8a2-5ff1-4af8-b3eb-24ea1f91d489@suse.com>
Date: Thu, 31 Jul 2025 13:27:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] xen/version: Remove xen_build_id() and export the
 variable instead
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250731110231.3551636-1-andrew.cooper3@citrix.com>
 <20250731110231.3551636-3-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250731110231.3551636-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31.07.2025 13:02, Andrew Cooper wrote:
> The API is unergonomic to use, and leads to poor code generation because of
> unnecessary forcing of data to the stack.
> 
> Rename build_id_p to xen_build_id, and build_id_len to xen_build_id_len, make
> them __ro_after_init, and export the variables directly.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


