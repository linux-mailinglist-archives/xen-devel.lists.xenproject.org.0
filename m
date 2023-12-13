Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47A38810D56
	for <lists+xen-devel@lfdr.de>; Wed, 13 Dec 2023 10:27:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.653801.1020384 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDLVh-0005Io-Ub; Wed, 13 Dec 2023 09:26:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 653801.1020384; Wed, 13 Dec 2023 09:26:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDLVh-0005Fc-Qo; Wed, 13 Dec 2023 09:26:33 +0000
Received: by outflank-mailman (input) for mailman id 653801;
 Wed, 13 Dec 2023 09:26:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6bXc=HY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rDLVg-0005FU-82
 for xen-devel@lists.xenproject.org; Wed, 13 Dec 2023 09:26:32 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b271bae2-9999-11ee-9b0f-b553b5be7939;
 Wed, 13 Dec 2023 10:26:30 +0100 (CET)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a1da1017a09so800632866b.3
 for <xen-devel@lists.xenproject.org>; Wed, 13 Dec 2023 01:26:29 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 rg14-20020a1709076b8e00b00a23002c8059sm460429ejc.70.2023.12.13.01.26.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Dec 2023 01:26:29 -0800 (PST)
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
X-Inumbo-ID: b271bae2-9999-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1702459589; x=1703064389; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EpPGbmfjdx5CcvtqTTTTGuyilkzEW3yze8DbIh/Ggs8=;
        b=ZMhop9drjNfy7VJ/PZ9q9m+WBWeNLKyDHCDLATbn0VfzHG/oxsx/PYW09MMTKsfxny
         SLnmDLs2kgZd+pWHqREkVQc34xpJOKYzXJKGj0VAlr73V0if+8GRR/YFDFiywlZixc7r
         QxH/deVmwNHQISHGryoFJBrNa5iKIbffUqE/xPfc9sRT07OmD4EoDDaZ0FQAOYDKd+v0
         Jqph14Y77U3Iy+KVj9jubKAIhteqiKOWAYKzxO0htG8vf/DanUcix4Lc76645cy6obbB
         oNoErJBAnXlaXoElyYgHp2Vqxpo44/taZoiYHfCFsoszOnRl7C9dmnnr6ntiTfZOYi5D
         5U+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702459589; x=1703064389;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EpPGbmfjdx5CcvtqTTTTGuyilkzEW3yze8DbIh/Ggs8=;
        b=SiRc3eAabqsOWn1Sf87Ju0QexWJiZVKF82NioGbf/cMZpDxr/lFz93L0Err+h/ybRT
         O67kebfQF09nvZEbJMN6sZq7hQgcMeO+ejOXuQbTKps41lL/LRmtAGvJERUFWHAkbQ9I
         ybuMgIQK3z/rnxaNV+8DYo1YFcD+capMKtx5UFVVdmN93gtZRNm4ZYtH9N3PJQCHu6h7
         AJ5uZpuJpH0vPixC3z21ffaHPm5SFjWeg87K6RbLJNVtsHMaX8DWZPPMjBomkya1Scek
         JohQrXFLnYnwlCQ+Is6b8OLbDOz3ckKL13DE8UQu62TN/eZo6N7FcHwaDICevgwcu8GY
         N0Ug==
X-Gm-Message-State: AOJu0YzhJqg95cEwIdZEOGaEcGo/yWa8Wl1TxTaytRkBi5XBCdsO4H+c
	PfVk4rDJPTx7vRZyfCSza1Y8
X-Google-Smtp-Source: AGHT+IEWMvSBngU76zYut8gTGXbVOBFWnGV8tfwBqm8aNaAuX1WNXigGOvlf2aNrOZAN2GKCFobeiA==
X-Received: by 2002:a17:906:413:b0:a19:a19b:78bf with SMTP id d19-20020a170906041300b00a19a19b78bfmr3648289eja.130.1702459589435;
        Wed, 13 Dec 2023 01:26:29 -0800 (PST)
Message-ID: <15aaed84-b5e1-4a5b-86fb-9d9cd4eb4e12@suse.com>
Date: Wed, 13 Dec 2023 10:26:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 2/4] x86/asm: address violations of MISRA C:2012 Rule
 8.2
Content-Language: en-US
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: xen-devel@lists.xenproject.org, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1702394721.git.federico.serafini@bugseng.com>
 <0db906df2d3649fc8652be6b80e14870b78b0f56.1702394721.git.federico.serafini@bugseng.com>
 <alpine.DEB.2.22.394.2312121450100.1703076@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2312121450100.1703076@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.12.2023 23:50, Stefano Stabellini wrote:
> On Tue, 12 Dec 2023, Federico Serafini wrote:
>> Add missing parameter names. No functional change.
>>
>> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> 
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Acked-by: Jan Beulich <jbeulich@suse.com>



