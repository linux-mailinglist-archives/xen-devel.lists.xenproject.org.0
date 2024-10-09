Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D0CA996EEA
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2024 16:58:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.814738.1228396 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syY8R-0007MI-0n; Wed, 09 Oct 2024 14:57:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 814738.1228396; Wed, 09 Oct 2024 14:57:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syY8Q-0007K9-UE; Wed, 09 Oct 2024 14:57:54 +0000
Received: by outflank-mailman (input) for mailman id 814738;
 Wed, 09 Oct 2024 14:57:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z5PZ=RF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1syY8P-0007K3-4u
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2024 14:57:53 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id db0af296-864e-11ef-99a2-01e77a169b0f;
 Wed, 09 Oct 2024 16:57:51 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5c896b9b3e1so9598393a12.2
 for <xen-devel@lists.xenproject.org>; Wed, 09 Oct 2024 07:57:51 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a994046f466sm584852866b.61.2024.10.09.07.57.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Oct 2024 07:57:50 -0700 (PDT)
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
X-Inumbo-ID: db0af296-864e-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1728485871; x=1729090671; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=NYKbJhG4biobtXvX0h2pUc2QvsxroHNriVtoW4Id+qs=;
        b=TB8RaUG2uqRZ+vdkWScrjs06qhV+jJnCYHJBI++SgbCOEcDNsnxTFESoCHukYN9BYA
         zUUzlV4GP9cp/6G+b+CeemNq7hlUFpeQvl1PfngYJE62Q3J5zl/4JScsRDSDIzLrjLPK
         GhnicHCLk0LzXkhlvIi5RLRq4m5IcwN9wUi1cyHsdQqr+kWBF/DI5HC95Gj7VOplm+PH
         h0EHZBnCHzw0fI2RhRlYDYrmZgFQjeBGu/Cf3axBwHSTOXxh1NKC41BCeIx1RKCS9BV0
         G2YVSplKqamoO7/9NR6luuxIeUSmaP1+wqQkbnF4SLCNo3ReBPgAoKM1Rf0+9lFZkSDt
         P05g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728485871; x=1729090671;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NYKbJhG4biobtXvX0h2pUc2QvsxroHNriVtoW4Id+qs=;
        b=E0jlBIY+9vVw+xjsCubZjdagj7ZCUO3Qy+45mLN6eMh2knbiU51o2lLA7DPnBpLucO
         ZMk9hwBIbPy5Edtbzzep/WndbaUfLZhwVT0COMn4OAEyf560B8WxGRzclVJACtxqCezw
         hTmQCfpfXiITq5Ut708I++T2tcp/5jja6OLScRea6OR3/BEXrMRFz5OQxG2bENhRR/hx
         1WnzzdTBsov86IJpI94mcEDVt07JA2o8wOiccVgG0gj3GXMsFpesLyCmtBtdeZP/ItbO
         xokAVbfA5QReySVaqE/VYsL8XhiXiWMf4aJ6ZUvGWjRC/YLtMOLUgk06jy8evZzQWUUw
         X7+w==
X-Forwarded-Encrypted: i=1; AJvYcCWkAmRzlXEDp349rhG4SkXWVBKZ5DKFLGn05pgDLtQeUme+W0QC5NAUprEBJpOOMVw7GV1U0C6dWLk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxLA41QYRTOsDqO40hhPBJk4kEwSI3pDh5FlinG16jmL/+S/lyU
	5SKM1/Krs2YHuSWUAuQfcMLgMLRxlh1+mH4lAlwfCCj8fC6jTKGfMmCRsleiag==
X-Google-Smtp-Source: AGHT+IFL4wKSRnfmerRMhjMukTrdVerJLX+i6FpYOX+46Cfs3bYxEz84m70X1CCvJ6HEwg4Jyg9Tfg==
X-Received: by 2002:a17:907:d5aa:b0:a77:b01b:f949 with SMTP id a640c23a62f3a-a998d20883amr270485366b.35.1728485870774;
        Wed, 09 Oct 2024 07:57:50 -0700 (PDT)
Message-ID: <9f5e9819-af2b-4de7-91f0-d0b7d35f57ba@suse.com>
Date: Wed, 9 Oct 2024 16:57:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] xen/riscv: implement virt_to_maddr()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <cover.1728472163.git.oleksii.kurochko@gmail.com>
 <9f7d9ebde6fc7224490d1fd565676e051c57a80d.1728472163.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <9f7d9ebde6fc7224490d1fd565676e051c57a80d.1728472163.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09.10.2024 15:45, Oleksii Kurochko wrote:
> Implement the virt_to_maddr() function to convert virtual addresses
> to machine addresses. The function includes checks for valid address
> ranges, specifically the direct mapping region (DIRECTMAP_VIRT_START)
> and the Xen's Linkage (XEN_VIRT_START) region. If the virtual address
> falls outside of these regions, an assertion will trigger.
> To implement this, the phys_offset variable is made accessible
> outside of riscv/mm.c.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



