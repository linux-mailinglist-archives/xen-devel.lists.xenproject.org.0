Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66BB887EA6D
	for <lists+xen-devel@lfdr.de>; Mon, 18 Mar 2024 14:54:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.694724.1083781 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmDRT-0008TC-9W; Mon, 18 Mar 2024 13:54:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 694724.1083781; Mon, 18 Mar 2024 13:54:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmDRT-0008R6-6o; Mon, 18 Mar 2024 13:54:19 +0000
Received: by outflank-mailman (input) for mailman id 694724;
 Mon, 18 Mar 2024 13:54:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=emy9=KY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rmDRS-0008Qw-5w
 for xen-devel@lists.xenproject.org; Mon, 18 Mar 2024 13:54:18 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0302366c-e52f-11ee-afdd-a90da7624cb6;
 Mon, 18 Mar 2024 14:54:17 +0100 (CET)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a46aaf6081fso229286266b.2
 for <xen-devel@lists.xenproject.org>; Mon, 18 Mar 2024 06:54:17 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 l22-20020a1709067d5600b00a469e550472sm3039024ejp.60.2024.03.18.06.54.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Mar 2024 06:54:16 -0700 (PDT)
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
X-Inumbo-ID: 0302366c-e52f-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710770057; x=1711374857; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vdFJzLL7+XxWvJIfFHzS8ECIuG+kQxLH5Hk8uTvzn5E=;
        b=eeXGTYU7LmT4MuzWJRj/SzMifbhgfBtrm+GXTd4DQiNSA9gGtcWOx7VamHSTkOqZ9k
         DIRsqBkNumkKNhPg20EE8l4KrAlAP941DA5NPRWZ07anCVNBRSUupyIG0cbcIoLPNLaP
         H1Y7gWy6Icp8uj1D1iAhvhS+2KuZi3AKb1PMzSXL4Fd4hZdsD08i8iH7dMt+Lqj2urBI
         3nlSSvJVWFZbuBgeJd1YBzcZCq9hKAiEBxvR2TI5eSHsCfFXFBF52QGpaR9zCUMyFu24
         +lcQPA7oHPnS77hd2BZ9Ysp9T9fU0rfDUBRZN9csLnws32/7UuF5R6ZwHORcq/RvjRob
         fvNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710770057; x=1711374857;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vdFJzLL7+XxWvJIfFHzS8ECIuG+kQxLH5Hk8uTvzn5E=;
        b=T1JOs6oupzNz6gynk5gvCP8iMaac1/mOKm54xZ8HLjX9hdl479WYaCNN1JD8Ag/kr0
         FNr3j4InepPudSis4VJZtWbM7hcVM4NfqpSrJrcFyYrgy+khjWZdr8SHHTpd4sPGkMjg
         +eZ5Qj1KRQSS6h3L+IcWI1K/ZO5fgtErTMZ8K9omgM07zA4VPDxYfO+c+9Lkv3ITvFyr
         fLp3kaL27dDqQqN02VXUfpga9TxL0suM7ig2kVZM2bvAAIbvglAvqJlalCV2lqEQ2dLE
         NR3R71ZS1c66xV6KvqssjVdSY3nYBD7by+9wcwUsSn7azVhOth1WV47lmTPb2lxg1dZV
         xd0A==
X-Gm-Message-State: AOJu0YzRlimarooDR0Ov8bi9uXZJp4MpxkIdw4NWGJz68DW/SzHEMLai
	iS8+2x8HTbR8ZWoTEkZ9aIlae8LcEPLfOTvL/drJoTOgoZxlCHotkReflDWd9dx10eUP0XJPzWc
	=
X-Google-Smtp-Source: AGHT+IEZvCP6dQv64Uc05XniwlVkQ962g8rOYRrZf1yU+wZVh9Ui7TfW4Dw7QDIeY9Ni+GuxMFSdKw==
X-Received: by 2002:a17:907:11c7:b0:a45:c027:372 with SMTP id va7-20020a17090711c700b00a45c0270372mr6672048ejb.68.1710770056817;
        Mon, 18 Mar 2024 06:54:16 -0700 (PDT)
Message-ID: <75b51044-50dc-492c-b87d-b0e1a9701696@suse.com>
Date: Mon, 18 Mar 2024 14:54:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] x86: Move SVM features exposed to guest into
 hvm_max_cpu_policy
Content-Language: en-US
To: George Dunlap <george.dunlap@cloud.com>
References: <20240313122454.965566-1-george.dunlap@cloud.com>
 <20240313122454.965566-2-george.dunlap@cloud.com>
Cc: xen-devel@lists.xenproject.org
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
In-Reply-To: <20240313122454.965566-2-george.dunlap@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.03.2024 13:24, George Dunlap wrote:
> Currently (nested) SVM features we're willing to expose to the guest
> are defined in calculate_host_policy, and stored in host_cpu_policy.
> This is the wrong place for this; move it into
> calculate_hvm_max_policy(), and store it in hvm_max_cpu_policy.
> 
> Signed-off-by: George Dunlap <george.dunlap@cloud.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



