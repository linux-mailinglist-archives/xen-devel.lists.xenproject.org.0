Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46CADB3E1F2
	for <lists+xen-devel@lfdr.de>; Mon,  1 Sep 2025 13:45:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1104563.1455592 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ut2yQ-0004tL-2h; Mon, 01 Sep 2025 11:45:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1104563.1455592; Mon, 01 Sep 2025 11:45:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ut2yP-0004rd-Vo; Mon, 01 Sep 2025 11:45:21 +0000
Received: by outflank-mailman (input) for mailman id 1104563;
 Mon, 01 Sep 2025 11:45:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UGQU=3M=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ut2yO-0004r3-MT
 for xen-devel@lists.xenproject.org; Mon, 01 Sep 2025 11:45:20 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 223a24cf-8729-11f0-8dd7-1b34d833f44b;
 Mon, 01 Sep 2025 13:45:18 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-6188b5ae1e8so4297456a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 01 Sep 2025 04:45:18 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61cfc5622f0sm6814288a12.51.2025.09.01.04.45.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Sep 2025 04:45:17 -0700 (PDT)
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
X-Inumbo-ID: 223a24cf-8729-11f0-8dd7-1b34d833f44b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756727118; x=1757331918; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=y0RE+KMoWVJaWXr9LRXrkNGli/wYAY1F5lv9soN2lcM=;
        b=gK+HmZdV2e7XP2C/HCH7K59g1LTTUiSxiq5h0+u+dMe14x2HLzZLNLvceOKmBAz8gB
         okQIZc2Ho/niYUrLgctQse2juFLHCIBcA9mxCbbQdoOPWAZslfemPHbWeYDW1Z9BPwZR
         a2XyCKRwoZ3WQDgMGLFp38qoqacHyIFLe2jkdinyt1LzHID72TrdqQjA0Yszy+9yqpVa
         dJV3yc5v7FBXcSxqqyY5opqP1PZsw+ehLm+HZv2EogQhQpHcfUjHv8QDjSM+0RWpYDE1
         kzQzCglDK1zergzndc4pE7u1woN/52/AiKlDPJyOfbxbfdQNTvrHAmk58ZDfHunIic2k
         g5Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756727118; x=1757331918;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y0RE+KMoWVJaWXr9LRXrkNGli/wYAY1F5lv9soN2lcM=;
        b=dXtx89GMVsTc1fTzbM4L0KqwHHJQ7VxGF6CxlJYzaw4/7V9y8klwxWoVSQ7r4+ZLDW
         8Hlo1RJ6Rv7bJSFK4vdU/dscIcRuxpvPNAoAdK4e2JK5zCbVRFSnWVkAkpMiVpI3BkMa
         SNU6dgvLfzjM2/JQ/xbIBx6fMpbtH/AkYck15dYegN/0S/j+gWgvUXkoN+TSUROMu71t
         6Bo3F+NPwz5eesQFSvOtF+Y2ojz+FhkeQhr4+5VsFlnaGkErcIQ237sN1y3FUR4BY9oM
         210z7AMM7rT8CTIkOf3ta+jnyxn5FfWkcqoBNlBnCye4iFuAQe6IrfBCKBOrtgnCNCAN
         8pFA==
X-Forwarded-Encrypted: i=1; AJvYcCWAudGB4AN/IWHzhGHFKmGNVlLf2qscQUT3Ctzt9bOxLKoj/XYBVxD40IyRq93AIyyTaXgDFPuJ+1w=@lists.xenproject.org
X-Gm-Message-State: AOJu0YygsLAAcX2LHD/BSuXhbVM9pFCZYAa7Le4cTyvXjWiMlpg+U1ZJ
	u1YR3/LarlGHYIDz8raFELHBpZODl302zuFrzRTQGsLLk2NgH5yDZvf2DSOpzX5yLg==
X-Gm-Gg: ASbGnctB8G7+PHaYHwKei2CM0R1ucVi7WC3FsfwWr5TMuUc0Ow66HgC2ilmR8+1zgS3
	DdfArjhezyN/1MEc+y61CxEDG3owm5Mi+8Xyv/tLZeuLNI8BfvD8eVnO7Hme8Mzr+rgDgxVivOL
	PWWXmMJ5wb+qAvzoQmhWHTqlw1vOHIydtlDAukd0eQG685mYcWTT1DhbrN51vsu2Dd8I39s5vXC
	/AgAA8anu6AoPskoD287QOH8TfE0l0ii7i+J1L7bBA7MZGmmWadwaHSjvp/2KY4sL6DNa+2TG8y
	lMEg7/f71c3uvSzW5C6LmskiG6cBWULPlyXWelh61ZSz95oVRt30o2NZ8OPkO7pYl5jvvdeGIPa
	JLufSUPh2iahTgcBirZHZsO8Yh7VLGun6vpjuRbM0VHwJcW32YpKTBmVNIXTBsfMcq7dtFrPkhQ
	41QVEsaEE=
X-Google-Smtp-Source: AGHT+IE6aVeEiyJDq2dQQK8mjNLoz7wuab65QYIPgkYHNrQsj5bhB0TyMNUwP/jPUcO0250SeA/oDg==
X-Received: by 2002:a05:6402:5419:b0:61c:87da:4bff with SMTP id 4fb4d7f45d1cf-61d26d7801dmr6190566a12.26.1756727118066;
        Mon, 01 Sep 2025 04:45:18 -0700 (PDT)
Message-ID: <8d5aa0f0-9c27-4d59-b5c9-02d0b6018bbf@suse.com>
Date: Mon, 1 Sep 2025 13:45:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 17/23] x86/entry: Drop the pre exception table
 infrastructure
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250828150409.901315-1-andrew.cooper3@citrix.com>
 <20250828150409.901315-18-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250828150409.901315-18-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.08.2025 17:04, Andrew Cooper wrote:
> It is no longer used.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


