Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19E4F951EF2
	for <lists+xen-devel@lfdr.de>; Wed, 14 Aug 2024 17:46:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.777464.1187612 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1seGCQ-00061E-Vt; Wed, 14 Aug 2024 15:46:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 777464.1187612; Wed, 14 Aug 2024 15:46:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1seGCQ-0005y4-TL; Wed, 14 Aug 2024 15:46:10 +0000
Received: by outflank-mailman (input) for mailman id 777464;
 Wed, 14 Aug 2024 15:46:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NhoJ=PN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1seGCP-0005xy-5b
 for xen-devel@lists.xenproject.org; Wed, 14 Aug 2024 15:46:09 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4ee6d501-5a54-11ef-8776-851b0ebba9a2;
 Wed, 14 Aug 2024 17:46:02 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a7a83a968ddso6366166b.0
 for <xen-devel@lists.xenproject.org>; Wed, 14 Aug 2024 08:46:02 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a80f414e3acsm189708166b.172.2024.08.14.08.46.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Aug 2024 08:46:01 -0700 (PDT)
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
X-Inumbo-ID: 4ee6d501-5a54-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1723650361; x=1724255161; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=cBKYeZKyES1ScXVUTtKnzmfhTTDYTTLOrVKImIz6K9E=;
        b=LL/x2E25U0QYJamCpWclU+d7WFzjOqYa6Yn7iIcE5PPFcYwVI5bMoULn6vPQscLfh+
         H0Gdlahmpt95eqH9yHfwoVQZpg/t2FFcXO/bcG/L5BvEDhCE924yT33zYJzkUW6gNBK/
         DvIrxVoD0g4lR3pt+vigmBSqePnryFvmbHql8DkNuWFnur3t3eqW+lzaqJL5ghfBupFz
         2OWdqIzguAj8i23bqR2o5Qq2sJgQviBB3/Yz1Nfz9gZw2qe4KYqOrYSveoe6w1qGwoUe
         UplaC4GuTYoT31cyXs4tyD13XOTT4IulK+4OgpkYQvpoXlw9ymlIww5+0YOQMnFOLE49
         yQiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723650361; x=1724255161;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cBKYeZKyES1ScXVUTtKnzmfhTTDYTTLOrVKImIz6K9E=;
        b=UcUWm8nEdcRnPUgShXAl0mOP0wHtwx5JV7P0tXe+S1WUebzLU9CtBoEqabk4RYr6rb
         Yn73XZPHAfk2ZCxWde4s74T1XSZwlK0Amg5SpOlKTQP9HN+fmeCJWGAnD1XbvLEbbRNp
         SY2Oj1KUXsdvevuI5zMo6Ed/crPYdildt6zc+O/W/kble9vZbhdX4uX/5zMWP4s7CUxd
         1EEKAGdC+8twI4YFFM1AoWDMaWbbbf8IJq0sH+cZ1cju7JtwhXZPEIwkpkZC7n5eQWHB
         YfKbCMSLehE0/V2ORU3t4jJqPoSY0Bi+sYM+J26LZZU9av6qr0HuOkYaiWgD9VDC+YGg
         6v3g==
X-Gm-Message-State: AOJu0YxSSLjSTiaE6meLU2Y+KPRikN3++SqiMlwlSL1zRHEcSYYZor7D
	/A7jmSL4kkIRBAeoohSDGBKg0jhAszFtXoixXPmD+LK+Bh7lQzvraymD8erABHgt9LPkbIPx8gE
	=
X-Google-Smtp-Source: AGHT+IHp7Mxvd6d9LuVkrJRoNRz7X8IgAm4ITrt9uSOWhoAQ/qhemoME9BjxSgty1rlk8FBCZ/PRcQ==
X-Received: by 2002:a17:907:e695:b0:a7b:baea:892c with SMTP id a640c23a62f3a-a8366fefcf6mr215676566b.54.1723650361375;
        Wed, 14 Aug 2024 08:46:01 -0700 (PDT)
Message-ID: <a40bd7ed-c30e-43b6-9005-e02fe1572eb5@suse.com>
Date: Wed, 14 Aug 2024 17:45:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 9/9] x86emul: support AVX10.2 256-bit embedded rounding
 / SAE
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <bcfea345-57c1-43d9-82b3-240b685486cc@suse.com>
 <3a72e8f6-926f-4492-b310-df96f279a2b7@suse.com>
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
In-Reply-To: <3a72e8f6-926f-4492-b310-df96f279a2b7@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.08.2024 10:54, Jan Beulich wrote:
> AVX10.2 (along with APX) assigns new meaning to the bit that previsouly
> distinguished EVEX from the Phi co-processor's MVEX. Therefore
> evex_encoded() now needs to key off of something else: Use the opcode
> mapping field for this, leveraging that map 0 has no assigned opcodes
> (and appears unlikely to gain any).
> 
> Place the check of EVEX.U such that it'll cover all insns. EVEX.b is
> being checked for individual insns as applicable - whenever that's valid
> for (register-only) 512-bit forms, it becomes valid for 256-bit forms as
> well when AVX10.2 is permitted for a guest.

This isn't quite right: For scalar insns EVEX.U needs to be consistently
set[1]. There's no pattern though to easily identify them all, so it'll be
tedious / error prone to add checks in all necessary places.

Jan

[1] That's my expectation at least. The spec lacks the necessary details.
(The exception classes say "EVEX.b encoding #UD conditions not met." Yet
an update to the respective table in the SDM isn't provided.) But in the
absence of a clear statement that the bit would be ignore for scalar
insns, we need to assume that it being wrongly clear would / should cause
#UD.

