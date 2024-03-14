Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E9B587C0EC
	for <lists+xen-devel@lfdr.de>; Thu, 14 Mar 2024 17:06:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.693360.1081337 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rknaX-0003m6-Vf; Thu, 14 Mar 2024 16:05:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 693360.1081337; Thu, 14 Mar 2024 16:05:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rknaX-0003lS-Qq; Thu, 14 Mar 2024 16:05:49 +0000
Received: by outflank-mailman (input) for mailman id 693360;
 Thu, 14 Mar 2024 16:05:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=n3nm=KU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rknaX-0003lG-4Y
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2024 16:05:49 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b8c8af66-e21c-11ee-afdd-a90da7624cb6;
 Thu, 14 Mar 2024 17:05:48 +0100 (CET)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a45606c8444so131431866b.3
 for <xen-devel@lists.xenproject.org>; Thu, 14 Mar 2024 09:05:48 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 h21-20020a17090619d500b00a46447348e8sm827048ejd.191.2024.03.14.09.05.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Mar 2024 09:05:47 -0700 (PDT)
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
X-Inumbo-ID: b8c8af66-e21c-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710432348; x=1711037148; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lDFQUkvNMfU2vCunQ8k56Z3/CNehReAEK/vThUwXMAg=;
        b=e6zQqz/gBf8AT1FW3wmq1dzmbNwodjAfx9FzosdAG046JK67tzBoQZh48QRjiQoFS+
         LWLBe37ll+g2pgyXKPGkJFypx1wLhmjpXBtlXBNulUOBpHPr8WlOzPP8pENUOpZ7TpO+
         hxDKH/jF4NtFi12uB/GZgG+4omWHWXSs9Z6/UlscLhzdqP1SHUFd0n4CVI0R0ta1VZeQ
         Kk2uGN5zo7l477BzaxY9GxUSDhfSXy4O3UD0W5oRQnPBdQrmA4SKBOVztsTKpPUIKsP4
         XmYS99mKK9ZK57yx+Tt5B3UA9KpbhJPa6LPvLguo1yPTWSWmN/YP2DktrEYuMywfoV8Z
         PGlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710432348; x=1711037148;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lDFQUkvNMfU2vCunQ8k56Z3/CNehReAEK/vThUwXMAg=;
        b=L8bCIJCrQGdN/Yyt3tIn2QLyIrb56NMIBJWYy0hWXys3KP2iP4dIwDKXdAqIfsTjTa
         dYdu+orulKof7/ebDnn00M6eNZC3+5l7htBFeWx7j3kpEg2348FBtnuYjB8PH9Wax/rs
         fqHesl+1FvHag5Pl6BgjyiJFQjqTRfFblKZu025Ees1VQDkbuAOr0+SsI7aJtRzeWhUV
         6FIu/RtRqHvXVv+dWjbrXh5Kurh0DLWZuDyarnvh9ze0RdHnkLp9/QLQOId2EmwV1UAK
         bJaq2rYuTPzq7dMMoPl4ZdLWDd7i0y/+CP9D9yOtQ46coQNR23BC/SlXQ3pJA2H/R+Vg
         3g8A==
X-Forwarded-Encrypted: i=1; AJvYcCWuJLRFhoqfjOW1vxfjdBHBNeGGCk2Mnn/wrVCc1r6MUOzR3c9EiT+sPJw/XnWGwcx2FTgow5+c+IviBoSl3+rXzG7EroYGVd9z3TNtV9s=
X-Gm-Message-State: AOJu0YzPUjqoJZnI6E9ih5exsaEFAOOYyVLYMpxMHJe1ZWvtKMytec8v
	OFwbxfXEclTzDmj8TgtQ4BXNgx3BGMvKA3Io27Hrs9n+pWLzux3kiSbTOFIJvNUorpM6PhZwjUE
	=
X-Google-Smtp-Source: AGHT+IGO6570hR7uaewWamPznXEZ5N6T/BSsXWUZmv/LNoZlsU1c95gwD2Qk2xSNBUGnr/s3wj0XPQ==
X-Received: by 2002:a17:906:ba84:b0:a46:74d2:a0c3 with SMTP id cu4-20020a170906ba8400b00a4674d2a0c3mr1644715ejd.4.1710432347990;
        Thu, 14 Mar 2024 09:05:47 -0700 (PDT)
Message-ID: <8b844971-4266-474e-b1d5-6ee40b64664e@suse.com>
Date: Thu, 14 Mar 2024 17:05:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] x86/svmdebug: Print np, sev and sev_es vmcb bits
Content-Language: en-US
To: Vaishali Thakkar <vaishali.thakkar@vates.tech>
Cc: andrew.cooper3@citrix.com, roger.pau@citrix.com, wl@xen.org,
 xen-devel@lists.xenproject.org
References: <cover.1710347950.git.vaishali.thakkar@vates.tech>
 <f71fc11c1411f17a3570e3f8c8c088c1276b8552.1710347950.git.vaishali.thakkar@vates.tech>
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
In-Reply-To: <f71fc11c1411f17a3570e3f8c8c088c1276b8552.1710347950.git.vaishali.thakkar@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.03.2024 17:41, Vaishali Thakkar wrote:
> Currently only raw _np_ctrl is being printed. It can
> be informational to know about which particular bits
> are enabled. So, this commit adds the bit-by-bit decode
> for np, sev and sev_es bits.
> 
> Note that while, only np is enabled in certain scenarios
> at the moment, work for enabling sev and sev_es is in
> progress. And it'll be useful to have this information as
> part of svmdebug.
> 
> Signed-off-by: Vaishali Thakkar <vaishali.thakkar@vates.tech>

Acked-by: Jan Beulich <jbeulich@suse.com>



