Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E73BAED76A
	for <lists+xen-devel@lfdr.de>; Mon, 30 Jun 2025 10:35:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1028941.1402660 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uW9yR-0000SC-CC; Mon, 30 Jun 2025 08:34:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1028941.1402660; Mon, 30 Jun 2025 08:34:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uW9yR-0000Qb-8h; Mon, 30 Jun 2025 08:34:47 +0000
Received: by outflank-mailman (input) for mailman id 1028941;
 Mon, 30 Jun 2025 08:34:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=erj2=ZN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uW9yP-0000QV-R3
 for xen-devel@lists.xenproject.org; Mon, 30 Jun 2025 08:34:45 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 12c126dc-558d-11f0-a312-13f23c93f187;
 Mon, 30 Jun 2025 10:34:44 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3a53359dea5so963557f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 30 Jun 2025 01:34:44 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-315f54270a5sm13350180a91.25.2025.06.30.01.34.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Jun 2025 01:34:43 -0700 (PDT)
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
X-Inumbo-ID: 12c126dc-558d-11f0-a312-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751272484; x=1751877284; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=HI94rqOfU2FBxtCCjds66wSfew/IaygCM0quHK7I2/c=;
        b=gKseVWkNVvlZjejP3knEAicm7yy3zOTGsXPn11+6UEqLwVgI2ePL4xAuk0qtaMbaWX
         HgGZX6vNG8pb2fAJ8dfHx8YJfRI7ZhIzOGPPJ3nQASfX5J2XiCWq6k2o5nCYYgyZtVom
         Be84A3CO6eTrjA1xbqVo0eacG9U3AiA9JRnDvOpkwkZE4svJFCE4VInFy9omYJploGOp
         cbr+Si13van09yI6DaKesU15EI3V0Gf8/29sYdstTqTSm6xtJ9mGbsfBxeqEh+UeDg3y
         u8TqgHqPQfatUlKxgz0AImHBFden0Ud7HlYmFlxT9HzJI1ayUBbB8HhPUhl03hUWR0t/
         1Z1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751272484; x=1751877284;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HI94rqOfU2FBxtCCjds66wSfew/IaygCM0quHK7I2/c=;
        b=u4kRIqsLgnJB25Yfw5dxeAb4+5xXyhGHWf33+UlvI8RTBQBOMBxqFcJIKGcbFZuUVp
         Mum7XR5vFs1P2em1q8zC0R9J2Vi5Qs8k7ozH2RfWuWvzFCLw9JujYYdlY2soh96aTmLZ
         HoxZhu9422/Zz6SGzC0f4trMbI2mePUQFHr8m2pVt+qtkj61XhZ8j+aOd+6i/S2DQ1Sa
         wLX47KXVH0/XmxyO6WW3qglSa/wcXvZFUNBPTXArTSFOXLLZuipr6GP8EjaeuuuR/iYc
         huw0+S2mfhhRCYB8w9G/4Cwen3Zuu4IoSEaksZwtnLXSfHNjRto+YayIuyonsZK4eK0F
         OOeg==
X-Gm-Message-State: AOJu0YwxLZKzy/G2f/fz+64WP43IzCJEtctQ6OAr9Ii2Xp/ic2skc5cV
	LCbwyPKarQ4bsPZRV+YjhSX6eNvg2Jsh5uS8cct0KwocGc0Jxsvp7mSmnfq/7boF51vYnq/iyh5
	n128=
X-Gm-Gg: ASbGncv5RwLujfI8wyXVkqRSCOG1yCHevDvgKy8sYVNTCdSoaWrp7+iO9yIgvuwJDhN
	q0XdolJcHpH6SA4SUjwhckbE3THobdqaPSztFKT314STCTawnNZWO/Id2IOxmPLy5g+cKrCNyos
	96WMU6rQfQ1LRD3ad1RDeK/dNiJ+T1quvYg9u4Ly5nPIHsIrRPaKqNKKi6EgLG/3+lcOfiVaWRt
	B98q6DhgK5E+e+o8foOGJReeRDQuqrZxruXWyn4/cEObQdpoT7wuLK8xiEP8ZNTYRIM2zA5/ohh
	yR0D9r9x5kvH9XYpHSsMI6OsBefLQsJFjVp3MSrlym1WK4wuEXjU3cc8SexF0YACxWdRfDDtPXr
	iTUql/D5MHzx1LDm3Eg799Fqh6vas2iCIbRuBdXDEfNdRRn8=
X-Google-Smtp-Source: AGHT+IFmzFBienQcuGIyTVJTIE3Fpth/nQ3ma1P2ffLxHQatrk4j7mmlutETOgJp/QRXSDPCv4CH+g==
X-Received: by 2002:a05:6000:440d:b0:3a4:f6ba:51da with SMTP id ffacd0b85a97d-3a8fdb29f41mr6746140f8f.15.1751272483694;
        Mon, 30 Jun 2025 01:34:43 -0700 (PDT)
Message-ID: <9a780375-81a5-4b53-ba08-d4d53aa4a58c@suse.com>
Date: Mon, 30 Jun 2025 10:34:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 7/7] mm: allow page scrubbing routine(s) to be arch
 controlled
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>
References: <c5e1e7e0-a295-4028-b003-152b861ee14f@suse.com>
 <0d2b44e3-bf6c-40ae-be4f-d0ad2845e925@suse.com>
Content-Language: en-US
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
In-Reply-To: <0d2b44e3-bf6c-40ae-be4f-d0ad2845e925@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.06.2025 15:02, Jan Beulich wrote:
> --- a/xen/arch/x86/Makefile
> +++ b/xen/arch/x86/Makefile
> @@ -58,6 +58,7 @@ obj-y += pci.o
>  obj-y += physdev.o
>  obj-$(CONFIG_COMPAT) += x86_64/physdev.o
>  obj-$(CONFIG_X86_PSR) += psr.o
> +obj-bin-$(CONFIG_DEBUG) += scrub_page.o

Spotted yet one more oversight: Wants to be scrub-page.o (obviously along with
the source file's name also changed).

Jan

