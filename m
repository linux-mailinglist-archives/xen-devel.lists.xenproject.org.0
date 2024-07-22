Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05F2A938DB2
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2024 12:52:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.761650.1171640 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVqeH-0008UB-4q; Mon, 22 Jul 2024 10:52:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 761650.1171640; Mon, 22 Jul 2024 10:52:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVqeH-0008Rx-28; Mon, 22 Jul 2024 10:52:09 +0000
Received: by outflank-mailman (input) for mailman id 761650;
 Mon, 22 Jul 2024 10:52:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=79tL=OW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sVqeF-0008Rr-IR
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2024 10:52:07 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6f38f376-4818-11ef-8776-851b0ebba9a2;
 Mon, 22 Jul 2024 12:52:05 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a77d85f7fa3so665816466b.0
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jul 2024 03:52:05 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7a3c8bea14sm407648466b.130.2024.07.22.03.52.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jul 2024 03:52:04 -0700 (PDT)
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
X-Inumbo-ID: 6f38f376-4818-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721645525; x=1722250325; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nwz6oyh+p7tLOp3na84SOE6EaLeHyQy7QENeZ6kL6Rg=;
        b=IKDwVDKMLNv+0XD1aYuchtNs1NgLCHvIqfowSsIXeV21VvLEt1HGxQEcZ9DUmgeZkJ
         XmwdZuOypQqPBY0HbDoAO+ilu35QQK3ij1taNY/ynclrYCiZ7MAvrzPdRs3LI7KGIyAw
         2TsxMUMhB406lahAKx7qK6MrL2Wx66iz8ukbUtJ6C6Q4vhbxkbIIGQ3qjUTKDbeBOlHL
         9NlTpXaoiruvmby1y/wBw5eiSuImd6c394+ssVY2O0OioLeaPXzEfzRIXhdNh6f1tGv9
         C14dpcz/SgOvNs6rp7Y8mUVT6ChhEQhgiXWBKLANZ9lDDTmW4NiJLXX3aG5GkA2/Z2mA
         Ha2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721645525; x=1722250325;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nwz6oyh+p7tLOp3na84SOE6EaLeHyQy7QENeZ6kL6Rg=;
        b=E5yWLk0f9dNSEJ7igG0snn+/aVKd06UBPpeLHbPXm7C0WKfJV5hvzlFby1siCqN6DL
         ScXbk1qVn6bR4Y+V1lWXq3E6un1hNW+e6bt4uiYkYJuYFTxahkHhRd3KqNVdnPgmE4uX
         lvnHATW6BjUHcpEIqd8VTIMkGs7Uhk0RVOgy1WI/4jBOOwUeV2DbFGJXpZ52RVodPPIF
         /HBzZzuuSOw1P1u/n2S3MqXr+LtIgeejqHp/W6ampq3VxctxVdGezBR+tuM9DCcQvOrg
         G8JaYA2RoFIJYoJehG9mh2BSuFbAAk6NOyrzM8JmGGRB5w6uI2k0krmLjSRN/fQ045CG
         0bBg==
X-Forwarded-Encrypted: i=1; AJvYcCWZzx+BFe4h2X6d7d/MgN1Alu1HpB4bQjp04BWtkaqzaUTzbwm5e30Y42vIhIXMZewZC+nJ2ljW0WTpf4GD/K8cJXQD3tIGlGzVHMZeqec=
X-Gm-Message-State: AOJu0YwRmZGvFwVUmdUpoQRPNFHgBBUI0GkBx3Ekv8g8T6kYWJR2WbAr
	/6QAh1bnnuXUjNZtP12ongHE/kgPh8ArVI0cAfvGJ/YmuForR4qEQIYFm8BKvQ==
X-Google-Smtp-Source: AGHT+IEHGTf9bJG0s6yJaYzxIFdWkfXN6VHbfjboMu+C4I8Q4FgikoIo2jyXWAOxcXwjl2WWOl/Ebg==
X-Received: by 2002:a17:907:da1:b0:a77:c051:36a9 with SMTP id a640c23a62f3a-a7a41aea01cmr767510166b.9.1721645524960;
        Mon, 22 Jul 2024 03:52:04 -0700 (PDT)
Message-ID: <9420cad5-703d-4236-a2c6-a9c0dae64986@suse.com>
Date: Mon, 22 Jul 2024 12:52:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 3/5] xen/riscv: introduce trap_init()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <cover.1720799487.git.oleksii.kurochko@gmail.com>
 <80c02f1215d74e42fd9bc7f0d6e27d043a11b0e9.1720799487.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <80c02f1215d74e42fd9bc7f0d6e27d043a11b0e9.1720799487.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.07.2024 18:18, Oleksii Kurochko wrote:
> trap_init() wasn't declared with the __init attribute to avoid removing
> __init when multi-CPU support for Xen is added.

When you say "wasn't" one could easily take this as something you're
correcting in the patch being described. Therefore perhaps better
"isn't". Plus, as this isn't really describing the change, but just
a perhaps unexpected aspect thereof, maybe also better start with
something like "Note that ...".

> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

