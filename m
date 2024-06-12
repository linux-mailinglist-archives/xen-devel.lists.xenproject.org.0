Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 532B090536E
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jun 2024 15:16:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.739319.1146317 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHNos-0008FX-NZ; Wed, 12 Jun 2024 13:15:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 739319.1146317; Wed, 12 Jun 2024 13:15:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHNos-0008DQ-KI; Wed, 12 Jun 2024 13:15:18 +0000
Received: by outflank-mailman (input) for mailman id 739319;
 Wed, 12 Jun 2024 13:15:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=h1N0=NO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sHNor-0008DK-Cv
 for xen-devel@lists.xenproject.org; Wed, 12 Jun 2024 13:15:17 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ce486d43-28bd-11ef-b4bb-af5377834399;
 Wed, 12 Jun 2024 15:15:14 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a6f09b457fdso390477466b.2
 for <xen-devel@lists.xenproject.org>; Wed, 12 Jun 2024 06:15:14 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57cb3a9f972sm134302a12.93.2024.06.12.06.15.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jun 2024 06:15:13 -0700 (PDT)
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
X-Inumbo-ID: ce486d43-28bd-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718198114; x=1718802914; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Cdxu6LAZNNFM3u5h7DZ9HSxzF/+Mj8nmFDxYxnGhnzE=;
        b=dzORleSGZClfaIzyC68G4GHwtaIKwMm5STMBoUTUBkY7zJoOfjSWL2OcDLnYqUAdU1
         N0bgho5qxk7XljUJodiBgX1zyfPQxGW+LTaFqGZkd/zl7qjo2j5ftcKWdANvvWbuoT+m
         9OGUcKg3ZN1yCuqitLuhhZDTHn5q0YNIdplLsYR2q137TxVCF5KnB2PO3awk6yshVatu
         Q1vCK4pbsvH+KA/+smDI9RGFfv4X78uW/770K2ic6XOwhr6ZZ4EB8gkEe7dTXxSrSyY0
         3dunLi1MOvDmcc2iSxJBUB5626x5HtgOKoboXDxhhoPowXzfqVkjejslRuzGooIbjjI+
         O+uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718198114; x=1718802914;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Cdxu6LAZNNFM3u5h7DZ9HSxzF/+Mj8nmFDxYxnGhnzE=;
        b=Eb1OZx4oPTuMHFhjjPW50xDNBkQxsDobd6GBOkkzJMpzorp/Uub1+GQWjg+NvbnFF1
         uU8gOF/ZuquxLksRig1GPrdmy720qsi1GND2hHLpMAp7B/OAP6E/uVrQ38Ps+YD7099R
         hlMWg6+WJB70chaNQnsdlMQzMcMF7QF2dNyfLFtaNn0ec+C0ng7DzZQyKodvyIQwUijI
         v7ik4llepLqj4/HDx5LLH0exHYOUbGAaZHAlY/48TSSUzK0pTEMH5VV8enpvsopKTMG3
         lCCFDbrBAacBNe0tzbe1jmmBTIoPCu+YxvmE6bvfrEMwdQiwDsQe29PrxFkQnIieXOKf
         jiIA==
X-Gm-Message-State: AOJu0YxkTfgHd1s7D7txO61m23bejyzJELEfrsUhMDJZi6GnYm8/fdHh
	zIYqROH3QhQSQMHaUYF2hLNkUgRYOCE8eRx/KMiCs//e2Aid4/Osok5bCaZzfVKDOCQhH6HpJXo
	=
X-Google-Smtp-Source: AGHT+IFG6nY0bSo5ZRD5zWBWypsgCR56fl7pSBYXY4IDEYzSIq6V34OGLJhZMhoP2VDWnqm4KEui5g==
X-Received: by 2002:a17:906:f190:b0:a68:e335:3e62 with SMTP id a640c23a62f3a-a6f480268admr106902766b.72.1718198114181;
        Wed, 12 Jun 2024 06:15:14 -0700 (PDT)
Message-ID: <2936ffad-5395-45fd-877f-7fb2ca8b9dc8@suse.com>
Date: Wed, 12 Jun 2024 15:15:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2 for-4.19 0/3] x86/EPT: avoid undue forcing of MMIO accesses
 to UC
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

..., getting in the way of, in particular, PVH Dom0 accessing its video
frame buffer (if it has a console).

While especially the 1st one may not appear to be so, both of the earlier
patches are strictly prereqs to the last one.

1: correct special page checking in epte_get_entry_emt()
2: avoid marking non-present entries for re-configuring
3: drop questionable mfn_valid() from epte_get_entry_emt()

Jan

