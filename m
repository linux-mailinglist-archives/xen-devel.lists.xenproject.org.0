Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73E93A9EBAE
	for <lists+xen-devel@lfdr.de>; Mon, 28 Apr 2025 11:19:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.970387.1359103 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9Kdi-0004tW-Ee; Mon, 28 Apr 2025 09:19:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 970387.1359103; Mon, 28 Apr 2025 09:19:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9Kdi-0004rg-Bu; Mon, 28 Apr 2025 09:19:02 +0000
Received: by outflank-mailman (input) for mailman id 970387;
 Mon, 28 Apr 2025 09:19:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5hYN=XO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u9Kdh-0004rY-Ub
 for xen-devel@lists.xenproject.org; Mon, 28 Apr 2025 09:19:01 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d2463fa5-2411-11f0-9eb4-5ba50f476ded;
 Mon, 28 Apr 2025 11:19:01 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3a07a7b4ac7so1013570f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 28 Apr 2025 02:19:01 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a073e5c82fsm10445042f8f.85.2025.04.28.02.19.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Apr 2025 02:19:00 -0700 (PDT)
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
X-Inumbo-ID: d2463fa5-2411-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745831940; x=1746436740; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fFwInLV3vfUWJEXGGnwWSOA44SsiGe7kNheiiCGGNjk=;
        b=ZpWj8vK6uicIX3rFk1vlYSsU4pl2jEQmtKNtMtB63L9aNW5MEMiWOYpYqio039HgGe
         nkG+WjZp1h6P1oPm+VXlyCXCN5OHaz2W/9VvTbXELSNeUFmSFzPwGmlv7d1BXQBvT3Qp
         X4QJp/xQq1thgCppP5myZCR86nlPI9Z3u93tY4+28haG3hduILVc/K7tsdKNLHDJGnAe
         lZ4DimqrmvzodhmWyAsPURZ+mDVzLiT3EchC/zNPFqW/i9fnDd89UsXmF3Un+m2nifWd
         sqaur5pyr4hXjgwnXsdvooogiPJZj5liZ4JYsVdHp7kwyhoZYUzvMdkP3Y9Befa/YdU1
         WVAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745831940; x=1746436740;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fFwInLV3vfUWJEXGGnwWSOA44SsiGe7kNheiiCGGNjk=;
        b=UDE0bsX1sMzKkia5PM3NKf0s4M0sEyO9JcZGMeOQ2bqfcGXDW3PSQR0Q8Gjk4ciC7f
         ys3g9vICLEMU2tfa7Qpojbvch2qfnN+66FHxv4HhRgwsLiLvd636MXrWLYHT3Y6AC5Ki
         V7itRqXwqzLWtP1UescDUPPx7EXYmwuc/I1zhttZClwng2AtuaV3jY2D9gQ1+79+XkPl
         veA34SbYmueqq1hZeh6Bc8Ni2s9dFA4BXpoGDcnPAWwFgWba7e7aA/8ITp6rFmw4qDqC
         5SPIPQ4YipC+IFakD00EWGBs0TzexFC+nRe2eeWuVh6PeaSHgBHjkIjRetbiMDKXwxT1
         5Q+w==
X-Forwarded-Encrypted: i=1; AJvYcCU0YRZl1NefvJU/S4yr6NtCEEpj4qOBQhF7LIh5lSPrINGJiTOTPwSyIjUk6by6a6md0PazMxL8dFg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxRbrkWLUw7lN3Lag39/pGhdbYT78uMUNUaM65pqisEkSL/TPmv
	cDPNH5ro8bI1VhodwG3aKXellcd+4z6cUmNWaxASDzsJ3VPeJLP7iQMz7upqpg==
X-Gm-Gg: ASbGncu8UlcjBe4UEnaonY3kuXF6daNqlxWdvEaEwrVBG31gx5NdH+yQba67WgboETt
	bPrvPWF+X8UgNqcA5JWyApgoSF4CNJj7Y8Mg47gcM0rbX0r0nvvDaEtIOz6FV9S7UOLweVwTpzb
	MYjbhL/WBC+fIEAM6mMd8S5XmwPHunew1d6QLFwM/T+Zd3Witv4asiTrFiLJ+FBHxRQP4PEGIKl
	FAQmrPvQdgIwRWSTcPerzrZXZZcOwTFuH1ZjGpIFYpSANW7DEFo5RvBkwKxenwojJDD9xpp4dKF
	mjmMPFm21EzuGlE7Ftyr4lc3hIs14X2w7O65TwW9b81S5NzMKrTQZSOgpEz/2D5L0IIHKnNdvt3
	2ENeWrOCu5+zjrBeZHC+uJMZymQ==
X-Google-Smtp-Source: AGHT+IEBvQtFy71m1vMq0GiTuJ7TWxhnNOxKlb9xSizM0qfFqVVmEqEzRhzWxJ7u6jzb2c3f/07IAg==
X-Received: by 2002:a05:6000:220f:b0:390:f738:246b with SMTP id ffacd0b85a97d-3a074e1f11fmr8969627f8f.15.1745831940527;
        Mon, 28 Apr 2025 02:19:00 -0700 (PDT)
Message-ID: <b843908e-2cfb-4797-9be8-f4d2f0463e92@suse.com>
Date: Mon, 28 Apr 2025 11:19:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] x86/vmx: Update DR7 type
To: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, roger.pau@citrix.com, dmukhin@ford.com,
 xen-devel@lists.xenproject.org
References: <20250426072739.39373-1-dmukhin@ford.com>
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
In-Reply-To: <20250426072739.39373-1-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.04.2025 09:27, dmkhn@proton.me wrote:
> From: Denis Mukhin <dmukhin@ford.com>
> 
> Convert the DR7 type to `unsigned int` and fix the accesses where necessary.
> 
> [1] https://lore.kernel.org/xen-devel/0d01646b-83e3-4a02-b365-d149d2664e73@citrix.com/
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



