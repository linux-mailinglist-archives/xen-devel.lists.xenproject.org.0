Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A88549E98DF
	for <lists+xen-devel@lfdr.de>; Mon,  9 Dec 2024 15:30:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.851428.1265501 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tKelj-0000sc-Gf; Mon, 09 Dec 2024 14:29:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 851428.1265501; Mon, 09 Dec 2024 14:29:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tKelj-0000q6-Dx; Mon, 09 Dec 2024 14:29:51 +0000
Received: by outflank-mailman (input) for mailman id 851428;
 Mon, 09 Dec 2024 14:29:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oUxd=TC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tKeli-0000q0-6s
 for xen-devel@lists.xenproject.org; Mon, 09 Dec 2024 14:29:50 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0ae59508-b63a-11ef-99a3-01e77a169b0f;
 Mon, 09 Dec 2024 15:29:48 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-434f80457a4so5982085e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 09 Dec 2024 06:29:48 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-725e71ce821sm2733662b3a.183.2024.12.09.06.29.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Dec 2024 06:29:47 -0800 (PST)
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
X-Inumbo-ID: 0ae59508-b63a-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733754588; x=1734359388; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2MlTmTWDs6VrTPaxU79Si5fl1PwiSEPiVUomIzVJ6dA=;
        b=arZcyP06aLx3X2l+nmWhc+W0VdPxxk5hK1xDQsNN0RPJjg6YEEx1KBq2UfsyWdp/zE
         JNgrYH7RfsiIjy77UO/Xb0qiu77CKiI4gzqR6M5j4Lht3rJ/G0axdl0vtBNnJOOkst8u
         qN6f8Pjz/G+/MCTaAHM7Z58qcGV67l8wTYkUT4QS4LYNj86IOKRK2ySJB3mbUxM1lj5O
         pi2CuNPpGuWRU72BpuFWottUF6Berp8MVwq82+7B60LHoiT2kC31SGDxIeFbOyoyMwYB
         DAQD0w9w7t0tbDO82gFy0zZZoLuQEJR712+SKPB1wrK2VhbSmH5QpTZduaKUSW2dI39h
         gNgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733754588; x=1734359388;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2MlTmTWDs6VrTPaxU79Si5fl1PwiSEPiVUomIzVJ6dA=;
        b=FMBEZwqpombwL2vubpjFp9ds465M6ElLvri4jMadr1jc2en51hZRxrHrScTGHBHunJ
         9yH3WGxqFe1FKRp4mtaAXWD/f2RJ+90rKLHxezKnYuNexjCnlDjc39ENFPflCyAmYg24
         xa1FKmls78F397aoRJt6P5Kb/XmU4Xz7xRnRN6vG3Ku6t3kCJttHh2ZyJiQrCDqYKzZv
         06M+5GDqWcZRqvOP1HMzbDyL5tYdIQ/kJpWiugEGhZd9Md7NC3FYAQSU/ztqrp1fowh6
         kdS1vD3UQbyw8G4OyBBzVl7aH86RNQZMHeO8jS7wODomb3ZllbAQVaJI1WsAcRF5hh3h
         dIXQ==
X-Forwarded-Encrypted: i=1; AJvYcCVy73kihom7GzuxDtk3WNvtCZVnXbUFU4cztvu7QsTfwlewJljQ5RbCt51enMxv/g/eJ86FWRtnh+g=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwTegRV0//J9YvnHuVpo5fWBemcMXER5f/5ejvDWTwIocxr/qgX
	JK29k3fP0qdqBlrgJDO/+gRdNckNs/8QH0tqlaRkYduHspaPC3Ank0xu8RKw0A==
X-Gm-Gg: ASbGncuvyWQrqrrZgGSTaoeSg3/y9MqO/SivcyI3+pMFf9h79jrsLhee6TLv/IaIqfc
	rv8iqRhOU5H+FKT+4pKJW7HgxADsVUZizW1OXKDkiHBsUmXSvXLUzZlzVSOwvsQ3B6fIoyAeCpA
	GDbb3sDz5ZJ/dfi0xmS6Dk6VPsxJ5zBoT5fW066TEIbXfk7RuntTQFYxe5uEDHKYHeXz2zFlOF8
	ECH7JoEBaX/vLL2svZRb8IBNaxYlhR+mwty9RTIhFW9uEHxCVLnAqqJpme2eaVD937YBrT39DyH
	7cTf2PlIrLyzKBl1y/0ull8xMbhNH4SZuXY=
X-Google-Smtp-Source: AGHT+IGHTi5buNiVzOsovjRQgHKW1h3uDsUJdrOb9jadqUV7h7t0DcDXO5e91rh6NdChrlKyfrEE7g==
X-Received: by 2002:a5d:5889:0:b0:386:3d33:a61a with SMTP id ffacd0b85a97d-3863d33a7d8mr3233896f8f.27.1733754587729;
        Mon, 09 Dec 2024 06:29:47 -0800 (PST)
Message-ID: <ba0280ef-c0a1-4521-b08c-a10098c8aaa0@suse.com>
Date: Mon, 9 Dec 2024 15:29:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/6] xen/riscv: add {set,clear}_fixmap() functions for
 managing fixmap entries
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <cover.1732709650.git.oleksii.kurochko@gmail.com>
 <2badea2de39b7614d38a620d1b718478de1fc82c.1732709650.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <2badea2de39b7614d38a620d1b718478de1fc82c.1732709650.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27.11.2024 13:50, Oleksii Kurochko wrote:
> Introduce set_fixmap() and clear_fixmap() functions to manage mappings
> in the fixmap region. The set_fixmap() function maps a 4k page ( as only L0
> is expected to be updated; look at setup_fixmap_mappings() ) at a specified
> fixmap entry using map_pages_to_xen(), while clear_fixmap() removes the
> mapping from a fixmap entry by calling destroy_xen_mappings().
> 
> Both functions ensure that the operations succeed by asserting that their
> respective calls (map_pages_to_xen() and destroy_xen_mappings()) return 0.
> A `BUG_ON` check is used to trigger a failure if any issues occur during
> the mapping or unmapping process.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

However, ...

> @@ -433,3 +434,21 @@ int __init populate_pt_range(unsigned long virt, unsigned long nr_mfns)
>  {
>      return pt_update(virt, INVALID_MFN, nr_mfns, PTE_POPULATE);
>  }
> +
> +/* Map a 4k page in a fixmap entry */
> +void set_fixmap(unsigned int map, mfn_t mfn, unsigned int flags)
> +{
> +    int res;
> +
> +    res = map_pages_to_xen(FIXMAP_ADDR(map), mfn, 1, flags | PTE_SMALL);
> +    BUG_ON(res != 0);
> +}

... imo in such cases it is preferable to go without a local variable:

    if ( map_pages_to_xen(FIXMAP_ADDR(map), mfn, 1, flags | PTE_SMALL) != 0 )
        BUG();

Just to double check: Iirc this BUG would in particular trigger when trying
to set a fixmap slot that was already set, and not intermediately cleared?

Jan

