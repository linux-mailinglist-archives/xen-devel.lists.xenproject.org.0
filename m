Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A01ABA6887E
	for <lists+xen-devel@lfdr.de>; Wed, 19 Mar 2025 10:45:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.920160.1324408 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tupzf-0000lx-Kn; Wed, 19 Mar 2025 09:45:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 920160.1324408; Wed, 19 Mar 2025 09:45:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tupzf-0000jE-ID; Wed, 19 Mar 2025 09:45:47 +0000
Received: by outflank-mailman (input) for mailman id 920160;
 Wed, 19 Mar 2025 09:45:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bBEQ=WG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tupze-0000j8-4b
 for xen-devel@lists.xenproject.org; Wed, 19 Mar 2025 09:45:46 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ed75085c-04a6-11f0-9abc-95dc52dad729;
 Wed, 19 Mar 2025 10:45:45 +0100 (CET)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-39133f709f5so4062946f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 19 Mar 2025 02:45:44 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395c83b6a5esm20150701f8f.27.2025.03.19.02.45.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Mar 2025 02:45:43 -0700 (PDT)
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
X-Inumbo-ID: ed75085c-04a6-11f0-9abc-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742377544; x=1742982344; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5Qp5aAcW45C8er8t3oU0lY8OXH3+F/cQVC96xD1rk/0=;
        b=N4LdZ9QvGgaFFaSnfY6GI61Oje9B126lqDqqbEnUAdtRRlyM0pqN0BKR6QYBX5YCcX
         q3t/l79QykzioHWJCRcDkoR/ght+ChzpsKjB3fXxQ+fyiOEQ+nS7yuPexjRzqgpk6jLk
         H5tuZ8up1lgiatw3fpP6A8+6iauSN9IDkGREl5KO5/g7zWSkPcT0VFp1AGiGMSTen9Yz
         A0jEqudX6DF8GQHw/8X3QRwmV9LfoQG6LGgz96X9coVW5AGTItOwHyCwAvf07uxstAB0
         AKVuKGz/YfckfEL6Wy+Oxf4pXHI068MvCsyyLEDNq14r524m2pyFOWtiTl4xfzwmLEgR
         RJFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742377544; x=1742982344;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Qp5aAcW45C8er8t3oU0lY8OXH3+F/cQVC96xD1rk/0=;
        b=pu3C+Jx7KBjahxpywlPNKF335oEq5LihGMk9iXMeg786WZtnypF/ZgJnwZZlhKiEt2
         jRNTNR/W5Ta37aICPvKB+nVHw4LM2rjgkP+9n791o/nZxwWfycqPAsGZJfYhWCcN3UOP
         2U7Xo+Ixg7bzOATUaqcgPtq3YdRH0W+ywMOe6ClWMnw9CgidijRk2dZggvmLuiyzXzmF
         OdyL0rm7KxXEKnLolyKAG0SA1FiLhjIFGtYbUSj7VcZWsISpTkXYNsXVi/Te9mS0tO1q
         14vDpfIsSdw4LL7BXyhyfOcuxkJA9VL02n+BkcHfBszc4l99tviygIIF922fhbe6F0G2
         V6dw==
X-Forwarded-Encrypted: i=1; AJvYcCV61T+SJz44l4NdMI6xhp+aNjBTQXcIYJMyUfq7YL2DhCmDjyL3yc5G+tINwmOxtLgDjdyyTsxE+OU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YylJ8hODgDsiTlFTy66lXehgYD0Jmsui+7BG4sv2ObnTeSNp/zV
	QP/mUQ6gUoL7p8XLOXy+UdXWU1Lia0I7RtxUOAQ8sS1L3Dty81U+CRvdc3axdg==
X-Gm-Gg: ASbGncuJPbc0aCgW10zqv4NvXCPMIq/6Wq+94R4yl1zZvY56uQq7G871kC5x80y+0yD
	ZLVC6H5WkyGNUCv2cqohCqEo7R66MFrSvGdd7WkhTvfFqivBEvbMVXpfQKZ5vSbe72WI+8f8uNC
	safhwPNPl8SHZHs9yOjB+oKtw7gxvHbtdeMBg7LfTb92HNNX0kt1CYT9coHv3uf/cCQlsfXUwdD
	hPO8Whsr4yzGNxcOy2Lk4wMqzV2OBC691990tVybV5TA0kIfkN/ePFagHMYJobXxU91SnhinT9i
	AMiTaoELcWyAFzZ11c2DSPgA6ClTCpCRLAEtwS2/lBU7B8WgmF3nPxcDFRKi1lQ0IQOiKeFxROd
	JJhGKIikZ/ntjvNJ2nq9iqbWZDPaa1g==
X-Google-Smtp-Source: AGHT+IHVHkzyeLEpjSdQk2FUqi2A2N6eT4pdpoSGpxsSahm4/AZUlCvt9FPjygm0U6aamCjrKSOHVg==
X-Received: by 2002:a5d:6d8e:0:b0:391:3998:2660 with SMTP id ffacd0b85a97d-399739b5714mr1142079f8f.7.1742377543956;
        Wed, 19 Mar 2025 02:45:43 -0700 (PDT)
Message-ID: <68f1aa06-4e00-4b53-9c99-4097c1b80529@suse.com>
Date: Wed, 19 Mar 2025 10:45:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/8] xen/console: fix trailing whitespaces
To: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 dmukhin@ford.com, xen-devel@lists.xenproject.org
References: <20250318233617.849903-1-dmukhin@ford.com>
 <20250318233617.849903-2-dmukhin@ford.com>
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
In-Reply-To: <20250318233617.849903-2-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19.03.2025 00:36, dmkhn@proton.me wrote:
> Remove trailing whitespaces in the console driver.
> 
> No functional change.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



