Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D9E987E81
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2024 08:37:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.806039.1217336 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1su4al-0000W3-I3; Fri, 27 Sep 2024 06:36:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 806039.1217336; Fri, 27 Sep 2024 06:36:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1su4al-0000TC-F3; Fri, 27 Sep 2024 06:36:39 +0000
Received: by outflank-mailman (input) for mailman id 806039;
 Fri, 27 Sep 2024 06:36:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xuKF=QZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1su4ak-0000QU-9P
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2024 06:36:38 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d850c108-7c9a-11ef-a0ba-8be0dac302b0;
 Fri, 27 Sep 2024 08:36:37 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-37cd26c6dd1so1095448f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 26 Sep 2024 23:36:37 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93c2946cb2sm86704166b.121.2024.09.26.23.36.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Sep 2024 23:36:36 -0700 (PDT)
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
X-Inumbo-ID: d850c108-7c9a-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727418996; x=1728023796; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9TB+PBknjbjnHiH/EBKK2Khsl+ZxuHjlpQNRp+V0WwM=;
        b=blaK5Qcj6JfETYIB+9fLaB7BZfkzORDaveL+THkh5p7Lb9Q4i26s8ahLelm8n/ZFTG
         5wZUmUZ3bi8cPg3y01V01v5EPiWfrgHkT6m9oFmFsd3iodK4uBCdiJ2bva/SBuxXD6CI
         VeG6kLg+yvrLpa4DSXTZ6YauMc9M5QQn2IPg11ut2njLU1OfeHArcfNqHsAOFrAJRq4i
         VfqGNDIy4clbcm/obVYYAyE6ZP45UD6/yLMBliIXZ3aaJvc6woCq8SlyH+uxTzi0fY6G
         fwxGpdJvPWrykBk1b8lvxxSxqiI441AdZ+a8HGZqLip+XY2vlbqH4N0qpuMl8BMzoCYO
         /RAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727418996; x=1728023796;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9TB+PBknjbjnHiH/EBKK2Khsl+ZxuHjlpQNRp+V0WwM=;
        b=XwWjS0cWWRrdvP+hC0weQwFfwoZptaT4anWdX8JvcUyLec38x4cNz64xxoMFgFNGtF
         6+NliCkrJTt9Ce3eY7rW3K3xmalohLQXCvB1ZYNvFBle+PS9qhKtcWBnywizdi/dxEPK
         u1ppl+U2YVPP7hrfTDGAKTjHaUZ0l5QMfwrxSrUEqZrh0cF9g/DcUbI4snY07qWFcaro
         iTHlZk9fxc0NAbwS175+kDvxIec2EhOxuApLoOlwH8kYD6ujtdrpxzO/XFuUaIgEJ2mh
         7MKyLBenBXWslfjp0Mi1gYtPrYsWU+RktexH8MW01Q5as3Hl72BcMnZmXP4mdBXXWSEa
         24Yg==
X-Forwarded-Encrypted: i=1; AJvYcCX41FnsvoYaFUn7jmA4eT7DePYmpcVvkp6tpmcqgl6INkEaZx1rYkBXFrpI6U91nQybAw2PB4ogoy0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxnINuSKsDHMAc9A75C20l+KTZyWqZcALDwhodYtkbUsKxYlrS0
	mAcCUTLA3bHfT4iJiJ7PXNdfpO609N8cew+Jz7jtbYRy7x/nWyz30gOapAe1wQ==
X-Google-Smtp-Source: AGHT+IEz8OqzbgMhFGpuwFPKVM+B+ODWg9g++EZBHG1mkqtkSBFOXIGkQo1MYBIwSAJHKkRBd8qCnQ==
X-Received: by 2002:a5d:5258:0:b0:37c:cc60:2c56 with SMTP id ffacd0b85a97d-37cd5a695a6mr1565932f8f.5.1727418996514;
        Thu, 26 Sep 2024 23:36:36 -0700 (PDT)
Message-ID: <91a080b4-b864-48e7-bb10-cbc8e99c8a30@suse.com>
Date: Fri, 27 Sep 2024 08:36:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/6] xen: introduce SIMPLE_DECL_SECTION
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <cover.1727365854.git.oleksii.kurochko@gmail.com>
 <413dfb16280c3ec541df8775d31902a4b12a64fe.1727365854.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <413dfb16280c3ec541df8775d31902a4b12a64fe.1727365854.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.09.2024 18:54, Oleksii Kurochko wrote:
> Introduce SIMPLE_DECL_SECTION to cover the case when
> an architecture wants to declare a section without specifying
> of load address for the section.
> 
> Update x86/xen.lds.S to use SIMPLE_DECL_SECTION.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



