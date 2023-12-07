Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39602808C08
	for <lists+xen-devel@lfdr.de>; Thu,  7 Dec 2023 16:39:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.650009.1015198 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBGT3-0004xy-Js; Thu, 07 Dec 2023 15:39:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 650009.1015198; Thu, 07 Dec 2023 15:39:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBGT3-0004vs-H2; Thu, 07 Dec 2023 15:39:13 +0000
Received: by outflank-mailman (input) for mailman id 650009;
 Thu, 07 Dec 2023 15:39:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+CYm=HS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rBGT2-0004u3-1h
 for xen-devel@lists.xenproject.org; Thu, 07 Dec 2023 15:39:12 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c3ad1c13-9516-11ee-9b0f-b553b5be7939;
 Thu, 07 Dec 2023 16:39:10 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-40b5155e154so13358305e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 07 Dec 2023 07:39:10 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 g11-20020a05600c310b00b004090798d29csm37973wmo.15.2023.12.07.07.39.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Dec 2023 07:39:09 -0800 (PST)
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
X-Inumbo-ID: c3ad1c13-9516-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1701963549; x=1702568349; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1fN4S+XE+2ZmI4wvGXwI+SQIIXHOdn1f/noK2Ezp/4w=;
        b=cFuX9bdP0pogBQtvnTVVdCetjd71mmghTBJgkxzTuH9teHn2vRdLIiOeL3EowMkuah
         S3iWzeQbGO5QYffzXScgPhiaZ7EyfqkXeKBxakXg8I9zWCdCteQ7Dg5J+LkDUrf0DLwR
         IvwltPxUUUICC8Lh4mBHhxulxsD5sDMoHgUgMBuQ5eOJp0d/CHI767kCh+2cmNJ2jYbe
         GUZ2Tk60lYawtBpe8aCCZXN7I9VFyOKhTjc4GEveFOHjX8jMEBicWB74QmQKBl87mnjU
         rX0TzPR2DK2D3WxQygobKpNpPmk5ejQTRCeznuNC7uhC4qou+88Bf2Z+7Cv25AiRNZQZ
         uGnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701963549; x=1702568349;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1fN4S+XE+2ZmI4wvGXwI+SQIIXHOdn1f/noK2Ezp/4w=;
        b=droJhKxJwEP8dSX/LlZvsxSkJg6Bj1MgqQZ2xQdw0td2K/ZslmVlkG9TBciVv8Kx3m
         /D60doFtzC6ZSEmbeKAPakZr8/ndP2NOlr/vOzPlPm97AJVZZAPz0J1L5g/V7eR0tPNL
         1cxKS/aLBtm0jHipqBuy9C4Tx+qKIvyyNo2AP3rkqRD71gtNRBALdlmiYGea7M4HKE3B
         Kt8FhW4Jf42KJ+gq4KQDOaj3y7zpqCtfwUVaVbbw+A/6O8O7VkXwWxqA8NZc2O0AwO6y
         Srs0Enc1viQPh2gn1a3z0fyAVkqVyKgOmxE5zOh1CYygvCgg+fhNPe+jhPm6/ZvfNxlu
         D+Ew==
X-Gm-Message-State: AOJu0YweI55g8kMtlSwKLFucIjNsm1fzg5JxM2+abErPmPZbCVUXsG6r
	wR3Ea5kJykXnVu4v6Mtxr8Bm
X-Google-Smtp-Source: AGHT+IHeEPWBlcuVY9DuhJgf0xFCUbk/h5bC2ga2o1MQFFvbCucmvTq/t9VIGQjX55tpTeukzaR7KQ==
X-Received: by 2002:a05:600c:3155:b0:40b:4c39:b4b with SMTP id h21-20020a05600c315500b0040b4c390b4bmr1625892wmo.0.1701963549627;
        Thu, 07 Dec 2023 07:39:09 -0800 (PST)
Message-ID: <8fd89180-ecd6-4ef9-bd00-845ebac04c69@suse.com>
Date: Thu, 7 Dec 2023 16:39:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 15/39] xen/riscv: introduce flushtlb.h
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1700761381.git.oleksii.kurochko@gmail.com>
 <12a698e62766be7dfdac23923d7cdcb3b9b2d52e.1700761381.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <12a698e62766be7dfdac23923d7cdcb3b9b2d52e.1700761381.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.11.2023 11:30, Oleksii Kurochko wrote:
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Again, with an SPDX header
Acked-by: Jan Beulich <jbeulich@suse.com>



